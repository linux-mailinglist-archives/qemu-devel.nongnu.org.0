Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60234647F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:09:41 +0100 (CET)
Received: from localhost ([::1]:55532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjbA-0004Dv-Mx
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFp-0007GK-86
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:54632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFW-0000ma-L2
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25B7AAE42;
 Tue, 23 Mar 2021 15:46:56 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 28/55] target/arm: refactor exception and cpu code
Date: Tue, 23 Mar 2021 16:46:12 +0100
Message-Id: <20210323154639.23477-21-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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

move exception code out of tcg/
as we need part of it for KVM too.

put the exception code into separate cpu modules as appropriate,
including:

cpu-sysemu.c
tcg/tcg-cpu.c
tcg/sysemu/tcg-cpu.c

to avoid naming confusion with the existing cpu_tcg.c,
containg cpu models definitions for 32bit TCG-only cpus,
rename this file as tcg/tcg-cpu-models.c

The 64bit cpu models (a53/a57/a72/max) for both TCG and KVM
remain in cpu64.c .

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.h                              |   1 -
 target/arm/internals.h                        |   5 -
 target/arm/tcg/tcg-cpu.h                      |  37 +
 target/arm/cpu-sysemu.c                       | 669 ++++++++++++++++
 target/arm/cpu.c                              | 209 +----
 target/arm/tcg/helper.c                       | 724 +-----------------
 target/arm/tcg/sysemu/tcg-cpu.c               |  73 ++
 .../arm/{cpu_tcg.c => tcg/tcg-cpu-models.c}   |  12 +-
 target/arm/tcg/tcg-cpu.c                      | 229 ++++++
 target/arm/meson.build                        |   5 -
 target/arm/tcg/meson.build                    |   4 +-
 target/arm/tcg/sysemu/meson.build             |   1 +
 12 files changed, 1018 insertions(+), 951 deletions(-)
 create mode 100644 target/arm/tcg/tcg-cpu.h
 create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c
 rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (99%)
 create mode 100644 target/arm/tcg/tcg-cpu.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ea1e63f7f6..3911b49399 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1024,7 +1024,6 @@ extern const VMStateDescription vmstate_arm_cpu;
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
-bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
 
 int arm32_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm32_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index e137bb0ac0..811e029f83 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,11 +172,6 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
-#ifdef CONFIG_TCG
-void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-#endif /* CONFIG_TCG */
-
-
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
new file mode 100644
index 0000000000..d93c6a6749
--- /dev/null
+++ b/target/arm/tcg/tcg-cpu.h
@@ -0,0 +1,37 @@
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
+#ifndef ARM_TCG_CPU_H
+#define ARM_TCG_CPU_H
+
+#include "cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
+
+void arm_cpu_synchronize_from_tb(CPUState *cs,
+                                 const TranslationBlock *tb);
+
+extern struct TCGCPUOps arm_tcg_ops;
+
+#ifndef CONFIG_USER_ONLY
+/* Do semihosting call and set the appropriate return value. */
+void tcg_handle_semihosting(CPUState *cs);
+
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* ARM_TCG_CPU_H */
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 5265de1c87..126263dbf4 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -19,10 +19,17 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internals.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
+#include "sysemu/tcg.h"
+
+#ifdef CONFIG_TCG
+#include "tcg/tcg-cpu.h"
+#endif /* CONFIG_TCG */
 
 void arm_cpu_set_irq(void *opaque, int irq, int level)
 {
@@ -410,3 +417,665 @@ int sve_exception_el(CPUARMState *env, int el)
     }
     return 0;
 }
+
+static void take_aarch32_exception(CPUARMState *env, int new_mode,
+                                   uint32_t mask, uint32_t offset,
+                                   uint32_t newpc)
+{
+    int new_el;
+
+    /* Change the CPU state so as to actually take the exception. */
+    switch_mode(env, new_mode);
+
+    /*
+     * For exceptions taken to AArch32 we must clear the SS bit in both
+     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
+     */
+    env->pstate &= ~PSTATE_SS;
+    env->spsr = cpsr_read(env);
+    /* Clear IT bits.  */
+    env->condexec_bits = 0;
+    /* Switch to the new mode, and to the correct instruction set.  */
+    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
+
+    /* This must be after mode switching. */
+    new_el = arm_current_el(env);
+
+    /* Set new mode endianness */
+    env->uncached_cpsr &= ~CPSR_E;
+    if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
+        env->uncached_cpsr |= CPSR_E;
+    }
+    /* J and IL must always be cleared for exception entry */
+    env->uncached_cpsr &= ~(CPSR_IL | CPSR_J);
+    env->daif |= mask;
+
+    if (new_mode == ARM_CPU_MODE_HYP) {
+        env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
+        env->elr_el[2] = env->regs[15];
+    } else {
+        /* CPSR.PAN is normally preserved preserved unless...  */
+        if (cpu_isar_feature(aa32_pan, env_archcpu(env))) {
+            switch (new_el) {
+            case 3:
+                if (!arm_is_secure_below_el3(env)) {
+                    /* ... the target is EL3, from non-secure state.  */
+                    env->uncached_cpsr &= ~CPSR_PAN;
+                    break;
+                }
+                /* ... the target is EL3, from secure state ... */
+                /* fall through */
+            case 1:
+                /* ... the target is EL1 and SCTLR.SPAN is 0.  */
+                if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPAN)) {
+                    env->uncached_cpsr |= CPSR_PAN;
+                }
+                break;
+            }
+        }
+        /*
+         * this is a lie, as there was no c1_sys on V4T/V5, but who cares
+         * and we should just guard the thumb mode on V4
+         */
+        if (arm_feature(env, ARM_FEATURE_V4T)) {
+            env->thumb =
+                (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
+        }
+        env->regs[14] = env->regs[15] + offset;
+    }
+    env->regs[15] = newpc;
+#ifdef CONFIG_TCG
+    arm_rebuild_hflags(env);
+#endif /* CONFIG_TCG */
+}
+
+static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
+{
+    /*
+     * Handle exception entry to Hyp mode; this is sufficiently
+     * different to entry to other AArch32 modes that we handle it
+     * separately here.
+     *
+     * The vector table entry used is always the 0x14 Hyp mode entry point,
+     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
+     * The offset applied to the preferred return address is always zero
+     * (see DDI0487C.a section G1.12.3).
+     * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
+     */
+    uint32_t addr, mask;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (cs->exception_index) {
+    case EXCP_UDEF:
+        addr = 0x04;
+        break;
+    case EXCP_SWI:
+        addr = 0x14;
+        break;
+    case EXCP_BKPT:
+        /* Fall through to prefetch abort.  */
+    case EXCP_PREFETCH_ABORT:
+        env->cp15.ifar_s = env->exception.vaddress;
+        qemu_log_mask(CPU_LOG_INT, "...with HIFAR 0x%x\n",
+                      (uint32_t)env->exception.vaddress);
+        addr = 0x0c;
+        break;
+    case EXCP_DATA_ABORT:
+        env->cp15.dfar_s = env->exception.vaddress;
+        qemu_log_mask(CPU_LOG_INT, "...with HDFAR 0x%x\n",
+                      (uint32_t)env->exception.vaddress);
+        addr = 0x10;
+        break;
+    case EXCP_IRQ:
+        addr = 0x18;
+        break;
+    case EXCP_FIQ:
+        addr = 0x1c;
+        break;
+    case EXCP_HVC:
+        addr = 0x08;
+        break;
+    case EXCP_HYP_TRAP:
+        addr = 0x14;
+        break;
+    default:
+        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
+    }
+
+    if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            /*
+             * QEMU syndrome values are v8-style. v7 has the IL bit
+             * UNK/SBZP for "field not valid" cases, where v8 uses RES1.
+             * If this is a v7 CPU, squash the IL bit in those cases.
+             */
+            if (cs->exception_index == EXCP_PREFETCH_ABORT ||
+                (cs->exception_index == EXCP_DATA_ABORT &&
+                 !(env->exception.syndrome & ARM_EL_ISV)) ||
+                syn_get_ec(env->exception.syndrome) == EC_UNCATEGORIZED) {
+                env->exception.syndrome &= ~ARM_EL_IL;
+            }
+        }
+        env->cp15.esr_el[2] = env->exception.syndrome;
+    }
+
+    if (arm_current_el(env) != 2 && addr < 0x14) {
+        addr = 0x14;
+    }
+
+    mask = 0;
+    if (!(env->cp15.scr_el3 & SCR_EA)) {
+        mask |= CPSR_A;
+    }
+    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
+        mask |= CPSR_I;
+    }
+    if (!(env->cp15.scr_el3 & SCR_FIQ)) {
+        mask |= CPSR_F;
+    }
+
+    addr += env->cp15.hvbar;
+
+    take_aarch32_exception(env, ARM_CPU_MODE_HYP, mask, 0, addr);
+}
+
+static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint32_t addr;
+    uint32_t mask;
+    int new_mode;
+    uint32_t offset;
+    uint32_t moe;
+
+    /* If this is a debug exception we must update the DBGDSCR.MOE bits */
+    switch (syn_get_ec(env->exception.syndrome)) {
+    case EC_BREAKPOINT:
+    case EC_BREAKPOINT_SAME_EL:
+        moe = 1;
+        break;
+    case EC_WATCHPOINT:
+    case EC_WATCHPOINT_SAME_EL:
+        moe = 10;
+        break;
+    case EC_AA32_BKPT:
+        moe = 3;
+        break;
+    case EC_VECTORCATCH:
+        moe = 5;
+        break;
+    default:
+        moe = 0;
+        break;
+    }
+
+    if (moe) {
+        env->cp15.mdscr_el1 = deposit64(env->cp15.mdscr_el1, 2, 4, moe);
+    }
+
+    if (env->exception.target_el == 2) {
+        arm_cpu_do_interrupt_aarch32_hyp(cs);
+        return;
+    }
+
+    switch (cs->exception_index) {
+    case EXCP_UDEF:
+        new_mode = ARM_CPU_MODE_UND;
+        addr = 0x04;
+        mask = CPSR_I;
+        if (env->thumb)
+            offset = 2;
+        else
+            offset = 4;
+        break;
+    case EXCP_SWI:
+        new_mode = ARM_CPU_MODE_SVC;
+        addr = 0x08;
+        mask = CPSR_I;
+        /* The PC already points to the next instruction.  */
+        offset = 0;
+        break;
+    case EXCP_BKPT:
+        /* Fall through to prefetch abort.  */
+    case EXCP_PREFETCH_ABORT:
+        A32_BANKED_CURRENT_REG_SET(env, ifsr, env->exception.fsr);
+        A32_BANKED_CURRENT_REG_SET(env, ifar, env->exception.vaddress);
+        qemu_log_mask(CPU_LOG_INT, "...with IFSR 0x%x IFAR 0x%x\n",
+                      env->exception.fsr, (uint32_t)env->exception.vaddress);
+        new_mode = ARM_CPU_MODE_ABT;
+        addr = 0x0c;
+        mask = CPSR_A | CPSR_I;
+        offset = 4;
+        break;
+    case EXCP_DATA_ABORT:
+        A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
+        A32_BANKED_CURRENT_REG_SET(env, dfar, env->exception.vaddress);
+        qemu_log_mask(CPU_LOG_INT, "...with DFSR 0x%x DFAR 0x%x\n",
+                      env->exception.fsr,
+                      (uint32_t)env->exception.vaddress);
+        new_mode = ARM_CPU_MODE_ABT;
+        addr = 0x10;
+        mask = CPSR_A | CPSR_I;
+        offset = 8;
+        break;
+    case EXCP_IRQ:
+        new_mode = ARM_CPU_MODE_IRQ;
+        addr = 0x18;
+        /* Disable IRQ and imprecise data aborts.  */
+        mask = CPSR_A | CPSR_I;
+        offset = 4;
+        if (env->cp15.scr_el3 & SCR_IRQ) {
+            /* IRQ routed to monitor mode */
+            new_mode = ARM_CPU_MODE_MON;
+            mask |= CPSR_F;
+        }
+        break;
+    case EXCP_FIQ:
+        new_mode = ARM_CPU_MODE_FIQ;
+        addr = 0x1c;
+        /* Disable FIQ, IRQ and imprecise data aborts.  */
+        mask = CPSR_A | CPSR_I | CPSR_F;
+        if (env->cp15.scr_el3 & SCR_FIQ) {
+            /* FIQ routed to monitor mode */
+            new_mode = ARM_CPU_MODE_MON;
+        }
+        offset = 4;
+        break;
+    case EXCP_VIRQ:
+        new_mode = ARM_CPU_MODE_IRQ;
+        addr = 0x18;
+        /* Disable IRQ and imprecise data aborts.  */
+        mask = CPSR_A | CPSR_I;
+        offset = 4;
+        break;
+    case EXCP_VFIQ:
+        new_mode = ARM_CPU_MODE_FIQ;
+        addr = 0x1c;
+        /* Disable FIQ, IRQ and imprecise data aborts.  */
+        mask = CPSR_A | CPSR_I | CPSR_F;
+        offset = 4;
+        break;
+    case EXCP_SMC:
+        new_mode = ARM_CPU_MODE_MON;
+        addr = 0x08;
+        mask = CPSR_A | CPSR_I | CPSR_F;
+        offset = 0;
+        break;
+    default:
+        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
+        return; /* Never happens.  Keep compiler happy.  */
+    }
+
+    if (new_mode == ARM_CPU_MODE_MON) {
+        addr += env->cp15.mvbar;
+    } else if (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_V) {
+        /* High vectors. When enabled, base address cannot be remapped. */
+        addr += 0xffff0000;
+    } else {
+        /* ARM v7 architectures provide a vector base address register to remap
+         * the interrupt vector table.
+         * This register is only followed in non-monitor mode, and is banked.
+         * Note: only bits 31:5 are valid.
+         */
+        addr += A32_BANKED_CURRENT_REG_GET(env, vbar);
+    }
+
+    if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON) {
+        env->cp15.scr_el3 &= ~SCR_NS;
+    }
+
+    take_aarch32_exception(env, new_mode, mask, offset, addr);
+}
+
+static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
+{
+    /*
+     * Return the register number of the AArch64 view of the AArch32
+     * register @aarch32_reg. The CPUARMState CPSR is assumed to still
+     * be that of the AArch32 mode the exception came from.
+     */
+    int mode = env->uncached_cpsr & CPSR_M;
+
+    switch (aarch32_reg) {
+    case 0 ... 7:
+        return aarch32_reg;
+    case 8 ... 12:
+        return mode == ARM_CPU_MODE_FIQ ? aarch32_reg + 16 : aarch32_reg;
+    case 13:
+        switch (mode) {
+        case ARM_CPU_MODE_USR:
+        case ARM_CPU_MODE_SYS:
+            return 13;
+        case ARM_CPU_MODE_HYP:
+            return 15;
+        case ARM_CPU_MODE_IRQ:
+            return 17;
+        case ARM_CPU_MODE_SVC:
+            return 19;
+        case ARM_CPU_MODE_ABT:
+            return 21;
+        case ARM_CPU_MODE_UND:
+            return 23;
+        case ARM_CPU_MODE_FIQ:
+            return 29;
+        default:
+            g_assert_not_reached();
+        }
+    case 14:
+        switch (mode) {
+        case ARM_CPU_MODE_USR:
+        case ARM_CPU_MODE_SYS:
+        case ARM_CPU_MODE_HYP:
+            return 14;
+        case ARM_CPU_MODE_IRQ:
+            return 16;
+        case ARM_CPU_MODE_SVC:
+            return 18;
+        case ARM_CPU_MODE_ABT:
+            return 20;
+        case ARM_CPU_MODE_UND:
+            return 22;
+        case ARM_CPU_MODE_FIQ:
+            return 30;
+        default:
+            g_assert_not_reached();
+        }
+    case 15:
+        return 31;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
+{
+    uint32_t ret = cpsr_read(env);
+
+    /* Move DIT to the correct location for SPSR_ELx */
+    if (ret & CPSR_DIT) {
+        ret &= ~CPSR_DIT;
+        ret |= PSTATE_DIT;
+    }
+    /* Merge PSTATE.SS into SPSR_ELx */
+    ret |= env->pstate & PSTATE_SS;
+
+    return ret;
+}
+
+/* Handle exception entry to a target EL which is using AArch64 */
+static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    unsigned int new_el = env->exception.target_el;
+    target_ulong addr = env->cp15.vbar_el[new_el];
+    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
+    unsigned int old_mode;
+    unsigned int cur_el = arm_current_el(env);
+    int rt;
+
+    /*
+     * Note that new_el can never be 0.  If cur_el is 0, then
+     * el0_a64 is is_a64(), else el0_a64 is ignored.
+     */
+    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+
+    if (cur_el < new_el) {
+        /* Entry vector offset depends on whether the implemented EL
+         * immediately lower than the target level is using AArch32 or AArch64
+         */
+        bool is_aa64;
+        uint64_t hcr;
+
+        switch (new_el) {
+        case 3:
+            is_aa64 = (env->cp15.scr_el3 & SCR_RW) != 0;
+            break;
+        case 2:
+            hcr = arm_hcr_el2_eff(env);
+            if ((hcr & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+                is_aa64 = (hcr & HCR_RW) != 0;
+                break;
+            }
+            /* fall through */
+        case 1:
+            is_aa64 = is_a64(env);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (is_aa64) {
+            addr += 0x400;
+        } else {
+            addr += 0x600;
+        }
+    } else if (pstate_read(env) & PSTATE_SP) {
+        addr += 0x200;
+    }
+
+    switch (cs->exception_index) {
+    case EXCP_PREFETCH_ABORT:
+    case EXCP_DATA_ABORT:
+        env->cp15.far_el[new_el] = env->exception.vaddress;
+        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
+                      env->cp15.far_el[new_el]);
+        /* fall through */
+    case EXCP_BKPT:
+    case EXCP_UDEF:
+    case EXCP_SWI:
+    case EXCP_HVC:
+    case EXCP_HYP_TRAP:
+    case EXCP_SMC:
+        switch (syn_get_ec(env->exception.syndrome)) {
+        case EC_ADVSIMDFPACCESSTRAP:
+            /*
+             * QEMU internal FP/SIMD syndromes from AArch32 include the
+             * TA and coproc fields which are only exposed if the exception
+             * is taken to AArch32 Hyp mode. Mask them out to get a valid
+             * AArch64 format syndrome.
+             */
+            env->exception.syndrome &= ~MAKE_64BIT_MASK(0, 20);
+            break;
+        case EC_CP14RTTRAP:
+        case EC_CP15RTTRAP:
+        case EC_CP14DTTRAP:
+            /*
+             * For a trap on AArch32 MRC/MCR/LDC/STC the Rt field is currently
+             * the raw register field from the insn; when taking this to
+             * AArch64 we must convert it to the AArch64 view of the register
+             * number. Notice that we read a 4-bit AArch32 register number and
+             * write back a 5-bit AArch64 one.
+             */
+            rt = extract32(env->exception.syndrome, 5, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                5, 5, rt);
+            break;
+        case EC_CP15RRTTRAP:
+        case EC_CP14RRTTRAP:
+            /* Similarly for MRRC/MCRR traps for Rt and Rt2 fields */
+            rt = extract32(env->exception.syndrome, 5, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                5, 5, rt);
+            rt = extract32(env->exception.syndrome, 10, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                10, 5, rt);
+            break;
+        }
+        env->cp15.esr_el[new_el] = env->exception.syndrome;
+        break;
+    case EXCP_IRQ:
+    case EXCP_VIRQ:
+        addr += 0x80;
+        break;
+    case EXCP_FIQ:
+    case EXCP_VFIQ:
+        addr += 0x100;
+        break;
+    default:
+        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
+    }
+
+    if (is_a64(env)) {
+        old_mode = pstate_read(env);
+        aarch64_save_sp(env, arm_current_el(env));
+        env->elr_el[new_el] = env->pc;
+    } else {
+        old_mode = cpsr_read_for_spsr_elx(env);
+        env->elr_el[new_el] = env->regs[15];
+
+        aarch64_sync_32_to_64(env);
+
+        env->condexec_bits = 0;
+    }
+    env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
+
+    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
+                  env->elr_el[new_el]);
+
+    if (cpu_isar_feature(aa64_pan, cpu)) {
+        /* The value of PSTATE.PAN is normally preserved, except when ... */
+        new_mode |= old_mode & PSTATE_PAN;
+        switch (new_el) {
+        case 2:
+            /* ... the target is EL2 with HCR_EL2.{E2H,TGE} == '11' ...  */
+            if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE))
+                != (HCR_E2H | HCR_TGE)) {
+                break;
+            }
+            /* fall through */
+        case 1:
+            /* ... the target is EL1 ... */
+            /* ... and SCTLR_ELx.SPAN == 0, then set to 1.  */
+            if ((env->cp15.sctlr_el[new_el] & SCTLR_SPAN) == 0) {
+                new_mode |= PSTATE_PAN;
+            }
+            break;
+        }
+    }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_mode |= PSTATE_TCO;
+    }
+
+    pstate_write(env, PSTATE_DAIF | new_mode);
+    env->aarch64 = 1;
+    aarch64_restore_sp(env, new_el);
+#ifdef CONFIG_TCG
+    arm_rebuild_hflags(env);
+#endif /* CONFIG_TCG */
+
+    env->pc = addr;
+
+    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
+                  new_el, env->pc, pstate_read(env));
+}
+
+void arm_log_exception(int idx)
+{
+    if (qemu_loglevel_mask(CPU_LOG_INT)) {
+        const char *exc = NULL;
+        static const char * const excnames[] = {
+            [EXCP_UDEF] = "Undefined Instruction",
+            [EXCP_SWI] = "SVC",
+            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
+            [EXCP_DATA_ABORT] = "Data Abort",
+            [EXCP_IRQ] = "IRQ",
+            [EXCP_FIQ] = "FIQ",
+            [EXCP_BKPT] = "Breakpoint",
+            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
+            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
+            [EXCP_HVC] = "Hypervisor Call",
+            [EXCP_HYP_TRAP] = "Hypervisor Trap",
+            [EXCP_SMC] = "Secure Monitor Call",
+            [EXCP_VIRQ] = "Virtual IRQ",
+            [EXCP_VFIQ] = "Virtual FIQ",
+            [EXCP_SEMIHOST] = "Semihosting call",
+            [EXCP_NOCP] = "v7M NOCP UsageFault",
+            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
+            [EXCP_STKOF] = "v8M STKOF UsageFault",
+            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
+            [EXCP_LSERR] = "v8M LSERR UsageFault",
+            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
+        };
+
+        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
+            exc = excnames[idx];
+        }
+        if (!exc) {
+            exc = "unknown";
+        }
+        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
+    }
+}
+
+/* Handle a CPU exception for A and R profile CPUs.
+ * Do any appropriate logging, handle PSCI calls, and then hand off
+ * to the AArch64-entry or AArch32-entry function depending on the
+ * target exception level's register width.
+ *
+ * Note: this is used for both TCG (as the do_interrupt tcg op),
+ *       and KVM to re-inject guest debug exceptions, and to
+ *       inject a Synchronous-External-Abort.
+ */
+void arm_cpu_do_interrupt(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    unsigned int new_el = env->exception.target_el;
+
+    assert(!arm_feature(env, ARM_FEATURE_M));
+
+    arm_log_exception(cs->exception_index);
+    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
+                  new_el);
+    if (qemu_loglevel_mask(CPU_LOG_INT)
+        && !excp_is_internal(cs->exception_index)) {
+        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
+                      syn_get_ec(env->exception.syndrome),
+                      env->exception.syndrome);
+    }
+
+#ifdef CONFIG_TCG
+    if (tcg_enabled()) {
+        if (arm_is_psci_call(cpu, cs->exception_index)) {
+            arm_handle_psci_call(cpu);
+            qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+            return;
+        }
+        /*
+         * Semihosting semantics depend on the register width of the code
+         * that caused the exception, not the target exception level, so
+         * must be handled here.
+         */
+        if (cs->exception_index == EXCP_SEMIHOST) {
+            tcg_handle_semihosting(cs);
+            return;
+        }
+    }
+#endif /* CONFIG_TCG */
+    /*
+     * Hooks may change global state so BQL should be held, also the
+     * BQL needs to be held for any modification of
+     * cs->interrupt_request.
+     */
+    g_assert(qemu_mutex_iothread_locked());
+    arm_call_pre_el_change_hook(cpu);
+
+    assert(!excp_is_internal(cs->exception_index));
+    if (arm_el_is_aa64(env, new_el)) {
+        arm_cpu_do_interrupt_aarch64(cs);
+    } else {
+        arm_cpu_do_interrupt_aarch32(cs);
+    }
+
+    arm_call_el_change_hook(cpu);
+
+    if (tcg_enabled()) {
+        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+    }
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0f640a8b4e..1043551b9c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -28,7 +28,7 @@
 #include "cpu.h"
 #include "cpregs.h"
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
 #include "cpu32.h"
 #include "internals.h"
@@ -60,25 +60,6 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
-#ifdef CONFIG_TCG
-void arm_cpu_synchronize_from_tb(CPUState *cs,
-                                 const TranslationBlock *tb)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * It's OK to look at env for the current mode here, because it's
-     * never possible for an AArch64 TB to chain to an AArch32 TB.
-     */
-    if (is_a64(env)) {
-        env->pc = tb->pc;
-    } else {
-        env->regs[15] = tb->pc;
-    }
-}
-#endif /* CONFIG_TCG */
-
 static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -444,175 +425,6 @@ static void arm_cpu_reset(DeviceState *dev)
     }
 }
 
-static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
-                                     unsigned int target_el,
-                                     unsigned int cur_el, bool secure,
-                                     uint64_t hcr_el2)
-{
-    CPUARMState *env = cs->env_ptr;
-    bool pstate_unmasked;
-    bool unmasked = false;
-
-    /*
-     * Don't take exceptions if they target a lower EL.
-     * This check should catch any exceptions that would not be taken
-     * but left pending.
-     */
-    if (cur_el > target_el) {
-        return false;
-    }
-
-    switch (excp_idx) {
-    case EXCP_FIQ:
-        pstate_unmasked = !(env->daif & PSTATE_F);
-        break;
-
-    case EXCP_IRQ:
-        pstate_unmasked = !(env->daif & PSTATE_I);
-        break;
-
-    case EXCP_VFIQ:
-        if (!(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
-            /* VFIQs are only taken when hypervized.  */
-            return false;
-        }
-        return !(env->daif & PSTATE_F);
-    case EXCP_VIRQ:
-        if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
-            /* VIRQs are only taken when hypervized.  */
-            return false;
-        }
-        return !(env->daif & PSTATE_I);
-    default:
-        g_assert_not_reached();
-    }
-
-    /*
-     * Use the target EL, current execution state and SCR/HCR settings to
-     * determine whether the corresponding CPSR bit is used to mask the
-     * interrupt.
-     */
-    if ((target_el > cur_el) && (target_el != 1)) {
-        /* Exceptions targeting a higher EL may not be maskable */
-        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            /*
-             * 64-bit masking rules are simple: exceptions to EL3
-             * can't be masked, and exceptions to EL2 can only be
-             * masked from Secure state. The HCR and SCR settings
-             * don't affect the masking logic, only the interrupt routing.
-             */
-            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
-                unmasked = true;
-            }
-        } else {
-            /*
-             * The old 32-bit-only environment has a more complicated
-             * masking setup. HCR and SCR bits not only affect interrupt
-             * routing but also change the behaviour of masking.
-             */
-            bool hcr, scr;
-
-            switch (excp_idx) {
-            case EXCP_FIQ:
-                /*
-                 * If FIQs are routed to EL3 or EL2 then there are cases where
-                 * we override the CPSR.F in determining if the exception is
-                 * masked or not. If neither of these are set then we fall back
-                 * to the CPSR.F setting otherwise we further assess the state
-                 * below.
-                 */
-                hcr = hcr_el2 & HCR_FMO;
-                scr = (env->cp15.scr_el3 & SCR_FIQ);
-
-                /*
-                 * When EL3 is 32-bit, the SCR.FW bit controls whether the
-                 * CPSR.F bit masks FIQ interrupts when taken in non-secure
-                 * state. If SCR.FW is set then FIQs can be masked by CPSR.F
-                 * when non-secure but only when FIQs are only routed to EL3.
-                 */
-                scr = scr && !((env->cp15.scr_el3 & SCR_FW) && !hcr);
-                break;
-            case EXCP_IRQ:
-                /*
-                 * When EL3 execution state is 32-bit, if HCR.IMO is set then
-                 * we may override the CPSR.I masking when in non-secure state.
-                 * The SCR.IRQ setting has already been taken into consideration
-                 * when setting the target EL, so it does not have a further
-                 * affect here.
-                 */
-                hcr = hcr_el2 & HCR_IMO;
-                scr = false;
-                break;
-            default:
-                g_assert_not_reached();
-            }
-
-            if ((scr || hcr) && !secure) {
-                unmasked = true;
-            }
-        }
-    }
-
-    /*
-     * The PSTATE bits only mask the interrupt if we have not overriden the
-     * ability above.
-     */
-    return unmasked || pstate_unmasked;
-}
-
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    CPUClass *cc = CPU_GET_CLASS(cs);
-    CPUARMState *env = cs->env_ptr;
-    uint32_t cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-    uint32_t target_el;
-    uint32_t excp_idx;
-
-    /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
-
-    if (interrupt_request & CPU_INTERRUPT_FIQ) {
-        excp_idx = EXCP_FIQ;
-        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        excp_idx = EXCP_IRQ;
-        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    if (interrupt_request & CPU_INTERRUPT_VIRQ) {
-        excp_idx = EXCP_VIRQ;
-        target_el = 1;
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    if (interrupt_request & CPU_INTERRUPT_VFIQ) {
-        excp_idx = EXCP_VFIQ;
-        target_el = 1;
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    return false;
-
- found:
-    cs->exception_index = excp_idx;
-    env->exception.target_el = target_el;
-    cc->tcg_ops->do_interrupt(cs);
-    return true;
-}
-
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
     /*
@@ -1017,6 +829,7 @@ static void arm_cpu_finalizefn(Object *obj)
         QLIST_REMOVE(hook, node);
         g_free(hook);
     }
+
 #ifndef CONFIG_USER_ONLY
     if (cpu->pmu_timer) {
         timer_free(cpu->pmu_timer);
@@ -1632,24 +1445,6 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-#ifdef CONFIG_TCG
-static struct TCGCPUOps arm_tcg_ops = {
-    .initialize = arm_translate_init,
-    .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
-    .tlb_fill = arm_cpu_tlb_fill,
-    .debug_excp_handler = arm_debug_excp_handler,
-
-#if !defined(CONFIG_USER_ONLY)
-    .do_interrupt = arm_cpu_do_interrupt,
-    .do_transaction_failed = arm_cpu_do_transaction_failed,
-    .do_unaligned_access = arm_cpu_do_unaligned_access,
-    .adjust_watchpoint_address = arm_adjust_watchpoint_address,
-    .debug_check_watchpoint = arm_debug_check_watchpoint,
-#endif /* !CONFIG_USER_ONLY */
-};
-#endif /* CONFIG_TCG */
-
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 988ee1c49c..548c94e057 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -7,36 +7,16 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "target/arm/idau.h"
-#include "trace.h"
 #include "cpu.h"
 #include "internals.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
-#include "qemu/bitops.h"
 #include "qemu/crc32c.h"
-#include "qemu/qemu-print.h"
-#include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
-#include "hw/irq.h"
-#include "semihosting/semihost.h"
-#include "sysemu/cpus.h"
-#include "sysemu/cpu-timers.h"
-#include "sysemu/kvm.h"
-#include "sysemu/tcg.h"
-#include "qemu/range.h"
-#include "qapi/error.h"
-#include "qemu/guest-random.h"
-#ifdef CONFIG_TCG
 #include "arm_ldst.h"
-#include "exec/cpu_ldst.h"
-#include "semihosting/common-semi.h"
-#endif
 #include "cpu-mmu.h"
 #include "cpregs.h"
+#include "tcg-cpu.h"
 
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
@@ -711,708 +691,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     return target_el;
 }
 
-void arm_log_exception(int idx)
-{
-    if (qemu_loglevel_mask(CPU_LOG_INT)) {
-        const char *exc = NULL;
-        static const char * const excnames[] = {
-            [EXCP_UDEF] = "Undefined Instruction",
-            [EXCP_SWI] = "SVC",
-            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
-            [EXCP_DATA_ABORT] = "Data Abort",
-            [EXCP_IRQ] = "IRQ",
-            [EXCP_FIQ] = "FIQ",
-            [EXCP_BKPT] = "Breakpoint",
-            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
-            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
-            [EXCP_HVC] = "Hypervisor Call",
-            [EXCP_HYP_TRAP] = "Hypervisor Trap",
-            [EXCP_SMC] = "Secure Monitor Call",
-            [EXCP_VIRQ] = "Virtual IRQ",
-            [EXCP_VFIQ] = "Virtual FIQ",
-            [EXCP_SEMIHOST] = "Semihosting call",
-            [EXCP_NOCP] = "v7M NOCP UsageFault",
-            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
-            [EXCP_STKOF] = "v8M STKOF UsageFault",
-            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
-            [EXCP_LSERR] = "v8M LSERR UsageFault",
-            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
-        };
-
-        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
-            exc = excnames[idx];
-        }
-        if (!exc) {
-            exc = "unknown";
-        }
-        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
-    }
-}
-
-static void take_aarch32_exception(CPUARMState *env, int new_mode,
-                                   uint32_t mask, uint32_t offset,
-                                   uint32_t newpc)
-{
-    int new_el;
-
-    /* Change the CPU state so as to actually take the exception. */
-    switch_mode(env, new_mode);
-
-    /*
-     * For exceptions taken to AArch32 we must clear the SS bit in both
-     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
-     */
-    env->pstate &= ~PSTATE_SS;
-    env->spsr = cpsr_read(env);
-    /* Clear IT bits.  */
-    env->condexec_bits = 0;
-    /* Switch to the new mode, and to the correct instruction set.  */
-    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
-
-    /* This must be after mode switching. */
-    new_el = arm_current_el(env);
-
-    /* Set new mode endianness */
-    env->uncached_cpsr &= ~CPSR_E;
-    if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
-        env->uncached_cpsr |= CPSR_E;
-    }
-    /* J and IL must always be cleared for exception entry */
-    env->uncached_cpsr &= ~(CPSR_IL | CPSR_J);
-    env->daif |= mask;
-
-    if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
-        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_32) {
-            env->uncached_cpsr |= CPSR_SSBS;
-        } else {
-            env->uncached_cpsr &= ~CPSR_SSBS;
-        }
-    }
-
-    if (new_mode == ARM_CPU_MODE_HYP) {
-        env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
-        env->elr_el[2] = env->regs[15];
-    } else {
-        /* CPSR.PAN is normally preserved preserved unless...  */
-        if (cpu_isar_feature(aa32_pan, env_archcpu(env))) {
-            switch (new_el) {
-            case 3:
-                if (!arm_is_secure_below_el3(env)) {
-                    /* ... the target is EL3, from non-secure state.  */
-                    env->uncached_cpsr &= ~CPSR_PAN;
-                    break;
-                }
-                /* ... the target is EL3, from secure state ... */
-                /* fall through */
-            case 1:
-                /* ... the target is EL1 and SCTLR.SPAN is 0.  */
-                if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPAN)) {
-                    env->uncached_cpsr |= CPSR_PAN;
-                }
-                break;
-            }
-        }
-        /*
-         * this is a lie, as there was no c1_sys on V4T/V5, but who cares
-         * and we should just guard the thumb mode on V4
-         */
-        if (arm_feature(env, ARM_FEATURE_V4T)) {
-            env->thumb =
-                (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
-        }
-        env->regs[14] = env->regs[15] + offset;
-    }
-    env->regs[15] = newpc;
-    arm_rebuild_hflags(env);
-}
-
-static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
-{
-    /*
-     * Handle exception entry to Hyp mode; this is sufficiently
-     * different to entry to other AArch32 modes that we handle it
-     * separately here.
-     *
-     * The vector table entry used is always the 0x14 Hyp mode entry point,
-     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
-     * The offset applied to the preferred return address is always zero
-     * (see DDI0487C.a section G1.12.3).
-     * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
-     */
-    uint32_t addr, mask;
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    switch (cs->exception_index) {
-    case EXCP_UDEF:
-        addr = 0x04;
-        break;
-    case EXCP_SWI:
-        addr = 0x14;
-        break;
-    case EXCP_BKPT:
-        /* Fall through to prefetch abort.  */
-    case EXCP_PREFETCH_ABORT:
-        env->cp15.ifar_s = env->exception.vaddress;
-        qemu_log_mask(CPU_LOG_INT, "...with HIFAR 0x%x\n",
-                      (uint32_t)env->exception.vaddress);
-        addr = 0x0c;
-        break;
-    case EXCP_DATA_ABORT:
-        env->cp15.dfar_s = env->exception.vaddress;
-        qemu_log_mask(CPU_LOG_INT, "...with HDFAR 0x%x\n",
-                      (uint32_t)env->exception.vaddress);
-        addr = 0x10;
-        break;
-    case EXCP_IRQ:
-        addr = 0x18;
-        break;
-    case EXCP_FIQ:
-        addr = 0x1c;
-        break;
-    case EXCP_HVC:
-        addr = 0x08;
-        break;
-    case EXCP_HYP_TRAP:
-        addr = 0x14;
-        break;
-    default:
-        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
-    }
-
-    if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
-        if (!arm_feature(env, ARM_FEATURE_V8)) {
-            /*
-             * QEMU syndrome values are v8-style. v7 has the IL bit
-             * UNK/SBZP for "field not valid" cases, where v8 uses RES1.
-             * If this is a v7 CPU, squash the IL bit in those cases.
-             */
-            if (cs->exception_index == EXCP_PREFETCH_ABORT ||
-                (cs->exception_index == EXCP_DATA_ABORT &&
-                 !(env->exception.syndrome & ARM_EL_ISV)) ||
-                syn_get_ec(env->exception.syndrome) == EC_UNCATEGORIZED) {
-                env->exception.syndrome &= ~ARM_EL_IL;
-            }
-        }
-        env->cp15.esr_el[2] = env->exception.syndrome;
-    }
-
-    if (arm_current_el(env) != 2 && addr < 0x14) {
-        addr = 0x14;
-    }
-
-    mask = 0;
-    if (!(env->cp15.scr_el3 & SCR_EA)) {
-        mask |= CPSR_A;
-    }
-    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
-        mask |= CPSR_I;
-    }
-    if (!(env->cp15.scr_el3 & SCR_FIQ)) {
-        mask |= CPSR_F;
-    }
-
-    addr += env->cp15.hvbar;
-
-    take_aarch32_exception(env, ARM_CPU_MODE_HYP, mask, 0, addr);
-}
-
-static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint32_t addr;
-    uint32_t mask;
-    int new_mode;
-    uint32_t offset;
-    uint32_t moe;
-
-    /* If this is a debug exception we must update the DBGDSCR.MOE bits */
-    switch (syn_get_ec(env->exception.syndrome)) {
-    case EC_BREAKPOINT:
-    case EC_BREAKPOINT_SAME_EL:
-        moe = 1;
-        break;
-    case EC_WATCHPOINT:
-    case EC_WATCHPOINT_SAME_EL:
-        moe = 10;
-        break;
-    case EC_AA32_BKPT:
-        moe = 3;
-        break;
-    case EC_VECTORCATCH:
-        moe = 5;
-        break;
-    default:
-        moe = 0;
-        break;
-    }
-
-    if (moe) {
-        env->cp15.mdscr_el1 = deposit64(env->cp15.mdscr_el1, 2, 4, moe);
-    }
-
-    if (env->exception.target_el == 2) {
-        arm_cpu_do_interrupt_aarch32_hyp(cs);
-        return;
-    }
-
-    switch (cs->exception_index) {
-    case EXCP_UDEF:
-        new_mode = ARM_CPU_MODE_UND;
-        addr = 0x04;
-        mask = CPSR_I;
-        if (env->thumb)
-            offset = 2;
-        else
-            offset = 4;
-        break;
-    case EXCP_SWI:
-        new_mode = ARM_CPU_MODE_SVC;
-        addr = 0x08;
-        mask = CPSR_I;
-        /* The PC already points to the next instruction.  */
-        offset = 0;
-        break;
-    case EXCP_BKPT:
-        /* Fall through to prefetch abort.  */
-    case EXCP_PREFETCH_ABORT:
-        A32_BANKED_CURRENT_REG_SET(env, ifsr, env->exception.fsr);
-        A32_BANKED_CURRENT_REG_SET(env, ifar, env->exception.vaddress);
-        qemu_log_mask(CPU_LOG_INT, "...with IFSR 0x%x IFAR 0x%x\n",
-                      env->exception.fsr, (uint32_t)env->exception.vaddress);
-        new_mode = ARM_CPU_MODE_ABT;
-        addr = 0x0c;
-        mask = CPSR_A | CPSR_I;
-        offset = 4;
-        break;
-    case EXCP_DATA_ABORT:
-        A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
-        A32_BANKED_CURRENT_REG_SET(env, dfar, env->exception.vaddress);
-        qemu_log_mask(CPU_LOG_INT, "...with DFSR 0x%x DFAR 0x%x\n",
-                      env->exception.fsr,
-                      (uint32_t)env->exception.vaddress);
-        new_mode = ARM_CPU_MODE_ABT;
-        addr = 0x10;
-        mask = CPSR_A | CPSR_I;
-        offset = 8;
-        break;
-    case EXCP_IRQ:
-        new_mode = ARM_CPU_MODE_IRQ;
-        addr = 0x18;
-        /* Disable IRQ and imprecise data aborts.  */
-        mask = CPSR_A | CPSR_I;
-        offset = 4;
-        if (env->cp15.scr_el3 & SCR_IRQ) {
-            /* IRQ routed to monitor mode */
-            new_mode = ARM_CPU_MODE_MON;
-            mask |= CPSR_F;
-        }
-        break;
-    case EXCP_FIQ:
-        new_mode = ARM_CPU_MODE_FIQ;
-        addr = 0x1c;
-        /* Disable FIQ, IRQ and imprecise data aborts.  */
-        mask = CPSR_A | CPSR_I | CPSR_F;
-        if (env->cp15.scr_el3 & SCR_FIQ) {
-            /* FIQ routed to monitor mode */
-            new_mode = ARM_CPU_MODE_MON;
-        }
-        offset = 4;
-        break;
-    case EXCP_VIRQ:
-        new_mode = ARM_CPU_MODE_IRQ;
-        addr = 0x18;
-        /* Disable IRQ and imprecise data aborts.  */
-        mask = CPSR_A | CPSR_I;
-        offset = 4;
-        break;
-    case EXCP_VFIQ:
-        new_mode = ARM_CPU_MODE_FIQ;
-        addr = 0x1c;
-        /* Disable FIQ, IRQ and imprecise data aborts.  */
-        mask = CPSR_A | CPSR_I | CPSR_F;
-        offset = 4;
-        break;
-    case EXCP_SMC:
-        new_mode = ARM_CPU_MODE_MON;
-        addr = 0x08;
-        mask = CPSR_A | CPSR_I | CPSR_F;
-        offset = 0;
-        break;
-    default:
-        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
-        return; /* Never happens.  Keep compiler happy.  */
-    }
-
-    if (new_mode == ARM_CPU_MODE_MON) {
-        addr += env->cp15.mvbar;
-    } else if (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_V) {
-        /* High vectors. When enabled, base address cannot be remapped. */
-        addr += 0xffff0000;
-    } else {
-        /* ARM v7 architectures provide a vector base address register to remap
-         * the interrupt vector table.
-         * This register is only followed in non-monitor mode, and is banked.
-         * Note: only bits 31:5 are valid.
-         */
-        addr += A32_BANKED_CURRENT_REG_GET(env, vbar);
-    }
-
-    if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON) {
-        env->cp15.scr_el3 &= ~SCR_NS;
-    }
-
-    take_aarch32_exception(env, new_mode, mask, offset, addr);
-}
-
-static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
-{
-    /*
-     * Return the register number of the AArch64 view of the AArch32
-     * register @aarch32_reg. The CPUARMState CPSR is assumed to still
-     * be that of the AArch32 mode the exception came from.
-     */
-    int mode = env->uncached_cpsr & CPSR_M;
-
-    switch (aarch32_reg) {
-    case 0 ... 7:
-        return aarch32_reg;
-    case 8 ... 12:
-        return mode == ARM_CPU_MODE_FIQ ? aarch32_reg + 16 : aarch32_reg;
-    case 13:
-        switch (mode) {
-        case ARM_CPU_MODE_USR:
-        case ARM_CPU_MODE_SYS:
-            return 13;
-        case ARM_CPU_MODE_HYP:
-            return 15;
-        case ARM_CPU_MODE_IRQ:
-            return 17;
-        case ARM_CPU_MODE_SVC:
-            return 19;
-        case ARM_CPU_MODE_ABT:
-            return 21;
-        case ARM_CPU_MODE_UND:
-            return 23;
-        case ARM_CPU_MODE_FIQ:
-            return 29;
-        default:
-            g_assert_not_reached();
-        }
-    case 14:
-        switch (mode) {
-        case ARM_CPU_MODE_USR:
-        case ARM_CPU_MODE_SYS:
-        case ARM_CPU_MODE_HYP:
-            return 14;
-        case ARM_CPU_MODE_IRQ:
-            return 16;
-        case ARM_CPU_MODE_SVC:
-            return 18;
-        case ARM_CPU_MODE_ABT:
-            return 20;
-        case ARM_CPU_MODE_UND:
-            return 22;
-        case ARM_CPU_MODE_FIQ:
-            return 30;
-        default:
-            g_assert_not_reached();
-        }
-    case 15:
-        return 31;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
-{
-    uint32_t ret = cpsr_read(env);
-
-    /* Move DIT to the correct location for SPSR_ELx */
-    if (ret & CPSR_DIT) {
-        ret &= ~CPSR_DIT;
-        ret |= PSTATE_DIT;
-    }
-    /* Merge PSTATE.SS into SPSR_ELx */
-    ret |= env->pstate & PSTATE_SS;
-
-    return ret;
-}
-
-/* Handle exception entry to a target EL which is using AArch64 */
-static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    unsigned int new_el = env->exception.target_el;
-    target_ulong addr = env->cp15.vbar_el[new_el];
-    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
-    unsigned int old_mode;
-    unsigned int cur_el = arm_current_el(env);
-    int rt;
-
-    /*
-     * Note that new_el can never be 0.  If cur_el is 0, then
-     * el0_a64 is is_a64(), else el0_a64 is ignored.
-     */
-    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
-
-    if (cur_el < new_el) {
-        /* Entry vector offset depends on whether the implemented EL
-         * immediately lower than the target level is using AArch32 or AArch64
-         */
-        bool is_aa64;
-        uint64_t hcr;
-
-        switch (new_el) {
-        case 3:
-            is_aa64 = (env->cp15.scr_el3 & SCR_RW) != 0;
-            break;
-        case 2:
-            hcr = arm_hcr_el2_eff(env);
-            if ((hcr & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-                is_aa64 = (hcr & HCR_RW) != 0;
-                break;
-            }
-            /* fall through */
-        case 1:
-            is_aa64 = is_a64(env);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-
-        if (is_aa64) {
-            addr += 0x400;
-        } else {
-            addr += 0x600;
-        }
-    } else if (pstate_read(env) & PSTATE_SP) {
-        addr += 0x200;
-    }
-
-    switch (cs->exception_index) {
-    case EXCP_PREFETCH_ABORT:
-    case EXCP_DATA_ABORT:
-        env->cp15.far_el[new_el] = env->exception.vaddress;
-        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
-                      env->cp15.far_el[new_el]);
-        /* fall through */
-    case EXCP_BKPT:
-    case EXCP_UDEF:
-    case EXCP_SWI:
-    case EXCP_HVC:
-    case EXCP_HYP_TRAP:
-    case EXCP_SMC:
-        switch (syn_get_ec(env->exception.syndrome)) {
-        case EC_ADVSIMDFPACCESSTRAP:
-            /*
-             * QEMU internal FP/SIMD syndromes from AArch32 include the
-             * TA and coproc fields which are only exposed if the exception
-             * is taken to AArch32 Hyp mode. Mask them out to get a valid
-             * AArch64 format syndrome.
-             */
-            env->exception.syndrome &= ~MAKE_64BIT_MASK(0, 20);
-            break;
-        case EC_CP14RTTRAP:
-        case EC_CP15RTTRAP:
-        case EC_CP14DTTRAP:
-            /*
-             * For a trap on AArch32 MRC/MCR/LDC/STC the Rt field is currently
-             * the raw register field from the insn; when taking this to
-             * AArch64 we must convert it to the AArch64 view of the register
-             * number. Notice that we read a 4-bit AArch32 register number and
-             * write back a 5-bit AArch64 one.
-             */
-            rt = extract32(env->exception.syndrome, 5, 4);
-            rt = aarch64_regnum(env, rt);
-            env->exception.syndrome = deposit32(env->exception.syndrome,
-                                                5, 5, rt);
-            break;
-        case EC_CP15RRTTRAP:
-        case EC_CP14RRTTRAP:
-            /* Similarly for MRRC/MCRR traps for Rt and Rt2 fields */
-            rt = extract32(env->exception.syndrome, 5, 4);
-            rt = aarch64_regnum(env, rt);
-            env->exception.syndrome = deposit32(env->exception.syndrome,
-                                                5, 5, rt);
-            rt = extract32(env->exception.syndrome, 10, 4);
-            rt = aarch64_regnum(env, rt);
-            env->exception.syndrome = deposit32(env->exception.syndrome,
-                                                10, 5, rt);
-            break;
-        }
-        env->cp15.esr_el[new_el] = env->exception.syndrome;
-        break;
-    case EXCP_IRQ:
-    case EXCP_VIRQ:
-        addr += 0x80;
-        break;
-    case EXCP_FIQ:
-    case EXCP_VFIQ:
-        addr += 0x100;
-        break;
-    default:
-        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
-    }
-
-    if (is_a64(env)) {
-        old_mode = pstate_read(env);
-        aarch64_save_sp(env, arm_current_el(env));
-        env->elr_el[new_el] = env->pc;
-    } else {
-        old_mode = cpsr_read_for_spsr_elx(env);
-        env->elr_el[new_el] = env->regs[15];
-
-        aarch64_sync_32_to_64(env);
-
-        env->condexec_bits = 0;
-    }
-    env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
-
-    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
-                  env->elr_el[new_el]);
-
-    if (cpu_isar_feature(aa64_pan, cpu)) {
-        /* The value of PSTATE.PAN is normally preserved, except when ... */
-        new_mode |= old_mode & PSTATE_PAN;
-        switch (new_el) {
-        case 2:
-            /* ... the target is EL2 with HCR_EL2.{E2H,TGE} == '11' ...  */
-            if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE))
-                != (HCR_E2H | HCR_TGE)) {
-                break;
-            }
-            /* fall through */
-        case 1:
-            /* ... the target is EL1 ... */
-            /* ... and SCTLR_ELx.SPAN == 0, then set to 1.  */
-            if ((env->cp15.sctlr_el[new_el] & SCTLR_SPAN) == 0) {
-                new_mode |= PSTATE_PAN;
-            }
-            break;
-        }
-    }
-    if (cpu_isar_feature(aa64_mte, cpu)) {
-        new_mode |= PSTATE_TCO;
-    }
-
-    if (cpu_isar_feature(aa64_ssbs, cpu)) {
-        if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_64) {
-            new_mode |= PSTATE_SSBS;
-        } else {
-            new_mode &= ~PSTATE_SSBS;
-        }
-    }
-
-    pstate_write(env, PSTATE_DAIF | new_mode);
-    env->aarch64 = 1;
-    aarch64_restore_sp(env, new_el);
-    helper_rebuild_hflags_a64(env, new_el);
-
-    env->pc = addr;
-
-    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
-                  new_el, env->pc, pstate_read(env));
-}
-
-/*
- * Do semihosting call and set the appropriate return value. All the
- * permission and validity checks have been done at translate time.
- *
- * We only see semihosting exceptions in TCG only as they are not
- * trapped to the hypervisor in KVM.
- */
-#ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (is_a64(env)) {
-        qemu_log_mask(CPU_LOG_INT,
-                      "...handling as semihosting call 0x%" PRIx64 "\n",
-                      env->xregs[0]);
-        env->xregs[0] = do_common_semihosting(cs);
-        env->pc += 4;
-    } else {
-        qemu_log_mask(CPU_LOG_INT,
-                      "...handling as semihosting call 0x%x\n",
-                      env->regs[0]);
-        env->regs[0] = do_common_semihosting(cs);
-        env->regs[15] += env->thumb ? 2 : 4;
-    }
-}
-#endif
-
-/* Handle a CPU exception for A and R profile CPUs.
- * Do any appropriate logging, handle PSCI calls, and then hand off
- * to the AArch64-entry or AArch32-entry function depending on the
- * target exception level's register width.
- *
- * Note: this is used for both TCG (as the do_interrupt tcg op),
- *       and KVM to re-inject guest debug exceptions, and to
- *       inject a Synchronous-External-Abort.
- */
-void arm_cpu_do_interrupt(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    unsigned int new_el = env->exception.target_el;
-
-    assert(!arm_feature(env, ARM_FEATURE_M));
-
-    arm_log_exception(cs->exception_index);
-    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
-                  new_el);
-    if (qemu_loglevel_mask(CPU_LOG_INT)
-        && !excp_is_internal(cs->exception_index)) {
-        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
-                      syn_get_ec(env->exception.syndrome),
-                      env->exception.syndrome);
-    }
-
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
-        arm_handle_psci_call(cpu);
-        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
-        return;
-    }
-
-    /*
-     * Semihosting semantics depend on the register width of the code
-     * that caused the exception, not the target exception level, so
-     * must be handled here.
-     */
-#ifdef CONFIG_TCG
-    if (cs->exception_index == EXCP_SEMIHOST) {
-        handle_semihosting(cs);
-        return;
-    }
-#endif
-
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
-    g_assert(qemu_mutex_iothread_locked());
-
-    arm_call_pre_el_change_hook(cpu);
-
-    assert(!excp_is_internal(cs->exception_index));
-    if (arm_el_is_aa64(env, new_el)) {
-        arm_cpu_do_interrupt_aarch64(cs);
-    } else {
-        arm_cpu_do_interrupt_aarch32(cs);
-    }
-
-    arm_call_el_change_hook(cpu);
-
-    if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-    }
-}
 #endif /* !CONFIG_USER_ONLY */
 
 /* Returns true if the stage 1 translation regime is using LPAE format page
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
new file mode 100644
index 0000000000..2c395f47e7
--- /dev/null
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -0,0 +1,73 @@
+/*
+ * QEMU ARM TCG CPU (sysemu code)
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
+#include "hw/core/tcg-cpu-ops.h"
+#include "semihosting/common-semi.h"
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
+#include "tcg/tcg-cpu.h"
+
+/*
+ * Do semihosting call and set the appropriate return value. All the
+ * permission and validity checks have been done at translate time.
+ *
+ * We only see semihosting exceptions in TCG only as they are not
+ * trapped to the hypervisor in KVM.
+ */
+void tcg_handle_semihosting(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (is_a64(env)) {
+        qemu_log_mask(CPU_LOG_INT,
+                      "...handling as semihosting call 0x%" PRIx64 "\n",
+                      env->xregs[0]);
+        env->xregs[0] = do_common_semihosting(cs);
+        env->pc += 4;
+    } else {
+        qemu_log_mask(CPU_LOG_INT,
+                      "...handling as semihosting call 0x%x\n",
+                      env->regs[0]);
+        env->regs[0] = do_common_semihosting(cs);
+        env->regs[15] += env->thumb ? 2 : 4;
+    }
+}
diff --git a/target/arm/cpu_tcg.c b/target/arm/tcg/tcg-cpu-models.c
similarity index 99%
rename from target/arm/cpu_tcg.c
rename to target/arm/tcg/tcg-cpu-models.c
index d120250b18..f4eea544b3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG CPUs.
+ * QEMU ARM TCG-only CPUs.
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -9,10 +9,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
-#ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
+#include "tcg-cpu.h"
+
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -24,7 +22,6 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -48,7 +45,6 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
@@ -833,7 +829,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -849,7 +844,6 @@ static struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_watchpoint = arm_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
diff --git a/target/arm/tcg/tcg-cpu.c b/target/arm/tcg/tcg-cpu.c
new file mode 100644
index 0000000000..9fd996d908
--- /dev/null
+++ b/target/arm/tcg/tcg-cpu.c
@@ -0,0 +1,229 @@
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
+#include "tcg-cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
+#include "cpregs.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+
+void arm_cpu_synchronize_from_tb(CPUState *cs,
+                                 const TranslationBlock *tb)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * It's OK to look at env for the current mode here, because it's
+     * never possible for an AArch64 TB to chain to an AArch32 TB.
+     */
+    if (is_a64(env)) {
+        env->pc = tb->pc;
+    } else {
+        env->regs[15] = tb->pc;
+    }
+}
+
+static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
+                                     unsigned int target_el,
+                                     unsigned int cur_el, bool secure,
+                                     uint64_t hcr_el2)
+{
+    CPUARMState *env = cs->env_ptr;
+    bool pstate_unmasked;
+    bool unmasked = false;
+
+    /*
+     * Don't take exceptions if they target a lower EL.
+     * This check should catch any exceptions that would not be taken
+     * but left pending.
+     */
+    if (cur_el > target_el) {
+        return false;
+    }
+
+    switch (excp_idx) {
+    case EXCP_FIQ:
+        pstate_unmasked = !(env->daif & PSTATE_F);
+        break;
+
+    case EXCP_IRQ:
+        pstate_unmasked = !(env->daif & PSTATE_I);
+        break;
+
+    case EXCP_VFIQ:
+        if (!(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
+            /* VFIQs are only taken when hypervized.  */
+            return false;
+        }
+        return !(env->daif & PSTATE_F);
+    case EXCP_VIRQ:
+        if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
+            /* VIRQs are only taken when hypervized.  */
+            return false;
+        }
+        return !(env->daif & PSTATE_I);
+    default:
+        g_assert_not_reached();
+    }
+
+    /*
+     * Use the target EL, current execution state and SCR/HCR settings to
+     * determine whether the corresponding CPSR bit is used to mask the
+     * interrupt.
+     */
+    if ((target_el > cur_el) && (target_el != 1)) {
+        /* Exceptions targeting a higher EL may not be maskable */
+        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+            /*
+             * 64-bit masking rules are simple: exceptions to EL3
+             * can't be masked, and exceptions to EL2 can only be
+             * masked from Secure state. The HCR and SCR settings
+             * don't affect the masking logic, only the interrupt routing.
+             */
+            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
+                unmasked = true;
+            }
+        } else {
+            /*
+             * The old 32-bit-only environment has a more complicated
+             * masking setup. HCR and SCR bits not only affect interrupt
+             * routing but also change the behaviour of masking.
+             */
+            bool hcr, scr;
+
+            switch (excp_idx) {
+            case EXCP_FIQ:
+                /*
+                 * If FIQs are routed to EL3 or EL2 then there are cases where
+                 * we override the CPSR.F in determining if the exception is
+                 * masked or not. If neither of these are set then we fall back
+                 * to the CPSR.F setting otherwise we further assess the state
+                 * below.
+                 */
+                hcr = hcr_el2 & HCR_FMO;
+                scr = (env->cp15.scr_el3 & SCR_FIQ);
+
+                /*
+                 * When EL3 is 32-bit, the SCR.FW bit controls whether the
+                 * CPSR.F bit masks FIQ interrupts when taken in non-secure
+                 * state. If SCR.FW is set then FIQs can be masked by CPSR.F
+                 * when non-secure but only when FIQs are only routed to EL3.
+                 */
+                scr = scr && !((env->cp15.scr_el3 & SCR_FW) && !hcr);
+                break;
+            case EXCP_IRQ:
+                /*
+                 * When EL3 execution state is 32-bit, if HCR.IMO is set then
+                 * we may override the CPSR.I masking when in non-secure state.
+                 * The SCR.IRQ setting has already been taken into consideration
+                 * when setting the target EL, so it does not have a further
+                 * affect here.
+                 */
+                hcr = hcr_el2 & HCR_IMO;
+                scr = false;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+
+            if ((scr || hcr) && !secure) {
+                unmasked = true;
+            }
+        }
+    }
+
+    /*
+     * The PSTATE bits only mask the interrupt if we have not overriden the
+     * ability above.
+     */
+    return unmasked || pstate_unmasked;
+}
+
+static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    CPUClass *cc = CPU_GET_CLASS(cs);
+    CPUARMState *env = cs->env_ptr;
+    uint32_t cur_el = arm_current_el(env);
+    bool secure = arm_is_secure(env);
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    uint32_t target_el;
+    uint32_t excp_idx;
+
+    /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
+
+    if (interrupt_request & CPU_INTERRUPT_FIQ) {
+        excp_idx = EXCP_FIQ;
+        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        excp_idx = EXCP_IRQ;
+        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_VIRQ) {
+        excp_idx = EXCP_VIRQ;
+        target_el = 1;
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_VFIQ) {
+        excp_idx = EXCP_VFIQ;
+        target_el = 1;
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    return false;
+
+ found:
+    cs->exception_index = excp_idx;
+    env->exception.target_el = target_el;
+    cc->tcg_ops->do_interrupt(cs);
+    return true;
+}
+
+struct TCGCPUOps arm_tcg_ops = {
+    .initialize = arm_translate_init,
+    .synchronize_from_tb = arm_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
+    .tlb_fill = arm_cpu_tlb_fill,
+    .debug_excp_handler = arm_debug_excp_handler,
+
+#if !defined(CONFIG_USER_ONLY)
+    .do_interrupt = arm_cpu_do_interrupt,
+    .do_transaction_failed = arm_cpu_do_transaction_failed,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
+    .adjust_watchpoint_address = arm_adjust_watchpoint_address,
+    .debug_check_watchpoint = arm_debug_check_watchpoint,
+#endif /* !CONFIG_USER_ONLY */
+};
diff --git a/target/arm/meson.build b/target/arm/meson.build
index e4ff9a0534..3166e88c0d 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -3,7 +3,6 @@ arm_ss.add(files(
   'cpu.c',
   'cpu32.c',
   'gdbstub.c',
-  'cpu_tcg.c',
   'cpu-mmu.c',
   'cpregs.c',
   'cpustate-list.c',
@@ -19,10 +18,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gdbstub64.c',
 ))
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cpu_tcg.c',
-))
-
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 6d372d44e6..d3d2f605d9 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -28,9 +28,11 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vfp_helper.c',
   'crypto_helper.c',
   'debug_helper.c',
+  'tcg-cpu.c',
+  'tcg-cpu-models.c',
 ))
 
-arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
+arm_ss.add(when: ['TARGET_AARCH64', 'CONFIG_TCG'], if_true: files(
   'translate-a64.c',
   'translate-sve.c',
   'helper-a64.c',
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 18f5230f6c..f9a6dd497f 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -4,4 +4,5 @@ arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
   'debug_helper.c',
   'tlb_helper.c',
   'm_helper.c',
+  'tcg-cpu.c',
 ))
-- 
2.26.2


