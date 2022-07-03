Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC956466A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:28:19 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vtq-000310-Dp
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzH-0000gT-IE
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzF-0006fs-E5
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ju17so1431416pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AgrCDzDvTqOdWxJ0VR4VmcOIV2B9QnGlk8qFxEZQR4I=;
 b=OxUyRGI4/edokV/YWLZKHq+7yfgsT2CE+cPE4UTyAgrga+jjmKG00RKaSWYfhxm+BB
 dh7YLayO6oFHMNV0/55hpxlZyiGxoq7JUjL58pGF70p2QJHWdv83zCWCUAscei2I7u+4
 Cj2uEiD0JmOAb4HGV6Y/q9hRkuo1+mkmQGQgIFlZxWvyoQ/0Ft2zBEmft89JvNQUjtC9
 j2fjGpBSA0A3Jnf7EnHlTY2x/tTSytQ6up7eBwbl1vnngV8WsjIblTIvwR+w8XY2rWk4
 W/3C0GmxGZcHHqVWfaFIbRlaxMykGJCaTuiAlADq2u0nuNhSq4ThoL6d4on2yQthadKS
 N7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AgrCDzDvTqOdWxJ0VR4VmcOIV2B9QnGlk8qFxEZQR4I=;
 b=HcrtVi4jkG5XW/Gkcw94/gumOfvclcLiHtQyM/V1SHmHNa2xow9SDvdagTNfjqIAQ+
 3MD56IMPR1wVS+Z1nOJD6IK/5asTOXXw9/1UIesVxcgTkNjfUQVEl2mr3CrMroqiDiUF
 sxn6haC6k0T5ETHOmyHlxYnsaGkliYY022Ml/YQ6XsYXb6F/jSxqZ4lzFvMpRqkR1gnV
 QN4zmnfL/de6+0Ve7OqYRLWTOBDNqR8YYgvpTtJMHfaANqPRI2XqNsI0Dqz7TgUoNRZr
 JNjWE3w6PsBaLV5FILRw1tT5PpuUwmiJYXOCW/+/t3pl+5pqhjO6iYlVmQc2O3YHpamg
 dY2w==
X-Gm-Message-State: AJIora+7kc030UnNUTmKlTUc+Nx4jaguJysnp/3hXWXUVvEMuW3Olv3R
 eOHIu45fmwSSydO+flTln0rKRwFdg5wIVVyq
X-Google-Smtp-Source: AGRyM1sSy5meGc+loMUp7I0MnhkUthNBGj2L+T7UsIz6OhvfvHF1I6oDNaOvpj9WPyCItctFOqqKGg==
X-Received: by 2002:a17:902:d50e:b0:16a:13d:30ab with SMTP id
 b14-20020a170902d50e00b0016a013d30abmr29985412plg.31.1656836988547; 
 Sun, 03 Jul 2022 01:29:48 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 46/62] target/arm: Use softmmu tlbs for page table walking
Date: Sun,  3 Jul 2022 13:54:03 +0530
Message-Id: <20220703082419.770989-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

So far, limit the change to S1_ptw_translate, arm_ldl_ptw,
and arm_ldq_ptw.  Use probe_access_extra to find the host
address, and if so use a host load.  If the probe fails,
we've got our fault info already.  On the off chance that
page tables are not in RAM, continue to use the
address_space_ld* functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h        |   5 +
 target/arm/ptw.c        | 206 +++++++++++++++++++++++-----------------
 target/arm/tlb_helper.c |  17 +++-
 3 files changed, 139 insertions(+), 89 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8ea9f08511..e5e3084ec9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -231,6 +231,8 @@ typedef struct CPUARMTBFlags {
     target_ulong flags2;
 } CPUARMTBFlags;
 
+typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -720,6 +722,9 @@ typedef struct CPUArchState {
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
 
+    /* Optional fault info across tlb lookup. */
+    ARMMMUFaultInfo *tlb_fi;
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7510a9276a..ed25f4b91e 100644
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
@@ -191,52 +192,58 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
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
-    if (hcr & HCR_FWB) {
-        return (cacheattrs.attrs & 0x4) == 0;
-    } else {
-        return (cacheattrs.attrs & 0xc) == 0;
-    }
-}
-
 /* Translate a S1 pagetable walk through S2 if needed.  */
-static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure_ptr,
-                               ARMMMUFaultInfo *fi)
+static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
+                             bool *is_secure_ptr, void **hphys, hwaddr *gphys,
+                             ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
     ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    MemTxAttrs attrs = {};
+    PageEntryExtra extra;
+    int flags;
 
-    if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        GetPhysAddrResult s2 = {};
-        uint64_t hcr;
-        int ret;
+    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
+        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
+        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+    }
 
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 is_secure, false, &s2, fi);
-        if (ret) {
-            assert(fi->type != ARMFault_None);
-            fi->s2addr = addr;
-            fi->stage2 = true;
-            fi->s1ptw = true;
-            fi->s1ns = !is_secure;
-            return ~0;
+    env->tlb_fi = fi;
+    flags = probe_access_extra(env, addr, MMU_DATA_LOAD,
+                               arm_to_core_mmu_idx(s2_mmu_idx),
+                               true, hphys, &attrs, &extra, 0);
+    env->tlb_fi = NULL;
+
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        assert(fi->type != ARMFault_None);
+        fi->s2addr = addr;
+        fi->stage2 = true;
+        fi->s1ptw = true;
+        fi->s1ns = !is_secure;
+        return false;
+    }
+
+    if (s2_mmu_idx == ARMMMUIdx_Stage2 || s2_mmu_idx == ARMMMUIdx_Stage2_S) {
+        uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+        uint8_t s2attrs = FIELD_EX64(extra.x, PAGEENTRYEXTRA, ATTRS);
+        bool is_device;
+
+        /*
+         * For an S1 page table walk, the stage 1 attributes are always
+         * some form of "this is Normal memory". The combined S1+S2
+         * attributes are therefore only Device if stage 2 specifies Device.
+         * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
+         * ie when s2attrs bits [3:2] are 0b00.
+         * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
+         * when s2attrs bit [2] is 0.
+         */
+        if (hcr & HCR_FWB) {
+            is_device = (s2attrs & 0x4) == 0;
+        } else {
+            is_device = (s2attrs & 0xc) == 0;
         }
 
-        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-        if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
+        if ((hcr & HCR_PTW) && is_device) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -246,24 +253,19 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->stage2 = true;
             fi->s1ptw = true;
             fi->s1ns = !is_secure;
-            return ~0;
+            return false;
         }
-
-        if (arm_is_secure_below_el3(env)) {
-            /* Check if page table walk is to secure or non-secure PA space. */
-            if (is_secure) {
-                is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
-            } else {
-                is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
-            }
-            *is_secure_ptr = is_secure;
-        } else {
-            assert(!is_secure);
-        }
-
-        addr = s2.phys;
     }
-    return addr;
+
+    if (is_secure) {
+        /* Check if page table walk is to secure or non-secure PA space. */
+        *is_secure_ptr = !(attrs.secure
+                           ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
+                           : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+    }
+
+    *gphys = extra.x & R_PAGEENTRYEXTRA_PA_MASK;
+    return true;
 }
 
 /* All loads done in the course of a page table walk go through here. */
@@ -271,56 +273,88 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
+    void *hphys;
+    hwaddr gphys;
     uint32_t data;
+    bool be;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
+    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+                          &hphys, &gphys, fi)) {
+        /* Failure. */
+        assert(fi->s1ptw);
         return 0;
     }
-    if (regime_translation_big_endian(env, mmu_idx)) {
-        data = address_space_ldl_be(as, addr, attrs, &result);
+
+    be = regime_translation_big_endian(env, mmu_idx);
+    if (likely(hphys)) {
+        /* Page tables are in RAM, and we have the host address. */
+        if (be) {
+            data = ldl_be_p(hphys);
+        } else {
+            data = ldl_le_p(hphys);
+        }
     } else {
-        data = address_space_ldl_le(as, addr, attrs, &result);
+        /* Page tables are in MMIO. */
+        MemTxAttrs attrs = { .secure = is_secure };
+        AddressSpace *as = arm_addressspace(cs, attrs);
+        MemTxResult result = MEMTX_OK;
+
+        if (be) {
+            data = address_space_ldl_be(as, gphys, attrs, &result);
+        } else {
+            data = address_space_ldl_le(as, gphys, attrs, &result);
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
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
+    void *hphys;
+    hwaddr gphys;
     uint64_t data;
+    bool be;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
+    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+                          &hphys, &gphys, fi)) {
+        /* Failure. */
+        assert(fi->s1ptw);
         return 0;
     }
-    if (regime_translation_big_endian(env, mmu_idx)) {
-        data = address_space_ldq_be(as, addr, attrs, &result);
+
+    be = regime_translation_big_endian(env, mmu_idx);
+    if (likely(hphys)) {
+        /* Page tables are in RAM, and we have the host address. */
+        if (be) {
+            data = ldq_be_p(hphys);
+        } else {
+            data = ldq_le_p(hphys);
+        }
     } else {
-        data = address_space_ldq_le(as, addr, attrs, &result);
+        /* Page tables are in MMIO. */
+        MemTxAttrs attrs = { .secure = is_secure };
+        AddressSpace *as = arm_addressspace(cs, attrs);
+        MemTxResult result = MEMTX_OK;
+
+        if (be) {
+            data = address_space_ldq_be(as, gphys, attrs, &result);
+        } else {
+            data = address_space_ldq_le(as, gphys, attrs, &result);
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
index 28495ff525..d0b978bb9a 100644
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
         PageEntryExtra extra = {};
 
@@ -252,7 +263,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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


