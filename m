Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C2647D33
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 06:21:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3VnL-0004g2-C6; Fri, 09 Dec 2022 00:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3VnJ-0004fi-Ns
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:33 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3VnG-0008V0-Js
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:33 -0500
Received: by mail-oi1-x234.google.com with SMTP id t62so3562773oib.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 21:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3y0kmr0W6eErtNseZx6fhTpL/A8EAxSqdaDTXYDciH0=;
 b=cvzPway11F3uR0loo/6Wl5qMJlZfjzDtxM65/9E7NAstXpWDkMcdbpmrgfd92Vudd3
 tzMdBT6iGYFtkRbaEnS6aCcKwXo2MxeYxN4eZ4c/9kPDeQoaWFDWHk3eJ97qbs2u/p2c
 J8TQqWLDA/sT6Pz9tFc9fFajKPRru+y0Eufr8SHfrmxVbP8PiTgd3tCUHGlwvR8GBhNs
 q406QH4OLqcOLaleRXakrG7IlnbAKK+XptLGng/XtW2464l/IOkGyOdDb5VGWqpk58c/
 o173v2Lr04DBD/dPSLDQmBOUkP43oo56ziYa542Z9z4dejqJRgOTj8+locihgRyKOfZL
 cMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3y0kmr0W6eErtNseZx6fhTpL/A8EAxSqdaDTXYDciH0=;
 b=3J/Aywxyf+uT3JmGwNqxps0+6vNY0bNaVTev1aQS7cYKJIPahaEqSoHvcXlvYwD0Zo
 aAGKu0uQTSsJnUdmCHqE9w+LuCPy5nSX4TCEtq6GBZMUkVcVxy+Hvib7GLqzzFZYhVYC
 89mP9z+j9VrSV3zIPyKf5aKfMZCpWueM64znnJ7KMlGfiXBhqb+fUL5Wv4rWZhGdg/WG
 StymBEKxrLFZW2AzMxKO8kUFku+AJLqth/hZW9ZXGhsf0UfbAtNGuMjx0E9jUJHhrZ/5
 6rJqsVfSTn8T5S9rYDIyhyPXDCgVs1iUJxrGmp+n8369W7UuBp0A3zwPF5WIPHRUWf6r
 NWpw==
X-Gm-Message-State: ANoB5pl/dXjgCS5+9he8C/LUmrb51oDc0xnFODZlpv7mberaYQ1qUSq7
 SrZe7UusQ0dTGvaqm1MrsaekQWN0cqQYeMYotV4=
X-Google-Smtp-Source: AA0mqf7+LEPzvlMM6K57O+HqXhmdz6xEhTforQrF/+FRb03TRWJpOsHAFhayvouBYOZ+/D5E2qAWVw==
X-Received: by 2002:a05:6808:1520:b0:355:1de8:bc62 with SMTP id
 u32-20020a056808152000b003551de8bc62mr2645780oiw.4.1670563169215; 
 Thu, 08 Dec 2022 21:19:29 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:95e5:48b1:fe60:b74c])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a056830244f00b00661b46cc26bsm224657otr.9.2022.12.08.21.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 21:19:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v3 8/8] accel/tcg: Move remainder of page locking to tb-maint.c
Date: Thu,  8 Dec 2022 23:19:14 -0600
Message-Id: <20221209051914.398215-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209051914.398215-1-richard.henderson@linaro.org>
References: <20221209051914.398215-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

The only thing that still touches PageDesc in translate-all.c
are some locking routines related to tb-maint.c which have not
yet been moved.  Do so now.

Move some code up in tb-maint.c as well, to untangle the maze
of ifdefs, and allow a sensible final ordering.

Move some declarations from exec/translate-all.h to internal.h,
as they are only used within accel/tcg/.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h         |  68 ++---
 include/exec/translate-all.h |   6 -
 accel/tcg/tb-maint.c         | 473 +++++++++++++++++++++++++++++------
 accel/tcg/translate-all.c    | 301 ----------------------
 4 files changed, 411 insertions(+), 437 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 14b89c4ee8..e1429a53ac 100644
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
index 9b996bbeb2..0c56e81d8c 100644
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
@@ -51,7 +60,27 @@ void tb_htable_init(void)
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
+static inline void page_unlock(PageDesc *pd) { }
+static inline void page_lock_tb(const TranslationBlock *tb) { }
+static inline void page_unlock_tb(const TranslationBlock *tb) { }
+
 /*
  * For user-only, since we are protecting all of memory with a single lock,
  * and because the two pages of a TranslationBlock are always contiguous,
@@ -157,6 +186,12 @@ static int v_l2_levels;
 
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
@@ -177,7 +212,7 @@ void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -243,6 +278,303 @@ PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
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
 static void tb_remove_all_1(int level, void **lp)
 {
@@ -339,6 +671,66 @@ static void tb_remove(TranslationBlock *tb)
         tb_page_remove(pd, tb);
     }
 }
+
+static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
+{
+    PageDesc *p1, *p2;
+    tb_page_addr_t page1;
+    tb_page_addr_t page2;
+
+    assert_memory_lock();
+    g_assert(phys1 != -1);
+
+    page1 = phys1 >> TARGET_PAGE_BITS;
+    page2 = phys2 >> TARGET_PAGE_BITS;
+
+    p1 = page_find_alloc(page1, alloc);
+    if (ret_p1) {
+        *ret_p1 = p1;
+    }
+    if (likely(phys2 == -1)) {
+        page_lock(p1);
+        return;
+    } else if (page1 == page2) {
+        page_lock(p1);
+        if (ret_p2) {
+            *ret_p2 = p1;
+        }
+        return;
+    }
+    p2 = page_find_alloc(page2, alloc);
+    if (ret_p2) {
+        *ret_p2 = p2;
+    }
+    if (page1 < page2) {
+        page_lock(p1);
+        page_lock(p2);
+    } else {
+        page_lock(p2);
+        page_lock(p1);
+    }
+}
+
+/* lock the page(s) of a TB in the correct acquisition order */
+static void page_lock_tb(const TranslationBlock *tb)
+{
+    page_lock_pair(NULL, tb_page_addr0(tb), NULL, tb_page_addr1(tb), false);
+}
+
+static void page_unlock_tb(const TranslationBlock *tb)
+{
+    PageDesc *p1 = page_find(tb_page_addr0(tb) >> TARGET_PAGE_BITS);
+
+    page_unlock(p1);
+    if (unlikely(tb_page_addr1(tb) != -1)) {
+        PageDesc *p2 = page_find(tb_page_addr1(tb) >> TARGET_PAGE_BITS);
+
+        if (p2 != p1) {
+            page_unlock(p2);
+        }
+    }
+}
 #endif /* CONFIG_USER_ONLY */
 
 /* flush all the translation blocks */
@@ -535,78 +927,6 @@ static void tb_phys_invalidate__locked(TranslationBlock *tb)
     qemu_thread_jit_execute();
 }
 
-#ifdef CONFIG_USER_ONLY
-static inline void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                                  PageDesc **ret_p2, tb_page_addr_t phys2,
-                                  bool alloc)
-{
-    *ret_p1 = NULL;
-    *ret_p2 = NULL;
-}
-static inline void page_lock_tb(const TranslationBlock *tb) { }
-static inline void page_unlock_tb(const TranslationBlock *tb) { }
-#else
-static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
-{
-    PageDesc *p1, *p2;
-    tb_page_addr_t page1;
-    tb_page_addr_t page2;
-
-    assert_memory_lock();
-    g_assert(phys1 != -1);
-
-    page1 = phys1 >> TARGET_PAGE_BITS;
-    page2 = phys2 >> TARGET_PAGE_BITS;
-
-    p1 = page_find_alloc(page1, alloc);
-    if (ret_p1) {
-        *ret_p1 = p1;
-    }
-    if (likely(phys2 == -1)) {
-        page_lock(p1);
-        return;
-    } else if (page1 == page2) {
-        page_lock(p1);
-        if (ret_p2) {
-            *ret_p2 = p1;
-        }
-        return;
-    }
-    p2 = page_find_alloc(page2, alloc);
-    if (ret_p2) {
-        *ret_p2 = p2;
-    }
-    if (page1 < page2) {
-        page_lock(p1);
-        page_lock(p2);
-    } else {
-        page_lock(p2);
-        page_lock(p1);
-    }
-}
-
-/* lock the page(s) of a TB in the correct acquisition order */
-static void page_lock_tb(const TranslationBlock *tb)
-{
-    page_lock_pair(NULL, tb_page_addr0(tb), NULL, tb_page_addr1(tb), false);
-}
-
-static void page_unlock_tb(const TranslationBlock *tb)
-{
-    PageDesc *p1 = page_find(tb_page_addr0(tb) >> TARGET_PAGE_BITS);
-
-    page_unlock(p1);
-    if (unlikely(tb_page_addr1(tb) != -1)) {
-        PageDesc *p2 = page_find(tb_page_addr1(tb) >> TARGET_PAGE_BITS);
-
-        if (p2 != p1) {
-            page_unlock(p2);
-        }
-    }
-}
-#endif
-
 /*
  * Invalidate one TB.
  * Called with mmap_lock held in user-mode.
@@ -756,8 +1076,7 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 #else
 /*
  * @p must be non-NULL.
- * user-mode: call with mmap_lock held.
- * !user-mode: call with all @pages locked.
+ * Call with all @pages locked.
  */
 static void
 tb_invalidate_phys_page_range__locked(struct page_collection *pages,
@@ -827,8 +1146,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 /*
  * Invalidate all TBs which intersect with the target physical
  * address page @addr.
- *
- * Called with mmap_lock held for user-mode emulation
  */
 void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
@@ -854,8 +1171,6 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
  * 'is_cpu_write_access' should be true if called from a real cpu write
  * access: the virtual CPU will exit the current TB if code is modified inside
  * this TB.
- *
- * Called with mmap_lock held for user-mode emulation.
  */
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 90787bc04f..ed6656fb14 100644
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
@@ -375,261 +329,6 @@ void page_init(void)
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
 /*
  * Isolate the portion of code gen which can setjmp/longjmp.
  * Return the size of the generated code, or negative on error.
-- 
2.34.1


