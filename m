Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3416593D0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:25:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2ui-0006dx-Nq; Thu, 29 Dec 2022 19:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2ua-0006Tk-3f
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:12 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uW-0004E7-GV
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:11 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a184so2793287pfa.9
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/e64CJkrjVAacS+/S9kimffaF57/sp39kRwpkAK2G/E=;
 b=ffKLR7y3h+HkZbVX2hDvXF4E6fXJvFONVEBjg6aSKD9nlDjV9GFQflq+oIdC1dtZe+
 YW6C62P6dykrArGFwoDu4crSSblV6B6N67xMbzVKb0h+3hbN9EPtuHD8xvN4Rk3n4HnG
 p2ugc7NMdC4XU6Pu/FeSZwmWNp1viyKRLNBRaFH6yiDqBAE9cBBfSUsJLHxd8pUSDHLA
 foWur86cv3um0Nr8jP0T2EITqIbX3squiM8qExmixBNnF5wb1uyvvA1RtCzFliIn4adI
 7fkdBoXcvBCV5YBpG7bOtblahvYSf1nCxH8rZhPXoQXNTQyo8Ya62JrJQGCnQwHblyqy
 eOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/e64CJkrjVAacS+/S9kimffaF57/sp39kRwpkAK2G/E=;
 b=PeezoZTSgn8pJRM1PGnhTX19rVDFpJV3VZzXHQ8L2/WwlepnsAicgTQ3UzSKT2L0+8
 9UT04zaZ/XQwxkiywCwS05f4XkK58TIs8cj3YL5s7cVkAuG4bn9Ff+G5MGkcjtDcT6Ia
 tcUlQLCeo5IMQvxl3sK5s0QKl2F2g5is/qwP0G/YxltAD3K/QASa2R+lXmQktlpFJfhw
 QVplmOUShv1z27UIabVNG/1VNWROt9KOcydRMv9O9Kxmgk50GawR8qJbj4BqQoOzy/Ot
 KzoE4/CWHEnWeWO3+vQfuaVinRAwTDpwjWUX/3MFYq4cfGz/b/pE1JTOukN6iwlgcnsM
 ec/g==
X-Gm-Message-State: AFqh2krUImmRJXb9HZW95RWcmNRB235JJsg2UsP/igqm7k+qTHLiPd0S
 LFthgBhXlY4+pc/HA99Un1n7ehQcZVxH1RkU
X-Google-Smtp-Source: AMrXdXvHc7BKxPdLLVsT38IUv2R2YeZg7/NYfUsuYo2tI/S4uJbMM0NLsGcN+zWpZfeUcHMX/AvYOA==
X-Received: by 2002:a62:1bd8:0:b0:581:9f7d:d55b with SMTP id
 b207-20020a621bd8000000b005819f7dd55bmr6272299pfb.16.1672358766778; 
 Thu, 29 Dec 2022 16:06:06 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6286c2000000b0056bfebfa6e4sm12586151pfd.190.2022.12.29.16.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:06:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 47/47] tests/tcg/multiarch: add vma-pthread.c
Date: Thu, 29 Dec 2022 16:02:21 -0800
Message-Id: <20221230000221.2764875-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Acked-by: Alex Bennée <alex.bennee@linaro.org>
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


