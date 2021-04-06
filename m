Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3067D3553DF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:30:42 +0200 (CEST)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkqv-0007cT-53
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTknn-0005AI-G0
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTkn4-0005m2-Ed
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a6so8013880wrw.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i5k40QCHXlxXK63w0Kn7F7qeT5joQ7Ot8DB9AWKVM0o=;
 b=sW57oe37fUHhEjXp0sOyCeCXOK1CshonfPGbK0x3a9KFIdREmr7mP+uovGK1VTX45p
 EpuKBJxWEbxwabKqkhjofjKLrGtHAFe6zgkIC1A+cdiAooNKNQbQZEYzpXBE4jiTc7ul
 DNHfP4lkYuJf2yB9DlV4dFP4OkTJYUWPujUCft6eU0WKeMVHWSccEgjyLNZbdyd6OsyI
 eVGv7qbwpRZOzmBDwtqWwNue9Zbgj1/wwKVLjDvAkA6sPSMbPR9eVx0usOeSNMgkIjdb
 pd127X+EUwC0T9OJP2Chb3SSszeQrZlsiwKWUWXf1kY1ytu5ZRdCTOgPy3ZwUfvesLzf
 NpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5k40QCHXlxXK63w0Kn7F7qeT5joQ7Ot8DB9AWKVM0o=;
 b=pJKXhudyLN78LVgmAyxOLsmWnfRuppNJRLJ+5OSb91yzzoSyd3tEWSauIv43vQYad6
 MYObhjwp/CqF7UGoLwHOrBCgWJM9MkRezLQASwsZcHLhSr439RM4DI4R5vithCko7fPT
 5JnyZ7N1B5JTqDMdVIeX8J8zxozn3yvmdtsUvic7IAC5NKsbEJBYWN3dA5A8pfrNLVAW
 YT8/tSDG1BOYkovOvi6iAE/jmOPOWBFt1YNQN1gY99qrcQggeEwYx3/tYlfHny6GYWFb
 7p5AfIhV/8m69fHwSwJLv8lIyMoW/0JQRcwc/BAwz7h44Hi4QRaIG3BzJfwvp+WET8Hd
 CmSQ==
X-Gm-Message-State: AOAM532fZl466Y1RvDezGBbhrMu8KE2y1cIB+cpixE6HITqLkYVxsoFl
 XNQo/qkH5N/AL3xDjRPz5yW9R9xB3G+KIssd
X-Google-Smtp-Source: ABdhPJyieUiEC+aL4Vqq+Rs37VVrYmB7Enab6DH9fLAeNGrdEmHmvFJxBR/F2c7qgsj7IvAH9XNVGQ==
X-Received: by 2002:adf:c587:: with SMTP id m7mr34293002wrg.369.1617712000901; 
 Tue, 06 Apr 2021 05:26:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l6sm31160252wrt.56.2021.04.06.05.26.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:26:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] Revert "target/arm: Make number of counters in PMCR follow
 the CPU"
Date: Tue,  6 Apr 2021 13:26:34 +0100
Message-Id: <20210406122635.28268-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406122635.28268-1-peter.maydell@linaro.org>
References: <20210406122635.28268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

This reverts commit f7fb73b8cdd3f77e26f9fcff8cf24ff1b58d200f.

This change turned out to be a bit half-baked, and doesn't
work with KVM, which fails with the error:
   "qemu-system-aarch64: Failed to retrieve host CPU features"

because KVM does not allow accessing of the PMCR_EL0 value in
the scratch "query CPU ID registers" VM unless we have first
set the KVM_ARM_VCPU_PMU_V3 feature on the VM.

Revert the change for 6.0.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Zenghui Yu <yuzenghui@huawei.com>
Message-id: 20210331154822.23332-1-peter.maydell@linaro.org
---
 target/arm/cpu.h     |  1 -
 target/arm/cpu64.c   |  3 ---
 target/arm/cpu_tcg.c |  5 -----
 target/arm/helper.c  | 29 ++++++++++++-----------------
 target/arm/kvm64.c   |  2 --
 5 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fe68f464b3a..193a49ec7fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -942,7 +942,6 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
-        uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5d9d56a33c3..f0a9e968c9c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -141,7 +141,6 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    cpu->isar.reset_pmcr_el0 = 0x41013000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -195,7 +194,6 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    cpu->isar.reset_pmcr_el0 = 0x41033000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -247,7 +245,6 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    cpu->isar.reset_pmcr_el0 = 0x41023000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 8252fd29f90..046e476f65f 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -301,7 +301,6 @@ static void cortex_a8_initfn(Object *obj)
     cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
     cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
     cpu->reset_auxcr = 2;
-    cpu->isar.reset_pmcr_el0 = 0x41002000;
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
 }
 
@@ -374,7 +373,6 @@ static void cortex_a9_initfn(Object *obj)
     cpu->clidr = (1 << 27) | (1 << 24) | 3;
     cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
     cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
-    cpu->isar.reset_pmcr_el0 = 0x41093000;
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
 
@@ -445,7 +443,6 @@ static void cortex_a7_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    cpu->isar.reset_pmcr_el0 = 0x41072000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
 
@@ -488,7 +485,6 @@ static void cortex_a15_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    cpu->isar.reset_pmcr_el0 = 0x410F3000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
 
@@ -721,7 +717,6 @@ static void cortex_r5_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x0;
     cpu->mp_is_up = true;
     cpu->pmsav7_dregion = 16;
-    cpu->isar.reset_pmcr_el0 = 0x41151800;
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8fb6cc96e4d..d9220be7c5a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -38,6 +38,7 @@
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
+#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
@@ -1148,9 +1149,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
-    ARMCPU *cpu = env_archcpu(env);
-
-    return (cpu->isar.reset_pmcr_el0 & PMCRN_MASK) >> PMCRN_SHIFT;
+  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
 }
 
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
@@ -5754,6 +5753,13 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0,
       .writefn = gt_hyp_ctl_write, .raw_writefn = raw_write },
 #endif
+    /* The only field of MDCR_EL2 that has a defined architectural reset value
+     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
+     */
+    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .resetvalue = PMCR_NUM_COUNTERS,
+      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
@@ -6683,7 +6689,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn = pmu_num_counters(&cpu->env);
+    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
     ARMCPRegInfo pmcr = {
         .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
         .access = PL0_RW,
@@ -6698,10 +6704,10 @@ static void define_pmu_regs(ARMCPU *cpu)
         .access = PL0_RW, .accessfn = pmreg_access,
         .type = ARM_CP_IO,
         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-        .resetvalue = cpu->isar.reset_pmcr_el0,
+        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT) |
+                      PMCRLC,
         .writefn = pmcr_write, .raw_writefn = raw_write,
     };
-
     define_one_arm_cp_reg(cpu, &pmcr);
     define_one_arm_cp_reg(cpu, &pmcr64);
     for (i = 0; i < pmcrn; i++) {
@@ -7819,17 +7825,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
             REGINFO_SENTINEL
         };
-        /*
-         * The only field of MDCR_EL2 that has a defined architectural reset
-         * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
-         */
-        ARMCPRegInfo mdcr_el2 = {
-            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
-            .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-            .access = PL2_RW, .resetvalue = pmu_num_counters(env),
-            .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
-        };
-        define_one_arm_cp_reg(cpu, &mdcr_el2);
         define_arm_cp_regs(cpu, vpidr_regs);
         define_arm_cp_regs(cpu, el2_cp_reginfo);
         if (arm_feature(env, ARM_FEATURE_V8)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 581335e49d3..dff85f6db94 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -566,8 +566,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 7, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
-                              ARM64_SYS_REG(3, 3, 9, 12, 0));
 
         /*
          * Note that if AArch32 support is not present in the host,
-- 
2.20.1


