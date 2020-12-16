Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF082DBD60
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:16:23 +0100 (CET)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSv0-0000IU-Jo
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSq2-00051C-7T; Wed, 16 Dec 2020 04:11:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSpx-0007JU-KT; Wed, 16 Dec 2020 04:11:13 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG92d18139041; Wed, 16 Dec 2020 04:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=w2m/yIIcGqQfTts/iNsLwFx+e0jO2r4JyyuHgTvWSGI=;
 b=GrCnW3K6DVtS3hru3g57CjHWqAHGMro0lbapy3zeg1R0B9yDr+qjewXgXFuY91Fyhm7D
 /NJ/N2/sL7aiex4xC7fzkfBotJJc4eIIb3VpQH3Un0782e5GpLTt7EQhlOeiW0LNGUad
 X3RSImkdoxZ95dqogrRBCzU8fm9hMHtW/mPbR/yflTgEHjjFzkG0sOTZOlh3yV4R6kKG
 iNSrpEXoSFuyhLn3MxdjIOIcfRJsM/rDQPMHppVgvkevArFo9bYlCU4q1QlwSufra1NC
 Bvon9iAjVFM4UkabpLYwlAt6EKjNq01UyXqdKQHuT2ie9zMFkFbeOuj6bFalldSZhExh 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35feshs31v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:01 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG93qGN142946;
 Wed, 16 Dec 2020 04:11:00 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35feshs31c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:00 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG96qn5019061;
 Wed, 16 Dec 2020 09:10:59 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 35d5260919-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:10:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9AwSa15860212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:10:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 090CB7805C;
 Wed, 16 Dec 2020 09:10:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8284978060;
 Wed, 16 Dec 2020 09:10:49 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:10:48 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] tests/tcg: Add tests for prefixed load/store
 instructions
Date: Wed, 16 Dec 2020 06:08:00 -0300
Message-Id: <20201216090804.58640-4-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216090804.58640-1-gromero@linux.ibm.com>
References: <20201216090804.58640-1-gromero@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This commit adds various tests to exercise the implementation of prefixed
load/store instructions on POWER10.

Signed-off-by: Michael Roth <mroth@lamentation.net>
[ gromero - fix to avoid alignment interrupt, don't cross 64-byte boundary
          - fix displacement for pl{bz,hz,ha,wz,wa,d} to skip branch insn.
          - tweaks in debug output
          - commit log ]
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 tests/tcg/ppc64                               |   1 +
 tests/tcg/ppc64le/Makefile.target             |  16 +
 .../test-prefixed-load-store.c                | 945 ++++++++++++++++++
 3 files changed, 962 insertions(+)
 create mode 120000 tests/tcg/ppc64
 create mode 100644 tests/tcg/ppc64le/Makefile.target
 create mode 100644 tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store.c

diff --git a/tests/tcg/ppc64 b/tests/tcg/ppc64
new file mode 120000
index 0000000000..e25d62b735
--- /dev/null
+++ b/tests/tcg/ppc64
@@ -0,0 +1 @@
+ppc64le/
\ No newline at end of file
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
new file mode 100644
index 0000000000..aabc046eb5
--- /dev/null
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -0,0 +1,16 @@
+# -*- Mode: makefile -*-
+#
+# PPC - included from tests/tcg/Makefile
+#
+
+EXTRA_RUNS+=run-test-mmap
+
+VPATH += $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/instruction-tests
+QEMU_OPTS += -cpu power10
+
+PPC_TESTS = test-prefixed-load-store
+
+TESTS += $(PPC_TESTS)
+
+test-prefixed-load-store: test-prefixed-load-store.c
+	gcc $< -o test-prefixed-load-store
diff --git a/tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store.c b/tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store.c
new file mode 100644
index 0000000000..f5948ada85
--- /dev/null
+++ b/tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store.c
@@ -0,0 +1,945 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <assert.h>
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
+#define PSTB(_RS, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1 << 26 | 2 << 24 | (" #_R ") << 20 | (" #_d0 ");" \
+    ".long 38 << 26 | (" #_RS ") << 21 | (" #_RA ") << 16 | (" #_d1 ");"
+#define PSTH(_RS, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1 << 26 | 2 << 24 | (" #_R ") << 20 | (" #_d0 ");" \
+    ".long 44 << 26 | (" #_RS ") << 21 | (" #_RA ") << 16 | (" #_d1 ");"
+#define PSTW(_RS, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1 << 26 | 2 << 24 | (" #_R ") << 20 | (" #_d0 ");" \
+    ".long 36 << 26 | (" #_RS ") << 21 | (" #_RA ") << 16 | (" #_d1 ");"
+#define PSTD(_RS, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1 << 26 | (" #_R ") << 20 | (" #_d0 ");" \
+    ".long 61 << 26 | (" #_RS ") << 21 | (" #_RA ") << 16 | (" #_d1 ");"
+
+#define PST_CALL(op, src, dest_ptr, offset_upper18, offset_lower16, r) \
+    do {                                                               \
+        asm(                                                           \
+            op(%1, %0, offset_upper18, offset_lower16, r)              \
+            : "+r" (dest_ptr)                                          \
+            : "r" (src));                                              \
+    } while (0);
+
+void check_pst(uint64_t src, uint64_t dest, uint64_t dest_orig, int width) {
+    uint64_t dest_orig_mask;
+    uint64_t src_mask = (width == 8) ? -1UL : (1UL << (8*width)) - 1;
+
+    if (le) {
+        dest_orig_mask = -1UL << (8*width);
+        assert(dest == ((dest_orig & dest_orig_mask) | ((src & src_mask))));
+    } else {
+        dest_orig_mask = (-1UL << (8*width)) >> (8*width);
+        assert(dest == ((dest_orig & dest_orig_mask) | ((src & src_mask) << (8*(8-width)))));
+    }
+}
+
+void test_pst_offset(int width) {
+    uint64_t dest_orig = 0x2726252423222120;
+    uint64_t src = 0x1716151413111110;
+    uint64_t dest = dest_orig;
+    void *dest_ptr, *dest_ptr_offset;
+
+    dest_ptr = &dest;
+
+    switch (width) {
+    case 1:
+        dest_ptr_offset = dest_ptr - 1;
+        PST_CALL(PSTB, src, dest_ptr_offset, 0, 1, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0xFFFF;
+        PST_CALL(PSTB, src, dest_ptr_offset, 0, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr + 1;
+        PST_CALL(PSTB, src, dest_ptr_offset, 0x3FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0x1FFFFFFFF;
+        PST_CALL(PSTB, src, dest_ptr_offset, 0x1FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        break;
+    case 2:
+        dest_ptr_offset = dest_ptr - 1;
+        PST_CALL(PSTH, src, dest_ptr_offset, 0, 1, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0xFFFF;
+        PST_CALL(PSTH, src, dest_ptr_offset, 0, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr + 1;
+        PST_CALL(PSTH, src, dest_ptr_offset, 0x3FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0x1FFFFFFFF;
+        PST_CALL(PSTH, src, dest_ptr_offset, 0x1FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        break;
+    case 4:
+        dest_ptr_offset = dest_ptr - 1;
+        PST_CALL(PSTW, src, dest_ptr_offset, 0, 1, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0xFFFF;
+        PST_CALL(PSTW, src, dest_ptr_offset, 0, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr + 1;
+        PST_CALL(PSTW, src, dest_ptr_offset, 0x3FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0x1FFFFFFFF;
+        PST_CALL(PSTW, src, dest_ptr_offset, 0x1FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        break;
+    case 8:
+        dest_ptr_offset = dest_ptr - 1;
+        PST_CALL(PSTD, src, dest_ptr_offset, 0, 1, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0xFFFF;
+        PST_CALL(PSTD, src, dest_ptr_offset, 0, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr + 1;
+        PST_CALL(PSTD, src, dest_ptr_offset, 0x3FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        dest_ptr_offset = dest_ptr - 0x1FFFFFFFF;
+        PST_CALL(PSTD, src, dest_ptr_offset, 0x1FFFF, 0xFFFF, 0);
+        check_pst(src, dest, dest_orig, width);
+        break;
+    default:
+        assert(false);
+    }
+}
+
+void test_pst(int width) {
+    uint64_t dest_orig = 0x2726252423222120;
+    uint64_t src = 0x1716151413111110;
+    uint64_t dest, dest_copy;
+    void *dest_ptr = &dest;
+    void *dest_copy_ptr = &dest_copy;
+
+    /* sanity check against non-prefixed ops */
+    dest_copy = dest_orig;
+    switch (width) {
+    case 1:
+        asm(
+            "stb %1, 0(%0)"
+            : "+r" (dest_copy_ptr)
+            : "r" (src));
+        break;
+    case 2:
+        asm(
+            "sth %1, 0(%0)"
+            : "+r" (dest_copy_ptr)
+            : "r" (src));
+        break;
+    case 4:
+        asm(
+            "stw %1, 0(%0)"
+            : "+r" (dest_copy_ptr)
+            : "r" (src));
+        break;
+    case 8:
+        asm(
+            "std %1, 0(%0)"
+            : "+r" (dest_copy_ptr)
+            : "r" (src));
+        break;
+    default:
+        assert(false);
+    }
+
+    dest = dest_orig;
+    switch (width) {
+    case 1:
+        PST_CALL(PSTB, src, dest_ptr, 0, 0, 0);
+        break;
+    case 2:
+        PST_CALL(PSTH, src, dest_ptr, 0, 0, 0);
+        break;
+    case 4:
+        PST_CALL(PSTW, src, dest_ptr, 0, 0, 0);
+        break;
+    case 8:
+        PST_CALL(PSTD, src, dest_ptr, 0, 0, 0);
+        break;
+    default:
+        assert(false);
+    }
+
+    assert(dest == dest_copy);
+    check_pst(src, dest, dest_orig, width);
+}
+
+void test_pstb(void) {
+    test_pst(1);
+    test_pst_offset(1);
+}
+
+void test_psth(void) {
+    test_pst(2);
+    test_pst_offset(2);
+}
+
+void test_pstw(void) {
+    test_pst(4);
+    test_pst_offset(4);
+}
+
+void test_pstd(void) {
+    test_pst(8);
+    test_pst_offset(8);
+}
+
+#define PLBZ(_RT, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 34<<26 | (" #_RT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PLHZ(_RT, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 40<<26 | (" #_RT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PLHA(_RT, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 42<<26 | (" #_RT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PLWZ(_RT, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 32<<26 | (" #_RT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PLWA(_RT, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1<<26 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 41<<26 | (" #_RT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PLD(_RT, _RA, _d0, _d1, _R) \
+    ".align 6;" \
+    ".long 1<<26 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 57<<26 | (" #_RT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+
+#define PL_CALL(op, src, src_ptr, dest, offset_upper18, offset_lower16, r)  \
+    do {                                                                    \
+        asm(                                                                \
+            op(%0, %2, offset_upper18, offset_lower16, r)                   \
+            : "+r" (dest)                                                   \
+            : "r" (src), "r" (src_ptr));                                    \
+    } while (0);
+
+void check_pl_z(uint64_t src, uint64_t dest, int width) {
+    uint64_t src_mask;
+
+    if (le) {
+        src_mask = (width == 8) ? -1UL : (1UL << (8*width)) - 1;
+        assert(dest == (src & src_mask));
+    } else {
+        src_mask = (width == 8) ? -1UL : -1UL << (8*(8-width));
+        assert(dest == (src & src_mask) >> (8*(8-width)));
+    }
+}
+
+void check_pl_a(uint64_t src, uint64_t dest, int width) {
+    uint64_t src_mask, sign_mask;
+
+    /* TODO: docs suggest testing high-order bit of src byte/halfword/etc, but
+     * QEMU seems to use high-order bit of src double in every case?
+     *
+     * but for le, it's based on the former? afa qemu goes???
+     */
+    if (le) {
+        sign_mask = (src & (1UL << (width*8-1))) ? -1UL << (8*width) : 0;
+    } else {
+        sign_mask = (src & (1UL << 63)) ? -1UL << (8*width) : 0;
+    }
+
+    if (le) {
+        src_mask = (width == 8) ? -1UL : (1UL << (8*width)) - 1;
+        assert(dest == ((src & src_mask) | sign_mask));
+    } else {
+        src_mask = (width == 8) ? -1UL : -1UL << (8*(8-width));
+        assert(dest == (((src & src_mask) >> (8*(8-width))) | sign_mask));
+    }
+}
+
+void test_pl_a(int width, uint64_t src, uint64_t dest_orig) {
+    uint64_t dest = 0, dest_copy;
+    void *src_ptr = &src;
+    void *src_ptr_offset;
+
+    /* sanity check against non-prefixed ops */
+    dest_copy = dest_orig;
+
+    switch (width) {
+    case 2:
+        asm(
+            "lha %0, 0(%2)"
+            : "+r" (dest_copy)
+            : "r" (src), "r" (src_ptr));
+        break;
+    case 4:
+        asm(
+            "lwa %0, 0(%2)"
+            : "+r" (dest_copy)
+            : "r" (src), "r" (src_ptr));
+        break;
+    case 8:
+        asm(
+            "ld %0, 0(%2)"
+            : "+r" (dest_copy)
+            : "r" (src), "r" (src_ptr));
+        break;
+    default:
+        assert(false);
+    }
+
+    switch (width) {
+    case 2:
+        dest = dest_orig;
+        src_ptr_offset = src_ptr;
+        PL_CALL(PLHA, src, src_ptr_offset, dest, 0, 0, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 1;
+        PL_CALL(PLHA, src, src_ptr_offset, dest, 0, 1, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0xFFFF;
+        PL_CALL(PLHA, src, src_ptr_offset, dest, 0, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr + 1;
+        PL_CALL(PLHA, src, src_ptr_offset, dest, 0x3FFFF, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+        PL_CALL(PLHA, src, src_ptr_offset, dest, 0x1FFFF, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        break;
+    case 4:
+        dest = dest_orig;
+        src_ptr_offset = src_ptr;
+        PL_CALL(PLWA, src, src_ptr_offset, dest, 0, 0, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 1;
+        PL_CALL(PLWA, src, src_ptr_offset, dest, 0, 1, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0xFFFF;
+        PL_CALL(PLWA, src, src_ptr_offset, dest, 0, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr + 1;
+        PL_CALL(PLWA, src, src_ptr_offset, dest, 0x3FFFF, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+        PL_CALL(PLWA, src, src_ptr_offset, dest, 0x1FFFF, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        break;
+    case 8:
+        dest = dest_orig;
+        src_ptr_offset = src_ptr;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0, 0, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 1;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0, 1, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0xFFFF;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr + 1;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0x3FFFF, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0x1FFFF, 0xFFFF, 0);
+        check_pl_a(src, dest, width);
+        break;
+    default:
+        assert(false);
+    }
+
+    assert(dest == dest_copy);
+}
+
+void test_pl_z(int width, uint64_t src, uint64_t dest_orig) {
+    uint64_t dest = 0, dest_copy;
+    void *src_ptr = &src;
+    void *src_ptr_offset;
+
+    /* sanity check against non-prefixed ops */
+    dest_copy = dest_orig;
+
+    switch (width) {
+    case 1:
+        asm(
+            "lbz %0, 0(%2)"
+            : "+r" (dest_copy)
+            : "r" (src), "r" (src_ptr));
+        break;
+    case 2:
+        asm(
+            "lhz %0, 0(%2)"
+            : "+r" (dest_copy)
+            : "r" (src), "r" (src_ptr));
+        break;
+    case 4:
+        asm(
+            "lwz %0, 0(%2)"
+            : "+r" (dest_copy)
+            : "r" (src), "r" (src_ptr));
+        break;
+    case 8:
+        asm(
+            "ld %0, 0(%2)"
+            : "+r" (dest_copy)
+            : "r" (src), "r" (src_ptr));
+        break;
+    default:
+        assert(false);
+    }
+
+    dest = dest_orig;
+    switch (width) {
+    case 1:
+        dest = dest_orig;
+        src_ptr_offset = src_ptr;
+        PL_CALL(PLBZ, src, src_ptr_offset, dest, 0, 0, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 1;
+        PL_CALL(PLBZ, src, src_ptr_offset, dest, 0, 1, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0xFFFF;
+        PL_CALL(PLBZ, src, src_ptr_offset, dest, 0, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr + 1;
+        PL_CALL(PLBZ, src, src_ptr_offset, dest, 0x3FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+        PL_CALL(PLBZ, src, src_ptr_offset, dest, 0x1FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        break;
+    case 2:
+        dest = dest_orig;
+        src_ptr_offset = src_ptr;
+        PL_CALL(PLHZ, src, src_ptr_offset, dest, 0, 0, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 1;
+        PL_CALL(PLHZ, src, src_ptr_offset, dest, 0, 1, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0xFFFF;
+        PL_CALL(PLHZ, src, src_ptr_offset, dest, 0, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr + 1;
+        PL_CALL(PLHZ, src, src_ptr_offset, dest, 0x3FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+        PL_CALL(PLHZ, src, src_ptr_offset, dest, 0x1FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        break;
+    case 4:
+        dest = dest_orig;
+        src_ptr_offset = src_ptr;
+        PL_CALL(PLWZ, src, src_ptr_offset, dest, 0, 0, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 1;
+        PL_CALL(PLWZ, src, src_ptr_offset, dest, 0, 1, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0xFFFF;
+        PL_CALL(PLWZ, src, src_ptr_offset, dest, 0, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr + 1;
+        PL_CALL(PLWZ, src, src_ptr_offset, dest, 0x3FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+        PL_CALL(PLWZ, src, src_ptr_offset, dest, 0x1FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        break;
+    case 8:
+        dest = dest_orig;
+        src_ptr_offset = src_ptr;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0, 0, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 1;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0, 1, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0xFFFF;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr + 1;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0x3FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        dest = dest_orig;
+        src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+        PL_CALL(PLD, src, src_ptr_offset, dest, 0x1FFFF, 0xFFFF, 0);
+        check_pl_z(src, dest, width);
+        break;
+    default:
+        assert(false);
+    }
+
+    assert(dest == dest_copy);
+}
+
+void test_plbz(void) {
+    test_pl_z(1, 0x8716151413111110, 0x0726252423222120);
+    test_pl_z(1, 0x1716151413111110, 0x0726252423222120);
+    test_pl_z(1, 0x1716151413111180, 0x0726252423222120);
+}
+
+void test_plhz(void) {
+    test_pl_z(2, 0x8716151483111110, 0x0726252423222120);
+    test_pl_z(1, 0x1716151413111110, 0x0726252423222120);
+    test_pl_z(1, 0x1716151413118110, 0x0726252423222120);
+}
+
+void test_plha(void) {
+    test_pl_a(2, 0x8716151483111110, 0x0726252423222120);
+    test_pl_a(2, 0x1716151413111110, 0x0726252423222120);
+    test_pl_a(2, 0x1716151413118110, 0x0726252423222120);
+}
+
+void test_plwz(void) {
+    test_pl_z(4, 0x8716151483111110, 0x0726252423222120);
+    test_pl_z(4, 0x1716151413111110, 0x0726252423222120);
+    test_pl_z(4, 0x1716151483111110, 0x0726252423222120);
+}
+
+void test_plwa(void) {
+    test_pl_a(4, 0x8716151483111110, 0x0726252423222120);
+    test_pl_a(4, 0x1716151413111110, 0x0726252423222120);
+    test_pl_a(4, 0x1716151483111110, 0x0726252423222120);
+}
+
+void test_pld(void) {
+    test_pl_a(8, 0x8716151483111110, 0x0726252423222120);
+    test_pl_a(8, 0x1716151413111110, 0x0726252423222120);
+}
+
+#define QUADWORD_HI 0x0f0e0d0c0b0a0908
+#define QUADWORD_LO 0x0706050403020100
+
+#define PSTQ(_RS, _RA, _d0, _d1, _R) \
+    ".long 1<<26 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 60<<26 | (" #_RS ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+
+void test_pstq(void) {
+    register uint64_t rs0 asm("r22");
+    register uint64_t rs1 asm("r23");
+    uint64_t storage[2] = { 0 };
+    void *src_ptr = storage;
+
+    if (le) {
+        /*
+         * MEM(EA, 16) <- RSp+1||RSp
+         * where RQ[15..0] = RSp+1||RSp = rs1[7..0] || rs0[7..0]
+         */
+        rs0 = QUADWORD_LO;
+        rs1 = QUADWORD_HI;
+    } else {
+        /*
+         * MEM(EA, 16) <- RSp||RSp+1
+         * where RQ[0..15] = RSp||RSp+1 = rs0[0..7] || rs1[0..7]
+         */
+        rs0 = QUADWORD_HI;
+        rs1 = QUADWORD_LO;
+    }
+
+    asm(
+        PSTQ(22, %0, 0, 0, 0)
+        : "+r" (src_ptr)
+        : "r" (rs0), "r" (rs1));
+
+    if (le) {
+        assert(storage[0] == QUADWORD_LO);
+        assert(storage[1] == QUADWORD_HI);
+    } else {
+        assert(storage[0] == QUADWORD_HI);
+        assert(storage[1] == QUADWORD_LO);
+    }
+
+    /* sanity check against stq */
+    asm(
+        "stq 22, 0(%0)"
+        : "+r" (src_ptr)
+        : "r" (rs0), "r" (rs1));
+
+    if (le) {
+        assert(storage[0] == QUADWORD_HI);
+        assert(storage[1] == QUADWORD_LO);
+    } else {
+        assert(storage[0] == QUADWORD_HI);
+        assert(storage[1] == QUADWORD_LO);
+    }
+}
+
+#define PLQ(_RT, _RA, _d0, _d1, _R) \
+    ".long 1<<26 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 56<<26 | (" #_RT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+
+void test_plq(void) {
+    register uint64_t rdest0 asm("r20") = 7;
+    register uint64_t rdest1 asm("r21") = 8;
+    uint64_t dest0a = 7;
+    uint64_t dest0b = 7;
+    uint64_t dest1a = 7;
+    uint64_t dest1b = 7;
+    uint8_t src[16];
+    void *src_ptr = &src;
+    int i;
+
+    for (i = 0; i < 16; i++) {
+        src[i] = i;
+    }
+
+    /*
+     * PLQ:
+     *
+     * loads to RTp+1||RTp for little-endian
+     *          RTp||RTp+1 for big-endian
+     *
+     * so we'd expect:
+     *
+     * value: 0x0f0e..08 || 0706..00
+     *
+     * little-endian:
+     *
+     * uint64_t storage[2] = { 0x0706050403020100,
+     *                         0x0f0e0d0c0b0a0908 };
+     * plq 20,0(storage):
+     *   r21[0..7]         || r20[0..7]
+     *   0x0001020304050607   0x08090a0b0c0d0e0f
+     *
+     * big-endian:
+     *
+     * uint64_t storage[2] = { 0x0f0e0d0c0b0a0908,
+     *                         0x0706050403020100 };
+     *
+     * plq 20,0(storage):
+     *   r20[0..7]         || r21[0..7]
+     *   0x0f0e0d0c0b0a0908   0x0706050403020100
+     *
+     * Note: According to spec, for GPRs at least, GPR byte ordering is always
+     * big-endian with regard to loads/stores. Hence the need to "reverse load"
+     * in the case of loading little-endian value into a register, as opposed to
+     * simply assuming both the storage and the register would both use
+     * host-endian.
+     *
+     * But, this is just as far as the documentation goes, which is always
+     * left-to-right/big-endian byte ordering. The actual hardware register
+     * stores byte 0 in a little-endian to value to byte 0 in the register, so
+     * registers are loaded host-endian even though the documentation sort of
+     * suggests otherwise in some cases.
+     */
+    asm(
+        PLQ(20, %2, 0, 0, 0)
+        : "=r" (rdest0), "=r" (rdest1)
+        : "r" (src_ptr));
+
+    dest0a = rdest0;
+    dest1a = rdest1;
+
+    /* loads to dest0||dest1 for both endians */
+    asm(
+        "lq 20, 0(%2)"
+        : "=r" (rdest0), "=r" (rdest1)
+        : "r" (src_ptr));
+
+    dest0b = rdest0;
+    dest1b = rdest1;
+
+    if (le) {
+        assert(dest0a == ((uint64_t*)src)[0]);
+        assert(dest1a == ((uint64_t*)src)[1]);
+        assert(dest0a == dest1b);
+        assert(dest1a == dest0b);
+    } else {
+        assert(dest0a == ((uint64_t*)src)[0]);
+        assert(dest1a == ((uint64_t*)src)[1]);
+        assert(dest0a == dest0b);
+        assert(dest1a == dest1b);
+    }
+
+    /* TODO: PC-relative and negative offsets just like all the others */
+}
+
+void test_plq2(void) {
+    register uint64_t rdest0 asm("r20") = 7;
+    register uint64_t rdest1 asm("r21") = 8;
+    register uint64_t rdest0b asm("r22") = 7;
+    register uint64_t rdest1b asm("r23") = 8;
+    uint64_t storage[2];
+    void *src_ptr = storage;
+
+    if (le) {
+        storage[0] = QUADWORD_LO;
+        storage[1] = QUADWORD_HI;
+    } else {
+        storage[0] = QUADWORD_HI;
+        storage[1] = QUADWORD_LO;
+    }
+
+    /*
+     * PLQ:
+     *
+     * loads to RTp+1||RTp for little-endian
+     *          RTp||RTp+1 for big-endian
+     *
+     * loads into register using host-endian encoding
+     * calls it "reverse-order" for little-endian, but
+     * the byte-ordering is switched based on endianess
+     * so we still copy mem[0] to reg[0], etc., in all
+     * cases. i.e. storage endian encoding is maintained
+     * in the register encoding after load, even though
+     * documentation might still call it reverse and
+     * reference left-to-right byte ordering in some
+     * cases even for little-endian
+     *
+     * so we'd expect:
+     *
+     * value: 0x0f0e..08 || 0706..00
+     *
+     * little-endian:
+     *
+     * uint64_t storage[2] = { 0x0706050403020100,
+     *                         0x0f0e0d0c0b0a0908 };
+     * plq 20,0(storage):
+     *   RTquad[15..0] = r21[7..0] || r20[7..0]
+     *   r21[7..0]         || r20[7..0]
+     *   0x0f0e0d0c0b0a0908   0x0706050403020100
+     *
+     * big-endian:
+     *
+     * uint64_t storage[2] = { 0x0f0e0d0c0b0a0908,
+     *                         0x0706050403020100 };
+     *
+     * plq 20,0(storage):
+     *   RTquad[0..15] = r20[0..7] || r21[0..7]
+     *   r20[0..7]         || r21[0..7]
+     *   0x0f0e0d0c0b0a0908   0x0706050403020100
+     **/
+    asm(
+        PLQ(20, %2, 0, 0, 0)
+        : "=r" (rdest0), "=r" (rdest1)
+        : "r" (src_ptr));
+
+    if (le) {
+        assert(rdest0 == QUADWORD_LO);
+        assert(rdest1 == QUADWORD_HI);
+    } else {
+        assert(rdest0 == QUADWORD_HI);
+        assert(rdest1 == QUADWORD_LO);
+    }
+
+    /* sanity check against lq */
+    asm(
+        "lq 22, 0(%2)"
+        : "=r" (rdest0b), "=r" (rdest1b)
+        : "r" (src_ptr));
+
+    if (le) {
+        assert(rdest0 == rdest1b);
+        assert(rdest1 == rdest0b);
+    } else {
+        assert(rdest0 == rdest0b);
+        assert(rdest1 == rdest1b);
+    }
+}
+
+void test_plbz_cia(void) {
+    uint64_t dest = 0;
+
+    asm(
+        PLBZ(%0, 0, 0, 8 /* skip plbz */ + 4 /* skip b */, 1)
+        "b 1f\n"
+        ".byte 0x1a\n"
+        ".byte 0x1b\n"
+        ".byte 0x1c\n"
+        ".byte 0x1d\n"
+        "1: nop\n"
+        : "+r" (dest));
+
+    assert(dest == 0x1a);
+}
+
+void test_plhz_cia(void) {
+    uint64_t dest = 0;
+
+    asm(
+        PLHZ(%0, 0, 0, 8 /* skip plhz */ + 4 /* skip b */, 1)
+        "b 1f\n"
+        ".byte 0x1a\n"
+        ".byte 0x1b\n"
+        ".byte 0x1c\n"
+        ".byte 0x1d\n"
+        "1: nop\n"
+        : "+r" (dest));
+
+    if (le) {
+        assert(dest == 0x1b1a);
+    } else {
+        assert(dest == 0x1a1b);
+    }
+}
+
+void test_plha_cia(void) {
+    uint64_t dest = 0;
+
+    asm(
+        PLHA(%0, 0, 0, 8 /* skip plha */ + 4 /* skip b */, 1)
+        "b 1f\n"
+        ".byte 0x8a\n"
+        ".byte 0x8b\n"
+        ".byte 0x1c\n"
+        ".byte 0x1d\n"
+        ".byte 0x2a\n"
+        ".byte 0x2b\n"
+        ".byte 0x2c\n"
+        ".byte 0x2d\n"
+        "1: nop\n"
+        : "+r" (dest));
+
+    if (le) {
+        assert(dest == 0xFFFFFFFFFFFF8b8a);
+    } else {
+        assert(dest == 0xFFFFFFFFFFFF8a8b);
+    }
+}
+
+void test_plwz_cia(void) {
+    uint64_t dest = 0;
+
+    asm(
+        PLWZ(%0, 0, 0, 8 /* skip plwz */ + 4 /* skip b */, 1)
+        "b 1f\n"
+        ".byte 0x1a\n"
+        ".byte 0x1b\n"
+        ".byte 0x1c\n"
+        ".byte 0x1d\n"
+        "1: nop\n"
+        : "+r" (dest));
+
+    if (le) {
+        assert(dest == 0x1d1c1b1a);
+    } else {
+        assert(dest == 0x1a1b1c1d);
+    }
+}
+
+void test_plwa_cia(void) {
+    uint64_t dest = 0;
+
+    asm(
+        PLWA(%0, 0, 0, 8 /* skip plwa */ + 4 /* skip b */, 1)
+        "b 1f\n"
+        ".byte 0x8a\n"
+        ".byte 0x1b\n"
+        ".byte 0x1c\n"
+        ".byte 0x8d\n"
+        ".byte 0x2a\n"
+        ".byte 0x2b\n"
+        ".byte 0x2c\n"
+        ".byte 0x2d\n"
+        "1: nop\n"
+        : "+r" (dest));
+
+    if (le) {
+        assert(dest == 0xFFFFFFFF8d1c1b8a);
+    } else {
+        assert(dest == 0xFFFFFFFF8a1b1c8d);
+    }
+}
+
+void test_pld_cia(void) {
+    uint64_t dest = 0;
+
+    asm(
+        PLD(%0, 0, 0, 8 /* skip pld */ + 4 /* skip b */, 1)
+        "b 1f\n"
+        ".byte 0x1a\n"
+        ".byte 0x1b\n"
+        ".byte 0x1c\n"
+        ".byte 0x1d\n"
+        ".byte 0x2a\n"
+        ".byte 0x2b\n"
+        ".byte 0x2c\n"
+        ".byte 0x2d\n"
+        "1: nop\n"
+        : "+r" (dest));
+
+    if (le) {
+        assert(dest == 0x2d2c2b2a1d1c1b1a);
+    } else {
+        assert(dest == 0x1a1b1c1d2a2b2c2d);
+    }
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
+    do_test(pstb);
+    do_test(psth);
+    do_test(pstw);
+    do_test(pstd);
+    do_test(plbz);
+    do_test(plhz);
+    do_test(plha);
+    do_test(psth);
+    do_test(pld);
+
+    do_test(pstq);
+    do_test(plq);
+    do_test(plq2);
+
+    do_test(plbz_cia);
+    do_test(plhz_cia);
+    do_test(plha_cia);
+    do_test(plwz_cia);
+    do_test(plwa_cia);
+    do_test(pld_cia);
+
+    dprintf("All tests passed\n");
+    return 0;
+}
-- 
2.17.1


