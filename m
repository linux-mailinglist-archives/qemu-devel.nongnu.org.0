Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E234B033
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:34:16 +0100 (CET)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPt9r-0004Vr-Fl
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHo-0007Qj-Hw
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:46196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHi-0001JO-Rr
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 909B8AC3C;
 Fri, 26 Mar 2021 19:38:07 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 55/65] target/arm: cpu-exceptions: new module
Date: Fri, 26 Mar 2021 20:36:51 +0100
Message-Id: <20210326193701.5981-56-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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

extract the exception handling code from cpu-sysemu,
and split it into general arm code and an AArch64-specific part.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-exceptions-aa64.h |  32 +
 target/arm/cpu.h                 |   4 -
 target/arm/arch_dump.c           |   1 +
 target/arm/cpu-exceptions-aa64.c | 553 ++++++++++++++++++
 target/arm/cpu-exceptions.c      | 481 +++++++++++++++
 target/arm/cpu-sysemu.c          | 975 -------------------------------
 target/arm/cpu-user.c            |   1 +
 target/arm/cpu64.c               |   1 +
 target/arm/kvm/kvm64.c           |   1 +
 target/arm/tcg/helper-a64.c      |   1 +
 target/arm/tcg/helper.c          |   1 +
 target/arm/meson.build           |   5 +
 12 files changed, 1077 insertions(+), 979 deletions(-)
 create mode 100644 target/arm/cpu-exceptions-aa64.h
 create mode 100644 target/arm/cpu-exceptions-aa64.c
 create mode 100644 target/arm/cpu-exceptions.c

diff --git a/target/arm/cpu-exceptions-aa64.h b/target/arm/cpu-exceptions-aa64.h
new file mode 100644
index 0000000000..2929a83208
--- /dev/null
+++ b/target/arm/cpu-exceptions-aa64.h
@@ -0,0 +1,32 @@
+/*
+ * QEMU AArch64 CPU Exceptions Sysemu code
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
+#ifndef CPU_EXCEPTIONS_AA64_H
+#define CPU_EXCEPTIONS_AA64_H
+
+#include "cpu.h"
+
+int sve_exception_el(CPUARMState *env, int el);
+void aarch64_sync_64_to_32(CPUARMState *env);
+void aarch64_sync_32_to_64(CPUARMState *env);
+void arm_cpu_do_interrupt_aarch64(CPUState *cs);
+
+#endif /* CPU_EXCEPTIONS_AA64_H */
+
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c290e5d9f9..fd740e1940 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1092,11 +1092,7 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
 
 #endif /* TARGET_AARCH64 */
 
-void aarch64_sync_32_to_64(CPUARMState *env);
-void aarch64_sync_64_to_32(CPUARMState *env);
-
 int fp_exception_el(CPUARMState *env, int cur_el);
-int sve_exception_el(CPUARMState *env, int cur_el);
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
 
 /* you can call this signal handler from your SIGBUS and SIGSEGV
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 9cc75a6fda..88b3d50684 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "cpu-exceptions-aa64.h"
 #include "elf.h"
 #include "sysemu/dump.h"
 
diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
new file mode 100644
index 0000000000..dec4549841
--- /dev/null
+++ b/target/arm/cpu-exceptions-aa64.c
@@ -0,0 +1,553 @@
+/*
+ * QEMU AArch64 CPU Exceptions Sysemu code
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
+#include "qemu/log.h"
+#include "cpu.h"
+#include "internals.h"
+#include "sysemu/tcg.h"
+
+#include "cpu-exceptions-aa64.h"
+
+/*
+ * Function used to synchronize QEMU's AArch64 register set with AArch32
+ * register set.  This is necessary when switching between AArch32 and AArch64
+ * execution state.
+ */
+void aarch64_sync_32_to_64(CPUARMState *env)
+{
+    int i;
+    uint32_t mode = env->uncached_cpsr & CPSR_M;
+
+    /* We can blanket copy R[0:7] to X[0:7] */
+    for (i = 0; i < 8; i++) {
+        env->xregs[i] = env->regs[i];
+    }
+
+    /*
+     * Unless we are in FIQ mode, x8-x12 come from the user registers r8-r12.
+     * Otherwise, they come from the banked user regs.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 8; i < 13; i++) {
+            env->xregs[i] = env->usr_regs[i - 8];
+        }
+    } else {
+        for (i = 8; i < 13; i++) {
+            env->xregs[i] = env->regs[i];
+        }
+    }
+
+    /*
+     * Registers x13-x23 are the various mode SP and FP registers. Registers
+     * r13 and r14 are only copied if we are in that mode, otherwise we copy
+     * from the mode banked register.
+     */
+    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
+        env->xregs[13] = env->regs[13];
+        env->xregs[14] = env->regs[14];
+    } else {
+        env->xregs[13] = env->banked_r13[bank_number(ARM_CPU_MODE_USR)];
+        /* HYP is an exception in that it is copied from r14 */
+        if (mode == ARM_CPU_MODE_HYP) {
+            env->xregs[14] = env->regs[14];
+        } else {
+            env->xregs[14] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)];
+        }
+    }
+
+    if (mode == ARM_CPU_MODE_HYP) {
+        env->xregs[15] = env->regs[13];
+    } else {
+        env->xregs[15] = env->banked_r13[bank_number(ARM_CPU_MODE_HYP)];
+    }
+
+    if (mode == ARM_CPU_MODE_IRQ) {
+        env->xregs[16] = env->regs[14];
+        env->xregs[17] = env->regs[13];
+    } else {
+        env->xregs[16] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)];
+        env->xregs[17] = env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)];
+    }
+
+    if (mode == ARM_CPU_MODE_SVC) {
+        env->xregs[18] = env->regs[14];
+        env->xregs[19] = env->regs[13];
+    } else {
+        env->xregs[18] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)];
+        env->xregs[19] = env->banked_r13[bank_number(ARM_CPU_MODE_SVC)];
+    }
+
+    if (mode == ARM_CPU_MODE_ABT) {
+        env->xregs[20] = env->regs[14];
+        env->xregs[21] = env->regs[13];
+    } else {
+        env->xregs[20] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)];
+        env->xregs[21] = env->banked_r13[bank_number(ARM_CPU_MODE_ABT)];
+    }
+
+    if (mode == ARM_CPU_MODE_UND) {
+        env->xregs[22] = env->regs[14];
+        env->xregs[23] = env->regs[13];
+    } else {
+        env->xregs[22] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)];
+        env->xregs[23] = env->banked_r13[bank_number(ARM_CPU_MODE_UND)];
+    }
+
+    /*
+     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
+     * mode, then we can copy from r8-r14.  Otherwise, we copy from the
+     * FIQ bank for r8-r14.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 24; i < 31; i++) {
+            env->xregs[i] = env->regs[i - 16];   /* X[24:30] <- R[8:14] */
+        }
+    } else {
+        for (i = 24; i < 29; i++) {
+            env->xregs[i] = env->fiq_regs[i - 24];
+        }
+        env->xregs[29] = env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)];
+        env->xregs[30] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)];
+    }
+
+    env->pc = env->regs[15];
+}
+
+/*
+ * Function used to synchronize QEMU's AArch32 register set with AArch64
+ * register set.  This is necessary when switching between AArch32 and AArch64
+ * execution state.
+ */
+void aarch64_sync_64_to_32(CPUARMState *env)
+{
+    int i;
+    uint32_t mode = env->uncached_cpsr & CPSR_M;
+
+    /* We can blanket copy X[0:7] to R[0:7] */
+    for (i = 0; i < 8; i++) {
+        env->regs[i] = env->xregs[i];
+    }
+
+    /*
+     * Unless we are in FIQ mode, r8-r12 come from the user registers x8-x12.
+     * Otherwise, we copy x8-x12 into the banked user regs.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 8; i < 13; i++) {
+            env->usr_regs[i - 8] = env->xregs[i];
+        }
+    } else {
+        for (i = 8; i < 13; i++) {
+            env->regs[i] = env->xregs[i];
+        }
+    }
+
+    /*
+     * Registers r13 & r14 depend on the current mode.
+     * If we are in a given mode, we copy the corresponding x registers to r13
+     * and r14.  Otherwise, we copy the x register to the banked r13 and r14
+     * for the mode.
+     */
+    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
+        env->regs[13] = env->xregs[13];
+        env->regs[14] = env->xregs[14];
+    } else {
+        env->banked_r13[bank_number(ARM_CPU_MODE_USR)] = env->xregs[13];
+
+        /*
+         * HYP is an exception in that it does not have its own banked r14 but
+         * shares the USR r14
+         */
+        if (mode == ARM_CPU_MODE_HYP) {
+            env->regs[14] = env->xregs[14];
+        } else {
+            env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
+        }
+    }
+
+    if (mode == ARM_CPU_MODE_HYP) {
+        env->regs[13] = env->xregs[15];
+    } else {
+        env->banked_r13[bank_number(ARM_CPU_MODE_HYP)] = env->xregs[15];
+    }
+
+    if (mode == ARM_CPU_MODE_IRQ) {
+        env->regs[14] = env->xregs[16];
+        env->regs[13] = env->xregs[17];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
+        env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[17];
+    }
+
+    if (mode == ARM_CPU_MODE_SVC) {
+        env->regs[14] = env->xregs[18];
+        env->regs[13] = env->xregs[19];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
+        env->banked_r13[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[19];
+    }
+
+    if (mode == ARM_CPU_MODE_ABT) {
+        env->regs[14] = env->xregs[20];
+        env->regs[13] = env->xregs[21];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
+        env->banked_r13[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[21];
+    }
+
+    if (mode == ARM_CPU_MODE_UND) {
+        env->regs[14] = env->xregs[22];
+        env->regs[13] = env->xregs[23];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
+        env->banked_r13[bank_number(ARM_CPU_MODE_UND)] = env->xregs[23];
+    }
+
+    /*
+     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
+     * mode, then we can copy to r8-r14.  Otherwise, we copy to the
+     * FIQ bank for r8-r14.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 24; i < 31; i++) {
+            env->regs[i - 16] = env->xregs[i];   /* X[24:30] -> R[8:14] */
+        }
+    } else {
+        for (i = 24; i < 29; i++) {
+            env->fiq_regs[i - 24] = env->xregs[i];
+        }
+        env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[29];
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
+    }
+
+    env->regs[15] = env->pc;
+}
+
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  If an exception should be routed through
+ * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
+ * take care of raising that exception.
+ * C.f. the ARM pseudocode function CheckSVEEnabled.
+ */
+int sve_exception_el(CPUARMState *env, int el)
+{
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        bool disabled = false;
+
+        /*
+         * The CPACR.ZEN controls traps to EL1:
+         * 0, 2 : trap EL0 and EL1 accesses
+         * 1    : trap only EL0 accesses
+         * 3    : trap no accesses
+         */
+        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            /* route_to_el2 */
+            return hcr_el2 & HCR_TGE ? 2 : 1;
+        }
+
+        /* Check CPACR.FPEN.  */
+        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            return 0;
+        }
+    }
+
+    /*
+     * CPTR_EL2.  Since TZ and TFP are positive,
+     * they will be zero when EL2 is not present.
+     */
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        if (env->cp15.cptr_el[2] & CPTR_TZ) {
+            return 2;
+        }
+        if (env->cp15.cptr_el[2] & CPTR_TFP) {
+            return 0;
+        }
+    }
+
+    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
+        return 3;
+    }
+    return 0;
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
+void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
+    if (tcg_enabled()) {
+        /*
+         * Note that new_el can never be 0.  If cur_el is 0, then
+         * el0_a64 is is_a64(), else el0_a64 is ignored.
+         */
+        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    }
+
+    if (cur_el < new_el) {
+        /*
+         * Entry vector offset depends on whether the implemented EL
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
diff --git a/target/arm/cpu-exceptions.c b/target/arm/cpu-exceptions.c
new file mode 100644
index 0000000000..a09d57a004
--- /dev/null
+++ b/target/arm/cpu-exceptions.c
@@ -0,0 +1,481 @@
+/*
+ * QEMU ARM CPU Exceptions Sysemu code
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
+#include "qemu/log.h"
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "internals.h"
+#include "sysemu/tcg.h"
+
+#ifdef CONFIG_TCG
+#include "tcg/tcg-cpu.h"
+#endif /* CONFIG_TCG */
+
+#include "cpu-exceptions-aa64.h"
+
+void switch_mode(CPUARMState *env, int mode)
+{
+    int old_mode;
+    int i;
+
+    old_mode = env->uncached_cpsr & CPSR_M;
+    if (mode == old_mode) {
+        return;
+    }
+
+    if (old_mode == ARM_CPU_MODE_FIQ) {
+        memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
+    } else if (mode == ARM_CPU_MODE_FIQ) {
+        memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
+    }
+
+    i = bank_number(old_mode);
+    env->banked_r13[i] = env->regs[13];
+    env->banked_spsr[i] = env->spsr;
+
+    i = bank_number(mode);
+    env->regs[13] = env->banked_r13[i];
+    env->spsr = env->banked_spsr[i];
+
+    env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
+    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
+}
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
+        if (env->thumb) {
+            offset = 2;
+        } else {
+            offset = 4;
+        }
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
+        /*
+         * ARM v7 architectures provide a vector base address register to remap
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
+/*
+ * Handle a CPU exception for A and R profile CPUs.
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
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index a898a80990..fe1838ade2 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -79,978 +79,3 @@ bool arm_cpu_virtio_is_big_endian(CPUState *cs)
     cpu_synchronize_state(cs);
     return arm_cpu_data_is_big_endian(env);
 }
-
-void switch_mode(CPUARMState *env, int mode)
-{
-    int old_mode;
-    int i;
-
-    old_mode = env->uncached_cpsr & CPSR_M;
-    if (mode == old_mode) {
-        return;
-    }
-
-    if (old_mode == ARM_CPU_MODE_FIQ) {
-        memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
-    } else if (mode == ARM_CPU_MODE_FIQ) {
-        memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy(env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
-    }
-
-    i = bank_number(old_mode);
-    env->banked_r13[i] = env->regs[13];
-    env->banked_spsr[i] = env->spsr;
-
-    i = bank_number(mode);
-    env->regs[13] = env->banked_r13[i];
-    env->spsr = env->banked_spsr[i];
-
-    env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
-    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
-}
-
-/*
- * Function used to synchronize QEMU's AArch64 register set with AArch32
- * register set.  This is necessary when switching between AArch32 and AArch64
- * execution state.
- */
-void aarch64_sync_32_to_64(CPUARMState *env)
-{
-    int i;
-    uint32_t mode = env->uncached_cpsr & CPSR_M;
-
-    /* We can blanket copy R[0:7] to X[0:7] */
-    for (i = 0; i < 8; i++) {
-        env->xregs[i] = env->regs[i];
-    }
-
-    /*
-     * Unless we are in FIQ mode, x8-x12 come from the user registers r8-r12.
-     * Otherwise, they come from the banked user regs.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 8; i < 13; i++) {
-            env->xregs[i] = env->usr_regs[i - 8];
-        }
-    } else {
-        for (i = 8; i < 13; i++) {
-            env->xregs[i] = env->regs[i];
-        }
-    }
-
-    /*
-     * Registers x13-x23 are the various mode SP and FP registers. Registers
-     * r13 and r14 are only copied if we are in that mode, otherwise we copy
-     * from the mode banked register.
-     */
-    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
-        env->xregs[13] = env->regs[13];
-        env->xregs[14] = env->regs[14];
-    } else {
-        env->xregs[13] = env->banked_r13[bank_number(ARM_CPU_MODE_USR)];
-        /* HYP is an exception in that it is copied from r14 */
-        if (mode == ARM_CPU_MODE_HYP) {
-            env->xregs[14] = env->regs[14];
-        } else {
-            env->xregs[14] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)];
-        }
-    }
-
-    if (mode == ARM_CPU_MODE_HYP) {
-        env->xregs[15] = env->regs[13];
-    } else {
-        env->xregs[15] = env->banked_r13[bank_number(ARM_CPU_MODE_HYP)];
-    }
-
-    if (mode == ARM_CPU_MODE_IRQ) {
-        env->xregs[16] = env->regs[14];
-        env->xregs[17] = env->regs[13];
-    } else {
-        env->xregs[16] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)];
-        env->xregs[17] = env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)];
-    }
-
-    if (mode == ARM_CPU_MODE_SVC) {
-        env->xregs[18] = env->regs[14];
-        env->xregs[19] = env->regs[13];
-    } else {
-        env->xregs[18] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)];
-        env->xregs[19] = env->banked_r13[bank_number(ARM_CPU_MODE_SVC)];
-    }
-
-    if (mode == ARM_CPU_MODE_ABT) {
-        env->xregs[20] = env->regs[14];
-        env->xregs[21] = env->regs[13];
-    } else {
-        env->xregs[20] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)];
-        env->xregs[21] = env->banked_r13[bank_number(ARM_CPU_MODE_ABT)];
-    }
-
-    if (mode == ARM_CPU_MODE_UND) {
-        env->xregs[22] = env->regs[14];
-        env->xregs[23] = env->regs[13];
-    } else {
-        env->xregs[22] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)];
-        env->xregs[23] = env->banked_r13[bank_number(ARM_CPU_MODE_UND)];
-    }
-
-    /*
-     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
-     * mode, then we can copy from r8-r14.  Otherwise, we copy from the
-     * FIQ bank for r8-r14.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 24; i < 31; i++) {
-            env->xregs[i] = env->regs[i - 16];   /* X[24:30] <- R[8:14] */
-        }
-    } else {
-        for (i = 24; i < 29; i++) {
-            env->xregs[i] = env->fiq_regs[i - 24];
-        }
-        env->xregs[29] = env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)];
-        env->xregs[30] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)];
-    }
-
-    env->pc = env->regs[15];
-}
-
-/*
- * Function used to synchronize QEMU's AArch32 register set with AArch64
- * register set.  This is necessary when switching between AArch32 and AArch64
- * execution state.
- */
-void aarch64_sync_64_to_32(CPUARMState *env)
-{
-    int i;
-    uint32_t mode = env->uncached_cpsr & CPSR_M;
-
-    /* We can blanket copy X[0:7] to R[0:7] */
-    for (i = 0; i < 8; i++) {
-        env->regs[i] = env->xregs[i];
-    }
-
-    /*
-     * Unless we are in FIQ mode, r8-r12 come from the user registers x8-x12.
-     * Otherwise, we copy x8-x12 into the banked user regs.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 8; i < 13; i++) {
-            env->usr_regs[i - 8] = env->xregs[i];
-        }
-    } else {
-        for (i = 8; i < 13; i++) {
-            env->regs[i] = env->xregs[i];
-        }
-    }
-
-    /*
-     * Registers r13 & r14 depend on the current mode.
-     * If we are in a given mode, we copy the corresponding x registers to r13
-     * and r14.  Otherwise, we copy the x register to the banked r13 and r14
-     * for the mode.
-     */
-    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
-        env->regs[13] = env->xregs[13];
-        env->regs[14] = env->xregs[14];
-    } else {
-        env->banked_r13[bank_number(ARM_CPU_MODE_USR)] = env->xregs[13];
-
-        /*
-         * HYP is an exception in that it does not have its own banked r14 but
-         * shares the USR r14
-         */
-        if (mode == ARM_CPU_MODE_HYP) {
-            env->regs[14] = env->xregs[14];
-        } else {
-            env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
-        }
-    }
-
-    if (mode == ARM_CPU_MODE_HYP) {
-        env->regs[13] = env->xregs[15];
-    } else {
-        env->banked_r13[bank_number(ARM_CPU_MODE_HYP)] = env->xregs[15];
-    }
-
-    if (mode == ARM_CPU_MODE_IRQ) {
-        env->regs[14] = env->xregs[16];
-        env->regs[13] = env->xregs[17];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
-        env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[17];
-    }
-
-    if (mode == ARM_CPU_MODE_SVC) {
-        env->regs[14] = env->xregs[18];
-        env->regs[13] = env->xregs[19];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
-        env->banked_r13[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[19];
-    }
-
-    if (mode == ARM_CPU_MODE_ABT) {
-        env->regs[14] = env->xregs[20];
-        env->regs[13] = env->xregs[21];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
-        env->banked_r13[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[21];
-    }
-
-    if (mode == ARM_CPU_MODE_UND) {
-        env->regs[14] = env->xregs[22];
-        env->regs[13] = env->xregs[23];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
-        env->banked_r13[bank_number(ARM_CPU_MODE_UND)] = env->xregs[23];
-    }
-
-    /*
-     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
-     * mode, then we can copy to r8-r14.  Otherwise, we copy to the
-     * FIQ bank for r8-r14.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 24; i < 31; i++) {
-            env->regs[i - 16] = env->xregs[i];   /* X[24:30] -> R[8:14] */
-        }
-    } else {
-        for (i = 24; i < 29; i++) {
-            env->fiq_regs[i - 24] = env->xregs[i];
-        }
-        env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[29];
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
-    }
-
-    env->regs[15] = env->pc;
-}
-
-/*
- * Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
- * C.f. the ARM pseudocode function CheckSVEEnabled.
- */
-int sve_exception_el(CPUARMState *env, int el)
-{
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        bool disabled = false;
-
-        /*
-         * The CPACR.ZEN controls traps to EL1:
-         * 0, 2 : trap EL0 and EL1 accesses
-         * 1    : trap only EL0 accesses
-         * 3    : trap no accesses
-         */
-        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
-        }
-
-        /* Check CPACR.FPEN.  */
-        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            return 0;
-        }
-    }
-
-    /*
-     * CPTR_EL2.  Since TZ and TFP are positive,
-     * they will be zero when EL2 is not present.
-     */
-    if (el <= 2 && arm_is_el2_enabled(env)) {
-        if (env->cp15.cptr_el[2] & CPTR_TZ) {
-            return 2;
-        }
-        if (env->cp15.cptr_el[2] & CPTR_TFP) {
-            return 0;
-        }
-    }
-
-    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
-    if (arm_feature(env, ARM_FEATURE_EL3)
-        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
-        return 3;
-    }
-    return 0;
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
-#ifdef CONFIG_TCG
-    arm_rebuild_hflags(env);
-#endif /* CONFIG_TCG */
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
-        if (env->thumb) {
-            offset = 2;
-        } else {
-            offset = 4;
-        }
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
-        /*
-         * ARM v7 architectures provide a vector base address register to remap
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
-    if (tcg_enabled()) {
-        /*
-         * Note that new_el can never be 0.  If cur_el is 0, then
-         * el0_a64 is is_a64(), else el0_a64 is ignored.
-         */
-        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
-    }
-
-    if (cur_el < new_el) {
-        /*
-         * Entry vector offset depends on whether the implemented EL
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
-    pstate_write(env, PSTATE_DAIF | new_mode);
-    env->aarch64 = 1;
-    aarch64_restore_sp(env, new_el);
-#ifdef CONFIG_TCG
-    arm_rebuild_hflags(env);
-#endif /* CONFIG_TCG */
-
-    env->pc = addr;
-
-    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
-                  new_el, env->pc, pstate_read(env));
-}
-
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
-/*
- * Handle a CPU exception for A and R profile CPUs.
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
-#ifdef CONFIG_TCG
-    if (tcg_enabled()) {
-        if (arm_is_psci_call(cpu, cs->exception_index)) {
-            arm_handle_psci_call(cpu);
-            qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
-            return;
-        }
-        /*
-         * Semihosting semantics depend on the register width of the code
-         * that caused the exception, not the target exception level, so
-         * must be handled here.
-         */
-        if (cs->exception_index == EXCP_SEMIHOST) {
-            tcg_handle_semihosting(cs);
-            return;
-        }
-    }
-#endif /* CONFIG_TCG */
-    /*
-     * Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
-    g_assert(qemu_mutex_iothread_locked());
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
-    if (tcg_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-    }
-}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index 39093ade76..51e9020f17 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -12,6 +12,7 @@
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "cpu-exceptions-aa64.h"
 #include "internals.h"
 
 void switch_mode(CPUARMState *env, int mode)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 52d8bff267..b09e373486 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -23,6 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "cpu-sve.h"
+#include "cpu-exceptions-aa64.h"
 #include "qemu/module.h"
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
diff --git a/target/arm/kvm/kvm64.c b/target/arm/kvm/kvm64.c
index dff85f6db9..b34642e74c 100644
--- a/target/arm/kvm/kvm64.c
+++ b/target/arm/kvm/kvm64.c
@@ -19,6 +19,7 @@
 #include "qemu-common.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "cpu-exceptions-aa64.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 #include "qemu/host-utils.h"
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 061c8ff846..b75ce80473 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "cpu.h"
+#include "cpu-exceptions-aa64.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 470b2894e3..6fc037b132 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "cpu-exceptions-aa64.h"
 #include "internals.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
diff --git a/target/arm/meson.build b/target/arm/meson.build
index bad5a659a7..8bcd394828 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -21,12 +21,17 @@ arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cpu-exceptions.c',
   'cpu-mmu-sysemu.c',
   'cpu-sysemu.c',
   'machine.c',
   'monitor.c',
 ))
 
+arm_softmmu_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu-exceptions-aa64.c'
+))
+
 arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'psci.c',
 ))
-- 
2.26.2


