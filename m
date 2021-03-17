Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D865333F88F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:58:02 +0100 (CET)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbMm-00077u-QR
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMax1-0004L3-BN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:48668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawn-0007qd-8j
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8426AED2;
 Wed, 17 Mar 2021 18:30:32 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 37/50] target/arm: create kvm cpu accel class
Date: Wed, 17 Mar 2021 19:30:00 +0100
Message-Id: <20210317183013.25772-38-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317183013.25772-1-cfontana@suse.de>
References: <20210317183013.25772-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

start by moving minimal init and realizefn code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/internals.h     |   1 -
 target/arm/cpu-sysemu.c    |  32 ----------
 target/arm/cpu.c           |  43 +++----------
 target/arm/kvm/kvm-cpu.c   | 122 +++++++++++++++++++++++++++++++++++++
 target/arm/kvm/meson.build |   3 +-
 5 files changed, 131 insertions(+), 70 deletions(-)
 create mode 100644 target/arm/kvm/kvm-cpu.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 811e029f83..7a789db686 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1168,7 +1168,6 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
 
 #ifndef CONFIG_USER_ONLY
 void arm_cpu_set_irq(void *opaque, int irq, int level);
-void arm_cpu_kvm_set_irq(void *opaque, int irq, int level);
 bool arm_cpu_virtio_is_big_endian(CPUState *cs);
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index cb4ae2263c..305057d35b 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -24,7 +24,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "sysemu/hw_accel.h"
-#include "kvm/kvm_arm.h"
 #include "sysemu/tcg.h"
 
 #ifdef CONFIG_TCG
@@ -71,37 +70,6 @@ void arm_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
-void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
-{
-#ifdef CONFIG_KVM
-    ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
-    uint32_t linestate_bit;
-    int irq_id;
-
-    switch (irq) {
-    case ARM_CPU_IRQ:
-        irq_id = KVM_ARM_IRQ_CPU_IRQ;
-        linestate_bit = CPU_INTERRUPT_HARD;
-        break;
-    case ARM_CPU_FIQ:
-        irq_id = KVM_ARM_IRQ_CPU_FIQ;
-        linestate_bit = CPU_INTERRUPT_FIQ;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (level) {
-        env->irq_line_state |= linestate_bit;
-    } else {
-        env->irq_line_state &= ~linestate_bit;
-    }
-    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
-#endif
-}
-
 bool arm_cpu_virtio_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 353cd652bc..3d6501c2c5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -42,6 +42,7 @@
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
+#include "qemu/accel.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -560,12 +561,6 @@ static void arm_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     /* Our inbound IRQ and FIQ lines */
-    if (kvm_enabled()) {
-        /* VIRQ and VFIQ are unused with KVM but we add them to maintain
-         * the same interface as non-KVM CPUs.
-         */
-        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
-    }
     if (tcg_enabled() || qtest_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
     }
@@ -590,6 +585,9 @@ static void arm_cpu_initfn(Object *obj)
     if (tcg_enabled()) {
         cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
     }
+
+    /* if required, do accelerator-specific cpu initializations */
+    accel_cpu_instance_init(CPU(obj));
 }
 
 static Property arm_cpu_gt_cntfrq_property =
@@ -879,16 +877,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
-    /* If we needed to query the host kernel for the CPU features
+    /*
+     * If we needed to query the host kernel for the CPU features
      * then it's possible that might have failed in the initfn, but
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM");
-        } else {
-            error_setg(errp, "Failed to retrieve host CPU features");
-        }
+        error_setg(errp, "The 'host' CPU type can only be used with KVM");
         return;
     }
 
@@ -1478,26 +1473,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     arm32_cpu_class_init(oc, data);
 }
 
-#ifdef CONFIG_KVM
-static void arm_host_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-    }
-    arm_cpu_post_init(obj);
-}
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
-#endif
-
 static const TypeInfo arm_cpu_type_info = {
     .name = TYPE_ARM_CPU,
     .parent = TYPE_CPU,
@@ -1520,10 +1495,6 @@ static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
     type_register_static(&idau_interface_type_info);
-
-#ifdef CONFIG_KVM
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
new file mode 100644
index 0000000000..b3e97080cc
--- /dev/null
+++ b/target/arm/kvm/kvm-cpu.c
@@ -0,0 +1,122 @@
+/*
+ * QEMU ARM CPU
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/core/accel-cpu.h"
+#include "qapi/error.h"
+
+#include "kvm/kvm_arm.h"
+#include "internals.h"
+
+static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    uint32_t linestate_bit;
+    int irq_id;
+
+    switch (irq) {
+    case ARM_CPU_IRQ:
+        irq_id = KVM_ARM_IRQ_CPU_IRQ;
+        linestate_bit = CPU_INTERRUPT_HARD;
+        break;
+    case ARM_CPU_FIQ:
+        irq_id = KVM_ARM_IRQ_CPU_FIQ;
+        linestate_bit = CPU_INTERRUPT_FIQ;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (level) {
+        env->irq_line_state |= linestate_bit;
+    } else {
+        env->irq_line_state &= ~linestate_bit;
+    }
+    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
+}
+
+static void kvm_cpu_instance_init(CPUState *cs)
+{
+    /*
+     * VIRQ and VFIQ are unused with KVM but we add them to maintain
+     * the same interface as non-KVM CPUs.
+     */
+    qdev_init_gpio_in(DEVICE(cs), arm_cpu_kvm_set_irq, 4);
+}
+
+static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    /*
+     * If we needed to query the host kernel for the CPU features
+     * then it's possible that might have failed in the initfn, but
+     * this is the first point where we can report it.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (cpu->host_cpu_probe_failed) {
+        error_setg(errp, "Failed to retrieve host CPU features");
+        return false;
+    }
+    return true;
+}
+
+static void host_cpu_instance_init(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+    }
+    arm_cpu_post_init(obj);
+}
+
+static const TypeInfo host_cpu_type_info = {
+    .name = ARM_CPU_TYPE_NAME("host"),
+    .parent = TYPE_AARCH64_CPU,
+    .instance_init = host_cpu_instance_init,
+};
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_realizefn = kvm_cpu_realizefn;
+    acc->cpu_instance_init = kvm_cpu_instance_init;
+}
+
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&host_cpu_type_info);
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+
+type_init(kvm_cpu_accel_register_types);
diff --git a/target/arm/kvm/meson.build b/target/arm/kvm/meson.build
index ba02e96e76..22ea27ba0f 100644
--- a/target/arm/kvm/meson.build
+++ b/target/arm/kvm/meson.build
@@ -5,4 +5,5 @@ arm_ss.add(when: 'CONFIG_TCG', if_false: files(
 arm_ss.add(when: 'CONFIG_KVM', if_true: files(
   'kvm.c',
   'kvm64.c',
-))
\ No newline at end of file
+  'kvm-cpu.c',
+))
-- 
2.26.2


