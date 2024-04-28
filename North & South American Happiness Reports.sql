/*
Analysis of World Happiness Reports from 2013 and 2023:
We are analyzing data from the Gallup World Poll Happiness Reports spanning from 2013 to 2023 to gain insights into the happiness trends of North and South American countries. The happiness index, represented by the Ladder Score ranging from 0 to 10 (with 0 being the unhappiest and 10 being the happiest), provides a measure of subjective well-being and life satisfaction.

The objective of this analysis is to identify the countries in North and South America that have shown improvements or declines in their happiness index from 2013 to 2023. By querying the data and comparing the Ladder Scores over the years, we can pinpoint the countries that have experienced significant changes in happiness levels during this period.
*/


 -- EXCRATING THE LIST OF LATIN AMERICAN AND NORTH AMERICAN COUNTRIES IN 2013 BASED ON THEIR NUMBERED REGIONS
SELECT Country, Region
FROM [World Happiness Report 2013]
WHERE Region IN( 7, 6)
ORDER BY Country 

-- LIST OF ALL THE COUNTRIES IN NORTH AND SOUTH AMERICA WITH HIGHEST - LOWEST HAPPINESS RANKING IN 2013
  SELECT Country, Ladder
FROM [World Happiness Report 2013]
WHERE Country IN (
    'Argentina', 'Bolivia', 'Brazil', 'Canada', 'Chile', 'Colombia', 'Costa Rica', 'Dominican Republic',
    'Ecuador', 'El Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama',
    'Paraguay', 'Peru', 'Suriname', 'Trinidad and Tobago', 'United States', 'Uruguay', 'Venezuela'
)
ORDER BY Ladder DESC

-- THE LADDER RANKING FOR 2023 WHERE I ADD THE STANDARD ERROR SCORE TO COMPARE THE HIGHEST POSSIBLE HAPPINESS SCORE IN 2023
SELECT Country_name, Ladder_score + Standard_error_of_ladder_score AS Higher_ladder_score
FROM [World Happiness Report 2023]
WHERE Country_name IN (
    'Argentina', 'Bolivia', 'Brazil', 'Canada', 'Chile', 'Colombia', 'Costa Rica', 'Dominican Republic',
    'Ecuador', 'El Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama',
    'Paraguay', 'Peru', 'Suriname', 'Trinidad and Tobago', 'United States', 'Uruguay', 'Venezuela'
)
ORDER BY Ladder_score DESC

-- JOIN TO SEE SIDE BY SIDE THE LADDER SCORE FROM 2013 AND 2023
SELECT a.Country, a.Ladder AS Ladder_Score_2013, b.Ladder_score + b.Standard_error_of_ladder_score AS Ladder_Score_2023
FROM [World Happiness Report 2013] AS a
JOIN [World Happiness Report 2023] AS b
ON a.Country = b.Country_name
WHERE a.Country IN (
    'Argentina', 'Bolivia', 'Brazil', 'Canada', 'Chile', 'Colombia', 'Costa Rica', 'Dominican Republic',
    'Ecuador', 'El Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama',
    'Paraguay', 'Peru', 'Suriname', 'Trinidad and Tobago', 'United States', 'Uruguay', 'Venezuela'
)
ORDER BY Ladder_Score_2013 DESC

-- THIS QUERY SHOWS THAT 14/21 COUNTRIES LOWERED THEIR HAPPINESS SCORE BETWEEN 2013 & 2023
SELECT  COUNT(*) AS Count_2013_GreaterThan_2023
FROM (
    SELECT a.Country, a.Ladder AS Ladder_Score_2013, b.Ladder_score AS Ladder_Score_2023
    FROM [World Happiness Report 2013] AS a
    JOIN [World Happiness Report 2023] AS b
    ON a.Country = b.Country_name
    WHERE a.Country IN (
        'Argentina', 'Bolivia', 'Brazil', 'Canada', 'Chile', 'Colombia', 'Costa Rica', 'Dominican Republic',
        'Ecuador', 'El Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama',
        'Paraguay', 'Peru', 'Suriname', 'Trinidad and Tobago', 'United States', 'Uruguay', 'Venezuela'
    )
) AS Joined_Data
WHERE Ladder_Score_2013 > Ladder_Score_2023
;

-- LIST OF THE 7 COUNTRIES THAT HAVE IMPORVED THEIR HAPPINESS SCORE BETWEEN 2013 & 2023	
SELECT a.Country
FROM [World Happiness Report 2013] AS a
JOIN [World Happiness Report 2023] AS b
ON a.Country = b.Country_name
WHERE a.Country IN (
    'Argentina', 'Bolivia', 'Brazil', 'Canada', 'Chile', 'Colombia', 'Costa Rica', 'Dominican Republic',
    'Ecuador', 'El Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama',
    'Paraguay', 'Peru', 'Suriname', 'Trinidad and Tobago', 'United States', 'Uruguay', 'Venezuela'
)
AND a.Ladder < b.Ladder_score;

-- COUNTRY WITH SHARPEST DECLINE IN HAPPINESS
SELECT TOP 1 a.Country, a.Ladder AS Ladder_Score_2013, b.Ladder_score AS Ladder_Score_2023,
b.Ladder_score - a.Ladder AS Ladder_Score_Increase
    FROM [World Happiness Report 2013] AS a
    JOIN [World Happiness Report 2023] AS b
    ON a.Country = b.Country_name
	WHERE a.Country IN (
    'Argentina', 'Bolivia', 'Brazil', 'Canada', 'Chile', 'Colombia', 'Costa Rica', 'Dominican Republic',
    'Ecuador', 'El Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama',
    'Paraguay', 'Peru', 'Suriname', 'Trinidad and Tobago', 'United States', 'Uruguay', 'Venezuela'
)
	ORDER BY Ladder_Score_Increase

-- COUNTRY WITH HIGHEST INCREASE IN HAPPINESS
	SELECT TOP 1 a.Country, a.Ladder AS Ladder_Score_2013, b.Ladder_score AS Ladder_Score_2023,
b.Ladder_score - a.Ladder AS Ladder_Score_Increase
    FROM [World Happiness Report 2013] AS a
    JOIN [World Happiness Report 2023] AS b
    ON a.Country = b.Country_name
	WHERE a.Country IN (
    'Argentina', 'Bolivia', 'Brazil', 'Canada', 'Chile', 'Colombia', 'Costa Rica', 'Dominican Republic',
    'Ecuador', 'El Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama',
    'Paraguay', 'Peru', 'Suriname', 'Trinidad and Tobago', 'United States', 'Uruguay', 'Venezuela'
)
	ORDER BY Ladder_Score_Increase DESC


/*
Improved Happiness Scores (2013-2023):
The following countries demonstrated an improvement in their happiness scores over the decade:
- Dominican Republic
- El Salvador
- Guatemala
- Honduras
- Jamaica
- Nicaragua
- Uruguay

Declined Happiness Scores (2013-2023):
Conversely, the following countries experienced a decline in their happiness scores within the same period:
- Argentina
- Bolivia
- Brazil
- Canada
- Chile
- Colombia
- Costa Rica
- Ecuador
- Mexico
- Panama
- Paraguay
- Peru
- United States
- Venezuela

Noteworthy:
Honduras exhibited the most significant increase in happiness, showcasing positive trends in well-being.
On the other hand, Venezuela experienced the sharpest decline in happiness, indicating challenges or shifts in life satisfaction over the decade.

This analysis sheds light on the varying happiness trends across North and South American countries, highlighting both improvements and downfalls that may be of interest for further research and policy considerations.
*/


