Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6857F4FCADD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:59:20 +0200 (CEST)
Received: from localhost ([::1]:42204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4sJ-0006kK-Ha
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tg-0001wI-9O
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tc-0001tO-61
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id o5so4251151pjr.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OgPG6q9N2Hh+dSzUOr7wF3dwYy5RnDPQT3Bvmp/3SMY=;
 b=tAVNYCMRUy8C/aQmHkGrDV2dGlgiRv27ZXO7zr/1/9kIHyEdQFlxolbN2UeYnv6RmH
 Zx+RCoq4LEC+5jWuKYgFwvndxU69YDE4QgPHSpvII83LKagpGL59IZtlqSFOSh5yR8+r
 ziTN2JPIOIRFfq/mN0/XQ6GpykUMJ36gkfKaHIGe1o6MXeAGCepIl9QwtTJCHUsPxYUu
 727EgyAiKmD18b8RiU2GIdYNE9aDaO/5ye2/mLOKrcZX831E1Gb/n+9tqN8kQntGQ4U9
 tHH0AQU81bi47Dt9mTIi6UwxtjRansEh4sBn8NgzL6UTyidi98bD67b7VlKnGa2abdA0
 HhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OgPG6q9N2Hh+dSzUOr7wF3dwYy5RnDPQT3Bvmp/3SMY=;
 b=02+tONJ6ZtnwMMIvzCS3RpJsa/sHjnQxcXkD1+GysoO3T7Fi3zN4eb2dcj4Ryps3oC
 3NMM75K+H9LsO21W3PFgD2B5uU22G2r8Ita6hNUTwx0MDBkxrYu65Ll9jdUIYuamLQKA
 kGIPh0SSjtEtuRBXGm73/adqz+f7SBWBcxbBfqtD4QVDqcPIv6HbGmnssEGRnrZ+KjEK
 qFuK2pM3A2zBKbEtNPLIoYEUf6r+jHI74xy3Nyx8wd7nI1o2zhcGxyaaympUMJ+cwa5+
 wDhaTp+hsD40TBXAn7830LirtBYgY9nCaK5D16ZSlza2FJSdF4utNyBTo0N4f0jk895n
 pIxQ==
X-Gm-Message-State: AOAM532l4/U2whlJy4H3FpYkIF93afRZSc87XJChNw/PJLnpRXN8VMCJ
 58F0JknXVkszbQTLFzv6dUYAEZp6IUPPSg==
X-Google-Smtp-Source: ABdhPJxmQDhJFeCeEu6DqTk5SHsCSSSIytALMzSRWKMHHYbQ6IZYnT3aKQfSo7S29RFewSNINtUHJg==
X-Received: by 2002:a17:902:8f94:b0:154:839b:809f with SMTP id
 z20-20020a1709028f9400b00154839b809fmr34390318plo.150.1649723625921; 
 Mon, 11 Apr 2022 17:33:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/24] target/arm: Enable FEAT_CSV2_2 for -cpu max
Date: Mon, 11 Apr 2022 17:33:22 -0700
Message-Id: <20220412003326.588530-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no branch prediction in TCG, therefore there is no
need to actually include the context number into the predictor.
Therefore all we need to do is add the state for SCXTNUM_ELx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
---
 docs/system/arm/emulation.rst |  3 ++
 target/arm/cpu.h              | 16 +++++++++
 target/arm/cpu64.c            |  3 +-
 target/arm/helper.c           | 67 ++++++++++++++++++++++++++++++++++-
 4 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 91fb06c579..aebe3be1ba 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -12,6 +12,9 @@ the following architecture extensions:
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_CSV2 (Cache speculation variant 2)
+- FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
+- FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
+- FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6793336b5e..4b3b537fff 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -687,6 +687,8 @@ typedef struct CPUArchState {
         ARMPACKey apdb;
         ARMPACKey apga;
     } keys;
+
+    uint64_t scxtnum_el[4];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
@@ -1210,6 +1212,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_WXN     (1U << 19)
 #define SCTLR_ST      (1U << 20) /* up to ??, RAZ in v6 */
 #define SCTLR_UWXN    (1U << 20) /* v7 onward, AArch32 only */
+#define SCTLR_TSCXT   (1U << 20) /* FEAT_CSV2_1p2, AArch64 only */
 #define SCTLR_FI      (1U << 21) /* up to v7, v8 RES0 */
 #define SCTLR_IESB    (1U << 21) /* v8.2-IESB, AArch64 only */
 #define SCTLR_U       (1U << 22) /* up to v6, RAO in v7 */
@@ -4368,6 +4371,19 @@ static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa64_scxtnum(const ARMISARegisters *id)
+{
+    int key = FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, CSV2);
+    if (key >= 2) {
+        return true;      /* FEAT_CSV2_2 */
+    }
+    if (key == 1) {
+        key = FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, CSV2_FRAC);
+        return key >= 2;  /* FEAT_CSV2_1p2 */
+    }
+    return false;
+}
+
 static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb4bcd8e80..98fc3ace1f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,7 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
@@ -760,6 +760,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c29409f060..0291666c03 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1780,6 +1780,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= SCR_ENSCXT;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -5312,6 +5315,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= HCR_ENSCXT;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5965,6 +5971,10 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
           "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
 
+        { K(3, 0, 13, 0, 7), K(3, 4, 13, 0, 7), K(3, 5, 13, 0, 7),
+          "SCXTNUM_EL1", "SCXTNUM_EL2", "SCXTNUM_EL12",
+          isar_feature_aa64_scxtnum },
+
         /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
         /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
     };
@@ -7432,7 +7442,58 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-#endif
+static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el == 0) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_TGE | HCR_E2H)) != (HCR_TGE | HCR_E2H)) {
+            if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
+                if (hcr & HCR_TGE) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+                return CP_ACCESS_TRAP;
+            }
+            if (arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
+                return CP_ACCESS_TRAP_EL2;
+            }
+            goto no_sctlr_el2;
+        }
+    }
+    if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+ no_sctlr_el2:
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENSCXT)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo scxtnum_reginfo[] = {
+    { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL0_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
+    { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL1_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
+    { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL2_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[2]) },
+    { .name = "SCXTNUM_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[3]) },
+    REGINFO_SENTINEL
+};
+#endif /* TARGET_AARCH64 */
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
@@ -8632,6 +8693,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
         define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
+
+    if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+        define_arm_cp_regs(cpu, scxtnum_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
-- 
2.25.1


