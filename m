Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA4318B8D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:11:07 +0100 (CET)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABkQ-0000PH-6X
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYq-0007pm-Ie
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:08 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYo-0008LT-Ln
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:08 -0500
Received: by mail-wr1-x434.google.com with SMTP id b3so4092995wrj.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rMwGAAPGdMhnkTOfB0jTA8QMpl2mDEy1rD2Rrr1X41c=;
 b=jnZtt2X+jK5oITVm5DvbIqfD4/HJyaObl0gmjDuWfsq4HD+uo449DrCKjDFNDSXudW
 TkEi8psvp6V9s+n9jYiSJ27hNSJeN2yk0dS5YKiPvQ9QfkVMcGxrBZ7uOnYxxhZXNBoz
 6xiKCwS234CMYXtOmLwEjLHeSVNtQ43h78zaQIhacgLNLBaz09Iz89mab6OuDP8lHcz8
 8K83RJ3qtVuNcvzZmx+DZqbeuampDFXF/U4ojkNHJu5VNLCSfKw4FvsFMjZZWuijmVtn
 wc3xrA9QZ34kq3YysiX3dN806pvZ0b2L0aJYf6Jh9ym6p33+qRHXVafDFTVZzDA88HVK
 la1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMwGAAPGdMhnkTOfB0jTA8QMpl2mDEy1rD2Rrr1X41c=;
 b=EY10VVDpQUDQrRsOFjbnj3O6lnLoZyJqy7F7QM/PaFOZ8UIhmZDtwSk3pKK/PmiieH
 pXDtE5xHQDGeoLIFhDK+dNkQTP6hiXvCUywX/i1rvgUjTLsgNgU83eolGE6za7YyMesc
 chSoSkit/rAapcXiPBTjBdBWMQxriP2hgJxt3YCKl5XfUKz4Jp38Bli72cO09XWASNxE
 UcIJ80a4ePoqU43YieS8sg7NhoZPiQ4Q/dIgaEIQsyu7QLIh/GMh7zmNbPlmlJQny6e1
 K4zu/92iTqhIitEZX+a1NNXojSOuY5m3Nhn9T4Q+iBRLgHmkbglsaZk0rtIJB+gDkd+O
 1jVg==
X-Gm-Message-State: AOAM533ftJooWwN/FY11XhWV3+qoLMDwRVQ51G4RW19yHix/ja1iEfsR
 e5FXjZHOUirKoJiC25AS5UqGV+PPUXcOAw==
X-Google-Smtp-Source: ABdhPJzThVZUNmUnVenc2kNQwzCpfUFNHnJ97ejA9dymcyYxxVTaEF4/l9lnCbEKXdMuhYo/queuXg==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr5617608wry.368.1613048345426; 
 Thu, 11 Feb 2021 04:59:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/45] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Thu, 11 Feb 2021 12:58:19 +0000
Message-Id: <20210211125900.22777-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rebecca Cran <rebecca@nuviainc.com>

Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
feature for ARMv8.4. Since virtual machine execution is largely
nondeterministic and TCG is outside of the security domain, it's
implemented as a NOP.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210208065700.19454-2-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 12 ++++++++++++
 target/arm/internals.h     |  6 ++++++
 target/arm/helper.c        | 22 ++++++++++++++++++++++
 target/arm/translate-a64.c | 12 ++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39633f73f36..f240275407b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1243,6 +1243,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IT_2_7 (0xfc00U)
 #define CPSR_GE (0xfU << 16)
 #define CPSR_IL (1U << 20)
+#define CPSR_DIT (1U << 21)
 #define CPSR_PAN (1U << 22)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
@@ -1310,6 +1311,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_DIT (1U << 24)
 #define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
@@ -3876,6 +3878,11 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
 }
 
+static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4125,6 +4132,11 @@ static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
 }
 
+static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 448982dd2f9..b251fe44506 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1228,6 +1228,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_aa32_pan(id)) {
         valid |= CPSR_PAN;
     }
+    if (isar_feature_aa32_dit(id)) {
+        valid |= CPSR_DIT;
+    }
 
     return valid;
 }
@@ -1246,6 +1249,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_uao(id)) {
         valid |= PSTATE_UAO;
     }
+    if (isar_feature_aa64_dit(id)) {
+        valid |= PSTATE_DIT;
+    }
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 51330a0c489..cf8e80419da 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4431,6 +4431,24 @@ static const ARMCPRegInfo uao_reginfo = {
     .readfn = aa64_uao_read, .writefn = aa64_uao_write
 };
 
+static uint64_t aa64_dit_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_DIT;
+}
+
+static void aa64_dit_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_DIT) | (value & PSTATE_DIT);
+}
+
+static const ARMCPRegInfo dit_reginfo = {
+    .name = "DIT", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 5,
+    .type = ARM_CP_NO_RAW, .access = PL0_RW,
+    .readfn = aa64_dit_read, .writefn = aa64_dit_write
+};
+
 static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
@@ -8224,6 +8242,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &uao_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_dit, cpu)) {
+        define_one_arm_cp_reg(cpu, &dit_reginfo);
+    }
+
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ffc060e5d70..1c4b8d02f3b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1700,6 +1700,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         tcg_temp_free_i32(t1);
         break;
 
+    case 0x1a: /* DIT */
+        if (!dc_isar_feature(aa64_dit, s)) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_DIT);
+        } else {
+            clear_pstate_bits(PSTATE_DIT);
+        }
+        /* There's no need to rebuild hflags because DIT is a nop */
+        break;
+
     case 0x1e: /* DAIFSet */
         t1 = tcg_const_i32(crm);
         gen_helper_msr_i_daifset(cpu_env, t1);
-- 
2.20.1


