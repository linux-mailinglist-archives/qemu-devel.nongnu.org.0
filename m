Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145BD14D487
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 01:15:45 +0100 (CET)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwxUm-0001LS-3G
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 19:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iwxCO-00045K-Tx
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iwxCL-0007yW-Sc
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:56:44 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45635)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iwxCL-0007wX-Ju
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:56:41 -0500
Received: by mail-pl1-x644.google.com with SMTP id b22so580351pls.12
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 15:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b1PL3xWbJMS+jQgXY3o080EZ/7AY5rIBSbrFWCdJR3s=;
 b=Zj2YS0hLVrU486aOYmwfkQtC39k3fkNO8vpVm/4R4ZF7NU/u0dBArCeMdFtJ0sUFCN
 boyY4Tv+HPwBRc56iCYCn/jl3FIcFj0xlNFo2zqRJ8FE2t9qKZlfBi3U8ydQJ5JnvDzq
 +zWXNh9kxRI36iMNqQ2gweaUB4LI8nk21AIi7AvwM5S/jhxeOxntstO23WkYIA7hOAne
 RW2O6sGi1+QHfJWqjoxsD66xuKXvCmNTC8Q+fsgtg0YTWu4IhPzAf61K3Ar4+e+TjREc
 IpVh2D9e955AHdXcWhpRII7bLa67P1V+jNRWtJIVVLP0OKn/xu+mP3yX86smzFeeQVv5
 iwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1PL3xWbJMS+jQgXY3o080EZ/7AY5rIBSbrFWCdJR3s=;
 b=tx677JcOdhMVvLkF4LD+XNahZFx+jKbL7XN5DDxiMP6aHIan7GAelpdNuZRokgfg9h
 12Yt1BKmgRuYrLE/r7hwSMz30ECMBoyiiAkeijSyp3FYdQMsPV+1/sEYSInTROaf1dYK
 Xoz2zeTCKSrEAeEmPE6qHXjq8gHfelRzR87ceYb8wT6kAARF7na+W/BejzAeQgP7oVRh
 kKLLZxHPPT6tZKFBA7o2vsIYkMkV1mMhTueK2iPZPt8LgQwMxkpzrKB7Vvp4ipOEMXY4
 ibJ9+4OoJwhH0EMUw7Xj3d5mtOCgKfw5JYp6VPJkQ1CI9JYZ/Pu7kkULMjmafmt07gyO
 UKLg==
X-Gm-Message-State: APjAAAUz/3eZaI+8axAKSkfaWYRgB9ziNLMufelFooulsuX0Z0+kp6CY
 NMwoirllGIg+zITkvDmP5VyOqPnwbCk=
X-Google-Smtp-Source: APXvYqxx7wm2IGbgT+D7P6zFepsIz8oC22ayTDIsfcprTwiW+HroF97EJtxXpS1hf1Vah2HLSeiPCQ==
X-Received: by 2002:a17:902:9a98:: with SMTP id
 w24mr1947487plp.40.1580342199988; 
 Wed, 29 Jan 2020 15:56:39 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm3953626pfg.145.2020.01.29.15.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 15:56:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/41] target/arm: Reorganize ARMMMUIdx
Date: Wed, 29 Jan 2020 15:55:52 -0800
Message-Id: <20200129235614.29829-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129235614.29829-1-richard.henderson@linaro.org>
References: <20200129235614.29829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for, but do not yet implement, the EL2&0 regime.
This involves adding the new MMUIdx enumerators and adjusting
some of the MMUIdx related predicates to match.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |   2 +-
 target/arm/cpu.h       | 134 ++++++++++++++++++-----------------------
 target/arm/internals.h |  35 +++++++++++
 target/arm/helper.c    |  66 +++++++++++++++++---
 target/arm/translate.c |   1 -
 5 files changed, 152 insertions(+), 86 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 6e6948e960..18ac562346 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -29,6 +29,6 @@
 # define TARGET_PAGE_BITS_MIN  10
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 9
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3525b6425b..1312046b45 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2812,18 +2812,21 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  *  + NonSecure EL1 & 0 stage 1
  *  + NonSecure EL1 & 0 stage 2
  *  + NonSecure EL2
- *  + Secure EL1 & EL0
+ *  + NonSecure EL2 & 0   (ARMv8.1-VHE)
+ *  + Secure EL1 & 0
  *  + Secure EL3
  * If EL3 is 32-bit:
  *  + NonSecure PL1 & 0 stage 1
  *  + NonSecure PL1 & 0 stage 2
  *  + NonSecure PL2
- *  + Secure PL0 & PL1
+ *  + Secure PL0
+ *  + Secure PL1
  * (reminder: for 32 bit EL3, Secure PL1 is *EL3*, not EL1.)
  *
  * For QEMU, an mmu_idx is not quite the same as a translation regime because:
- *  1. we need to split the "EL1 & 0" regimes into two mmu_idxes, because they
- *     may differ in access permissions even if the VA->PA map is the same
+ *  1. we need to split the "EL1 & 0" and "EL2 & 0" regimes into two mmu_idxes,
+ *     because they may differ in access permissions even if the VA->PA map is
+ *     the same
  *  2. we want to cache in our TLB the full VA->IPA->PA lookup for a stage 1+2
  *     translation, which means that we have one mmu_idx that deals with two
  *     concatenated translation regimes [this sort of combined s1+2 TLB is
@@ -2835,19 +2838,23 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  *  4. we can also safely fold together the "32 bit EL3" and "64 bit EL3"
  *     translation regimes, because they map reasonably well to each other
  *     and they can't both be active at the same time.
- * This gives us the following list of mmu_idx values:
+ *  5. we want to be able to use the TLB for accesses done as part of a
+ *     stage1 page table walk, rather than having to walk the stage2 page
+ *     table over and over.
  *
- * NS EL0 (aka NS PL0) stage 1+2
- * NS EL1 (aka NS PL1) stage 1+2
+ * This gives us the following list of cases:
+ *
+ * NS EL0 EL1&0 stage 1+2 (aka NS PL0)
+ * NS EL1 EL1&0 stage 1+2 (aka NS PL1)
+ * NS EL0 EL2&0
+ * NS EL2 EL2&0
  * NS EL2 (aka NS PL2)
+ * S EL0 EL1&0 (aka S PL0)
+ * S EL1 EL1&0 (not used if EL3 is 32 bit)
  * S EL3 (aka S PL1)
- * S EL0 (aka S PL0)
- * S EL1 (not used if EL3 is 32 bit)
- * NS EL0+1 stage 2
+ * NS EL1&0 stage 2
  *
- * (The last of these is an mmu_idx because we want to be able to use the TLB
- * for the accesses done as part of a stage 1 page table walk, rather than
- * having to walk the stage 2 page table over and over.)
+ * for a total of 9 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish NS EL0 and NS EL1 (and
@@ -2885,26 +2892,47 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  * For M profile we arrange them to have a bit for priv, a bit for negpri
  * and a bit for secure.
  */
-#define ARM_MMU_IDX_A 0x10 /* A profile */
-#define ARM_MMU_IDX_NOTLB 0x20 /* does not have a TLB */
-#define ARM_MMU_IDX_M 0x40 /* M profile */
+#define ARM_MMU_IDX_A     0x10  /* A profile */
+#define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
+#define ARM_MMU_IDX_M     0x40  /* M profile */
 
-/* meanings of the bits for M profile mmu idx values */
-#define ARM_MMU_IDX_M_PRIV 0x1
+/* Meanings of the bits for M profile mmu idx values */
+#define ARM_MMU_IDX_M_PRIV   0x1
 #define ARM_MMU_IDX_M_NEGPRI 0x2
-#define ARM_MMU_IDX_M_S 0x4
+#define ARM_MMU_IDX_M_S      0x4  /* Secure */
 
-#define ARM_MMU_IDX_TYPE_MASK (~0x7)
-#define ARM_MMU_IDX_COREIDX_MASK 0x7
+#define ARM_MMU_IDX_TYPE_MASK \
+    (ARM_MMU_IDX_A | ARM_MMU_IDX_M | ARM_MMU_IDX_NOTLB)
+#define ARM_MMU_IDX_COREIDX_MASK 0xf
 
 typedef enum ARMMMUIdx {
-    ARMMMUIdx_E10_0 = 0 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E10_1 = 1 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E2 = 2 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE3 = 3 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_0 = 4 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_1 = 5 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Stage2 = 6 | ARM_MMU_IDX_A,
+    /*
+     * A-profile.
+     */
+    ARMMMUIdx_E10_0 =  0 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E20_0 =  1 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_E10_1 =  2 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_E2 =     3 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E20_2 =  4 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_SE10_0 = 5 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE10_1 = 6 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE3 =    7 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_Stage2 = 8 | ARM_MMU_IDX_A,
+
+    /*
+     * These are not allocated TLBs and are used only for AT system
+     * instructions or for the first stage of an S12 page table walk.
+     */
+    ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
+
+    /*
+     * M-profile.
+     */
     ARMMMUIdx_MUser = ARM_MMU_IDX_M,
     ARMMMUIdx_MPriv = ARM_MMU_IDX_M | ARM_MMU_IDX_M_PRIV,
     ARMMMUIdx_MUserNegPri = ARMMMUIdx_MUser | ARM_MMU_IDX_M_NEGPRI,
@@ -2913,11 +2941,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_MSPriv = ARMMMUIdx_MPriv | ARM_MMU_IDX_M_S,
     ARMMMUIdx_MSUserNegPri = ARMMMUIdx_MUserNegPri | ARM_MMU_IDX_M_S,
     ARMMMUIdx_MSPrivNegPri = ARMMMUIdx_MPrivNegPri | ARM_MMU_IDX_M_S,
-    /* Indexes below here don't have TLBs and are used only for AT system
-     * instructions or for the first stage of an S12 page table walk.
-     */
-    ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
 } ARMMMUIdx;
 
 /*
@@ -2929,8 +2952,10 @@ typedef enum ARMMMUIdx {
 
 typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E10_0),
+    TO_CORE_BIT(E20_0),
     TO_CORE_BIT(E10_1),
     TO_CORE_BIT(E2),
+    TO_CORE_BIT(E20_2),
     TO_CORE_BIT(SE10_0),
     TO_CORE_BIT(SE10_1),
     TO_CORE_BIT(SE3),
@@ -2950,49 +2975,6 @@ typedef enum ARMMMUIdxBit {
 
 #define MMU_USER_IDX 0
 
-static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
-{
-    return mmu_idx & ARM_MMU_IDX_COREIDX_MASK;
-}
-
-static inline ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
-{
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return mmu_idx | ARM_MMU_IDX_M;
-    } else {
-        return mmu_idx | ARM_MMU_IDX_A;
-    }
-}
-
-/* Return the exception level we're running at if this is our mmu_idx */
-static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx & ARM_MMU_IDX_TYPE_MASK) {
-    case ARM_MMU_IDX_A:
-        return mmu_idx & 3;
-    case ARM_MMU_IDX_M:
-        return mmu_idx & ARM_MMU_IDX_M_PRIV;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-/*
- * Return the MMU index for a v7M CPU with all relevant information
- * manually specified.
- */
-ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
-                              bool secstate, bool priv, bool negpri);
-
-/* Return the MMU index for a v7M CPU in the specified security and
- * privilege state.
- */
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
-                                                bool secstate, bool priv);
-
-/* Return the MMU index for a v7M CPU in the specified security state */
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
-
 /**
  * cpu_mmu_index:
  * @env: The cpu environment
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5b8b9c233f..0c4119a3a2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -769,6 +769,39 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
 
+static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
+{
+    return mmu_idx & ARM_MMU_IDX_COREIDX_MASK;
+}
+
+static inline ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
+{
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return mmu_idx | ARM_MMU_IDX_M;
+    } else {
+        return mmu_idx | ARM_MMU_IDX_A;
+    }
+}
+
+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
+
+/*
+ * Return the MMU index for a v7M CPU with all relevant information
+ * manually specified.
+ */
+ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
+                              bool secstate, bool priv, bool negpri);
+
+/*
+ * Return the MMU index for a v7M CPU in the specified security and
+ * privilege state.
+ */
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
+                                                bool secstate, bool priv);
+
+/* Return the MMU index for a v7M CPU in the specified security state */
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
+
 /* Return true if the stage 1 translation regime is using LPAE format page
  * tables */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
@@ -810,6 +843,8 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_E2:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 53b75fd04e..bf9d85e484 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8706,9 +8706,11 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #endif /* !CONFIG_USER_ONLY */
 
 /* Return the exception level which controls this address translation regime */
-static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
+static uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_E2:
         return 2;
@@ -8719,6 +8721,8 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_SE10_1:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -8820,10 +8824,14 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
  */
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
-    if (mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_E10_1) {
-        mmu_idx += (ARMMMUIdx_Stage1_E0 - ARMMMUIdx_E10_0);
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+        return ARMMMUIdx_Stage1_E0;
+    case ARMMMUIdx_E10_1:
+        return ARMMMUIdx_Stage1_E1;
+    default:
+        return mmu_idx;
     }
-    return mmu_idx;
 }
 
 /* Return true if the translation regime is using LPAE format page tables */
@@ -8856,6 +8864,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_E20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
@@ -11281,6 +11290,31 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     return 0;
 }
 
+/* Return the exception level we're running at if this is our mmu_idx */
+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx & ARM_MMU_IDX_M) {
+        return mmu_idx & ARM_MMU_IDX_M_PRIV;
+    }
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE10_0:
+        return 0;
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_SE10_1:
+        return 1;
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E20_2:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 #ifndef CONFIG_TCG
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 {
@@ -11294,10 +11328,26 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
-    if (el < 2 && arm_is_secure_below_el3(env)) {
-        return ARMMMUIdx_SE10_0 + el;
-    } else {
-        return ARMMMUIdx_E10_0 + el;
+    switch (el) {
+    case 0:
+        /* TODO: ARMv8.1-VHE */
+        if (arm_is_secure_below_el3(env)) {
+            return ARMMMUIdx_SE10_0;
+        }
+        return ARMMMUIdx_E10_0;
+    case 1:
+        if (arm_is_secure_below_el3(env)) {
+            return ARMMMUIdx_SE10_1;
+        }
+        return ARMMMUIdx_E10_1;
+    case 2:
+        /* TODO: ARMv8.1-VHE */
+        /* TODO: ARMv8.4-SecEL2 */
+        return ARMMMUIdx_E2;
+    case 3:
+        return ARMMMUIdx_SE3;
+    default:
+        g_assert_not_reached();
     }
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c169984374..e11a5871d0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -172,7 +172,6 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPrivNegPri:
         return arm_to_core_mmu_idx(ARMMMUIdx_MSUserNegPri);
-    case ARMMMUIdx_Stage2:
     default:
         g_assert_not_reached();
     }
-- 
2.20.1


