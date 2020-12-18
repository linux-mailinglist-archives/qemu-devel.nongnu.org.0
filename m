Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37812DE194
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:56:36 +0100 (CET)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDR5-00036Q-O2
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9a-00075z-Am; Fri, 18 Dec 2020 05:38:30 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55302
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9X-0003LW-EW; Fri, 18 Dec 2020 05:38:30 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 67E7960718;
 Fri, 18 Dec 2020 11:38:03 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 14/18] target/arm: secure stage 2 translation regime
Date: Fri, 18 Dec 2020 12:37:55 +0200
Message-Id: <20201218103759.19929-14-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h       |  6 +++-
 target/arm/helper.c    | 80 +++++++++++++++++++++++++++++-------------
 target/arm/internals.h | 22 ++++++++++++
 3 files changed, 83 insertions(+), 25 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f6b59cb56b..9de4224f22 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3026,6 +3026,9 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_SE0 = 3 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_SE1 = 4 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_SE1_PAN = 5 | ARM_MMU_IDX_NOTLB,
     /*
      * Not allocated a TLB: used only for second stage of an S12 page
      * table walk, or for descriptor loads during first stage of an S1
@@ -3033,7 +3036,8 @@ typedef enum ARMMMUIdx {
      * then various TLB flush insns which currently are no-ops or flush
      * only stage 1 MMU indexes will need to change to flush stage 2.
      */
-    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2     = 6 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2_S   = 7 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6d60fa23c9..5147d77861 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3429,7 +3429,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
         uint32_t syn, fsr, fsc;
         bool take_exc = false;
 
-        if (fi.s1ptw && current_el == 1 && !arm_is_secure(env)
+        if (fi.s1ptw && current_el == 1
             && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
             /*
              * Synchronous stage 2 fault on an access made as part of the
@@ -3586,10 +3586,10 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             /* fall through */
         case 1:
             if (ri->crm == 9 && (env->uncached_cpsr & CPSR_PAN)) {
-                mmu_idx = (secure ? ARMMMUIdx_SE10_1_PAN
+                mmu_idx = (secure ? ARMMMUIdx_Stage1_SE1_PAN
                            : ARMMMUIdx_Stage1_E1_PAN);
             } else {
-                mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_Stage1_E1;
+                mmu_idx = secure ? ARMMMUIdx_Stage1_SE1 : ARMMMUIdx_Stage1_E1;
             }
             break;
         default:
@@ -3603,10 +3603,11 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_SE10_0;
             break;
         case 2:
+            g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
             mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_SE10_0 : ARMMMUIdx_Stage1_E0;
+            mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
             break;
         default:
             g_assert_not_reached();
@@ -3671,10 +3672,10 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = (secure ? ARMMMUIdx_SE10_1_PAN
+                mmu_idx = (secure ? ARMMMUIdx_Stage1_SE1_PAN
                            : ARMMMUIdx_Stage1_E1_PAN);
             } else {
-                mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_Stage1_E1;
+                mmu_idx = secure ? ARMMMUIdx_Stage1_SE1 : ARMMMUIdx_Stage1_E1;
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
@@ -3688,7 +3689,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = secure ? ARMMMUIdx_SE10_0 : ARMMMUIdx_Stage1_E0;
+        mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
         mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_E10_1;
@@ -10054,7 +10055,7 @@ static inline bool regime_translation_disabled(CPUARMState *env,
 
     hcr_el2 = arm_hcr_el2_eff(env);
 
-    if (mmu_idx == ARMMMUIdx_Stage2) {
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* HCR.DC means HCR.VM behaves as 1 */
         return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
     }
@@ -10087,6 +10088,9 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
     if (mmu_idx == ARMMMUIdx_Stage2) {
         return env->cp15.vttbr_el2;
     }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
     if (ttbrn == 0) {
         return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
     } else {
@@ -10102,6 +10106,12 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+        return ARMMMUIdx_Stage1_SE0;
+    case ARMMMUIdx_SE10_1:
+        return ARMMMUIdx_Stage1_SE1;
+    case ARMMMUIdx_SE10_1_PAN:
+        return ARMMMUIdx_Stage1_SE1_PAN;
     case ARMMMUIdx_E10_0:
         return ARMMMUIdx_Stage1_E0;
     case ARMMMUIdx_E10_1:
@@ -10146,6 +10156,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_SE20_0:
     case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_SE0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
     case ARMMMUIdx_MUserNegPri:
@@ -10311,6 +10322,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     int wxn = 0;
 
     assert(mmu_idx != ARMMMUIdx_Stage2);
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
 
     user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
@@ -10405,13 +10417,12 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         hwaddr s2pa;
         int s2prot;
         int ret;
+        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
+                                          : ARMMMUIdx_Stage2;
         ARMCacheAttrs cacheattrs = {};
         MemTxAttrs txattrs = {};
 
-        assert(!*is_secure); /* TODO: S-EL2 */
-
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
-                                 false,
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
                                  &s2pa, &txattrs, &s2prot, &s2size, fi,
                                  &cacheattrs);
         if (ret) {
@@ -10887,7 +10898,7 @@ static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 37, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2) {
+    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBI bit so we always have 2 bits.  */
@@ -10899,7 +10910,7 @@ static int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 51, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2) {
+    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBID bit so we always have 2 bits.  */
@@ -10929,7 +10940,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
-        if (mmu_idx == ARMMMUIdx_Stage2) {
+        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
             /* VTCR_EL2 */
             hpd = false;
         } else {
@@ -10987,6 +10998,8 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
     int select, tsz;
     bool epd, hpd;
 
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+
     if (mmu_idx == ARMMMUIdx_Stage2) {
         /* VTCR */
         bool sext = extract32(tcr, 4, 1);
@@ -11152,7 +11165,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         goto do_fault;
     }
 
-    if (mmu_idx != ARMMMUIdx_Stage2) {
+    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
         /* The starting level depends on the virtual address size (which can
          * be up to 48 bits) and the translation granule size. It indicates
          * the number of strides (stride bits at a time) needed to
@@ -11256,7 +11269,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         attrs = extract64(descriptor, 2, 10)
             | (extract64(descriptor, 52, 12) << 10);
 
-        if (mmu_idx == ARMMMUIdx_Stage2) {
+        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
             /* Stage 2 table descriptors do not include any attribute fields */
             break;
         }
@@ -11286,8 +11299,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     ap = extract32(attrs, 4, 2);
 
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        ns = true;
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        if (mmu_idx == ARMMMUIdx_Stage2) {
+            ns = true;
+        }
         xn = extract32(attrs, 11, 2);
         *prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
@@ -11314,7 +11329,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         arm_tlb_bti_gp(txattrs) = true;
     }
 
-    if (mmu_idx == ARMMMUIdx_Stage2) {
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         cacheattrs->attrs = convert_stage2_attrs(env, extract32(attrs, 0, 4));
     } else {
         /* Index into MAIR registers for cache attributes */
@@ -11333,7 +11348,8 @@ do_fault:
     fi->type = fault_type;
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2);
+    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
+                               mmu_idx == ARMMMUIdx_Stage2_S);
     return true;
 }
 
@@ -12163,6 +12179,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             int s2_prot;
             int ret;
             ARMCacheAttrs cacheattrs2 = {};
+            ARMMMUIdx s2_mmu_idx;
+            bool is_el0;
 
             ret = get_phys_addr(env, address, access_type, s1_mmu_idx, &ipa,
                                 attrs, prot, page_size, fi, cacheattrs);
@@ -12173,9 +12191,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
+            s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+            is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
+
             /* S1 is done. Now do S2 translation.  */
-            ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_Stage2,
-                                     mmu_idx == ARMMMUIdx_E10_0,
+            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
                                      phys_ptr, attrs, &s2_prot,
                                      page_size, fi, &cacheattrs2);
             fi->s2addr = ipa;
@@ -12202,6 +12222,18 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 cacheattrs->shareability = 0;
             }
             *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+
+            /* Check if IPA translates to secure or non-secure PA space. */
+            if (arm_is_secure_below_el3(env)) {
+                if (attrs->secure) {
+                    attrs->secure =
+                        !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
+                } else {
+                    attrs->secure =
+                        !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
+                        || (env->cp15.vstcr_el2.raw_tcr & VSTCR_SA));
+                }
+            }
             return 0;
         } else {
             /*
@@ -12270,7 +12302,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
          * MMU disabled.  S1 addresses within aa64 translation regimes are
          * still checked for bounds -- see AArch64.TranslateAddressS1Off.
          */
-        if (mmu_idx != ARMMMUIdx_Stage2) {
+        if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
             int r_el = regime_el(env, mmu_idx);
             if (arm_el_is_aa64(env, r_el)) {
                 int pamax = arm_pamax(env_archcpu(env));
diff --git a/target/arm/internals.h b/target/arm/internals.h
index e4e6afef19..3aec10263e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -851,6 +851,9 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
@@ -896,7 +899,11 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_SE20_0:
     case ARMMMUIdx_SE20_2:
     case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_SE2:
+    case ARMMMUIdx_Stage2_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
@@ -911,6 +918,7 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_1_PAN:
     case ARMMMUIdx_E20_2_PAN:
     case ARMMMUIdx_SE10_1_PAN:
@@ -932,18 +940,22 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
     case ARMMMUIdx_SE2:
     case ARMMMUIdx_E2:
         return 2;
     case ARMMMUIdx_SE3:
         return 3;
     case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_Stage1_SE0:
         return arm_el_is_aa64(env, 3) ? 1 : 3;
     case ARMMMUIdx_SE10_1:
     case ARMMMUIdx_SE10_1_PAN:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
@@ -967,6 +979,13 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     if (mmu_idx == ARMMMUIdx_Stage2) {
         return &env->cp15.vtcr_el2;
     }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        /*
+         * Note: Secure stage 2 nominally shares fields from VTCR_EL2, but
+         * those are not currently used by QEMU, so just return VSTCR_EL2.
+         */
+        return &env->cp15.vstcr_el2;
+    }
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
@@ -1169,6 +1188,9 @@ static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
         return true;
     default:
         return false;
-- 
2.29.2


