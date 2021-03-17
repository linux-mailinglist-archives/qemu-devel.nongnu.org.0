Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087F33F87D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:53:26 +0100 (CET)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbIL-0001pN-7t
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawh-0004CQ-3T
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:48466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawU-0007km-BD
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 354BCAE8F;
 Wed, 17 Mar 2021 18:30:26 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 22/50] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
Date: Wed, 17 Mar 2021 19:29:45 +0100
Message-Id: <20210317183013.25772-23-cfontana@suse.de>
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

provide helper functions there to initialize 32bit models,
and export the a15 cpu model.

We still need to keep around a15 until we sort out the board configurations.

cpu.c will continue to contain the common parts between
32 and 64.

Note that we need to build cpu32 also for TARGET_AARCH64,
because qemu-system-aarch64 is supposed to be able to run
non-aarch64 cpus too.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-qom.h   |   3 -
 target/arm/cpu.h       |   4 +-
 target/arm/cpu32.h     |  29 +++++
 target/arm/cpu.c       | 277 +----------------------------------------
 target/arm/cpu32.c     | 274 ++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c     | 131 ++++++++++++++++++-
 target/arm/cpu_tcg.c   |  70 +----------
 target/arm/gdbstub.c   |   4 +-
 target/arm/meson.build |   5 +
 9 files changed, 448 insertions(+), 349 deletions(-)
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
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9293d90ffb..ea1e63f7f6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1026,8 +1026,8 @@ void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
 bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
 
-int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int arm32_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
+int arm32_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
 /*
  * Helpers to dynamically generates XML descriptions of the sysregs
diff --git a/target/arm/cpu32.h b/target/arm/cpu32.h
new file mode 100644
index 0000000000..a7e8694591
--- /dev/null
+++ b/target/arm/cpu32.h
@@ -0,0 +1,29 @@
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
+void arm32_cpu_class_init(ObjectClass *oc, void *data);
+void arm32_cpu_register(const ARMCPUInfo *info);
+void cortex_a15_initfn(Object *obj);
+extern const ARMCPRegInfo cortexa15_cp_reginfo[];
+
+#endif /* ARM_CPU32_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e47b09fe18..0f640a8b4e 100644
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
@@ -716,230 +717,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
-static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint32_t psr = pstate_read(env);
-    int i;
-    int el = arm_current_el(env);
-    const char *ns_status;
-
-    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
-    for (i = 0; i < 32; i++) {
-        if (i == 31) {
-            qemu_fprintf(f, " SP=%016" PRIx64 "\n", env->xregs[i]);
-        } else {
-            qemu_fprintf(f, "X%02d=%016" PRIx64 "%s", i, env->xregs[i],
-                         (i + 2) % 3 ? " " : "\n");
-        }
-    }
-
-    if (arm_feature(env, ARM_FEATURE_EL3) && el != 3) {
-        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
-    } else {
-        ns_status = "";
-    }
-    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
-                 psr,
-                 psr & PSTATE_N ? 'N' : '-',
-                 psr & PSTATE_Z ? 'Z' : '-',
-                 psr & PSTATE_C ? 'C' : '-',
-                 psr & PSTATE_V ? 'V' : '-',
-                 ns_status,
-                 el,
-                 psr & PSTATE_SP ? 'h' : 't');
-
-    if (cpu_isar_feature(aa64_bti, cpu)) {
-        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
-    }
-    if (!(flags & CPU_DUMP_FPU)) {
-        qemu_fprintf(f, "\n");
-        return;
-    }
-    if (fp_exception_el(env, el) != 0) {
-        qemu_fprintf(f, "    FPU disabled\n");
-        return;
-    }
-    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
-                 vfp_get_fpcr(env), vfp_get_fpsr(env));
-
-    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
-
-        for (i = 0; i <= FFR_PRED_NUM; i++) {
-            bool eol;
-            if (i == FFR_PRED_NUM) {
-                qemu_fprintf(f, "FFR=");
-                /* It's last, so end the line.  */
-                eol = true;
-            } else {
-                qemu_fprintf(f, "P%02d=", i);
-                switch (zcr_len) {
-                case 0:
-                    eol = i % 8 == 7;
-                    break;
-                case 1:
-                    eol = i % 6 == 5;
-                    break;
-                case 2:
-                case 3:
-                    eol = i % 3 == 2;
-                    break;
-                default:
-                    /* More than one quadword per predicate.  */
-                    eol = true;
-                    break;
-                }
-            }
-            for (j = zcr_len / 4; j >= 0; j--) {
-                int digits;
-                if (j * 4 + 4 <= zcr_len + 1) {
-                    digits = 16;
-                } else {
-                    digits = (zcr_len % 4 + 1) * 4;
-                }
-                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
-                             env->vfp.pregs[i].p[j],
-                             j ? ":" : eol ? "\n" : " ");
-            }
-        }
-
-        for (i = 0; i < 32; i++) {
-            if (zcr_len == 0) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                             i, env->vfp.zregs[i].d[1],
-                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
-            } else if (zcr_len == 1) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
-                             ":%016" PRIx64 ":%016" PRIx64 "\n",
-                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
-                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
-            } else {
-                for (j = zcr_len; j >= 0; j--) {
-                    bool odd = (zcr_len - j) % 2 != 0;
-                    if (j == zcr_len) {
-                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
-                    } else if (!odd) {
-                        if (j > 0) {
-                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
-                        } else {
-                            qemu_fprintf(f, "     [%x]=", j);
-                        }
-                    }
-                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
-                                 env->vfp.zregs[i].d[j * 2 + 1],
-                                 env->vfp.zregs[i].d[j * 2],
-                                 odd || j == 0 ? "\n" : ":");
-                }
-            }
-        }
-    } else {
-        for (i = 0; i < 32; i++) {
-            uint64_t *q = aa64_vfp_qreg(env, i);
-            qemu_fprintf(f, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                         i, q[1], q[0], (i & 1 ? "\n" : " "));
-        }
-    }
-}
-
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
-static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    int i;
-
-    if (is_a64(env)) {
-        aarch64_cpu_dump_state(cs, f, flags);
-        return;
-    }
-
-    for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
-        if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        uint32_t xpsr = xpsr_read(env);
-        const char *mode;
-        const char *ns_status = "";
-
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            ns_status = env->v7m.secure ? "S " : "NS ";
-        }
-
-        if (xpsr & XPSR_EXCP) {
-            mode = "handler";
-        } else {
-            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_MASK) {
-                mode = "unpriv-thread";
-            } else {
-                mode = "priv-thread";
-            }
-        }
-
-        qemu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
-                     xpsr,
-                     xpsr & XPSR_N ? 'N' : '-',
-                     xpsr & XPSR_Z ? 'Z' : '-',
-                     xpsr & XPSR_C ? 'C' : '-',
-                     xpsr & XPSR_V ? 'V' : '-',
-                     xpsr & XPSR_T ? 'T' : 'A',
-                     ns_status,
-                     mode);
-    } else {
-        uint32_t psr = cpsr_read(env);
-        const char *ns_status = "";
-
-        if (arm_feature(env, ARM_FEATURE_EL3) &&
-            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
-            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
-        }
-
-        qemu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
-                     psr,
-                     psr & CPSR_N ? 'N' : '-',
-                     psr & CPSR_Z ? 'Z' : '-',
-                     psr & CPSR_C ? 'C' : '-',
-                     psr & CPSR_V ? 'V' : '-',
-                     psr & CPSR_T ? 'T' : 'A',
-                     ns_status,
-                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
-    }
-
-    if (flags & CPU_DUMP_FPU) {
-        int numvfpregs = 0;
-        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
-            numvfpregs = 32;
-        } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-            numvfpregs = 16;
-        }
-        for (i = 0; i < numvfpregs; i++) {
-            uint64_t v = *aa32_vfp_dreg(env, i);
-            qemu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
-                         i * 2, (uint32_t)v,
-                         i * 2 + 1, (uint32_t)(v >> 32),
-                         i, v);
-        }
-        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
-    }
-}
-
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
 {
     uint32_t Aff1 = idx / clustersz;
@@ -1855,17 +1632,6 @@ static Property arm_cpu_properties[] = {
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
@@ -1898,10 +1664,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-    cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-    cc->gdb_read_register = arm_cpu_gdb_read_register;
-    cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
@@ -1910,9 +1673,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
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
@@ -1920,6 +1681,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops = &arm_tcg_ops;
 #endif /* CONFIG_TCG */
+
+    arm32_cpu_class_init(oc, data);
 }
 
 #ifdef CONFIG_KVM
@@ -1942,38 +1705,6 @@ static const TypeInfo host_arm_cpu_type_info = {
 
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
index 0000000000..17db6b334b
--- /dev/null
+++ b/target/arm/cpu32.c
@@ -0,0 +1,274 @@
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
+#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+
+#ifndef CONFIG_USER_ONLY
+static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    /*
+     * Linux wants the number of processors from here.
+     * Might as well set the interrupt-controller bit too.
+     */
+    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
+}
+#endif
+
+const ARMCPRegInfo cortexa15_cp_reginfo[] = {
+#ifndef CONFIG_USER_ONLY
+    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
+      .writefn = arm_cp_write_ignore, },
+#endif
+    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
+void cortex_a15_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a15";
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
+    cpu->midr = 0x412fc0f1;
+    cpu->reset_fpsid = 0x410430f0;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x11111111;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x02010555;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01240000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x10011142;
+    cpu->isar.dbgdidr = 0x3515f021;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
+}
+
+#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
+
+/* we can move this to tcg/ after the cleanup of ARM boards configurations */
+static const ARMCPUInfo arm32_cpus[] = {
+#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
+#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
+};
+
+static gchar *arm32_gdb_arch_name(CPUState *cs)
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
+static void arm32_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int i;
+
+    assert(!is_a64(env));
+
+    for (i = 0; i < 16; i++) {
+        qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
+        if ((i % 4) == 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        uint32_t xpsr = xpsr_read(env);
+        const char *mode;
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            ns_status = env->v7m.secure ? "S " : "NS ";
+        }
+
+        if (xpsr & XPSR_EXCP) {
+            mode = "handler";
+        } else {
+            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_MASK) {
+                mode = "unpriv-thread";
+            } else {
+                mode = "priv-thread";
+            }
+        }
+
+        qemu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
+                     xpsr,
+                     xpsr & XPSR_N ? 'N' : '-',
+                     xpsr & XPSR_Z ? 'Z' : '-',
+                     xpsr & XPSR_C ? 'C' : '-',
+                     xpsr & XPSR_V ? 'V' : '-',
+                     xpsr & XPSR_T ? 'T' : 'A',
+                     ns_status,
+                     mode);
+    } else {
+        uint32_t psr = cpsr_read(env);
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_EL3) &&
+            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
+            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+        }
+
+        qemu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
+                     psr,
+                     psr & CPSR_N ? 'N' : '-',
+                     psr & CPSR_Z ? 'Z' : '-',
+                     psr & CPSR_C ? 'C' : '-',
+                     psr & CPSR_V ? 'V' : '-',
+                     psr & CPSR_T ? 'T' : 'A',
+                     ns_status,
+                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
+    }
+
+    if (flags & CPU_DUMP_FPU) {
+        int numvfpregs = 0;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            numvfpregs = 32;
+        } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
+            numvfpregs = 16;
+        }
+        for (i = 0; i < numvfpregs; i++) {
+            uint64_t v = *aa32_vfp_dreg(env, i);
+            qemu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
+                         i * 2, (uint32_t)v,
+                         i * 2 + 1, (uint32_t)(v >> 32),
+                         i, v);
+        }
+        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+    }
+}
+
+void arm32_cpu_class_init(ObjectClass *oc, void *data)
+{
+    CPUClass *cc = CPU_CLASS(oc);
+
+    cc->gdb_read_register = arm32_cpu_gdb_read_register;
+    cc->gdb_write_register = arm32_cpu_gdb_write_register;
+    cc->gdb_num_core_regs = 26;
+    cc->gdb_core_xml_file = "arm-core.xml";
+    cc->gdb_arch_name = arm32_gdb_arch_name;
+    cc->dump_state = arm32_cpu_dump_state;
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
index 0728f1a431..0a14cca194 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/qemu-print.h"
 #include "cpu.h"
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
@@ -814,6 +815,133 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
+static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint32_t psr = pstate_read(env);
+    int i;
+    int el = arm_current_el(env);
+    const char *ns_status;
+
+    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
+    for (i = 0; i < 32; i++) {
+        if (i == 31) {
+            qemu_fprintf(f, " SP=%016" PRIx64 "\n", env->xregs[i]);
+        } else {
+            qemu_fprintf(f, "X%02d=%016" PRIx64 "%s", i, env->xregs[i],
+                         (i + 2) % 3 ? " " : "\n");
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && el != 3) {
+        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+    } else {
+        ns_status = "";
+    }
+    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
+                 psr,
+                 psr & PSTATE_N ? 'N' : '-',
+                 psr & PSTATE_Z ? 'Z' : '-',
+                 psr & PSTATE_C ? 'C' : '-',
+                 psr & PSTATE_V ? 'V' : '-',
+                 ns_status,
+                 el,
+                 psr & PSTATE_SP ? 'h' : 't');
+
+    if (cpu_isar_feature(aa64_bti, cpu)) {
+        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
+    }
+    if (!(flags & CPU_DUMP_FPU)) {
+        qemu_fprintf(f, "\n");
+        return;
+    }
+    if (fp_exception_el(env, el) != 0) {
+        qemu_fprintf(f, "    FPU disabled\n");
+        return;
+    }
+    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
+                 vfp_get_fpcr(env), vfp_get_fpsr(env));
+
+    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
+        int j, zcr_len = sve_zcr_len_for_el(env, el);
+
+        for (i = 0; i <= FFR_PRED_NUM; i++) {
+            bool eol;
+            if (i == FFR_PRED_NUM) {
+                qemu_fprintf(f, "FFR=");
+                /* It's last, so end the line.  */
+                eol = true;
+            } else {
+                qemu_fprintf(f, "P%02d=", i);
+                switch (zcr_len) {
+                case 0:
+                    eol = i % 8 == 7;
+                    break;
+                case 1:
+                    eol = i % 6 == 5;
+                    break;
+                case 2:
+                case 3:
+                    eol = i % 3 == 2;
+                    break;
+                default:
+                    /* More than one quadword per predicate.  */
+                    eol = true;
+                    break;
+                }
+            }
+            for (j = zcr_len / 4; j >= 0; j--) {
+                int digits;
+                if (j * 4 + 4 <= zcr_len + 1) {
+                    digits = 16;
+                } else {
+                    digits = (zcr_len % 4 + 1) * 4;
+                }
+                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
+                             env->vfp.pregs[i].p[j],
+                             j ? ":" : eol ? "\n" : " ");
+            }
+        }
+
+        for (i = 0; i < 32; i++) {
+            if (zcr_len == 0) {
+                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
+                             i, env->vfp.zregs[i].d[1],
+                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
+            } else if (zcr_len == 1) {
+                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
+                             ":%016" PRIx64 ":%016" PRIx64 "\n",
+                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
+                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
+            } else {
+                for (j = zcr_len; j >= 0; j--) {
+                    bool odd = (zcr_len - j) % 2 != 0;
+                    if (j == zcr_len) {
+                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
+                    } else if (!odd) {
+                        if (j > 0) {
+                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
+                        } else {
+                            qemu_fprintf(f, "     [%x]=", j);
+                        }
+                    }
+                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
+                                 env->vfp.zregs[i].d[j * 2 + 1],
+                                 env->vfp.zregs[i].d[j * 2],
+                                 odd || j == 0 ? "\n" : ":");
+                }
+            }
+        }
+    } else {
+        for (i = 0; i < 32; i++) {
+            uint64_t *q = aa64_vfp_qreg(env, i);
+            qemu_fprintf(f, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
+                         i, q[1], q[0], (i & 1 ? "\n" : " "));
+        }
+    }
+}
+
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
@@ -823,6 +951,7 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
+    cc->dump_state = aarch64_cpu_dump_state;
 
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
                                    aarch64_cpu_set_aarch64);
@@ -846,7 +975,7 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 }
 
-void aarch64_cpu_register(const ARMCPUInfo *info)
+static void aarch64_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info = {
         .parent = TYPE_AARCH64_CPU,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 1d9b59ad5f..d120250b18 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -19,6 +19,7 @@
 #include "hw/boards.h"
 #endif
 #include "cpregs.h"
+#include "cpu32.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -377,30 +378,6 @@ static void cortex_a9_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
 
-#ifndef CONFIG_USER_ONLY
-static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    /*
-     * Linux wants the number of processors from here.
-     * Might as well set the interrupt-controller bit too.
-     */
-    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
-}
-#endif
-
-static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
-#ifndef CONFIG_USER_ONLY
-    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
-      .writefn = arm_cp_write_ignore, },
-#endif
-    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
-};
-
 static void cortex_a7_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -447,48 +424,6 @@ static void cortex_a7_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
 
-static void cortex_a15_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a15";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
-    cpu->reset_fpsid = 0x410430f0;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x11111111;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x00001131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x02010555;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x10011142;
-    cpu->isar.dbgdidr = 0x3515f021;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
-}
-
 static void cortex_m0_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1020,7 +955,6 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
     { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
@@ -1071,7 +1005,7 @@ static void arm_tcg_cpu_register_types(void)
 
     type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
-        arm_cpu_register(&arm_tcg_cpus[i]);
+        arm32_cpu_register(&arm_tcg_cpus[i]);
     }
 }
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 0645415f44..93c668c5a1 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -34,7 +34,7 @@ typedef struct RegisterSysregXmlParam {
    We hack round this by giving the FPA regs zero size when talking to a
    newer gdb.  */
 
-int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int arm32_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -69,7 +69,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int arm32_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 8fa0b12510..e4ff9a0534 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,7 @@
 arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpu.c',
+  'cpu32.c',
   'gdbstub.c',
   'cpu_tcg.c',
   'cpu-mmu.c',
@@ -18,6 +19,10 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
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


