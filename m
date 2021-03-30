Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7B34E913
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:27:53 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREPQ-0008Uo-0Y
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENg-0006ph-S1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENd-0003cm-Qe
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:04 -0400
Received: by mail-wr1-x430.google.com with SMTP id k8so16246163wrc.3
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mh5IX36T8uCqjf6qPRZrX1y8fSZELaua3vUHNVdcG+8=;
 b=fA4juvb46bAG0YegzPVTu0bTo1AfA/HDXT6fs2Mm16if14/vZMALR2KE0k/ZnYcOYl
 alk4h3qVeJe01+FpYQ81QQNwqfqjTkSS5Lal6orgfphHhPaX1pCS1ngq6cH9FoCLpnTh
 2bs485qxZUULXcpWFWnDXP90kyJfCmQYvfK5Tl86mDB9fa+iy2Bj+RTSIXvmrcVmWP3O
 Ni3cCoXkV6+4N13qNnBILvAXP6vyDKyxNcWvvUhMBkI7IlK3ObyKwO2tapEQp3lvGY83
 Yefwe/mT4Wodr86VMm0RFtLEkPeKXojdna3BqGX8z9cnZTk92k5yZZAJ8AdtYZdhr4GI
 j8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mh5IX36T8uCqjf6qPRZrX1y8fSZELaua3vUHNVdcG+8=;
 b=FOWEbZJIBIOnc2NinxNc/69Wy8BIBu/bMhxRykcm0EWnlU5VHFNOSd55KnR8s2BPo0
 sp1GO+KV9juZ2+ajZOULybNiG1KZ84a06FVrj7yTm9IWos4j9DXGPw/BRzgeI6Gzvqn7
 n6xGeltE7T0ZGgCipxgYm+55zZroaM2hB3OV5flQHU4oiDrDNxEeUCHjQOvusixCFtvk
 iHp0yz8coOc2psd9U0JTuswKrqq7/YcYwkrmHt4jSkzf1lFRK+la3EtlagIcVjS7IgwX
 zqxrZ9zI/Ggq95uVqKnyuVg6us51fwLGUw2oW3BfLcz4tkF0IfEEUyo6nS2Kr4ejTUPB
 FNyg==
X-Gm-Message-State: AOAM532ef1S1ULe9FlXBl5WxnsjBGeyKMSGGa4Av95+9DxKbCUILPvvo
 DGX37uNWUciS+Wqm1jNzK034dWugwA3PMQxh
X-Google-Smtp-Source: ABdhPJwD1q7xxc+JTgRgLjyupfXixxoE4/eyW7aFgxCrrE98GgUVSG14kx4RJq539TbMnykV3zmKkw==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr33918391wru.155.1617110759899; 
 Tue, 30 Mar 2021 06:25:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm33140892wrs.68.2021.03.30.06.25.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:25:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] target/arm: Make number of counters in PMCR follow the CPU
Date: Tue, 30 Mar 2021 14:25:54 +0100
Message-Id: <20210330132555.8144-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330132555.8144-1-peter.maydell@linaro.org>
References: <20210330132555.8144-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
means that we don't provide the 6 counters that are required by the
Arm BSA (Base System Architecture) specification if the CPU supports
the Virtualization extensions.

Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
specify the PMCR reset value (obtained from the appropriate TRM), and
use the 'N' field of that value to define the number of counters
provided.

This means that we now supply 6 counters for Cortex-A53, A57, A72,
A15 and A9 as well as '-cpu max'; Cortex-A7 and A8 stay at 4; and
Cortex-R5 goes down to 3.

Note that because we now use the PMCR reset value of the specific
implementation, we no longer set the LC bit out of reset.  This has
an UNKNOWN value out of reset for all cores with any AArch32 support,
so guest software should be setting it anyway if it wants it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-id: 20210311165947.27470-1-peter.maydell@linaro.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  1 +
 target/arm/cpu64.c   |  3 +++
 target/arm/cpu_tcg.c |  5 +++++
 target/arm/helper.c  | 29 +++++++++++++++++------------
 target/arm/kvm64.c   |  2 ++
 5 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7fa..fe68f464b3a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -942,6 +942,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c..5d9d56a33c3 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -141,6 +141,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->isar.reset_pmcr_el0 = 0x41013000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -194,6 +195,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->isar.reset_pmcr_el0 = 0x41033000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -245,6 +247,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->isar.reset_pmcr_el0 = 0x41023000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 046e476f65f..8252fd29f90 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -301,6 +301,7 @@ static void cortex_a8_initfn(Object *obj)
     cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
     cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
     cpu->reset_auxcr = 2;
+    cpu->isar.reset_pmcr_el0 = 0x41002000;
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
 }
 
@@ -373,6 +374,7 @@ static void cortex_a9_initfn(Object *obj)
     cpu->clidr = (1 << 27) | (1 << 24) | 3;
     cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
     cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
+    cpu->isar.reset_pmcr_el0 = 0x41093000;
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
 
@@ -443,6 +445,7 @@ static void cortex_a7_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    cpu->isar.reset_pmcr_el0 = 0x41072000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
 
@@ -485,6 +488,7 @@ static void cortex_a15_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    cpu->isar.reset_pmcr_el0 = 0x410F3000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
 
@@ -717,6 +721,7 @@ static void cortex_r5_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x0;
     cpu->mp_is_up = true;
     cpu->pmsav7_dregion = 16;
+    cpu->isar.reset_pmcr_el0 = 0x41151800;
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9220be7c5a..8fb6cc96e4d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -38,7 +38,6 @@
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
-#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
@@ -1149,7 +1148,9 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
-  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
+    ARMCPU *cpu = env_archcpu(env);
+
+    return (cpu->isar.reset_pmcr_el0 & PMCRN_MASK) >> PMCRN_SHIFT;
 }
 
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
@@ -5753,13 +5754,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0,
       .writefn = gt_hyp_ctl_write, .raw_writefn = raw_write },
 #endif
-    /* The only field of MDCR_EL2 that has a defined architectural reset value
-     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
-     */
-    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .resetvalue = PMCR_NUM_COUNTERS,
-      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
@@ -6689,7 +6683,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
+    unsigned int i, pmcrn = pmu_num_counters(&cpu->env);
     ARMCPRegInfo pmcr = {
         .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
         .access = PL0_RW,
@@ -6704,10 +6698,10 @@ static void define_pmu_regs(ARMCPU *cpu)
         .access = PL0_RW, .accessfn = pmreg_access,
         .type = ARM_CP_IO,
         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT) |
-                      PMCRLC,
+        .resetvalue = cpu->isar.reset_pmcr_el0,
         .writefn = pmcr_write, .raw_writefn = raw_write,
     };
+
     define_one_arm_cp_reg(cpu, &pmcr);
     define_one_arm_cp_reg(cpu, &pmcr64);
     for (i = 0; i < pmcrn; i++) {
@@ -7825,6 +7819,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
             REGINFO_SENTINEL
         };
+        /*
+         * The only field of MDCR_EL2 that has a defined architectural reset
+         * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
+         */
+        ARMCPRegInfo mdcr_el2 = {
+            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
+            .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+            .access = PL2_RW, .resetvalue = pmu_num_counters(env),
+            .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
+        };
+        define_one_arm_cp_reg(cpu, &mdcr_el2);
         define_arm_cp_regs(cpu, vpidr_regs);
         define_arm_cp_regs(cpu, el2_cp_reginfo);
         if (arm_feature(env, ARM_FEATURE_V8)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db94..581335e49d3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -566,6 +566,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 7, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+                              ARM64_SYS_REG(3, 3, 9, 12, 0));
 
         /*
          * Note that if AArch32 support is not present in the host,
-- 
2.20.1


