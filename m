Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BED6ECB8A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:47:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pque4-0003Hp-L7; Mon, 24 Apr 2023 07:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqudo-0003Fc-Ga; Mon, 24 Apr 2023 07:45:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqudi-0002H2-1N; Mon, 24 Apr 2023 07:45:52 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OBbTj1015680; Mon, 24 Apr 2023 11:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lv0aImRKFa6aQroDMSiFz3Vpv3QT19wH5MfTxE81Llc=;
 b=LaAtq16henwALYZExEzya6YwQJp0hge7piXP+aR4oYUCIG/9b54SfDgbnensWpbT4OM/
 eJhkwZT3n9wXsX31vDjd9P0eSqfr7dY1N9Od8Fp0z6h8SGo+gOs3oQq3M8rqw7PVb/fh
 NZt+pIb1q167yZl/Bs0wfxSGf88+FYM4NJoBkPK9t1SJHUCp3xWJj892GXgDWJVkeSwU
 nX2AUBxU35AkvzFUbTbHPVgi1IhhdLLN4kLSsA8oayVdFww64XDBO+eckreFxdEZb57S
 I9ntyBwC/IH0D6JJEzW48dtsJRIIB+T4YyHnVatr7UfUHE/B7IJlnKAQd1nM1BkuKHkb LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q47d52982-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:46 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OBbRQo015434;
 Mon, 24 Apr 2023 11:45:46 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q47d5296b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O4XfGm023833;
 Mon, 24 Apr 2023 11:45:43 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3q47770wa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33OBjei717564174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 11:45:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C789520049;
 Mon, 24 Apr 2023 11:45:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48FF620043;
 Mon, 24 Apr 2023 11:45:40 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.51.2])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 11:45:40 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/3] tests/tcg/multiarch: Make the system memory test work
 on big-endian
Date: Mon, 24 Apr 2023 13:45:32 +0200
Message-Id: <20230424114533.1937153-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424114533.1937153-1-iii@linux.ibm.com>
References: <20230424114533.1937153-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uwelhukxIgJ48F-phmckvhCCs8yUh9eZ
X-Proofpoint-GUID: s6zBqYXyQyEDky3amiTfWO0Dgps97vZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240104
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

Make sure values are stored in memory as little-endian regardless of
the host endianness.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/system/memory.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 214f7d4f54b..3a15f3f494a 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -12,9 +12,11 @@
  *   - sign extension when loading
  */
 
+#include "qemu/testdep.h"
 #include <stdint.h>
 #include <stdbool.h>
 #include <minilib.h>
+#include "qemu/bswap.h"
 
 #ifndef CHECK_UNALIGNED
 # error "Target does not specify CHECK_UNALIGNED"
@@ -40,8 +42,7 @@ static void pdot(int count)
 }
 
 /*
- * Helper macros for shift/extract so we can keep our endian handling
- * in one place.
+ * Helper macros for shift/extract.
  */
 #define BYTE_SHIFT(b, pos) ((uint64_t)b << (pos * 8))
 #define BYTE_EXTRACT(b, pos) ((b >> (pos * 8)) & 0xff)
@@ -49,9 +50,8 @@ static void pdot(int count)
 /*
  * Fill the data with ascending value bytes.
  *
- * Currently we only support Little Endian machines so write in
- * ascending address order. When we read higher address bytes should
- * either be zero or higher than the lower bytes.
+ * Store the words in the Little Endian byte order. When we read higher address
+ * bytes should either be zero or higher than the lower bytes.
  */
 
 static void init_test_data_u8(int unused_offset)
@@ -121,7 +121,7 @@ static void init_test_data_u16(int offset)
     for (i = 0; i < max; i++) {
         uint8_t low = count++, high = count++;
         word = BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
-        *ptr++ = word;
+        *ptr++ = cpu_to_le16(word);
         pdot(i);
     }
     ml_printf("done @ %p\n", ptr);
@@ -142,7 +142,7 @@ static void init_test_data_u32(int offset)
         uint8_t b4 = count++, b3 = count++;
         uint8_t b2 = count++, b1 = count++;
         word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) | b4;
-        *ptr++ = word;
+        *ptr++ = cpu_to_le32(word);
         pdot(i);
     }
     ml_printf("done @ %p\n", ptr);
@@ -167,7 +167,7 @@ static void init_test_data_u64(int offset)
         word = BYTE_SHIFT(b1, 7) | BYTE_SHIFT(b2, 6) | BYTE_SHIFT(b3, 5) |
                BYTE_SHIFT(b4, 4) | BYTE_SHIFT(b5, 3) | BYTE_SHIFT(b6, 2) |
                BYTE_SHIFT(b7, 1) | b8;
-        *ptr++ = word;
+        *ptr++ = cpu_to_le64(word);
         pdot(i);
     }
     ml_printf("done @ %p\n", ptr);
@@ -183,7 +183,7 @@ static bool read_test_data_u16(int offset)
 
     for (i = 0; i < max; i++) {
         uint8_t high, low;
-        word = *ptr++;
+        word = le16_to_cpu(*ptr++);
         high = (word >> 8) & 0xff;
         low = word & 0xff;
         if (high < low && high != 0) {
@@ -209,7 +209,7 @@ static bool read_test_data_u32(int offset)
     for (i = 0; i < max; i++) {
         uint8_t b1, b2, b3, b4;
         int zeros = 0;
-        word = *ptr++;
+        word = le32_to_cpu(*ptr++);
 
         b1 = word >> 24 & 0xff;
         b2 = word >> 16 & 0xff;
@@ -250,7 +250,7 @@ static bool read_test_data_u64(int offset)
     for (i = 0; i < max; i++) {
         uint8_t b1, b2, b3, b4, b5, b6, b7, b8;
         int zeros = 0;
-        word = *ptr++;
+        word = le64_to_cpu(*ptr++);
 
         b1 = ((uint64_t) (word >> 56)) & 0xff;
         b2 = ((uint64_t) (word >> 48)) & 0xff;
@@ -375,7 +375,7 @@ static bool read_test_data_s16(int offset, bool neg_first)
               offset, neg_first ? "neg" : "pos");
 
     for (i = 0; i < max; i++) {
-        int32_t data = *ptr++;
+        int32_t data = le16_to_cpu(*ptr++);
 
         if (neg_first && data < 0) {
             pdot(i);
@@ -400,7 +400,7 @@ static bool read_test_data_s32(int offset, bool neg_first)
               ptr, offset, neg_first ? "neg" : "pos");
 
     for (i = 0; i < max; i++) {
-        int64_t data = *ptr++;
+        int64_t data = le32_to_cpu(*ptr++);
 
         if (neg_first && data < 0) {
             pdot(i);
-- 
2.39.2


