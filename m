Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117562CC667
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 20:19:22 +0100 (CET)
Received: from localhost ([::1]:43204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXer-0006qW-4I
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 14:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQR-0003EF-FF; Wed, 02 Dec 2020 14:04:27 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56518
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQO-0005Hc-3w; Wed, 02 Dec 2020 14:04:27 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id 4BEF239004FC;
 Wed,  2 Dec 2020 20:04:20 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/10] hvf: arm: Implement -cpu host
Date: Wed,  2 Dec 2020 20:04:08 +0100
Message-Id: <20201202190408.2041-11-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201202190408.2041-1-agraf@csgraf.de>
References: <20201202190408.2041-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have working system register sync, we push more target CPU
properties into the virtual machine. That might be useful in some
situations, but is not the typical case that users want.

So let's add a -cpu host option that allows them to explicitly pass all
CPU capabilities of their host CPU into the guest.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 include/sysemu/hvf.h |  2 ++
 target/arm/cpu.c     |  9 ++++++---
 target/arm/cpu.h     |  2 ++
 target/arm/hvf/hvf.c | 41 +++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h |  2 --
 5 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index f893768df9..7eb61cf094 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -19,6 +19,8 @@
 #ifdef CONFIG_HVF
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                                  int reg);
+struct ARMCPU;
+void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
 extern bool hvf_allowed;
 #define hvf_enabled() (hvf_allowed)
 #else /* !CONFIG_HVF */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9a501ea4bd..087c6292b6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2279,12 +2279,16 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 }
 
-#ifdef CONFIG_KVM
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
 static void arm_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
+#ifdef CONFIG_KVM
     kvm_arm_set_cpu_features_from_host(cpu);
+#else
+    hvf_arm_set_cpu_features_from_host(cpu);
+#endif
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
     }
@@ -2296,7 +2300,6 @@ static const TypeInfo host_arm_cpu_type_info = {
     .parent = TYPE_AARCH64_CPU,
     .instance_init = arm_host_initfn,
 };
-
 #endif
 
 static void arm_cpu_instance_init(Object *obj)
@@ -2355,7 +2358,7 @@ static void arm_cpu_register_types(void)
 
     type_register_static(&arm_cpu_type_info);
 
-#ifdef CONFIG_KVM
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     type_register_static(&host_arm_cpu_type_info);
 #endif
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c8286..e54963aa8b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2823,6 +2823,8 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
+#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
+
 #define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index dfdf0827e4..9442e2f232 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -373,6 +373,47 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
     return val;
 }
 
+void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    ARMISARegisters host_isar;
+    const struct isar_regs {
+        int reg;
+        uint64_t *val;
+    } regs[] = {
+        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
+        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
+        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
+        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
+        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
+        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
+        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
+        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
+    };
+    hv_vcpu_t fd;
+    hv_vcpu_exit_t *exit;
+    int i;
+
+    cpu->dtb_compatible = "arm,arm-v8";
+    cpu->env.features = (1ULL << ARM_FEATURE_V8) |
+                        (1ULL << ARM_FEATURE_NEON) |
+                        (1ULL << ARM_FEATURE_AARCH64) |
+                        (1ULL << ARM_FEATURE_PMU) |
+                        (1ULL << ARM_FEATURE_GENERIC_TIMER);
+
+    /* We set up a small vcpu to extract host registers */
+
+    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
+    for (i = 0; i < ARRAY_SIZE(regs); i++) {
+        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
+    }
+    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &cpu->midr));
+    assert_hvf_ok(hv_vcpu_destroy(fd));
+
+    cpu->isar = host_isar;
+    cpu->reset_sctlr = 0x00c50078;
+}
+
 void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
 }
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index eb81b7059e..081727a37e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -214,8 +214,6 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
  */
 void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
 
-#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
-
 /**
  * ARMHostCPUFeatures: information about the host CPU (identified
  * by asking the host kernel)
-- 
2.24.3 (Apple Git-128)


