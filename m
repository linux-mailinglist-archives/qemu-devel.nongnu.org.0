Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A53B5DB4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:11:18 +0200 (CEST)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq6e-0002Jb-TU
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0Z-0002AG-Sp
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:04:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45326 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0T-00015F-Lm
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:04:59 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S5;
 Mon, 28 Jun 2021 20:04:46 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/20] target/loongarch: Add core definition
Date: Mon, 28 Jun 2021 20:04:28 +0800
Message-Id: <1624881885-31692-4-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S5
X-Coremail-Antispam: 1UD129KBjvAXoWfWF1DWF1DJw18uFWrAw4Dtwb_yoW5GF4fZo
 W8AFWfXa18Jr1Ska9a93sIg3y2qry8CF4DAa40vrWxWa18tay5GrykK34avFy7Xr95XrW7
 CasFg3ZrJay7Crn3n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add target state header,target definitions
and initialization routines.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu-param.h |  21 ++
 target/loongarch/cpu-qom.h   |  41 ++++
 target/loongarch/cpu.c       | 451 +++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h       | 245 +++++++++++++++++++++++
 target/loongarch/internal.h  |  74 +++++++
 5 files changed, 832 insertions(+)
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu-qom.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/internal.h

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
index 0000000..ce14d13
--- /dev/null
+++ b/target/loongarch/cpu-qom.h
@@ -0,0 +1,41 @@
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
+    const struct loongarch_def_t *cpu_def;
+};
+
+#endif
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
new file mode 100644
index 0000000..b368e79
--- /dev/null
+++ b/target/loongarch/cpu.c
@@ -0,0 +1,451 @@
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
+#include "internal.h"
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
+#define LOONGARCH_CONFIG1                                                   \
+((0x8 << CSR_CONF1_KSNUM_SHIFT) | (0x2f << CSR_CONF1_TMRBITS_SHIFT) |       \
+ (0x7 << CSR_CONF1_VSMAX_SHIFT))
+
+#define LOONGARCH_CONFIG3                                                   \
+((0x2 << CSR_CONF3_TLBORG_SHIFT) | (0x3f << CSR_CONF3_MTLBSIZE_SHIFT) |     \
+ (0x7 << CSR_CONF3_STLBWAYS_SHIFT) | (0x8 << CSR_CONF3_STLBIDX_SHIFT))
+
+#define LOONGARCH_MCSR0                                                     \
+((0x0UL << MCSR0_GR32_SHIFT) | (0x1UL << MCSR0_GR64_SHIFT) |                \
+ (0x1UL << MCSR0_PAGING_SHIFT) | (0x1UL << MCSR0_IOCSR_SHIFT) |             \
+ (0x2fUL << MCSR0_PABIT_SHIFT) | (0x2fUL << MCSR0_VABIT_SHIFT) |            \
+ (0x1UL << MCSR0_UAL_SHIFT) | (0x1UL << MCSR0_RI_SHIFT) |                   \
+ (0x1UL << MCSR0_EXEPROT_SHIFT) | (0x1UL << MCSR0_RPLVTLB_SHIFT) |          \
+ (0x1UL << MCSR0_HUGEPG_SHIFT) | (0x1UL << MCSR0_IOCSR_BRD_SHIFT) |         \
+ (0x0UL << MCSR0_INT_IMPL_SHIFT) | MCSR0_PRID)
+
+#define LOONGARCH_MCSR1                                                     \
+((0x1UL << MCSR1_FP_SHIFT) | (0x1UL << MCSR1_FPSP_SHIFT) |                  \
+ (0x1UL << MCSR1_FPDP_SHIFT) | (0x1UL << MCSR1_FPVERS_SHIFT) |              \
+ (0x1UL << MCSR1_LSX_SHIFT) | (0x1UL << MCSR1_LASX_SHIFT) |                 \
+ (0x1UL << MCSR1_COMPLEX_SHIFT) | (0x1UL << MCSR1_CRYPTO_SHIFT) |           \
+ (0x0UL << MCSR1_VZ_SHIFT) | (0x0UL << MCSR1_VZVERS_SHIFT) |                \
+ (0x1UL << MCSR1_LLFTP_SHIFT) | (0x1UL << MCSR1_LLFTPVERS_SHIFT) |          \
+ (0x0UL << MCSR1_X86BT_SHIFT) | (0x0UL << MCSR1_ARMBT_SHIFT) |              \
+ (0x0UL << MCSR1_LOONGARCHBT_SHIFT) | (0x1UL << MCSR1_LSPW_SHIFT) |         \
+ (0x1UL << MCSR1_LAMO_SHIFT) | (0x1UL << MCSR1_CCDMA_SHIFT) |               \
+ (0x1UL << MCSR1_SFB_SHIFT) | (0x1UL << MCSR1_UCACC_SHIFT) |                \
+ (0x1UL << MCSR1_LLEXC_SHIFT) | (0x1UL << MCSR1_SCDLY_SHIFT) |              \
+ (0x1UL << MCSR1_LLDBAR_SHIFT) | (0x1UL << MCSR1_ITLBT_SHIFT) |             \
+ (0x1UL << MCSR1_ICACHET_SHIFT) | (0x4UL << MCSR1_SPW_LVL_SHIFT) |          \
+ (0x1UL << MCSR1_HPFOLD_SHIFT))
+
+#define LOONGARCH_MCSR2                                                     \
+((0x1UL << MCSR2_CCMUL_SHIFT) | (0x1UL << MCSR2_CCDIV_SHIFT) | CCFREQ_DEFAULT)
+
+#define LOONGARCH_MCSR3                                                     \
+((0x1UL << MCSR3_PMP_SHIFT) | (0x1UL << MCSR3_PAMVER_SHIFT) |               \
+ (0x3UL << MCSR3_PMNUM_SHIFT) | (0x3fUL < MCSR3_PMBITS_SHIFT) |             \
+ (0x1UL << MCSR3_UPM_SHIFT))
+
+
+#define LOONGARCH_MCSR8                                                     \
+((0x1UL << MCSR8_L1IUPRE_SHIFT)   | (0x0 << MCSR8_L1IUUNIFY_SHIFT) |        \
+ (0x1UL << MCSR8_L1DPRE_SHIFT)    | (0x1UL << MCSR8_L2IUPRE_SHIFT) |        \
+ (0x1UL << MCSR8_L2IUUNIFY_SHIFT) | (0x1UL << MCSR8_L2IUPRIV_SHIFT) |       \
+ (0x0 << MCSR8_L2IUINCL_SHIFT)    | (0x0 << MCSR8_L2DPRE_SHIFT) |           \
+ (0x0 << MCSR8_L2DPRIV_SHIFT)     | (0x0 << MCSR8_L2DINCL_SHIFT) |          \
+ (0x1UL << MCSR8_L3IUPRE_SHIFT)   | (0x1UL << MCSR8_L3IUUNIFY_SHIFT) |      \
+ (0x0 << MCSR8_L3IUPRIV_SHIFT)    | (0x1UL << MCSR8_L3IUINCL_SHIFT) |       \
+ (0x0 << MCSR8_L3DPRE_SHIFT)      | (0x0 < MCSR8_L3DPRIV_SHIFT) |           \
+ (0x0 << MCSR8_L3DINCL_SHIFT)     | (0x3UL << MCSR8_L1I_WAY_SHIFT) |        \
+ (0x8UL << MCSR8_L1I_IDX_SHIFT)   | (0x6UL << MCSR8_L1I_SIZE_SHIFT))
+
+#define LOONGARCH_MCSR9                                                     \
+((0x3UL << MCSR9_L1D_WAY_SHIFT) | (0x8UL << MCSR9_L1D_IDX_SHIFT) |          \
+ (0x6UL << MCSR9_L1D_SIZE_SHIFT) | (0xfUL << MCSR9_L2U_WAY_SHIFT) |         \
+ (0x8UL << MCSR9_L2U_IDX_SHIFT) |  (0x6UL << MCSR9_L2U_SIZE_SHIFT))
+
+#define LOONGARCH_MCSR10                                                    \
+((0xfUL << MCSR10_L3U_WAY_SHIFT) | (0xfUL << MCSR10_L3U_IDX_SHIFT) |        \
+ (0x6UL << MCSR10_L3U_SIZE_SHIFT))
+
+#define LOONGARCH_MCSR24                                                    \
+((0x0 << MCSR24_MCSRLOCK_SHIFT) | (0x0 << MCSR24_NAPEN_SHIFT) |             \
+ (0x0 << MCSR24_VFPUCG_SHIFT) | (0x0 << MCSR24_RAMCG_SHIFT))
+
+/* LoongArch CPU definitions */
+const loongarch_def_t loongarch_defs[] = {
+    {
+        .name = "Loongson-3A5000",
+
+        /* for LoongArch CSR */
+        .CSR_PRCFG1 = LOONGARCH_CONFIG1,
+        .CSR_PRCFG2 = 0x3ffff000,
+        .CSR_PRCFG3 = LOONGARCH_CONFIG3,
+        .CSR_CRMD = (0 << CSR_CRMD_PLV_SHIFT) | (0 << CSR_CRMD_IE_SHIFT) |
+                    (1 << CSR_CRMD_DA_SHIFT) | (0 << CSR_CRMD_PG_SHIFT) |
+                    (1 << CSR_CRMD_DACF_SHIFT) | (1 << CSR_CRMD_DACM_SHIFT),
+        .CSR_ECFG = 0x7 << 16,
+        .CSR_STLBPGSIZE  = 0xe,
+        .CSR_RVACFG = 0x0,
+        .CSR_MCSR0 = LOONGARCH_MCSR0,
+        .CSR_MCSR1 = LOONGARCH_MCSR1,
+        .CSR_MCSR2 = LOONGARCH_MCSR2,
+        .CSR_MCSR3 = 0,
+        .CSR_MCSR8 = LOONGARCH_MCSR8,
+        .CSR_MCSR9 = LOONGARCH_MCSR9,
+        .CSR_MCSR10 = LOONGARCH_MCSR10,
+        .CSR_MCSR24 = LOONGARCH_MCSR24,
+        .FCSR0 = 0x0,
+        .FCSR0_MASK = 0x1f1f03df,
+        .PABITS = 48,
+        .INSN_FLAGS = CPU_LA64 | INSN_LOONGARCH,
+        .MMU_TYPE = MMU_TYPE_LS3A5K,
+    },
+    {
+        .name = "host",
+
+        /* for LoongArch CSR */
+        .CSR_PRCFG1 = LOONGARCH_CONFIG1,
+        .CSR_PRCFG2 = 0x3ffff000,
+        .CSR_PRCFG3 = LOONGARCH_CONFIG3,
+        .CSR_CRMD = (0 << CSR_CRMD_PLV_SHIFT) | (0 << CSR_CRMD_IE_SHIFT) |
+                    (1 << CSR_CRMD_DA_SHIFT) | (0 << CSR_CRMD_PG_SHIFT) |
+                    (1 << CSR_CRMD_DACF_SHIFT) | (1 << CSR_CRMD_DACM_SHIFT),
+        .CSR_ECFG = 0x7 << 16,
+        .CSR_STLBPGSIZE  = 0xe,
+        .CSR_RVACFG = 0x0,
+        .CSR_MCSR0 = LOONGARCH_MCSR0,
+        .CSR_MCSR1 = LOONGARCH_MCSR1,
+        .CSR_MCSR2 = LOONGARCH_MCSR2,
+        .CSR_MCSR3 = 0,
+        .CSR_MCSR8 = LOONGARCH_MCSR8,
+        .CSR_MCSR9 = LOONGARCH_MCSR9,
+        .CSR_MCSR10 = LOONGARCH_MCSR10,
+        .CSR_MCSR24 = LOONGARCH_MCSR24,
+        .FCSR0 = 0x0,
+        .FCSR0_MASK = 0x1f1f03df,
+        .PABITS = 48,
+        .INSN_FLAGS = CPU_LA64 | INSN_LOONGARCH,
+        .MMU_TYPE = MMU_TYPE_LS3A5K,
+    },
+};
+
+const int loongarch_defs_number = ARRAY_SIZE(loongarch_defs);
+
+void loongarch_cpu_list(void)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(loongarch_defs); i++) {
+        qemu_printf("LoongArch '%s'\n", loongarch_defs[i].name);
+    }
+}
+
+static void fpu_init(CPULoongArchState *env, const loongarch_def_t *def)
+{
+    memcpy(&env->active_fpu, &env->fpus[0], sizeof(env->active_fpu));
+}
+
+static void loongarch_cpu_reset(DeviceState *dev)
+{
+    CPUState *cs = CPU(dev);
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    LoongArchCPUClass *mcc = LOONGARCH_CPU_GET_CLASS(cpu);
+    CPULoongArchState *env = &cpu->env;
+
+    mcc->parent_reset(dev);
+
+    memset(env, 0, offsetof(CPULoongArchState, end_reset_fields));
+
+    /* Reset registers to their default values */
+    env->CSR_PRCFG1 = env->cpu_model->CSR_PRCFG1;
+    env->CSR_PRCFG2 = env->cpu_model->CSR_PRCFG2;
+    env->CSR_PRCFG3 = env->cpu_model->CSR_PRCFG3;
+    env->CSR_CRMD = env->cpu_model->CSR_CRMD;
+    env->CSR_ECFG = env->cpu_model->CSR_ECFG;
+    env->CSR_STLBPGSIZE = env->cpu_model->CSR_STLBPGSIZE;
+    env->CSR_RVACFG = env->cpu_model->CSR_RVACFG;
+    env->CSR_MCSR0 = env->cpu_model->CSR_MCSR0;
+    env->CSR_MCSR1 = env->cpu_model->CSR_MCSR1;
+    env->CSR_MCSR2 = env->cpu_model->CSR_MCSR2;
+    env->CSR_MCSR3 = env->cpu_model->CSR_MCSR3;
+    env->CSR_MCSR8 = env->cpu_model->CSR_MCSR8;
+    env->CSR_MCSR9 = env->cpu_model->CSR_MCSR9;
+    env->CSR_MCSR10 = env->cpu_model->CSR_MCSR10;
+    env->CSR_MCSR24 = env->cpu_model->CSR_MCSR24;
+
+    env->current_tc = 0;
+    env->PABITS = env->cpu_model->PABITS;
+    env->active_fpu.fcsr0_mask = env->cpu_model->FCSR0_MASK;
+    env->active_fpu.fcsr0 = env->cpu_model->FCSR0;
+    env->insn_flags = env->cpu_model->INSN_FLAGS;
+
+    compute_hflags(env);
+    restore_pamask(env);
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
+    LoongArchCPUClass *mcc = LOONGARCH_CPU_GET_CLASS(dev);
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
+    fpu_init(env, env->cpu_model);
+
+    cpu_reset(cs);
+    qemu_init_vcpu(cs);
+
+    mcc->parent_realize(dev, errp);
+}
+
+static void loongarch_cpu_initfn(Object *obj)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
+    CPULoongArchState *env = &cpu->env;
+    LoongArchCPUClass *mcc = LOONGARCH_CPU_GET_CLASS(obj);
+
+    cpu_set_cpustate_pointers(cpu);
+    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu, 0);
+    env->cpu_model = mcc->cpu_def;
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
+    LoongArchCPUClass *mcc = LOONGARCH_CPU_CLASS(c);
+    CPUClass *cc = CPU_CLASS(c);
+    DeviceClass *dc = DEVICE_CLASS(c);
+
+    device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
+                                    &mcc->parent_realize);
+    device_class_set_parent_reset(dc, loongarch_cpu_reset, &mcc->parent_reset);
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
+static const TypeInfo loongarch_cpu_type_info = {
+    .name = TYPE_LOONGARCH_CPU,
+    .parent = TYPE_CPU,
+    .instance_size = sizeof(LoongArchCPU),
+    .instance_init = loongarch_cpu_initfn,
+    .abstract = true,
+    .class_size = sizeof(LoongArchCPUClass),
+    .class_init = loongarch_cpu_class_init,
+};
+
+static void loongarch_cpu_cpudef_class_init(ObjectClass *oc, void *data)
+{
+    LoongArchCPUClass *mcc = LOONGARCH_CPU_CLASS(oc);
+    mcc->cpu_def = data;
+}
+
+static void loongarch_register_cpudef_type(const struct loongarch_def_t *def)
+{
+    char *typename = loongarch_cpu_type_name(def->name);
+    TypeInfo ti = {
+        .name = typename,
+        .parent = TYPE_LOONGARCH_CPU,
+        .class_init = loongarch_cpu_cpudef_class_init,
+        .class_data = (void *)def,
+    };
+
+    type_register(&ti);
+    g_free(typename);
+}
+
+static void loongarch_cpu_register_types(void)
+{
+    int i;
+
+    type_register_static(&loongarch_cpu_type_info);
+    for (i = 0; i < loongarch_defs_number; i++) {
+        loongarch_register_cpudef_type(&loongarch_defs[i]);
+    }
+}
+
+type_init(loongarch_cpu_register_types)
+
+static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
+    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
new file mode 100644
index 0000000..1352188
--- /dev/null
+++ b/target/loongarch/cpu.h
@@ -0,0 +1,245 @@
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
+#define ISA_LA32       0x00000001ULL
+#define ISA_LA64       0x00000002ULL
+#define INSN_LOONGARCH 0x00010000ULL
+
+#define CPU_LA32       (ISA_LA32)
+#define CPU_LA64       (ISA_LA32 | ISA_LA64)
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
+
+typedef struct loongarch_def_t loongarch_def_t;
+
+#define LOONGARCH_FPU_MAX 1
+
+typedef struct TCState TCState;
+struct TCState {
+    target_ulong gpr[32];
+    target_ulong PC;
+};
+
+#define N_IRQS      14
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
+    uint32_t PABITS;
+#define PABITS_BASE 36
+    uint64_t PAMask;
+#define PAMASK_BASE ((1ULL << PABITS_BASE) - 1)
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
+    uint64_t insn_flags; /* Supported instruction set */
+
+    /* Fields up to this point are cleared by a CPU reset */
+    struct {} end_reset_fields;
+
+    const loongarch_def_t *cpu_model;
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
+#endif /* LOONGARCH_CPU_H */
diff --git a/target/loongarch/internal.h b/target/loongarch/internal.h
new file mode 100644
index 0000000..e2394af
--- /dev/null
+++ b/target/loongarch/internal.h
@@ -0,0 +1,74 @@
+/*
+ * LoongArch internal definitions and helpers.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_INTERNAL_H
+#define LOONGARCH_INTERNAL_H
+
+#include "exec/memattrs.h"
+
+enum loongarch_mmu_types {
+    MMU_TYPE_NONE,
+    MMU_TYPE_LS3A5K,
+};
+
+struct loongarch_def_t {
+    const char *name;
+    int32_t FCSR0;
+    int32_t FCSR0_MASK;
+    int32_t PABITS;
+    CPU_LOONGARCH_CSR
+    uint64_t INSN_FLAGS;
+    enum loongarch_mmu_types MMU_TYPE;
+};
+
+extern const struct loongarch_def_t loongarch_defs[];
+extern const int loongarch_defs_number;
+
+void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+
+#define cpu_signal_handler cpu_loongarch_signal_handler
+
+void loongarch_tcg_init(void);
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
+static inline void restore_pamask(CPULoongArchState *env)
+{
+    if (env->hflags & LOONGARCH_HFLAG_ELPA) {
+        env->PAMask = (1ULL << env->PABITS) - 1;
+    } else {
+        env->PAMask = PAMASK_BASE;
+    }
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
+#endif
-- 
1.8.3.1


