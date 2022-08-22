Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0211959C4EE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:22:22 +0200 (CEST)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQB80-0000yA-Rq
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lh-0008Qq-RM
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:47062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LS-0000o6-GH
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id d71so9663367pgc.13
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=o2fwdLJJakpTHa+ZyaqQvGypLJhcXOKlbYR2MpafFB4=;
 b=oFtolGOo71txGFhrCCwdiHKyDV4h7usoEMgP9MhiGR7Cqces0L4FaQ0QRcVM7+Ypj+
 eEVMzQn+oOf7B19jYM261iCDias7BMR3nEnvzh2Wlwz/kjhuk55PP6g60jqxYNZ0Y5vu
 tqejcTcmPLAoJVWEeAxM6UaEac0HEm5nb5+/6GFkEjHFM+WnZnMU8eOm+C3/K7WMAqvo
 JfwGA2hcc3QENfauCUE/+ah72XRlUpgDnQCYlVZGqvLmA8Talj9DlQsFhtUc78Zak+WP
 VbsaB+kGC1SqMpkebVLZTo3dpNUBgqahByrMtedjHOGso2CdpFcKWMrzb+2aYHdhe8c/
 dY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=o2fwdLJJakpTHa+ZyaqQvGypLJhcXOKlbYR2MpafFB4=;
 b=RRAaj5eFPtCLZV4LvJo+fXfD4ku5FKv7mNQ9ARsIt/VzbAI7KNd34PzhLXlcZdtaV8
 k6JL8e0dT80euEH/4tjRkztil78e3JVrfhexRnaci1H503eYLE7r5sSk2m5liB9mTtZs
 pxNpJNbfON0XzpQHkCBJH5UnfV4Mr8bJni/p5XVWcNlVgNfpUJAkJLxkQ4osQPuNsIcH
 l9/LTy3p1ckyxIFPja/D6lLFha5yWNyEPCFcN4Vs2zkukQxXNuZpDMaNsXBwEuudwutP
 k5EId/v2jntK4wOE/jYcJ1ExKBozm+DkCza3dXc5NU+Ibm4aMi45+GUlDxeL27MICRCS
 EKzQ==
X-Gm-Message-State: ACgBeo20dh4itfUUKadeBTFZXFC97HFygmQwdQR0ZC+340CSPhai6oxs
 w0gm9Bp0w0v64sduDu/y9JYhXNx48YAeCg==
X-Google-Smtp-Source: AA6agR7RvBg8HIN8zSh9Ttuwdxm/R1GEa+4o9fPYSXsyHShh5i93b+OCs3osEA4GP2ZP8U0hR4W0iw==
X-Received: by 2002:aa7:8055:0:b0:536:df46:c567 with SMTP id
 y21-20020aa78055000000b00536df46c567mr1467272pfm.1.1661182083712; 
 Mon, 22 Aug 2022 08:28:03 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 26/66] target/arm: Fold secure and non-secure a-profile mmu
 indexes
Date: Mon, 22 Aug 2022 08:27:01 -0700
Message-Id: <20220822152741.1617527-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
index 68ffb12427..08681828ac 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -32,6 +32,6 @@
 # define TARGET_PAGE_BITS_MIN  10
 #endif
 
-#define NB_MMU_MODES 15
+#define NB_MMU_MODES 8
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ee94d8e653..cea2121f67 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2873,26 +2873,26 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
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
@@ -2931,9 +2931,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
 #define ARM_MMU_IDX_M     0x40  /* M profile */
 
-/* Meanings of the bits for A profile mmu idx values */
-#define ARM_MMU_IDX_A_NS     0x8
-
 /* Meanings of the bits for M profile mmu idx values */
 #define ARM_MMU_IDX_M_PRIV   0x1
 #define ARM_MMU_IDX_M_NEGPRI 0x2
@@ -2947,22 +2944,14 @@ typedef enum ARMMMUIdx {
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
@@ -2971,9 +2960,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE0 = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE1 = 4 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE1_PAN = 5 | ARM_MMU_IDX_NOTLB,
     /*
      * Not allocated a TLB: used only for second stage of an S12 page
      * table walk, or for descriptor loads during first stage of an S1
@@ -2981,8 +2967,8 @@ typedef enum ARMMMUIdx {
      * then various TLB flush insns which currently are no-ops or flush
      * only stage 1 MMU indexes will need to change to flush stage 2.
      */
-    ARMMMUIdx_Stage2     = 6 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 7 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -3012,14 +2998,7 @@ typedef enum ARMMMUIdxBit {
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
index a231000965..a21a21299c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -649,21 +649,12 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
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
@@ -674,11 +665,8 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
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
@@ -689,30 +677,20 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
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
@@ -954,9 +932,6 @@ static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx mmu_idx)
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
index 09990ca096..b9f1a3d826 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1671,6 +1671,7 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     /* Begin with base v8.0 state.  */
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
+    uint64_t changed;
 
     /*
      * Because SCR_EL3 is the "real" cpreg and SCR is the alias, reset always
@@ -1730,7 +1731,22 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 
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
@@ -2561,9 +2577,6 @@ static int gt_phys_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYP;
     default:
         return GTIMER_PHYS;
@@ -2576,9 +2589,6 @@ static int gt_virt_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYPVIRT;
     default:
         return GTIMER_VIRT;
@@ -3286,7 +3296,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL1: ATS1CPR, ATS1CPW, ATS1CPRP, ATS1CPWP */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_SE3;
+            mmu_idx = ARMMMUIdx_E3;
             secure = true;
             break;
         case 2:
@@ -3294,10 +3304,9 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
@@ -3308,7 +3317,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL0: ATS1CUR, ATS1CUW */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_SE10_0;
+            mmu_idx = ARMMMUIdx_E10_0;
             secure = true;
             break;
         case 2:
@@ -3316,7 +3325,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
+            mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         default:
             g_assert_not_reached();
@@ -3385,17 +3394,16 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -3403,13 +3411,13 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -3679,11 +3687,6 @@ static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -3703,11 +3706,6 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -4178,11 +4176,6 @@ static int vae1_tlbmask(CPUARMState *env)
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
 
@@ -4209,10 +4202,6 @@ static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
         mmu_idx = ARMMMUIdx_E10_0;
     }
 
-    if (arm_is_secure_below_el3(env)) {
-        mmu_idx &= ~ARM_MMU_IDX_A_NS;
-    }
-
     return tlbbits_for_regime(env, mmu_idx, addr);
 }
 
@@ -4245,30 +4234,17 @@ static int alle1_tlbmask(CPUARMState *env)
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
@@ -4295,7 +4271,7 @@ static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
 
-    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_SE3);
+    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4321,7 +4297,7 @@ static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_SE3);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4349,7 +4325,7 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = CPU(cpu);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_SE3);
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4388,12 +4364,10 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -4401,10 +4375,10 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -4510,8 +4484,7 @@ static void tlbi_aa64_rvae1is_write(CPUARMState *env,
 
 static int vae2_tlbmask(CPUARMState *env)
 {
-    return (arm_is_secure_below_el3(env)
-            ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2);
+    return ARMMMUIdxBit_E2;
 }
 
 static void tlbi_aa64_rvae2_write(CPUARMState *env,
@@ -4557,8 +4530,7 @@ static void tlbi_aa64_rvae3_write(CPUARMState *env,
      * flush-last-level-only.
      */
 
-    do_rvae_write(env, value, ARMMMUIdxBit_SE3,
-                  tlb_force_broadcast(env));
+    do_rvae_write(env, value, ARMMMUIdxBit_E3, tlb_force_broadcast(env));
 }
 
 static void tlbi_aa64_rvae3is_write(CPUARMState *env,
@@ -4572,7 +4544,7 @@ static void tlbi_aa64_rvae3is_write(CPUARMState *env,
      * flush-last-level-only or inner/outer specific flushes.
      */
 
-    do_rvae_write(env, value, ARMMMUIdxBit_SE3, true);
+    do_rvae_write(env, value, ARMMMUIdxBit_E3, true);
 }
 #endif
 
@@ -10087,8 +10059,7 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
     if (el == 0) {
         ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-             ? 2 : 1;
+        el = mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1;
     }
     return env->cp15.sctlr_el[el];
 }
@@ -10632,22 +10603,15 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
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
@@ -10700,15 +10664,11 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
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
 
@@ -10911,15 +10871,11 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
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
index 400ef00b63..2c13586396 100644
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
@@ -2323,7 +2314,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
+            is_el0 = mmu_idx == ARMMMUIdx_E10_0;
 
             /*
              * S1 is done, now do S2 translation.
@@ -2531,6 +2522,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
     case ARMMMUIdx_E2:
+        is_secure = arm_is_secure_below_el3(env);
+        break;
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
@@ -2538,17 +2531,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
index 163df8c615..1b593ada36 100644
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
index bf30231079..27e344d486 100644
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


