Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0A25F5FAD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:34:54 +0200 (CEST)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHev-0007gg-Fw
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIQ-0005wp-3J
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:38 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIN-0006wa-6Z
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:37 -0400
Received: by mail-pg1-x530.google.com with SMTP id q9so695653pgq.8
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+SrhGhceNC8Ukvgg584MWmHtEZJTffcBA4IFlzSeepY=;
 b=hF+prfVwHblIjSTX/u1AkhCYVlPHb90pMlb0MqPwAW4IVRpS1WN8MspAwe5rYlXvHk
 P1BEGQ9JKlfskkU3/Aw9DZtuRuX8yzy7iYs/yZ/CWmKumPGL1/rbiATiW5gIkNEa+Xku
 TKweccTTHbUNoUZy0CVCICl2qG6xuFBMx+Zhlk9i9MbIPpUsA/x2lFckyK1DNKNepMLQ
 79n7ijgIUdnZmQhRtiD3A6iqgsasDf0+KnaxzMiqnQ4VdwJ8A2Pn3QLyuEaq/lGWcgN7
 +kfu5WoboYRgd//L/jHCN0BE85xqJd2pvSh+lps1kmlODfp+3kX7yltB3VEHL62jyV9B
 5wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+SrhGhceNC8Ukvgg584MWmHtEZJTffcBA4IFlzSeepY=;
 b=N7EmEHhnhCrQXNoDLCvH/QfGTtm94cUSMmofhzTMYrs5hIk+w5owAOUBmIeD5Ryza6
 dvrN2LVHZOpOfSRf+zmxaLOQsmo6TRGXTSa8gloQkuCi/ga3t7ZyUtaqY62A5+aZSZil
 bic90PQhMhWILMw7i5epPxskkLSAB8gxW5XOOekwf66Vr3uBDYHGhoFz2YoD39cpOlim
 o/lZM2Lll27b7FR13VxwpS8JdB53uCIKKZ77GUTpJ7MVDYdUlGvJ5rlNM1WLUrE/MFaT
 ylygzpeA/nq/W78M1BMu/c/m98qzQBTFhb9dDrjuwuxe7WeD5iGP7qydlVDQFlpeOaPC
 gDzg==
X-Gm-Message-State: ACrzQf0GcZtDBbjdl2AHxOuXEsezM0RVKFsLMu7189V5TZ6Mnf32LhtI
 5A7KqZDbCLyCtfSdhTojjscj15DJZq7b1Q==
X-Google-Smtp-Source: AMsMyM7yzOe6vhzyNzqoSVHJs3LT+kwhiV+mZqEiR7pW4FhU2RtjyLYGG1JjYyBjl4OOJhvvA7E1Ew==
X-Received: by 2002:a63:590a:0:b0:439:6e0c:6381 with SMTP id
 n10-20020a63590a000000b004396e0c6381mr2532658pgb.141.1665025894156; 
 Wed, 05 Oct 2022 20:11:34 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 15/24] accel/tcg: Use interval tree for TBs in user-only mode
Date: Wed,  5 Oct 2022 20:11:04 -0700
Message-Id: <20221006031113.1139454-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Begin weaning user-only away from PageDesc.

Since, for user-only, all TB (and page) manipulation is done with
a single mutex, and there is no virtual/physical discontinuity to
split a TB across discontinuous pages, place all of the TBs into
a single IntervalTree. This makes it trivial to find all of the
TBs intersecting a range.

Retain the existing PageDesc + linked list implementation for
system mode.  Move the portion of the implementation that overlaps
the new user-only code behind the common ifdef.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  16 +-
 include/exec/exec-all.h   |  43 ++++-
 accel/tcg/tb-maint.c      | 388 ++++++++++++++++++++++----------------
 accel/tcg/translate-all.c |   4 +-
 4 files changed, 280 insertions(+), 171 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 1227bb69bd..1bd5a02911 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -24,14 +24,13 @@
 #endif
 
 typedef struct PageDesc {
-    /* list of TBs intersecting this ram page */
-    uintptr_t first_tb;
 #ifdef CONFIG_USER_ONLY
     unsigned long flags;
     void *target_data;
-#endif
-#ifdef CONFIG_SOFTMMU
+#else
     QemuSpin lock;
+    /* list of TBs intersecting this ram page */
+    uintptr_t first_tb;
 #endif
 } PageDesc;
 
@@ -69,9 +68,6 @@ static inline PageDesc *page_find(tb_page_addr_t index)
          tb; tb = (TranslationBlock *)tb->field[n], n = (uintptr_t)tb & 1, \
              tb = (TranslationBlock *)((uintptr_t)tb & ~1))
 
-#define PAGE_FOR_EACH_TB(pagedesc, tb, n)                       \
-    TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
-
 #define TB_FOR_EACH_JMP(head_tb, tb, n)                                 \
     TB_FOR_EACH_TAGGED((head_tb)->jmp_list_head, tb, n, jmp_list_next)
 
@@ -89,6 +85,12 @@ void do_assert_page_locked(const PageDesc *pd, const char *file, int line);
 #endif
 void page_lock(PageDesc *pd);
 void page_unlock(PageDesc *pd);
+
+/* TODO: For now, still shared with translate-all.c for system mode. */
+typedef int PageForEachNext;
+#define PAGE_FOR_EACH_TB(start, end, pagedesc, tb, n) \
+    TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
+
 #endif
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_DEBUG_TCG)
 void assert_no_pages_locked(void);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5ae484e34d..793ef5ba4f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -24,6 +24,7 @@
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #endif
+#include "qemu/interval-tree.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
@@ -552,11 +553,20 @@ struct TranslationBlock {
 
     struct tb_tc tc;
 
-    /* first and second physical page containing code. The lower bit
-       of the pointer tells the index in page_next[].
-       The list is protected by the TB's page('s) lock(s) */
+    /*
+     * Track tb_page_addr_t intervals that intersect this TB.
+     * For user-only, the virtual addresses are always contiguous,
+     * and we use a unified interval tree.  For system, we use a
+     * linked list headed in each PageDesc.  Within the list, the lsb
+     * of the previous pointer tells the index of page_next[], and the
+     * list is protected by the PageDesc lock(s).
+     */
+#ifdef CONFIG_USER_ONLY
+    IntervalTreeNode itree;
+#else
     uintptr_t page_next[2];
     tb_page_addr_t page_addr[2];
+#endif
 
     /* jmp_lock placed here to fill a 4-byte hole. Its documentation is below */
     QemuSpin jmp_lock;
@@ -612,24 +622,51 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 
 static inline tb_page_addr_t tb_page_addr0(const TranslationBlock *tb)
 {
+#ifdef CONFIG_USER_ONLY
+    return tb->itree.start;
+#else
     return tb->page_addr[0];
+#endif
 }
 
 static inline tb_page_addr_t tb_page_addr1(const TranslationBlock *tb)
 {
+#ifdef CONFIG_USER_ONLY
+    tb_page_addr_t next = tb->itree.last & TARGET_PAGE_MASK;
+    return next == (tb->itree.start & TARGET_PAGE_MASK) ? -1 : next;
+#else
     return tb->page_addr[1];
+#endif
 }
 
 static inline void tb_set_page_addr0(TranslationBlock *tb,
                                      tb_page_addr_t addr)
 {
+#ifdef CONFIG_USER_ONLY
+    tb->itree.start = addr;
+    /*
+     * To begin, we record an interval of one byte.  When the translation
+     * loop encounters a second page, the interval will be extended to
+     * include the first byte of the second page, which is sufficient to
+     * allow tb_page_addr1() above to work properly.  The final corrected
+     * interval will be set by tb_page_add() from tb->size before the
+     * node is added to the interval tree.
+     */
+    tb->itree.last = addr;
+#else
     tb->page_addr[0] = addr;
+#endif
 }
 
 static inline void tb_set_page_addr1(TranslationBlock *tb,
                                      tb_page_addr_t addr)
 {
+#ifdef CONFIG_USER_ONLY
+    /* Extend the interval to the first byte of the second page.  See above. */
+    tb->itree.last = addr;
+#else
     tb->page_addr[1] = addr;
+#endif
 }
 
 /* current cflags for hashing/comparison */
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index c8e921089d..14e8e47a6a 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/interval-tree.h"
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
@@ -50,6 +51,75 @@ void tb_htable_init(void)
     qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
 }
 
+#ifdef CONFIG_USER_ONLY
+/*
+ * For user-only, since we are protecting all of memory with a single lock,
+ * and because the two pages of a TranslationBlock are always contiguous,
+ * use a single data structure to record all TranslationBlocks.
+ */
+static IntervalTreeRoot tb_root;
+
+static void page_flush_tb(void)
+{
+    assert_memory_lock();
+    memset(&tb_root, 0, sizeof(tb_root));
+}
+
+/* Call with mmap_lock held. */
+static void tb_page_add(TranslationBlock *tb, PageDesc *p1, PageDesc *p2)
+{
+    /* translator_loop() must have made all TB pages non-writable */
+    assert(!(p1->flags & PAGE_WRITE));
+    if (p2) {
+        assert(!(p2->flags & PAGE_WRITE));
+    }
+
+    assert_memory_lock();
+
+    tb->itree.last = tb->itree.start + tb->size - 1;
+    interval_tree_insert(&tb->itree, &tb_root);
+}
+
+/* Call with mmap_lock held. */
+static void tb_page_remove(TranslationBlock *tb)
+{
+    assert_memory_lock();
+    interval_tree_remove(&tb->itree, &tb_root);
+}
+
+/* TODO: For now, still shared with translate-all.c for system mode. */
+#define PAGE_FOR_EACH_TB(start, end, pagedesc, T, N)    \
+    for (T = foreach_tb_first(start, end),              \
+         N = foreach_tb_next(T, start, end);            \
+         T != NULL;                                     \
+         T = N, N = foreach_tb_next(N, start, end))
+
+typedef TranslationBlock *PageForEachNext;
+
+static PageForEachNext foreach_tb_first(tb_page_addr_t start,
+                                        tb_page_addr_t end)
+{
+    IntervalTreeNode *n = interval_tree_iter_first(&tb_root, start, end - 1);
+    return n ? container_of(n, TranslationBlock, itree) : NULL;
+}
+
+static PageForEachNext foreach_tb_next(PageForEachNext tb,
+                                       tb_page_addr_t start,
+                                       tb_page_addr_t end)
+{
+    IntervalTreeNode *n;
+
+    if (tb) {
+        n = interval_tree_iter_next(&tb->itree, start, end - 1);
+        if (n) {
+            return container_of(n, TranslationBlock, itree);
+        }
+    }
+    return NULL;
+}
+
+#else
+
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
 static void page_flush_tb_1(int level, void **lp)
 {
@@ -84,6 +154,70 @@ static void page_flush_tb(void)
     }
 }
 
+/*
+ * Add the tb in the target page and protect it if necessary.
+ * Called with @p->lock held.
+ */
+static void tb_page_add(TranslationBlock *tb, PageDesc *p1, PageDesc *p2)
+{
+    /*
+     * If some code is already present, then the pages are already
+     * protected. So we handle the case where only the first TB is
+     * allocated in a physical page.
+     */
+    assert_page_locked(p1);
+    if (p1->first_tb) {
+        tb->page_next[0] = p1->first_tb;
+    } else {
+        tlb_protect_code(tb->page_addr[0] & TARGET_PAGE_MASK);
+        tb->page_next[0] = 0;
+    }
+    p1->first_tb = (uintptr_t)tb | 0;
+
+    if (unlikely(p2)) {
+        assert_page_locked(p2);
+        if (p2->first_tb) {
+            tb->page_next[1] = p2->first_tb;
+        } else {
+            tlb_protect_code(tb->page_addr[1] & TARGET_PAGE_MASK);
+            tb->page_next[1] = 0;
+        }
+        p2->first_tb = (uintptr_t)tb | 1;
+    }
+}
+
+static void tb_page_remove1(TranslationBlock *tb, PageDesc *pd)
+{
+    TranslationBlock *i;
+    PageForEachNext n;
+    uintptr_t *pprev;
+
+    assert_page_locked(pd);
+    pprev = &pd->first_tb;
+    PAGE_FOR_EACH_TB(unused, unused, pd, i, n) {
+        if (i == tb) {
+            *pprev = i->page_next[n];
+            return;
+        }
+        pprev = &i->page_next[n];
+    }
+    g_assert_not_reached();
+}
+
+static void tb_page_remove(TranslationBlock *tb)
+{
+    PageDesc *pd;
+
+    pd = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
+    tb_page_remove1(tb, pd);
+    if (unlikely(tb->page_addr[1] != -1)) {
+        pd = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
+        tb_page_remove1(tb, pd);
+    }
+}
+
+#endif
+
 /* flush all the translation blocks */
 static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
 {
@@ -128,28 +262,6 @@ void tb_flush(CPUState *cpu)
     }
 }
 
-/*
- * user-mode: call with mmap_lock held
- * !user-mode: call with @pd->lock held
- */
-static inline void tb_page_remove(PageDesc *pd, TranslationBlock *tb)
-{
-    TranslationBlock *tb1;
-    uintptr_t *pprev;
-    unsigned int n1;
-
-    assert_page_locked(pd);
-    pprev = &pd->first_tb;
-    PAGE_FOR_EACH_TB(pd, tb1, n1) {
-        if (tb1 == tb) {
-            *pprev = tb1->page_next[n1];
-            return;
-        }
-        pprev = &tb1->page_next[n1];
-    }
-    g_assert_not_reached();
-}
-
 /* remove @orig from its @n_orig-th jump list */
 static inline void tb_remove_from_jmp_list(TranslationBlock *orig, int n_orig)
 {
@@ -255,7 +367,6 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
  */
 static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 {
-    PageDesc *p;
     uint32_t h;
     tb_page_addr_t phys_pc;
     uint32_t orig_cflags = tb_cflags(tb);
@@ -277,13 +388,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the page list */
     if (rm_from_page_list) {
-        p = page_find(phys_pc >> TARGET_PAGE_BITS);
-        tb_page_remove(p, tb);
-        phys_pc = tb_page_addr1(tb);
-        if (phys_pc != -1) {
-            p = page_find(phys_pc >> TARGET_PAGE_BITS);
-            tb_page_remove(p, tb);
-        }
+        tb_page_remove(tb);
     }
 
     /* remove the TB from the hash list */
@@ -387,41 +492,6 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
     }
 }
 
-/*
- * Add the tb in the target page and protect it if necessary.
- * Called with mmap_lock held for user-mode emulation.
- * Called with @p->lock held in !user-mode.
- */
-static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
-                               unsigned int n, tb_page_addr_t page_addr)
-{
-#ifndef CONFIG_USER_ONLY
-    bool page_already_protected;
-#endif
-
-    assert_page_locked(p);
-
-    tb->page_next[n] = p->first_tb;
-#ifndef CONFIG_USER_ONLY
-    page_already_protected = p->first_tb != (uintptr_t)NULL;
-#endif
-    p->first_tb = (uintptr_t)tb | n;
-
-#if defined(CONFIG_USER_ONLY)
-    /* translator_loop() must have made all TB pages non-writable */
-    assert(!(p->flags & PAGE_WRITE));
-#else
-    /*
-     * If some code is already present, then the pages are already
-     * protected. So we handle the case where only the first TB is
-     * allocated in a physical page.
-     */
-    if (!page_already_protected) {
-        tlb_protect_code(page_addr);
-    }
-#endif
-}
-
 /*
  * Add a new TB and link it to the physical page tables. phys_page2 is
  * (-1) to indicate that only one page contains the TB.
@@ -453,10 +523,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * we can only insert TBs that are fully initialized.
      */
     page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
-    tb_page_add(p, tb, 0, phys_pc);
-    if (p2) {
-        tb_page_add(p2, tb, 1, phys_page2);
-    }
+    tb_page_add(tb, p, p2);
 
     /* add in the hash table */
     h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
@@ -465,10 +532,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     /* remove TB from the page(s) if we couldn't insert it */
     if (unlikely(existing_tb)) {
-        tb_page_remove(p, tb);
-        if (p2) {
-            tb_page_remove(p2, tb);
-        }
+        tb_page_remove(tb);
         tb = existing_tb;
     }
 
@@ -479,6 +543,87 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     return tb;
 }
 
+#ifdef CONFIG_USER_ONLY
+/*
+ * Invalidate all TBs which intersect with the target address range.
+ * Called with mmap_lock held for user-mode emulation.
+ * NOTE: this function must not be called while a TB is running.
+ */
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
+{
+    TranslationBlock *tb;
+    PageForEachNext n;
+
+    assert_memory_lock();
+
+    PAGE_FOR_EACH_TB(start, end, unused, tb, n) {
+        tb_phys_invalidate__locked(tb);
+    }
+}
+
+/*
+ * Invalidate all TBs which intersect with the target address page @addr.
+ * Called with mmap_lock held for user-mode emulation
+ * NOTE: this function must not be called while a TB is running.
+ */
+void tb_invalidate_phys_page(tb_page_addr_t addr)
+{
+    tb_page_addr_t start, end;
+
+    start = addr & TARGET_PAGE_MASK;
+    end = start + TARGET_PAGE_SIZE;
+    tb_invalidate_phys_range(start, end);
+}
+
+/*
+ * Called with mmap_lock held. If pc is not 0 then it indicates the
+ * host PC of the faulting store instruction that caused this invalidate.
+ * Returns true if the caller needs to abort execution of the current
+ * TB (because it was modified by this store and the guest CPU has
+ * precise-SMC semantics).
+ */
+bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
+{
+    assert(pc != 0);
+#ifdef TARGET_HAS_PRECISE_SMC
+    assert_memory_lock();
+    {
+        TranslationBlock *current_tb = tcg_tb_lookup(pc);
+        bool current_tb_modified = false;
+        TranslationBlock *tb;
+        PageForEachNext n;
+
+        addr &= TARGET_PAGE_MASK;
+
+        PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
+            if (current_tb == tb &&
+                (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
+                /*
+                 * If we are modifying the current TB, we must stop its
+                 * execution. We could be more precise by checking that
+                 * the modification is after the current PC, but it would
+                 * require a specialized function to partially restore
+                 * the CPU state.
+                 */
+                current_tb_modified = true;
+                cpu_restore_state_from_tb(current_cpu, current_tb, pc, true);
+            }
+            tb_phys_invalidate__locked(tb);
+        }
+
+        if (current_tb_modified) {
+            /* Force execution of one insn next time.  */
+            CPUState *cpu = current_cpu;
+            cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(current_cpu);
+            return true;
+        }
+    }
+#else
+    tb_invalidate_phys_page(addr);
+#endif /* TARGET_HAS_PRECISE_SMC */
+    return false;
+}
+#else
 /*
  * @p must be non-NULL.
  * user-mode: call with mmap_lock held.
@@ -492,22 +637,17 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 {
     TranslationBlock *tb;
     tb_page_addr_t tb_start, tb_end;
-    int n;
+    PageForEachNext n;
 #ifdef TARGET_HAS_PRECISE_SMC
-    CPUState *cpu = current_cpu;
-    bool current_tb_not_found = retaddr != 0;
     bool current_tb_modified = false;
-    TranslationBlock *current_tb = NULL;
+    TranslationBlock *current_tb = retaddr ? tcg_tb_lookup(retaddr) : NULL;
 #endif /* TARGET_HAS_PRECISE_SMC */
 
-    assert_page_locked(p);
-
     /*
      * We remove all the TBs in the range [start, end[.
      * XXX: see if in some cases it could be faster to invalidate all the code
      */
-    PAGE_FOR_EACH_TB(p, tb, n) {
-        assert_page_locked(p);
+    PAGE_FOR_EACH_TB(start, end, p, tb, n) {
         /* NOTE: this is subtle as a TB may span two physical pages */
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
@@ -521,11 +661,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
         }
         if (!(tb_end <= start || tb_start >= end)) {
 #ifdef TARGET_HAS_PRECISE_SMC
-            if (current_tb_not_found) {
-                current_tb_not_found = false;
-                /* now we have a real cpu fault */
-                current_tb = tcg_tb_lookup(retaddr);
-            }
             if (current_tb == tb &&
                 (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
                 /*
@@ -536,25 +671,26 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
                  * restore the CPU state.
                  */
                 current_tb_modified = true;
-                cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
+                cpu_restore_state_from_tb(current_cpu, current_tb,
+                                          retaddr, true);
             }
 #endif /* TARGET_HAS_PRECISE_SMC */
             tb_phys_invalidate__locked(tb);
         }
     }
-#if !defined(CONFIG_USER_ONLY)
+
     /* if no code remaining, no need to continue to use slow writes */
     if (!p->first_tb) {
         tlb_unprotect_code(start);
     }
-#endif
+
 #ifdef TARGET_HAS_PRECISE_SMC
     if (current_tb_modified) {
         page_collection_unlock(pages);
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
+        current_cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(current_cpu);
         mmap_unlock();
-        cpu_loop_exit_noexc(cpu);
+        cpu_loop_exit_noexc(current_cpu);
     }
 #endif
 }
@@ -571,8 +707,6 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
     tb_page_addr_t start, end;
     PageDesc *p;
 
-    assert_memory_lock();
-
     p = page_find(addr >> TARGET_PAGE_BITS);
     if (p == NULL) {
         return;
@@ -599,8 +733,6 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
     struct page_collection *pages;
     tb_page_addr_t next;
 
-    assert_memory_lock();
-
     pages = page_collection_lock(start, end);
     for (next = (start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
          start < end;
@@ -611,12 +743,12 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
         if (pd == NULL) {
             continue;
         }
+        assert_page_locked(pd);
         tb_invalidate_phys_page_range__locked(pages, pd, start, bound, 0);
     }
     page_collection_unlock(pages);
 }
 
-#ifdef CONFIG_SOFTMMU
 /*
  * len must be <= 8 and start must be a multiple of len.
  * Called via softmmu_template.h when code areas are written to with
@@ -630,8 +762,6 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
 {
     PageDesc *p;
 
-    assert_memory_lock();
-
     p = page_find(start >> TARGET_PAGE_BITS);
     if (!p) {
         return;
@@ -641,64 +771,4 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
     tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
                                           retaddr);
 }
-#else
-/*
- * Called with mmap_lock held. If pc is not 0 then it indicates the
- * host PC of the faulting store instruction that caused this invalidate.
- * Returns true if the caller needs to abort execution of the current
- * TB (because it was modified by this store and the guest CPU has
- * precise-SMC semantics).
- */
-bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
-{
-    TranslationBlock *tb;
-    PageDesc *p;
-    int n;
-#ifdef TARGET_HAS_PRECISE_SMC
-    TranslationBlock *current_tb = NULL;
-    CPUState *cpu = current_cpu;
-    bool current_tb_modified = false;
-#endif
-
-    assert_memory_lock();
-
-    addr &= TARGET_PAGE_MASK;
-    p = page_find(addr >> TARGET_PAGE_BITS);
-    if (!p) {
-        return false;
-    }
-
-#ifdef TARGET_HAS_PRECISE_SMC
-    if (p->first_tb && pc != 0) {
-        current_tb = tcg_tb_lookup(pc);
-    }
-#endif
-    assert_page_locked(p);
-    PAGE_FOR_EACH_TB(p, tb, n) {
-#ifdef TARGET_HAS_PRECISE_SMC
-        if (current_tb == tb &&
-            (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
-            /*
-             * If we are modifying the current TB, we must stop its execution.
-             * We could be more precise by checking that the modification is
-             * after the current PC, but it would require a specialized
-             * function to partially restore the CPU state.
-             */
-            current_tb_modified = true;
-            cpu_restore_state_from_tb(cpu, current_tb, pc, true);
-        }
-#endif /* TARGET_HAS_PRECISE_SMC */
-        tb_phys_invalidate(tb, addr);
-    }
-    p->first_tb = (uintptr_t)NULL;
-#ifdef TARGET_HAS_PRECISE_SMC
-    if (current_tb_modified) {
-        /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
-        return true;
-    }
-#endif
-
-    return false;
-}
-#endif
+#endif /* CONFIG_USER_ONLY */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 478301f227..e002981a9f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -686,7 +686,7 @@ page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
 
     for (index = start; index <= end; index++) {
         TranslationBlock *tb;
-        int n;
+        PageForEachNext n;
 
         pd = page_find(index);
         if (pd == NULL) {
@@ -697,7 +697,7 @@ page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
             goto retry;
         }
         assert_page_locked(pd);
-        PAGE_FOR_EACH_TB(pd, tb, n) {
+        PAGE_FOR_EACH_TB(unused, unused, pd, tb, n) {
             if (page_trylock_add(set, tb_page_addr0(tb)) ||
                 (tb_page_addr1(tb) != -1 &&
                  page_trylock_add(set, tb_page_addr1(tb)))) {
-- 
2.34.1


