Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30DB32F18C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:41:47 +0100 (CET)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIESQ-0003SN-Nv
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE31-0006Ym-DB
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:31 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2r-0007Qi-MK
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:31 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1102946wmq.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Db3d7nAufRAs4l4xOPtDlZGxaKJsBcoSMwlWaXx/xCU=;
 b=LGrMCdzqSdLZW0ZcwklW0O0YI3FspUeDy25OzCZR1i//A06XZ5hMn++khUXWwTyx5U
 uEneEyzA83i6RDbMYqNgvrp7n9LGxLaMOwl6eYECkrQlmoOqcaX3SFDBuviK8mAtToiq
 hJ8rEZRNXFqScQSczA0leYtz+vSrV0U4Np99gxFK4tgDiUv07jOIZ6HAApYGi+oJFUSe
 2TOXGa01iJqycgt8KU/3mTlYK+11VH+s+/fyQU7ZY7GFGlLjvuUFPs7EAxUygE6jk/u6
 4mKkWmhYtO0HLEWZD9iHq8EDKmd6DWpzIQRiew+QUubvzWBQq6ZW798p707K86lCGcdx
 H49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Db3d7nAufRAs4l4xOPtDlZGxaKJsBcoSMwlWaXx/xCU=;
 b=bCMkcmYdxZ2bNKPQGvWeWq+qxOHRbZnMSJXmlHRlAYOKUn8Ju4G28AzCdvO1NrR+ex
 jXhG7SkBA0PjyiG2MvsdhlOGnZPmoa5CTD+H/KfG4TNSEEpeggk3JTESfqGE6QzWJSR3
 79eYS71fTg0MAAIVG0MBwWSGI/xpLvezHlJKK3dwpVcyF5qTpcXoBaNM5ACUsKTb+czM
 alyZzM2xIoCXq9zk8qt7nEYH9ccinD3QtoPPyp42fXeSbrbf0Ys6uuXC/YoSn2NIjApO
 V77hetgPTk+DB91/wEAaxs0qE5QcRTV2v+dWbe2AN8tFVRncKp07tJN5b7Jm00MBaVtm
 ZWLw==
X-Gm-Message-State: AOAM532yGXcIFNRidTkB4WxF+KbNWSx1wyWt4g5y7b3wiuACu27GQMiP
 5a3C2+ZhuXBIqgiP8cyNL3aovPNrDHq2Vg==
X-Google-Smtp-Source: ABdhPJxT/3ObasyHtIDUR7mfRdm5vSBwz2Tpyaprz1H7u8yX/79wuboV93+IPHmjIfUMeetPGc+2lg==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr9822471wmc.103.1614964519462; 
 Fri, 05 Mar 2021 09:15:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/49] target/arm: Add support for FEAT_SSBS,
 Speculative Store Bypass Safe
Date: Fri,  5 Mar 2021 17:14:29 +0000
Message-Id: <20210305171515.1038-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Add support for FEAT_SSBS. SSBS (Speculative Store Bypass Safe) is an
optional feature in ARMv8.0, and mandatory in ARMv8.5.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210216224543.16142-2-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 15 ++++++++++++++-
 target/arm/internals.h     |  6 ++++++
 target/arm/helper.c        | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 12 ++++++++++++
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index efa1618c4d5..193a49ec7fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1206,6 +1206,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_TE      (1U << 30) /* AArch32 only */
 #define SCTLR_EnIB    (1U << 30) /* v8.3, AArch64 only */
 #define SCTLR_EnIA    (1U << 31) /* v8.3, AArch64 only */
+#define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
 #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
 #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
 #define SCTLR_ITFSB   (1ULL << 37) /* v8.5-MemTag */
@@ -1213,7 +1214,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_TCF     (3ULL << 40) /* v8.5-MemTag */
 #define SCTLR_ATA0    (1ULL << 42) /* v8.5-MemTag */
 #define SCTLR_ATA     (1ULL << 43) /* v8.5-MemTag */
-#define SCTLR_DSSBS   (1ULL << 44) /* v8.5 */
+#define SCTLR_DSSBS_64 (1ULL << 44) /* v8.5, AArch64 only */
 
 #define CPTR_TCPAC    (1U << 31)
 #define CPTR_TTA      (1U << 20)
@@ -1250,6 +1251,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IL (1U << 20)
 #define CPSR_DIT (1U << 21)
 #define CPSR_PAN (1U << 22)
+#define CPSR_SSBS (1U << 23)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
 #define CPSR_Q (1U << 27)
@@ -1312,6 +1314,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_A (1U << 8)
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
+#define PSTATE_SSBS (1U << 12)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
@@ -3915,6 +3918,11 @@ static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4169,6 +4177,11 @@ static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 05cebc8597c..f11bd326962 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -987,6 +987,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_aa32_dit(id)) {
         valid |= CPSR_DIT;
     }
+    if (isar_feature_aa32_ssbs(id)) {
+        valid |= CPSR_SSBS;
+    }
 
     return valid;
 }
@@ -1008,6 +1011,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_dit(id)) {
         valid |= PSTATE_DIT;
     }
+    if (isar_feature_aa64_ssbs(id)) {
+        valid |= PSTATE_SSBS;
+    }
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b94211..fedcf2e739e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4450,6 +4450,24 @@ static const ARMCPRegInfo dit_reginfo = {
     .readfn = aa64_dit_read, .writefn = aa64_dit_write
 };
 
+static uint64_t aa64_ssbs_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_SSBS;
+}
+
+static void aa64_ssbs_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_SSBS) | (value & PSTATE_SSBS);
+}
+
+static const ARMCPRegInfo ssbs_reginfo = {
+    .name = "SSBS", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 6,
+    .type = ARM_CP_NO_RAW, .access = PL0_RW,
+    .readfn = aa64_ssbs_read, .writefn = aa64_ssbs_write
+};
+
 static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
@@ -8244,6 +8262,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_dit, cpu)) {
         define_one_arm_cp_reg(cpu, &dit_reginfo);
     }
+    if (cpu_isar_feature(aa64_ssbs, cpu)) {
+        define_one_arm_cp_reg(cpu, &ssbs_reginfo);
+    }
 
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
@@ -9463,6 +9484,14 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     env->uncached_cpsr &= ~(CPSR_IL | CPSR_J);
     env->daif |= mask;
 
+    if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
+        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_32) {
+            env->uncached_cpsr |= CPSR_SSBS;
+        } else {
+            env->uncached_cpsr &= ~CPSR_SSBS;
+        }
+    }
+
     if (new_mode == ARM_CPU_MODE_HYP) {
         env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
         env->elr_el[2] = env->regs[15];
@@ -9973,6 +10002,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         new_mode |= PSTATE_TCO;
     }
 
+    if (cpu_isar_feature(aa64_ssbs, cpu)) {
+        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_64) {
+            new_mode |= PSTATE_SSBS;
+        } else {
+            new_mode &= ~PSTATE_SSBS;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b23a8975d54..3aebdb4af9e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1703,6 +1703,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         tcg_temp_free_i32(t1);
         break;
 
+    case 0x19: /* SSBS */
+        if (!dc_isar_feature(aa64_ssbs, s)) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_SSBS);
+        } else {
+            clear_pstate_bits(PSTATE_SSBS);
+        }
+        /* Don't need to rebuild hflags since SSBS is a nop */
+        break;
+
     case 0x1a: /* DIT */
         if (!dc_isar_feature(aa64_dit, s)) {
             goto do_unallocated;
-- 
2.20.1


