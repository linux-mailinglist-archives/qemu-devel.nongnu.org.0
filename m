Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031C6FEDC6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:17:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lu-0007gN-RP; Thu, 11 May 2023 04:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ls-0007fP-C5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Lc-0001y9-Pv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:40 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bd875398dso12517524a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792503; x=1686384503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/dmi9xjBdUQfTaksbEx13XlYlPUDWswdK9wXBJTckw=;
 b=D4hkTnokiT2ryCCE29kGk78EmsWaERmMyqIYygqtdAbZWnc3c+jJPOq3Jg923piWYR
 h78JjKJcl448nqs5VYDKTw3A/Bck97VNT0xx1oMQxLzVFTK+c8Y1Gf/fzGiN4TWKFfq/
 tr2vMPedvOQJvyX+9PCqIJFI68Y7GeWLNXwyQEywq9J2EbIQP0yhs90rtGkAdEZqpZGl
 mHsOpWuPzTWeYxTCq0vYMZa0DwfNmAhRMkyAZb8TVMeTIQTSnbWf6j6x+7PGpSSKqtBj
 TUyHjm54Z5BpIKg/jQcCNg4s+lDtHGSe6WG0Nsqye9nV1XGOsygqO6HxgsndmTDnzJn2
 6Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792503; x=1686384503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/dmi9xjBdUQfTaksbEx13XlYlPUDWswdK9wXBJTckw=;
 b=h8aaYv/gfU0BxfQH/wFmZtdo9QWKvpdj7vyV+CIu5WaPj9k6Zr60TwH+9iYJxWzpxF
 KfztzYEhXfXXMgY2an1UX5v6+V5RRl8oDqZpcrI9MIhmSbUUW3cGJ68sjypwOriiRhmy
 ksjZgBgNDGFbRT12RxedvwGBTfE6oF25kd2uqSlS2wCyMKkrKGh9U6jkiFOkGEqZPH6F
 HtTuLcxn4ym+kryseaT4lprAIAImRV4wP2A13J+VFzg+uOGkXN7IDdRI1eJZANp4yz6h
 ALum2msZSdITkJ8oUFtIU+HH/dKDPXE3FG77rz9ci/bTTYnikirgLXd3AkDVX+pSYCDN
 LojA==
X-Gm-Message-State: AC+VfDwJK+g6l0J1Dh5ePr/BeJlj12yc3K4vzSmUzsDSQy46HOhaLX39
 BFkWIgoCMu6WxLYrHPdbP5Xd/WufGW+jURczocCOfA==
X-Google-Smtp-Source: ACHHUZ6I8n+Y9Qr54dP+QcjLHxwBt0cP1g4L9q5HLL/32326NKQNU0SvhidJN+WPP2v45eU1N+1qjw==
X-Received: by 2002:a17:907:928b:b0:966:2123:e0c3 with SMTP id
 bw11-20020a170907928b00b009662123e0c3mr13642791ejc.15.1683792503213; 
 Thu, 11 May 2023 01:08:23 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 50/53] accel/tcg: Introduce tlb_read_idx
Date: Thu, 11 May 2023 09:04:47 +0100
Message-Id: <20230511080450.860923-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h |   7 ++-
 include/exec/cpu_ldst.h |  26 ++++++++--
 accel/tcg/cputlb.c      | 104 +++++++++++++---------------------------
 3 files changed, 59 insertions(+), 78 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index e1c498ef4b..a6e0cf1812 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -111,8 +111,11 @@ typedef struct CPUTLBEntry {
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
index c141f0394f..7c867c94c3 100644
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
index 0b8a5f93d2..5051244c67 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1441,34 +1441,17 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
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
@@ -1490,11 +1473,6 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
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
@@ -1527,29 +1505,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
@@ -1571,7 +1532,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
              */
             flags &= ~TLB_INVALID_MASK;
         }
-        tlb_addr = tlb_read_ofs(entry, elt_ofs);
+        tlb_addr = tlb_read_idx(entry, access_type);
     }
     flags &= tlb_addr;
 
@@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     if (prot & PAGE_WRITE) {
         tlb_addr = tlb_addr_write(tlbe);
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_STORE, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_read, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_LOAD, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1929,13 +1892,9 @@ load_memop(const void *haddr, MemOp op)
 
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
@@ -1955,18 +1914,18 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 
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
 
@@ -2052,7 +2011,8 @@ static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_UB);
-    return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_UB, MMU_DATA_LOAD,
+                       full_ldub_mmu);
 }
 
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
@@ -2065,7 +2025,7 @@ static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUW);
-    return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUW, MMU_DATA_LOAD,
                        full_le_lduw_mmu);
 }
 
@@ -2079,7 +2039,7 @@ static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUW);
-    return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUW, MMU_DATA_LOAD,
                        full_be_lduw_mmu);
 }
 
@@ -2093,7 +2053,7 @@ static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUL);
-    return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUL, MMU_DATA_LOAD,
                        full_le_ldul_mmu);
 }
 
@@ -2107,7 +2067,7 @@ static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUL);
-    return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUL, MMU_DATA_LOAD,
                        full_be_ldul_mmu);
 }
 
@@ -2121,7 +2081,7 @@ uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_LEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUQ, MMU_DATA_LOAD,
                        helper_le_ldq_mmu);
 }
 
@@ -2129,7 +2089,7 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_BEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUQ, MMU_DATA_LOAD,
                        helper_be_ldq_mmu);
 }
 
@@ -2325,7 +2285,6 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
                        uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
                        bool big_endian)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     uintptr_t index, index2;
     CPUTLBEntry *entry, *entry2;
     target_ulong page1, page2, tlb_addr, tlb_addr2;
@@ -2347,7 +2306,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
 
     tlb_addr2 = tlb_addr_write(entry2);
     if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
-        if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
+        if (!victim_tlb_hit(env, mmu_idx, index2, MMU_DATA_STORE, page2)) {
             tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
                      mmu_idx, retaddr);
             index2 = tlb_index(env, mmu_idx, page2);
@@ -2400,7 +2359,6 @@ static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
              MemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     const unsigned a_bits = get_alignment_bits(get_memop(oi));
     const size_t size = memop_size(op);
     uintptr_t mmu_idx = get_mmuidx(oi);
@@ -2423,7 +2381,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
+        if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
             addr & TARGET_PAGE_MASK)) {
             tlb_fill(env_cpu(env), addr, size, MMU_DATA_STORE,
                      mmu_idx, retaddr);
@@ -2729,7 +2687,8 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
 static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_8, true, full_ldub_code);
+    return load_helper(env, addr, oi, retaddr, MO_8,
+                       MMU_INST_FETCH, full_ldub_code);
 }
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
@@ -2741,7 +2700,8 @@ uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_lduw_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUW, true, full_lduw_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUW,
+                       MMU_INST_FETCH, full_lduw_code);
 }
 
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
@@ -2753,7 +2713,8 @@ uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_ldl_code(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUL, true, full_ldl_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUL,
+                       MMU_INST_FETCH, full_ldl_code);
 }
 
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
@@ -2765,7 +2726,8 @@ uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
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


