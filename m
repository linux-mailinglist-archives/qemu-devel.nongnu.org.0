Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC95FAB35
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:33:45 +0200 (CEST)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi61Y-00008G-Ea
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nu-0002OP-Cl
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:38 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5no-00032I-O6
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:38 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g28so12344311pfk.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfoOzEF8z1y58sSX0+3veBaBG5ktJhjr7JEkqbUwE4g=;
 b=znMfUxuobBesxG5EqUB9Te7IwcpyqQR9yW3rrns6+B8t7jkKTmV0qZI7F6urfzJglH
 wTCu8pMJtZ9rDPHVINkaw6fA8KYWncUvhmby6MRrEn1lKew/Qvme0Dm8iISVML2mlIgt
 pxa8O11JJKOfmo1loTcvDDGr3LiNtLPzjoJDniD6GcT/FRMk5+6MJmcbn9616wNH5vRZ
 fLQ19MHPDdTLrGhKSBjrWrSnwSKtCq8ANvvMr+NgHp4nixQCF+ViEPaKbkOZ6yj3MxuZ
 m9l1L9PqxHo7uqi3qcF3CT31R1/MrSXd5h8yKM0USPhfZJ66PtJL+l0pg701J0QZDmaA
 sKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfoOzEF8z1y58sSX0+3veBaBG5ktJhjr7JEkqbUwE4g=;
 b=xaWNArvosnTzYF7WdZ/cnad8ID0ZtrpSE2KxWG4TVEwY9D49uDuC/GA3dgIcnbjSRB
 e3WIeiiPz2pxlcI04gSxgzt3qX6yi3GR+xnvtt9YyILrH3ktc2/pZFUUPE5CFs2eK6Mk
 0T2kL3tBTbHvUIouSPm1f5JpkQ9XLUgiowi9iMAV7CsFbVw160PLRk3iBU2GFZFQ6tHn
 MgjE6CTQLS2DTqAkPSdp/utCsa/xosgSavLtTb4JN9sJjGDZQoiOG9k0YdVfwsk+Y483
 N1bc+tvCIg8LjKwkpX03vBURrZ3XHI4XxQ3qNr9RR5XslJ3gAQl8hGCg0mSQXmQzJ9Ld
 gzSA==
X-Gm-Message-State: ACrzQf2/oyLE9ObhOrH8xd+SomiKNP0xlSdxrUkzhlbLGuo+/MUIa/9d
 PrEqnr3dNmB6K9nFUC6Ufwtl2V4SozMf5Q==
X-Google-Smtp-Source: AMsMyM5S5PDdcyE1fWB7f4vJgBWHgC84R1G5zvhcxsC5kw+wrtOA7BQxO0y2tD5MnGQijdWdR/oY9Q==
X-Received: by 2002:a05:6a00:1a0e:b0:547:1cf9:40e8 with SMTP id
 g14-20020a056a001a0e00b005471cf940e8mr22973273pfv.82.1665458371304; 
 Mon, 10 Oct 2022 20:19:31 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 10/24] target/arm: Use softmmu tlbs for page table walking
Date: Mon, 10 Oct 2022 20:18:57 -0700
Message-Id: <20221011031911.2408754-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

So far, limit the change to S1_ptw_translate, arm_ldl_ptw, and
arm_ldq_ptw.  Use probe_access_full to find the host address,
and if so use a host load.  If the probe fails, we've got our
fault info already.  On the off chance that page tables are not
in RAM, continue to use the address_space_ld* functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Put the host address into S1Translate immediately.
---
 target/arm/cpu.h        |   5 +
 target/arm/ptw.c        | 196 +++++++++++++++++++++++++---------------
 target/arm/tlb_helper.c |  17 +++-
 3 files changed, 144 insertions(+), 74 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c94e289012..e9e77b7563 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -225,6 +225,8 @@ typedef struct CPUARMTBFlags {
     target_ulong flags2;
 } CPUARMTBFlags;
 
+typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -715,6 +717,9 @@ typedef struct CPUArchState {
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
 
+    /* Optional fault info across tlb lookup. */
+    ARMMMUFaultInfo *tlb_fi;
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c58788ac69..8f41d285b7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/range.h"
+#include "exec/exec-all.h"
 #include "cpu.h"
 #include "internals.h"
 #include "idau.h"
@@ -21,6 +22,7 @@ typedef struct S1Translate {
     bool out_secure;
     bool out_be;
     hwaddr out_phys;
+    void *out_host;
 } S1Translate;
 
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
@@ -200,7 +202,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
+static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 {
     /*
      * For an S1 page table walk, the stage 1 attributes are always
@@ -211,11 +213,10 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
      * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
      * when cacheattrs.attrs bit [2] is 0.
      */
-    assert(cacheattrs.is_s2_format);
     if (hcr & HCR_FWB) {
-        return (cacheattrs.attrs & 0x4) == 0;
+        return (attrs & 0x4) == 0;
     } else {
-        return (cacheattrs.attrs & 0xc) == 0;
+        return (attrs & 0xc) == 0;
     }
 }
 
@@ -224,32 +225,65 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
 {
     bool is_secure = ptw->in_secure;
+    ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    bool s2_phys = false;
+    uint8_t pte_attrs;
+    bool pte_secure;
 
-    if (arm_mmu_idx_is_stage1_of_2(ptw->in_mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        GetPhysAddrResult s2 = {};
-        S1Translate s2ptw = {
-            .in_mmu_idx = s2_mmu_idx,
-            .in_secure = is_secure,
-            .in_debug = ptw->in_debug,
-        };
-        uint64_t hcr;
-        int ret;
+    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
+        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
+        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        s2_phys = true;
+    }
 
-        ret = get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                 false, &s2, fi);
-        if (ret) {
-            assert(fi->type != ARMFault_None);
-            fi->s2addr = addr;
-            fi->stage2 = true;
-            fi->s1ptw = true;
-            fi->s1ns = !is_secure;
-            return false;
+    if (unlikely(ptw->in_debug)) {
+        /*
+         * From gdbstub, do not use softmmu so that we don't modify the
+         * state of the cpu at all, including softmmu tlb contents.
+         */
+        if (s2_phys) {
+            ptw->out_phys = addr;
+            pte_attrs = 0;
+            pte_secure = is_secure;
+        } else {
+            S1Translate s2ptw = {
+                .in_mmu_idx = s2_mmu_idx,
+                .in_secure = is_secure,
+                .in_debug = true,
+            };
+            GetPhysAddrResult s2 = { };
+            if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
+                                    false, &s2, fi)) {
+                goto fail;
+            }
+            ptw->out_phys = s2.f.phys_addr;
+            pte_attrs = s2.cacheattrs.attrs;
+            pte_secure = s2.f.attrs.secure;
         }
+        ptw->out_host = NULL;
+    } else {
+        CPUTLBEntryFull *full;
+        int flags;
 
-        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-        if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
+        env->tlb_fi = fi;
+        flags = probe_access_full(env, addr, MMU_DATA_LOAD,
+                                  arm_to_core_mmu_idx(s2_mmu_idx),
+                                  true, &ptw->out_host, &full, 0);
+        env->tlb_fi = NULL;
+
+        if (unlikely(flags & TLB_INVALID_MASK)) {
+            goto fail;
+        }
+        ptw->out_phys = full->phys_addr;
+        pte_attrs = full->pte_attrs;
+        pte_secure = full->attrs.secure;
+    }
+
+    if (!s2_phys) {
+        uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+
+        if ((hcr & HCR_PTW) && S2_attrs_are_device(hcr, pte_attrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -261,25 +295,23 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             fi->s1ns = !is_secure;
             return false;
         }
-
-        if (arm_is_secure_below_el3(env)) {
-            /* Check if page table walk is to secure or non-secure PA space. */
-            if (is_secure) {
-                is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-            } else {
-                is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-            }
-        } else {
-            assert(!is_secure);
-        }
-
-        addr = s2.f.phys_addr;
     }
 
-    ptw->out_secure = is_secure;
-    ptw->out_phys = addr;
-    ptw->out_be = regime_translation_big_endian(env, ptw->in_mmu_idx);
+    /* Check if page table walk is to secure or non-secure PA space. */
+    ptw->out_secure = (is_secure
+                       && !(pte_secure
+                            ? env->cp15.vstcr_el2 & VSTCR_SW
+                            : env->cp15.vtcr_el2 & VTCR_NSW));
+    ptw->out_be = regime_translation_big_endian(env, mmu_idx);
     return true;
+
+ fail:
+    assert(fi->type != ARMFault_None);
+    fi->s2addr = addr;
+    fi->stage2 = true;
+    fi->s1ptw = true;
+    fi->s1ns = !is_secure;
+    return false;
 }
 
 /* All loads done in the course of a page table walk go through here. */
@@ -287,56 +319,78 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
     uint32_t data;
 
     if (!S1_ptw_translate(env, ptw, addr, fi)) {
+        /* Failure. */
+        assert(fi->s1ptw);
         return 0;
     }
-    addr = ptw->out_phys;
-    attrs.secure = ptw->out_secure;
-    as = arm_addressspace(cs, attrs);
-    if (ptw->out_be) {
-        data = address_space_ldl_be(as, addr, attrs, &result);
+
+    if (likely(ptw->out_host)) {
+        /* Page tables are in RAM, and we have the host address. */
+        if (ptw->out_be) {
+            data = ldl_be_p(ptw->out_host);
+        } else {
+            data = ldl_le_p(ptw->out_host);
+        }
     } else {
-        data = address_space_ldl_le(as, addr, attrs, &result);
+        /* Page tables are in MMIO. */
+        MemTxAttrs attrs = { .secure = ptw->out_secure };
+        AddressSpace *as = arm_addressspace(cs, attrs);
+        MemTxResult result = MEMTX_OK;
+
+        if (ptw->out_be) {
+            data = address_space_ldl_be(as, ptw->out_phys, attrs, &result);
+        } else {
+            data = address_space_ldl_le(as, ptw->out_phys, attrs, &result);
+        }
+        if (unlikely(result != MEMTX_OK)) {
+            fi->type = ARMFault_SyncExternalOnWalk;
+            fi->ea = arm_extabort_type(result);
+            return 0;
+        }
     }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
+    return data;
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
     uint64_t data;
 
     if (!S1_ptw_translate(env, ptw, addr, fi)) {
+        /* Failure. */
+        assert(fi->s1ptw);
         return 0;
     }
-    addr = ptw->out_phys;
-    attrs.secure = ptw->out_secure;
-    as = arm_addressspace(cs, attrs);
-    if (ptw->out_be) {
-        data = address_space_ldq_be(as, addr, attrs, &result);
+
+    if (likely(ptw->out_host)) {
+        /* Page tables are in RAM, and we have the host address. */
+        if (ptw->out_be) {
+            data = ldq_be_p(ptw->out_host);
+        } else {
+            data = ldq_le_p(ptw->out_host);
+        }
     } else {
-        data = address_space_ldq_le(as, addr, attrs, &result);
+        /* Page tables are in MMIO. */
+        MemTxAttrs attrs = { .secure = ptw->out_secure };
+        AddressSpace *as = arm_addressspace(cs, attrs);
+        MemTxResult result = MEMTX_OK;
+
+        if (ptw->out_be) {
+            data = address_space_ldq_be(as, ptw->out_phys, attrs, &result);
+        } else {
+            data = address_space_ldq_le(as, ptw->out_phys, attrs, &result);
+        }
+        if (unlikely(result != MEMTX_OK)) {
+            fi->type = ARMFault_SyncExternalOnWalk;
+            fi->ea = arm_extabort_type(result);
+            return 0;
+        }
     }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
+    return data;
 }
 
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 3462a6ea14..69b0dc69df 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -208,10 +208,21 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
+    ARMMMUFaultInfo local_fi, *fi;
     int ret;
 
+    /*
+     * Allow S1_ptw_translate to see any fault generated here.
+     * Since this may recurse, read and clear.
+     */
+    fi = cpu->env.tlb_fi;
+    if (fi) {
+        cpu->env.tlb_fi = NULL;
+    } else {
+        fi = memset(&local_fi, 0, sizeof(local_fi));
+    }
+
     /*
      * Walk the page table and (if the mapping exists) add the page
      * to the TLB.  On success, return true.  Otherwise, if probing,
@@ -220,7 +231,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      */
     ret = get_phys_addr(&cpu->env, address, access_type,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &res, &fi);
+                        &res, fi);
     if (likely(!ret)) {
         /*
          * Map a single [sub]page. Regions smaller than our declared
@@ -242,7 +253,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         /* now we have a real cpu fault */
         cpu_restore_state(cs, retaddr, true);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
     }
 }
 #else
-- 
2.34.1


