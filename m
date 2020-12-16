Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DADE2DBD69
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:17:23 +0100 (CET)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSvy-0001mN-8m
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqY-0005OT-Jy; Wed, 16 Dec 2020 04:11:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqQ-0007TJ-O6; Wed, 16 Dec 2020 04:11:46 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG92jFW139587; Wed, 16 Dec 2020 04:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=uDGgCz42jUY4Fg7+euXEuO4bnMXILPjKnV5gzZ/IKmU=;
 b=VaT/+/BeKSuNEkovQNd4/ZHMPVEJSFjNmXoG5UfFA/k9Isz2LK+IwLaikjNLyKQodzq+
 9uGbgadL5KTRrby1iRFgyuDERkazLa2n3DE2AdszAUt0c+lrtaRNk0+6GAtrk7oPQsSZ
 keKi+4WWboxTTHvxrLnhzCe3Ftj6WmkmUjr3xZkATmI0IF2KaE04iY8Vx8vUyDhboFIb
 HIBgWYRyP659ao+/uPQ471496n1DG1jXAocGvBTHlFMF4lh44YeZGvAo5eLPd/HJftUO
 Jz+dDwM6Zwc713v3vZ60OlGCU5m+nTHlLcpbVEsrBA+T6bDXQtTS7MSGZaPeItRvMHVr Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35feshs3fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:30 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG93ZGP142052;
 Wed, 16 Dec 2020 04:11:30 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35feshs3fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:30 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG97Ig6011618;
 Wed, 16 Dec 2020 09:11:29 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 35cng9e0f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:11:29 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9BSB125166226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:11:28 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEDA67805C;
 Wed, 16 Dec 2020 09:11:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A67127805E;
 Wed, 16 Dec 2020 09:11:21 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:11:21 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] tests/tcg: Add tests for prefixed load/store FP
 instructions
Date: Wed, 16 Dec 2020 06:08:04 -0300
Message-Id: <20201216090804.58640-8-gromero@linux.ibm.com>
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

Signed-off-by: Michael Roth <mroth@lamentation.net>
[ gromero: - tweaks in debug output ]
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 tests/tcg/ppc64le/Makefile.target             |   4 +
 .../test-prefixed-load-store-fp.c             | 270 ++++++++++++++++++
 2 files changed, 274 insertions(+)
 create mode 100644 tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store-fp.c

diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index aaa43a83a7..c6eac40b74 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -9,6 +9,7 @@ VPATH += $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/instruction-tests
 QEMU_OPTS += -cpu power10
 
 PPC_TESTS = test-prefixed-load-store
+PPC_TESTS += test-prefixed-load-store-fp
 
 TESTS += $(PPC_TESTS)
 PPC_VSX_TESTS = test-paired-load-store-vsx
@@ -23,3 +24,6 @@ test-prefixed-load-store: test-prefixed-load-store.c
 
 test-paired-load-store-vsx: test-paired-load-store-vsx.c
 	gcc $< -o test-paired-load-store-vsx
+
+test-prefixed-load-store-fp: test-prefixed-load-store-fp.c
+	gcc $< -o test-prefixed-load-store-fp
diff --git a/tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store-fp.c b/tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store-fp.c
new file mode 100644
index 0000000000..baf8c3febf
--- /dev/null
+++ b/tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store-fp.c
@@ -0,0 +1,270 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <assert.h>
+#include <endian.h>
+#include <string.h>
+#include <float.h>
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
+#define PLFS(_FRT, _RA, _d0, _d1, _R) \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 48<<26 | (" #_FRT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PSTFS(_FRS, _RA, _d0, _d1, _R) \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 52<<26 | (" #_FRS ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PLFD(_FRT, _RA, _d0, _d1, _R) \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 50<<26 | (" #_FRT ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+#define PSTFD(_FRS, _RA, _d0, _d1, _R) \
+    ".long 1<<26 | 2<<24 | (" #_R ")<<20 | (" #_d0 ")\n" \
+    ".long 54<<26 | (" #_FRS ")<<21 | (" #_RA ")<<16 | (" #_d1 ")\n"
+
+void test_plfs(void) {
+    float dest = 0;
+    float dest_copy = 0;
+    float src = FLT_MAX;
+    void *src_ptr = &src;
+
+    /* sanity check against lfs */
+    asm(
+        "lfs %0, 0(%2)"
+        : "+f" (dest_copy)
+        : "f" (src), "r" (src_ptr));
+
+    asm(
+        PLFS(%0, %2, 0, 0, 0)
+        : "+f" (dest)
+        : "f" (src), "r" (src_ptr));
+
+    assert(dest == src);
+    assert(dest_copy == dest);
+}
+
+void test_pstfs(void) {
+    float dest = 0;
+    float dest_copy = 0;
+    float src = FLT_MAX;
+    void *dest_ptr = &dest;
+    void *dest_copy_ptr = &dest_copy;
+
+    /* sanity check against stfs */
+    asm(
+        "stfs %1, 0(%0)"
+        : "+r" (dest_copy_ptr)
+        : "f" (src));
+
+    asm(
+        PSTFS(%1, %0, 0, 0, 0)
+        : "+r" (dest_ptr)
+        : "f" (src));
+
+    assert(dest == src);
+    assert(dest_copy == dest);
+}
+
+void test_plfd(void) {
+    double dest = 0;
+    double dest_copy = 0;
+    double src = DBL_MAX;
+    void *src_ptr = &src;
+
+    /* sanity check against lfd */
+    asm(
+        "lfd %0, 0(%2)"
+        : "+d" (dest_copy)
+        : "d" (src), "r" (src_ptr));
+
+    asm(
+        PLFD(%0, %2, 0, 0, 0)
+        : "+d" (dest)
+        : "d" (src), "r" (src_ptr));
+
+    assert(dest == src);
+    assert(dest_copy == dest);
+}
+
+void test_pstfd(void) {
+    double dest = 0;
+    double dest_copy = 0;
+    double src = DBL_MAX;
+    void *dest_ptr = &dest;
+    void *dest_copy_ptr = &dest_copy;
+
+    /* sanity check against stfs */
+    asm(
+        "stfd %1, 0(%0)"
+        : "+r" (dest_copy_ptr)
+        : "f" (src));
+
+    asm(
+        PSTFD(%1, %0, 0, 0, 0)
+        : "+r" (dest_ptr)
+        : "f" (src));
+
+    assert(dest == src);
+    assert(dest_copy == dest);
+}
+
+void test_plfs_offset(void) {
+    float dest;
+    float src = FLT_MAX;
+    void *src_ptr = &src;
+    void *src_ptr_offset;
+
+    src_ptr_offset = src_ptr - 1;
+    dest = 0;
+    asm(
+        PLFS(%0, %2, 0, 0x1, 0)
+        : "=f" (dest)
+        : "f" (src), "r" (src_ptr_offset));
+    assert(dest == src);
+
+    src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+    dest = 0;
+    asm(
+        PLFS(%0, %2, 0x1FFFF, 0xFFFF, 0)
+        : "=f" (dest)
+        : "f" (src), "r" (src_ptr_offset));
+    assert(dest == src);
+
+    src_ptr_offset = src_ptr + 1;
+    dest = 0;
+    asm(
+        PLFS(%0, %2, 0x3FFFF, 0xFFFF, 0)
+        : "=f" (dest)
+        : "f" (src), "r" (src_ptr_offset));
+    assert(dest == src);
+}
+
+void test_pstfs_offset(void) {
+    float dest;
+    float src = FLT_MAX;
+    void *dest_ptr = &dest;
+    void *dest_ptr_offset;
+
+    dest_ptr_offset = dest_ptr - 1;
+    dest = 0;
+    asm(
+        PSTFS(%1, %0, 0x0, 0x1, 0)
+        : "+r" (dest_ptr_offset)
+        : "f" (src));
+    assert(dest == src);
+
+    dest_ptr_offset = dest_ptr - 0x1FFFFFFFF;
+    dest = 0;
+    asm(
+        PSTFS(%1, %0, 0x1FFFF, 0xFFFF, 0)
+        : "+r" (dest_ptr_offset)
+        : "f" (src));
+    assert(dest == src);
+
+    dest_ptr_offset = dest_ptr + 1;
+    dest = 0;
+    asm(
+        PSTFS(%1, %0, 0x3FFFF, 0xFFFF, 0)
+        : "+r" (dest_ptr_offset)
+        : "f" (src));
+    assert(dest == src);
+}
+
+void test_plfd_offset(void) {
+    double dest;
+    double src = DBL_MAX;
+    void *src_ptr = &src;
+    void *src_ptr_offset;
+
+    src_ptr_offset = src_ptr - 1;
+    dest = 0;
+    asm(
+        PLFD(%0, %2, 0, 0x1, 0)
+        : "+f" (dest)
+        : "f" (src), "r" (src_ptr_offset));
+    assert(dest == src);
+
+    src_ptr_offset = src_ptr - 0x1FFFFFFFF;
+    dest = 0;
+    asm(
+        PLFD(%0, %2, 0x1FFFF, 0xFFFF, 0)
+        : "+f" (dest)
+        : "f" (src), "r" (src_ptr_offset));
+    assert(dest == src);
+
+    src_ptr_offset = src_ptr + 1;
+    dest = 0;
+    asm(
+        PLFD(%0, %2, 0x3FFFF, 0xFFFF, 0)
+        : "+f" (dest)
+        : "f" (src), "r" (src_ptr_offset));
+    assert(dest == src);
+}
+
+void test_pstfd_offset(void) {
+    double dest;
+    double src = DBL_MAX;
+    void *dest_ptr = &dest;
+    void *dest_ptr_offset;
+
+    dest_ptr_offset = dest_ptr - 1;
+    dest = 0;
+    asm(
+        PSTFD(%1, %0, 0x0, 0x1, 0)
+        : "+r" (dest_ptr_offset)
+        : "f" (src));
+    assert(dest == src);
+
+    dest_ptr_offset = dest_ptr - 0x1FFFFFFFF;
+    dest = 0;
+    asm(
+        PSTFD(%1, %0, 0x1FFFF, 0xFFFF, 0)
+        : "+r" (dest_ptr_offset)
+        : "f" (src));
+    assert(dest == src);
+
+    dest_ptr_offset = dest_ptr + 1;
+    dest = 0;
+    asm(
+        PSTFD(%1, %0, 0x3FFFF, 0xFFFF, 0)
+        : "+r" (dest_ptr_offset)
+        : "f" (src));
+    assert(dest == src);
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
+    do_test(plfs);
+    do_test(pstfs);
+    do_test(plfd);
+    do_test(pstfd);
+
+    do_test(plfs_offset);
+    do_test(pstfs_offset);
+    do_test(plfd_offset);
+    do_test(pstfd_offset);
+
+    dprintf("All tests passed\n");
+    return 0;
+}
-- 
2.17.1


