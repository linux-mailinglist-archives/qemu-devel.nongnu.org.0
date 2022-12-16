Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1DE64F14F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:55:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fpz-0000Ts-7N; Fri, 16 Dec 2022 13:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fps-0000QN-LM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:32 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpq-0003GB-6g
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:32 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o12so3363272pjo.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpkqTSi/S/R8YDjeXoE2gavgjVSzJyexbosPKuVi+f0=;
 b=dDFCN+augU6EVq60NbYq5SMFrJjE7sGD4t+rTx3e727KpDfRuwqfgNpgoo9O5oTtw3
 7LM06hmf7Mv/3PWFw3moMSa2o+7mi4ETt++Qw3O40npnhOojfLbpA+KK3w2lOx2KKXeX
 plNnNihI8gEC9K93sym6+jS7L3EykV/nBhR7itqqGkoNgjexCgCEamwX2m3TY0u1yGXI
 pAHxUoHCnzSYC0GHa8CizFChJ0vm8XUHv8TeEykvq0Su5Pr7I6aW58IlgbRX+WskjR9Q
 jbrBc0KYIWtQ7g6IBND3pgotmp3TTTl05T15p/SmjsksST9fDmQIx+i2KzwcgxmZYHmq
 fIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VpkqTSi/S/R8YDjeXoE2gavgjVSzJyexbosPKuVi+f0=;
 b=w7V2cK/KAzNoeGBdpe65PXfcAtaHDYA7zjXlmyl/IkiPsy2Apthpxc8+XHUtlSJu7Z
 4uYHAbNDh5l5gFBGteEOQBc8r+BegG1qxt07U5ocGfdSGsGTWt3yqjY/mzMyKYm0ZquF
 /deGL5iL1pvZPouPSQFEfNEAZAQO8+cqDrQO7Z6tzA0jx1T4nUpou4E+C36eUFTHzm+C
 HwZ2W8eyvTfSNrh31pPiF6mNJor9rnAX0Dgrvv4WfgiL3Q6PYnb5vS4Asf0+vNMMALER
 WphT/O4NOjLZa3wBYTnvr97VItDb3QcB8nWk8YGX4O6tYkuYLtdJBWcwigADPs9fRuv5
 BMJg==
X-Gm-Message-State: ANoB5pn8iUb52/FZkmTEhiiocziNRIjLVVpP27Qu2I/ZrFt3N5t08SwE
 7x3jsGVPXzaVgA32Uk59Ot1D9twf66tCXXB5
X-Google-Smtp-Source: AA0mqf481g6mtToNQXR1nDohTEg8w0Qnb9yf/abIVvm8PcfgdXqSseM4NSxOQZb6Xs2jRE9dfwmAtQ==
X-Received: by 2002:a05:6a20:a69d:b0:af:7762:3c29 with SMTP id
 ba29-20020a056a20a69d00b000af77623c29mr18899885pzb.10.1671216808480; 
 Fri, 16 Dec 2022 10:53:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 07/13] accel/tcg: Move PageDesc tree into tb-maint.c for system
Date: Fri, 16 Dec 2022 10:52:59 -0800
Message-Id: <20221216185305.3429913-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Now that PageDesc is not used for user-only, and for system
it is only used for tb maintenance, move the implementation
into tb-main.c appropriately ifdefed.

We have not yet eliminated all references to PageDesc for
user-only, so retain a typedef to the structure without definition.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  49 +++-------------
 accel/tcg/tb-maint.c      | 120 ++++++++++++++++++++++++++++++++++++--
 accel/tcg/translate-all.c |  95 ------------------------------
 3 files changed, 124 insertions(+), 140 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index be19bdf088..14b89c4ee8 100644
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
index 20e86c813d..d32e5f80c8 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -127,6 +127,111 @@ static PageForEachNext foreach_tb_next(PageForEachNext tb,
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
+
+        pd = g_new0(PageDesc, V_L2_SIZE);
+        for (int i = 0; i < V_L2_SIZE; i++) {
+            qemu_spin_init(&pd[i].lock);
+        }
+
+        existing = qatomic_cmpxchg(lp, NULL, pd);
+        if (unlikely(existing)) {
+            for (int i = 0; i < V_L2_SIZE; i++) {
+                qemu_spin_destroy(&pd[i].lock);
+            }
+            g_free(pd);
+            pd = existing;
+        }
+    }
+
+    return pd + (index & (V_L2_SIZE - 1));
+}
 
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
 static void tb_remove_all_1(int level, void **lp)
@@ -420,6 +525,17 @@ static void tb_phys_invalidate__locked(TranslationBlock *tb)
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
@@ -460,10 +576,6 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
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
index 0d7596fcb8..90787bc04f 100644
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
@@ -404,72 +375,6 @@ void page_init(void)
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


