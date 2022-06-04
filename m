Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC953D56C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:28:24 +0200 (CEST)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLOi-0003YO-0v
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3T-00086Z-Ul
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:27 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3R-00008i-Hl
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o6so3033649plg.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MlDbZJ4tTAYIMhlSiDFHC8cjPSfeu4cSmYSRMTelt2s=;
 b=Jc8MTvtP6IPNdFxh9Gw2NDm3GvsnUmFQFzR5d+FWQ+QPJXBFdPfxHLsoL7ORU//aMR
 zMbHtG+HwnE9cMVg+BbD6LwCwiFdmk6Dgz6WmjYWT14QqOq9CFsuOgvrF2wQ3dw7aNLl
 mtKoQhqImBpXT0FCht256r5Ew2VtomU16+oGmB/MhysuqXXjt1BTWj4Zc171BFoY1NZR
 3a8VFvMh23fRpT0OEcu3saj5vGvAj6PHqGSo5dUTioIb2cQUd4hmiqWDvqFCEJbupOts
 xWx17Upv01Pr5/z6EWEniO92Bm/09JPcLJpkz6L3En7QyhLK1L94thRitqVeXmX35gTe
 OEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MlDbZJ4tTAYIMhlSiDFHC8cjPSfeu4cSmYSRMTelt2s=;
 b=vPdaWeNtHaWwR0rVLy4YMXi+eSC8j/FP/8/u+AQ0wCJ0zbCXzaWPEbrRE3qHXs9MA8
 0Hw6Yh+sU3+LyJzDDMBtC7uQPCF9i6CsQTrKWcMh2lE7bRLcB02Q7+h5mNW6FGmOrl4L
 eQ6xhWq32XjCRAMRJ3MF8SSZ7EcNWg7d0L6agTkEFbLp/09Ax5UlEPbLNHGeqcqG/rOd
 o1e6Yd0WCDUJvuEQCQrrNpY+6/JqDqYrzd1GvAaWCMf3kiYyq51VRL5fnHd+6QCYaOpr
 q0qvWwTyrQo68UwwKON7vQsLF3NAnq6AcGQ1VaPieCO2dvZxrkNS7EdvqqX7Tt9TAuGN
 nGWA==
X-Gm-Message-State: AOAM533feipLThvdqKxdj8CNBVbBWuE26ZejsdDB7g72Fzd8VAMxABlp
 7UAJ4CXh2QM8KsCYex2ba2KjwjEMUG5sBQ==
X-Google-Smtp-Source: ABdhPJx1PYRraOWLH0GL7C/Gvij/t0MMNfjtzHQs0dw/XlEu2Z/Zf4bNv/lCLJu5s4Tddnsdkl6m/g==
X-Received: by 2002:a17:902:f789:b0:163:935d:aa69 with SMTP id
 q9-20020a170902f78900b00163935daa69mr12977826pln.165.1654315584086; 
 Fri, 03 Jun 2022 21:06:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/28] target/arm: Move arm_{ldl,ldq}_ptw to ptw.c
Date: Fri,  3 Jun 2022 21:05:55 -0700
Message-Id: <20220604040607.269301-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Move the ptw load functions, plus 3 common subroutines:
S1_ptw_translate, ptw_attrs_are_device, and regime_translation_big_endian.
This also allows get_phys_addr_lpae to become static again.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  13 ----
 target/arm/helper.c | 141 --------------------------------------
 target/arm/ptw.c    | 160 ++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 154 insertions(+), 160 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 31744df664..28b8cb9fb8 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -13,11 +13,6 @@
 
 extern const uint8_t pamax_map[7];
 
-uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
-uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
-
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
@@ -40,13 +35,5 @@ int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0);
 int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                int ap, int ns, int xn, int pxn);
 
-bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                        bool s1_is_el0,
-                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-                        target_ulong *page_size_ptr,
-                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
-    __attribute__((nonnull));
-
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 416e155a0f..f6931237fe 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10439,12 +10439,6 @@ bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static inline bool regime_translation_big_endian(CPUARMState *env,
-                                                 ARMMMUIdx mmu_idx)
-{
-    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
-}
-
 /* Return the TTBR associated with this translation regime */
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
@@ -10737,141 +10731,6 @@ int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
-static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
-{
-    /*
-     * For an S1 page table walk, the stage 1 attributes are always
-     * some form of "this is Normal memory". The combined S1+S2
-     * attributes are therefore only Device if stage 2 specifies Device.
-     * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
-     * ie when cacheattrs.attrs bits [3:2] are 0b00.
-     * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
-     * when cacheattrs.attrs bit [2] is 0.
-     */
-    assert(cacheattrs.is_s2_format);
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        return (cacheattrs.attrs & 0x4) == 0;
-    } else {
-        return (cacheattrs.attrs & 0xc) == 0;
-    }
-}
-
-/* Translate a S1 pagetable walk through S2 if needed.  */
-static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
-                               ARMMMUFaultInfo *fi)
-{
-    if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-        target_ulong s2size;
-        hwaddr s2pa;
-        int s2prot;
-        int ret;
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
-        ARMCacheAttrs cacheattrs = {};
-        MemTxAttrs txattrs = {};
-
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
-                                 &cacheattrs);
-        if (ret) {
-            assert(fi->type != ARMFault_None);
-            fi->s2addr = addr;
-            fi->stage2 = true;
-            fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
-            return ~0;
-        }
-        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            ptw_attrs_are_device(env, cacheattrs)) {
-            /*
-             * PTW set and S1 walk touched S2 Device memory:
-             * generate Permission fault.
-             */
-            fi->type = ARMFault_Permission;
-            fi->s2addr = addr;
-            fi->stage2 = true;
-            fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
-            return ~0;
-        }
-
-        if (arm_is_secure_below_el3(env)) {
-            /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
-            } else {
-                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
-            }
-        } else {
-            assert(!*is_secure);
-        }
-
-        addr = s2pa;
-    }
-    return addr;
-}
-
-/* All loads done in the course of a page table walk go through here. */
-uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
-    uint32_t data;
-
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
-        return 0;
-    }
-    if (regime_translation_big_endian(env, mmu_idx)) {
-        data = address_space_ldl_be(as, addr, attrs, &result);
-    } else {
-        data = address_space_ldl_le(as, addr, attrs, &result);
-    }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
-}
-
-uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
-    uint64_t data;
-
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
-        return 0;
-    }
-    if (regime_translation_big_endian(env, mmu_idx)) {
-        data = address_space_ldq_be(as, addr, attrs, &result);
-    } else {
-        data = address_space_ldq_le(as, addr, attrs, &result);
-    }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
-}
-
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cbccf91b13..e4b860d2ae 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -15,6 +15,154 @@
 #include "ptw.h"
 
 
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0, hwaddr *phys_ptr,
+                               MemTxAttrs *txattrs, int *prot,
+                               target_ulong *page_size_ptr,
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+    __attribute__((nonnull));
+
+static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
+}
+
+static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
+{
+    /*
+     * For an S1 page table walk, the stage 1 attributes are always
+     * some form of "this is Normal memory". The combined S1+S2
+     * attributes are therefore only Device if stage 2 specifies Device.
+     * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
+     * ie when cacheattrs.attrs bits [3:2] are 0b00.
+     * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
+     * when cacheattrs.attrs bit [2] is 0.
+     */
+    assert(cacheattrs.is_s2_format);
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        return (cacheattrs.attrs & 0x4) == 0;
+    } else {
+        return (cacheattrs.attrs & 0xc) == 0;
+    }
+}
+
+/* Translate a S1 pagetable walk through S2 if needed.  */
+static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
+                               hwaddr addr, bool *is_secure,
+                               ARMMMUFaultInfo *fi)
+{
+    if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+        target_ulong s2size;
+        hwaddr s2pa;
+        int s2prot;
+        int ret;
+        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
+                                          : ARMMMUIdx_Stage2;
+        ARMCacheAttrs cacheattrs = {};
+        MemTxAttrs txattrs = {};
+
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
+                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
+                                 &cacheattrs);
+        if (ret) {
+            assert(fi->type != ARMFault_None);
+            fi->s2addr = addr;
+            fi->stage2 = true;
+            fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
+            return ~0;
+        }
+        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
+            ptw_attrs_are_device(env, cacheattrs)) {
+            /*
+             * PTW set and S1 walk touched S2 Device memory:
+             * generate Permission fault.
+             */
+            fi->type = ARMFault_Permission;
+            fi->s2addr = addr;
+            fi->stage2 = true;
+            fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
+            return ~0;
+        }
+
+        if (arm_is_secure_below_el3(env)) {
+            /* Check if page table walk is to secure or non-secure PA space. */
+            if (*is_secure) {
+                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+            } else {
+                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+            }
+        } else {
+            assert(!*is_secure);
+        }
+
+        addr = s2pa;
+    }
+    return addr;
+}
+
+/* All loads done in the course of a page table walk go through here. */
+static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+    MemTxResult result = MEMTX_OK;
+    AddressSpace *as;
+    uint32_t data;
+
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    attrs.secure = is_secure;
+    as = arm_addressspace(cs, attrs);
+    if (fi->s1ptw) {
+        return 0;
+    }
+    if (regime_translation_big_endian(env, mmu_idx)) {
+        data = address_space_ldl_be(as, addr, attrs, &result);
+    } else {
+        data = address_space_ldl_le(as, addr, attrs, &result);
+    }
+    if (result == MEMTX_OK) {
+        return data;
+    }
+    fi->type = ARMFault_SyncExternalOnWalk;
+    fi->ea = arm_extabort_type(result);
+    return 0;
+}
+
+static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+    MemTxResult result = MEMTX_OK;
+    AddressSpace *as;
+    uint64_t data;
+
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    attrs.secure = is_secure;
+    as = arm_addressspace(cs, attrs);
+    if (fi->s1ptw) {
+        return 0;
+    }
+    if (regime_translation_big_endian(env, mmu_idx)) {
+        data = address_space_ldq_be(as, addr, attrs, &result);
+    } else {
+        data = address_space_ldq_le(as, addr, attrs, &result);
+    }
+    if (result == MEMTX_OK) {
+        return data;
+    }
+    fi->type = ARMFault_SyncExternalOnWalk;
+    fi->ea = arm_extabort_type(result);
+    return 0;
+}
+
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
@@ -338,12 +486,12 @@ do_fault:
  * @fi: set to fault info if the translation fails
  * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
-bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                        bool s1_is_el0,
-                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-                        target_ulong *page_size_ptr,
-                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0, hwaddr *phys_ptr,
+                               MemTxAttrs *txattrs, int *prot,
+                               target_ulong *page_size_ptr,
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
-- 
2.34.1


