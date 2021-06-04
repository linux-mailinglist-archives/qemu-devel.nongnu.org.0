Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFEF39BD68
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:40:14 +0200 (CEST)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCrk-0004oc-MZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRW-0003F2-HH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRM-0003sC-Ic
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id f17so5706777wmf.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YEMn/TZVYqcd/40Lz0kIER2IvEdqHAsgJm9milarnoM=;
 b=qoeJ8YdJYYO8fyGjxeRqyN87qqRw/OYj45ViDUyZGOWQXyQOcpGI3HKTSH737TVZCk
 OpTEPYM/3MzolXCetO1MvtGI9G6OiG9dV4B5f4LpN7dfu/7cnDD+bx0bkCJV9WpWT3Ie
 l1HMOxmJRtShK+mszU+2WPxxLgkA5nDOf6ADXZbpR+GBTsvaaFcBPKVsqt88n7DlczD/
 U4/szyu43EjP1zVYs65I5VK7bkc2uNUCDcDG9zJzwliozClMgHOujOK+ZOSXdV5NF3JH
 XFXdMoXPXJXjis+2HW0zxs/FFgNMpFxlCFXAm8+XFPmtRfCVcWUW6kQz2BcVy5lar5r7
 9aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YEMn/TZVYqcd/40Lz0kIER2IvEdqHAsgJm9milarnoM=;
 b=af8a+Z542+etVLKM0Wse53wCJYMTJLDMqx36PWlUMF63ErVS3X0o4BtYNgbc+oEFzf
 vStmSjeQ65A+xw8wB+cySwIUEvGvWu1IcDDwvuZqrd84C0a0hJeX0Sk37/hZ5OKt1FZc
 3SYxRK7j3munRaR3HIjPa3a5VL2UdBOxh3zbUgkyU61uJly9Ye0zYAVetYN8BHC1J7Hk
 T2xKNVfUg1YUE27YEvIs685CKA8Gxa9fTZphGLGlkMi4CkpO2Twal8xHU8LFNm/a1L+s
 +J8tPx42fmGPREC+rAmT9nyAY7jP9s08smisIpsK7T5m8kRMbhxmhCn8PmgwDHQlEpLW
 OQ3w==
X-Gm-Message-State: AOAM5331k1gY4mPnS5v3QfBRXPAAOF82O0wOaXWr2shBSo4iuGxFFAsj
 xLi2Aek2ocoW3msSR9/h3mkzhQ==
X-Google-Smtp-Source: ABdhPJxaNgaUupzTYFAOUwcG0a/HCBNAsRTnHqyJYlfDlSRlTt2jz+uze1mYNdlYAvggp/UT7vsE9A==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr4477404wmj.184.1622823174713; 
 Fri, 04 Jun 2021 09:12:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f20sm7039580wmh.41.2021.06.04.09.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EE2D1FFC0;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 41/99] target/arm: new cpu32 ARM 32 bit CPU Class
Date: Fri,  4 Jun 2021 16:52:14 +0100
Message-Id: <20210604155312.15902-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

In the ARM CPU class hierarchy, the ancestor TYPE_ARM_CPU is fundamentally
a 32 bit CPU Class. The child TYPE_AARCH64_CPU overrides the class to
make it a 64 bit CPU Class.

Explicitly put the 32bit CPU Class implementation in a cpu32.c,
along with the 32bit CPU Class model registration function.

In later changes, we will further split 32bit and 64bit code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
index 7bb406efd2..b9b300944d 100644
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
@@ -853,7 +854,7 @@ static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 #endif
 
-static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -1856,17 +1857,6 @@ static Property arm_cpu_properties[] = {
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
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
@@ -1912,16 +1902,11 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-    cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-    cc->gdb_read_register = arm_cpu_gdb_read_register;
-    cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
-    cc->gdb_arch_name = arm_gdb_arch_name;
+
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
@@ -1929,6 +1914,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops = &arm_tcg_ops;
 #endif /* CONFIG_TCG */
+
+    arm32_cpu_class_init(oc, data);
 }
 
 #ifdef CONFIG_KVM
@@ -1951,38 +1938,6 @@ static const TypeInfo host_arm_cpu_type_info = {
 
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
index 5354069c63..4ff55fb0f0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -860,7 +860,7 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 }
 
-void aarch64_cpu_register(const ARMCPUInfo *info)
+static void aarch64_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info = {
         .parent = TYPE_AARCH64_CPU,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d973239d78..09eff9bfd2 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -19,6 +19,7 @@
 #include "hw/boards.h"
 #endif
 #include "cpregs.h"
+#include "cpu32.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -1072,7 +1073,7 @@ static void arm_tcg_cpu_register_types(void)
 
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
2.20.1


