Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C662F200
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxyr-0007HV-Hz; Fri, 18 Nov 2022 04:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyl-00079y-LZ
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:12 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyj-0001zS-AJ
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:11 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso4588078pjc.2
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tsyuqEltcHTpckmF/ik/Z/4NbKMVod9kY0ODODwD9J0=;
 b=rky+NCtd+GCnamymXcoog2Nx6Qv+V55KumMsaWlBfPzYCb4V/cytRZJkEDLvuNCa2V
 oyFbejhUHI8ApzrwkmBLntmlRecXMU246bkH4XbWerPQiDAgJiiFeUDlryrhqY3S5hfP
 QKLLUlQftCw1cgoQTi8zQt6OvMol87TgBN1afYPxCPagMsjcZFbclmmxFhIfCr0+5kWm
 LmcPXqF2mkxJbA8jPlWVqv6O+RrX8joyS3BI3yhQUCiSbYjrFAcy9PDbH3kf1uXjux82
 SGrL+svmtVK8BREGL02ngjSqWMGtUnX80s1tIn1Yt67fzxbzvshyxyxZ9vPRw47S4/CB
 IRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsyuqEltcHTpckmF/ik/Z/4NbKMVod9kY0ODODwD9J0=;
 b=ycn4MpYlaElAcFL2J6fasQ8qdekCZ1x53kMp2QVk+prTEC1gdxm9mlLmii4hMV6ROQ
 nfkK5/hgSCtNa+XAKn4Syc2IM5NakoInJfzaUwubf5iiVvrAxKagoEZMrBNbF5Ym9MJv
 flA1ulhQtttVU9SU45Igbr4UJqtkWxgICaLFij3JpA6F0wpZDoQOB3zEEX94LtciQZXB
 J7RbDEWvWCPrIPkiGhUmarn+s3QpErgqTk69oxf/JNYn9cTy7NpP0LagsfVuxbVDkYjR
 efC1NnIveMO8cBMpjiLKGO+i4v5OU1DHJT88YkgONe8IA/XLfQdQZZ5SEh2Ve3e8/PUl
 JxDQ==
X-Gm-Message-State: ANoB5pmkTig52s4lv4lKJUVFIpRpbIXJ9bHgCi2EuIkbt1727GVntj2m
 JVbGth5ouNed2laqMn4BvzVYk/GVWykk6g==
X-Google-Smtp-Source: AA0mqf5cMox1cZ33v9oHqYihycs9jmUOszPHSMnXMsgCDJNnLEr1PESsUiftKV41Dn+9BZg5AyGsYA==
X-Received: by 2002:a17:902:e1d1:b0:188:7675:ff9b with SMTP id
 t17-20020a170902e1d100b001887675ff9bmr6774859pla.45.1668764888057; 
 Fri, 18 Nov 2022 01:48:08 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 04/29] accel/tcg: Introduce tlb_read_idx
Date: Fri, 18 Nov 2022 01:47:29 -0800
Message-Id: <20221118094754.242910-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Instead of playing with offsetof in various places, use
MMUAccessType to index an array.  This is easily defined
instead of the previous dummy padding array in the union.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h |   7 ++-
 include/exec/cpu_ldst.h |  26 ++++++++--
 accel/tcg/cputlb.c      | 104 +++++++++++++---------------------------
 3 files changed, 59 insertions(+), 78 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 21309cf567..7ce3bcb06b 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -128,8 +128,11 @@ typedef struct CPUTLBEntry {
                use the corresponding iotlb value.  */
             uintptr_t addend;
         };
-        /* padding to get a power of two size */
-        uint8_t dummy[1 << CPU_TLB_ENTRY_BITS];
+        /*
+         * Padding to get a power of two size, as well as index
+         * access to addr_{read,write,code}.
+         */
+        target_ulong addr_idx[(1 << CPU_TLB_ENTRY_BITS) / TARGET_LONG_SIZE];
     };
 } CPUTLBEntry;
 
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 09b55cc0ee..fad6efc0ad 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -360,13 +360,29 @@ static inline void clear_helper_retaddr(void)
 /* Needed for TCG_OVERSIZED_GUEST */
 #include "tcg/tcg.h"
 
+static inline target_ulong tlb_read_idx(const CPUTLBEntry *entry,
+                                        MMUAccessType access_type)
+{
+    /* Do not rearrange the CPUTLBEntry structure members. */
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
+                      MMU_DATA_LOAD * TARGET_LONG_SIZE);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
+                      MMU_DATA_STORE * TARGET_LONG_SIZE);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
+                      MMU_INST_FETCH * TARGET_LONG_SIZE);
+
+    const target_ulong *ptr = &entry->addr_idx[access_type];
+#if TCG_OVERSIZED_GUEST
+    return *ptr;
+#else
+    /* ofs might correspond to .addr_write, so use qatomic_read */
+    return qatomic_read(ptr);
+#endif
+}
+
 static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
 {
-#if TCG_OVERSIZED_GUEST
-    return entry->addr_write;
-#else
-    return qatomic_read(&entry->addr_write);
-#endif
+    return tlb_read_idx(entry, MMU_DATA_STORE);
 }
 
 /* Find the TLB index corresponding to the mmu_idx + address pair.  */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d177afcad6..00a2b217e5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1437,34 +1437,17 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
     }
 }
 
-static inline target_ulong tlb_read_ofs(CPUTLBEntry *entry, size_t ofs)
-{
-#if TCG_OVERSIZED_GUEST
-    return *(target_ulong *)((uintptr_t)entry + ofs);
-#else
-    /* ofs might correspond to .addr_write, so use qatomic_read */
-    return qatomic_read((target_ulong *)((uintptr_t)entry + ofs));
-#endif
-}
-
 /* Return true if ADDR is present in the victim tlb, and has been copied
    back to the main tlb.  */
 static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
-                           size_t elt_ofs, target_ulong page)
+                           MMUAccessType access_type, target_ulong page)
 {
     size_t vidx;
 
     assert_cpu_is_self(env_cpu(env));
     for (vidx = 0; vidx < CPU_VTLB_SIZE; ++vidx) {
         CPUTLBEntry *vtlb = &env_tlb(env)->d[mmu_idx].vtable[vidx];
-        target_ulong cmp;
-
-        /* elt_ofs might correspond to .addr_write, so use qatomic_read */
-#if TCG_OVERSIZED_GUEST
-        cmp = *(target_ulong *)((uintptr_t)vtlb + elt_ofs);
-#else
-        cmp = qatomic_read((target_ulong *)((uintptr_t)vtlb + elt_ofs));
-#endif
+        target_ulong cmp = tlb_read_idx(vtlb, access_type);
 
         if (cmp == page) {
             /* Found entry in victim tlb, swap tlb and iotlb.  */
@@ -1486,11 +1469,6 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
     return false;
 }
 
-/* Macro to call the above, with local variables from the use context.  */
-#define VICTIM_TLB_HIT(TY, ADDR) \
-  victim_tlb_hit(env, mmu_idx, index, offsetof(CPUTLBEntry, TY), \
-                 (ADDR) & TARGET_PAGE_MASK)
-
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
                            CPUTLBEntryFull *full, uintptr_t retaddr)
 {
@@ -1526,29 +1504,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
 {
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-    target_ulong tlb_addr, page_addr;
-    size_t elt_ofs;
-    int flags;
+    target_ulong tlb_addr = tlb_read_idx(entry, access_type);
+    target_ulong page_addr = addr & TARGET_PAGE_MASK;
+    int flags = TLB_FLAGS_MASK;
 
-    switch (access_type) {
-    case MMU_DATA_LOAD:
-        elt_ofs = offsetof(CPUTLBEntry, addr_read);
-        break;
-    case MMU_DATA_STORE:
-        elt_ofs = offsetof(CPUTLBEntry, addr_write);
-        break;
-    case MMU_INST_FETCH:
-        elt_ofs = offsetof(CPUTLBEntry, addr_code);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    tlb_addr = tlb_read_ofs(entry, elt_ofs);
-
-    flags = TLB_FLAGS_MASK;
-    page_addr = addr & TARGET_PAGE_MASK;
     if (!tlb_hit_page(tlb_addr, page_addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
+        if (!victim_tlb_hit(env, mmu_idx, index, access_type, page_addr)) {
             CPUState *cs = env_cpu(env);
 
             if (!cs->cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
@@ -1570,7 +1531,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
              */
             flags &= ~TLB_INVALID_MASK;
         }
-        tlb_addr = tlb_read_ofs(entry, elt_ofs);
+        tlb_addr = tlb_read_idx(entry, access_type);
     }
     flags &= tlb_addr;
 
@@ -1784,7 +1745,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     if (prot & PAGE_WRITE) {
         tlb_addr = tlb_addr_write(tlbe);
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_STORE, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1808,7 +1770,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_LOAD, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1894,13 +1857,9 @@ load_memop(const void *haddr, MemOp op)
 
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
-            uintptr_t retaddr, MemOp op, bool code_read,
+            uintptr_t retaddr, MemOp op, MMUAccessType access_type,
             FullLoadHelper *full_load)
 {
-    const size_t tlb_off = code_read ?
-        offsetof(CPUTLBEntry, addr_code) : offsetof(CPUTLBEntry, addr_read);
-    const MMUAccessType access_type =
-        code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
     const unsigned a_bits = get_alignment_bits(get_memop(oi));
     const size_t size = memop_size(op);
     uintptr_t mmu_idx = get_mmuidx(oi);
@@ -1920,18 +1879,18 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 
     index = tlb_index(env, mmu_idx, addr);
     entry = tlb_entry(env, mmu_idx, addr);
-    tlb_addr = code_read ? entry->addr_code : entry->addr_read;
+    tlb_addr = tlb_read_idx(entry, access_type);
 
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
+        if (!victim_tlb_hit(env, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
             tlb_fill(env_cpu(env), addr, size,
                      access_type, mmu_idx, retaddr);
             index = tlb_index(env, mmu_idx, addr);
             entry = tlb_entry(env, mmu_idx, addr);
         }
-        tlb_addr = code_read ? entry->addr_code : entry->addr_read;
+        tlb_addr = tlb_read_idx(entry, access_type);
         tlb_addr &= ~TLB_INVALID_MASK;
     }
 
@@ -2017,7 +1976,8 @@ static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_UB);
-    return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_UB, MMU_DATA_LOAD,
+                       full_ldub_mmu);
 }
 
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
@@ -2030,7 +1990,7 @@ static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUW);
-    return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUW, MMU_DATA_LOAD,
                        full_le_lduw_mmu);
 }
 
@@ -2044,7 +2004,7 @@ static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUW);
-    return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUW, MMU_DATA_LOAD,
                        full_be_lduw_mmu);
 }
 
@@ -2058,7 +2018,7 @@ static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUL);
-    return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUL, MMU_DATA_LOAD,
                        full_le_ldul_mmu);
 }
 
@@ -2072,7 +2032,7 @@ static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUL);
-    return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUL, MMU_DATA_LOAD,
                        full_be_ldul_mmu);
 }
 
@@ -2086,7 +2046,7 @@ uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_LEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUQ, MMU_DATA_LOAD,
                        helper_le_ldq_mmu);
 }
 
@@ -2094,7 +2054,7 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_BEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUQ, MMU_DATA_LOAD,
                        helper_be_ldq_mmu);
 }
 
@@ -2290,7 +2250,6 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
                        uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
                        bool big_endian)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     uintptr_t index, index2;
     CPUTLBEntry *entry, *entry2;
     target_ulong page1, page2, tlb_addr, tlb_addr2;
@@ -2312,7 +2271,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
 
     tlb_addr2 = tlb_addr_write(entry2);
     if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
-        if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
+        if (!victim_tlb_hit(env, mmu_idx, index2, MMU_DATA_STORE, page2)) {
             tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
                      mmu_idx, retaddr);
             index2 = tlb_index(env, mmu_idx, page2);
@@ -2365,7 +2324,6 @@ static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
              MemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     const unsigned a_bits = get_alignment_bits(get_memop(oi));
     const size_t size = memop_size(op);
     uintptr_t mmu_idx = get_mmuidx(oi);
@@ -2388,7 +2346,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
+        if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
             addr & TARGET_PAGE_MASK)) {
             tlb_fill(env_cpu(env), addr, size, MMU_DATA_STORE,
                      mmu_idx, retaddr);
@@ -2694,7 +2652,8 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
 static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_8, true, full_ldub_code);
+    return load_helper(env, addr, oi, retaddr, MO_8,
+                       MMU_INST_FETCH, full_ldub_code);
 }
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
@@ -2706,7 +2665,8 @@ uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_lduw_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUW, true, full_lduw_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUW,
+                       MMU_INST_FETCH, full_lduw_code);
 }
 
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
@@ -2718,7 +2678,8 @@ uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_ldl_code(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUL, true, full_ldl_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUL,
+                       MMU_INST_FETCH, full_ldl_code);
 }
 
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
@@ -2730,7 +2691,8 @@ uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_ldq_code(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUQ, true, full_ldq_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUQ,
+                       MMU_INST_FETCH, full_ldq_code);
 }
 
 uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
-- 
2.34.1


