Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2234AF7A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:45:26 +0100 (CET)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsOb-0006OF-Mo
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGm-0005yg-Oo
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:45306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGj-0000qn-Mp
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74257AD8D;
 Fri, 26 Mar 2021 19:37:16 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 10/65] target/arm: split off cpu-sysemu.c
Date: Fri, 26 Mar 2021 20:36:06 +0100
Message-Id: <20210326193701.5981-11-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

move work is needed later on to split things into
tcg-specific portions and kvm-specific portions of this

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |   8 ++-
 target/arm/cpu-sysemu.c | 105 ++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c        |  83 -------------------------------
 target/arm/meson.build  |   1 +
 4 files changed, 113 insertions(+), 84 deletions(-)
 create mode 100644 target/arm/cpu-sysemu.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f11bd32696..479dc10463 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1205,4 +1205,10 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
     return ptr;
 }
 
-#endif
+#ifndef CONFIG_USER_ONLY
+void arm_cpu_set_irq(void *opaque, int irq, int level);
+void arm_cpu_kvm_set_irq(void *opaque, int irq, int level);
+bool arm_cpu_virtio_is_big_endian(CPUState *cs);
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* TARGET_ARM_INTERNALS_H */
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
new file mode 100644
index 0000000000..db1c8cb245
--- /dev/null
+++ b/target/arm/cpu-sysemu.c
@@ -0,0 +1,105 @@
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
+#include "cpu.h"
+#include "internals.h"
+#include "sysemu/hw_accel.h"
+#include "kvm_arm.h"
+
+void arm_cpu_set_irq(void *opaque, int irq, int level)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    static const int mask[] = {
+        [ARM_CPU_IRQ] = CPU_INTERRUPT_HARD,
+        [ARM_CPU_FIQ] = CPU_INTERRUPT_FIQ,
+        [ARM_CPU_VIRQ] = CPU_INTERRUPT_VIRQ,
+        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
+    };
+
+    if (level) {
+        env->irq_line_state |= mask[irq];
+    } else {
+        env->irq_line_state &= ~mask[irq];
+    }
+
+    switch (irq) {
+    case ARM_CPU_VIRQ:
+        assert(arm_feature(env, ARM_FEATURE_EL2));
+        arm_cpu_update_virq(cpu);
+        break;
+    case ARM_CPU_VFIQ:
+        assert(arm_feature(env, ARM_FEATURE_EL2));
+        arm_cpu_update_vfiq(cpu);
+        break;
+    case ARM_CPU_IRQ:
+    case ARM_CPU_FIQ:
+        if (level) {
+            cpu_interrupt(cs, mask[irq]);
+        } else {
+            cpu_reset_interrupt(cs, mask[irq]);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
+{
+#ifdef CONFIG_KVM
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
+#endif
+}
+
+bool arm_cpu_virtio_is_big_endian(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    cpu_synchronize_state(cs);
+    return arm_cpu_data_is_big_endian(env);
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408..a68804f6fc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -650,89 +650,6 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     }
 }
 
-#ifndef CONFIG_USER_ONLY
-static void arm_cpu_set_irq(void *opaque, int irq, int level)
-{
-    ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
-    static const int mask[] = {
-        [ARM_CPU_IRQ] = CPU_INTERRUPT_HARD,
-        [ARM_CPU_FIQ] = CPU_INTERRUPT_FIQ,
-        [ARM_CPU_VIRQ] = CPU_INTERRUPT_VIRQ,
-        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
-    };
-
-    if (level) {
-        env->irq_line_state |= mask[irq];
-    } else {
-        env->irq_line_state &= ~mask[irq];
-    }
-
-    switch (irq) {
-    case ARM_CPU_VIRQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
-        arm_cpu_update_virq(cpu);
-        break;
-    case ARM_CPU_VFIQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
-        arm_cpu_update_vfiq(cpu);
-        break;
-    case ARM_CPU_IRQ:
-    case ARM_CPU_FIQ:
-        if (level) {
-            cpu_interrupt(cs, mask[irq]);
-        } else {
-            cpu_reset_interrupt(cs, mask[irq]);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
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
-static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    cpu_synchronize_state(cs);
-    return arm_cpu_data_is_big_endian(env);
-}
-
-#endif
-
 static int
 print_insn_thumb1(bfd_vma pc, disassemble_info *info)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index a9fdada0cc..b75392e3e9 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -17,6 +17,7 @@ arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cpu-sysemu.c',
   'machine.c',
   'monitor.c',
 ))
-- 
2.26.2


