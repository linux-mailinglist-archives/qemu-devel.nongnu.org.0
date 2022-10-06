Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358F5F5FA9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:34:05 +0200 (CEST)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHe8-0006kW-Ar
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIZ-0006Jq-2D
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:47 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIW-0006x0-J4
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id c24so519700pls.9
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WtgAF4aa4cibHWZqfaYpuHiDfoHPdK+LHp6GHtS1DoI=;
 b=QuClX9uuyCmXtJqn2vrs724gnDVbBhWp2BTcMBhXX9fYQWh5Vkn5bsyH/VgWtWZSYe
 pVPBP4vBIYWW3htFnweLfSqbF8G2T5SJiIBZo4yhnMYqtVimpf+up4CPI37JVIvqXm/e
 lCQevrvBs8+1lI6nsSCp2YEkYwoYHnl187tjbBdUgz541czeEKJ9YA22blZArdYbDL7y
 w1JYmGJyEtaTgaD7ncMvmbEiEWCKMNq1/XCZK3TkBikmd6bTElj10kEv8+zNsTQ64Mnr
 vkNoB/TiLSP+ZtmTvBM3K1dMWueh5jnFOdr/ElpfgHjp+hL/8GGLZUJd03RE1BreSeqR
 ugwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WtgAF4aa4cibHWZqfaYpuHiDfoHPdK+LHp6GHtS1DoI=;
 b=OZgo2+U6TFTfDx99KIsxurBw4WfLDQkWgVm3u8Ym4wziVN96oDXl1YItrf6MtRepTg
 cI1/W/yzYLtZzOYic8CBenyABOogmMcwaPLafjx63kUoGK3qjHkiJI6mCMGsBqsovTml
 fgNc8+2V581yP/7aWOToxCxQumMjB+hRfiNH5sQjEjU/JR06lwH8qCSJM79rK7KjkL4t
 d8fjp1RkpbbhHmKPJx4L+c1HdJRw6uW/NzmMk+u2B+oRECk1242bRhcjJ997ubGS22Tx
 XZIY1BFOLUpj1izEFLa/IsleH27XGXJql7ajhT64pZm9SRBmjQFPFY0tUEwrDIsjIXYb
 3amA==
X-Gm-Message-State: ACrzQf0v4Qi/gklHGxxNKzTv84Hrqdi1dZwX9DNCcoHaPOCE/toTE9jU
 lCpRJUqPYq8XX2jZyACAKqo9WoKuUCp7bg==
X-Google-Smtp-Source: AMsMyM7zWrVzj/b/uvWnH650//wsnMDdrYXJSt/hyKcvpsNBdkV4OOQDyi9TnOe6BTpuQGBUKySX7Q==
X-Received: by 2002:a17:90a:4613:b0:20a:e03a:d292 with SMTP id
 w19-20020a17090a461300b0020ae03ad292mr2861564pjg.91.1665025903581; 
 Wed, 05 Oct 2022 20:11:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 23/24] accel/tcg: Move PageDesc tree into tb-maint.c for system
Date: Wed,  5 Oct 2022 20:11:12 -0700
Message-Id: <20221006031113.1139454-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Now that PageDesc is not used for user-only, and for system
it is only used for tb maintenance, move the implementation
into tb-main.c appropriately ifdefed.

We have not yet eliminated all references to PageDesc for
user-only, so retain a typedef to the structure without definition.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  49 +++-----------
 accel/tcg/tb-maint.c      | 130 ++++++++++++++++++++++++++++++++++++--
 accel/tcg/translate-all.c |  95 ----------------------------
 3 files changed, 134 insertions(+), 140 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index c7e157d1cd..c6c9e02cfd 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -23,51 +23,13 @@
 #define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
 #endif
 
-typedef struct PageDesc {
+typedef struct PageDesc PageDesc;
 #ifndef CONFIG_USER_ONLY
+struct PageDesc {
     QemuSpin lock;
     /* list of TBs intersecting this ram page */
     uintptr_t first_tb;
-#endif
-} PageDesc;
-
-/*
- * In system mode we want L1_MAP to be based on ram offsets,
- * while in user mode we want it to be based on virtual addresses.
- *
- * TODO: For user mode, see the caveat re host vs guest virtual
- * address spaces near GUEST_ADDR_MAX.
- */
-#if !defined(CONFIG_USER_ONLY)
-#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
-# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
-#else
-# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
-#endif
-#else
-# define L1_MAP_ADDR_SPACE_BITS  MIN(HOST_LONG_BITS, TARGET_ABI_BITS)
-#endif
-
-/* Size of the L2 (and L3, etc) page tables.  */
-#define V_L2_BITS 10
-#define V_L2_SIZE (1 << V_L2_BITS)
-
-/*
- * L1 Mapping properties
- */
-extern int v_l1_size;
-extern int v_l1_shift;
-extern int v_l2_levels;
-
-/*
- * The bottom level has pointers to PageDesc, and is indexed by
- * anything from 4 to (V_L2_BITS + 3) bits, depending on target page size.
- */
-#define V_L1_MIN_BITS 4
-#define V_L1_MAX_BITS (V_L2_BITS + 3)
-#define V_L1_MAX_SIZE (1 << V_L1_MAX_BITS)
-
-extern void *l1_map[V_L1_MAX_SIZE];
+};
 
 PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc);
 
@@ -76,6 +38,11 @@ static inline PageDesc *page_find(tb_page_addr_t index)
     return page_find_alloc(index, false);
 }
 
+void page_table_config_init(void);
+#else
+static inline void page_table_config_init(void) { }
+#endif
+
 /* list iterators for lists of tagged pointers in TranslationBlock */
 #define TB_FOR_EACH_TAGGED(head, tb, n, field)                          \
     for (n = (head) & 1, tb = (TranslationBlock *)((head) & ~1);        \
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 694440cb4a..31d0a74aa9 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -127,6 +127,121 @@ static PageForEachNext foreach_tb_next(PageForEachNext tb,
 }
 
 #else
+/*
+ * In system mode we want L1_MAP to be based on ram offsets.
+ */
+#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
+# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
+#else
+# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
+#endif
+
+/* Size of the L2 (and L3, etc) page tables.  */
+#define V_L2_BITS 10
+#define V_L2_SIZE (1 << V_L2_BITS)
+
+/*
+ * L1 Mapping properties
+ */
+static int v_l1_size;
+static int v_l1_shift;
+static int v_l2_levels;
+
+/*
+ * The bottom level has pointers to PageDesc, and is indexed by
+ * anything from 4 to (V_L2_BITS + 3) bits, depending on target page size.
+ */
+#define V_L1_MIN_BITS 4
+#define V_L1_MAX_BITS (V_L2_BITS + 3)
+#define V_L1_MAX_SIZE (1 << V_L1_MAX_BITS)
+
+static void *l1_map[V_L1_MAX_SIZE];
+
+void page_table_config_init(void)
+{
+    uint32_t v_l1_bits;
+
+    assert(TARGET_PAGE_BITS);
+    /* The bits remaining after N lower levels of page tables.  */
+    v_l1_bits = (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS;
+    if (v_l1_bits < V_L1_MIN_BITS) {
+        v_l1_bits += V_L2_BITS;
+    }
+
+    v_l1_size = 1 << v_l1_bits;
+    v_l1_shift = L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - v_l1_bits;
+    v_l2_levels = v_l1_shift / V_L2_BITS - 1;
+
+    assert(v_l1_bits <= V_L1_MAX_BITS);
+    assert(v_l1_shift % V_L2_BITS == 0);
+    assert(v_l2_levels >= 0);
+}
+
+PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
+{
+    PageDesc *pd;
+    void **lp;
+    int i;
+
+    /* Level 1.  Always allocated.  */
+    lp = l1_map + ((index >> v_l1_shift) & (v_l1_size - 1));
+
+    /* Level 2..N-1.  */
+    for (i = v_l2_levels; i > 0; i--) {
+        void **p = qatomic_rcu_read(lp);
+
+        if (p == NULL) {
+            void *existing;
+
+            if (!alloc) {
+                return NULL;
+            }
+            p = g_new0(void *, V_L2_SIZE);
+            existing = qatomic_cmpxchg(lp, NULL, p);
+            if (unlikely(existing)) {
+                g_free(p);
+                p = existing;
+            }
+        }
+
+        lp = p + ((index >> (i * V_L2_BITS)) & (V_L2_SIZE - 1));
+    }
+
+    pd = qatomic_rcu_read(lp);
+    if (pd == NULL) {
+        void *existing;
+
+        if (!alloc) {
+            return NULL;
+        }
+        pd = g_new0(PageDesc, V_L2_SIZE);
+#ifndef CONFIG_USER_ONLY
+        {
+            int i;
+
+            for (i = 0; i < V_L2_SIZE; i++) {
+                qemu_spin_init(&pd[i].lock);
+            }
+        }
+#endif
+        existing = qatomic_cmpxchg(lp, NULL, pd);
+        if (unlikely(existing)) {
+#ifndef CONFIG_USER_ONLY
+            {
+                int i;
+
+                for (i = 0; i < V_L2_SIZE; i++) {
+                    qemu_spin_destroy(&pd[i].lock);
+                }
+            }
+#endif
+            g_free(pd);
+            pd = existing;
+        }
+    }
+
+    return pd + (index & (V_L2_SIZE - 1));
+}
 
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
 static void page_flush_tb_1(int level, void **lp)
@@ -420,6 +535,17 @@ static void tb_phys_invalidate__locked(TranslationBlock *tb)
     qemu_thread_jit_execute();
 }
 
+#ifdef CONFIG_USER_ONLY
+static inline void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
+                                  PageDesc **ret_p2, tb_page_addr_t phys2,
+                                  bool alloc)
+{
+    *ret_p1 = NULL;
+    *ret_p2 = NULL;
+}
+static inline void page_lock_tb(const TranslationBlock *tb) { }
+static inline void page_unlock_tb(const TranslationBlock *tb) { }
+#else
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
                            PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
@@ -460,10 +586,6 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
     }
 }
 
-#ifdef CONFIG_USER_ONLY
-static inline void page_lock_tb(const TranslationBlock *tb) { }
-static inline void page_unlock_tb(const TranslationBlock *tb) { }
-#else
 /* lock the page(s) of a TB in the correct acquisition order */
 static void page_lock_tb(const TranslationBlock *tb)
 {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 65e557592a..0537723b33 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -114,37 +114,8 @@ QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
                   sizeof_field(TranslationBlock, trace_vcpu_dstate)
                   * BITS_PER_BYTE);
 
-/*
- * L1 Mapping properties
- */
-int v_l1_size;
-int v_l1_shift;
-int v_l2_levels;
-
-void *l1_map[V_L1_MAX_SIZE];
-
 TBContext tb_ctx;
 
-static void page_table_config_init(void)
-{
-    uint32_t v_l1_bits;
-
-    assert(TARGET_PAGE_BITS);
-    /* The bits remaining after N lower levels of page tables.  */
-    v_l1_bits = (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS;
-    if (v_l1_bits < V_L1_MIN_BITS) {
-        v_l1_bits += V_L2_BITS;
-    }
-
-    v_l1_size = 1 << v_l1_bits;
-    v_l1_shift = L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - v_l1_bits;
-    v_l2_levels = v_l1_shift / V_L2_BITS - 1;
-
-    assert(v_l1_bits <= V_L1_MAX_BITS);
-    assert(v_l1_shift % V_L2_BITS == 0);
-    assert(v_l2_levels >= 0);
-}
-
 /* Encode VAL as a signed leb128 sequence at P.
    Return P incremented past the encoded value.  */
 static uint8_t *encode_sleb128(uint8_t *p, target_long val)
@@ -381,72 +352,6 @@ void page_init(void)
 #endif
 }
 
-PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
-{
-    PageDesc *pd;
-    void **lp;
-    int i;
-
-    /* Level 1.  Always allocated.  */
-    lp = l1_map + ((index >> v_l1_shift) & (v_l1_size - 1));
-
-    /* Level 2..N-1.  */
-    for (i = v_l2_levels; i > 0; i--) {
-        void **p = qatomic_rcu_read(lp);
-
-        if (p == NULL) {
-            void *existing;
-
-            if (!alloc) {
-                return NULL;
-            }
-            p = g_new0(void *, V_L2_SIZE);
-            existing = qatomic_cmpxchg(lp, NULL, p);
-            if (unlikely(existing)) {
-                g_free(p);
-                p = existing;
-            }
-        }
-
-        lp = p + ((index >> (i * V_L2_BITS)) & (V_L2_SIZE - 1));
-    }
-
-    pd = qatomic_rcu_read(lp);
-    if (pd == NULL) {
-        void *existing;
-
-        if (!alloc) {
-            return NULL;
-        }
-        pd = g_new0(PageDesc, V_L2_SIZE);
-#ifndef CONFIG_USER_ONLY
-        {
-            int i;
-
-            for (i = 0; i < V_L2_SIZE; i++) {
-                qemu_spin_init(&pd[i].lock);
-            }
-        }
-#endif
-        existing = qatomic_cmpxchg(lp, NULL, pd);
-        if (unlikely(existing)) {
-#ifndef CONFIG_USER_ONLY
-            {
-                int i;
-
-                for (i = 0; i < V_L2_SIZE; i++) {
-                    qemu_spin_destroy(&pd[i].lock);
-                }
-            }
-#endif
-            g_free(pd);
-            pd = existing;
-        }
-    }
-
-    return pd + (index & (V_L2_SIZE - 1));
-}
-
 /* In user-mode page locks aren't used; mmap_lock is enough */
 #ifdef CONFIG_USER_ONLY
 struct page_collection *
-- 
2.34.1


