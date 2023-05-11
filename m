Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0046FF0AA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:47:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4lP-0005e2-JH; Thu, 11 May 2023 07:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px4lH-0005dQ-IN; Thu, 11 May 2023 07:47:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px4lF-0006zG-Nu; Thu, 11 May 2023 07:47:07 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BBgAjW008865; Thu, 11 May 2023 11:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=fI+6G89R4+TwOY8g1LVbhz+kgI5ZTj3L+LeVjphJIo0=;
 b=IVfXdVTuTJIvVjXEbNvHowrRqz/Xo1/wsA4Dcl4iS2QCJtMxsQxpNsHa3OLnqURS338q
 PWqJWqmx10ZDIxVNZAIjfq4sRi7asKjjpq79+C/DPA7UGIKsw3OgymYMrJTr55YDsYDE
 In050c1meunylgMfVbbyGJMjOB4F0lekFHyxP+35rajOrIAPmHCpBO0h70QCx+dXl4W1
 o9qFlxBNAFEvO1Xr03y78fD3PH+tQ7cTEMlTAo25IayJKXJYRNR0UvZvEwVYvOSjBnMf
 5C6PopwSS6nTpskFMJm6VLkLKBwqmP8QBon/wnncP0FfdOUGRd8muE4A1wREO2uMU9ka Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgyqdg57h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:47:02 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BBgOG5009400;
 Thu, 11 May 2023 11:47:02 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgyqdg569-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:47:01 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34B7Y2MO013391;
 Thu, 11 May 2023 11:46:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3qf7d1sc9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:46:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34BBkuFn56426968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 May 2023 11:46:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6ED020049;
 Thu, 11 May 2023 11:46:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C17220040;
 Thu, 11 May 2023 11:46:56 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.14.79])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 11 May 2023 11:46:56 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "David Hildenbrand" <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 1/2] tests/tcg/multiarch: Make the system memory test work
 on big-endian
Date: Thu, 11 May 2023 13:46:50 +0200
Message-Id: <20230511114651.439872-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511114651.439872-1-iii@linux.ibm.com>
References: <20230511114651.439872-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Hk8epc7K0zawtYlfoLXFh1ESOtAxe6-6
X-Proofpoint-GUID: 9bTNOxPvhAnJTSTCRQZdzW6eb1FD2Ybn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110099
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Store the bytes in descending order on big-endian.
Invert the logic in the multi-byte signed tests on big-endian.
Make the checks in the multi-byte signed tests stricter.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/system/memory.c | 67 ++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 214f7d4f54b..e29786ae559 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -40,18 +40,21 @@ static void pdot(int count)
 }
 
 /*
- * Helper macros for shift/extract so we can keep our endian handling
- * in one place.
+ * Helper macros for endian handling.
  */
-#define BYTE_SHIFT(b, pos) ((uint64_t)b << (pos * 8))
-#define BYTE_EXTRACT(b, pos) ((b >> (pos * 8)) & 0xff)
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+#define BYTE_SHIFT(b, pos) (b << (pos * 8))
+#define BYTE_NEXT(b) ((b)++)
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+#define BYTE_SHIFT(b, pos) (b << ((sizeof(b) - 1 - (pos)) * 8))
+#define BYTE_NEXT(b) (--(b))
+#else
+#error Unsupported __BYTE_ORDER__
+#endif
 
 /*
- * Fill the data with ascending value bytes.
- *
- * Currently we only support Little Endian machines so write in
- * ascending address order. When we read higher address bytes should
- * either be zero or higher than the lower bytes.
+ * Fill the data with ascending (for little-endian) or descending (for
+ * big-endian) value bytes.
  */
 
 static void init_test_data_u8(int unused_offset)
@@ -62,14 +65,14 @@ static void init_test_data_u8(int unused_offset)
 
     ml_printf("Filling test area with u8:");
     for (i = 0; i < TEST_SIZE; i++) {
-        *ptr++ = count++;
+        *ptr++ = BYTE_NEXT(count);
         pdot(i);
     }
     ml_printf("done\n");
 }
 
 /*
- * Full the data with alternating positive and negative bytes. This
+ * Fill the data with alternating positive and negative bytes. This
  * should mean for reads larger than a byte all subsequent reads will
  * stay either negative or positive. We never write 0.
  */
@@ -119,7 +122,7 @@ static void init_test_data_u16(int offset)
     reset_start_data(offset);
 
     for (i = 0; i < max; i++) {
-        uint8_t low = count++, high = count++;
+        uint16_t low = BYTE_NEXT(count), high = BYTE_NEXT(count);
         word = BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
         *ptr++ = word;
         pdot(i);
@@ -139,9 +142,10 @@ static void init_test_data_u32(int offset)
     reset_start_data(offset);
 
     for (i = 0; i < max; i++) {
-        uint8_t b4 = count++, b3 = count++;
-        uint8_t b2 = count++, b1 = count++;
-        word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) | b4;
+        uint32_t b4 = BYTE_NEXT(count), b3 = BYTE_NEXT(count);
+        uint32_t b2 = BYTE_NEXT(count), b1 = BYTE_NEXT(count);
+        word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) |
+               BYTE_SHIFT(b4, 0);
         *ptr++ = word;
         pdot(i);
     }
@@ -160,13 +164,13 @@ static void init_test_data_u64(int offset)
     reset_start_data(offset);
 
     for (i = 0; i < max; i++) {
-        uint8_t b8 = count++, b7 = count++;
-        uint8_t b6 = count++, b5 = count++;
-        uint8_t b4 = count++, b3 = count++;
-        uint8_t b2 = count++, b1 = count++;
+        uint64_t b8 = BYTE_NEXT(count), b7 = BYTE_NEXT(count);
+        uint64_t b6 = BYTE_NEXT(count), b5 = BYTE_NEXT(count);
+        uint64_t b4 = BYTE_NEXT(count), b3 = BYTE_NEXT(count);
+        uint64_t b2 = BYTE_NEXT(count), b1 = BYTE_NEXT(count);
         word = BYTE_SHIFT(b1, 7) | BYTE_SHIFT(b2, 6) | BYTE_SHIFT(b3, 5) |
                BYTE_SHIFT(b4, 4) | BYTE_SHIFT(b5, 3) | BYTE_SHIFT(b6, 2) |
-               BYTE_SHIFT(b7, 1) | b8;
+               BYTE_SHIFT(b7, 1) | BYTE_SHIFT(b8, 0);
         *ptr++ = word;
         pdot(i);
     }
@@ -374,12 +378,20 @@ static bool read_test_data_s16(int offset, bool neg_first)
     ml_printf("Reading s16 from %#lx (offset %d, %s):", ptr,
               offset, neg_first ? "neg" : "pos");
 
+    /*
+     * If the first byte is negative, then the last byte is positive.
+     * Therefore the logic below must be flipped for big-endian.
+     */
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+    neg_first = !neg_first;
+#endif
+
     for (i = 0; i < max; i++) {
         int32_t data = *ptr++;
 
         if (neg_first && data < 0) {
             pdot(i);
-        } else if (data > 0) {
+        } else if (!neg_first && data > 0) {
             pdot(i);
         } else {
             ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
@@ -399,12 +411,20 @@ static bool read_test_data_s32(int offset, bool neg_first)
     ml_printf("Reading s32 from %#lx (offset %d, %s):",
               ptr, offset, neg_first ? "neg" : "pos");
 
+    /*
+     * If the first byte is negative, then the last byte is positive.
+     * Therefore the logic below must be flipped for big-endian.
+     */
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+    neg_first = !neg_first;
+#endif
+
     for (i = 0; i < max; i++) {
         int64_t data = *ptr++;
 
         if (neg_first && data < 0) {
             pdot(i);
-        } else if (data > 0) {
+        } else if (!neg_first && data > 0) {
             pdot(i);
         } else {
             ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
@@ -419,8 +439,7 @@ static bool read_test_data_s32(int offset, bool neg_first)
  * Read the test data and verify at various offsets
  *
  * For everything except bytes all our reads should be either positive
- * or negative depending on what offset we are reading from. Currently
- * we only handle LE systems.
+ * or negative depending on what offset we are reading from.
  */
 read_sfn read_sfns[] = { read_test_data_s8,
                          read_test_data_s16,
-- 
2.40.1


