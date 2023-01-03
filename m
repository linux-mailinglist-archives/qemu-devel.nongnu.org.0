Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D0C65C639
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClv9-0007Cl-RO; Tue, 03 Jan 2023 13:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClv8-00078v-53
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:21:54 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClv5-00069D-3J
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:21:53 -0500
Received: by mail-pl1-x632.google.com with SMTP id 17so33540060pll.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMnuA3U8qCvAAKV0fJRhlFvw2qzRYQPSD0W9z7bDfCw=;
 b=rf/6yAwyaIV9ejbFdL/RU7e0AwbhG4YprvfZ5feDR44T4XA85xPV8zmPXEy1UMYweS
 XwUrcCDK68VUqGon442qCYhstJdmOjSKMXp9wkoUbs3PIGr8RzMR9L5Mg+kBDBxsmqvR
 p3rgdPp6DPbUiEYlPiN8NDUwaJ+qG6bETMyNQQkYq/a8dzEmD/01R5vSo5mWeINbeveW
 BYx98DNq9HObpVz43L5ZzjXCTN2muDBUdnrk/7JgRMf+/8GZdvBJHDlHw2OcPHBHr4If
 GhPFmFQ1xublWqd5vTT6e/000177rticd9jqkn2j4VM1qysJJRjN8jkxQDlogyQQ3uX6
 nG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMnuA3U8qCvAAKV0fJRhlFvw2qzRYQPSD0W9z7bDfCw=;
 b=OTuTFRaz+OjgdCJq+p5Z0v9977pyOaAZKz2x4L/M5uM3cF0fKdGYamPhv2Cnx2CWpj
 N2UKslwlVBmrtwbpgP60JAnwcsHjKSW7/Yrs2gJsiaYfIyGmdqq4p4z+hKeBHeo4Inxh
 BTcVWS76UMn6gLEth52n5Vm6HEbRtm5l1lONTrdo67+wZ49tI47TvzHbvfoZRovlyuNy
 vr797NzRUhClfDlUrp22Uu26JWCkW0GThIxAPy0FxssmktGeg2pMraNNEsIKgrN5EYCQ
 FpaSW6c1Iaj5dxkMNRXIUUf6DC0AfJwo+rYeU4Aq8R/fcCb+UhnVIPY+lJhouX6uF6MQ
 0Szg==
X-Gm-Message-State: AFqh2krZYa6/X79uzlkOay5tE/RWeL+pG7EGRZQ08vzW1E+9BMpKfVCK
 8/WwBbPUQWt5tsOzNSDoABQF3KIQTv5U4e/XpX8=
X-Google-Smtp-Source: AMrXdXtJe9M7J3gyj7iVB6nDCjeXoepMIutI1BkUjqE3aoifyjjmwZtKz+VzhczMqFSdXGX8+W491A==
X-Received: by 2002:a17:90a:d793:b0:219:1b52:859a with SMTP id
 z19-20020a17090ad79300b002191b52859amr48392950pju.10.1672770108788; 
 Tue, 03 Jan 2023 10:21:48 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 f31-20020a17090a702200b00226463cd239sm7090698pjk.15.2023.01.03.10.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:21:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 40/40] target/arm: Move "pmu" to class property
Date: Tue,  3 Jan 2023 10:16:46 -0800
Message-Id: <20230103181646.55711-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With the movement of the property, we can remove the field
from the cpu entirely, using only the class.
Properly detect support in kvm_arm_get_host_cpu_features
rather than adjust much later in kvm_arch_init_vcpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h |  2 ++
 target/arm/cpu.h     |  3 ---
 target/arm/kvm_arm.h | 13 ----------
 hw/arm/virt.c        | 12 +++++-----
 target/arm/cpu.c     | 57 ++++++++++++++++++++------------------------
 target/arm/kvm.c     | 24 +++++++++++--------
 6 files changed, 48 insertions(+), 63 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 8f266baa26..0272e61c21 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -192,6 +192,8 @@ struct ARMCPUClass {
     OnOffAuto has_vfp;
     /* CPU has Neon */
     OnOffAuto has_neon;
+    /* CPU has PMU (Performance Monitor Unit) */
+    OnOffAuto has_pmu;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1b181ecde4..dac72045d1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -886,9 +886,6 @@ struct ArchCPU {
     /* Current power state, access guarded by BQL */
     ARMPSCIState power_state;
 
-    /* CPU has PMU (Performance Monitor Unit) */
-    bool has_pmu;
-
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
     /* v8M SAU number of supported regions */
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index d426e24c53..a958e071c1 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -177,14 +177,6 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
  */
 bool kvm_arm_aarch32_supported(void);
 
-/**
- * kvm_arm_pmu_supported:
- *
- * Returns: true if KVM can enable the PMU
- * and false otherwise.
- */
-bool kvm_arm_pmu_supported(void);
-
 /**
  * kvm_arm_sve_supported:
  *
@@ -229,11 +221,6 @@ static inline bool kvm_arm_aarch32_supported(void)
     return false;
 }
 
-static inline bool kvm_arm_pmu_supported(void)
-{
-    return false;
-}
-
 static inline bool kvm_arm_sve_supported(void)
 {
     return false;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c1cabe2413..38f89559ed 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -605,7 +605,6 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
 
     if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
-        assert(!object_property_get_bool(OBJECT(armcpu), "pmu", NULL));
         return;
     }
 
@@ -1951,9 +1950,11 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
     int max_cpus = MACHINE(vms)->smp.max_cpus;
     bool aarch64, pmu, steal_time;
     CPUState *cpu;
+    ObjectClass *cpu_class;
 
+    cpu_class = object_get_class(OBJECT(first_cpu));
     aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
-    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
+    pmu = class_property_get_bool(cpu_class, "pmu", NULL);
     steal_time = object_property_get_bool(OBJECT(first_cpu),
                                           "kvm-steal-time", NULL);
 
@@ -2043,6 +2044,9 @@ static void machvirt_init(MachineState *machine)
     if (!vms->virt) {
         class_property_set_bool(cpu_class, "has_el2", false, &error_abort);
     }
+    if (vmc->no_pmu) {
+        class_property_set_bool(cpu_class, "pmu", false, &error_abort);
+    }
 
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
@@ -2185,10 +2189,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
         }
 
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
-            object_property_set_bool(cpuobj, "pmu", false, NULL);
-        }
-
         if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
             object_property_set_bool(cpuobj, "lpa2", false, NULL);
         }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b984735793..c287b0bc89 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1279,29 +1279,6 @@ static void arm_cpu_initfn(Object *obj)
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
-static bool arm_get_pmu(Object *obj, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    return cpu->has_pmu;
-}
-
-static void arm_set_pmu(Object *obj, bool value, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    if (value) {
-        if (kvm_enabled() && !kvm_arm_pmu_supported()) {
-            error_setg(errp, "'pmu' feature not supported by KVM on this host");
-            return;
-        }
-        set_feature(&cpu->env, ARM_FEATURE_PMU);
-    } else {
-        unset_feature(&cpu->env, ARM_FEATURE_PMU);
-    }
-    cpu->has_pmu = value;
-}
-
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
 {
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
@@ -1357,11 +1334,6 @@ static void arm_cpu_post_init(Object *obj)
     }
 #endif
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
-        cpu->has_pmu = true;
-        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
-    }
-
     if (arm_feature(&cpu->env, ARM_FEATURE_M_SECURITY)) {
         object_property_add_link(obj, "idau", TYPE_IDAU_INTERFACE, &cpu->idau,
                                  qdev_prop_allow_set_link_before_realize,
@@ -1586,9 +1558,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!cpu->has_pmu) {
-        unset_feature(env, ARM_FEATURE_PMU);
-    }
     if (arm_feature(env, ARM_FEATURE_PMU)) {
         pmu_init(cpu);
 
@@ -2163,6 +2132,13 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
                            arm_class_prop_set_auto_ofs,
                            (void *)(uintptr_t)offsetof(ARMCPUClass, has_el3));
     }
+
+    if (arm_class_feature(acc, ARM_FEATURE_PMU)) {
+        class_property_add(oc, "pmu", "bool", NULL,
+                           arm_class_prop_get_auto_ofs,
+                           arm_class_prop_set_auto_ofs,
+                           (void *)(uintptr_t)offsetof(ARMCPUClass, has_pmu));
+    }
 #endif /* !CONFIG_USER_ONLY */
 
     /*
@@ -2279,6 +2255,25 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
     default:
         g_assert_not_reached();
     }
+
+    switch (acc->has_pmu) {
+    case ON_OFF_AUTO_AUTO:
+        acc->has_pmu = (arm_class_feature(acc, ARM_FEATURE_PMU)
+                        ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF);
+        break;
+    case ON_OFF_AUTO_OFF:
+        unset_class_feature(acc, ARM_FEATURE_PMU);
+        break;
+    case ON_OFF_AUTO_ON:
+        if (!arm_class_feature(acc, ARM_FEATURE_PMU)) {
+            error_setg(errp, "'pmu' feature not supported by %s on this host",
+                       current_accel_name());
+            return false;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
 #endif /* !CONFIG_USER_ONLY */
 
     if (!arm_class_feature(acc, ARM_FEATURE_M)) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 85971df07c..0ae435addd 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -239,7 +239,13 @@ void kvm_arm_add_vcpu_properties(Object *obj)
                                     "Set off to disable KVM steal time.");
 }
 
-bool kvm_arm_pmu_supported(void)
+/**
+ * kvm_arm_pmu_supported:
+ *
+ * Returns: true if KVM can enable the PMU
+ * and false otherwise.
+ */
+static bool kvm_arm_pmu_supported(void)
 {
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
 }
@@ -1463,7 +1469,7 @@ void kvm_arm_pmu_init(CPUState *cs)
         .attr = KVM_ARM_VCPU_PMU_V3_INIT,
     };
 
-    if (!ARM_CPU(cs)->has_pmu) {
+    if (!arm_feature(&ARM_CPU(cs)->env, ARM_FEATURE_PMU)) {
         return;
     }
     if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
@@ -1480,7 +1486,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
         .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
     };
 
-    if (!ARM_CPU(cs)->has_pmu) {
+    if (!arm_feature(&ARM_CPU(cs)->env, ARM_FEATURE_PMU)) {
         return;
     }
     if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
@@ -1594,6 +1600,9 @@ bool kvm_arm_get_host_cpu_features(ARMCPUClass *acc, Error **errp)
     if (kvm_arm_pmu_supported()) {
         init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
         pmu_supported = true;
+    } else {
+        /* This was optimistically set in aarch64_host_class_init. */
+        unset_class_feature(acc, ARM_FEATURE_PMU);
     }
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
@@ -1877,7 +1886,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
 {
     int ret;
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
     uint64_t psciver;
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
@@ -1900,13 +1908,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
-    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-        cpu->has_pmu = false;
-    }
-    if (cpu->has_pmu) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
+        assert(kvm_arm_pmu_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
-    } else {
-        env->features &= ~(1ULL << ARM_FEATURE_PMU);
     }
     if (cpu_isar_feature(aa64_sve, cpu)) {
         assert(kvm_arm_sve_supported());
-- 
2.34.1


