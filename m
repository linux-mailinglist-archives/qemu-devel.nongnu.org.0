Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC6346550
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:36:13 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk0p-0005k7-VG
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjGY-0007aj-9Z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:54992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFw-00012H-HV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:48:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F269DAF9C;
 Tue, 23 Mar 2021 15:47:07 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 53/55] XXX target/arm: experiment refactoring cpu "max"
Date: Tue, 23 Mar 2021 16:46:37 +0100
Message-Id: <20210323154639.23477-46-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

XXX Someone who really understands which properties should be added
where should review this attentively.

What goes into cpu leaf class initialization?
What goes into arm_post_init / accel_cpu?
What goes into arm_cpu_finalize_features / aarch64_cpu_finalize_features?

Should there be shift of more code into finalize_features?

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.h                |   3 +
 target/arm/cpu64.c              | 167 ++---------------------
 target/arm/kvm/kvm-cpu.c        |   4 +-
 target/arm/tcg/tcg-cpu-models.c |  62 +--------
 target/arm/tcg/tcg-cpu.c        | 228 +++++++++++++++++++++++++++++++-
 5 files changed, 242 insertions(+), 222 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 99c03fd6b4..f3443ecb42 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -997,6 +997,9 @@ struct ARMCPU {
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
+
+    /* MAX features requested via cpu="max" */
+    bool max_features;
 };
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d67c0b1be4..bf2bd84ee7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -247,169 +247,30 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
-/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
- * otherwise, a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
- * this only needs to handle 64 bits.
+/*
+ * -cpu max: if KVM is enabled, like -cpu host (best possible with this host),
+ *           plus some "max"-only properties, see f.e. cpu_sve_add_props_max().
+ *
+ *           if TCG is enabled, a CPU with as many features enabled as our
+ *           emulation supports.
+ *
+ *           The version of '-cpu max' for qemu-system-arm is defined in
+ *           tcg/tcg-cpu-models.c, while this version only handles 64bit.
  */
 static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-    if (kvm_enabled()) {
-        kvm_arm_set_cpu_features_from_host(cpu);
-    }
     if (tcg_enabled()) {
-        uint64_t t;
-        uint32_t u;
         aarch64_a57_initfn(obj);
-
-        /*
-         * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
-         * one and try to apply errata workarounds or use impdef features we
-         * don't provide.
-         * An IMPLEMENTER field of 0 means "reserved for software use";
-         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
-         * to see which features are present";
-         * the VARIANT, PARTNUM and REVISION fields are all implementation
-         * defined and we choose to define PARTNUM just in case guest
-         * code needs to distinguish this QEMU CPU from other software
-         * implementations, though this shouldn't be needed.
-         */
-        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
-        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
-        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
-        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
-        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-        cpu->midr = t;
-
-        t = cpu->isar.id_aa64isar0;
-        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
-        t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
-        t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
-        t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
-        cpu->isar.id_aa64isar0 = t;
-
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
-        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
-        cpu->isar.id_aa64isar1 = t;
-
-        t = cpu->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
-        cpu->isar.id_aa64pfr0 = t;
-
-        t = cpu->isar.id_aa64pfr1;
-        t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
-        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
-        /*
-         * Begin with full support for MTE. This will be downgraded to MTE=0
-         * during realize if the board provides no tag memory, much like
-         * we do for EL2 with the virtualization=on property.
-         */
-        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
-        cpu->isar.id_aa64pfr1 = t;
-
-        t = cpu->isar.id_aa64mmfr0;
-        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
-        cpu->isar.id_aa64mmfr0 = t;
-
-        t = cpu->isar.id_aa64mmfr1;
-        t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
-        t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
-        t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
-        t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_aa64mmfr1 = t;
-
-        t = cpu->isar.id_aa64mmfr2;
-        t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
-        t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
-        cpu->isar.id_aa64mmfr2 = t;
-
-        /* Replicate the same data to the 32-bit id registers.  */
-        u = cpu->isar.id_isar5;
-        u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-        u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
-        u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
-        u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
-        u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
-        u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = u;
-
-        u = cpu->isar.id_isar6;
-        u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
-        u = FIELD_DP32(u, ID_ISAR6, DP, 1);
-        u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
-        u = FIELD_DP32(u, ID_ISAR6, SB, 1);
-        u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
-        cpu->isar.id_isar6 = u;
-
-        u = cpu->isar.id_pfr0;
-        u = FIELD_DP32(u, ID_PFR0, DIT, 1);
-        cpu->isar.id_pfr0 = u;
-
-        u = cpu->isar.id_pfr2;
-        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
-        cpu->isar.id_pfr2 = u;
-
-        u = cpu->isar.id_mmfr3;
-        u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = u;
-
-        u = cpu->isar.id_mmfr4;
-        u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
-        u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = u;
-
-        t = cpu->isar.id_aa64dfr0;
-        t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
-        cpu->isar.id_aa64dfr0 = t;
-
-        u = cpu->isar.id_dfr0;
-        u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-        cpu->isar.id_dfr0 = u;
-
-        u = cpu->isar.mvfr1;
-        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
-        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
-        cpu->isar.mvfr1 = u;
-
-#ifdef CONFIG_USER_ONLY
-        /* For usermode -cpu max we can use a larger and more efficient DCZ
-         * blocksize since we don't have to follow what the hardware does.
-         */
-        cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-        cpu->dcz_blocksize = 7; /*  512 bytes */
-#endif
-
-        cpu_pauth_add_props(obj);
     }
-
+    if (kvm_enabled()) {
+        kvm_arm_set_cpu_features_from_host(cpu);
+    }
     cpu_sve_add_props(obj);
     cpu_sve_add_props_max(obj);
+
+    cpu->max_features = true;
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index 1ec31c03dd..020ef311c9 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -87,9 +87,7 @@ static void host_cpu_instance_init(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        cpu_sve_add_props(obj);
-    }
+    cpu_sve_add_props(obj);
     arm_cpu_post_init(obj);
 }
 
diff --git a/target/arm/tcg/tcg-cpu-models.c b/target/arm/tcg/tcg-cpu-models.c
index 5f3a2adc97..bbb8efa835 100644
--- a/target/arm/tcg/tcg-cpu-models.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -870,67 +870,7 @@ static void arm_max_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     cortex_a15_initfn(obj);
-
-    /* old-style VFP short-vector support */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-
-#ifdef CONFIG_USER_ONLY
-    /*
-     * We don't set these in system emulation mode for the moment,
-     * since we don't correctly set (all of) the ID registers to
-     * advertise them.
-     */
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    {
-        uint32_t t;
-
-        t = cpu->isar.id_isar5;
-        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = t;
-
-        t = cpu->isar.id_isar6;
-        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-        cpu->isar.id_isar6 = t;
-
-        t = cpu->isar.mvfr1;
-        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-        cpu->isar.mvfr1 = t;
-
-        t = cpu->isar.mvfr2;
-        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-        cpu->isar.mvfr2 = t;
-
-        t = cpu->isar.id_mmfr3;
-        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = t;
-
-        t = cpu->isar.id_mmfr4;
-        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = t;
-
-        t = cpu->isar.id_pfr0;
-        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
-        cpu->isar.id_pfr0 = t;
-
-        t = cpu->isar.id_pfr2;
-        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
-        cpu->isar.id_pfr2 = t;
-    }
-#endif /* CONFIG_USER_ONLY */
+    cpu->max_features = true;
 }
 #endif /* !TARGET_AARCH64 */
 
diff --git a/target/arm/tcg/tcg-cpu.c b/target/arm/tcg/tcg-cpu.c
index db677bc71c..ee634836e4 100644
--- a/target/arm/tcg/tcg-cpu.c
+++ b/target/arm/tcg/tcg-cpu.c
@@ -228,16 +228,234 @@ static struct TCGCPUOps arm_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
+#ifdef TARGET_AARCH64
+static void tcg_cpu_max_instance_init(CPUState *cs)
+{
+    uint64_t t;
+    uint32_t u;
+    Object *obj = OBJECT(cs);
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /*
+     * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
+     * one and try to apply errata workarounds or use impdef features we
+     * don't provide.
+     * An IMPLEMENTER field of 0 means "reserved for software use";
+     * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
+     * to see which features are present";
+     * the VARIANT, PARTNUM and REVISION fields are all implementation
+     * defined and we choose to define PARTNUM just in case guest
+     * code needs to distinguish this QEMU CPU from other software
+     * implementations, though this shouldn't be needed.
+     */
+    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
+    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
+    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
+    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+    cpu->midr = t;
+
+    t = cpu->isar.id_aa64isar0;
+    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
+    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
+    cpu->isar.id_aa64isar0 = t;
+
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
+    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+    cpu->isar.id_aa64isar1 = t;
+
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
+    cpu->isar.id_aa64pfr0 = t;
+
+    t = cpu->isar.id_aa64pfr1;
+    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
+    /*
+     * Begin with full support for MTE. This will be downgraded to MTE=0
+     * during realize if the board provides no tag memory, much like
+     * we do for EL2 with the virtualization=on property.
+     */
+    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
+    cpu->isar.id_aa64pfr1 = t;
+
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+    cpu->isar.id_aa64mmfr0 = t;
+
+    t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
+    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_aa64mmfr1 = t;
+
+    t = cpu->isar.id_aa64mmfr2;
+    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
+    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+    cpu->isar.id_aa64mmfr2 = t;
+
+    /* Replicate the same data to the 32-bit id registers.  */
+    u = cpu->isar.id_isar5;
+    u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
+    u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
+    u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
+    u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
+    u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
+    u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = u;
+
+    u = cpu->isar.id_isar6;
+    u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
+    u = FIELD_DP32(u, ID_ISAR6, DP, 1);
+    u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
+    u = FIELD_DP32(u, ID_ISAR6, SB, 1);
+    u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+    cpu->isar.id_isar6 = u;
+
+    u = cpu->isar.id_pfr0;
+    u = FIELD_DP32(u, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = u;
+
+    u = cpu->isar.id_pfr2;
+    u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = u;
+
+    u = cpu->isar.id_mmfr3;
+    u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = u;
+
+    u = cpu->isar.id_mmfr4;
+    u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
+    u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = u;
+
+    t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
+    cpu->isar.id_aa64dfr0 = t;
+
+    u = cpu->isar.id_dfr0;
+    u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = u;
+
+    u = cpu->isar.mvfr1;
+    u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
+    u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
+    cpu->isar.mvfr1 = u;
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * For usermode -cpu max we can use a larger and more efficient DCZ
+     * blocksize since we don't have to follow what the hardware does.
+     */
+    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
+    cpu->dcz_blocksize = 7; /*  512 bytes */
+#endif
+    cpu_pauth_add_props(obj);
+}
+
+#else /* !TARGET_AARCH64 */
+static void tcg_cpu_max_instance_init(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /* old-style VFP short-vector support */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * We don't set these in system emulation mode for the moment,
+     * since we don't correctly set (all of) the ID registers to
+     * advertise them.
+     */
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    {
+        uint32_t t;
+
+        t = cpu->isar.id_isar5;
+        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+        cpu->isar.id_isar5 = t;
+
+        t = cpu->isar.id_isar6;
+        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        cpu->isar.id_isar6 = t;
+
+        t = cpu->isar.mvfr1;
+        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+        cpu->isar.mvfr1 = t;
+
+        t = cpu->isar.mvfr2;
+        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+        cpu->isar.mvfr2 = t;
+
+        t = cpu->isar.id_mmfr3;
+        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+        cpu->isar.id_mmfr3 = t;
+
+        t = cpu->isar.id_mmfr4;
+        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+        cpu->isar.id_mmfr4 = t;
+
+        t = cpu->isar.id_pfr0;
+        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = t;
+
+        t = cpu->isar.id_pfr2;
+        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+        cpu->isar.id_pfr2 = t;
+    }
+#endif /* CONFIG_USER_ONLY */
+}
+#endif /* TARGET_AARCH64 */
+
 static void tcg_cpu_instance_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
-    /*
-     * this would be the place to move TCG-specific props
-     * in future refactoring of cpu properties.
-     */
-
     cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+    if (cpu->max_features) {
+        tcg_cpu_max_instance_init(cs);
+    }
 }
 
 static void tcg_cpu_reset(CPUState *cs)
-- 
2.26.2


