Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55D5F5FB4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:39:27 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHjK-0003He-9X
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIc-0006SS-2c
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:50 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIY-00071r-Pt
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id fw14so609104pjb.3
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0BzROSp0AUWeUi2M+A7kYgeMs8EOhgpxWc8y1USeQ6o=;
 b=nk6w4lbwRoHXiA3bEHK78IxUtBbWw8rSiC18EWhVl/AwSwoUUDML0XApYFc5yg6uJ4
 g5qeumNjNI7XyyFlJX42eAFsIjyhElhhPb9i2wh8JvL6+lW/xcQYSAE9FzY9TC8N26pW
 xodJBOrOJSJlXbyqJ2MwpHADMQeklRKpP5hNEWG2s13gsJItm+yLEzzQ2tmrbLRVSscQ
 9qv0lGGFlRAEv/cLHv52jO5YDWdhoI0uy2WYlm+DSvvnjOJkUJQae+Rv10ncex+fXjYI
 +xzIBMZVAUH7mH33kPseCOSQuI66Rx9fFco+5frMRaLRSz74Y1pu3kXafHLPhWoeDn9t
 xeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0BzROSp0AUWeUi2M+A7kYgeMs8EOhgpxWc8y1USeQ6o=;
 b=OocEhN6q7C2rNGXLPfMpAo8YCm9aCeIXAJ8NvZMOmW+sbPUE95oh+Vp3FNT2Jlx7JI
 DBjW7SI+n7twuNIa1R+YZsMApeALqQMuJu0Pwfe/LJ8QF7YgI1zMlDH8iMS48DBnsO24
 76Ra8VRKEfKgW09RYs3esY8gCb2spjtg+oJ6xg1kLrQjfMHSqlrzAa2kWHm56IGGlW1N
 4WhOhixhJlvynlt8wBxVNxkFiqrnSKR2xpfGZr3/Ph+pZlixap0Q1xewTpmJOwUQFMie
 VfbQ2Ba8/LxD36lmop6I892/6TnKtoMq5tlnttQXiep/VVtFglkzg/MAZMyRHV7o1aRT
 e5hA==
X-Gm-Message-State: ACrzQf05ManFMGu098UIWYESRYN3QtSS/fXuaByVjafsnbUhD0Fqu11q
 aW5gOc+YvHO3j13Gq+pkoe+QPboj+Vme0w==
X-Google-Smtp-Source: AMsMyM6EtHxJa+BZBa+hOYlqHmZU9SC00cIefXLNVSABnpAgPGIRxa2Ri/D9NctKYopHVhol6eQOEA==
X-Received: by 2002:a17:903:1211:b0:178:9353:9e42 with SMTP id
 l17-20020a170903121100b0017893539e42mr2344782plh.45.1665025905064; 
 Wed, 05 Oct 2022 20:11:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 24/24] accel/tcg: Move remainder of page locking to tb-maint.c
Date: Wed,  5 Oct 2022 20:11:13 -0700
Message-Id: <20221006031113.1139454-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

The only thing that still touches PageDesc in translate-all.c
are some locking routines related to tb-maint.c which have not
yet been moved.  Do so now.

Move some code up in tb-maint.c as well, to untangle the maze
of ifdefs, and allow a sensible final ordering.

Move some declarations from exec/translate-all.h to internal.h,
as they are only used within accel/tcg/.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h         |  68 ++-----
 include/exec/translate-all.h |   6 -
 accel/tcg/tb-maint.c         | 352 +++++++++++++++++++++++++++++++++--
 accel/tcg/translate-all.c    | 301 ------------------------------
 4 files changed, 352 insertions(+), 375 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index c6c9e02cfd..6ce1437c58 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -23,62 +23,28 @@
 #define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
 #endif
 
-typedef struct PageDesc PageDesc;
-#ifndef CONFIG_USER_ONLY
-struct PageDesc {
-    QemuSpin lock;
-    /* list of TBs intersecting this ram page */
-    uintptr_t first_tb;
-};
-
-PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc);
-
-static inline PageDesc *page_find(tb_page_addr_t index)
-{
-    return page_find_alloc(index, false);
-}
-
-void page_table_config_init(void);
-#else
-static inline void page_table_config_init(void) { }
-#endif
-
-/* list iterators for lists of tagged pointers in TranslationBlock */
-#define TB_FOR_EACH_TAGGED(head, tb, n, field)                          \
-    for (n = (head) & 1, tb = (TranslationBlock *)((head) & ~1);        \
-         tb; tb = (TranslationBlock *)tb->field[n], n = (uintptr_t)tb & 1, \
-             tb = (TranslationBlock *)((uintptr_t)tb & ~1))
-
-#define TB_FOR_EACH_JMP(head_tb, tb, n)                                 \
-    TB_FOR_EACH_TAGGED((head_tb)->jmp_list_head, tb, n, jmp_list_next)
-
-/* In user-mode page locks aren't used; mmap_lock is enough */
-#ifdef CONFIG_USER_ONLY
-#define assert_page_locked(pd) tcg_debug_assert(have_mmap_lock())
-static inline void page_lock(PageDesc *pd) { }
-static inline void page_unlock(PageDesc *pd) { }
-#else
-#ifdef CONFIG_DEBUG_TCG
-void do_assert_page_locked(const PageDesc *pd, const char *file, int line);
-#define assert_page_locked(pd) do_assert_page_locked(pd, __FILE__, __LINE__)
-#else
-#define assert_page_locked(pd)
-#endif
-void page_lock(PageDesc *pd);
-void page_unlock(PageDesc *pd);
-
-/* TODO: For now, still shared with translate-all.c for system mode. */
-typedef int PageForEachNext;
-#define PAGE_FOR_EACH_TB(start, end, pagedesc, tb, n) \
-    TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
-
-#endif
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_DEBUG_TCG)
+#if defined(CONFIG_SOFTMMU) && defined(CONFIG_DEBUG_TCG)
 void assert_no_pages_locked(void);
 #else
 static inline void assert_no_pages_locked(void) { }
 #endif
 
+#ifdef CONFIG_USER_ONLY
+static inline void page_table_config_init(void) { }
+#else
+void page_table_config_init(void);
+#endif
+
+#ifdef CONFIG_SOFTMMU
+struct page_collection;
+void tb_invalidate_phys_page_fast(struct page_collection *pages,
+                                  tb_page_addr_t start, int len,
+                                  uintptr_t retaddr);
+struct page_collection *page_collection_lock(tb_page_addr_t start,
+                                             tb_page_addr_t end);
+void page_collection_unlock(struct page_collection *set);
+#endif /* CONFIG_SOFTMMU */
+
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index 3e9cb91565..88602ae8d8 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -23,12 +23,6 @@
 
 
 /* translate-all.c */
-struct page_collection *page_collection_lock(tb_page_addr_t start,
-                                             tb_page_addr_t end);
-void page_collection_unlock(struct page_collection *set);
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr);
 void tb_invalidate_phys_page(tb_page_addr_t addr);
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 31d0a74aa9..8fe2d322db 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -30,6 +30,15 @@
 #include "internal.h"
 
 
+/* List iterators for lists of tagged pointers in TranslationBlock. */
+#define TB_FOR_EACH_TAGGED(head, tb, n, field)                          \
+    for (n = (head) & 1, tb = (TranslationBlock *)((head) & ~1);        \
+         tb; tb = (TranslationBlock *)tb->field[n], n = (uintptr_t)tb & 1, \
+             tb = (TranslationBlock *)((uintptr_t)tb & ~1))
+
+#define TB_FOR_EACH_JMP(head_tb, tb, n)                                 \
+    TB_FOR_EACH_TAGGED((head_tb)->jmp_list_head, tb, n, jmp_list_next)
+
 static bool tb_cmp(const void *ap, const void *bp)
 {
     const TranslationBlock *a = ap;
@@ -51,7 +60,28 @@ void tb_htable_init(void)
     qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
 }
 
+typedef struct PageDesc PageDesc;
+
 #ifdef CONFIG_USER_ONLY
+
+/*
+ * In user-mode page locks aren't used; mmap_lock is enough.
+ */
+#define assert_page_locked(pd) tcg_debug_assert(have_mmap_lock())
+
+static inline void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
+                                  PageDesc **ret_p2, tb_page_addr_t phys2,
+                                  bool alloc)
+{
+    *ret_p1 = NULL;
+    *ret_p2 = NULL;
+}
+
+static inline void page_lock(PageDesc *pd) { }
+static inline void page_unlock(PageDesc *pd) { }
+static inline void page_lock_tb(const TranslationBlock *tb) { }
+static inline void page_unlock_tb(const TranslationBlock *tb) { }
+
 /*
  * For user-only, since we are protecting all of memory with a single lock,
  * and because the two pages of a TranslationBlock are always contiguous,
@@ -157,6 +187,12 @@ static int v_l2_levels;
 
 static void *l1_map[V_L1_MAX_SIZE];
 
+struct PageDesc {
+    QemuSpin lock;
+    /* list of TBs intersecting this ram page */
+    uintptr_t first_tb;
+};
+
 void page_table_config_init(void)
 {
     uint32_t v_l1_bits;
@@ -177,7 +213,7 @@ void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -243,6 +279,303 @@ PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
     return pd + (index & (V_L2_SIZE - 1));
 }
 
+static inline PageDesc *page_find(tb_page_addr_t index)
+{
+    return page_find_alloc(index, false);
+}
+
+/**
+ * struct page_entry - page descriptor entry
+ * @pd:     pointer to the &struct PageDesc of the page this entry represents
+ * @index:  page index of the page
+ * @locked: whether the page is locked
+ *
+ * This struct helps us keep track of the locked state of a page, without
+ * bloating &struct PageDesc.
+ *
+ * A page lock protects accesses to all fields of &struct PageDesc.
+ *
+ * See also: &struct page_collection.
+ */
+struct page_entry {
+    PageDesc *pd;
+    tb_page_addr_t index;
+    bool locked;
+};
+
+/**
+ * struct page_collection - tracks a set of pages (i.e. &struct page_entry's)
+ * @tree:   Binary search tree (BST) of the pages, with key == page index
+ * @max:    Pointer to the page in @tree with the highest page index
+ *
+ * To avoid deadlock we lock pages in ascending order of page index.
+ * When operating on a set of pages, we need to keep track of them so that
+ * we can lock them in order and also unlock them later. For this we collect
+ * pages (i.e. &struct page_entry's) in a binary search @tree. Given that the
+ * @tree implementation we use does not provide an O(1) operation to obtain the
+ * highest-ranked element, we use @max to keep track of the inserted page
+ * with the highest index. This is valuable because if a page is not in
+ * the tree and its index is higher than @max's, then we can lock it
+ * without breaking the locking order rule.
+ *
+ * Note on naming: 'struct page_set' would be shorter, but we already have a few
+ * page_set_*() helpers, so page_collection is used instead to avoid confusion.
+ *
+ * See also: page_collection_lock().
+ */
+struct page_collection {
+    GTree *tree;
+    struct page_entry *max;
+};
+
+typedef int PageForEachNext;
+#define PAGE_FOR_EACH_TB(start, end, pagedesc, tb, n) \
+    TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
+
+#ifdef CONFIG_DEBUG_TCG
+
+static __thread GHashTable *ht_pages_locked_debug;
+
+static void ht_pages_locked_debug_init(void)
+{
+    if (ht_pages_locked_debug) {
+        return;
+    }
+    ht_pages_locked_debug = g_hash_table_new(NULL, NULL);
+}
+
+static bool page_is_locked(const PageDesc *pd)
+{
+    PageDesc *found;
+
+    ht_pages_locked_debug_init();
+    found = g_hash_table_lookup(ht_pages_locked_debug, pd);
+    return !!found;
+}
+
+static void page_lock__debug(PageDesc *pd)
+{
+    ht_pages_locked_debug_init();
+    g_assert(!page_is_locked(pd));
+    g_hash_table_insert(ht_pages_locked_debug, pd, pd);
+}
+
+static void page_unlock__debug(const PageDesc *pd)
+{
+    bool removed;
+
+    ht_pages_locked_debug_init();
+    g_assert(page_is_locked(pd));
+    removed = g_hash_table_remove(ht_pages_locked_debug, pd);
+    g_assert(removed);
+}
+
+static void do_assert_page_locked(const PageDesc *pd,
+                                  const char *file, int line)
+{
+    if (unlikely(!page_is_locked(pd))) {
+        error_report("assert_page_lock: PageDesc %p not locked @ %s:%d",
+                     pd, file, line);
+        abort();
+    }
+}
+#define assert_page_locked(pd) do_assert_page_locked(pd, __FILE__, __LINE__)
+
+void assert_no_pages_locked(void)
+{
+    ht_pages_locked_debug_init();
+    g_assert(g_hash_table_size(ht_pages_locked_debug) == 0);
+}
+
+#else /* !CONFIG_DEBUG_TCG */
+
+static inline void page_lock__debug(const PageDesc *pd) { }
+static inline void page_unlock__debug(const PageDesc *pd) { }
+static inline void assert_page_locked(const PageDesc *pd) { }
+
+#endif /* CONFIG_DEBUG_TCG */
+
+static void page_lock(PageDesc *pd)
+{
+    page_lock__debug(pd);
+    qemu_spin_lock(&pd->lock);
+}
+
+static void page_unlock(PageDesc *pd)
+{
+    qemu_spin_unlock(&pd->lock);
+    page_unlock__debug(pd);
+}
+
+static inline struct page_entry *
+page_entry_new(PageDesc *pd, tb_page_addr_t index)
+{
+    struct page_entry *pe = g_malloc(sizeof(*pe));
+
+    pe->index = index;
+    pe->pd = pd;
+    pe->locked = false;
+    return pe;
+}
+
+static void page_entry_destroy(gpointer p)
+{
+    struct page_entry *pe = p;
+
+    g_assert(pe->locked);
+    page_unlock(pe->pd);
+    g_free(pe);
+}
+
+/* returns false on success */
+static bool page_entry_trylock(struct page_entry *pe)
+{
+    bool busy;
+
+    busy = qemu_spin_trylock(&pe->pd->lock);
+    if (!busy) {
+        g_assert(!pe->locked);
+        pe->locked = true;
+        page_lock__debug(pe->pd);
+    }
+    return busy;
+}
+
+static void do_page_entry_lock(struct page_entry *pe)
+{
+    page_lock(pe->pd);
+    g_assert(!pe->locked);
+    pe->locked = true;
+}
+
+static gboolean page_entry_lock(gpointer key, gpointer value, gpointer data)
+{
+    struct page_entry *pe = value;
+
+    do_page_entry_lock(pe);
+    return FALSE;
+}
+
+static gboolean page_entry_unlock(gpointer key, gpointer value, gpointer data)
+{
+    struct page_entry *pe = value;
+
+    if (pe->locked) {
+        pe->locked = false;
+        page_unlock(pe->pd);
+    }
+    return FALSE;
+}
+
+/*
+ * Trylock a page, and if successful, add the page to a collection.
+ * Returns true ("busy") if the page could not be locked; false otherwise.
+ */
+static bool page_trylock_add(struct page_collection *set, tb_page_addr_t addr)
+{
+    tb_page_addr_t index = addr >> TARGET_PAGE_BITS;
+    struct page_entry *pe;
+    PageDesc *pd;
+
+    pe = g_tree_lookup(set->tree, &index);
+    if (pe) {
+        return false;
+    }
+
+    pd = page_find(index);
+    if (pd == NULL) {
+        return false;
+    }
+
+    pe = page_entry_new(pd, index);
+    g_tree_insert(set->tree, &pe->index, pe);
+
+    /*
+     * If this is either (1) the first insertion or (2) a page whose index
+     * is higher than any other so far, just lock the page and move on.
+     */
+    if (set->max == NULL || pe->index > set->max->index) {
+        set->max = pe;
+        do_page_entry_lock(pe);
+        return false;
+    }
+    /*
+     * Try to acquire out-of-order lock; if busy, return busy so that we acquire
+     * locks in order.
+     */
+    return page_entry_trylock(pe);
+}
+
+static gint tb_page_addr_cmp(gconstpointer ap, gconstpointer bp, gpointer udata)
+{
+    tb_page_addr_t a = *(const tb_page_addr_t *)ap;
+    tb_page_addr_t b = *(const tb_page_addr_t *)bp;
+
+    if (a == b) {
+        return 0;
+    } else if (a < b) {
+        return -1;
+    }
+    return 1;
+}
+
+/*
+ * Lock a range of pages ([@start,@end[) as well as the pages of all
+ * intersecting TBs.
+ * Locking order: acquire locks in ascending order of page index.
+ */
+struct page_collection *
+page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
+{
+    struct page_collection *set = g_malloc(sizeof(*set));
+    tb_page_addr_t index;
+    PageDesc *pd;
+
+    start >>= TARGET_PAGE_BITS;
+    end   >>= TARGET_PAGE_BITS;
+    g_assert(start <= end);
+
+    set->tree = g_tree_new_full(tb_page_addr_cmp, NULL, NULL,
+                                page_entry_destroy);
+    set->max = NULL;
+    assert_no_pages_locked();
+
+ retry:
+    g_tree_foreach(set->tree, page_entry_lock, NULL);
+
+    for (index = start; index <= end; index++) {
+        TranslationBlock *tb;
+        PageForEachNext n;
+
+        pd = page_find(index);
+        if (pd == NULL) {
+            continue;
+        }
+        if (page_trylock_add(set, index << TARGET_PAGE_BITS)) {
+            g_tree_foreach(set->tree, page_entry_unlock, NULL);
+            goto retry;
+        }
+        assert_page_locked(pd);
+        PAGE_FOR_EACH_TB(unused, unused, pd, tb, n) {
+            if (page_trylock_add(set, tb_page_addr0(tb)) ||
+                (tb_page_addr1(tb) != -1 &&
+                 page_trylock_add(set, tb_page_addr1(tb)))) {
+                /* drop all locks, and reacquire in order */
+                g_tree_foreach(set->tree, page_entry_unlock, NULL);
+                goto retry;
+            }
+        }
+    }
+    return set;
+}
+
+void page_collection_unlock(struct page_collection *set)
+{
+    /* entries are unlocked and freed via page_entry_destroy */
+    g_tree_destroy(set->tree);
+    g_free(set);
+}
+
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
 static void page_flush_tb_1(int level, void **lp)
 {
@@ -338,7 +671,6 @@ static void tb_page_remove(TranslationBlock *tb)
         tb_page_remove1(tb, pd);
     }
 }
-
 #endif
 
 /* flush all the translation blocks */
@@ -536,15 +868,6 @@ static void tb_phys_invalidate__locked(TranslationBlock *tb)
 }
 
 #ifdef CONFIG_USER_ONLY
-static inline void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                                  PageDesc **ret_p2, tb_page_addr_t phys2,
-                                  bool alloc)
-{
-    *ret_p1 = NULL;
-    *ret_p2 = NULL;
-}
-static inline void page_lock_tb(const TranslationBlock *tb) { }
-static inline void page_unlock_tb(const TranslationBlock *tb) { }
 #else
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
                            PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
@@ -756,8 +1079,7 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 #else
 /*
  * @p must be non-NULL.
- * user-mode: call with mmap_lock held.
- * !user-mode: call with all @pages locked.
+ * Call with all @pages locked.
  */
 static void
 tb_invalidate_phys_page_range__locked(struct page_collection *pages,
@@ -828,8 +1150,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 /*
  * Invalidate all TBs which intersect with the target physical
  * address page @addr.
- *
- * Called with mmap_lock held for user-mode emulation
  */
 void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
@@ -855,8 +1175,6 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
  * 'is_cpu_write_access' should be true if called from a real cpu write
  * access: the virtual CPU will exit the current TB if code is modified inside
  * this TB.
- *
- * Called with mmap_lock held for user-mode emulation.
  */
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0537723b33..a5de92142b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -63,52 +63,6 @@
 #include "tb-context.h"
 #include "internal.h"
 
-/* make various TB consistency checks */
-
-/**
- * struct page_entry - page descriptor entry
- * @pd:     pointer to the &struct PageDesc of the page this entry represents
- * @index:  page index of the page
- * @locked: whether the page is locked
- *
- * This struct helps us keep track of the locked state of a page, without
- * bloating &struct PageDesc.
- *
- * A page lock protects accesses to all fields of &struct PageDesc.
- *
- * See also: &struct page_collection.
- */
-struct page_entry {
-    PageDesc *pd;
-    tb_page_addr_t index;
-    bool locked;
-};
-
-/**
- * struct page_collection - tracks a set of pages (i.e. &struct page_entry's)
- * @tree:   Binary search tree (BST) of the pages, with key == page index
- * @max:    Pointer to the page in @tree with the highest page index
- *
- * To avoid deadlock we lock pages in ascending order of page index.
- * When operating on a set of pages, we need to keep track of them so that
- * we can lock them in order and also unlock them later. For this we collect
- * pages (i.e. &struct page_entry's) in a binary search @tree. Given that the
- * @tree implementation we use does not provide an O(1) operation to obtain the
- * highest-ranked element, we use @max to keep track of the inserted page
- * with the highest index. This is valuable because if a page is not in
- * the tree and its index is higher than @max's, then we can lock it
- * without breaking the locking order rule.
- *
- * Note on naming: 'struct page_set' would be shorter, but we already have a few
- * page_set_*() helpers, so page_collection is used instead to avoid confusion.
- *
- * See also: page_collection_lock().
- */
-struct page_collection {
-    GTree *tree;
-    struct page_entry *max;
-};
-
 /* Make sure all possible CPU event bits fit in tb->trace_vcpu_dstate */
 QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
                   sizeof_field(TranslationBlock, trace_vcpu_dstate)
@@ -352,261 +306,6 @@ void page_init(void)
 #endif
 }
 
-/* In user-mode page locks aren't used; mmap_lock is enough */
-#ifdef CONFIG_USER_ONLY
-struct page_collection *
-page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
-{
-    return NULL;
-}
-
-void page_collection_unlock(struct page_collection *set)
-{ }
-#else /* !CONFIG_USER_ONLY */
-
-#ifdef CONFIG_DEBUG_TCG
-
-static __thread GHashTable *ht_pages_locked_debug;
-
-static void ht_pages_locked_debug_init(void)
-{
-    if (ht_pages_locked_debug) {
-        return;
-    }
-    ht_pages_locked_debug = g_hash_table_new(NULL, NULL);
-}
-
-static bool page_is_locked(const PageDesc *pd)
-{
-    PageDesc *found;
-
-    ht_pages_locked_debug_init();
-    found = g_hash_table_lookup(ht_pages_locked_debug, pd);
-    return !!found;
-}
-
-static void page_lock__debug(PageDesc *pd)
-{
-    ht_pages_locked_debug_init();
-    g_assert(!page_is_locked(pd));
-    g_hash_table_insert(ht_pages_locked_debug, pd, pd);
-}
-
-static void page_unlock__debug(const PageDesc *pd)
-{
-    bool removed;
-
-    ht_pages_locked_debug_init();
-    g_assert(page_is_locked(pd));
-    removed = g_hash_table_remove(ht_pages_locked_debug, pd);
-    g_assert(removed);
-}
-
-void do_assert_page_locked(const PageDesc *pd, const char *file, int line)
-{
-    if (unlikely(!page_is_locked(pd))) {
-        error_report("assert_page_lock: PageDesc %p not locked @ %s:%d",
-                     pd, file, line);
-        abort();
-    }
-}
-
-void assert_no_pages_locked(void)
-{
-    ht_pages_locked_debug_init();
-    g_assert(g_hash_table_size(ht_pages_locked_debug) == 0);
-}
-
-#else /* !CONFIG_DEBUG_TCG */
-
-static inline void page_lock__debug(const PageDesc *pd) { }
-static inline void page_unlock__debug(const PageDesc *pd) { }
-
-#endif /* CONFIG_DEBUG_TCG */
-
-void page_lock(PageDesc *pd)
-{
-    page_lock__debug(pd);
-    qemu_spin_lock(&pd->lock);
-}
-
-void page_unlock(PageDesc *pd)
-{
-    qemu_spin_unlock(&pd->lock);
-    page_unlock__debug(pd);
-}
-
-static inline struct page_entry *
-page_entry_new(PageDesc *pd, tb_page_addr_t index)
-{
-    struct page_entry *pe = g_malloc(sizeof(*pe));
-
-    pe->index = index;
-    pe->pd = pd;
-    pe->locked = false;
-    return pe;
-}
-
-static void page_entry_destroy(gpointer p)
-{
-    struct page_entry *pe = p;
-
-    g_assert(pe->locked);
-    page_unlock(pe->pd);
-    g_free(pe);
-}
-
-/* returns false on success */
-static bool page_entry_trylock(struct page_entry *pe)
-{
-    bool busy;
-
-    busy = qemu_spin_trylock(&pe->pd->lock);
-    if (!busy) {
-        g_assert(!pe->locked);
-        pe->locked = true;
-        page_lock__debug(pe->pd);
-    }
-    return busy;
-}
-
-static void do_page_entry_lock(struct page_entry *pe)
-{
-    page_lock(pe->pd);
-    g_assert(!pe->locked);
-    pe->locked = true;
-}
-
-static gboolean page_entry_lock(gpointer key, gpointer value, gpointer data)
-{
-    struct page_entry *pe = value;
-
-    do_page_entry_lock(pe);
-    return FALSE;
-}
-
-static gboolean page_entry_unlock(gpointer key, gpointer value, gpointer data)
-{
-    struct page_entry *pe = value;
-
-    if (pe->locked) {
-        pe->locked = false;
-        page_unlock(pe->pd);
-    }
-    return FALSE;
-}
-
-/*
- * Trylock a page, and if successful, add the page to a collection.
- * Returns true ("busy") if the page could not be locked; false otherwise.
- */
-static bool page_trylock_add(struct page_collection *set, tb_page_addr_t addr)
-{
-    tb_page_addr_t index = addr >> TARGET_PAGE_BITS;
-    struct page_entry *pe;
-    PageDesc *pd;
-
-    pe = g_tree_lookup(set->tree, &index);
-    if (pe) {
-        return false;
-    }
-
-    pd = page_find(index);
-    if (pd == NULL) {
-        return false;
-    }
-
-    pe = page_entry_new(pd, index);
-    g_tree_insert(set->tree, &pe->index, pe);
-
-    /*
-     * If this is either (1) the first insertion or (2) a page whose index
-     * is higher than any other so far, just lock the page and move on.
-     */
-    if (set->max == NULL || pe->index > set->max->index) {
-        set->max = pe;
-        do_page_entry_lock(pe);
-        return false;
-    }
-    /*
-     * Try to acquire out-of-order lock; if busy, return busy so that we acquire
-     * locks in order.
-     */
-    return page_entry_trylock(pe);
-}
-
-static gint tb_page_addr_cmp(gconstpointer ap, gconstpointer bp, gpointer udata)
-{
-    tb_page_addr_t a = *(const tb_page_addr_t *)ap;
-    tb_page_addr_t b = *(const tb_page_addr_t *)bp;
-
-    if (a == b) {
-        return 0;
-    } else if (a < b) {
-        return -1;
-    }
-    return 1;
-}
-
-/*
- * Lock a range of pages ([@start,@end[) as well as the pages of all
- * intersecting TBs.
- * Locking order: acquire locks in ascending order of page index.
- */
-struct page_collection *
-page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
-{
-    struct page_collection *set = g_malloc(sizeof(*set));
-    tb_page_addr_t index;
-    PageDesc *pd;
-
-    start >>= TARGET_PAGE_BITS;
-    end   >>= TARGET_PAGE_BITS;
-    g_assert(start <= end);
-
-    set->tree = g_tree_new_full(tb_page_addr_cmp, NULL, NULL,
-                                page_entry_destroy);
-    set->max = NULL;
-    assert_no_pages_locked();
-
- retry:
-    g_tree_foreach(set->tree, page_entry_lock, NULL);
-
-    for (index = start; index <= end; index++) {
-        TranslationBlock *tb;
-        PageForEachNext n;
-
-        pd = page_find(index);
-        if (pd == NULL) {
-            continue;
-        }
-        if (page_trylock_add(set, index << TARGET_PAGE_BITS)) {
-            g_tree_foreach(set->tree, page_entry_unlock, NULL);
-            goto retry;
-        }
-        assert_page_locked(pd);
-        PAGE_FOR_EACH_TB(unused, unused, pd, tb, n) {
-            if (page_trylock_add(set, tb_page_addr0(tb)) ||
-                (tb_page_addr1(tb) != -1 &&
-                 page_trylock_add(set, tb_page_addr1(tb)))) {
-                /* drop all locks, and reacquire in order */
-                g_tree_foreach(set->tree, page_entry_unlock, NULL);
-                goto retry;
-            }
-        }
-    }
-    return set;
-}
-
-void page_collection_unlock(struct page_collection *set)
-{
-    /* entries are unlocked and freed via page_entry_destroy */
-    g_tree_destroy(set->tree);
-    g_free(set);
-}
-
-#endif /* !CONFIG_USER_ONLY */
-
 /* Called with mmap_lock held for user mode emulation.  */
 TranslationBlock *tb_gen_code(CPUState *cpu,
                               target_ulong pc, target_ulong cs_base,
-- 
2.34.1


