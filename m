Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E6337A74
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:07:11 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOmD-00080B-Si
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOfB-0003vI-Ip
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:59:53 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOf9-0001EP-Bq
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:59:53 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso13723363wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0zImBtoun0eeL/svOPB9aOBwXK5I7jGOfv+NPuDNrM=;
 b=JNJbNh9Bq2mhKFiOUkc+PD1JZB79bBdNaQQhfyK93vn2BOj0JfcPkgnqApR5SekDYA
 7b1rHKnKZxgBMZcYyzyykWinxJlvbWJscxhP1mLupdjzInmx4UiYQBXjAJkk3A8d5sKv
 l/TCv+aNnhfALSmjei3EW/bC3/2fA2u7NatDcg2BzCobF/0ot4kR5nlFMNzq03q+e1Rs
 7y9yGvNVzgXTeHjAtq1ZqfCAm38D7F2STFVH0dl0LwrWvIg9MHteGn2GoHvEHbKU9SD/
 pIt2YVpRomFYTm5Y5oL/PwSwYkDQZ7UNdf878gsV2yuM7qvKxs2gy2FEKOZoJ4oUCjGg
 2Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0zImBtoun0eeL/svOPB9aOBwXK5I7jGOfv+NPuDNrM=;
 b=PtnZTK8ic8RKeW4JL/VeHyK/hQ8zYSVLaNLPO9yHsAhtef1FCCVOQE+cERgfhPIfCQ
 /bxs8qO4DSsU1HNzzceIh+qDMOUNaFj9dyoHy3go9/fIWEv3/5+0DSb15StoBN8xSTFj
 +c6nDUYxILwnqGOUo/v7We4TCT3RnQS7dn+hmpuR+lPM1pOWV8jtl68SIyVa+PhYyHBM
 qd9vzm3ZwY6DCkj53Q0CXQXMmpNzVg4QtDJyp7GCI2h+WvhlP5/tE72qWsruh9yvKOjL
 4VRN7fgkwLkcYmDxYrrlpFJVLyD45aTNGDyC5eeMfPB6Y8K6bxQo8ArN2Qs2xMVn+cly
 a4WA==
X-Gm-Message-State: AOAM531Jd7eWOgrrbIfwjQTA1Dxx8aLs3XP8Ph2TWPKEwujYLEukvakN
 NHjm8T2qvP5g0YrWY1nLs7eG+w==
X-Google-Smtp-Source: ABdhPJyPkpWLLtVAbaZzU3HepBREqbNv9RmUb8PjOj4WVmDlKO695ZW4HKVEMmJ+me4GlMB42ftEGg==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr9302806wmd.130.1615481989625; 
 Thu, 11 Mar 2021 08:59:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q19sm4190551wmc.44.2021.03.11.08.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:59:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
Date: Thu, 11 Mar 2021 16:59:47 +0000
Message-Id: <20210311165947.27470-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>
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
---
This is pretty much untested (I just checked Linux still boots;
haven't tried it with KVM either). It's an alternative to
just bumping PMCR_NUM_COUNTERS to 6.
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
index 904b0927cd2..2f3867cad79 100644
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


