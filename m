Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E9C5645E6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:45:27 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vEK-00019w-5z
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvh-00011f-Jk
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:09 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uve-0006ER-ME
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id n10so6067480plp.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDvBuKlYPmTlJ+6Vya3+/flWJH90DNxC8w/lfcBypPA=;
 b=h2FYAvtycoTSfAuvGBKS/o2MFqEQnXGjhJS4Re/mSXHR3dOwfYUdz2lyarpJIP2gHj
 PrV2M6mt+EBE8t/9TuKTIw/Ro0vJg4egeA2O7eB+Tij03s13JK+zaQQobnbMXr0JwnWd
 W5TwOmldl/5l3UNGyovQ6jr91PrmUCQ5SV+YGDWkWka2ysWxbSRdDUcsXXB4Bn4LBQJQ
 vDC2r0Nkj4EE4c+/PuXqCsr3OTewfKoxMGZxqiOqavAmsRqVePsYWvLdyA+F++A4WnqV
 ZYRD360PGjkezqFwlnM9jFDKEcMG5sY51ibjYUXM6EgRQs8By3blSb+cJHEmKKFxImwX
 eECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDvBuKlYPmTlJ+6Vya3+/flWJH90DNxC8w/lfcBypPA=;
 b=GHdjgrHF5uCEdn3KvnCWeMPKrPmBjekXlNQsnYrs2E7Q9IMJjJnvv6GHzv+1QaIpnb
 bpLwD4TbbPUnwWcimZS/K7Fvd1+J5E6rXOrObL6Yh+22QKcUk2CPrpYsXrXPi19hFkVr
 Rxd880mEKtwF+vztTz7G+am78Z1J9AD33Op+Zf5Zv5uxBHq1FLq9OZauY+HKArVZv9PK
 wae+/rF2mjTSkd8otpMWRklxrkf7Ns615OaZzoVMjq0yGd1B+dANq45LQ5YZVOw3rKwG
 2XQCjJjcDfeMLv3cOm9vhbDFVdHc4W1dGfKY37Ek01bM+WTadMZCNlThhLCLw0Q49wbp
 YiMA==
X-Gm-Message-State: AJIora/R9YwY4vg7O2hfwFvnIIbNchzs1IF+MKxF2ozZr5exsLHWJOgy
 UAE+9IqPKkbeDg8X3wH6Kfco1baWgwukbVQx
X-Google-Smtp-Source: AGRyM1slzoux677Cz6QTjiSVBE/Ij3eKzOCsGQybWSp7EOObOlLcHer8n/byhPV3JI4yMEczEZVuJg==
X-Received: by 2002:a17:90a:d993:b0:1ec:db00:6519 with SMTP id
 d19-20020a17090ad99300b001ecdb006519mr29504626pjv.106.1656836765745; 
 Sun, 03 Jul 2022 01:26:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 33/62] target/arm: Fold secure and non-secure a-profile mmu
 indexes
Date: Sun,  3 Jul 2022 13:53:50 +0530
Message-Id: <20220703082419.770989-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

For a-profile, which does not bank system registers, it takes
quite a lot of code to switch between security states.  In the
process, registers such as TCR_EL{1,2} must be swapped, which in
itself requires the flushing of softmmu tlbs.  Therefore it
doesn't buy us anything to separate tlbs by security state.

Retain the distinction between Stage2 and Stage2_S.

This will be important as we implement FEAT_RME, and do not
wish to add a third set of mmu indexes for Realm state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.h           |  69 +++++++-----------
 target/arm/internals.h     |  31 +-------
 target/arm/helper.c        | 144 +++++++++++++------------------------
 target/arm/ptw.c           |  25 ++-----
 target/arm/translate-a64.c |   8 ---
 target/arm/translate.c     |   6 +-
 7 files changed, 83 insertions(+), 202 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index a14f167d11..6f702f58d9 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@ struct PageEntryExtra {
 };
 #endif
 
-#define NB_MMU_MODES 15
+#define NB_MMU_MODES 8
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 919e7c27a3..04423f8d6c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2848,26 +2848,26 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  *     table over and over.
  *  6. we need separate EL1/EL2 mmu_idx for handling the Privileged Access
  *     Never (PAN) bit within PSTATE.
+ *  7. we fold together the secure and non-secure regimes for A-profile,
+ *     because there are no banked system registers, so the process of
+ *     switching between secure and non-secure is already heavyweight.
  *
  * This gives us the following list of cases:
  *
- * NS EL0 EL1&0 stage 1+2 (aka NS PL0)
- * NS EL1 EL1&0 stage 1+2 (aka NS PL1)
- * NS EL1 EL1&0 stage 1+2 +PAN
- * NS EL0 EL2&0
- * NS EL2 EL2&0
- * NS EL2 EL2&0 +PAN
- * NS EL2 (aka NS PL2)
- * S EL0 EL1&0 (aka S PL0)
- * S EL1 EL1&0 (not used if EL3 is 32 bit)
- * S EL1 EL1&0 +PAN
- * S EL3 (aka S PL1)
+ * EL0 EL1&0 stage 1+2 (aka NS PL0)
+ * EL1 EL1&0 stage 1+2 (aka NS PL1)
+ * EL1 EL1&0 stage 1+2 +PAN
+ * EL0 EL2&0
+ * EL2 EL2&0
+ * EL2 EL2&0 +PAN
+ * EL2 (aka NS PL2)
+ * EL3 (aka S PL1)
  *
  * for a total of 11 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
- * as A profile. They only need to distinguish NS EL0 and NS EL1 (and
- * NS EL2 if we ever model a Cortex-R52).
+ * as A profile. They only need to distinguish EL0 and EL1 (and
+ * EL2 if we ever model a Cortex-R52).
  *
  * M profile CPUs are rather different as they do not have a true MMU.
  * They have the following different MMU indexes:
@@ -2906,9 +2906,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
 #define ARM_MMU_IDX_M     0x40  /* M profile */
 
-/* Meanings of the bits for A profile mmu idx values */
-#define ARM_MMU_IDX_A_NS     0x8
-
 /* Meanings of the bits for M profile mmu idx values */
 #define ARM_MMU_IDX_M_PRIV   0x1
 #define ARM_MMU_IDX_M_NEGPRI 0x2
@@ -2922,22 +2919,14 @@ typedef enum ARMMMUIdx {
     /*
      * A-profile.
      */
-    ARMMMUIdx_SE10_0     =  0 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE20_0     =  1 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_1     =  2 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE20_2     =  3 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_1_PAN =  4 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE20_2_PAN =  5 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE2        =  6 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE3        =  7 | ARM_MMU_IDX_A,
-
-    ARMMMUIdx_E10_0     = ARMMMUIdx_SE10_0 | ARM_MMU_IDX_A_NS,
-    ARMMMUIdx_E20_0     = ARMMMUIdx_SE20_0 | ARM_MMU_IDX_A_NS,
-    ARMMMUIdx_E10_1     = ARMMMUIdx_SE10_1 | ARM_MMU_IDX_A_NS,
-    ARMMMUIdx_E20_2     = ARMMMUIdx_SE20_2 | ARM_MMU_IDX_A_NS,
-    ARMMMUIdx_E10_1_PAN = ARMMMUIdx_SE10_1_PAN | ARM_MMU_IDX_A_NS,
-    ARMMMUIdx_E20_2_PAN = ARMMMUIdx_SE20_2_PAN | ARM_MMU_IDX_A_NS,
-    ARMMMUIdx_E2        = ARMMMUIdx_SE2 | ARM_MMU_IDX_A_NS,
+    ARMMMUIdx_E10_0     = 0 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E20_0     = 1 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E10_1     = 2 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E20_2     = 3 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E10_1_PAN = 4 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E20_2_PAN = 5 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
@@ -2946,9 +2935,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE0 = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE1 = 4 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE1_PAN = 5 | ARM_MMU_IDX_NOTLB,
     /*
      * Not allocated a TLB: used only for second stage of an S12 page
      * table walk, or for descriptor loads during first stage of an S1
@@ -2956,8 +2942,8 @@ typedef enum ARMMMUIdx {
      * then various TLB flush insns which currently are no-ops or flush
      * only stage 1 MMU indexes will need to change to flush stage 2.
      */
-    ARMMMUIdx_Stage2     = 6 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 7 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -2987,14 +2973,7 @@ typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E2),
     TO_CORE_BIT(E20_2),
     TO_CORE_BIT(E20_2_PAN),
-    TO_CORE_BIT(SE10_0),
-    TO_CORE_BIT(SE20_0),
-    TO_CORE_BIT(SE10_1),
-    TO_CORE_BIT(SE20_2),
-    TO_CORE_BIT(SE10_1_PAN),
-    TO_CORE_BIT(SE20_2_PAN),
-    TO_CORE_BIT(SE2),
-    TO_CORE_BIT(SE3),
+    TO_CORE_BIT(E3),
 
     TO_CORE_BIT(MUser),
     TO_CORE_BIT(MPriv),
diff --git a/target/arm/internals.h b/target/arm/internals.h
index d7062c6503..1bbe4d950e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -655,21 +655,12 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return true;
     default:
         return false;
@@ -680,11 +671,8 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_1_PAN:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_2_PAN:
         return true;
     default:
         return false;
@@ -695,30 +683,20 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_SE2:
     case ARMMMUIdx_E2:
         return 2;
-    case ARMMMUIdx_SE3:
+    case ARMMMUIdx_E3:
         return 3;
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_Stage1_SE0:
-        return arm_el_is_aa64(env, 3) ? 1 : 3;
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_E10_0:
     case ARMMMUIdx_Stage1_E0:
+        return arm_el_is_aa64(env, 3) || !arm_is_secure_below_el3(env) ? 1 : 3;
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
-    case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
     case ARMMMUIdx_MPrivNegPri:
@@ -944,9 +922,6 @@ static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
         return true;
     default:
         return false;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e98fc75646..7d9d4a9ad9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1737,6 +1737,7 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     /* Begin with base v8.0 state.  */
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
+    uint64_t changed;
 
     /*
      * Because SCR_EL3 is the "real" cpreg and SCR is the alias, reset always
@@ -1796,7 +1797,22 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 
     /* Clear all-context RES0 bits.  */
     value &= valid_mask;
-    raw_write(env, ri, value);
+    changed = env->cp15.scr_el3 ^ value;
+    env->cp15.scr_el3 = value;
+
+    /*
+     * If SCR_EL3.NS changes, i.e. arm_is_secure_below_el3, then
+     * we must invalidate all TLBs below EL3.
+     */
+    if (changed & SCR_NS) {
+        tlb_flush_by_mmuidx(env_cpu(env), (ARMMMUIdxBit_E10_0 |
+                                           ARMMMUIdxBit_E20_0 |
+                                           ARMMMUIdxBit_E10_1 |
+                                           ARMMMUIdxBit_E20_2 |
+                                           ARMMMUIdxBit_E10_1_PAN |
+                                           ARMMMUIdxBit_E20_2_PAN |
+                                           ARMMMUIdxBit_E2));
+    }
 }
 
 static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2627,9 +2643,6 @@ static int gt_phys_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYP;
     default:
         return GTIMER_PHYS;
@@ -2642,9 +2655,6 @@ static int gt_virt_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYPVIRT;
     default:
         return GTIMER_VIRT;
@@ -3352,7 +3362,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL1: ATS1CPR, ATS1CPW, ATS1CPRP, ATS1CPWP */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_SE3;
+            mmu_idx = ARMMMUIdx_E3;
             secure = true;
             break;
         case 2:
@@ -3360,10 +3370,9 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             /* fall through */
         case 1:
             if (ri->crm == 9 && (env->uncached_cpsr & CPSR_PAN)) {
-                mmu_idx = (secure ? ARMMMUIdx_Stage1_SE1_PAN
-                           : ARMMMUIdx_Stage1_E1_PAN);
+                mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
             } else {
-                mmu_idx = secure ? ARMMMUIdx_Stage1_SE1 : ARMMMUIdx_Stage1_E1;
+                mmu_idx = ARMMMUIdx_Stage1_E1;
             }
             break;
         default:
@@ -3374,7 +3383,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL0: ATS1CUR, ATS1CUW */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_SE10_0;
+            mmu_idx = ARMMMUIdx_E10_0;
             secure = true;
             break;
         case 2:
@@ -3382,7 +3391,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
+            mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         default:
             g_assert_not_reached();
@@ -3451,17 +3460,16 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = (secure ? ARMMMUIdx_Stage1_SE1_PAN
-                           : ARMMMUIdx_Stage1_E1_PAN);
+                mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
             } else {
-                mmu_idx = secure ? ARMMMUIdx_Stage1_SE1 : ARMMMUIdx_Stage1_E1;
+                mmu_idx = ARMMMUIdx_Stage1_E1;
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2;
+            mmu_idx = ARMMMUIdx_E2;
             break;
         case 6: /* AT S1E3R, AT S1E3W */
-            mmu_idx = ARMMMUIdx_SE3;
+            mmu_idx = ARMMMUIdx_E3;
             secure = true;
             break;
         default:
@@ -3469,13 +3477,13 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
+        mmu_idx = ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_E10_1;
+        mmu_idx = ARMMMUIdx_E10_1;
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = secure ? ARMMMUIdx_SE10_0 : ARMMMUIdx_E10_0;
+        mmu_idx = ARMMMUIdx_E10_0;
         break;
     default:
         g_assert_not_reached();
@@ -3775,11 +3783,6 @@ static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
         uint16_t mask = ARMMMUIdxBit_E20_2 |
                         ARMMMUIdxBit_E20_2_PAN |
                         ARMMMUIdxBit_E20_0;
-
-        if (arm_is_secure_below_el3(env)) {
-            mask >>= ARM_MMU_IDX_A_NS;
-        }
-
         tlb_flush_by_mmuidx(env_cpu(env), mask);
     }
     raw_write(env, ri, value);
@@ -3799,11 +3802,6 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         uint16_t mask = ARMMMUIdxBit_E10_1 |
                         ARMMMUIdxBit_E10_1_PAN |
                         ARMMMUIdxBit_E10_0;
-
-        if (arm_is_secure_below_el3(env)) {
-            mask >>= ARM_MMU_IDX_A_NS;
-        }
-
         tlb_flush_by_mmuidx(cs, mask);
         raw_write(env, ri, value);
     }
@@ -4274,11 +4272,6 @@ static int vae1_tlbmask(CPUARMState *env)
                ARMMMUIdxBit_E10_1_PAN |
                ARMMMUIdxBit_E10_0;
     }
-
-    if (arm_is_secure_below_el3(env)) {
-        mask >>= ARM_MMU_IDX_A_NS;
-    }
-
     return mask;
 }
 
@@ -4305,10 +4298,6 @@ static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
         mmu_idx = ARMMMUIdx_E10_0;
     }
 
-    if (arm_is_secure_below_el3(env)) {
-        mmu_idx &= ~ARM_MMU_IDX_A_NS;
-    }
-
     return tlbbits_for_regime(env, mmu_idx, addr);
 }
 
@@ -4341,30 +4330,17 @@ static int alle1_tlbmask(CPUARMState *env)
      * stage 2 translations, whereas most other scopes only invalidate
      * stage 1 translations.
      */
-    if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
-    } else {
-        return ARMMMUIdxBit_E10_1 |
-               ARMMMUIdxBit_E10_1_PAN |
-               ARMMMUIdxBit_E10_0;
-    }
+    return (ARMMMUIdxBit_E10_1 |
+            ARMMMUIdxBit_E10_1_PAN |
+            ARMMMUIdxBit_E10_0);
 }
 
 static int e2_tlbmask(CPUARMState *env)
 {
-    if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE20_0 |
-               ARMMMUIdxBit_SE20_2 |
-               ARMMMUIdxBit_SE20_2_PAN |
-               ARMMMUIdxBit_SE2;
-    } else {
-        return ARMMMUIdxBit_E20_0 |
-               ARMMMUIdxBit_E20_2 |
-               ARMMMUIdxBit_E20_2_PAN |
-               ARMMMUIdxBit_E2;
-    }
+    return (ARMMMUIdxBit_E20_0 |
+            ARMMMUIdxBit_E20_2 |
+            ARMMMUIdxBit_E20_2_PAN |
+            ARMMMUIdxBit_E2);
 }
 
 static void tlbi_aa64_alle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4391,7 +4367,7 @@ static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
 
-    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_SE3);
+    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4417,7 +4393,7 @@ static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_SE3);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4445,7 +4421,7 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = CPU(cpu);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_SE3);
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4484,12 +4460,10 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
-    bool secure = arm_is_secure_below_el3(env);
-    int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
-    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
-                                  pageaddr);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);
 
-    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                  ARMMMUIdxBit_E2, bits);
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4497,10 +4471,10 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
-    int bits = tlbbits_for_regime(env, ARMMMUIdx_SE3, pageaddr);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_E3, pageaddr);
 
     tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                  ARMMMUIdxBit_SE3, bits);
+                                                  ARMMMUIdxBit_E3, bits);
 }
 
 #ifdef TARGET_AARCH64
@@ -4606,8 +4580,7 @@ static void tlbi_aa64_rvae1is_write(CPUARMState *env,
 
 static int vae2_tlbmask(CPUARMState *env)
 {
-    return (arm_is_secure_below_el3(env)
-            ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2);
+    return ARMMMUIdxBit_E2;
 }
 
 static void tlbi_aa64_rvae2_write(CPUARMState *env,
@@ -4653,8 +4626,7 @@ static void tlbi_aa64_rvae3_write(CPUARMState *env,
      * flush-last-level-only.
      */
 
-    do_rvae_write(env, value, ARMMMUIdxBit_SE3,
-                  tlb_force_broadcast(env));
+    do_rvae_write(env, value, ARMMMUIdxBit_E3, tlb_force_broadcast(env));
 }
 
 static void tlbi_aa64_rvae3is_write(CPUARMState *env,
@@ -4668,7 +4640,7 @@ static void tlbi_aa64_rvae3is_write(CPUARMState *env,
      * flush-last-level-only or inner/outer specific flushes.
      */
 
-    do_rvae_write(env, value, ARMMMUIdxBit_SE3, true);
+    do_rvae_write(env, value, ARMMMUIdxBit_E3, true);
 }
 #endif
 
@@ -10604,8 +10576,7 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
     if (el == 0) {
         ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-             ? 2 : 1;
+        el = mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1;
     }
     return env->cp15.sctlr_el[el];
 }
@@ -11149,22 +11120,15 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE20_0:
         return 0;
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
         return 1;
     case ARMMMUIdx_E2:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return 2;
-    case ARMMMUIdx_SE3:
+    case ARMMMUIdx_E3:
         return 3;
     default:
         g_assert_not_reached();
@@ -11217,15 +11181,11 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
         }
         break;
     case 3:
-        return ARMMMUIdx_SE3;
+        return ARMMMUIdx_E3;
     default:
         g_assert_not_reached();
     }
 
-    if (arm_is_secure_below_el3(env)) {
-        idx &= ~ARM_MMU_IDX_A_NS;
-    }
-
     return idx;
 }
 
@@ -11407,15 +11367,11 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         switch (mmu_idx) {
         case ARMMMUIdx_E10_1:
         case ARMMMUIdx_E10_1_PAN:
-        case ARMMMUIdx_SE10_1:
-        case ARMMMUIdx_SE10_1_PAN:
             /* TODO: ARMv8.3-NV */
             DP_TBFLAG_A64(flags, UNPRIV, 1);
             break;
         case ARMMMUIdx_E20_2:
         case ARMMMUIdx_E20_2_PAN:
-        case ARMMMUIdx_SE20_2:
-        case ARMMMUIdx_SE20_2_PAN:
             /*
              * Note that EL20_2 is gated by HCR_EL2.E2H == 1, but EL20_0 is
              * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a7c0d616a0..1fb4d44600 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -65,12 +65,6 @@ unsigned int arm_pamax(ARMCPU *cpu)
 ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
-        return ARMMMUIdx_Stage1_SE0;
-    case ARMMMUIdx_SE10_1:
-        return ARMMMUIdx_Stage1_SE1;
-    case ARMMMUIdx_SE10_1_PAN:
-        return ARMMMUIdx_Stage1_SE1_PAN;
     case ARMMMUIdx_E10_0:
         return ARMMMUIdx_Stage1_E0;
     case ARMMMUIdx_E10_1:
@@ -95,11 +89,8 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
     case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE20_0:
     case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_SE0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
     case ARMMMUIdx_MUserNegPri:
@@ -2320,7 +2311,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
+            is_el0 = mmu_idx == ARMMMUIdx_E10_0;
 
             /*
              * S1 is done, now do S2 translation.
@@ -2528,6 +2519,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
     case ARMMMUIdx_E2:
+        is_secure = arm_is_secure_below_el3(env);
+        break;
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
@@ -2535,17 +2528,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     case ARMMMUIdx_MUser:
         is_secure = false;
         break;
-    case ARMMMUIdx_SE3:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
-    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 57f492ccef..ff14c90997 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -111,14 +111,6 @@ static int get_a64_user_mem_index(DisasContext *s)
         case ARMMMUIdx_E20_2_PAN:
             useridx = ARMMMUIdx_E20_0;
             break;
-        case ARMMMUIdx_SE10_1:
-        case ARMMMUIdx_SE10_1_PAN:
-            useridx = ARMMMUIdx_SE10_0;
-            break;
-        case ARMMMUIdx_SE20_2:
-        case ARMMMUIdx_SE20_2_PAN:
-            useridx = ARMMMUIdx_SE20_0;
-            break;
         default:
             g_assert_not_reached();
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 540ce84d95..f6e61dffe9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -237,16 +237,12 @@ static inline int get_a32_user_mem_index(DisasContext *s)
      *  otherwise, access as if at PL0.
      */
     switch (s->mmu_idx) {
+    case ARMMMUIdx_E3:
     case ARMMMUIdx_E2:        /* this one is UNPREDICTABLE */
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
         return arm_to_core_mmu_idx(ARMMMUIdx_E10_0);
-    case ARMMMUIdx_SE3:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-        return arm_to_core_mmu_idx(ARMMMUIdx_SE10_0);
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MPriv:
         return arm_to_core_mmu_idx(ARMMMUIdx_MUser);
-- 
2.34.1


