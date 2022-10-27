Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D860F602
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:15:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0pT-0008A3-Bd; Thu, 27 Oct 2022 07:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo0pP-0007sl-Of
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:13:39 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo0p9-0008Nb-WC
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:13:38 -0400
Received: by mail-pf1-x431.google.com with SMTP id 192so1149607pfx.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bzfc5hZ1G0r8dqs+MeLFwKQ+2GaFMruqmaEyQHnQRYQ=;
 b=caIIOVQr72fWZd9oyqmmd3ebZE7LTrr6qn3sCwXbbIbmnTpKBBAA1MZfhNk+EE/MT9
 aJDl3CCbiNaB4zZZAJaKbjv4NlLyermwbHQbdfAv/X2X08Pg7IVtoujthPXbipLes0p6
 xLfAnaoDZ4etXpFdlSW8hL4ZrQQS4XN24rvqxvJ6QRduoG8ENhjqYg6Gcbil3ZofxP0I
 drhO6e20YaGLYE7JrlfU32ZDkJiuvt4f+L86d7IjPGAO62RpgrO/obzehcbWYoTPZ12X
 dvwyUeTgfB8+F7zVKjvPYtnULUqNpWL8hm3jSWY3pPlB5ARYbOY3vqIXJ9LlUjWbI1Ci
 rWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bzfc5hZ1G0r8dqs+MeLFwKQ+2GaFMruqmaEyQHnQRYQ=;
 b=LkoUpH/aYqaWDHWHfwRRKA4IH5l5HjQQzoSjyJk60dFzKT4tXzEmgdnV+LbGTtbR9p
 9fab0gm1E9XuPNdz2cqM51duHXMYa48F/Ta8RWgPZa9GYLSoPYAj5RszO43C7F8hK2CD
 84zmDcgvyhDegkjIhQHqoh2e9hKGuJXcayWvZ/EUfQGocVgZwhZ6d31iUHsQIQmI34we
 wgXB1posW50yPalQYh7gk5LOyarWrIRxCB9lKckNhfgu+7bITAVQR38zG7M45k9ovfFY
 tW+UYEk070Eu4TUMKhoibx8zDO4I7JLkMErnmCDYG+KkPUTl9nyOTccHUr3ovpmzsRwP
 17LQ==
X-Gm-Message-State: ACrzQf3HCOc1TPHkZv5LPx/uSV6NyX0VosJhG+9Vkai6PFoB68X7kJCq
 50RBSlQF+8PrmSLwtLgVxJCkGIO0mikNPum7
X-Google-Smtp-Source: AMsMyM6fH3AaefxxPIt7Vmz6ke0ozUP0EgIL0QeIoJfz+3rOIEQQJEF6jJwN/G9I0FgCNV9f4QRIDg==
X-Received: by 2002:aa7:8b46:0:b0:56c:349f:191e with SMTP id
 i6-20020aa78b46000000b0056c349f191emr11190114pfd.29.1666869201443; 
 Thu, 27 Oct 2022 04:13:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a170902c3c500b00172ea8ff334sm969621plj.7.2022.10.27.04.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 04:13:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v2 6/7] accel/tcg: Move PageDesc tree into tb-maint.c for
 system
Date: Thu, 27 Oct 2022 22:12:57 +1100
Message-Id: <20221027111258.348196-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027111258.348196-1-richard.henderson@linaro.org>
References: <20221027111258.348196-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index 0f8f8e5bef..dec8eb2200 100644
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
@@ -389,72 +360,6 @@ void page_init(void)
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


