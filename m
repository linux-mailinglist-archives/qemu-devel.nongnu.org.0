Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F961573C90
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:33:29 +0200 (CEST)
Received: from localhost ([::1]:39838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBhAt-00012m-Ms
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh4i-0001hC-NB; Wed, 13 Jul 2022 14:27:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16994
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh4f-0000iC-UV; Wed, 13 Jul 2022 14:27:04 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DIDs6C004738;
 Wed, 13 Jul 2022 18:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SxMWHcKocoqGeKCNdQ1jOuupSesC5g9oksPy6HZaBsk=;
 b=YGCcEuKR1dRTR+Y2k9B6YpyeBXhloFGLjz2kadv2G43X9s5EiOybwdLYFsWviG6dh+QB
 3k6x91aWq1lj3L3DzWlt1mur7nrJbbofO5wSl6zKlN6xahnjXC1na8dUuaAxD+WlbuK1
 8MwcB4gSe7myVow2EH/8a0ykzF+0KRQGL4TGy+mY0Ko8ih0a/sIbuYsrGJVzaGCGjq6t
 ZhnVwefqyTdAVmKazMgPsLmADCNpZSZO0c+jA822xQYC1275fuagVc+s5mieWiZIZrg9
 8DL7SH2ZCQjY2kW/IsqWpdVFyHhbANvsm+MqrKerlyQfMGAbrmm0ldN1iRCYOUu2Ccj1 xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha35208ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:49 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DIFNca008384;
 Wed, 13 Jul 2022 18:26:49 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha35208gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:48 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DHrIte001114;
 Wed, 13 Jul 2022 18:26:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3h8ncngxx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DIQhiw23920944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 18:26:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAC694203F;
 Wed, 13 Jul 2022 18:26:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7EFF42041;
 Wed, 13 Jul 2022 18:26:42 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.47.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 18:26:42 +0000 (GMT)
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
Subject: [PATCH v2 3/3] tests/tcg/s390x: test signed vfmin/vfmax
Date: Wed, 13 Jul 2022 20:26:12 +0200
Message-Id: <20220713182612.3780050-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713182612.3780050-1-iii@linux.ibm.com>
References: <20220713182612.3780050-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bPxuho_gNaNUyJJjz58v9REwKov591tb
X-Proofpoint-GUID: Oce4kwOSLycsAYwDJ1_8yJ_HpWkEv3gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
 tests/tcg/s390x/vfminmax.c      | 411 ++++++++++++++++++++++++++++++++
 2 files changed, 418 insertions(+)
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
index 0000000000..22629df160
--- /dev/null
+++ b/tests/tcg/s390x/vfminmax.c
@@ -0,0 +1,411 @@
+#define _GNU_SOURCE
+#include <fenv.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+
+/*
+ * vfmin/vfmax instruction execution.
+ */
+#define VFMIN 0xEE
+#define VFMAX 0xEF
+
+extern char insn[6];
+asm(".pushsection .rwx,\"awx\",@progbits\n"
+    ".globl insn\n"
+    /* e7 89 a0 00 2e ef */
+    "insn: vfmaxsb %v24,%v25,%v26,0\n"
+    ".popsection\n");
+
+static void vfminmax(unsigned int op,
+                     unsigned int m4, unsigned int m5, unsigned int m6,
+                     void *v1, const void *v2, const void *v3)
+{
+   insn[3] = (m6 << 4) | m5;
+   insn[4] = (m4 << 4) | 0x0e;
+   insn[5] = op;
+
+    asm("vl %%v25,%[v2]\n"
+        "vl %%v26,%[v3]\n"
+        "ex 0,%[insn]\n"
+        "vst %%v24,%[v1]\n"
+        : [v1] "=m" (*(char (*)[16])v1)
+        : [v2] "m" (*(char (*)[16])v2)
+        , [v3] "m" (*(char (*)[16])v3)
+        , [insn] "m"(insn)
+        : "v24", "v25", "v26");
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
+static int signed_test(struct signed_test *test, int m4, int m5,
+                       const void *v1_exp, bool xi_exp,
+                       const void *v2, const void *v3)
+{
+    size_t n = (m5 & 8) ? float_sizes[m4 - 2] : 16;
+    char v1[16];
+    bool xi;
+
+    feclearexcept(FE_ALL_EXCEPT);
+    vfminmax(test->op, m4, m5, test->m6, v1, v2, v3);
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
+    int ret = 0;
+    size_t i;
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
+                            ret |= signed_test(test, m4, m5,
+                                               v1_exp, xi_exp, v2, v3);
+                            pos = 0;
+                            xi_exp = false;
+                        }
+                    }
+                }
+
+                if (pos != 0) {
+                    ret |= signed_test(test, m4, m5, v1_exp, xi_exp, v2, v3);
+                }
+            }
+        }
+    }
+
+    return ret;
+}
-- 
2.35.3


