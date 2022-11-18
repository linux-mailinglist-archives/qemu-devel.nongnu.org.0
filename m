Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3AF62F1C9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:49:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxyy-0007Q6-LT; Fri, 18 Nov 2022 04:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyt-0007Oi-Ta
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:19 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyq-0001yM-5W
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:19 -0500
Received: by mail-pl1-x629.google.com with SMTP id d20so4090237plr.10
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fJCf200ykxp/ESHvt27e7ZHRG9vYnU4wj2iIv8ku5BY=;
 b=y3f3k20U0NcD3ZMkarPcpF14fqLI4QfJulAQ7ko8ueXB8TXFBcT0G4uJ/z1eqKx5V0
 a4i5o8mhtNvtqQ8wWruL5b1AMS6YRg8hSL+yS+pEJwnURoK9Cue9hBNIpdc/oW0W9pQO
 YCgOZWpjELZC9A0u09srdTWcNnokH70VoB+e3K82FWfAY3cY7N6PoTQOZHe/185eFZ2y
 l2ePEHrR/Mw2ZhLKUvnIqOgEXKGBZLZAlcRTVeHkc/UuMmA6Xjwskqpj2qXPCjrIjuPC
 kvxOavYvhhva+4De9fS/rByFPfVF+UBk6j05E7VK39yOsebFp1qpohdKcngJLXCkjoZl
 iqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJCf200ykxp/ESHvt27e7ZHRG9vYnU4wj2iIv8ku5BY=;
 b=l59fqQIaTXqst7QDvozHNWmqO7aBdFA00/FnkJ7TN6fBSonL30t6txX035zBOmfgjw
 wTDxND6TXhyYkjOAFhqO2nkBAwQVxTvBdZzf9fNkzYhnSOBrb2dc7NswV3H/NucANjrg
 1NC8fS1Bg9uYWDVY//hSPIxpumt2eZFiWJ8aAz3tVvKXnm6vUexvyCtyU6PpBZjyo0yQ
 8wTkti214g9+92DilrLKPBparcHJAIA2N71FaDZvQNyBRsBaBYXpOletEg3RC0XAwQvH
 /WwVhg7a0okofEO3fjakLmX/zEHSue9HbNimaNON8CsgoKU7CqaWa2MSX7pF2GzL/XhN
 77Rw==
X-Gm-Message-State: ANoB5plHmVuE1ZHCTMpxRP3nH32H2P9DTLjBnVzPPVCbPxIt4ePDz3SY
 xANnjEGEXmXRyWmccWaCyaU0199Ppvhfnw==
X-Google-Smtp-Source: AA0mqf5w6Nw6Usthmn7PSmiAL83Gkat8sDLhwwwk0qv9zWcCdIDHQi+amVgvga44oEopy5LIEVDDUQ==
X-Received: by 2002:a17:902:860a:b0:179:e1f6:d24d with SMTP id
 f10-20020a170902860a00b00179e1f6d24dmr6863335plo.91.1668764895060; 
 Fri, 18 Nov 2022 01:48:15 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 08/29] accel/tcg: Honor atomicity of stores
Date: Fri, 18 Nov 2022 01:47:33 -0800
Message-Id: <20221118094754.242910-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c             | 177 +++++++++++++----
 accel/tcg/user-exec.c          |  12 +-
 accel/tcg/ldst_atomicity.c.inc | 336 +++++++++++++++++++++++++++++++++
 3 files changed, 480 insertions(+), 45 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index cdc109b473..69f8a25a7f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2556,36 +2556,6 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
  * Store Helpers
  */
 
-static inline void QEMU_ALWAYS_INLINE
-store_memop(void *haddr, uint64_t val, MemOp op)
-{
-    switch (op) {
-    case MO_UB:
-        stb_p(haddr, val);
-        break;
-    case MO_BEUW:
-        stw_be_p(haddr, val);
-        break;
-    case MO_LEUW:
-        stw_le_p(haddr, val);
-        break;
-    case MO_BEUL:
-        stl_be_p(haddr, val);
-        break;
-    case MO_LEUL:
-        stl_le_p(haddr, val);
-        break;
-    case MO_BEUQ:
-        stq_be_p(haddr, val);
-        break;
-    case MO_LEUQ:
-        stq_le_p(haddr, val);
-        break;
-    default:
-        qemu_build_not_reached();
-    }
-}
-
 /**
  * do_st_mmio_leN:
  * @env: cpu context
@@ -2632,16 +2602,145 @@ static uint64_t do_st_bytes_leN(MMULookupPageData *p, uint64_t val_le)
     return val_le;
 }
 
+/**
+ * do_st_parts_leN
+ * @p: translation parameters
+ * @val_le: data to store
+ *
+ * As do_st_bytes_leN, but atomically on each aligned part.
+ */
+static uint64_t do_st_parts_leN(MMULookupPageData *p, uint64_t val_le)
+{
+    void *haddr = p->haddr;
+    int size = p->size;
+
+    do {
+        int n;
+
+        /* Find minimum of alignment and size */
+        switch (((uintptr_t)haddr | size) & 7) {
+        case 4:
+            store_atomic4(haddr, le32_to_cpu(val_le));
+            val_le >>= 32;
+            n = 4;
+            break;
+        case 2:
+        case 6:
+            store_atomic2(haddr, le16_to_cpu(val_le));
+            val_le >>= 16;
+            n = 2;
+            break;
+        default:
+            stb_p(haddr, val_le);
+            val_le >>= 8;
+            n = 1;
+            break;
+        case 0:
+            g_assert_not_reached();
+        }
+        haddr += n;
+        size -= n;
+    } while (size != 0);
+    return val_le;
+}
+
+/**
+ * do_st_whole_le4
+ * @p: translation parameters
+ * @val_le: data to store
+ *
+ * As do_st_bytes_leN, but atomically on each aligned part.
+ * Four aligned bytes are guaranteed to cover the store.
+ */
+static uint64_t do_st_whole_le4(MMULookupPageData *p, uint64_t val_le)
+{
+    int sz = p->size * 8;
+    int o = p->addr & 3;
+    int sh = o * 8;
+    uint32_t m = MAKE_64BIT_MASK(0, sz);
+    uint32_t v;
+
+    if (HOST_BIG_ENDIAN) {
+        v = bswap32(val_le) >> sh;
+        m = bswap32(m) >> sh;
+    } else {
+        v = val_le << sh;
+        m <<= sh;
+    }
+    store_atom_insert_al4(p->haddr - o, v, m);
+    return val_le >> sz;
+}
+
+/**
+ * do_st_whole_le8
+ * @p: translation parameters
+ * @val_le: data to store
+ *
+ * As do_st_bytes_leN, but atomically on each aligned part.
+ * Eight aligned bytes are guaranteed to cover the store.
+ */
+static uint64_t do_st_whole_le8(MMULookupPageData *p, uint64_t val_le)
+{
+    int sz = p->size * 8;
+    int o = p->addr & 7;
+    int sh = o * 8;
+    uint64_t m = MAKE_64BIT_MASK(0, sz);
+    uint64_t v;
+
+    if (HOST_BIG_ENDIAN) {
+        v = bswap64(val_le) >> sh;
+        m = bswap64(m) >> sh;
+    } else {
+        v = val_le << sh;
+        m <<= sh;
+    }
+    store_atom_insert_al8(p->haddr - o, v, m);
+    return val_le >> sz;
+}
+
 /*
  * Wrapper for the above.
  */
 static uint64_t do_st_leN(CPUArchState *env, MMULookupPageData *p,
-                          uint64_t val_le, int mmu_idx, uintptr_t ra)
+                          uint64_t val_le, int mmu_idx,
+                          MemOp mop, uintptr_t ra)
 {
+    MemOp atmax;
+
     if (unlikely(p->flags & TLB_MMIO)) {
         return do_st_mmio_leN(env, p, val_le, mmu_idx, ra);
-    } else {
+    }
+
+    switch (mop & MO_ATOM_MASK) {
+    case MO_ATOM_WITHIN16:
+        /*
+         * It is a given that we cross a page and therefore there is no
+         * atomicity for the load as a whole, but there may be a subobject
+         * as defined by ATMAX which does not cross a 16-byte boundary.
+         */
+        atmax = mop & MO_ATMAX_MASK;
+        if (atmax == MO_ATMAX_SIZE) {
+            atmax = mop & MO_SIZE;
+        } else {
+            atmax >>= MO_ATMAX_SHIFT;
+        }
+        if (unlikely(p->size >= (1 << atmax))) {
+            if (!HAVE_al8_fast && p->size <= 4) {
+                return do_st_whole_le4(p, val_le);
+            } else if (HAVE_al8) {
+                return do_st_whole_le8(p, val_le);
+            } else {
+                cpu_loop_exit_atomic(env_cpu(env), ra);
+            }
+        }
+        /* fall through */
+    case MO_ATOM_IFALIGN:
+    case MO_ATOM_NONE:
         return do_st_bytes_leN(p, val_le);
+    case MO_ATOM_SUBALIGN:
+        return do_st_parts_leN(p, val_le);
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -2686,7 +2785,7 @@ static void do_st2_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
             if (l.memop & MO_BSWAP) {
                 val = bswap16(val);
             }
-            store_memop(l.page[0].haddr, val, MO_UW);
+            store_atom_2(env, ra, l.page[0].haddr, l.memop, val);
         }
     } else {
         uint8_t a, b;
@@ -2735,7 +2834,7 @@ static void do_st4_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
             if (l.memop & MO_BSWAP) {
                 val = bswap32(val);
             }
-            store_memop(l.page[0].haddr, val, MO_UL);
+            store_atom_4(env, ra, l.page[0].haddr, l.memop, val);
         }
     } else {
         assert_no_tlb_bswap;
@@ -2744,8 +2843,8 @@ static void do_st4_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
         if ((l.memop & MO_BSWAP) != MO_LE) {
             val = bswap32(val);
         }
-        val = do_st_leN(env, &l.page[0], val, l.mmu_idx, ra);
-        (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, ra);
+        val = do_st_leN(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, l.memop, ra);
     }
 }
 
@@ -2781,7 +2880,7 @@ static void do_st8_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
             if (l.memop & MO_BSWAP) {
                 val = bswap64(val);
             }
-            store_memop(l.page[0].haddr, val, MO_UQ);
+            store_atom_8(env, ra, l.page[0].haddr, l.memop, val);
         }
     } else {
         assert_no_tlb_bswap;
@@ -2790,8 +2889,8 @@ static void do_st8_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
         if ((l.memop & MO_BSWAP) != MO_LE) {
             val = bswap64(val);
         }
-        val = do_st_leN(env, &l.page[0], val, l.mmu_idx, ra);
-        (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, ra);
+        val = do_st_leN(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, l.memop, ra);
     }
 }
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ec721e5097..ddba8c9dd7 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -451,7 +451,7 @@ void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
 
     validate_memop(oi, MO_BEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    stw_be_p(haddr, val);
+    store_atom_2(env, ra, haddr, get_memop(oi), be16_to_cpu(val));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -463,7 +463,7 @@ void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
 
     validate_memop(oi, MO_BEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    stl_be_p(haddr, val);
+    store_atom_4(env, ra, haddr, get_memop(oi), be32_to_cpu(val));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -475,7 +475,7 @@ void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
 
     validate_memop(oi, MO_BEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    stq_be_p(haddr, val);
+    store_atom_8(env, ra, haddr, get_memop(oi), be64_to_cpu(val));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -487,7 +487,7 @@ void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
 
     validate_memop(oi, MO_LEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    stw_le_p(haddr, val);
+    store_atom_2(env, ra, haddr, get_memop(oi), le16_to_cpu(val));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -499,7 +499,7 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
 
     validate_memop(oi, MO_LEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    stl_le_p(haddr, val);
+    store_atom_4(env, ra, haddr, get_memop(oi), le32_to_cpu(val));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -511,7 +511,7 @@ void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
 
     validate_memop(oi, MO_LEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    stq_le_p(haddr, val);
+    store_atom_8(env, ra, haddr, get_memop(oi), le64_to_cpu(val));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index decc9a2a16..8876c16371 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -21,6 +21,12 @@
 #else
 # define HAVE_al16_fast    false
 #endif
+#if defined(CONFIG_ATOMIC128) || defined(CONFIG_CMPXCHG128)
+# define HAVE_al16         true
+#else
+# define HAVE_al16         false
+#endif
+
 
 /**
  * required_atomicity:
@@ -544,3 +550,333 @@ static uint64_t load_atom_8(CPUArchState *env, uintptr_t ra,
         g_assert_not_reached();
     }
 }
+
+/**
+ * store_atomic2:
+ * @pv: host address
+ * @val: value to store
+ *
+ * Atomically store 2 aligned bytes to @pv.
+ */
+static inline void store_atomic2(void *pv, uint16_t val)
+{
+    uint16_t *p = __builtin_assume_aligned(pv, 2);
+    qatomic_set(p, val);
+}
+
+/**
+ * store_atomic4:
+ * @pv: host address
+ * @val: value to store
+ *
+ * Atomically store 4 aligned bytes to @pv.
+ */
+static inline void store_atomic4(void *pv, uint32_t val)
+{
+    uint32_t *p = __builtin_assume_aligned(pv, 4);
+    qatomic_set(p, val);
+}
+
+/**
+ * store_atomic8:
+ * @pv: host address
+ * @val: value to store
+ *
+ * Atomically store 8 aligned bytes to @pv.
+ */
+static inline void store_atomic8(void *pv, uint64_t val)
+{
+    uint64_t *p = __builtin_assume_aligned(pv, 8);
+
+    qemu_build_assert(HAVE_al8);
+    qatomic_set__nocheck(p, val);
+}
+
+/**
+ * store_atom_4x2
+ */
+static inline void store_atom_4_by_2(void *pv, uint32_t val)
+{
+    uint16_t *p = __builtin_assume_aligned(pv, 2);
+    qatomic_set(p, val >> (HOST_BIG_ENDIAN ? 16 : 0));
+    qatomic_set(p + 2, val >> (HOST_BIG_ENDIAN ? 0 : 16));
+}
+
+/**
+ * store_atom_8_by_2
+ */
+static inline void store_atom_8_by_2(void *pv, uint64_t val)
+{
+    uint32_t *p = __builtin_assume_aligned(pv, 4);
+    qatomic_set(p, val >> (HOST_BIG_ENDIAN ? 32 : 0));
+    qatomic_set(p + 4, val >> (HOST_BIG_ENDIAN ? 0 : 32));
+}
+
+/**
+ * store_atom_8_by_4
+ */
+static inline void store_atom_8_by_4(void *pv, uint64_t val)
+{
+    uint16_t *p = __builtin_assume_aligned(pv, 2);
+    qatomic_set(p, val >> (HOST_BIG_ENDIAN ? 48 : 0));
+    qatomic_set(p + 2, val >> (HOST_BIG_ENDIAN ? 32 : 16));
+    qatomic_set(p + 4, val >> (HOST_BIG_ENDIAN ? 16 : 32));
+    qatomic_set(p + 6, val >> (HOST_BIG_ENDIAN ? 0 : 48));
+}
+
+/**
+ * store_atom_insert_al4:
+ * @p: host address
+ * @val: shifted value to store
+ * @msk: mask for value to store
+ *
+ * Atomically store @val to @p, masked by @msk.
+ */
+static void store_atom_insert_al4(uint32_t *p, uint32_t val, uint32_t msk)
+{
+    uint32_t old, new;
+
+    p = __builtin_assume_aligned(p, 4);
+    old = qatomic_read(p);
+    do {
+        new = (old & ~msk) | val;
+    } while (!__atomic_compare_exchange_n(p, &old, new, true,
+                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
+}
+
+/**
+ * store_atom_insert_al8:
+ * @p: host address
+ * @val: shifted value to store
+ * @msk: mask for value to store
+ *
+ * Atomically store @val to @p masked by @msk.
+ */
+static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
+{
+    uint64_t old, new;
+
+    qemu_build_assert(HAVE_al8);
+    p = __builtin_assume_aligned(p, 8);
+    old = qatomic_read__nocheck(p);
+    do {
+        new = (old & ~msk) | val;
+    } while (!__atomic_compare_exchange_n(p, &old, new, true,
+                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
+}
+
+/**
+ * store_atom_insert_al16:
+ * @p: host address
+ * @val: shifted value to store
+ * @msk: mask for value to store
+ *
+ * Atomically store @val to @p masked by @msk.
+ */
+static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
+{
+#if defined(CONFIG_ATOMIC128)
+    __uint128_t *pu, old, new;
+
+    /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
+    pu = __builtin_assume_aligned(ps, 16);
+    old = *pu;
+    do {
+        new = (old & ~msk.u) | val.u;
+    } while (!__atomic_compare_exchange_n(pu, &old, new, true,
+                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
+#elif defined(CONFIG_CMPXCHG128)
+    __uint128_t *pu, old, new;
+
+    /*
+     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
+     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
+     * and accept the sequential consistency that comes with it.
+     */
+    pu = __builtin_assume_aligned(ps, 16);
+    do {
+        old = *pu;
+        new = (old & ~msk.u) | val.u;
+    } while (!__sync_bool_compare_and_swap_16(pu, old, new));
+#else
+    qemu_build_not_reached();
+#endif
+}
+
+/**
+ * store_atom_2:
+ * @p: host address
+ * @val: the value to store
+ * @memop: the full memory op
+ *
+ * Store 2 bytes to @p, honoring the atomicity of @memop.
+ */
+static void store_atom_2(CPUArchState *env, uintptr_t ra,
+                         void *pv, MemOp memop, uint16_t val)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    MemOp atmax;
+
+    if (likely((pi & 1) == 0)) {
+        store_atomic2(pv, val);
+        return;
+    }
+
+    atmax = required_atomicity(env, pi, memop);
+    if (atmax == MO_8) {
+        stw_he_p(pv, val);
+        return;
+    }
+
+    /* The only case remaining is MO_ATOM_WITHIN16. */
+    if (!HAVE_al8_fast && (pi & 3) == 1) {
+        /* Big or little endian, we want the middle two bytes. */
+        store_atom_insert_al4(pv - 1, val << 8, 0x00ffff00);
+        return;
+    }
+
+    if ((pi & 15) != 7) {
+        if (HAVE_al8) {
+            int sh = (pi & 7) * 8;
+            uint64_t v, m;
+
+            pv = (void *)(pi & ~7);
+            if (HOST_BIG_ENDIAN) {
+                v = (uint64_t)val << (48 - sh);
+                m = 0xffffull << (48 - sh);
+            } else {
+                v = (uint64_t)val << sh;
+                m = 0xffffull << sh;
+            }
+            store_atom_insert_al8(pv, v, m);
+            return;
+        }
+    } else {
+        if (HAVE_al16) {
+            Int128 v, m;
+
+            /* Big or little endian, we want the middle two bytes. */
+            v = int128_lshift(int128_make64(val), 56);
+            m = int128_lshift(int128_make64(0xffff), 56);
+            store_atom_insert_al16(pv - 7, v, m);
+            return;
+        }
+    }
+
+    cpu_loop_exit_atomic(env_cpu(env), ra);
+}
+
+/**
+ * store_atom_4:
+ * @p: host address
+ * @val: the value to store
+ * @memop: the full memory op
+ *
+ * Store 4 bytes to @p, honoring the atomicity of @memop.
+ */
+static void store_atom_4(CPUArchState *env, uintptr_t ra,
+                         void *pv, MemOp memop, uint32_t val)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    MemOp atmax;
+
+    if (likely((pi & 3) == 0)) {
+        store_atomic4(pv, val);
+        return;
+    }
+
+    atmax = required_atomicity(env, pi, memop);
+    switch (atmax) {
+    case MO_8:
+        stl_he_p(pv, val);
+        return;
+    case MO_16:
+        store_atom_4_by_2(pv, val);
+        return;
+    case MO_32:
+        if ((pi & 7) < 4) {
+            if (HAVE_al8) {
+                int sh = (pi & 7) * 8;
+                uint64_t v, m;
+
+                pv = (void *)(pi & ~7);
+                if (HOST_BIG_ENDIAN) {
+                    v = (uint64_t)val << (32 - sh);
+                    m = 0xffffffffull << (32 - sh);
+                } else {
+                    v = (uint64_t)val << sh;
+                    m = 0xffffffffull << sh;
+                }
+                store_atom_insert_al8(pv, v, m);
+                return;
+            }
+        } else {
+            if (HAVE_al16) {
+                int sh = (pi & 7) * 8;
+                Int128 v, m;
+
+                v = int128_make64(val);
+                m = int128_make64(0xffffffffull);
+                v = int128_lshift(v, HOST_BIG_ENDIAN ? 96 - sh : sh);
+                m = int128_lshift(m, HOST_BIG_ENDIAN ? 96 - sh : sh);
+
+                pv = (void *)(pi & ~15);
+                store_atom_insert_al16(pv, v, m);
+                return;
+            }
+        }
+        cpu_loop_exit_atomic(env_cpu(env), ra);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/**
+ * store_atom_8:
+ * @p: host address
+ * @val: the value to store
+ * @memop: the full memory op
+ *
+ * Store 8 bytes to @p, honoring the atomicity of @memop.
+ */
+static void store_atom_8(CPUArchState *env, uintptr_t ra,
+                         void *pv, MemOp memop, uint64_t val)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    MemOp atmax;
+
+    if (HAVE_al8 && likely((pi & 7) == 0)) {
+        store_atomic8(pv, val);
+        return;
+    }
+
+    atmax = required_atomicity(env, pi, memop);
+    switch (atmax) {
+    case MO_8:
+        stq_he_p(pv, val);
+        return;
+    case MO_16:
+        store_atom_8_by_2(pv, val);
+        return;
+    case MO_32:
+        store_atom_8_by_4(pv, val);
+        return;
+    case MO_64:
+        if (HAVE_al16) {
+            int sh = (pi & 7) * 8;
+            Int128 v, m;
+
+            v = int128_make64(val);
+            m = int128_make64(-1ull);
+            v = int128_lshift(v, HOST_BIG_ENDIAN ? 64 - sh : sh);
+            m = int128_lshift(m, HOST_BIG_ENDIAN ? 64 - sh : sh);
+
+            pv = (void *)(pi & ~15);
+            store_atom_insert_al16(pv, v, m);
+            return;
+        }
+        cpu_loop_exit_atomic(env_cpu(env), ra);
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


