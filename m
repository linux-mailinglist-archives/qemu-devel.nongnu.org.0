Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751FB59C472
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:53:32 +0200 (CEST)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAg5-00052H-GP
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Op-0004h4-2x
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:39 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oe-0001cF-WE
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id f21so11361897pjt.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rs7twGLWoouQAsExme7uECc666n3pAQTjKmWbmzEPbo=;
 b=rmiK+akmaasFwyBDUJ5QffZOPR7hYesgydwPivEswoOvC2UzHjbQTCSGfG3ufPnC+j
 WMxr4q2YBdzKU7IzXQ/f+GImJCGV8q2LNe0RptTKBCZAaIp2TJu7501LI0KjnngGyJ5B
 zj8224K1yNyRCYQmn9dKgKMmyP2YP7np8JdO4KELm4HAP3krhp9x9gMkIGELRL1VHcFP
 r6V+vtBaWsp7x8NeONPBKlnEQ+dFA/2984441NAbrfHRyE7rzTbJqxANjdRVwnEupRQZ
 6N2e3KBYzIuQEu010k+Rhv2NRvqABv4j5VSMB82juBn0w9qC/kXGyDbKvmUjNsI0kPKx
 DDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rs7twGLWoouQAsExme7uECc666n3pAQTjKmWbmzEPbo=;
 b=06rJYl3U1cK0BaHmmWmwV9Sjl5FubJXJPjUmmLKjaVg/x0ugDj4ajRKzOsIKshePJq
 aevOJFMkPiNnri/xg9R9jg4OvZzi62mOJmAzpDb408oYA9W5v7jVvs3Tbx+2hWi5JWox
 ALeQ8ZxPqHk0JT6kKEl091xOT/BR1TOh2ygmhx8qxIA9qEigdhoHQQPfAnOEhE16Fj2l
 tqhJb32p2h2yi9xdaxfQAB1wOQTs5pWCjufQ/1jf5rlKHRp0T1nz0Cc6730TJsjLhkfE
 qc/SU59xMm5HVMCPmpIdiW8rcUEpBX1nuzw4YZz1r9DCexT/vOakzRyyVOpZICrNu6HR
 Zajw==
X-Gm-Message-State: ACgBeo3Og97E7veMv+vusS+vSKTA36OtsEzw4ZFo/3DfpDwJFP6pQPSM
 HygLlSK/f7OKMu/nar1s1y2GtNzogrBq5A==
X-Google-Smtp-Source: AA6agR7+myjfw8rmCTC7mR1mOe75IIJn6BWJcg4RVo64BgLlC0/tcK+Xizu6s4BWIAvR7H7ToQZpAw==
X-Received: by 2002:a17:902:e5cc:b0:16f:1e31:da6c with SMTP id
 u12-20020a170902e5cc00b0016f1e31da6cmr20768999plf.66.1661182283447; 
 Mon, 22 Aug 2022 08:31:23 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 45/66] target/arm: Use probe_access_full for MTE
Date: Mon, 22 Aug 2022 08:27:20 -0700
Message-Id: <20220822152741.1617527-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPUTLBEntryFull structure now stores the original pte attributes, as
well as the physical address.  Therefore, we no longer need a separate
bit in MemTxAttrs, nor do we need to walk the tree of memory regions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  1 -
 target/arm/sve_ldst_internal.h |  1 +
 target/arm/mte_helper.c        | 61 +++++++++-------------------------
 target/arm/sve_helper.c        | 54 ++++++++++--------------------
 target/arm/tlb_helper.c        |  4 ---
 5 files changed, 35 insertions(+), 86 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a08e546de4..8230a0b141 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3388,7 +3388,6 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
  * generic target bits directly.
  */
 #define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
-#define arm_tlb_mte_tagged(x) (typecheck_memtxattrs(x)->target_tlb_bit1)
 
 /*
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
diff --git a/target/arm/sve_ldst_internal.h b/target/arm/sve_ldst_internal.h
index b5c473fc48..4f159ec4ad 100644
--- a/target/arm/sve_ldst_internal.h
+++ b/target/arm/sve_ldst_internal.h
@@ -134,6 +134,7 @@ typedef struct {
     void *host;
     int flags;
     MemTxAttrs attrs;
+    bool tagged;
 } SVEHostPage;
 
 bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index fdd23ab3f8..a81c4a3318 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -105,10 +105,9 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                       TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
     return tags + index;
 #else
-    uintptr_t index;
     CPUTLBEntryFull *full;
+    MemTxAttrs attrs;
     int in_page, flags;
-    ram_addr_t ptr_ra;
     hwaddr ptr_paddr, tag_paddr, xlat;
     MemoryRegion *mr;
     ARMASIdx tag_asi;
@@ -124,30 +123,12 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * valid.  Indicate to probe_access_flags no-fault, then assert that
      * we received a valid page.
      */
-    flags = probe_access_flags(env, ptr, ptr_access, ptr_mmu_idx,
-                               ra == 0, &host, ra);
+    flags = probe_access_full(env, ptr, ptr_access, ptr_mmu_idx,
+                              ra == 0, &host, &full, ra);
     assert(!(flags & TLB_INVALID_MASK));
 
-    /*
-     * Find the CPUTLBEntryFull for ptr.  This *must* be present in the TLB
-     * because we just found the mapping.
-     * TODO: Perhaps there should be a cputlb helper that returns a
-     * matching tlb entry + iotlb entry.
-     */
-    index = tlb_index(env, ptr_mmu_idx, ptr);
-# ifdef CONFIG_DEBUG_TCG
-    {
-        CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
-        target_ulong comparator = (ptr_access == MMU_DATA_LOAD
-                                   ? entry->addr_read
-                                   : tlb_addr_write(entry));
-        g_assert(tlb_hit(comparator, ptr));
-    }
-# endif
-    full = &env_tlb(env)->d[ptr_mmu_idx].fulltlb[index];
-
     /* If the virtual page MemAttr != Tagged, access unchecked. */
-    if (!arm_tlb_mte_tagged(&full->attrs)) {
+    if (full->pte_attrs != 0xf0) {
         return NULL;
     }
 
@@ -162,6 +143,13 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
         return NULL;
     }
 
+    /*
+     * Remember these values across the second lookup below,
+     * which may invalidate this pointer via tlb resize.
+     */
+    ptr_paddr = full->phys_addr;
+    attrs = full->attrs;
+
     /*
      * The Normal memory access can extend to the next page.  E.g. a single
      * 8-byte access to the last byte of a page will check only the last
@@ -170,9 +158,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      */
     in_page = -(ptr | TARGET_PAGE_MASK);
     if (unlikely(ptr_size > in_page)) {
-        void *ignore;
-        flags |= probe_access_flags(env, ptr + in_page, ptr_access,
-                                    ptr_mmu_idx, ra == 0, &ignore, ra);
+        flags |= probe_access_full(env, ptr + in_page, ptr_access,
+                                   ptr_mmu_idx, ra == 0, &host, &full, ra);
         assert(!(flags & TLB_INVALID_MASK));
     }
 
@@ -180,33 +167,17 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     if (unlikely(flags & TLB_WATCHPOINT)) {
         int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
         assert(ra != 0);
-        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
-                             full->attrs, wp, ra);
+        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size, attrs, wp, ra);
     }
 
-    /*
-     * Find the physical address within the normal mem space.
-     * The memory region lookup must succeed because TLB_MMIO was
-     * not set in the cputlb lookup above.
-     */
-    mr = memory_region_from_host(host, &ptr_ra);
-    tcg_debug_assert(mr != NULL);
-    tcg_debug_assert(memory_region_is_ram(mr));
-    ptr_paddr = ptr_ra;
-    do {
-        ptr_paddr += mr->addr;
-        mr = mr->container;
-    } while (mr);
-
     /* Convert to the physical address in tag space.  */
     tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
 
     /* Look up the address in tag space. */
-    tag_asi = full->attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
+    tag_asi = attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
     tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
     mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
-                                 tag_access == MMU_DATA_STORE,
-                                 full->attrs);
+                                 tag_access == MMU_DATA_STORE, attrs);
 
     /*
      * Note that @mr will never be NULL.  If there is nothing in the address
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9cae8fd352..3d0d2987cd 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5351,8 +5351,19 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
      */
     addr = useronly_clean_ptr(addr);
 
+#ifdef CONFIG_USER_ONLY
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
+    memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both ANON and MTE; see allocation_tag_mem(). */
+    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
+#else
+    CPUTLBEntryFull *full;
+    flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
+                              &info->host, &full, retaddr);
+    info->attrs = full->attrs;
+    info->tagged = full->pte_attrs == 0xf0;
+#endif
     info->flags = flags;
 
     if (flags & TLB_INVALID_MASK) {
@@ -5362,33 +5373,6 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 
     /* Ensure that info->host[] is relative to addr, not addr + mem_off. */
     info->host -= mem_off;
-
-#ifdef CONFIG_USER_ONLY
-    memset(&info->attrs, 0, sizeof(info->attrs));
-    /* Require both MAP_ANON and PROT_MTE -- see allocation_tag_mem. */
-    arm_tlb_mte_tagged(&info->attrs) =
-        (flags & PAGE_ANON) && (flags & PAGE_MTE);
-#else
-    /*
-     * Find the iotlbentry for addr and return the transaction attributes.
-     * This *must* be present in the TLB because we just found the mapping.
-     */
-    {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-
-# ifdef CONFIG_DEBUG_TCG
-        CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-        target_ulong comparator = (access_type == MMU_DATA_LOAD
-                                   ? entry->addr_read
-                                   : tlb_addr_write(entry));
-        g_assert(tlb_hit(comparator, addr));
-# endif
-
-        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-        info->attrs = full->attrs;
-    }
-#endif
-
     return true;
 }
 
@@ -5617,7 +5601,7 @@ void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
     intptr_t mem_off, reg_off, reg_last;
 
     /* Process the page only if MemAttr == Tagged. */
-    if (arm_tlb_mte_tagged(&info->page[0].attrs)) {
+    if (info->page[0].tagged) {
         mem_off = info->mem_off_first[0];
         reg_off = info->reg_off_first[0];
         reg_last = info->reg_off_split;
@@ -5638,7 +5622,7 @@ void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
     }
 
     mem_off = info->mem_off_first[1];
-    if (mem_off >= 0 && arm_tlb_mte_tagged(&info->page[1].attrs)) {
+    if (mem_off >= 0 && info->page[1].tagged) {
         reg_off = info->reg_off_first[1];
         reg_last = info->reg_off_last[1];
 
@@ -6017,7 +6001,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
      * Disable MTE checking if the Tagged bit is not set.  Since TBI must
      * be set within MTEDESC for MTE, !mtedesc => !mte_active.
      */
-    if (!arm_tlb_mte_tagged(&info.page[0].attrs)) {
+    if (!info.page[0].tagged) {
         mtedesc = 0;
     }
 
@@ -6568,7 +6552,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                         cpu_check_watchpoint(env_cpu(env), addr, msize,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
-                    if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                    if (mtedesc && info.tagged) {
                         mte_check(env, mtedesc, addr, retaddr);
                     }
                     if (unlikely(info.flags & TLB_MMIO)) {
@@ -6585,7 +6569,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              msize, info.attrs,
                                              BP_MEM_READ, retaddr);
                     }
-                    if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                    if (mtedesc && info.tagged) {
                         mte_check(env, mtedesc, addr, retaddr);
                     }
                     tlb_fn(env, &scratch, reg_off, addr, retaddr);
@@ -6786,9 +6770,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                      (env_cpu(env), addr, msize) & BP_MEM_READ)) {
                     goto fault;
                 }
-                if (mtedesc &&
-                    arm_tlb_mte_tagged(&info.attrs) &&
-                    !mte_probe(env, mtedesc, addr)) {
+                if (mtedesc && info.tagged && !mte_probe(env, mtedesc, addr)) {
                     goto fault;
                 }
 
@@ -6974,7 +6956,7 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                          info.attrs, BP_MEM_WRITE, retaddr);
                 }
 
-                if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                if (mtedesc && info.tagged) {
                     mte_check(env, mtedesc, addr, retaddr);
                 }
             }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 353edbeb1d..3462a6ea14 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -231,10 +231,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             res.f.phys_addr &= TARGET_PAGE_MASK;
             address &= TARGET_PAGE_MASK;
         }
-        /* Notice and record tagged memory. */
-        if (cpu_isar_feature(aa64_mte, cpu) && res.cacheattrs.attrs == 0xf0) {
-            arm_tlb_mte_tagged(&res.f.attrs) = true;
-        }
 
         res.f.pte_attrs = res.cacheattrs.attrs;
         res.f.shareability = res.cacheattrs.shareability;
-- 
2.34.1


