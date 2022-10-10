Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3270F5FA049
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:37:33 +0200 (CEST)
Received: from localhost ([::1]:53858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtuO-0000fe-AC
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl1-0006Nm-L9
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtky-0005Yk-RI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id w18so17309359wro.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8KN39KxuuUpoFwsZlwa3jHRbr69AfXnER2za+6zeO64=;
 b=Ujwz74+5iRRJT2Zor8RypET98yHJRnwJ2rcbqU++deAkaWQigt+7dJvDMppiQn1Fxz
 Vs8upwPWZ59ArJfc314F+erlkeWo4kq2MdEs6tEAT6GOC7cCEeSewkSIoiw4/OVYZebu
 wCn7FBrU8tfzZIFXHosyb+laRpomlDSaOE8GepAVcPaBAAnTJIt3xt01sEGWybpzIIaI
 XsW7iNYvQcNI59r1rP5ijGB3Zvhviw2p13IWT1U6xf/orJJbWf1lmFaYH/0rWlmMkSZZ
 O+TXUgfxmk976qGYf030fW3SVlpC+iYupWUohskf8aK6J4pVbpr1T4oKlm0qYyTXULRf
 4Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KN39KxuuUpoFwsZlwa3jHRbr69AfXnER2za+6zeO64=;
 b=38UiZQAqeUJ1djok68cGjcMOjzqpTnbwvfGEViJdBewoaBJYgiM+DaIPdkrvzV0qrK
 bfSPPLM3aQrk9IYOx/LiE9s78Pbc6rd8Kke1igIG6hsBY3DNaC9TBO7pZ5BNWmIyDCMo
 +PXMQvW6aH/f6mz1AA8QUnlKizmQaM/aN4r7V2TNgxjiw3a3ceoSS7W7meVZ+3k9BJRx
 0yDmHqQ4e4RiV1qvutiPvkg6lVxp+iEPWG5z51q2aIRtiQXFfRetrjwwk5pv6ZBi9A1D
 ToS2nalkps2bZddQmV02hfIGSgsk/KtHzuIpxi/fZtsu5nHjFnfrxsPexw2ylnYJn80D
 KUFA==
X-Gm-Message-State: ACrzQf0EIB80aMtcG00Oq5EBgcx6yoX5u3BhCtSxm2IYeWAZHrcvvy5N
 TGMDlV6r8w2QzyWisgiD9NC+Xbz8VMZHdg==
X-Google-Smtp-Source: AMsMyM7gPq0kjyq+N50HCL5wm49EDUvsvZlFPtgpv8FkMzvBoS35y39ggePPeR8tlTNBcv5mDZ6bVQ==
X-Received: by 2002:a5d:6906:0:b0:22c:d6d5:6322 with SMTP id
 t6-20020a5d6906000000b0022cd6d56322mr11951620wru.355.1665412067708; 
 Mon, 10 Oct 2022 07:27:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/28] target/arm: Fold secure and non-secure a-profile mmu
 indexes
Date: Mon, 10 Oct 2022 15:27:16 +0100
Message-Id: <20221010142730.502083-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

For a-profile aarch64, which does not bank system registers, it takes
quite a lot of code to switch between security states.  In the process,
registers such as TCR_EL{1,2} must be swapped, which in itself requires
the flushing of softmmu tlbs.  Therefore it doesn't buy us anything to
separate tlbs by security state.

Retain the distinction between Stage2 and Stage2_S.

This will be important as we implement FEAT_RME, and do not wish to
add a third set of mmu indexes for Realm state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.h           |  72 +++++++------------
 target/arm/internals.h     |  31 +-------
 target/arm/helper.c        | 144 +++++++++++++------------------------
 target/arm/ptw.c           |  25 ++-----
 target/arm/translate-a64.c |   8 ---
 target/arm/translate.c     |   6 +-
 7 files changed, 85 insertions(+), 203 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 68ffb124278..08681828ac4 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -32,6 +32,6 @@
 # define TARGET_PAGE_BITS_MIN  10
 #endif
 
-#define NB_MMU_MODES 15
+#define NB_MMU_MODES 8
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a085c172974..53f4c236e1f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2884,26 +2884,27 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  *     table over and over.
  *  6. we need separate EL1/EL2 mmu_idx for handling the Privileged Access
  *     Never (PAN) bit within PSTATE.
+ *  7. we fold together the secure and non-secure regimes for A-profile,
+ *     because there are no banked system registers for aarch64, so the
+ *     process of switching between secure and non-secure is
+ *     already heavyweight.
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
- * for a total of 11 different mmu_idx.
+ * for a total of 8 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
- * as A profile. They only need to distinguish NS EL0 and NS EL1 (and
- * NS EL2 if we ever model a Cortex-R52).
+ * as A profile. They only need to distinguish EL0 and EL1 (and
+ * EL2 if we ever model a Cortex-R52).
  *
  * M profile CPUs are rather different as they do not have a true MMU.
  * They have the following different MMU indexes:
@@ -2942,9 +2943,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
 #define ARM_MMU_IDX_M     0x40  /* M profile */
 
-/* Meanings of the bits for A profile mmu idx values */
-#define ARM_MMU_IDX_A_NS     0x8
-
 /* Meanings of the bits for M profile mmu idx values */
 #define ARM_MMU_IDX_M_PRIV   0x1
 #define ARM_MMU_IDX_M_NEGPRI 0x2
@@ -2958,22 +2956,14 @@ typedef enum ARMMMUIdx {
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
@@ -2982,9 +2972,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE0 = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE1 = 4 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_SE1_PAN = 5 | ARM_MMU_IDX_NOTLB,
     /*
      * Not allocated a TLB: used only for second stage of an S12 page
      * table walk, or for descriptor loads during first stage of an S1
@@ -2992,8 +2979,8 @@ typedef enum ARMMMUIdx {
      * then various TLB flush insns which currently are no-ops or flush
      * only stage 1 MMU indexes will need to change to flush stage 2.
      */
-    ARMMMUIdx_Stage2     = 6 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 7 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -3023,14 +3010,7 @@ typedef enum ARMMMUIdxBit {
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
index 14428730d44..b509d708514 100644
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
index fd4663a9467..b1b8725628b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1754,6 +1754,7 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     /* Begin with base v8.0 state.  */
     uint64_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
+    uint64_t changed;
 
     /*
      * Because SCR_EL3 is the "real" cpreg and SCR is the alias, reset always
@@ -1816,7 +1817,22 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 
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
@@ -2647,9 +2663,6 @@ static int gt_phys_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYP;
     default:
         return GTIMER_PHYS;
@@ -2662,9 +2675,6 @@ static int gt_virt_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYPVIRT;
     default:
         return GTIMER_VIRT;
@@ -3372,7 +3382,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL1: ATS1CPR, ATS1CPW, ATS1CPRP, ATS1CPWP */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_SE3;
+            mmu_idx = ARMMMUIdx_E3;
             secure = true;
             break;
         case 2:
@@ -3380,10 +3390,9 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
@@ -3394,7 +3403,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL0: ATS1CUR, ATS1CUW */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_SE10_0;
+            mmu_idx = ARMMMUIdx_E10_0;
             secure = true;
             break;
         case 2:
@@ -3402,7 +3411,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
+            mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         default:
             g_assert_not_reached();
@@ -3471,17 +3480,16 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -3489,13 +3497,13 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -3765,11 +3773,6 @@ static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -3789,11 +3792,6 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -4264,11 +4262,6 @@ static int vae1_tlbmask(CPUARMState *env)
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
 
@@ -4295,10 +4288,6 @@ static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
         mmu_idx = ARMMMUIdx_E10_0;
     }
 
-    if (arm_is_secure_below_el3(env)) {
-        mmu_idx &= ~ARM_MMU_IDX_A_NS;
-    }
-
     return tlbbits_for_regime(env, mmu_idx, addr);
 }
 
@@ -4331,30 +4320,17 @@ static int alle1_tlbmask(CPUARMState *env)
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
@@ -4381,7 +4357,7 @@ static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
 
-    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_SE3);
+    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4407,7 +4383,7 @@ static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_SE3);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4435,7 +4411,7 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = CPU(cpu);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_SE3);
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_E3);
 }
 
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4474,12 +4450,10 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -4487,10 +4461,10 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -4596,8 +4570,7 @@ static void tlbi_aa64_rvae1is_write(CPUARMState *env,
 
 static int vae2_tlbmask(CPUARMState *env)
 {
-    return (arm_is_secure_below_el3(env)
-            ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2);
+    return ARMMMUIdxBit_E2;
 }
 
 static void tlbi_aa64_rvae2_write(CPUARMState *env,
@@ -4643,8 +4616,7 @@ static void tlbi_aa64_rvae3_write(CPUARMState *env,
      * flush-last-level-only.
      */
 
-    do_rvae_write(env, value, ARMMMUIdxBit_SE3,
-                  tlb_force_broadcast(env));
+    do_rvae_write(env, value, ARMMMUIdxBit_E3, tlb_force_broadcast(env));
 }
 
 static void tlbi_aa64_rvae3is_write(CPUARMState *env,
@@ -4658,7 +4630,7 @@ static void tlbi_aa64_rvae3is_write(CPUARMState *env,
      * flush-last-level-only or inner/outer specific flushes.
      */
 
-    do_rvae_write(env, value, ARMMMUIdxBit_SE3, true);
+    do_rvae_write(env, value, ARMMMUIdxBit_E3, true);
 }
 #endif
 
@@ -10271,8 +10243,7 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
     if (el == 0) {
         ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-             ? 2 : 1;
+        el = mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1;
     }
     return env->cp15.sctlr_el[el];
 }
@@ -10816,22 +10787,15 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
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
@@ -10884,15 +10848,11 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
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
 
@@ -11095,15 +11055,11 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
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
index 55e8f33c508..2055d684e63 100644
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
@@ -2304,7 +2295,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
 
             s2_mmu_idx = (s2walk_secure
                           ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
+            is_el0 = mmu_idx == ARMMMUIdx_E10_0;
 
             /*
              * S1 is done, now do S2 translation.
@@ -2511,6 +2502,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
     case ARMMMUIdx_E2:
+        is_secure = arm_is_secure_below_el3(env);
+        break;
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
@@ -2518,17 +2511,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
index 78b2d91ed40..5b67375f4ec 100644
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
index ac647e02628..2f72afe019a 100644
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
2.25.1


