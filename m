Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844E655022
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 13:06:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8gmm-0002qQ-DC; Fri, 23 Dec 2022 07:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p8gme-0002pM-Tz
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 07:04:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p8gma-0005Gl-L7
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 07:04:16 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BNBfm7l024440; Fri, 23 Dec 2022 12:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wQSLHGdekAyIUxn7f/fIXF52Tq/8tz4sgCpAk1cpfcc=;
 b=O+tOfR+/wFl+RVphcQXsu+rgFuY4uo7A0HZ8XLhwLbAkpXIM+w5CaR76D86y9pq/EG2u
 K1lcKOvTnmJnzWcohte/RcuhcF2k9uN4+l1RNs6CBsFqQpeeecZtNyyIdV1ExUPx/+uP
 fjvqiFeZumWH9o8O6UhqXgmcokyXcxnYq8CKRR0JNJSFlSHuNaNTl20i+4X8BWhjdvZ0
 EKBXqXgAzM4Ayn3YqMS+ZNeHPjdg301zk+qBmUO9VVYfEjJyiWAguBp2vEDYQabaTO7S
 Wq7AS58mK5VMJX/SPUEj1cQEy3goYCj4MpqC4OJLqitLH8m0RLM+lMQOX+bPntHqAEMF iA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mnbparft9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 12:03:07 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BN9H9ew001740;
 Fri, 23 Dec 2022 12:03:05 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3mh6yy61mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 12:03:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BNC315Q31130004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Dec 2022 12:03:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BB5720063;
 Fri, 23 Dec 2022 12:03:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E3352004D;
 Fri, 23 Dec 2022 12:03:01 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.46.120])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 23 Dec 2022 12:03:01 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/tcg/multiarch: add vma-pthread.c
Date: Fri, 23 Dec 2022 13:02:52 +0100
Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223115348.tgfwdlektsulebxk@heavy>
References: <20221223115348.tgfwdlektsulebxk@heavy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u0Xh4DSVYSTbei4CzxNiqNVMj9QN4oba
X-Proofpoint-GUID: u0Xh4DSVYSTbei4CzxNiqNVMj9QN4oba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_05,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a test that locklessly changes and exercises page protection bits
from various threads. This helps catch race conditions in the VMA
handling.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/Makefile.target  |   3 +
 tests/tcg/multiarch/munmap-pthread.c |  16 +--
 tests/tcg/multiarch/nop_func.h       |  25 ++++
 tests/tcg/multiarch/vma-pthread.c    | 185 +++++++++++++++++++++++++++
 4 files changed, 214 insertions(+), 15 deletions(-)
 create mode 100644 tests/tcg/multiarch/nop_func.h
 create mode 100644 tests/tcg/multiarch/vma-pthread.c

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 5f0fee1aadb..e7213af4925 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -39,6 +39,9 @@ signals: LDFLAGS+=-lrt -lpthread
 munmap-pthread: CFLAGS+=-pthread
 munmap-pthread: LDFLAGS+=-pthread
 
+vma-pthread: CFLAGS+=-pthread
+vma-pthread: LDFLAGS+=-pthread
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
diff --git a/tests/tcg/multiarch/munmap-pthread.c b/tests/tcg/multiarch/munmap-pthread.c
index d7143b00d5f..1c79005846d 100644
--- a/tests/tcg/multiarch/munmap-pthread.c
+++ b/tests/tcg/multiarch/munmap-pthread.c
@@ -7,21 +7,7 @@
 #include <sys/mman.h>
 #include <unistd.h>
 
-static const char nop_func[] = {
-#if defined(__aarch64__)
-    0xc0, 0x03, 0x5f, 0xd6,     /* ret */
-#elif defined(__alpha__)
-    0x01, 0x80, 0xFA, 0x6B,     /* ret */
-#elif defined(__arm__)
-    0x1e, 0xff, 0x2f, 0xe1,     /* bx lr */
-#elif defined(__riscv)
-    0x67, 0x80, 0x00, 0x00,     /* ret */
-#elif defined(__s390__)
-    0x07, 0xfe,                 /* br %r14 */
-#elif defined(__i386__) || defined(__x86_64__)
-    0xc3,                       /* ret */
-#endif
-};
+#include "nop_func.h"
 
 static void *thread_mmap_munmap(void *arg)
 {
diff --git a/tests/tcg/multiarch/nop_func.h b/tests/tcg/multiarch/nop_func.h
new file mode 100644
index 00000000000..f714d210000
--- /dev/null
+++ b/tests/tcg/multiarch/nop_func.h
@@ -0,0 +1,25 @@
+/*
+ * No-op functions that can be safely copied.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef NOP_FUNC_H
+#define NOP_FUNC_H
+
+static const char nop_func[] = {
+#if defined(__aarch64__)
+    0xc0, 0x03, 0x5f, 0xd6,     /* ret */
+#elif defined(__alpha__)
+    0x01, 0x80, 0xFA, 0x6B,     /* ret */
+#elif defined(__arm__)
+    0x1e, 0xff, 0x2f, 0xe1,     /* bx lr */
+#elif defined(__riscv)
+    0x67, 0x80, 0x00, 0x00,     /* ret */
+#elif defined(__s390__)
+    0x07, 0xfe,                 /* br %r14 */
+#elif defined(__i386__) || defined(__x86_64__)
+    0xc3,                       /* ret */
+#endif
+};
+
+#endif
diff --git a/tests/tcg/multiarch/vma-pthread.c b/tests/tcg/multiarch/vma-pthread.c
new file mode 100644
index 00000000000..c405cd46329
--- /dev/null
+++ b/tests/tcg/multiarch/vma-pthread.c
@@ -0,0 +1,185 @@
+/*
+ * Test that VMA updates do not race.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Map a contiguous chunk of RWX memory. Split it into 8 equally sized
+ * regions, each of which is guaranteed to have a certain combination of
+ * protection bits set.
+ *
+ * Reader, writer and executor threads perform the respective operations on
+ * pages, which are guaranteed to have the respective protection bit set.
+ * Two mutator threads change the non-fixed protection bits randomly.
+ */
+#include <assert.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include "nop_func.h"
+
+#define PAGE_IDX_BITS 10
+#define PAGE_COUNT (1 << PAGE_IDX_BITS)
+#define PAGE_IDX_MASK (PAGE_COUNT - 1)
+#define REGION_IDX_BITS 3
+#define PAGE_IDX_R_MASK (1 << 7)
+#define PAGE_IDX_W_MASK (1 << 8)
+#define PAGE_IDX_X_MASK (1 << 9)
+#define REGION_MASK (PAGE_IDX_R_MASK | PAGE_IDX_W_MASK | PAGE_IDX_X_MASK)
+#define PAGES_PER_REGION (1 << (PAGE_IDX_BITS - REGION_IDX_BITS))
+
+struct context {
+    int pagesize;
+    char *ptr;
+    int dev_null_fd;
+    volatile int mutator_count;
+};
+
+static void *thread_read(void *arg)
+{
+    struct context *ctx = arg;
+    ssize_t sret;
+    size_t i, j;
+    int ret;
+
+    for (i = 0; ctx->mutator_count; i++) {
+        j = (i & PAGE_IDX_MASK) | PAGE_IDX_R_MASK;
+        /* Read directly. */
+        ret = memcmp(&ctx->ptr[j * ctx->pagesize], nop_func, sizeof(nop_func));
+        assert(ret == 0);
+        /* Read indirectly. */
+        sret = write(ctx->dev_null_fd, &ctx->ptr[j * ctx->pagesize], 1);
+        assert(sret == 1);
+    }
+
+    return NULL;
+}
+
+static void *thread_write(void *arg)
+{
+    struct context *ctx = arg;
+    struct timespec *ts;
+    size_t i, j;
+    int ret;
+
+    for (i = 0; ctx->mutator_count; i++) {
+        j = (i & PAGE_IDX_MASK) | PAGE_IDX_W_MASK;
+        /* Write directly. */
+        memcpy(&ctx->ptr[j * ctx->pagesize], nop_func, sizeof(nop_func));
+        /* Write using a syscall. */
+        ts = (struct timespec *)(&ctx->ptr[(j + 1) * ctx->pagesize] -
+                                 sizeof(struct timespec));
+        ret = clock_gettime(CLOCK_REALTIME, ts);
+        assert(ret == 0);
+    }
+
+    return NULL;
+}
+
+static void *thread_execute(void *arg)
+{
+    struct context *ctx = arg;
+    size_t i, j;
+
+    for (i = 0; ctx->mutator_count; i++) {
+        j = (i & PAGE_IDX_MASK) | PAGE_IDX_X_MASK;
+        ((void(*)(void))&ctx->ptr[j * ctx->pagesize])();
+    }
+
+    return NULL;
+}
+
+static void *thread_mutate(void *arg)
+{
+    size_t i, start_idx, end_idx, page_idx, tmp;
+    struct context *ctx = arg;
+    unsigned int seed;
+    int prot, ret;
+
+    seed = (unsigned int)time(NULL);
+    for (i = 0; i < 50000; i++) {
+        start_idx = rand_r(&seed) & PAGE_IDX_MASK;
+        end_idx = rand_r(&seed) & PAGE_IDX_MASK;
+        if (start_idx > end_idx) {
+            tmp = start_idx;
+            start_idx = end_idx;
+            end_idx = tmp;
+        }
+        prot = rand_r(&seed) & (PROT_READ | PROT_WRITE | PROT_EXEC);
+        for (page_idx = start_idx & REGION_MASK; page_idx <= end_idx;
+             page_idx += PAGES_PER_REGION) {
+            if (page_idx & PAGE_IDX_R_MASK) {
+                prot |= PROT_READ;
+            }
+            if (page_idx & PAGE_IDX_W_MASK) {
+                prot |= PROT_WRITE;
+            }
+            if (page_idx & PAGE_IDX_X_MASK) {
+                prot |= PROT_EXEC;
+            }
+        }
+        ret = mprotect(&ctx->ptr[start_idx * ctx->pagesize],
+                       (end_idx - start_idx + 1) * ctx->pagesize, prot);
+        assert(ret == 0);
+    }
+
+    __atomic_fetch_sub(&ctx->mutator_count, 1, __ATOMIC_SEQ_CST);
+
+    return NULL;
+}
+
+int main(void)
+{
+    pthread_t threads[5];
+    struct context ctx;
+    size_t i;
+    int ret;
+
+    /* Without a template, nothing to test. */
+    if (sizeof(nop_func) == 0) {
+        return EXIT_SUCCESS;
+    }
+
+    /* Initialize memory chunk. */
+    ctx.pagesize = getpagesize();
+    ctx.ptr = mmap(NULL, PAGE_COUNT * ctx.pagesize,
+                   PROT_READ | PROT_WRITE | PROT_EXEC,
+                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    assert(ctx.ptr != MAP_FAILED);
+    for (i = 0; i < PAGE_COUNT; i++) {
+        memcpy(&ctx.ptr[i * ctx.pagesize], nop_func, sizeof(nop_func));
+    }
+    ctx.dev_null_fd = open("/dev/null", O_WRONLY);
+    assert(ctx.dev_null_fd >= 0);
+    ctx.mutator_count = 2;
+
+    /* Start threads. */
+    ret = pthread_create(&threads[0], NULL, thread_read, &ctx);
+    assert(ret == 0);
+    ret = pthread_create(&threads[1], NULL, thread_write, &ctx);
+    assert(ret == 0);
+    ret = pthread_create(&threads[2], NULL, thread_execute, &ctx);
+    assert(ret == 0);
+    for (i = 3; i <= 4; i++) {
+        ret = pthread_create(&threads[i], NULL, thread_mutate, &ctx);
+        assert(ret == 0);
+    }
+
+    /* Wait for threads to stop. */
+    for (i = 0; i < sizeof(threads) / sizeof(threads[0]); i++) {
+        ret = pthread_join(threads[i], NULL);
+        assert(ret == 0);
+    }
+
+    /* Destroy memory chunk. */
+    ret = close(ctx.dev_null_fd);
+    assert(ret == 0);
+    ret = munmap(ctx.ptr, PAGE_COUNT * ctx.pagesize);
+    assert(ret == 0);
+
+    return EXIT_SUCCESS;
+}
-- 
2.38.1


