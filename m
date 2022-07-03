Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72495645CC
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:30:56 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v0J-0000AH-Un
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuK-0006aR-CA
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:46 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuI-0005py-8Z
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:44 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so10558331pjm.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cfTTENCQsoGhQ/yqoDav68FHw7nBFVP+o4QSzS7SCR4=;
 b=w0LNhix7WDlfFXazh2zyFfb0/2117zaf55YgABS6GOVxaotSGLoQv+xWkDn75XazNq
 7ofcFZPLqCP6tu01FNXcQ+Xmx36Z96ttgo0N6B/Y+6VIBozoiCZvc7Pjg+2D+JiEj8Hh
 g42GJmmlZbv9Mzu732tQmBe3IusoR2JasH8xsxBCxorzQ9aiUYklB24vzYVKzkuJdzN2
 CvNfSsMIt/nWe785FCxVn7RoyE7wE9CzjdXdLGDOO5ZabdFre4WwRdY/ZbTkcgueZsbn
 nUt6/I3Xohml0QCSJ29wdSjS4Dh35qDN2+10wASpBhZwlmbo4QI4gfvMr0d2wi755H15
 g8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cfTTENCQsoGhQ/yqoDav68FHw7nBFVP+o4QSzS7SCR4=;
 b=jm4PsXBpX4LF9RG5NWH9NLykcURUydtAu/JAIbWeLRuuRZdkoTMJ6+Mdy8faJfO55C
 n+PBb0WtqkoA4eDEDpOdI26/BA7ZN33i+UcINSpe5tUJx2lu7a06buHvzECnYc3Ivv9/
 SkY9obSrEGT0PL+mhZFxYmeUs0VePlHQK/52lbx+kOM8+TnWwYk04E+JKRJlTGiwnHcs
 cHkATeI9kd2fTiFTBfgJOSKB4taXyOKoYnWJxg4xDEhOY/iF+qRX5la7edG6sbOVgPuj
 Sj5stm+Mu+lMKe3X9Vb8So4jPMBxXkVOc0wmxnjjXvwsu5IE1jF56h3/Cq7ha0dIRU0C
 Iu7g==
X-Gm-Message-State: AJIora/JHdzdIw2PYoY8VQEU9PsJXn7XtByxYFYoJOGX4aoNG96tr5nU
 tGOnHADiw1HXvLSQvNiaxkQaILu+zSx4BO58
X-Google-Smtp-Source: AGRyM1uHrKiRbxiraUyN+HUSzcrPZouvoKwaigrw1mYlSevpPj99896l+mBKtqKTZXIoz3wxUsxa3A==
X-Received: by 2002:a17:90a:408f:b0:1e3:23a:2370 with SMTP id
 l15-20020a17090a408f00b001e3023a2370mr27242211pjg.84.1656836680538; 
 Sun, 03 Jul 2022 01:24:40 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/62] target/arm: Use PageEntryExtra for MTE
Date: Sun,  3 Jul 2022 13:53:22 +0530
Message-Id: <20220703082419.770989-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Tagged pages are indicated by the page attributes, so we
don't need to use a separate bit in MemTxAttrs.  Further,
we store the PA, so we don't need to recover it by walking
the tree of memory regions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  1 -
 target/arm/sve_ldst_internal.h |  1 +
 target/arm/mte_helper.c        | 52 +++++++--------------------------
 target/arm/sve_helper.c        | 53 +++++++++++-----------------------
 target/arm/tlb_helper.c        |  4 ---
 5 files changed, 28 insertions(+), 83 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4a4342f262..a26b9437e9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3369,7 +3369,6 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
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
index d11a8c70d0..5327df96d9 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -105,10 +105,9 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                       TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
     return tags + index;
 #else
-    uintptr_t index;
-    CPUIOTLBEntry *iotlbentry;
+    MemTxAttrs attrs;
+    PageEntryExtra extra;
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
+    flags = probe_access_extra(env, ptr, ptr_access, ptr_mmu_idx,
+                               ra == 0, &host, &attrs, &extra, ra);
     assert(!(flags & TLB_INVALID_MASK));
 
-    /*
-     * Find the iotlbentry for ptr.  This *must* be present in the TLB
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
-    iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
-
     /* If the virtual page MemAttr != Tagged, access unchecked. */
-    if (!arm_tlb_mte_tagged(&iotlbentry->attrs)) {
+    if (FIELD_EX64(extra.x, PAGEENTRYEXTRA, ATTRS) != 0xf0) {
         return NULL;
     }
 
@@ -180,33 +161,20 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     if (unlikely(flags & TLB_WATCHPOINT)) {
         int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
         assert(ra != 0);
-        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
-                             iotlbentry->attrs, wp, ra);
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
+    /* Recover the physical address from PageEntryExtra. */
+    ptr_paddr = extra.x & R_PAGEENTRYEXTRA_PA_MASK;
 
     /* Convert to the physical address in tag space.  */
     tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
 
     /* Look up the address in tag space. */
-    tag_asi = iotlbentry->attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
+    tag_asi = attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
     tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
     mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
-                                 tag_access == MMU_DATA_STORE,
-                                 iotlbentry->attrs);
+                                 tag_access == MMU_DATA_STORE, attrs);
 
     /*
      * Note that @mr will never be NULL.  If there is nothing in the address
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0c6379e6e8..4b853a25aa 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5323,8 +5323,18 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
      */
     addr = useronly_clean_ptr(addr);
 
+#ifdef CONFIG_USER_ONLY
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
+    memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both ANON and MTE; see allocation_tag_mem(). */
+    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
+#else
+    PageEntryExtra extra;
+    flags = probe_access_extra(env, addr, access_type, mmu_idx, nofault,
+                               &info->host, &info->attrs, &extra, retaddr);
+    info->tagged = FIELD_EX64(extra.x, PAGEENTRYEXTRA, ATTRS) == 0xf0;
+#endif
     info->flags = flags;
 
     if (flags & TLB_INVALID_MASK) {
@@ -5334,33 +5344,6 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 
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
-        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
-        info->attrs = iotlbentry->attrs;
-    }
-#endif
-
     return true;
 }
 
@@ -5589,7 +5572,7 @@ void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
     intptr_t mem_off, reg_off, reg_last;
 
     /* Process the page only if MemAttr == Tagged. */
-    if (arm_tlb_mte_tagged(&info->page[0].attrs)) {
+    if (info->page[0].tagged) {
         mem_off = info->mem_off_first[0];
         reg_off = info->reg_off_first[0];
         reg_last = info->reg_off_split;
@@ -5610,7 +5593,7 @@ void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
     }
 
     mem_off = info->mem_off_first[1];
-    if (mem_off >= 0 && arm_tlb_mte_tagged(&info->page[1].attrs)) {
+    if (mem_off >= 0 && info->page[1].tagged) {
         reg_off = info->reg_off_first[1];
         reg_last = info->reg_off_last[1];
 
@@ -5989,7 +5972,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
      * Disable MTE checking if the Tagged bit is not set.  Since TBI must
      * be set within MTEDESC for MTE, !mtedesc => !mte_active.
      */
-    if (!arm_tlb_mte_tagged(&info.page[0].attrs)) {
+    if (!info.page[0].tagged) {
         mtedesc = 0;
     }
 
@@ -6540,7 +6523,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                         cpu_check_watchpoint(env_cpu(env), addr, msize,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
-                    if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                    if (mtedesc && info.tagged) {
                         mte_check(env, mtedesc, addr, retaddr);
                     }
                     if (unlikely(info.flags & TLB_MMIO)) {
@@ -6557,7 +6540,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              msize, info.attrs,
                                              BP_MEM_READ, retaddr);
                     }
-                    if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                    if (mtedesc && info.tagged) {
                         mte_check(env, mtedesc, addr, retaddr);
                     }
                     tlb_fn(env, &scratch, reg_off, addr, retaddr);
@@ -6758,9 +6741,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                      (env_cpu(env), addr, msize) & BP_MEM_READ)) {
                     goto fault;
                 }
-                if (mtedesc &&
-                    arm_tlb_mte_tagged(&info.attrs) &&
-                    !mte_probe(env, mtedesc, addr)) {
+                if (mtedesc && info.tagged && !mte_probe(env, mtedesc, addr)) {
                     goto fault;
                 }
 
@@ -6946,7 +6927,7 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                          info.attrs, BP_MEM_WRITE, retaddr);
                 }
 
-                if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                if (mtedesc && info.tagged) {
                     mte_check(env, mtedesc, addr, retaddr);
                 }
             }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 9de3099153..1305b6ec7d 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -245,10 +245,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, SHAREABILITY,
                                  cacheattrs.shareability);
         }
-        /* Notice and record tagged memory. */
-        if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
-            arm_tlb_mte_tagged(&attrs) = true;
-        }
 
         tlb_set_page_with_extra(cs, address, phys_addr, attrs, extra,
                                 prot, mmu_idx, page_size);
-- 
2.34.1


