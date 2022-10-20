Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AFD6062F1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:26:06 +0200 (CEST)
Received: from localhost ([::1]:49272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWUn-0008Te-I3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:26:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWSE-0003G9-0b
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYh-0001Gc-QM
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYe-0000y7-AQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:21:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i9so938694wrv.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Oe06er6jGlFFaklSfv79nMFtqbvlZdD33qZ6Ccm6mXE=;
 b=pzjv/TSAcPq/M0WbPdVrF9OX6Y5gluSF12V0UEO8xou8NAmdNPy89CtaKxBSvPUPlq
 iz6rbFZVU3pQBhypqnvUfV4LZIIesRYOsvow8aE2zS25AHGkXv9ur1vVX/RmmEmAfRL9
 8+TRWQJvR+Mxw2cDbAVuZa5AGzAQTGzhEGifbX0igE73hBWXDk9u/keVfC5AinxJLk2t
 1OJRAeUdne/qP4KRVm7xhzI2ARKLWRd/q9gH/Mc3UlQXdNxPYq1GWjGAVdiCD8WJNASB
 6tkAU+kzrao0oN+TMQBsa/PPdYsz68znj9OJ5z3Ea7Rk/yiIy/+ZMD9FsGBeaf9vGLkM
 XqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oe06er6jGlFFaklSfv79nMFtqbvlZdD33qZ6Ccm6mXE=;
 b=Jheyq6zZ7skKjEVm6/igSHqjjO2mWM2icyDpuHK5oWogxKoqxYBapeokJ7Tn3Y6dP8
 IvhUzBuDesbLPNVCYNKZc2PJ+p8BYYfPQ6Z5W1yv8A+ADfPCjDN+E8aCQQJuTFlbbx4e
 C3bss/sFf/odQ9AeBVPEADb2TypF/7nUvtLwfcObLlzkjRBkujAooq/3OTyLD7wgqOEt
 w9Q27/lIrDzH4QSPjgxCvS8IKQfUaGOHcLblmEB+SfSP3hbo4dgZt6Y/J0sEODpsaseH
 KTV7BkTc7+QGA0KiGGElc4RVybcIWUoVZoVLsFYd/Yw3NQCx6wQvYIp9EKhCTMi/bzRC
 d54Q==
X-Gm-Message-State: ACrzQf3/QL3X9S1qOig1VJZpLRpfyiG93R+Bgvcah+bRCwLb4WiPRo41
 EHJ4yTEii631Akw4a0rt+hnVX0nCgwf5IA==
X-Google-Smtp-Source: AMsMyM7S14dn2B5cFxu8YBUe/WJVieFFbW1wpuL5tzVN+CKkhPk1oopnNRqtMbbHQZCJRidLs2HbXA==
X-Received: by 2002:adf:a4ce:0:b0:22e:48a8:dcdc with SMTP id
 h14-20020adfa4ce000000b0022e48a8dcdcmr8347967wrb.486.1666268514229; 
 Thu, 20 Oct 2022 05:21:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] target/arm: Use probe_access_full for MTE
Date: Thu, 20 Oct 2022 13:21:26 +0100
Message-Id: <20221020122146.3177980-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The CPUTLBEntryFull structure now stores the original pte attributes, as
well as the physical address.  Therefore, we no longer need a separate
bit in MemTxAttrs, nor do we need to walk the tree of memory regions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               |  1 -
 target/arm/sve_ldst_internal.h |  1 +
 target/arm/mte_helper.c        | 62 ++++++++++------------------------
 target/arm/sve_helper.c        | 54 ++++++++++-------------------
 target/arm/tlb_helper.c        |  4 ---
 5 files changed, 36 insertions(+), 86 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e3dbef5be86..9a358c410be 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3400,7 +3400,6 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
  * generic target bits directly.
  */
 #define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
-#define arm_tlb_mte_tagged(x) (typecheck_memtxattrs(x)->target_tlb_bit1)
 
 /*
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
diff --git a/target/arm/sve_ldst_internal.h b/target/arm/sve_ldst_internal.h
index b5c473fc48b..4f159ec4adf 100644
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
index fdd23ab3f89..e85208339e9 100644
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
 
@@ -162,6 +143,14 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
         return NULL;
     }
 
+    /*
+     * Remember these values across the second lookup below,
+     * which may invalidate this pointer via tlb resize.
+     */
+    ptr_paddr = full->phys_addr;
+    attrs = full->attrs;
+    full = NULL;
+
     /*
      * The Normal memory access can extend to the next page.  E.g. a single
      * 8-byte access to the last byte of a page will check only the last
@@ -170,9 +159,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
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
 
@@ -180,33 +168,17 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
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
index 9cae8fd352f..3d0d2987cd0 100644
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
index 353edbeb1de..3462a6ea14e 100644
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
2.25.1


