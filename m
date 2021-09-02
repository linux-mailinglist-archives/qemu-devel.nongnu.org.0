Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F783FEE05
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:49:35 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLm9u-00032j-Jc
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mLm2J-0005nU-6O
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35992 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mLm2C-00061Z-PB
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:42 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxYctjxjBha2YCAA--.7003S4;
 Thu, 02 Sep 2021 20:41:15 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/21] target/loongarch: Add core definition
Date: Thu,  2 Sep 2021 20:40:48 +0800
Message-Id: <1630586467-22463-3-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxYctjxjBha2YCAA--.7003S4
X-Coremail-Antispam: 1UD129KBjvAXoWfXr17Cr4Dtry7JrWUuFWruFg_yoW8Jw4fJo
 W5ZFy3Xw48Gr4SvasY9rnIqay2qFy8CFW5Aa4xZw4Uu3W8try5Gr98Kw1FvFy7XrZ5GrW7
 CasagFnxJ347Jrn3n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, maobibo@loongson.cn,
 mrolnik@gmail.com, shorne@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, palmer@dabbelt.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add target state header, target definitions
and initialization routines.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu-param.h |  19 +++
 target/loongarch/cpu.c       | 285 +++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h       | 145 ++++++++++++++++++++++
 target/loongarch/internals.h |  23 ++++
 4 files changed, 472 insertions(+)
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/internals.h

diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
new file mode 100644
index 0000000..83f9624
--- /dev/null
+++ b/target/loongarch/cpu-param.h
@@ -0,0 +1,19 @@
+/*
+ * LoongArch cpu parameters for qemu.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_CPU_PARAM_H
+#define LOONGARCH_CPU_PARAM_H 1
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
index 0000000..b89bf51
--- /dev/null
+++ b/target/loongarch/cpu.c
@@ -0,0 +1,285 @@
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
+    "r0", "ra", "tp", "sp", "a0", "a1", "a2", "a3",
+    "a4", "a5", "a6", "a7", "t0", "t1", "t2", "t3",
+    "t4", "t5", "t6", "t7", "t8", "x0", "fp", "s0",
+    "s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8",
+};
+
+const char * const fregnames[] = {
+    "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
+    "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
+    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
+    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
+};
+
+static const char * const excp_names[EXCP_LAST + 1] = {
+    [EXCP_ADE] = "Address error",
+    [EXCP_SYSCALL] = "Syscall",
+    [EXCP_BREAK] = "Break",
+    [EXCP_INE] = "Inst. Not Exist",
+    [EXCP_FPE] = "Floating Point Exception",
+};
+
+const char *loongarch_exception_name(int32_t exception)
+{
+    if (exception < 0 || exception > EXCP_LAST) {
+        return "unknown";
+    }
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
+static void set_loongarch_cpucfg(CPULoongArchState *env)
+{
+    int i;
+
+    for (i = 0; i < 15; i++) {
+        env->cpucfg[i] = 0x0;
+    }
+    env->cpucfg[0] = 0x14c010;
+    env->cpucfg[1] = 0x3f2f2fe;
+    env->cpucfg[2] = 0x60c3cf;
+    env->cpucfg[3] = 0xcff;
+    env->cpucfg[4] = 0x5f5e100;
+    env->cpucfg[5] = 0x10001;
+    env->cpucfg[10] = 0x2c3d;
+    env->cpucfg[11] = 0x6080003;
+    env->cpucfg[12] = 0x6080003;
+    env->cpucfg[13] = 0x60800f;
+    env->cpucfg[14] = 0x60f000f;
+}
+
+/* LoongArch CPU definitions */
+static void loongarch_3a5000_initfn(Object *obj)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
+    CPULoongArchState *env = &cpu->env;
+
+    set_loongarch_cpucfg(env);
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
+    set_loongarch_cpucfg(env);
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
+static bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    env->badaddr = address;
+    cs->exception_index = EXCP_ADE;
+    do_raise_exception(env, cs->exception_index, retaddr);
+}
+
+static struct TCGCPUOps loongarch_tcg_ops = {
+    .initialize = loongarch_translate_init,
+    .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+    .tlb_fill = loongarch_cpu_tlb_fill,
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
index 0000000..a0348d0
--- /dev/null
+++ b/target/loongarch/cpu.h
@@ -0,0 +1,145 @@
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_CPU_H
+#define LOONGARCH_CPU_H
+
+#include "exec/cpu-defs.h"
+#include "fpu/softfloat-types.h"
+
+#define TCG_GUEST_DEFAULT_MO (0)
+
+#define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
+#define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
+#define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
+#define FCSR0_RM    8            /* Round Mode bit num on fcsr0 */
+#define GET_FP_CAUSE(reg)        (((reg) >> 24) & 0x1f)
+#define GET_FP_ENABLE(reg)       (reg & 0x1f)
+#define GET_FP_FLAGS(reg)        (((reg) >> 16) & 0x1f)
+#define SET_FP_CAUSE(reg, v)      do { (reg) = ((reg) & ~(0x1f << 24)) | \
+                                               ((v & 0x1f) << 24);       \
+                                     } while (0)
+#define SET_FP_ENABLE(reg, v)     do { (reg) = ((reg) & ~(0x1f) | (v & 0x1f); \
+                                     } while (0)
+#define SET_FP_FLAGS(reg, v)      do { (reg) = ((reg) & ~(0x1f << 16)) | \
+                                               ((v & 0x1f) << 16);       \
+                                     } while (0)
+#define UPDATE_FP_FLAGS(reg, v)   do { (reg) |= ((v & 0x1f) << 16); } while (0)
+
+#define FP_INEXACT        1
+#define FP_UNDERFLOW      2
+#define FP_OVERFLOW       4
+#define FP_DIV0           8
+#define FP_INVALID        16
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
+    uint32_t cpucfg[15];
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
+ * @clock: this CPU input clock (may be connected
+ *         to an output clock from another device).
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
+#define TYPE_LOONGARCH_CPU "loongarch64-cpu"
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
+static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
+                                        target_ulong *pc,
+                                        target_ulong *cs_base,
+                                        uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+}
+
+void loongarch_cpu_list(void);
+
+#define cpu_signal_handler cpu_loongarch_signal_handler
+#define cpu_list loongarch_cpu_list
+
+#define MMU_USER_IDX 3
+
+typedef CPULoongArchState CPUArchState;
+typedef LoongArchCPU ArchCPU;
+
+#include "exec/cpu-all.h"
+
+/* Exceptions */
+enum {
+    EXCP_NONE          = -1,
+    EXCP_ADE           = 0,
+    EXCP_SYSCALL,
+    EXCP_BREAK,
+    EXCP_INE,
+    EXCP_FPE,
+
+    EXCP_LAST = EXCP_FPE,
+};
+
+int cpu_loongarch_signal_handler(int host_signum, void *pinfo, void *puc);
+
+#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
+#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
+
+#endif /* LOONGARCH_CPU_H */
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
new file mode 100644
index 0000000..cfb08df
--- /dev/null
+++ b/target/loongarch/internals.h
@@ -0,0 +1,23 @@
+/*
+ * QEMU LoongArch CPU -- internal functions and types
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_INTERNALS_H
+#define LOONGARCH_INTERNALS_H
+
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


