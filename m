Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583A4683EC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 11:02:37 +0100 (CET)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtRsJ-0005AH-Mf
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 05:02:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mtRSF-0004w3-D3
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:35:39 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39380 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mtRS9-0004Z2-CU
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:35:39 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx78r1NKthpt0CAA--.6875S4;
 Sat, 04 Dec 2021 17:29:33 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 02/26] target/loongarch: Add core definition
Date: Sat,  4 Dec 2021 17:29:01 +0800
Message-Id: <1638610165-15036-3-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dx78r1NKthpt0CAA--.6875S4
X-Coremail-Antispam: 1UD129KBjvAXoW3trykKw47ZFW7Gw1fKr18AFb_yoW8AF47Co
 WrAF4Iq3yrJw1xCa1q9rnYqa4jgry8CF4kC3WI9r409a4xtr98KFyrKw1SkF17Jrn8WFy8
 u3y29Fn3GrW2qr1xn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds target state header, target definitions
and initialization routines.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu-param.h |  18 +++
 target/loongarch/cpu.c       | 313 +++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h       | 252 ++++++++++++++++++++++++++++++++++
 target/loongarch/internals.h |  21 +++
 4 files changed, 604 insertions(+)
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/internals.h

diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
new file mode 100644
index 0000000..9a769b6
--- /dev/null
+++ b/target/loongarch/cpu-param.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch CPU parameters for QEMU.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_CPU_PARAM_H
+#define LOONGARCH_CPU_PARAM_H
+
+#define TARGET_LONG_BITS 64
+#define TARGET_PHYS_ADDR_SPACE_BITS 48
+#define TARGET_VIRT_ADDR_SPACE_BITS 48
+
+#define TARGET_PAGE_BITS 14
+#define NB_MMU_MODES 4
+
+#endif
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
new file mode 100644
index 0000000..05ceb9c
--- /dev/null
+++ b/target/loongarch/cpu.c
@@ -0,0 +1,313 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/qemu-print.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "sysemu/qtest.h"
+#include "exec/exec-all.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu.h"
+#include "internals.h"
+#include "fpu/softfloat-helpers.h"
+
+const char * const regnames[] = {
+    "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
+    "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
+    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
+    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
+};
+
+const char * const fregnames[] = {
+    "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",
+    "f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",
+    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
+    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
+};
+
+static const char * const excp_names[EXCP_LAST + 1] = {
+    [EXCP_SYSCALL] = "Syscall",
+    [EXCP_BREAK] = "Break",
+    [EXCP_INE] = "Instruction Non-existent",
+    [EXCP_FPE] = "Floating Point Exception",
+};
+
+const char *loongarch_exception_name(int32_t exception)
+{
+    return excp_names[exception];
+}
+
+void QEMU_NORETURN do_raise_exception(CPULoongArchState *env,
+                                      uint32_t exception,
+                                      uintptr_t pc)
+{
+    CPUState *cs = env_cpu(env);
+
+    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s)\n",
+                  __func__,
+                  exception,
+                  loongarch_exception_name(exception));
+    cs->exception_index = exception;
+
+    cpu_loop_exit_restore(cs, pc);
+}
+
+static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    env->pc = value;
+}
+
+#ifdef CONFIG_TCG
+static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
+                                              const TranslationBlock *tb)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    env->pc = tb->pc;
+}
+#endif /* CONFIG_TCG */
+
+static bool loongarch_cpu_has_work(CPUState *cs)
+{
+    return true;
+}
+
+static void loongarch_3a5000_initfn(Object *obj)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
+    CPULoongArchState *env = &cpu->env;
+    int i;
+
+    for (i = 0; i < 21; i++) {
+        env->cpucfg[i] = 0x0;
+    }
+
+    env->cpucfg[0] = 0x14c010;  /* PRID */
+
+    uint32_t data = 0;
+    data = FIELD_DP32(data, CPUCFG1, ARCH, 2);
+    data = FIELD_DP32(data, CPUCFG1, PGMMU, 1);
+    data = FIELD_DP32(data, CPUCFG1, IOCSR, 1);
+    data = FIELD_DP32(data, CPUCFG1, PALEN, 0x2f);
+    data = FIELD_DP32(data, CPUCFG1, VALEN, 0x2f);
+    data = FIELD_DP32(data, CPUCFG1, UAL, 1);
+    data = FIELD_DP32(data, CPUCFG1, RI, 1);
+    data = FIELD_DP32(data, CPUCFG1, EP, 1);
+    data = FIELD_DP32(data, CPUCFG1, RPLV, 1);
+    data = FIELD_DP32(data, CPUCFG1, HP, 1);
+    data = FIELD_DP32(data, CPUCFG1, IOCSR_BRD, 1);
+    env->cpucfg[1] = data;
+
+    data = 0;
+    data = FIELD_DP32(data, CPUCFG2, FP, 1);
+    data = FIELD_DP32(data, CPUCFG2, FP_SP, 1);
+    data = FIELD_DP32(data, CPUCFG2, FP_DP, 1);
+    data = FIELD_DP32(data, CPUCFG2, FP_VER, 1);
+    data = FIELD_DP32(data, CPUCFG2, LLFTP, 1);
+    data = FIELD_DP32(data, CPUCFG2, LLFTP_VER, 1);
+    data = FIELD_DP32(data, CPUCFG2, LSPW, 1);
+    data = FIELD_DP32(data, CPUCFG2, LAM, 1);
+    env->cpucfg[2] = data;
+
+    env->cpucfg[4] = 0x5f5e100; /* Crystal frequency */
+
+    data = 0;
+    data = FIELD_DP32(data, CPUCFG5, CC_MUL, 1);
+    data = FIELD_DP32(data, CPUCFG5, CC_DIV, 1);
+    env->cpucfg[5] = data;
+
+    data = 0;
+    data = FIELD_DP32(data, CPUCFG16, L1_IUPRE, 1);
+    data = FIELD_DP32(data, CPUCFG16, L1_DPRE, 1);
+    data = FIELD_DP32(data, CPUCFG16, L2_IUPRE, 1);
+    data = FIELD_DP32(data, CPUCFG16, L2_IUUNIFY, 1);
+    data = FIELD_DP32(data, CPUCFG16, L2_IUPRIV, 1);
+    data = FIELD_DP32(data, CPUCFG16, L3_IUPRE, 1);
+    data = FIELD_DP32(data, CPUCFG16, L3_IUUNIFY, 1);
+    data = FIELD_DP32(data, CPUCFG16, L3_IUINCL, 1);
+    env->cpucfg[16] = data;
+
+    data = 0;
+    data = FIELD_DP32(data, CPUCFG17, L1IU_WAYS, 0x8003);
+    data = FIELD_DP32(data, CPUCFG17, L1IU_SETS, 0x60);
+    env->cpucfg[17] =  data;
+
+    data = 0;
+    data = FIELD_DP32(data, CPUCFG18, L1D_WAYS, 0x8003);
+    data = FIELD_DP32(data, CPUCFG18, L1D_SETS, 0x60);
+    env->cpucfg[18] = data;
+
+    data = 0;
+    data = FIELD_DP32(data, CPUCFG19, L2IU_WAYS, 0x800f);
+    data = FIELD_DP32(data, CPUCFG19, L2IU_SETS, 0x60);
+    env->cpucfg[19] = data;
+
+    data = 0;
+    data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 0xf00f);
+    data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 0x60);
+    env->cpucfg[20] = data;
+}
+
+static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+
+    qemu_printf("%s\n", typename);
+}
+
+void loongarch_cpu_list(void)
+{
+    GSList *list;
+    list = object_class_get_list_sorted(TYPE_LOONGARCH_CPU, false);
+    g_slist_foreach(list, loongarch_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
+static void loongarch_cpu_reset(DeviceState *dev)
+{
+    CPUState *cs = CPU(dev);
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
+    CPULoongArchState *env = &cpu->env;
+
+    lacc->parent_reset(dev);
+
+    env->fcsr0_mask = 0x1f1f031f;
+    env->fcsr0 = 0x0;
+
+    cs->exception_index = EXCP_NONE;
+}
+
+static void loongarch_cpu_disas_set_info(CPUState *s, disassemble_info *info)
+{
+    info->print_insn = print_insn_loongarch;
+}
+
+static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    cpu_reset(cs);
+    qemu_init_vcpu(cs);
+
+    lacc->parent_realize(dev, errp);
+}
+
+static void loongarch_cpu_initfn(Object *obj)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
+
+    cpu_set_cpustate_pointers(cpu);
+}
+
+static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
+{
+    ObjectClass *oc;
+    char *typename;
+
+    typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
+    oc = object_class_by_name(typename);
+    g_free(typename);
+    return oc;
+}
+
+void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    int i;
+
+    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
+    qemu_fprintf(f, " FCSR0 0x%08x  fp_status 0x%02x\n", env->fcsr0,
+                 get_float_exception_flags(&env->fp_status));
+
+    /* gpr */
+    for (i = 0; i < 32; i++) {
+        if ((i & 3) == 0) {
+            qemu_fprintf(f, " GPR%02d:", i);
+        }
+        qemu_fprintf(f, " %s %016" PRIx64, regnames[i], env->gpr[i]);
+        if ((i & 3) == 3) {
+            qemu_fprintf(f, "\n");
+        }
+    }
+
+    /* fpr */
+    if (flags & CPU_DUMP_FPU) {
+        for (i = 0; i < 32; i++) {
+            qemu_fprintf(f, " %s %016" PRIx64, fregnames[i], env->fpr[i]);
+            if ((i & 3) == 3) {
+                qemu_fprintf(f, "\n");
+            }
+        }
+    }
+}
+
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps loongarch_tcg_ops = {
+    .initialize = loongarch_translate_init,
+    .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+};
+#endif /* CONFIG_TCG */
+
+static void loongarch_cpu_class_init(ObjectClass *c, void *data)
+{
+    LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
+    CPUClass *cc = CPU_CLASS(c);
+    DeviceClass *dc = DEVICE_CLASS(c);
+
+    device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
+                                    &lacc->parent_realize);
+    device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
+
+    cc->class_by_name = loongarch_cpu_class_by_name;
+    cc->has_work = loongarch_cpu_has_work;
+    cc->dump_state = loongarch_cpu_dump_state;
+    cc->set_pc = loongarch_cpu_set_pc;
+    cc->disas_set_info = loongarch_cpu_disas_set_info;
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &loongarch_tcg_ops;
+#endif
+}
+
+#define DEFINE_LOONGARCH_CPU_TYPE(model, initfn) \
+    { \
+        .parent = TYPE_LOONGARCH_CPU, \
+        .instance_init = initfn, \
+        .name = LOONGARCH_CPU_TYPE_NAME(model), \
+    }
+
+static const TypeInfo loongarch_cpu_type_infos[] = {
+    {
+        .name = TYPE_LOONGARCH_CPU,
+        .parent = TYPE_CPU,
+        .instance_size = sizeof(LoongArchCPU),
+        .instance_init = loongarch_cpu_initfn,
+
+        .abstract = true,
+        .class_size = sizeof(LoongArchCPUClass),
+        .class_init = loongarch_cpu_class_init,
+    },
+    DEFINE_LOONGARCH_CPU_TYPE("Loongson-3A5000", loongarch_3a5000_initfn),
+};
+
+DEFINE_TYPES(loongarch_cpu_type_infos)
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
new file mode 100644
index 0000000..ab60322
--- /dev/null
+++ b/target/loongarch/cpu.h
@@ -0,0 +1,252 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_CPU_H
+#define LOONGARCH_CPU_H
+
+#include "exec/cpu-defs.h"
+#include "fpu/softfloat-types.h"
+#include "hw/registerfields.h"
+
+#define TCG_GUEST_DEFAULT_MO (0)
+
+#define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
+#define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
+#define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
+#define FCSR0_RM    8            /* Round Mode bit num on fcsr0 */
+
+FIELD(FCSR0, ENABLES, 0, 5)
+FIELD(FCSR0, RM, 8, 2)
+FIELD(FCSR0, FLAGS, 16, 5)
+FIELD(FCSR0, CAUSE, 24, 5)
+
+#define GET_FP_CAUSE(REG)      FIELD_EX32(REG, FCSR0, CAUSE)
+#define SET_FP_CAUSE(REG, V)   FIELD_DP32(REG, FCSR0, CAUSE, V)
+#define GET_FP_ENABLES(REG)    FIELD_EX32(REG, FCSR0, ENABLES)
+#define SET_FP_ENABLES(REG, V) FIELD_DP32(REG, FCSR0, ENABLES, V)
+#define GET_FP_FLAGS(REG)      FIELD_EX32(REG, FCSR0, FLAGS)
+#define SET_FP_FLAGS(REG, V)   FIELD_DP32(REG, FCSR0, FLAGS, V)
+#define UPDATE_FP_FLAGS(REG, V) \
+    do { \
+        (REG) |= FIELD_DP32(0, FCSR0, FLAGS, V); \
+    } while (0)
+
+#define FP_INEXACT        1
+#define FP_UNDERFLOW      2
+#define FP_OVERFLOW       4
+#define FP_DIV0           8
+#define FP_INVALID        16
+
+/* cpucfg[0] bits */
+FIELD(CPUCFG0, PRID, 0, 32)
+
+/* cpucfg[1] bits */
+FIELD(CPUCFG1, ARCH, 0, 2)
+FIELD(CPUCFG1, PGMMU, 2, 1)
+FIELD(CPUCFG1, IOCSR, 3, 1)
+FIELD(CPUCFG1, PALEN, 4, 8)
+FIELD(CPUCFG1, VALEN, 12, 8)
+FIELD(CPUCFG1, UAL, 20, 1)
+FIELD(CPUCFG1, RI, 21, 1)
+FIELD(CPUCFG1, EP, 22, 1)
+FIELD(CPUCFG1, RPLV, 23, 1)
+FIELD(CPUCFG1, HP, 24, 1)
+FIELD(CPUCFG1, IOCSR_BRD, 25, 1)
+FIELD(CPUCFG1, MSG_INT, 26, 1)
+
+/* cpucfg[2] bits */
+FIELD(CPUCFG2, FP, 0, 1)
+FIELD(CPUCFG2, FP_SP, 1, 1)
+FIELD(CPUCFG2, FP_DP, 2, 1)
+FIELD(CPUCFG2, FP_VER, 3, 3)
+FIELD(CPUCFG2, LSX, 6, 1)
+FIELD(CPUCFG2, LASX, 7, 1)
+FIELD(CPUCFG2, COMPLEX, 8, 1)
+FIELD(CPUCFG2, CRYPTO, 9, 1)
+FIELD(CPUCFG2, LVZ, 10, 1)
+FIELD(CPUCFG2, LVZ_VER, 11, 3)
+FIELD(CPUCFG2, LLFTP, 14, 1)
+FIELD(CPUCFG2, LLFTP_VER, 15, 3)
+FIELD(CPUCFG2, LBT_X86, 18, 1)
+FIELD(CPUCFG2, LBT_ARM, 19, 1)
+FIELD(CPUCFG2, LBT_MIPS, 20, 1)
+FIELD(CPUCFG2, LSPW, 21, 1)
+FIELD(CPUCFG2, LAM, 22, 1)
+
+/* cpucfg[3] bits */
+FIELD(CPUCFG3, CCDMA, 0, 1)
+FIELD(CPUCFG3, SFB, 1, 1)
+FIELD(CPUCFG3, UCACC, 2, 1)
+FIELD(CPUCFG3, LLEXC, 3, 1)
+FIELD(CPUCFG3, SCDLY, 4, 1)
+FIELD(CPUCFG3, LLDBAR, 5, 1)
+FIELD(CPUCFG3, ITLBHMC, 6, 1)
+FIELD(CPUCFG3, ICHMC, 7, 1)
+FIELD(CPUCFG3, SPW_LVL, 8, 3)
+FIELD(CPUCFG3, SPW_HP_HF, 11, 1)
+FIELD(CPUCFG3, RVA, 12, 1)
+FIELD(CPUCFG3, RVAMAX, 13, 4)
+
+/* cpucfg[4] bits */
+FIELD(CPUCFG4, CC_FREQ, 0, 32)
+
+/* cpucfg[5] bits */
+FIELD(CPUCFG5, CC_MUL, 0, 16)
+FIELD(CPUCFG5, CC_DIV, 16, 16)
+
+/* cpucfg[6] bits */
+FIELD(CPUCFG6, PMP, 0, 1)
+FIELD(CPUCFG6, PMVER, 1, 3)
+FIELD(CPUCFG6, PMNUM, 4, 4)
+FIELD(CPUCFG6, PMBITS, 8, 6)
+FIELD(CPUCFG6, UPM, 14, 1)
+
+/* cpucfg[16] bits */
+FIELD(CPUCFG16, L1_IUPRE, 0, 1)
+FIELD(CPUCFG16, L1_IUUNIFY, 1, 1)
+FIELD(CPUCFG16, L1_DPRE, 2, 1)
+FIELD(CPUCFG16, L2_IUPRE, 3, 1)
+FIELD(CPUCFG16, L2_IUUNIFY, 4, 1)
+FIELD(CPUCFG16, L2_IUPRIV, 5, 1)
+FIELD(CPUCFG16, L2_IUINCL, 6, 1)
+FIELD(CPUCFG16, L2_DPRE, 7, 1)
+FIELD(CPUCFG16, L2_DPRIV, 8, 1)
+FIELD(CPUCFG16, L2_DINCL, 9, 1)
+FIELD(CPUCFG16, L3_IUPRE, 10, 1)
+FIELD(CPUCFG16, L3_IUUNIFY, 11, 1)
+FIELD(CPUCFG16, L3_IUPRIV, 12, 1)
+FIELD(CPUCFG16, L3_IUINCL, 13, 1)
+FIELD(CPUCFG16, L3_DPRE, 14, 1)
+FIELD(CPUCFG16, L3_DPRIV, 15, 1)
+FIELD(CPUCFG16, L3_DINCL, 16, 1)
+
+/* cpucfg[17] bits */
+FIELD(CPUCFG17, L1IU_WAYS, 0, 16)
+FIELD(CPUCFG17, L1IU_SETS, 16, 8)
+FIELD(CPUCFG17, L1IU_SIZE, 24, 7)
+
+/* cpucfg[18] bits */
+FIELD(CPUCFG18, L1D_WAYS, 0, 16)
+FIELD(CPUCFG18, L1D_SETS, 16, 8)
+FIELD(CPUCFG18, L1D_SIZE, 24, 7)
+
+/* cpucfg[19] bits */
+FIELD(CPUCFG19, L2IU_WAYS, 0, 16)
+FIELD(CPUCFG19, L2IU_SETS, 16, 8)
+FIELD(CPUCFG19, L2IU_SIZE, 24, 7)
+
+/* cpucfg[20] bits */
+FIELD(CPUCFG20, L3IU_WAYS, 0, 16)
+FIELD(CPUCFG20, L3IU_SETS, 16, 8)
+FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
+
+extern const char * const regnames[];
+extern const char * const fregnames[];
+
+typedef struct CPULoongArchState CPULoongArchState;
+struct CPULoongArchState {
+    uint64_t gpr[32];
+    uint64_t pc;
+
+    uint64_t fpr[32];
+    float_status fp_status;
+    bool cf[8];
+
+    /*
+     * fcsr0
+     * 31:29 |28:24 |23:21 |20:16 |15:10 |9:8 |7:5 |4:0
+     *        Cause         Flags         RM        Enables
+     */
+    uint32_t fcsr0;
+    uint32_t fcsr0_mask;
+
+    uint32_t cpucfg[21];
+
+    uint64_t lladdr; /* LL virtual address compared against SC */
+    uint64_t llval;
+
+    uint64_t badaddr;
+};
+
+/**
+ * LoongArchCPU:
+ * @env: #CPULoongArchState
+ *
+ * A LoongArch CPU.
+ */
+struct LoongArchCPU {
+    /*< private >*/
+    CPUState parent_obj;
+    /*< public >*/
+
+    CPUNegativeOffsetState neg;
+    CPULoongArchState env;
+};
+
+#define TYPE_LOONGARCH_CPU "loongarch-cpu"
+
+OBJECT_DECLARE_TYPE(LoongArchCPU, LoongArchCPUClass,
+                    LOONGARCH_CPU)
+
+/**
+ * LoongArchCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_reset: The parent class' reset handler.
+ *
+ * A LoongArch CPU model.
+ */
+struct LoongArchCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+
+    DeviceRealize parent_realize;
+    DeviceReset parent_reset;
+};
+
+#define MMU_USER_IDX 3
+
+static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
+{
+    return MMU_USER_IDX;
+}
+
+static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
+                                        target_ulong *pc,
+                                        target_ulong *cs_base,
+                                        uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = cpu_mmu_index(env, false);
+}
+
+void loongarch_cpu_list(void);
+
+#define cpu_list loongarch_cpu_list
+
+typedef CPULoongArchState CPUArchState;
+typedef LoongArchCPU ArchCPU;
+
+#include "exec/cpu-all.h"
+
+/* Exceptions */
+enum {
+    EXCP_NONE          = -1,
+    EXCP_SYSCALL       = 0,
+    EXCP_BREAK,
+    EXCP_INE,
+    EXCP_FPE,
+
+    EXCP_LAST = EXCP_FPE,
+};
+
+#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
+#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
+
+#endif /* LOONGARCH_CPU_H */
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
new file mode 100644
index 0000000..1e69e7d
--- /dev/null
+++ b/target/loongarch/internals.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU -- internal functions and types
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_INTERNALS_H
+#define LOONGARCH_INTERNALS_H
+
+void loongarch_translate_init(void);
+
+void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+
+void QEMU_NORETURN do_raise_exception(CPULoongArchState *env,
+                                      uint32_t exception,
+                                      uintptr_t pc);
+
+const char *loongarch_exception_name(int32_t exception);
+
+#endif
-- 
1.8.3.1


