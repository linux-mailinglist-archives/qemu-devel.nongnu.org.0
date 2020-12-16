Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FF12DBD6E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:20:30 +0100 (CET)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSyz-0005U5-7E
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqM-0005L2-ML; Wed, 16 Dec 2020 04:11:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqH-0007Q3-Ms; Wed, 16 Dec 2020 04:11:33 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG92S3J028544; Wed, 16 Dec 2020 04:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=Hm55d5/wfI1U3mi6Feh8IE2m5ufrxX+zsZ7TMRfBoSE=;
 b=SJI2g4UhmpHnuvOzbwmjiBRfuERKvUc5PauFNGS8NXxo1h3MYVTiylJwkbQ0kkm4KUTr
 p8ebKVTeC8D6sLufrNhC2m86A7Q8vSKxV9XMT6nQdc9wsyWgomLkHAD9OYfBUfqN55Mc
 TbrlYc1KS/z6Vzc7tEQb6Wox794kuLiicVSmjAawqIFwGhlW1mPiZ5lGepUeJLKKChbh
 R7oJcH9husv/rPQ1bfUbdcO6z1irhMP/pusJwDBLooCfPKMkwzbhQPp0JfpsFCT8W+XY
 X7pwXFWiU8jF4B4xKdOkQQmrrU8262qeqQmuP+VPOlEAtfEkah+29QZ2Yy9r5Ui1IP+f AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fdvg2pmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:16 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG967id046797;
 Wed, 16 Dec 2020 04:11:16 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fdvg2pkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:16 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG97McI011648;
 Wed, 16 Dec 2020 09:11:14 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 35cng9e0ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:11:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9BDPo5898502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:11:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 550C378067;
 Wed, 16 Dec 2020 09:11:13 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBDB078066;
 Wed, 16 Dec 2020 09:11:06 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:11:06 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] tests/tcg: Add tests for paired vector load/store
 instructions
Date: Wed, 16 Dec 2020 06:08:02 -0300
Message-Id: <20201216090804.58640-6-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216090804.58640-1-gromero@linux.ibm.com>
References: <20201216090804.58640-1-gromero@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160055
Received-SPF: pass client-ip=148.163.156.1; envelope-from=gromero@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, gromero@linux.ibm.com,
 gustavo.romero@protonmail.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 mroth@lamentation.net, clg@kaod.org, david@gibson.dropbear.id.au,
 alex.bennee@linaro.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Roth <mdroth@linux.vnet.ibm.com>

Signed-off-by: Michael Roth <mroth@lamentation.net>
[ gromero: - aligned prefixed insns., avoiding cross 64-byte boundary
           - fix to skip branch insn. just after PLXVP
           - fix various buffer offsets used in comparisons, for LE only
           - tweaks in debug output ]
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 tests/tcg/ppc64le/Makefile.target             |   9 +
 .../test-paired-load-store-vsx.c              | 567 ++++++++++++++++++
 2 files changed, 576 insertions(+)
 create mode 100644 tests/tcg/ppc64le/instruction-tests/test-paired-load-store-vsx.c

diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index aabc046eb5..aaa43a83a7 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -11,6 +11,15 @@ QEMU_OPTS += -cpu power10
 PPC_TESTS = test-prefixed-load-store
 
 TESTS += $(PPC_TESTS)
+PPC_VSX_TESTS = test-paired-load-store-vsx
+
+VSX_CFLAGS = -maltivec -mvsx
+$(PPC_VSX_TESTS): CFLAGS+=$(VSX_CFLAGS)
+
+PPC_TESTS += $(PPC_VSX_TESTS)
 
 test-prefixed-load-store: test-prefixed-load-store.c
 	gcc $< -o test-prefixed-load-store
+
+test-paired-load-store-vsx: test-paired-load-store-vsx.c
+	gcc $< -o test-paired-load-store-vsx
diff --git a/tests/tcg/ppc64le/instruction-tests/test-paired-load-store-vsx.c b/tests/tcg/ppc64le/instruction-tests/test-paired-load-store-vsx.c
new file mode 100644
index 0000000000..61c25d9f41
--- /dev/null
+++ b/tests/tcg/ppc64le/instruction-tests/test-paired-load-store-vsx.c
@@ -0,0 +1,567 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <assert.h>
+#include <altivec.h>
+#include <endian.h>
+#include <string.h>
+
+bool debug = false;
+
+#define dprintf(...) \
+    do { \
+        if (debug == true) { \
+            fprintf(stderr, "%s: ", __func__); \
+            fprintf(stderr, __VA_ARGS__); \
+        } \
+    } while (0);
+
+bool le;
+
+#define PLXVP(_Tp, _RA, _d0, _d1, _R, _TX) \
+    ".align 6;" \
+    ".long 1 << 26 | (" #_R ") << 20 | (" #_d0 ");" \
+    ".long 58 << 26 | (" #_Tp ") << 22 | (" #_TX ") << 21 | (" #_RA ") << 16 | (" #_d1 ");"
+
+void test_plxvp_cia(void) {
+    register vector unsigned char v0 asm("vs8") = { 0 };
+    register vector unsigned char v1 asm("vs9") = { 0 };
+    int i;
+
+    /* load defined bytes below into vs8,vs9 using CIA with relative offset */
+    asm(
+        PLXVP(4, 0, 0, 8 /* skip plxvp */ + 4 /* skip b */, 1, 0)
+        "b 1f;"
+        ".byte 0;"
+        ".byte 1;"
+        ".byte 2;"
+        ".byte 3;"
+        ".byte 4;"
+        ".byte 5;"
+        ".byte 6;"
+        ".byte 7;"
+        ".byte 8;"
+        ".byte 9;"
+        ".byte 10;"
+        ".byte 11;"
+        ".byte 12;"
+        ".byte 13;"
+        ".byte 14;"
+        ".byte 15;"
+        ".byte 16;"
+        ".byte 17;"
+        ".byte 18;"
+        ".byte 19;"
+        ".byte 20;"
+        ".byte 21;"
+        ".byte 22;"
+        ".byte 23;"
+        ".byte 24;"
+        ".byte 25;"
+        ".byte 26;"
+        ".byte 27;"
+        ".byte 28;"
+        ".byte 29;"
+        ".byte 30;"
+        ".byte 31;"
+        "1: nop;"
+        : "+wa" (v0), "+wa" (v1));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == 16 + i);
+        else
+            assert(v0[i] == (31 - i)); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == i);
+        else
+            assert(v1[i] == 15 - i); // FIXME
+    }
+}
+
+void test_plxvp(void) {
+    register vector unsigned char v0 asm("vs6") = { 0 };
+    register vector unsigned char v1 asm("vs7") = { 0 };
+    uint8_t buf[64] __attribute__((aligned(16)));
+    uint8_t *buf_ptr = (uint8_t *)&buf;
+    int i;
+
+    for (i = 0; i < 64; i++) {
+        buf[i] = i;
+    }
+
+    /* load buf[0:31] into vs6,vs7 using EA with no offset */
+    asm(PLXVP(3, %2, 0, 0, 0, 0)
+        : "+wa" (v0), "+wa" (v1)
+        : "r" (buf_ptr));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[16 + i]);
+        else
+            assert(v0[i] == buf[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[i]);
+        else
+            assert(v1[i] == buf[16 + i]); // FIXME
+    }
+
+    /* load buf[32:63] into vs6,vs7 using EA with d1 offset */
+    buf_ptr = buf_ptr + 32 - 0x1000;
+    asm(PLXVP(3, %2, 0, 0x1000, 0, 0)
+        : "+wa" (v0), "+wa" (v1)
+        : "r" (buf_ptr));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[32 + 16 + i]);
+        else
+            assert(v0[i] == buf[32 + i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[32 + i]);
+        else
+            assert(v1[i] == buf[48 + i]); // FIXME
+    }
+
+    /* load buf[0:31] into vs6,vs7 using EA with d0||d1 offset */
+    buf_ptr = buf;
+    buf_ptr = buf_ptr - ((0x1000 << 16) | 0x1000);
+    asm(PLXVP(3, %2, 0x1000, 0x1000, 0, 0)
+        : "+wa" (v0), "+wa" (v1)
+        : "r" (buf_ptr));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[16 + i]);
+        else
+            assert(v0[i] == buf[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[i]);
+        else
+            assert(v1[i] == buf[16 + i]); // FIXME
+    }
+
+    /* TODO: test signed offset */
+    /* TODO: PC-relative addresses */
+    /* load buf[32:63] into vs6,vs7 using EA with negative d0||d1 offset */
+    buf_ptr = buf;
+    buf_ptr = buf_ptr + 32 + 0x1000;
+    asm(PLXVP(3, %2, 0x3ffff, 0xf000, 0, 0)
+        : "+wa" (v0), "+wa" (v1)
+        : "r" (buf_ptr));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[32 + 16 + i]);
+        else
+            assert(v0[i] == buf[32 + i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[32 + i]);
+        else
+            assert(v1[i] == buf[48 + i]); // FIXME
+    }
+}
+
+#define PSTXVP(_Sp, _RA, _d0, _d1, _R, _SX) \
+    ".align 6;" \
+    ".long 1 << 26 | (" #_R ") << 20 | (" #_d0 ");" \
+    ".long 62 << 26 | (" #_Sp ") << 22 | (" #_SX ") << 21 | (" #_RA ") << 16 | (" #_d1 ");"
+
+void test_pstxvp(void) {
+    register vector unsigned char v0 asm("vs6") = {
+// FIXME: reorder values for readability
+        0, 1, 2, 3,
+        4, 5, 6, 7,
+        8, 9, 10, 11,
+        12, 13, 14, 15
+    };
+    register vector unsigned char v1 asm("vs7") = {
+// FIXME: reorder values for readability
+        16, 17, 18, 19,
+        20, 21, 22, 23,
+        24, 25, 26, 27,
+        28, 29, 30, 31
+    };
+    uint8_t buf[64] __attribute__((aligned(16)));
+    uint8_t *buf_ptr = (uint8_t *)&buf;
+    int i;
+
+    for (i = 0; i < 64; i++) {
+        buf[i] = 0;
+    }
+
+    /* store vs6,vs7 into buf[0:31] using EA with no offset */
+    asm(PSTXVP(3, %0, 0, 0, 0, 0)
+        : "+r" (buf_ptr)
+        : "wa" (v0), "wa" (v1));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[16 + i]);
+        else
+            assert(v0[i] == buf[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[i]);
+        else
+            assert(v1[i] == buf[16 + i]); // FIXME
+    }
+
+    /* store vs6,vs7 into buf[32:63] using EA with d1 offset */
+    buf_ptr = buf_ptr + 32 - 0x1000;
+    asm(PSTXVP(3, %0, 0, 0x1000, 0, 0)
+        : "+r" (buf_ptr)
+        : "wa" (v0), "wa" (v1));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[32 + 16 + i]);
+        else
+            assert(v0[i] == buf[32 + i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[32 + i]);
+        else
+            assert(v1[i] == buf[48 + i]); // FIXME
+    }
+
+    /* store buf[0:31] into vs6,vs7 using EA with d0||d1 offset */
+    buf_ptr = buf;
+    buf_ptr = buf_ptr - ((0x1000 << 16) | 0x1000);
+    asm(PSTXVP(3, %0, 0x1000, 0x1000, 0, 0)
+        : "+r" (buf_ptr)
+        : "wa" (v0), "wa" (v1));
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[16 + i]);
+        else
+            assert(v0[i] == buf[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[i]);
+        else
+            assert(v1[i] == buf[16 + i]); // FIXME
+    }
+
+    /* TODO: test signed offset */
+    /* TODO: PC-relative addresses */
+}
+
+/* TODO: we force 2 instead of 1 in opc2 currently to hack around
+ * QEMU impl, need a single handler to deal with the 1 in bit 31
+ */
+#define STXVP(_Sp, _RA, _DQ, _SX) \
+    ".align 6;" \
+    ".long 6 << 26 | (" #_Sp ") << 22 | (" #_SX ") << 21 | (" #_RA ") << 16 | (" #_DQ ") << 4 | 1;"
+
+void test_stxvp(void) {
+    register vector unsigned char v0 asm("vs4") = {
+        0, 1, 2, 3,
+        4, 5, 6, 7,
+        8, 9, 10, 11,
+        12, 13, 14, 15
+    };
+    register vector unsigned char v1 asm("vs5") = {
+        16, 17, 18, 19,
+        20, 21, 22, 23,
+        24, 25, 26, 27,
+        28, 29, 30, 31
+    };
+    uint8_t buf[64] __attribute__((aligned(16)));
+    uint8_t *buf_ptr = (uint8_t *)&buf;
+    int i;
+
+    for (i = 0; i < 64; i++) {
+        buf[i] = 7;
+    }
+
+    /* store v0,v1 into buf[0:31] using EA with no offset */
+    asm(STXVP(2, %0, 0, 0)
+        : "+r" (buf_ptr)
+        : "wa" (v0), "wa" (v1)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(buf[i] == v1[i]);
+        else
+            assert(buf[i] == v0[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(buf[16 + i] == v0[i]);
+        else
+            assert(buf[16 + i] == v1[i]); // FIXME
+    }
+
+    /* store v0,v1 into buf[32:63] using EA with offset 0x40 */
+    buf_ptr = buf_ptr + 32 - 0x40;
+    asm(STXVP(2, %0, 4, 0)
+        : "+r" (buf_ptr)
+        : "wa" (v0), "wa" (v1)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(buf[32 + i] == v1[i]);
+        else
+            assert(buf[32 + i] == v0[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(buf[32 + 16 + i] == v0[i]);
+        else
+            assert(buf[48 + i] == v1[i]); // FIXME
+    }
+
+    /* TODO: test signed offset */
+    /* TODO: PC-relative addresses */
+}
+
+#define LXVP(_Tp, _RA, _DQ, _TX) \
+    ".long 6 << 26 | (" #_Tp ") << 22 | (" #_TX ") << 21 | (" #_RA ") << 16 | (" #_DQ ") << 4;"
+
+void test_lxvp(void) {
+    register vector unsigned char v0 asm("vs4") = { 0 };
+    register vector unsigned char v1 asm("vs5") = { 0 };
+    uint8_t buf[64] __attribute__((aligned(16)));
+    uint8_t *buf_ptr = (uint8_t *)&buf;
+    int i;
+
+    for (i = 0; i < 64; i++) {
+        buf[i] = i;
+    }
+
+    /* load buf[0:31] into v0,v1 using EA with no offset */
+    asm(LXVP(2, %2, 0, 0)
+        : "=wa" (v0), "=wa" (v1)
+        : "r" (buf_ptr)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le) {
+            assert(v0[i] == buf[16 + i]);
+
+         } else
+            assert(v0[i] == buf[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[i]);
+        else
+            assert(v1[i] == buf[16+i]); // FIXME
+    }
+
+    /* load buf[32:63] into v0,v1 using EA with 0x40 offset */
+    buf_ptr = buf_ptr + 32 - 0x40;
+    asm(LXVP(2, %2, 4, 0)
+        : "=wa" (v0), "=wa" (v1)
+        : "r" (buf_ptr)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[32+16+i]);
+        else
+            assert(v0[i] == buf[32+i]); // FIXME
+
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[32+i]);
+        else
+            assert(v1[i] == buf[48+i]); // FIXME
+    }
+
+    /* TODO: signed offsets */
+    /* TODO: PC-relative addresses */
+}
+
+#define LXVPX(_Tp, _RA, _RB, _TX) \
+    ".long 31 << 26 | (" #_Tp ") << 22 | (" #_TX ") << 21 | (" #_RA ") << 16 | (" #_RB ") << 11 | 333 << 1;"
+
+void test_lxvpx(void) {
+    register vector unsigned char v0 asm("vs8") = { 0 };
+    register vector unsigned char v1 asm("vs9") = { 0 };
+    uint8_t buf[64] __attribute__((aligned(16)));
+    uint8_t *buf_ptr = (uint8_t *)&buf;
+    uint32_t offset;
+    int i;
+
+    for (i = 0; i < 64; i++) {
+        buf[i] = i;
+    }
+
+    /* load buf[0:31] into v0,v1 using EA with no offset */
+    offset = 0;
+    asm(LXVPX(4, %2, %3, 0)
+        : "=wa" (v0), "=wa" (v1)
+        : "r" (buf_ptr), "r" (offset)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[16 + i]);
+        else
+            assert(v0[i] == buf[i]); // FIXME
+
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[i]);
+        else
+            assert(v1[i] == buf[16+i]); // FIXME
+    }
+
+    /* load buf[32:63] into v0,v1 using EA with 0x40 offset */
+    offset = 0x40;
+    buf_ptr = buf_ptr + 32 - offset;
+    asm(LXVPX(4, %2, %3, 0)
+        : "=wa" (v0), "=wa" (v1)
+        : "r" (buf_ptr), "r" (offset)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[32 + 16 + i]);
+        else
+            assert(v0[i] == buf[32+i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[32 + i]);
+        else
+            assert(v1[i] == buf[48+i]); // FIXME
+    }
+
+    /* TODO: signed offsets */
+    /* TODO: PC-relative addresses */
+}
+
+#define STXVPX(_Sp, _RA, _RB, _SX) \
+    ".long 31 << 26 | (" #_Sp ") << 22 | (" #_SX ") << 21 | (" #_RA ") << 16 | (" #_RB ") << 11 | 461 << 1;"
+
+void test_stxvpx(void) {
+    register vector unsigned char v0 asm("vs10") = {
+// FIXME: reorder for readability
+        0, 1, 2, 3,
+        4, 5, 6, 7,
+        8, 9, 10, 11,
+        12, 13, 14, 15
+    };
+    register vector unsigned char v1 asm("vs11") = {
+// FIXME: ditto
+        16, 17, 18, 19,
+        20, 21, 22, 23,
+        24, 25, 26, 27,
+        28, 29, 30, 31
+    };
+    uint8_t buf[64] __attribute__((aligned(16)));
+    uint8_t *buf_ptr = (uint8_t *)&buf;
+    uint32_t offset;
+    int i;
+
+    for (i = 0; i < 64; i++) {
+        buf[i] = 7;
+    }
+
+    /* store v0,v1 into buf[0:31] using EA with no offset */
+    offset = 0;
+    asm(STXVPX(5, %0, %1, 0)
+        : "+r" (buf_ptr)
+        : "r" (offset), "wa" (v0), "wa" (v1)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(buf[i] == v1[i]);
+        else
+            assert(buf[i] == v0[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[16 + i]);
+        else
+            assert(buf[16 + i] == v1[i]); // FIXME
+    }
+
+    /* store v0,v1 into buf[32:63] using EA with offset 0x40 */
+    offset = 0x40;
+    buf_ptr = buf_ptr + 32 - offset;
+    asm(STXVPX(5, %0, %1, 0)
+        : "+r" (buf_ptr)
+        : "r" (offset), "wa" (v0), "wa" (v1)
+        );
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v0[i] == buf[32 + 16 + i]);
+        else
+            assert(buf[48 + i] == v1[i]); // FIXME
+    }
+
+    for (i = 0; i < 16; i++) {
+        if (le)
+            assert(v1[i] == buf[32 + i]);
+        else
+            assert(buf[32 + i] == v0[i]); // FIXME
+    }
+
+    /* TODO: test signed offset */
+    /* TODO: PC-relative addresses */
+}
+
+#define do_test(testname) \
+    if (debug) \
+        fprintf(stderr, "-> running test: " #testname "\n"); \
+    test_##testname(); \
+
+int main(int argc, char **argv)
+{
+    le = (htole16(1) == 1);
+
+    if (argc > 1 && !strcmp(argv[1], "-d")) {
+        debug = true;
+    }
+
+    do_test(lxvp);
+    do_test(stxvp);
+    do_test(plxvp);
+    do_test(plxvp_cia);
+    do_test(pstxvp);
+    do_test(lxvpx);
+    do_test(stxvpx);
+
+    dprintf("All tests passed\n");
+    return 0;
+}
-- 
2.17.1


