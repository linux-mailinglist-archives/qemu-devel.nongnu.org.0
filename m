Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18648570FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:04:23 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5GA-0005Tl-7s
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB5A7-00075N-54; Mon, 11 Jul 2022 21:58:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB5A4-0003Ma-BT; Mon, 11 Jul 2022 21:58:06 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C0U8QD029927;
 Tue, 12 Jul 2022 01:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YDjsCBtzxo7nvzd/UpRj+ABa8o7StXwmURcP2hAYy9k=;
 b=nZB95TioMynhXnjvtFAeMundd8kHtZIo0N24YHHAu9eAdIm3OywAS2vy9rEms8dJ2Msp
 tWOttkTAmYcF/sVDS9A7p4HZ//fxIk3L+tvHA8B0S+JtfXu/YeMZOlys2IX7qoq9oCNR
 c+xADnWp0Y6Zf5YNQVFV/qPNCVko2/NqMnNSfqW3iziAKymQel/oqLJDpSsV6IQL0CCC
 8w8VbpT6oDizy/d6y//pqa3psDDErG+JttIlKVtPZqma5CCnpJOZzHrwzDj7XQm0uLkx
 /HZQIby9jFGPN8o6tlGzo+pw7yjnjx28jxSYO0p2siTbOhyjHdIxs7wtgvV3Or3HDayp Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8xfda571-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C1q2SS025258;
 Tue, 12 Jul 2022 01:57:45 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8xfda56k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C1oM5J028510;
 Tue, 12 Jul 2022 01:57:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3h71a8ueca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26C1vnpN30474606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 01:57:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD7EA4040;
 Tue, 12 Jul 2022 01:57:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69815A404D;
 Tue, 12 Jul 2022 01:57:38 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 01:57:38 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 3/3] tests/tcg/s390x: test signed vfmin/vfmax
Date: Tue, 12 Jul 2022 03:57:17 +0200
Message-Id: <20220712015717.3602602-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220712015717.3602602-1-iii@linux.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PmwgaULlB81cCNL7bTCtYllEiRJQz1Dq
X-Proofpoint-GUID: cTZo8owA3A5PBg0evcrIOuqmxK_ktYH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_26,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120004
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test to prevent regressions. Try all floating point value sizes
and all combinations of floating point value classes. Verify the results
against PoP tables, which are represented as close to the original as
possible - this produces a lot of checkpatch complaints, but it seems
to be justified in this case.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |   7 +
 tests/tcg/s390x/vfminmax.c      | 426 ++++++++++++++++++++++++++++++++
 2 files changed, 433 insertions(+)
 create mode 100644 tests/tcg/s390x/vfminmax.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 3124172736..1a7a4a2f59 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -17,6 +17,13 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 
+Z14_TESTS=vfminmax
+vfminmax: LDFLAGS+=-lm
+$(Z14_TESTS): CFLAGS+=-march=z14 -O2
+
+TESTS+=$(if $(shell $(CC) -march=z14 -S -o /dev/null -xc /dev/null \
+			 >/dev/null 2>&1 && echo OK),$(Z14_TESTS))
+
 VECTOR_TESTS=vxeh2_vs
 VECTOR_TESTS+=vxeh2_vcvt
 VECTOR_TESTS+=vxeh2_vlstr
diff --git a/tests/tcg/s390x/vfminmax.c b/tests/tcg/s390x/vfminmax.c
new file mode 100644
index 0000000000..daf58b6b33
--- /dev/null
+++ b/tests/tcg/s390x/vfminmax.c
@@ -0,0 +1,426 @@
+#define _GNU_SOURCE
+#include <fenv.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+
+/*
+ * vfmin/vfmax code generation.
+ */
+extern const char vfminmax_template[];
+extern const int vfminmax_template_size;
+extern const int vfminmax_offset;
+asm(".globl vfminmax_template\n"
+    "vfminmax_template:\n"
+    "vl %v25,0(%r3)\n"
+    "vl %v26,0(%r4)\n"
+    "0: vfmax %v24,%v25,%v26,2,0,0\n"
+    "vst %v24,0(%r2)\n"
+    "br %r14\n"
+    "1: .align 4\n"
+    ".globl vfminmax_template_size\n"
+    "vfminmax_template_size: .long 1b - vfminmax_template\n"
+    ".globl vfminmax_offset\n"
+    "vfminmax_offset: .long 0b - vfminmax_template\n");
+
+#define VFMIN 0xEE
+#define VFMAX 0xEF
+
+static void vfminmax(unsigned char *buf, unsigned int op,
+                     unsigned int m4, unsigned int m5, unsigned int m6,
+                     void *v1, const void *v2, const void *v3)
+{
+    memcpy(buf, vfminmax_template, vfminmax_template_size);
+    buf[vfminmax_offset + 3] = (m6 << 4) | m5;
+    buf[vfminmax_offset + 4] &= 0x0F;
+    buf[vfminmax_offset + 4] |= (m4 << 4);
+    buf[vfminmax_offset + 5] = op;
+    ((void (*)(void *, const void *, const void *))buf)(v1, v2, v3);
+}
+
+/*
+ * Floating-point value classes.
+ */
+#define N_FORMATS 3
+#define N_SIGNED_CLASSES 8
+static const size_t float_sizes[N_FORMATS] = {
+    /* M4 == 2: short    */ 4,
+    /* M4 == 3: long     */ 8,
+    /* M4 == 4: extended */ 16,
+};
+static const size_t e_bits[N_FORMATS] = {
+    /* M4 == 2: short    */ 8,
+    /* M4 == 3: long     */ 11,
+    /* M4 == 4: extended */ 15,
+};
+static const unsigned char signed_floats[N_FORMATS][N_SIGNED_CLASSES][2][16] = {
+    /* M4 == 2: short */
+    {
+        /* -inf */ {{0xff, 0x80, 0x00, 0x00},
+                    {0xff, 0x80, 0x00, 0x00}},
+        /* -Fn */  {{0xc2, 0x28, 0x00, 0x00},
+                    {0xc2, 0x29, 0x00, 0x00}},
+        /* -0 */   {{0x80, 0x00, 0x00, 0x00},
+                    {0x80, 0x00, 0x00, 0x00}},
+        /* +0 */   {{0x00, 0x00, 0x00, 0x00},
+                    {0x00, 0x00, 0x00, 0x00}},
+        /* +Fn */  {{0x42, 0x28, 0x00, 0x00},
+                    {0x42, 0x2a, 0x00, 0x00}},
+        /* +inf */ {{0x7f, 0x80, 0x00, 0x00},
+                    {0x7f, 0x80, 0x00, 0x00}},
+        /* QNaN */ {{0x7f, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0xff, 0xfe}},
+        /* SNaN */ {{0x7f, 0xbf, 0xff, 0xff},
+                    {0x7f, 0xbf, 0xff, 0xfd}},
+    },
+
+    /* M4 == 3: long */
+    {
+        /* -inf */ {{0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -Fn */  {{0xc0, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xc0, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -0 */   {{0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +0 */   {{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +Fn */  {{0x40, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x40, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +inf */ {{0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* QNaN */ {{0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe}},
+        /* SNaN */ {{0x7f, 0xf7, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xf7, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfd}},
+    },
+
+    /* M4 == 4: extended */
+    {
+        /* -inf */ {{0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -Fn */  {{0xc0, 0x04, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0xc0, 0x04, 0x51, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* -0 */   {{0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +0 */   {{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +Fn */  {{0x40, 0x04, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x40, 0x04, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* +inf */ {{0x7f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
+                    {0x7f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
+        /* QNaN */ {{0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe}},
+        /* SNaN */ {{0x7f, 0xff, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+                    {0x7f, 0xff, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfd}},
+    },
+};
+
+/*
+ * PoP tables as close to the original as possible.
+ */
+struct signed_test {
+    int op;
+    int m6;
+    const char *m6_desc;
+    const char *table[N_SIGNED_CLASSES][N_SIGNED_CLASSES];
+} signed_tests[] = {
+    {
+        .op = VFMIN,
+        .m6 = 0,
+        .m6_desc = "IEEE MinNum",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(b)",      "T(M(a,b))", "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* -0   */ "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* +0   */ "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(M(a,b))", "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* +inf */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 1,
+        .m6_desc = "JAVA Math.Min()",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(b)",      "T(M(a,b))", "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* -0   */ "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* +0   */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(M(a,b))", "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* +inf */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 2,
+        .m6_desc = "C-style Min Macro",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(b)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -Fn  */ "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -0   */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +0   */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(a)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +Fn  */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(M(a,b))", "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(a)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* QNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 3,
+        .m6_desc = "C++ algorithm.min()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(b)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -Fn  */ "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -0   */ "T(b)",     "T(b)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +0   */ "T(b)",     "T(b)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +Fn  */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(M(a,b))", "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* QNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+    {
+        .op = VFMIN,
+        .m6 = 4,
+        .m6_desc = "fmin()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* -Fn  */ "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* -0   */ "T(b)",     "T(b)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* +0   */ "T(b)",     "T(b)",      "T(b)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* +Fn  */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(M(a,b))", "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* +inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* QNaN */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+
+    {
+        .op = VFMAX,
+        .m6 = 0,
+        .m6_desc = "IEEE MaxNum",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(a)",      "T(M(a,b))", "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* -0   */ "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* +0   */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(M(a,b))", "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* +inf */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 1,
+        .m6_desc = "JAVA Math.Max()",
+        .table = {
+             /*         -inf         -Fn          -0           +0           +Fn          +inf         QNaN         SNaN     */
+            {/* -inf */ "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* -Fn  */ "T(a)",      "T(M(a,b))", "T(b)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* -0   */ "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* +0   */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* +Fn  */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(M(a,b))", "T(b)",      "T(b)",      "Xi: T(b*)"},
+            {/* +inf */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(b)",      "Xi: T(b*)"},
+            {/* QNaN */ "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "T(a)",      "Xi: T(b*)"},
+            {/* SNaN */ "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)", "Xi: T(a*)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 2,
+        .m6_desc = "C-style Max Macro",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -Fn  */ "T(a)",     "T(M(a,b))", "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* -0   */ "T(a)",     "T(a)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +0   */ "T(a)",     "T(a)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +Fn  */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(M(a,b))", "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* +inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(b)",     "Xi: T(b)", "Xi: T(b)"},
+            {/* QNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 3,
+        .m6_desc = "C++ algorithm.max()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(a)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -Fn  */ "T(a)",     "T(M(a,b))", "T(b)",     "T(b)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* -0   */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +0   */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(b)",      "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +Fn  */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(M(a,b))", "T(b)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* +inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "Xi: T(a)", "Xi: T(a)"},
+            {/* QNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)",  "Xi: T(a)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+    {
+        .op = VFMAX,
+        .m6 = 4,
+        .m6_desc = "fmax()",
+        .table = {
+             /*         -inf        -Fn          -0          +0          +Fn          +inf        QNaN        SNaN    */
+            {/* -inf */ "T(a)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* -Fn  */ "T(a)",     "T(M(a,b))", "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* -0   */ "T(a)",     "T(a)",      "T(a)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* +0   */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* +Fn  */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(M(a,b))", "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* +inf */ "T(a)",     "T(a)",      "T(a)",     "T(a)",     "T(a)",      "T(a)",     "T(a)",     "Xi: T(a)"},
+            {/* QNaN */ "T(b)",     "T(b)",      "T(b)",     "T(b)",     "T(b)",      "T(b)",     "T(a)",     "Xi: T(a)"},
+            {/* SNaN */ "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(b)", "Xi: T(b)",  "Xi: T(b)", "Xi: T(a)", "Xi: T(a)"},
+        },
+    },
+};
+
+static void dump_v(FILE *f, const void *v, size_t n)
+{
+    for (int i = 0; i < n; i++) {
+        fprintf(f, "%02x", ((const unsigned char *)v)[i]);
+    }
+}
+
+static int signed_test(unsigned char *buf, struct signed_test *test,
+                       int m4, int m5,
+                       const void *v1_exp, bool xi_exp,
+                       const void *v2, const void *v3)
+{
+    size_t n = (m5 & 8) ? float_sizes[m4 - 2] : 16;
+    char v1[16];
+    bool xi;
+
+    feclearexcept(FE_ALL_EXCEPT);
+    vfminmax(buf, test->op, m4, m5, test->m6, v1, v2, v3);
+    xi = fetestexcept(FE_ALL_EXCEPT) == FE_INVALID;
+
+    if (memcmp(v1, v1_exp, n) != 0 || xi != xi_exp) {
+        fprintf(stderr, "[  FAILED  ] %s ", test->m6_desc);
+        dump_v(stderr, v2, n);
+        fprintf(stderr, ", ");
+        dump_v(stderr, v3, n);
+        fprintf(stderr, ", %d, %d, %d: actual=", m4, m5, test->m6);
+        dump_v(stderr, v1, n);
+        fprintf(stderr, "/%d, expected=", (int)xi);
+        dump_v(stderr, v1_exp, n);
+        fprintf(stderr, "/%d\n", (int)xi_exp);
+        return 1;
+    }
+
+    return 0;
+}
+
+static void snan_to_qnan(char *v, int m4)
+{
+    size_t bit = 1 + e_bits[m4 - 2];
+    v[bit / 8] |= 1 << (7 - (bit % 8));
+}
+
+int main(void)
+{
+    unsigned char *buf;
+    int ret = 0;
+    size_t i;
+
+    buf = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE | PROT_EXEC,
+               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (buf == MAP_FAILED) {
+        perror("mmap() failed");
+        return 1;
+    }
+
+    for (i = 0; i < sizeof(signed_tests) / sizeof(signed_tests[0]); i++) {
+        struct signed_test *test = &signed_tests[i];
+        int m4;
+
+        for (m4 = 2; m4 <= 4; m4++) {
+            const unsigned char (*floats)[2][16] = signed_floats[m4 - 2];
+            size_t float_size = float_sizes[m4 - 2];
+            int m5;
+
+            for (m5 = 0; m5 <= 8; m5 += 8) {
+                char v1_exp[16], v2[16], v3[16];
+                bool xi_exp = false;
+                int pos = 0;
+                int i2;
+
+                for (i2 = 0; i2 < N_SIGNED_CLASSES * 2; i2++) {
+                    int i3;
+
+                    for (i3 = 0; i3 < N_SIGNED_CLASSES * 2; i3++) {
+                        const char *spec = test->table[i2 / 2][i3 / 2];
+
+                        memcpy(&v2[pos], floats[i2 / 2][i2 % 2], float_size);
+                        memcpy(&v3[pos], floats[i3 / 2][i3 % 2], float_size);
+                        if (strcmp(spec, "T(a)") == 0 ||
+                            strcmp(spec, "Xi: T(a)") == 0) {
+                            memcpy(&v1_exp[pos], &v2[pos], float_size);
+                        } else if (strcmp(spec, "T(b)") == 0 ||
+                                   strcmp(spec, "Xi: T(b)") == 0) {
+                            memcpy(&v1_exp[pos], &v3[pos], float_size);
+                        } else if (strcmp(spec, "Xi: T(a*)") == 0) {
+                            memcpy(&v1_exp[pos], &v2[pos], float_size);
+                            snan_to_qnan(&v1_exp[pos], m4);
+                        } else if (strcmp(spec, "Xi: T(b*)") == 0) {
+                            memcpy(&v1_exp[pos], &v3[pos], float_size);
+                            snan_to_qnan(&v1_exp[pos], m4);
+                        } else if (strcmp(spec, "T(M(a,b))") == 0) {
+                            /*
+                             * Comparing floats is risky, since the compiler
+                             * might generate the same instruction that we are
+                             * testing. Compare ints instead. This works,
+                             * because we get here only for +-Fn, and the
+                             * corresponding test values have identical
+                             * exponents.
+                             */
+                            int v2_int = *(int *)&v2[pos];
+                            int v3_int = *(int *)&v3[pos];
+
+                            if ((v2_int < v3_int) ==
+                                ((test->op == VFMIN) != (v2_int < 0))) {
+                                memcpy(&v1_exp[pos], &v2[pos], float_size);
+                            } else {
+                                memcpy(&v1_exp[pos], &v3[pos], float_size);
+                            }
+                        } else {
+                            fprintf(stderr, "Unexpected spec: %s\n", spec);
+                            return 1;
+                        }
+                        xi_exp |= spec[0] == 'X';
+                        pos += float_size;
+
+                        if ((m5 & 8) || pos == 16) {
+                            ret |= signed_test(buf, test, m4, m5,
+                                               v1_exp, xi_exp, v2, v3);
+                            pos = 0;
+                            xi_exp = false;
+                        }
+                    }
+                }
+
+                if (pos != 0) {
+                    ret |= signed_test(buf, test, m4, m5,
+                                       v1_exp, xi_exp, v2, v3);
+                }
+            }
+        }
+    }
+
+    munmap(buf, 0x1000);
+
+    return ret;
+}
-- 
2.35.3


