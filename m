Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F552626E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:57:26 +0200 (CEST)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUrE-0001X8-U5
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npUPj-0002xr-QH
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:28:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npUPh-0007FG-C5
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:28:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id m1so11235001wrb.8
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1kKWRPyosZzxUQpTKn2jLsYUPttFkFEjxD++j7lh8g=;
 b=vlDlUrGiX1AwcKlakT8rtOPdQzZEWuzjYDKL/OI71p/fyLI+D26WWa+s1bmUBrgGXG
 RF6eDg08HYC0vgp5lzJ9o1k8+bFJilYFdpTU/kgJhvij/U9byuwg9ZLb/z4+VvL8i6ES
 b5iDIEE+6BRa30dsZ1XVVOMiEo9bsDtbaMRvikY+gsJop5EMz3dDFP9IbOb8dpyZXZQm
 BhoUQ8lUUpLIxuGxmyrb7qcuEfRTVXS1mBRWG6k9hnE9Y4ckLjOgMBD8AELpdJGARGny
 ZG/dIxfV/QaKxQNjAYJ83gZthw7eEo7L9T1LcKOj/mJRU1izZy+U1xlAcZ2AMt62Glar
 0G0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1kKWRPyosZzxUQpTKn2jLsYUPttFkFEjxD++j7lh8g=;
 b=2dUBNDoMUPxHYjS9b/MJq1xIdQQ1KpkOn0eLoDEfl541TEjwVg8bu0KfF7DGnorgrh
 z0/Di+L4YQukH6NIRH0+lQPgxxKiuhbG6J6x4atwNjSas43R1oywCDszQr8NjFTJse74
 wscanjWiY76ePwyn7BWxDyHwGYBkX8ewRhn3XPljCpD00ylrT9hsiadOlKoR6HjpVI2R
 P3HkE6V3x8ePpIDxNHUveX19w7OfnyKdsr456xRj67Qk0yY0cW2ND2Gh4oEwloIbtItp
 VhOzE1zAVfSGg62gBh+ifePnmHGMyuAlMdJSLA0s4AQc1kNPbXqT4/E1genG7wMk9PaD
 niTw==
X-Gm-Message-State: AOAM530+6mCOestGsEM+AgT05Gkf//BFnGZY+lmnsRirfMx14vY2W55r
 crMU3x5cWWYXU3wYJpe/oFszvQ==
X-Google-Smtp-Source: ABdhPJx79h6fDdBK5hUgc6FW4IjMAiR+jkvYh3vNCTh78+kKxCqjsYB9kN8f+LqWF9oaYOTFK8YgJg==
X-Received: by 2002:adf:b35b:0:b0:20a:dd58:ef60 with SMTP id
 k27-20020adfb35b000000b0020add58ef60mr3872219wrd.647.1652444935384; 
 Fri, 13 May 2022 05:28:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adfa74f000000b0020c5253d8e5sm1998822wrd.49.2022.05.13.05.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 05:28:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@gmail.com>
Subject: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
Date: Fri, 13 May 2022 13:28:52 +0100
Message-Id: <20220513122852.4063586-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
means that we don't provide the 6 counters that are required by the
Arm BSA (Base System Architecture) specification if the CPU supports
the Virtualization extensions.

Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
specify the PMCR reset value (obtained from the appropriate TRM), and
use the 'N' field of that value to define the number of counters
provided.

This means that we now supply 6 counters instead of 4 for:
 Cortex-A9, Cortex-A15, Cortex-A53, Cortex-A57, Cortex-A72,
 Cortex-A76, Neoverse-N1, '-cpu max'
These CPUs remain with 4 counters:
 Cortex-A7, Cortex-A8
This CPU goes down from 4 to 3 counters:
 Cortex-R5

TODO: A64FX -- I don't know the correct PMCR_EL0 reset value.

Note that because we now use the PMCR reset value of the specific
implementation, we no longer set the LC bit out of reset.  This has
an UNKNOWN value out of reset for all cores with any AArch32 support,
so guest software should be setting it anyway if it wants it.

This change was originally landed in commit f7fb73b8cdd3f7 (during
the 6.0 release cycle) but was then reverted by commit
21c2dd77a6aa517 before that release because it did not work with KVM.
This version fixes that by creating the scratch vCPU in
kvm_arm_get_host_cpu_features() with the KVM_ARM_VCPU_PMU_V3 feature
if KVM supports it, and then only asking KVM for the PMCR_EL0 value
if the vCPU has a PMU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'd forgotten that we'd dropped this fix in the 6.0 timeframe
and never picked it back up again until Alex reminded me of it...

Changes since original attempt:
 -- rebased
 -- fix the code in kvm_arm_get_host_cpu_features() that reads PMCR_EL0
 -- set PMCR value for new CPUs cortex-a76, neoverse-n1
 -- set PMCR value for now-separated-out aarch32 -cpu max
 -- TODO comment for a64fx

Shuuichirou, Itaru: this is another patch where we need to know
an A64FX register value...
---
 target/arm/cpu.h       |  1 +
 target/arm/internals.h |  4 +++-
 target/arm/cpu64.c     | 10 ++++++++++
 target/arm/cpu_tcg.c   |  6 ++++++
 target/arm/helper.c    | 25 ++++++++++++++-----------
 target/arm/kvm64.c     | 12 ++++++++++++
 6 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 18ca61e8e25..0551be62e88 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -965,6 +965,7 @@ struct ArchCPU {
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
         uint64_t id_aa64zfr0;
+        uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6ca0e957468..b3b7737048b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1299,7 +1299,9 @@ enum MVEECIState {
 
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
-  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
+    ARMCPU *cpu = env_archcpu(env);
+
+    return (cpu->isar.reset_pmcr_el0 & PMCRN_MASK) >> PMCRN_SHIFT;
 }
 
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 04427e073f1..6008efcbbf0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -79,6 +79,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
@@ -132,6 +133,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41033000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
@@ -183,6 +185,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41023000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
@@ -257,6 +260,9 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x13211111;
     cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410b3000;
 }
 
 static void aarch64_neoverse_n1_initfn(Object *obj)
@@ -322,6 +328,9 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x13211111;
     cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410c3000;
 }
 
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
@@ -1005,6 +1014,7 @@ static void aarch64_a64fx_initfn(Object *obj)
     set_bit(3, cpu->sve_vq_supported); /* 512bit */
 
     /* TODO:  Add A64FX specific HPC extension registers */
+// FIXME reset_pmcr_el0
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ea4eccddc35..b751a19c8a7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -425,6 +425,7 @@ static void cortex_a8_initfn(Object *obj)
     cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
     cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
     cpu->reset_auxcr = 2;
+    cpu->isar.reset_pmcr_el0 = 0x41002000;
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
 }
 
@@ -496,6 +497,7 @@ static void cortex_a9_initfn(Object *obj)
     cpu->clidr = (1 << 27) | (1 << 24) | 3;
     cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
     cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
+    cpu->isar.reset_pmcr_el0 = 0x41093000;
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
 
@@ -565,6 +567,7 @@ static void cortex_a7_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    cpu->isar.reset_pmcr_el0 = 0x41072000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
 
@@ -607,6 +610,7 @@ static void cortex_a15_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    cpu->isar.reset_pmcr_el0 = 0x410F3000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
 
@@ -835,6 +839,7 @@ static void cortex_r5_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x0;
     cpu->mp_is_up = true;
     cpu->pmsav7_dregion = 16;
+    cpu->isar.reset_pmcr_el0 = 0x41151800;
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
@@ -1093,6 +1098,7 @@ static void arm_max_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 432bd819195..439220e4574 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -39,7 +39,6 @@
 #include "cpregs.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
-#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
@@ -5533,13 +5532,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
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
@@ -6586,7 +6578,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
+    unsigned int i, pmcrn = pmu_num_counters(&cpu->env);
     ARMCPRegInfo pmcr = {
         .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
         .access = PL0_RW,
@@ -6601,10 +6593,10 @@ static void define_pmu_regs(ARMCPU *cpu)
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
@@ -7961,6 +7953,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
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
index b8cfaf5782a..363032da903 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -505,6 +505,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool pmu_supported = false;
     uint64_t features = 0;
     uint64_t t;
     int err;
@@ -537,6 +538,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                              1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
 
+    if (kvm_arm_pmu_supported()) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
+        pmu_supported = true;
+    }
+
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
     }
@@ -659,6 +665,12 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             dbgdidr |= (1 << 15); /* RES1 bit */
             ahcf->isar.dbgdidr = dbgdidr;
         }
+
+        if (pmu_supported) {
+            /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
+        }
     }
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
-- 
2.25.1


