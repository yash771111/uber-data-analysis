-- ============================================
-- 🚖 Uber Data Analysis Project (SQL)
-- Author: Yash Dalvi
-- ============================================

-- 📌 Database Setup
CREATE DATABASE uber;
USE uber;

-- 📊 Basic Data Check
SELECT * FROM uber;
SELECT COUNT(*) AS total_records FROM uber;

-- ============================================
-- 📊 Data Analysis Queries
-- ============================================

-- 1️⃣ Retrieve all successful bookings
CREATE VIEW successful_bookings AS
SELECT *
FROM uber
WHERE booking_status = 'success';

SELECT * FROM successful_bookings;

-- ============================================

-- 2️⃣ Average ride distance for each vehicle type
CREATE VIEW avg_ride_distance_by_vehicle AS
SELECT vehicle_type, AVG(ride_distance) AS avg_distance
FROM uber
GROUP BY vehicle_type;

SELECT * FROM avg_ride_distance_by_vehicle;

-- ============================================

-- 3️⃣ Total number of cancelled rides by customers
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled
FROM uber
WHERE cancelled_rides_by_customer = 'Yes';

SELECT * FROM cancelled_rides_by_customers;

-- ============================================

-- 4️⃣ Top 5 customers with highest bookings
SELECT customer_id, COUNT(booking_id) AS total_rides
FROM uber
WHERE booking_status = 'success'
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- ============================================

-- 5️⃣ Rides cancelled by drivers (personal/car issues)
SELECT COUNT(*) AS driver_cancelled_rides
FROM uber
WHERE reason_for_cancelling_by_driver = 'Personal & Car related issues';

-- ============================================

-- 6️⃣ Max & Min driver ratings for Prime Sedan
SELECT 
    MAX(driver_ratings) AS max_rating,
    MIN(driver_ratings) AS min_rating
FROM uber
WHERE vehicle_type = 'Prime Sedan';

-- ============================================

-- 7️⃣ Average customer rating per vehicle type
SELECT vehicle_type, AVG(customer_rating) AS avg_customer_rating
FROM uber
GROUP BY vehicle_type;

-- ============================================

-- 8️⃣ Total booking value of successful rides
SELECT SUM(booking_value) AS total_revenue
FROM uber
WHERE booking_status = 'success';

-- ============================================

-- 9️⃣ Incomplete rides with reason
SELECT booking_id, incomplete_rides_reason
FROM uber
WHERE incomplete_rides = 'Yes';

-- ============================================