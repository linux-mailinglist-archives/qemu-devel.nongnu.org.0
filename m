Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF735F2F4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:55:27 +0200 (CEST)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWe7C-0007kt-8X
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgh-0006b6-KK
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgQ-0005dI-4j
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF96B0B3;
 Wed, 14 Apr 2021 11:27:05 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v13 27/80] target/arm: new cpu32 ARM 32 bit CPU Class
Date: Wed, 14 Apr 2021 13:25:57 +0200
Message-Id: <20210414112650.18003-28-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210414112650.18003-1-cfontana@suse.de>
References: <20210414112650.18003-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In the ARM CPU class hierarchy, the ancestor TYPE_ARM_CPU is fundamentally
a 32 bit CPU Class. The child TYPE_AARCH64_CPU overrides the class to
make it a 64 bit CPU Class.

Explicitly put the 32bit CPU Class implementation in a cpu32.c,
along with the 32bit CPU Class model registration function.

In later changes, we will further split 32bit and 64bit code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-qom.h   |   3 --
 target/arm/cpu32.h     |  28 ++++++++++
 target/arm/cpu.c       |  55 ++-----------------
 target/arm/cpu32.c     | 118 +++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c     |   2 +-
 target/arm/cpu_tcg.c   |   3 +-
 target/arm/meson.build |   6 ++-
 7 files changed, 159 insertions(+), 56 deletions(-)
 create mode 100644 target/arm/cpu32.h
 create mode 100644 target/arm/cpu32.c

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index a22bd506d0..0d41a346b9 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -38,9 +38,6 @@ typedef struct ARMCPUInfo {
     void (*class_init)(ObjectClass *oc, void *data);
 } ARMCPUInfo;
 
-void arm_cpu_register(const ARMCPUInfo *info);
-void aarch64_cpu_register(const ARMCPUInfo *info);
-
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/arm/cpu32.h b/target/arm/cpu32.h
new file mode 100644
index 0000000000..211fad6f55
--- /dev/null
+++ b/target/arm/cpu32.h
@@ -0,0 +1,28 @@
+/*
+ * QEMU ARM CPU models (32bit)
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
+#ifndef ARM_CPU32_H
+#define ARM_CPU32_H
+
+void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags);
+void arm32_cpu_class_init(ObjectClass *oc, void *data);
+void arm32_cpu_register(const ARMCPUInfo *info);
+
+#endif /* ARM_CPU32_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3e9714a768..d88074b677 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -30,6 +30,7 @@
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
+#include "cpu32.h"
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
@@ -854,7 +855,7 @@ static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 #endif
 
-static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -1855,17 +1856,6 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static gchar *arm_gdb_arch_name(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        return g_strdup("iwmmxt");
-    }
-    return g_strdup("arm");
-}
-
 #ifdef CONFIG_TCG
 static struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
@@ -1898,10 +1888,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-    cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-    cc->gdb_read_register = arm_cpu_gdb_read_register;
-    cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
@@ -1910,9 +1897,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
 #endif
-    cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
-    cc->gdb_arch_name = arm_gdb_arch_name;
+
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
@@ -1920,6 +1905,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops = &arm_tcg_ops;
 #endif /* CONFIG_TCG */
+
+    arm32_cpu_class_init(oc, data);
 }
 
 #ifdef CONFIG_KVM
@@ -1942,38 +1929,6 @@ static const TypeInfo host_arm_cpu_type_info = {
 
 #endif
 
-static void arm_cpu_instance_init(Object *obj)
-{
-    ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
-
-    acc->info->initfn(obj);
-    arm_cpu_post_init(obj);
-}
-
-static void cpu_register_class_init(ObjectClass *oc, void *data)
-{
-    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
-
-    acc->info = data;
-}
-
-void arm_cpu_register(const ARMCPUInfo *info)
-{
-    TypeInfo type_info = {
-        .parent = TYPE_ARM_CPU,
-        .instance_size = sizeof(ARMCPU),
-        .instance_align = __alignof__(ARMCPU),
-        .instance_init = arm_cpu_instance_init,
-        .class_size = sizeof(ARMCPUClass),
-        .class_init = info->class_init ?: cpu_register_class_init,
-        .class_data = (void *)info,
-    };
-
-    type_info.name = g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
-    type_register(&type_info);
-    g_free((void *)type_info.name);
-}
-
 static const TypeInfo arm_cpu_type_info = {
     .name = TYPE_ARM_CPU,
     .parent = TYPE_CPU,
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
new file mode 100644
index 0000000000..39fb112a04
--- /dev/null
+++ b/target/arm/cpu32.c
@@ -0,0 +1,118 @@
+/*
+ * QEMU ARM CPU models (32bit)
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
+#include "qemu/qemu-print.h"
+#include "qemu-common.h"
+#include "target/arm/idau.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "cpu.h"
+#include "cpregs.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "hw/qdev-properties.h"
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/loader.h"
+#include "hw/boards.h"
+#endif
+#include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
+#include "sysemu/hw_accel.h"
+#include "kvm_arm.h"
+#include "disas/capstone.h"
+#include "fpu/softfloat.h"
+#include "cpu-mmu.h"
+#include "cpu32.h"
+
+/* we can move this to tcg/ after the cleanup of ARM boards configurations */
+static const ARMCPUInfo arm32_cpus[] = {
+};
+
+static gchar *arm_gdb_arch_name(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
+        return g_strdup("iwmmxt");
+    }
+    return g_strdup("arm");
+}
+
+void arm32_cpu_class_init(ObjectClass *oc, void *data)
+{
+    CPUClass *cc = CPU_CLASS(oc);
+
+    cc->gdb_read_register = arm_cpu_gdb_read_register;
+    cc->gdb_write_register = arm_cpu_gdb_write_register;
+    cc->gdb_num_core_regs = 26;
+    cc->gdb_core_xml_file = "arm-core.xml";
+    cc->gdb_arch_name = arm_gdb_arch_name;
+    cc->dump_state = arm_cpu_dump_state;
+}
+
+static void arm32_cpu_instance_init(Object *obj)
+{
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
+
+    acc->info->initfn(obj);
+    arm_cpu_post_init(obj);
+}
+
+static void arm32_cpu_register_class_init(ObjectClass *oc, void *data)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+
+    acc->info = data;
+}
+
+void arm32_cpu_register(const ARMCPUInfo *info)
+{
+    TypeInfo type_info = {
+        .parent = TYPE_ARM_CPU,
+        .instance_size = sizeof(ARMCPU),
+        .instance_align = __alignof__(ARMCPU),
+        .instance_init = arm32_cpu_instance_init,
+        .class_size = sizeof(ARMCPUClass),
+        .class_init = info->class_init ?: arm32_cpu_register_class_init,
+        .class_data = (void *)info,
+    };
+
+    type_info.name = g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
+    type_register(&type_info);
+    g_free((void *)type_info.name);
+}
+
+static void arm32_cpu_register_types(void)
+{
+    const size_t cpu_count = ARRAY_SIZE(arm32_cpus);
+
+    if (cpu_count) {
+        size_t i;
+
+        for (i = 0; i < cpu_count; ++i) {
+            arm32_cpu_register(&arm32_cpus[i]);
+        }
+    }
+}
+
+type_init(arm32_cpu_register_types)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0728f1a431..bdbbda566b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -846,7 +846,7 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 }
 
-void aarch64_cpu_register(const ARMCPUInfo *info)
+static void aarch64_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info = {
         .parent = TYPE_AARCH64_CPU,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 1d9b59ad5f..0d5c8340b7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -19,6 +19,7 @@
 #include "hw/boards.h"
 #endif
 #include "cpregs.h"
+#include "cpu32.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -1071,7 +1072,7 @@ static void arm_tcg_cpu_register_types(void)
 
     type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
-        arm_cpu_register(&arm_tcg_cpus[i]);
+        arm32_cpu_register(&arm_tcg_cpus[i]);
     }
 }
 
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 4bc44e1db2..0ccd2fb0bc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,12 +2,12 @@ arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpregs.c',
   'cpu.c',
+  'cpu32.c',
   'cpu-common.c',
   'cpu-mmu.c',
   'cpu-vfp.c',
   'cpustate-list.c',
   'gdbstub.c',
-  'cpu_tcg.c',
 ))
 arm_ss.add(zlib)
 
@@ -18,6 +18,10 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gdbstub64.c',
 ))
 
+arm_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cpu_tcg.c',
+))
+
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
-- 
2.26.2


