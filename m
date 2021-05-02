Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA1370FD9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:32:32 +0200 (CEST)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLZf-0001Ie-PK
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMX-0008JY-Kt
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:58 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMT-0002su-9G
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:57 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so2955591pfl.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RG5hll6d3Z+rOlSTjQDQlSL4v8tj2OIfzaOlqk1Ic44=;
 b=cUJJKrn4325LLzxiQ7bJ1IwoEbDxIFC2awhoW+YG7SDPhuTOtJjYYxa4n3N+oL/wfi
 TCrL+HFRWzeXq62ZGE0ftixBGdrARhT1V1a1yTFmxh1Y4UkKaulYaX5p6L+EQnNF3tYZ
 QcjIE8yaSCKiKDg24T3B788uJIHRF7SXH8vVNftA6GutCSqpJZTrDoa62/+aUKTDop5d
 poTiJszOugh7mTJNKODWQxIDeX4q1B8bKlwOrF4+K4xtKkpGlql7npFQlvPZWlsMpm4a
 MXXrbLTsTO5B7O3nArSazZnGALGLboSRFIaRE0IMasAuMmuF17dBmLm430nCUEX/6dmu
 Fztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RG5hll6d3Z+rOlSTjQDQlSL4v8tj2OIfzaOlqk1Ic44=;
 b=jKsX9B2HjjK+iBY5ebm3yutCuWQs19POGfV7/P6f2u4d6xWURqvtsvSa8RrlLjvt4F
 EWfG1yi4BW2cUEkPgScL42OnyFRZuW3zup/boFRtWkQJBCDd07Gsu+8w5V0lkIf5a4mH
 09BIfOB7ohmrWeeslNli9OFPlNh3KrYdSh9JLBaPLM5foGVZbat/ZzdpWHz62wc/6PKF
 A2UgR5yZdMKs9F/ASnQb5FE+6RLa5nHHyQ2iNsFjtyTa0Br3DtDQJXtd5YoogUnpgeFN
 Z/IBs8I6M27mCJE3u8uHYL3/pnM+5TdeDU/i9IwEYNIPMbtvvLkdbkLw31FqX9q9AOXA
 KEiw==
X-Gm-Message-State: AOAM532f+Vn/KJPiJ8M5Ruu4yM/Pzw5LX0TkQczLoeaHSeBD/HT9PMnF
 4u7W6pf4vzUqOL121DnI1UTLDwbg2pU/WA==
X-Google-Smtp-Source: ABdhPJw6iB3smyvbHr9T3UJUQdJWfs3T9BAo/xtu/bPeCNPJmhdQHfarJhBfpQyiGpOZskrbb79KnA==
X-Received: by 2002:a63:5503:: with SMTP id j3mr15662956pgb.256.1619997531497; 
 Sun, 02 May 2021 16:18:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/28] tcg: Split out region.c
Date: Sun,  2 May 2021 16:18:23 -0700
Message-Id: <20210502231844.1977630-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/internal.h  |  37 ++++
 tcg/region.c    | 572 ++++++++++++++++++++++++++++++++++++++++++++++++
 tcg/tcg.c       | 547 +--------------------------------------------
 tcg/meson.build |   1 +
 4 files changed, 613 insertions(+), 544 deletions(-)
 create mode 100644 tcg/internal.h
 create mode 100644 tcg/region.c

diff --git a/tcg/internal.h b/tcg/internal.h
new file mode 100644
index 0000000000..b1dda343c2
--- /dev/null
+++ b/tcg/internal.h
@@ -0,0 +1,37 @@
+/*
+ * Internal declarations for Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef TCG_INTERNAL_H
+#define TCG_INTERNAL_H 1
+
+#define TCG_HIGHWATER 1024
+
+extern TCGContext **tcg_ctxs;
+extern unsigned int n_tcg_ctxs;
+
+bool tcg_region_alloc(TCGContext *s);
+void tcg_region_initial_alloc(TCGContext *s);
+void tcg_region_prologue_set(TCGContext *s);
+
+#endif /* TCG_INTERNAL_H */
diff --git a/tcg/region.c b/tcg/region.c
new file mode 100644
index 0000000000..ba3677f474
--- /dev/null
+++ b/tcg/region.c
@@ -0,0 +1,572 @@
+/*
+ * Memory region management for Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/exec-all.h"
+#include "tcg/tcg.h"
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/boards.h"
+#endif
+#include "internal.h"
+
+
+struct tcg_region_tree {
+    QemuMutex lock;
+    GTree *tree;
+    /* padding to avoid false sharing is computed at run-time */
+};
+
+/*
+ * We divide code_gen_buffer into equally-sized "regions" that TCG threads
+ * dynamically allocate from as demand dictates. Given appropriate region
+ * sizing, this minimizes flushes even when some TCG threads generate a lot
+ * more code than others.
+ */
+struct tcg_region_state {
+    QemuMutex lock;
+
+    /* fields set at init time */
+    void *start;
+    void *start_aligned;
+    void *end;
+    size_t n;
+    size_t size; /* size of one region */
+    size_t stride; /* .size + guard size */
+
+    /* fields protected by the lock */
+    size_t current; /* current region index */
+    size_t agg_size_full; /* aggregate size of full regions */
+};
+
+static struct tcg_region_state region;
+
+/*
+ * This is an array of struct tcg_region_tree's, with padding.
+ * We use void * to simplify the computation of region_trees[i]; each
+ * struct is found every tree_size bytes.
+ */
+static void *region_trees;
+static size_t tree_size;
+
+/* compare a pointer @ptr and a tb_tc @s */
+static int ptr_cmp_tb_tc(const void *ptr, const struct tb_tc *s)
+{
+    if (ptr >= s->ptr + s->size) {
+        return 1;
+    } else if (ptr < s->ptr) {
+        return -1;
+    }
+    return 0;
+}
+
+static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
+{
+    const struct tb_tc *a = ap;
+    const struct tb_tc *b = bp;
+
+    /*
+     * When both sizes are set, we know this isn't a lookup.
+     * This is the most likely case: every TB must be inserted; lookups
+     * are a lot less frequent.
+     */
+    if (likely(a->size && b->size)) {
+        if (a->ptr > b->ptr) {
+            return 1;
+        } else if (a->ptr < b->ptr) {
+            return -1;
+        }
+        /* a->ptr == b->ptr should happen only on deletions */
+        g_assert(a->size == b->size);
+        return 0;
+    }
+    /*
+     * All lookups have either .size field set to 0.
+     * From the glib sources we see that @ap is always the lookup key. However
+     * the docs provide no guarantee, so we just mark this case as likely.
+     */
+    if (likely(a->size == 0)) {
+        return ptr_cmp_tb_tc(a->ptr, b);
+    }
+    return ptr_cmp_tb_tc(b->ptr, a);
+}
+
+static void tcg_region_trees_init(void)
+{
+    size_t i;
+
+    tree_size = ROUND_UP(sizeof(struct tcg_region_tree), qemu_dcache_linesize);
+    region_trees = qemu_memalign(qemu_dcache_linesize, region.n * tree_size);
+    for (i = 0; i < region.n; i++) {
+        struct tcg_region_tree *rt = region_trees + i * tree_size;
+
+        qemu_mutex_init(&rt->lock);
+        rt->tree = g_tree_new(tb_tc_cmp);
+    }
+}
+
+static struct tcg_region_tree *tc_ptr_to_region_tree(const void *p)
+{
+    size_t region_idx;
+
+    /*
+     * Like tcg_splitwx_to_rw, with no assert.  The pc may come from
+     * a signal handler over which the caller has no control.
+     */
+    if (!in_code_gen_buffer(p)) {
+        p -= tcg_splitwx_diff;
+        if (!in_code_gen_buffer(p)) {
+            return NULL;
+        }
+    }
+
+    if (p < region.start_aligned) {
+        region_idx = 0;
+    } else {
+        ptrdiff_t offset = p - region.start_aligned;
+
+        if (offset > region.stride * (region.n - 1)) {
+            region_idx = region.n - 1;
+        } else {
+            region_idx = offset / region.stride;
+        }
+    }
+    return region_trees + region_idx * tree_size;
+}
+
+void tcg_tb_insert(TranslationBlock *tb)
+{
+    struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
+
+    g_assert(rt != NULL);
+    qemu_mutex_lock(&rt->lock);
+    g_tree_insert(rt->tree, &tb->tc, tb);
+    qemu_mutex_unlock(&rt->lock);
+}
+
+void tcg_tb_remove(TranslationBlock *tb)
+{
+    struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
+
+    g_assert(rt != NULL);
+    qemu_mutex_lock(&rt->lock);
+    g_tree_remove(rt->tree, &tb->tc);
+    qemu_mutex_unlock(&rt->lock);
+}
+
+/*
+ * Find the TB 'tb' such that
+ * tb->tc.ptr <= tc_ptr < tb->tc.ptr + tb->tc.size
+ * Return NULL if not found.
+ */
+TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
+{
+    struct tcg_region_tree *rt = tc_ptr_to_region_tree((void *)tc_ptr);
+    TranslationBlock *tb;
+    struct tb_tc s = { .ptr = (void *)tc_ptr };
+
+    if (rt == NULL) {
+        return NULL;
+    }
+
+    qemu_mutex_lock(&rt->lock);
+    tb = g_tree_lookup(rt->tree, &s);
+    qemu_mutex_unlock(&rt->lock);
+    return tb;
+}
+
+static void tcg_region_tree_lock_all(void)
+{
+    size_t i;
+
+    for (i = 0; i < region.n; i++) {
+        struct tcg_region_tree *rt = region_trees + i * tree_size;
+
+        qemu_mutex_lock(&rt->lock);
+    }
+}
+
+static void tcg_region_tree_unlock_all(void)
+{
+    size_t i;
+
+    for (i = 0; i < region.n; i++) {
+        struct tcg_region_tree *rt = region_trees + i * tree_size;
+
+        qemu_mutex_unlock(&rt->lock);
+    }
+}
+
+void tcg_tb_foreach(GTraverseFunc func, gpointer user_data)
+{
+    size_t i;
+
+    tcg_region_tree_lock_all();
+    for (i = 0; i < region.n; i++) {
+        struct tcg_region_tree *rt = region_trees + i * tree_size;
+
+        g_tree_foreach(rt->tree, func, user_data);
+    }
+    tcg_region_tree_unlock_all();
+}
+
+size_t tcg_nb_tbs(void)
+{
+    size_t nb_tbs = 0;
+    size_t i;
+
+    tcg_region_tree_lock_all();
+    for (i = 0; i < region.n; i++) {
+        struct tcg_region_tree *rt = region_trees + i * tree_size;
+
+        nb_tbs += g_tree_nnodes(rt->tree);
+    }
+    tcg_region_tree_unlock_all();
+    return nb_tbs;
+}
+
+static gboolean tcg_region_tree_traverse(gpointer k, gpointer v, gpointer data)
+{
+    TranslationBlock *tb = v;
+
+    tb_destroy(tb);
+    return FALSE;
+}
+
+static void tcg_region_tree_reset_all(void)
+{
+    size_t i;
+
+    tcg_region_tree_lock_all();
+    for (i = 0; i < region.n; i++) {
+        struct tcg_region_tree *rt = region_trees + i * tree_size;
+
+        g_tree_foreach(rt->tree, tcg_region_tree_traverse, NULL);
+        /* Increment the refcount first so that destroy acts as a reset */
+        g_tree_ref(rt->tree);
+        g_tree_destroy(rt->tree);
+    }
+    tcg_region_tree_unlock_all();
+}
+
+static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
+{
+    void *start, *end;
+
+    start = region.start_aligned + curr_region * region.stride;
+    end = start + region.size;
+
+    if (curr_region == 0) {
+        start = region.start;
+    }
+    if (curr_region == region.n - 1) {
+        end = region.end;
+    }
+
+    *pstart = start;
+    *pend = end;
+}
+
+static void tcg_region_assign(TCGContext *s, size_t curr_region)
+{
+    void *start, *end;
+
+    tcg_region_bounds(curr_region, &start, &end);
+
+    s->code_gen_buffer = start;
+    s->code_gen_ptr = start;
+    s->code_gen_buffer_size = end - start;
+    s->code_gen_highwater = end - TCG_HIGHWATER;
+}
+
+static bool tcg_region_alloc__locked(TCGContext *s)
+{
+    if (region.current == region.n) {
+        return true;
+    }
+    tcg_region_assign(s, region.current);
+    region.current++;
+    return false;
+}
+
+/*
+ * Request a new region once the one in use has filled up.
+ * Returns true on error.
+ */
+bool tcg_region_alloc(TCGContext *s)
+{
+    bool err;
+    /* read the region size now; alloc__locked will overwrite it on success */
+    size_t size_full = s->code_gen_buffer_size;
+
+    qemu_mutex_lock(&region.lock);
+    err = tcg_region_alloc__locked(s);
+    if (!err) {
+        region.agg_size_full += size_full - TCG_HIGHWATER;
+    }
+    qemu_mutex_unlock(&region.lock);
+    return err;
+}
+
+/*
+ * Perform a context's first region allocation.
+ * This function does _not_ increment region.agg_size_full.
+ */
+static void tcg_region_initial_alloc__locked(TCGContext *s)
+{
+    bool err = tcg_region_alloc__locked(s);
+    g_assert(!err);
+}
+
+void tcg_region_initial_alloc(TCGContext *s)
+{
+    qemu_mutex_lock(&region.lock);
+    tcg_region_initial_alloc__locked(s);
+    qemu_mutex_unlock(&region.lock);
+}
+
+/* Call from a safe-work context */
+void tcg_region_reset_all(void)
+{
+    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int i;
+
+    qemu_mutex_lock(&region.lock);
+    region.current = 0;
+    region.agg_size_full = 0;
+
+    for (i = 0; i < n_ctxs; i++) {
+        TCGContext *s = qatomic_read(&tcg_ctxs[i]);
+        tcg_region_initial_alloc__locked(s);
+    }
+    qemu_mutex_unlock(&region.lock);
+
+    tcg_region_tree_reset_all();
+}
+
+#ifdef CONFIG_USER_ONLY
+static size_t tcg_n_regions(void)
+{
+    return 1;
+}
+#else
+/*
+ * It is likely that some vCPUs will translate more code than others, so we
+ * first try to set more regions than max_cpus, with those regions being of
+ * reasonable size. If that's not possible we make do by evenly dividing
+ * the code_gen_buffer among the vCPUs.
+ */
+static size_t tcg_n_regions(void)
+{
+    size_t i;
+
+    /* Use a single region if all we have is one vCPU thread */
+#if !defined(CONFIG_USER_ONLY)
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->smp.max_cpus;
+#endif
+    if (max_cpus == 1 || !qemu_tcg_mttcg_enabled()) {
+        return 1;
+    }
+
+    /* Try to have more regions than max_cpus, with each region being >= 2 MB */
+    for (i = 8; i > 0; i--) {
+        size_t regions_per_thread = i;
+        size_t region_size;
+
+        region_size = tcg_init_ctx.code_gen_buffer_size;
+        region_size /= max_cpus * regions_per_thread;
+
+        if (region_size >= 2 * 1024u * 1024) {
+            return max_cpus * regions_per_thread;
+        }
+    }
+    /* If we can't, then just allocate one region per vCPU thread */
+    return max_cpus;
+}
+#endif
+
+/*
+ * Initializes region partitioning.
+ *
+ * Called at init time from the parent thread (i.e. the one calling
+ * tcg_context_init), after the target's TCG globals have been set.
+ *
+ * Region partitioning works by splitting code_gen_buffer into separate regions,
+ * and then assigning regions to TCG threads so that the threads can translate
+ * code in parallel without synchronization.
+ *
+ * In softmmu the number of TCG threads is bounded by max_cpus, so we use at
+ * least max_cpus regions in MTTCG. In !MTTCG we use a single region.
+ * Note that the TCG options from the command-line (i.e. -accel accel=tcg,[...])
+ * must have been parsed before calling this function, since it calls
+ * qemu_tcg_mttcg_enabled().
+ *
+ * In user-mode we use a single region.  Having multiple regions in user-mode
+ * is not supported, because the number of vCPU threads (recall that each thread
+ * spawned by the guest corresponds to a vCPU thread) is only bounded by the
+ * OS, and usually this number is huge (tens of thousands is not uncommon).
+ * Thus, given this large bound on the number of vCPU threads and the fact
+ * that code_gen_buffer is allocated at compile-time, we cannot guarantee
+ * that the availability of at least one region per vCPU thread.
+ *
+ * However, this user-mode limitation is unlikely to be a significant problem
+ * in practice. Multi-threaded guests share most if not all of their translated
+ * code, which makes parallel code generation less appealing than in softmmu.
+ */
+void tcg_region_init(void)
+{
+    void *buf = tcg_init_ctx.code_gen_buffer;
+    void *aligned;
+    size_t size = tcg_init_ctx.code_gen_buffer_size;
+    size_t page_size = qemu_real_host_page_size;
+    size_t region_size;
+    size_t n_regions;
+    size_t i;
+
+    n_regions = tcg_n_regions();
+
+    /* The first region will be 'aligned - buf' bytes larger than the others */
+    aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
+    g_assert(aligned < tcg_init_ctx.code_gen_buffer + size);
+    /*
+     * Make region_size a multiple of page_size, using aligned as the start.
+     * As a result of this we might end up with a few extra pages at the end of
+     * the buffer; we will assign those to the last region.
+     */
+    region_size = (size - (aligned - buf)) / n_regions;
+    region_size = QEMU_ALIGN_DOWN(region_size, page_size);
+
+    /* A region must have at least 2 pages; one code, one guard */
+    g_assert(region_size >= 2 * page_size);
+
+    /* init the region struct */
+    qemu_mutex_init(&region.lock);
+    region.n = n_regions;
+    region.size = region_size - page_size;
+    region.stride = region_size;
+    region.start = buf;
+    region.start_aligned = aligned;
+    /* page-align the end, since its last page will be a guard page */
+    region.end = QEMU_ALIGN_PTR_DOWN(buf + size, page_size);
+    /* account for that last guard page */
+    region.end -= page_size;
+
+    /*
+     * Set guard pages in the rw buffer, as that's the one into which
+     * buffer overruns could occur.  Do not set guard pages in the rx
+     * buffer -- let that one use hugepages throughout.
+     */
+    for (i = 0; i < region.n; i++) {
+        void *start, *end;
+
+        tcg_region_bounds(i, &start, &end);
+
+        /*
+         * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
+         * rejects a permission change from RWX -> NONE.  Guard pages are
+         * nice for bug detection but are not essential; ignore any failure.
+         */
+        (void)qemu_mprotect_none(end, page_size);
+    }
+
+    tcg_region_trees_init();
+
+    /*
+     * Leave the initial context initialized to the first region.
+     * This will be the context into which we generate the prologue.
+     * It is also the only context for CONFIG_USER_ONLY.
+     */
+    tcg_region_initial_alloc__locked(&tcg_init_ctx);
+}
+
+void tcg_region_prologue_set(TCGContext *s)
+{
+    /* Deduct the prologue from the first region.  */
+    g_assert(region.start == s->code_gen_buffer);
+    region.start = s->code_ptr;
+
+    /* Recompute boundaries of the first region. */
+    tcg_region_assign(s, 0);
+
+    /* Register the balance of the buffer with gdb. */
+    tcg_register_jit(tcg_splitwx_to_rx(region.start),
+                     region.end - region.start);
+}
+
+/*
+ * Returns the size (in bytes) of all translated code (i.e. from all regions)
+ * currently in the cache.
+ * See also: tcg_code_capacity()
+ * Do not confuse with tcg_current_code_size(); that one applies to a single
+ * TCG context.
+ */
+size_t tcg_code_size(void)
+{
+    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int i;
+    size_t total;
+
+    qemu_mutex_lock(&region.lock);
+    total = region.agg_size_full;
+    for (i = 0; i < n_ctxs; i++) {
+        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
+        size_t size;
+
+        size = qatomic_read(&s->code_gen_ptr) - s->code_gen_buffer;
+        g_assert(size <= s->code_gen_buffer_size);
+        total += size;
+    }
+    qemu_mutex_unlock(&region.lock);
+    return total;
+}
+
+/*
+ * Returns the code capacity (in bytes) of the entire cache, i.e. including all
+ * regions.
+ * See also: tcg_code_size()
+ */
+size_t tcg_code_capacity(void)
+{
+    size_t guard_size, capacity;
+
+    /* no need for synchronization; these variables are set at init time */
+    guard_size = region.stride - region.size;
+    capacity = region.end + guard_size - region.start;
+    capacity -= region.n * (guard_size + TCG_HIGHWATER);
+    return capacity;
+}
+
+size_t tcg_tb_phys_invalidate_count(void)
+{
+    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
+    unsigned int i;
+    size_t total = 0;
+
+    for (i = 0; i < n_ctxs; i++) {
+        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
+
+        total += qatomic_read(&s->tb_phys_invalidate_count);
+    }
+    return total;
+}
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ee3319e163..26eeed05d9 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -65,6 +65,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "sysemu/sysemu.h"
+#include "internal.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
@@ -156,10 +157,8 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
-#define TCG_HIGHWATER 1024
-
-static TCGContext **tcg_ctxs;
-static unsigned int n_tcg_ctxs;
+TCGContext **tcg_ctxs;
+unsigned int n_tcg_ctxs;
 TCGv_env cpu_env = 0;
 const void *tcg_code_gen_epilogue;
 uintptr_t tcg_splitwx_diff;
@@ -168,42 +167,6 @@ uintptr_t tcg_splitwx_diff;
 tcg_prologue_fn *tcg_qemu_tb_exec;
 #endif
 
-struct tcg_region_tree {
-    QemuMutex lock;
-    GTree *tree;
-    /* padding to avoid false sharing is computed at run-time */
-};
-
-/*
- * We divide code_gen_buffer into equally-sized "regions" that TCG threads
- * dynamically allocate from as demand dictates. Given appropriate region
- * sizing, this minimizes flushes even when some TCG threads generate a lot
- * more code than others.
- */
-struct tcg_region_state {
-    QemuMutex lock;
-
-    /* fields set at init time */
-    void *start;
-    void *start_aligned;
-    void *end;
-    size_t n;
-    size_t size; /* size of one region */
-    size_t stride; /* .size + guard size */
-
-    /* fields protected by the lock */
-    size_t current; /* current region index */
-    size_t agg_size_full; /* aggregate size of full regions */
-};
-
-static struct tcg_region_state region;
-/*
- * This is an array of struct tcg_region_tree's, with padding.
- * We use void * to simplify the computation of region_trees[i]; each
- * struct is found every tree_size bytes.
- */
-static void *region_trees;
-static size_t tree_size;
 static TCGRegSet tcg_target_available_regs[TCG_TYPE_COUNT];
 static TCGRegSet tcg_target_call_clobber_regs;
 
@@ -460,453 +423,6 @@ static const TCGTargetOpDef constraint_sets[] = {
 
 #include "tcg-target.c.inc"
 
-/* compare a pointer @ptr and a tb_tc @s */
-static int ptr_cmp_tb_tc(const void *ptr, const struct tb_tc *s)
-{
-    if (ptr >= s->ptr + s->size) {
-        return 1;
-    } else if (ptr < s->ptr) {
-        return -1;
-    }
-    return 0;
-}
-
-static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
-{
-    const struct tb_tc *a = ap;
-    const struct tb_tc *b = bp;
-
-    /*
-     * When both sizes are set, we know this isn't a lookup.
-     * This is the most likely case: every TB must be inserted; lookups
-     * are a lot less frequent.
-     */
-    if (likely(a->size && b->size)) {
-        if (a->ptr > b->ptr) {
-            return 1;
-        } else if (a->ptr < b->ptr) {
-            return -1;
-        }
-        /* a->ptr == b->ptr should happen only on deletions */
-        g_assert(a->size == b->size);
-        return 0;
-    }
-    /*
-     * All lookups have either .size field set to 0.
-     * From the glib sources we see that @ap is always the lookup key. However
-     * the docs provide no guarantee, so we just mark this case as likely.
-     */
-    if (likely(a->size == 0)) {
-        return ptr_cmp_tb_tc(a->ptr, b);
-    }
-    return ptr_cmp_tb_tc(b->ptr, a);
-}
-
-static void tcg_region_trees_init(void)
-{
-    size_t i;
-
-    tree_size = ROUND_UP(sizeof(struct tcg_region_tree), qemu_dcache_linesize);
-    region_trees = qemu_memalign(qemu_dcache_linesize, region.n * tree_size);
-    for (i = 0; i < region.n; i++) {
-        struct tcg_region_tree *rt = region_trees + i * tree_size;
-
-        qemu_mutex_init(&rt->lock);
-        rt->tree = g_tree_new(tb_tc_cmp);
-    }
-}
-
-static struct tcg_region_tree *tc_ptr_to_region_tree(const void *p)
-{
-    size_t region_idx;
-
-    /*
-     * Like tcg_splitwx_to_rw, with no assert.  The pc may come from
-     * a signal handler over which the caller has no control.
-     */
-    if (!in_code_gen_buffer(p)) {
-        p -= tcg_splitwx_diff;
-        if (!in_code_gen_buffer(p)) {
-            return NULL;
-        }
-    }
-
-    if (p < region.start_aligned) {
-        region_idx = 0;
-    } else {
-        ptrdiff_t offset = p - region.start_aligned;
-
-        if (offset > region.stride * (region.n - 1)) {
-            region_idx = region.n - 1;
-        } else {
-            region_idx = offset / region.stride;
-        }
-    }
-    return region_trees + region_idx * tree_size;
-}
-
-void tcg_tb_insert(TranslationBlock *tb)
-{
-    struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
-
-    g_assert(rt != NULL);
-    qemu_mutex_lock(&rt->lock);
-    g_tree_insert(rt->tree, &tb->tc, tb);
-    qemu_mutex_unlock(&rt->lock);
-}
-
-void tcg_tb_remove(TranslationBlock *tb)
-{
-    struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
-
-    g_assert(rt != NULL);
-    qemu_mutex_lock(&rt->lock);
-    g_tree_remove(rt->tree, &tb->tc);
-    qemu_mutex_unlock(&rt->lock);
-}
-
-/*
- * Find the TB 'tb' such that
- * tb->tc.ptr <= tc_ptr < tb->tc.ptr + tb->tc.size
- * Return NULL if not found.
- */
-TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
-{
-    struct tcg_region_tree *rt = tc_ptr_to_region_tree((void *)tc_ptr);
-    TranslationBlock *tb;
-    struct tb_tc s = { .ptr = (void *)tc_ptr };
-
-    if (rt == NULL) {
-        return NULL;
-    }
-
-    qemu_mutex_lock(&rt->lock);
-    tb = g_tree_lookup(rt->tree, &s);
-    qemu_mutex_unlock(&rt->lock);
-    return tb;
-}
-
-static void tcg_region_tree_lock_all(void)
-{
-    size_t i;
-
-    for (i = 0; i < region.n; i++) {
-        struct tcg_region_tree *rt = region_trees + i * tree_size;
-
-        qemu_mutex_lock(&rt->lock);
-    }
-}
-
-static void tcg_region_tree_unlock_all(void)
-{
-    size_t i;
-
-    for (i = 0; i < region.n; i++) {
-        struct tcg_region_tree *rt = region_trees + i * tree_size;
-
-        qemu_mutex_unlock(&rt->lock);
-    }
-}
-
-void tcg_tb_foreach(GTraverseFunc func, gpointer user_data)
-{
-    size_t i;
-
-    tcg_region_tree_lock_all();
-    for (i = 0; i < region.n; i++) {
-        struct tcg_region_tree *rt = region_trees + i * tree_size;
-
-        g_tree_foreach(rt->tree, func, user_data);
-    }
-    tcg_region_tree_unlock_all();
-}
-
-size_t tcg_nb_tbs(void)
-{
-    size_t nb_tbs = 0;
-    size_t i;
-
-    tcg_region_tree_lock_all();
-    for (i = 0; i < region.n; i++) {
-        struct tcg_region_tree *rt = region_trees + i * tree_size;
-
-        nb_tbs += g_tree_nnodes(rt->tree);
-    }
-    tcg_region_tree_unlock_all();
-    return nb_tbs;
-}
-
-static gboolean tcg_region_tree_traverse(gpointer k, gpointer v, gpointer data)
-{
-    TranslationBlock *tb = v;
-
-    tb_destroy(tb);
-    return FALSE;
-}
-
-static void tcg_region_tree_reset_all(void)
-{
-    size_t i;
-
-    tcg_region_tree_lock_all();
-    for (i = 0; i < region.n; i++) {
-        struct tcg_region_tree *rt = region_trees + i * tree_size;
-
-        g_tree_foreach(rt->tree, tcg_region_tree_traverse, NULL);
-        /* Increment the refcount first so that destroy acts as a reset */
-        g_tree_ref(rt->tree);
-        g_tree_destroy(rt->tree);
-    }
-    tcg_region_tree_unlock_all();
-}
-
-static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
-{
-    void *start, *end;
-
-    start = region.start_aligned + curr_region * region.stride;
-    end = start + region.size;
-
-    if (curr_region == 0) {
-        start = region.start;
-    }
-    if (curr_region == region.n - 1) {
-        end = region.end;
-    }
-
-    *pstart = start;
-    *pend = end;
-}
-
-static void tcg_region_assign(TCGContext *s, size_t curr_region)
-{
-    void *start, *end;
-
-    tcg_region_bounds(curr_region, &start, &end);
-
-    s->code_gen_buffer = start;
-    s->code_gen_ptr = start;
-    s->code_gen_buffer_size = end - start;
-    s->code_gen_highwater = end - TCG_HIGHWATER;
-}
-
-static bool tcg_region_alloc__locked(TCGContext *s)
-{
-    if (region.current == region.n) {
-        return true;
-    }
-    tcg_region_assign(s, region.current);
-    region.current++;
-    return false;
-}
-
-/*
- * Request a new region once the one in use has filled up.
- * Returns true on error.
- */
-static bool tcg_region_alloc(TCGContext *s)
-{
-    bool err;
-    /* read the region size now; alloc__locked will overwrite it on success */
-    size_t size_full = s->code_gen_buffer_size;
-
-    qemu_mutex_lock(&region.lock);
-    err = tcg_region_alloc__locked(s);
-    if (!err) {
-        region.agg_size_full += size_full - TCG_HIGHWATER;
-    }
-    qemu_mutex_unlock(&region.lock);
-    return err;
-}
-
-/*
- * Perform a context's first region allocation.
- * This function does _not_ increment region.agg_size_full.
- */
-static void tcg_region_initial_alloc__locked(TCGContext *s)
-{
-    bool err = tcg_region_alloc__locked(s);
-    g_assert(!err);
-}
-
-#ifndef CONFIG_USER_ONLY
-static void tcg_region_initial_alloc(TCGContext *s)
-{
-    qemu_mutex_lock(&region.lock);
-    tcg_region_initial_alloc__locked(s);
-    qemu_mutex_unlock(&region.lock);
-}
-#endif
-
-/* Call from a safe-work context */
-void tcg_region_reset_all(void)
-{
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
-    unsigned int i;
-
-    qemu_mutex_lock(&region.lock);
-    region.current = 0;
-    region.agg_size_full = 0;
-
-    for (i = 0; i < n_ctxs; i++) {
-        TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-        tcg_region_initial_alloc__locked(s);
-    }
-    qemu_mutex_unlock(&region.lock);
-
-    tcg_region_tree_reset_all();
-}
-
-#ifdef CONFIG_USER_ONLY
-static size_t tcg_n_regions(void)
-{
-    return 1;
-}
-#else
-/*
- * It is likely that some vCPUs will translate more code than others, so we
- * first try to set more regions than max_cpus, with those regions being of
- * reasonable size. If that's not possible we make do by evenly dividing
- * the code_gen_buffer among the vCPUs.
- */
-static size_t tcg_n_regions(void)
-{
-    size_t i;
-
-    /* Use a single region if all we have is one vCPU thread */
-#if !defined(CONFIG_USER_ONLY)
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
-#endif
-    if (max_cpus == 1 || !qemu_tcg_mttcg_enabled()) {
-        return 1;
-    }
-
-    /* Try to have more regions than max_cpus, with each region being >= 2 MB */
-    for (i = 8; i > 0; i--) {
-        size_t regions_per_thread = i;
-        size_t region_size;
-
-        region_size = tcg_init_ctx.code_gen_buffer_size;
-        region_size /= max_cpus * regions_per_thread;
-
-        if (region_size >= 2 * 1024u * 1024) {
-            return max_cpus * regions_per_thread;
-        }
-    }
-    /* If we can't, then just allocate one region per vCPU thread */
-    return max_cpus;
-}
-#endif
-
-/*
- * Initializes region partitioning.
- *
- * Called at init time from the parent thread (i.e. the one calling
- * tcg_context_init), after the target's TCG globals have been set.
- *
- * Region partitioning works by splitting code_gen_buffer into separate regions,
- * and then assigning regions to TCG threads so that the threads can translate
- * code in parallel without synchronization.
- *
- * In softmmu the number of TCG threads is bounded by max_cpus, so we use at
- * least max_cpus regions in MTTCG. In !MTTCG we use a single region.
- * Note that the TCG options from the command-line (i.e. -accel accel=tcg,[...])
- * must have been parsed before calling this function, since it calls
- * qemu_tcg_mttcg_enabled().
- *
- * In user-mode we use a single region.  Having multiple regions in user-mode
- * is not supported, because the number of vCPU threads (recall that each thread
- * spawned by the guest corresponds to a vCPU thread) is only bounded by the
- * OS, and usually this number is huge (tens of thousands is not uncommon).
- * Thus, given this large bound on the number of vCPU threads and the fact
- * that code_gen_buffer is allocated at compile-time, we cannot guarantee
- * that the availability of at least one region per vCPU thread.
- *
- * However, this user-mode limitation is unlikely to be a significant problem
- * in practice. Multi-threaded guests share most if not all of their translated
- * code, which makes parallel code generation less appealing than in softmmu.
- */
-void tcg_region_init(void)
-{
-    void *buf = tcg_init_ctx.code_gen_buffer;
-    void *aligned;
-    size_t size = tcg_init_ctx.code_gen_buffer_size;
-    size_t page_size = qemu_real_host_page_size;
-    size_t region_size;
-    size_t n_regions;
-    size_t i;
-
-    n_regions = tcg_n_regions();
-
-    /* The first region will be 'aligned - buf' bytes larger than the others */
-    aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
-    g_assert(aligned < tcg_init_ctx.code_gen_buffer + size);
-    /*
-     * Make region_size a multiple of page_size, using aligned as the start.
-     * As a result of this we might end up with a few extra pages at the end of
-     * the buffer; we will assign those to the last region.
-     */
-    region_size = (size - (aligned - buf)) / n_regions;
-    region_size = QEMU_ALIGN_DOWN(region_size, page_size);
-
-    /* A region must have at least 2 pages; one code, one guard */
-    g_assert(region_size >= 2 * page_size);
-
-    /* init the region struct */
-    qemu_mutex_init(&region.lock);
-    region.n = n_regions;
-    region.size = region_size - page_size;
-    region.stride = region_size;
-    region.start = buf;
-    region.start_aligned = aligned;
-    /* page-align the end, since its last page will be a guard page */
-    region.end = QEMU_ALIGN_PTR_DOWN(buf + size, page_size);
-    /* account for that last guard page */
-    region.end -= page_size;
-
-    /*
-     * Set guard pages in the rw buffer, as that's the one into which
-     * buffer overruns could occur.  Do not set guard pages in the rx
-     * buffer -- let that one use hugepages throughout.
-     */
-    for (i = 0; i < region.n; i++) {
-        void *start, *end;
-
-        tcg_region_bounds(i, &start, &end);
-
-        /*
-         * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
-         * rejects a permission change from RWX -> NONE.  Guard pages are
-         * nice for bug detection but are not essential; ignore any failure.
-         */
-        (void)qemu_mprotect_none(end, page_size);
-    }
-
-    tcg_region_trees_init();
-
-    /*
-     * Leave the initial context initialized to the first region.
-     * This will be the context into which we generate the prologue.
-     * It is also the only context for CONFIG_USER_ONLY.
-     */
-    tcg_region_initial_alloc__locked(&tcg_init_ctx);
-}
-
-static void tcg_region_prologue_set(TCGContext *s)
-{
-    /* Deduct the prologue from the first region.  */
-    g_assert(region.start == s->code_gen_buffer);
-    region.start = s->code_ptr;
-
-    /* Recompute boundaries of the first region. */
-    tcg_region_assign(s, 0);
-
-    /* Register the balance of the buffer with gdb. */
-    tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.end - region.start);
-}
-
 #ifdef CONFIG_DEBUG_TCG
 const void *tcg_splitwx_to_rx(void *rw)
 {
@@ -991,63 +507,6 @@ void tcg_register_thread(void)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/*
- * Returns the size (in bytes) of all translated code (i.e. from all regions)
- * currently in the cache.
- * See also: tcg_code_capacity()
- * Do not confuse with tcg_current_code_size(); that one applies to a single
- * TCG context.
- */
-size_t tcg_code_size(void)
-{
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
-    unsigned int i;
-    size_t total;
-
-    qemu_mutex_lock(&region.lock);
-    total = region.agg_size_full;
-    for (i = 0; i < n_ctxs; i++) {
-        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-        size_t size;
-
-        size = qatomic_read(&s->code_gen_ptr) - s->code_gen_buffer;
-        g_assert(size <= s->code_gen_buffer_size);
-        total += size;
-    }
-    qemu_mutex_unlock(&region.lock);
-    return total;
-}
-
-/*
- * Returns the code capacity (in bytes) of the entire cache, i.e. including all
- * regions.
- * See also: tcg_code_size()
- */
-size_t tcg_code_capacity(void)
-{
-    size_t guard_size, capacity;
-
-    /* no need for synchronization; these variables are set at init time */
-    guard_size = region.stride - region.size;
-    capacity = region.end + guard_size - region.start;
-    capacity -= region.n * (guard_size + TCG_HIGHWATER);
-    return capacity;
-}
-
-size_t tcg_tb_phys_invalidate_count(void)
-{
-    unsigned int n_ctxs = qatomic_read(&n_tcg_ctxs);
-    unsigned int i;
-    size_t total = 0;
-
-    for (i = 0; i < n_ctxs; i++) {
-        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-
-        total += qatomic_read(&s->tb_phys_invalidate_count);
-    }
-    return total;
-}
-
 /* pool based memory allocation */
 void *tcg_malloc_internal(TCGContext *s, int size)
 {
diff --git a/tcg/meson.build b/tcg/meson.build
index 84064a341e..5be3915529 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -2,6 +2,7 @@ tcg_ss = ss.source_set()
 
 tcg_ss.add(files(
   'optimize.c',
+  'region.c',
   'tcg.c',
   'tcg-common.c',
   'tcg-op.c',
-- 
2.25.1


