Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D73655A74
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 16:19:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p96IC-00057d-JB; Sat, 24 Dec 2022 10:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96IA-00057L-CI
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:30 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I8-00017M-91
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:30 -0500
Received: by mail-pl1-x636.google.com with SMTP id b2so7367680pld.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 07:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5ssAZN04Sr56jpLZ2qO5Ks4STp4zpt9vi68yM+h7Z4=;
 b=RAINwKfxv0lqznXvfAq4yUrDCXL98iH/8EjqYRF6qdNgSSDvimdzvhFdLjRpUfAahc
 vV2yHSAeoHXqjXok0yGEUc84ZmywJfy+xuekDZcvaRB17SMBUdHZ2JGruQE9CtVYTyqk
 LOuws7DezhpZ9AaLYCnzFalVxV+VNMOeoSl/59FByBw7zpe6esbmRLarWW1JL5bMDDeN
 AMP9fush2oIxg+DDLllZ7tbp3xnB1SGmFm2sKPUZsqIhnjmMMzr1xU9hvRonVPWguvpO
 DW2p5Tf9SqmSrhSpfRuWMoi2sluuJ56MtseGaBlHRbO3r6XYimN1CgkLPkdCzbEV56LG
 4LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5ssAZN04Sr56jpLZ2qO5Ks4STp4zpt9vi68yM+h7Z4=;
 b=vDQkC1UWQf44nKaR70cNGi81pvTSEWu09onn85ziGAh7rTlhStz58/xFuuWnGl/sc7
 Qrypy8b0eT59WCcdbX7Z3o94mXCGxFYxWR8VdtbyIDal9r47XjbjHtF1s+sB/c9R19K9
 yEKSYTgS7KAGQHQd6pq9gx/mA1OWgYEnjDmiWe8DN50I/MZC3xDITbkTTvSFyJ+R2tZm
 DVNYRZatq+3jWxSaZouapQpZhTC8hScAEk4g3xZhzUS6l5RiIs3DYi+8SJfQLuwej6JT
 XYZraUvSy8R8hTsig8aeDtoGCNA6D92OveX1/FVqXu7ShCA5J+k4aNDuYqAK5r/gW6vh
 wC1g==
X-Gm-Message-State: AFqh2kp6LXnwWcc+d64COpX5z1hsajELGRygdMnWMq+98nFj02bPtbLB
 8a9rveMBaZF4Q3mpsH71XWylBhA/1MV+4RP3
X-Google-Smtp-Source: AMrXdXt1icuezWYw0dJxUgWKDuSwSfOYtoqjNXGgTuscQTfQV+lbBn4F0XerZdTZQM2soD83D7OFLA==
X-Received: by 2002:a05:6a20:2a9f:b0:a4:ac45:8a68 with SMTP id
 v31-20020a056a202a9f00b000a4ac458a68mr20752006pzh.11.1671895106734; 
 Sat, 24 Dec 2022 07:18:26 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a625f43000000b005774f19b41csm4231124pfb.88.2022.12.24.07.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 07:18:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
Subject: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
Date: Sat, 24 Dec 2022 07:18:21 -0800
Message-Id: <20221224151821.464455-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224151821.464455-1-richard.henderson@linaro.org>
References: <20221224151821.464455-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a test that locklessly changes and exercises page protection bits
from various threads. This helps catch race conditions in the VMA
handling.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/nop_func.h       |  25 ++++
 tests/tcg/multiarch/munmap-pthread.c |  16 +--
 tests/tcg/multiarch/vma-pthread.c    | 207 +++++++++++++++++++++++++++
 tests/tcg/multiarch/Makefile.target  |   3 +
 4 files changed, 236 insertions(+), 15 deletions(-)
 create mode 100644 tests/tcg/multiarch/nop_func.h
 create mode 100644 tests/tcg/multiarch/vma-pthread.c

diff --git a/tests/tcg/multiarch/nop_func.h b/tests/tcg/multiarch/nop_func.h
new file mode 100644
index 0000000000..f714d21000
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
diff --git a/tests/tcg/multiarch/munmap-pthread.c b/tests/tcg/multiarch/munmap-pthread.c
index d7143b00d5..1c79005846 100644
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
diff --git a/tests/tcg/multiarch/vma-pthread.c b/tests/tcg/multiarch/vma-pthread.c
new file mode 100644
index 0000000000..35e63cd6cd
--- /dev/null
+++ b/tests/tcg/multiarch/vma-pthread.c
@@ -0,0 +1,207 @@
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
+#include <stdio.h>
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
+        char *p;
+
+        j = (i & PAGE_IDX_MASK) | PAGE_IDX_R_MASK;
+        p = &ctx->ptr[j * ctx->pagesize];
+
+        /* Read directly. */
+        ret = memcmp(p, nop_func, sizeof(nop_func));
+        if (ret != 0) {
+            fprintf(stderr, "fail direct read %p\n", p);
+            abort();
+        }
+
+        /* Read indirectly. */
+        sret = write(ctx->dev_null_fd, p, 1);
+        if (sret != 1) {
+            if (sret < 0) {
+                fprintf(stderr, "fail indirect read %p (%m)\n", p);
+            } else {
+                fprintf(stderr, "fail indirect read %p (%zd)\n", p, sret);
+            }
+            abort();
+        }
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
+
+        /* Write directly. */
+        memcpy(&ctx->ptr[j * ctx->pagesize], nop_func, sizeof(nop_func));
+
+        /* Write using a syscall. */
+        ts = (struct timespec *)(&ctx->ptr[(j + 1) * ctx->pagesize] -
+                                 sizeof(struct timespec));
+        ret = clock_gettime(CLOCK_REALTIME, ts);
+        if (ret != 0) {
+            fprintf(stderr, "fail indirect write %p (%m)\n", ts);
+            abort();
+        }
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
+                /* FIXME: qemu syscalls check for both read+write. */
+                prot |= PROT_WRITE | PROT_READ;
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
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 5f0fee1aad..e7213af492 100644
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
-- 
2.34.1


