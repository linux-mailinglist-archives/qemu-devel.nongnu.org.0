Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904943D0B9F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:57:36 +0200 (CEST)
Received: from localhost ([::1]:34810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68yt-0001iA-MH
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68ux-0002DI-Dl
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49412 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68ut-00022p-Dm
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:31 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S5; 
 Wed, 21 Jul 2021 17:53:20 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/22] target/loongarch: Add core definition
Date: Wed, 21 Jul 2021 17:52:59 +0800
Message-Id: <1626861198-6133-4-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S5
X-Coremail-Antispam: 1UD129KBjvAXoWfJFyDKrWkZrWfCFy5Cr4kJFb_yoW8Aw43Go
 W5AFW3Xw4kJr4Skana9rnIqay2qFy8CFW5Aa4xZ3yxu3WxJry5Gr98K34avFy7Xr95WrWU
 CasFgFnxJa43Grn3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add target state header, target definitions 
and initialization routines.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu-param.h |  21 ++++
 target/loongarch/cpu-qom.h   |  40 ++++++
 target/loongarch/cpu.c       | 293 +++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h       | 265 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 619 insertions(+)
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu-qom.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h

diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
new file mode 100644
index 0000000..582ee29
--- /dev/null
+++ b/target/loongarch/cpu-param.h
@@ -0,0 +1,21 @@
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
+#ifdef TARGET_LOONGARCH64
+#define TARGET_LONG_BITS 64
+#define TARGET_PHYS_ADDR_SPACE_BITS 48
+#define TARGET_VIRT_ADDR_SPACE_BITS 48
+#endif
+
+#define TARGET_PAGE_BITS 12
+#define NB_MMU_MODES 4
+
+#endif
diff --git a/target/loongarch/cpu-qom.h b/target/loongarch/cpu-qom.h
new file mode 100644
index 0000000..307ab13
--- /dev/null
+++ b/target/loongarch/cpu-qom.h
@@ -0,0 +1,40 @@
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef QEMU_LOONGARCH_CPU_QOM_H
+#define QEMU_LOONGARCH_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#ifdef TARGET_LOONGARCH64
+#define TYPE_LOONGARCH_CPU "loongarch64-cpu"
+#else
+#error LoongArch 32bit emulation is not implemented yet
+#endif
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
+#endif
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
new file mode 100644
index 0000000..4db2d0f
--- /dev/null
+++ b/target/loongarch/cpu.c
@@ -0,0 +1,293 @@
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
+#include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu.h"
+#include "cpu-csr.h"
+#include "cpu-qom.h"
+
+static const char * const excp_names[EXCP_LAST + 1] = {
+    [EXCP_INTE] = "Interrupt error",
+    [EXCP_ADE] = "Address error",
+    [EXCP_SYSCALL] = "Syscall",
+    [EXCP_BREAK] = "Break",
+    [EXCP_FPDIS] = "FPU Disabled",
+    [EXCP_INE] = "Inst. Not Exist",
+    [EXCP_TRAP] = "Trap",
+    [EXCP_FPE] = "Floating Point Exception",
+    [EXCP_TLBM] = "TLB modified fault",
+    [EXCP_TLBL] = "TLB miss on a load",
+    [EXCP_TLBS] = "TLB miss on a store",
+    [EXCP_TLBPE] = "TLB Privilege Error",
+    [EXCP_TLBXI] = "TLB Execution-Inhibit exception",
+    [EXCP_TLBRI] = "TLB Read-Inhibit exception",
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
+target_ulong exception_resume_pc(CPULoongArchState *env)
+{
+    target_ulong bad_pc;
+
+    bad_pc = env->active_tc.PC;
+
+    return bad_pc;
+}
+
+void QEMU_NORETURN do_raise_exception_err(CPULoongArchState *env,
+                                          uint32_t exception,
+                                          int error_code,
+                                          uintptr_t pc)
+{
+    CPUState *cs = env_cpu(env);
+
+    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
+                  __func__,
+                  exception,
+                  loongarch_exception_name(exception),
+                  error_code);
+    cs->exception_index = exception;
+    env->error_code = error_code;
+
+    cpu_loop_exit_restore(cs, pc);
+}
+
+static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    env->active_tc.PC = value & ~(target_ulong)1;
+}
+
+#ifdef CONFIG_TCG
+static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
+                                              const TranslationBlock *tb)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    env->active_tc.PC = tb->pc;
+    env->hflags &= ~LOONGARCH_HFLAG_BMASK;
+    env->hflags |= tb->flags & LOONGARCH_HFLAG_BMASK;
+}
+#endif /* CONFIG_TCG */
+
+static bool loongarch_cpu_has_work(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool has_work = false;
+
+    if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+        cpu_loongarch_hw_interrupts_pending(env)) {
+            has_work = true;
+    }
+
+    return has_work;
+}
+
+static void set_loongarch_feature(CPULoongArchState *env, int feature)
+{
+    env->features |= (1ULL << feature);
+}
+
+static void set_loongarch_csr(CPULoongArchState *env)
+{
+    env->CSR_PRCFG1 = 0x72f8;
+    env->CSR_PRCFG2 = 0x3ffff000;
+    env->CSR_PRCFG3 = 0x8073f2;
+    env->CSR_CRMD = 0xa8;
+    env->CSR_ECFG = 0x70000;
+    env->CSR_STLBPGSIZE = 0xe;
+    env->CSR_RVACFG = 0x0;
+    env->CSR_MCSR0 = 0x3f2f2fe0014c010;
+    env->CSR_MCSR1 = 0xcff0060c3cf;
+    env->CSR_MCSR2 = 0x1000105f5e100;
+    env->CSR_MCSR3 = 0x0;
+    env->CSR_MCSR8 = 0x608000300002c3d;
+    env->CSR_MCSR9 = 0x608000f06080003;
+    env->CSR_MCSR10 = 0x60f000f;
+    env->CSR_MCSR24 = 0x0;
+}
+
+/* LoongArch CPU definitions */
+static void loongarch_3a5000_initfn(Object *obj)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
+    CPULoongArchState *env = &cpu->env;
+
+    set_loongarch_feature(env, LA_FEATURE_3A5000);
+    set_loongarch_csr(env);
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
+static void fpu_init(CPULoongArchState *env)
+{
+    memcpy(&env->active_fpu, &env->fpus[0], sizeof(env->active_fpu));
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
+    memset(env, 0, offsetof(CPULoongArchState, end_reset_fields));
+
+    set_loongarch_csr(env);
+    env->current_tc = 0;
+    env->active_fpu.fcsr0_mask = 0x1f1f03df;
+    env->active_fpu.fcsr0 = 0x0;
+
+    compute_hflags(env);
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
+    LoongArchCPU *cpu = LOONGARCH_CPU(dev);
+    CPULoongArchState *env = &cpu->env;
+    LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    env->exception_base = 0x1C000000;
+
+    fpu_init(env);
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
+    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu, 0);
+}
+
+static char *loongarch_cpu_type_name(const char *cpu_model)
+{
+    return g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
+}
+
+static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
+{
+    ObjectClass *oc;
+    char *typename;
+
+    typename = loongarch_cpu_type_name(cpu_model);
+    oc = object_class_by_name(typename);
+    g_free(typename);
+    return oc;
+}
+
+static Property loongarch_cpu_properties[] = {
+    DEFINE_PROP_INT32("core-id", LoongArchCPU, core_id, -1),
+    DEFINE_PROP_UINT32("id", LoongArchCPU, id, UNASSIGNED_CPU_ID),
+    DEFINE_PROP_INT32("node-id", LoongArchCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps loongarch_tcg_ops = {
+    .initialize = loongarch_tcg_init,
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
+    device_class_set_props(dc, loongarch_cpu_properties);
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
index 0000000..ab1aeb6
--- /dev/null
+++ b/target/loongarch/cpu.h
@@ -0,0 +1,265 @@
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
+#include "hw/clock.h"
+#include "cpu-qom.h"
+#include "cpu-csr.h"
+
+#define TCG_GUEST_DEFAULT_MO (0)
+#define UNASSIGNED_CPU_ID 0xFFFFFFFF
+
+typedef union fpr_t fpr_t;
+union fpr_t {
+    float64  fd;   /* ieee double precision */
+    float32  fs[2];/* ieee single precision */
+    uint64_t d;    /* binary double fixed-point */
+    uint32_t w[2]; /* binary single fixed-point */
+};
+
+/*
+ * define FP_ENDIAN_IDX to access the same location
+ * in the fpr_t union regardless of the host endianness
+ */
+#if defined(HOST_WORDS_BIGENDIAN)
+#  define FP_ENDIAN_IDX 1
+#else
+#  define FP_ENDIAN_IDX 0
+#endif
+
+typedef struct CPULoongArchFPUContext CPULoongArchFPUContext;
+struct CPULoongArchFPUContext {
+    /* Floating point registers */
+    fpr_t fpr[32];
+    float_status fp_status;
+
+    bool cf[8];
+    /*
+     * fcsr0
+     * 31:29 |28:24 |23:21 |20:16 |15:10 |9:8 |7  |6  |5 |4:0
+     *        Cause         Flags         RM   DAE TM     Enables
+     */
+    uint32_t fcsr0;
+    uint32_t fcsr0_mask;
+    uint32_t vcsr16;
+
+#define FCSR0_M1    0xdf         /* FCSR1 mask, DAE, TM and Enables */
+#define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
+#define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
+#define FCSR0_RM    8            /* Round Mode bit num on fcsr0 */
+#define GET_FP_CAUSE(reg)        (((reg) >> 24) & 0x1f)
+#define GET_FP_ENABLE(reg)       (((reg) >>  0) & 0x1f)
+#define GET_FP_FLAGS(reg)        (((reg) >> 16) & 0x1f)
+#define SET_FP_CAUSE(reg, v)      do { (reg) = ((reg) & ~(0x1f << 24)) | \
+                                               ((v & 0x1f) << 24);       \
+                                     } while (0)
+#define SET_FP_ENABLE(reg, v)     do { (reg) = ((reg) & ~(0x1f <<  0)) | \
+                                               ((v & 0x1f) << 0);        \
+                                     } while (0)
+#define SET_FP_FLAGS(reg, v)      do { (reg) = ((reg) & ~(0x1f << 16)) | \
+                                               ((v & 0x1f) << 16);       \
+                                     } while (0)
+#define UPDATE_FP_FLAGS(reg, v)   do { (reg) |= ((v & 0x1f) << 16); } while (0)
+#define FP_INEXACT        1
+#define FP_UNDERFLOW      2
+#define FP_OVERFLOW       4
+#define FP_DIV0           8
+#define FP_INVALID        16
+};
+
+#define TARGET_INSN_START_EXTRA_WORDS 2
+#define LOONGARCH_FPU_MAX 1
+#define N_IRQS      14
+
+enum loongarch_feature {
+    LA_FEATURE_3A5000,
+};
+
+typedef struct TCState TCState;
+struct TCState {
+    target_ulong gpr[32];
+    target_ulong PC;
+};
+
+typedef struct CPULoongArchState CPULoongArchState;
+struct CPULoongArchState {
+    TCState active_tc;
+    CPULoongArchFPUContext active_fpu;
+
+    uint32_t current_tc;
+    uint64_t scr[4];
+    uint32_t current_fpu;
+
+    /* LoongArch CSR register */
+    CPU_LOONGARCH_CSR
+    target_ulong lladdr; /* LL virtual address compared against SC */
+    target_ulong llval;
+
+    CPULoongArchFPUContext fpus[LOONGARCH_FPU_MAX];
+
+    /* QEMU */
+    int error_code;
+    uint32_t hflags;    /* CPU State */
+#define TLB_NOMATCH   0x1
+#define INST_INAVAIL  0x2 /* Invalid instruction word for BadInstr */
+    /* TMASK defines different execution modes */
+#define LOONGARCH_HFLAG_TMASK  0x1F5807FF
+#define LOONGARCH_HFLAG_KU     0x00003 /* kernel/supervisor/user mode mask   */
+#define LOONGARCH_HFLAG_UM     0x00003 /* user mode flag                     */
+#define LOONGARCH_HFLAG_KM     0x00000 /* kernel mode flag                   */
+#define LOONGARCH_HFLAG_64     0x00008 /* 64-bit instructions enabled        */
+#define LOONGARCH_HFLAG_FPU    0x00020 /* FPU enabled                        */
+#define LOONGARCH_HFLAG_F64    0x00040 /* 64-bit FPU enabled                 */
+#define LOONGARCH_HFLAG_BMASK  0x3800
+#define LOONGARCH_HFLAG_B      0x00800 /* Unconditional branch               */
+#define LOONGARCH_HFLAG_BC     0x01000 /* Conditional branch                 */
+#define LOONGARCH_HFLAG_BR     0x02000 /* branch to register (can't link TB) */
+#define LOONGARCH_HFLAG_FRE   0x2000000 /* FRE enabled */
+#define LOONGARCH_HFLAG_ELPA  0x4000000
+    target_ulong btarget;        /* Jump / branch target               */
+    target_ulong bcond;          /* Branch condition (if needed)       */
+
+    /* Fields up to this point are cleared by a CPU reset */
+    struct {} end_reset_fields;
+
+    /* Fields after this point are preserved across CPU reset. */
+    uint64_t features;
+    void *irq[N_IRQS];
+    QEMUTimer *timer; /* Internal timer */
+    target_ulong exception_base; /* ExceptionBase input to the core */
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
+    Clock *clock;
+    CPUNegativeOffsetState neg;
+    CPULoongArchState env;
+    uint32_t id;
+    int32_t node_id; /* NUMA node this CPU belongs to */
+    int32_t core_id;
+};
+
+target_ulong exception_resume_pc(CPULoongArchState *env);
+
+static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
+                                        target_ulong *pc,
+                                        target_ulong *cs_base,
+                                        uint32_t *flags)
+{
+    *pc = env->active_tc.PC;
+    *cs_base = 0;
+    *flags = env->hflags & (LOONGARCH_HFLAG_TMASK | LOONGARCH_HFLAG_BMASK);
+}
+
+static inline LoongArchCPU *loongarch_env_get_cpu(CPULoongArchState *env)
+{
+    return container_of(env, LoongArchCPU, env);
+}
+
+#define ENV_GET_CPU(e) CPU(loongarch_env_get_cpu(e))
+
+void loongarch_cpu_list(void);
+
+#define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
+
+#define cpu_signal_handler cpu_loongarch_signal_handler
+#define cpu_list loongarch_cpu_list
+
+/* MMU modes definitions */
+#define MMU_MODE0_SUFFIX _kernel
+#define MMU_MODE1_SUFFIX _super
+#define MMU_MODE2_SUFFIX _user
+#define MMU_MODE3_SUFFIX _error
+#define MMU_USER_IDX 2
+
+static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
+{
+    return MMU_USER_IDX;
+}
+
+typedef CPULoongArchState CPUArchState;
+typedef LoongArchCPU ArchCPU;
+
+#include "exec/cpu-all.h"
+
+/* Exceptions */
+enum {
+    EXCP_NONE          = -1,
+    EXCP_INTE          = 0,
+    EXCP_ADE,
+    EXCP_SYSCALL,
+    EXCP_BREAK,
+    EXCP_FPDIS,
+    EXCP_INE,
+    EXCP_TRAP,
+    EXCP_FPE,
+    EXCP_TLBM,
+    EXCP_TLBL,
+    EXCP_TLBS,
+    EXCP_TLBPE,
+    EXCP_TLBXI,
+    EXCP_TLBRI,
+
+    EXCP_LAST = EXCP_TLBRI,
+};
+
+int cpu_loongarch_signal_handler(int host_signum, void *pinfo, void *puc);
+
+#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
+#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
+
+#include "exec/memattrs.h"
+
+void loongarch_tcg_init(void);
+
+void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+
+void QEMU_NORETURN do_raise_exception_err(CPULoongArchState *env,
+                                          uint32_t exception,
+                                          int error_code,
+                                          uintptr_t pc);
+
+static inline void QEMU_NORETURN do_raise_exception(CPULoongArchState *env,
+                                                    uint32_t exception,
+                                                    uintptr_t pc)
+{
+    do_raise_exception_err(env, exception, 0, pc);
+}
+
+static inline void compute_hflags(CPULoongArchState *env)
+{
+    env->hflags &= ~(LOONGARCH_HFLAG_64 | LOONGARCH_HFLAG_FPU |
+                     LOONGARCH_HFLAG_KU | LOONGARCH_HFLAG_ELPA);
+
+    env->hflags |= (env->CSR_CRMD & CSR_CRMD_PLV);
+    env->hflags |= LOONGARCH_HFLAG_64;
+
+    if (env->CSR_EUEN & CSR_EUEN_FPEN) {
+        env->hflags |= LOONGARCH_HFLAG_FPU;
+    }
+}
+
+const char *loongarch_exception_name(int32_t exception);
+
+#endif /* LOONGARCH_CPU_H */
-- 
1.8.3.1


