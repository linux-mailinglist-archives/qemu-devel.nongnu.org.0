Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB5235F2EF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:53:16 +0200 (CEST)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWe55-0004Y9-EU
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgh-0006bK-NH
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:45478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgN-0005bn-Bt
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F268B0BD;
 Wed, 14 Apr 2021 11:27:05 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v13 26/80] target/arm: move aarch64_sync_32_to_64 (and vv) to
 cpu code
Date: Wed, 14 Apr 2021 13:25:56 +0200
Message-Id: <20210414112650.18003-27-cfontana@suse.de>
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

and arm_phys_excp_target_el since it is tied up inside the
same #ifdef block.

aarch64_sync_32_to_64 and aarch64_sync_64_to_32 are
mixed in with the TCG helpers, but they shouldn't, as they
are needed for KVM too.

kvm_arch_get_registers()
{
    if (!is_a64(env)) {
        aarch64_sync_64_to_32(env);
    }
    write_kvmstate_to_list(cpu);
    write_list_to_cpustate(cpu);
    ...
}

kvm_arch_put_registers()
{
    if (!is_a64(env)) {
        aarch64_sync_32_to_64(env);
    }
    write_cpustate_to_list(cpu, true);
    write_list_to_kvmstate(cpu, level)
    ...
}

Move to the cpu module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-sysemu.c | 215 +++++++++++++++++++++++++++++++++++++
 target/arm/cpu-user.c   |  11 ++
 target/arm/tcg/helper.c | 232 +---------------------------------------
 3 files changed, 229 insertions(+), 229 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 3add2c2439..7a314bf805 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -133,3 +133,218 @@ void switch_mode(CPUARMState *env, int mode)
     env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
     env->regs[14] = env->banked_r14[r14_bank_number(mode)];
 }
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
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index a72b7f5703..0225089e46 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -22,3 +22,14 @@ void switch_mode(CPUARMState *env, int mode)
         cpu_abort(CPU(cpu), "Tried to switch out of user mode\n");
     }
 }
+
+void aarch64_sync_64_to_32(CPUARMState *env)
+{
+    g_assert_not_reached();
+}
+
+uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
+                                 uint32_t cur_el, bool secure)
+{
+    return 1;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 9763cae8f8..5ec8f9c005 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -590,22 +590,10 @@ uint32_t HELPER(rbit)(uint32_t x)
     return revbit32(x);
 }
 
-#ifdef CONFIG_USER_ONLY
-
-uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
-                                 uint32_t cur_el, bool secure)
-{
-    return 1;
-}
-
-void aarch64_sync_64_to_32(CPUARMState *env)
-{
-    g_assert_not_reached();
-}
-
-#else
+#ifndef CONFIG_USER_ONLY
 
-/* Physical Interrupt Target EL Lookup Table
+/*
+ * Physical Interrupt Target EL Lookup Table
  *
  * [ From ARM ARM section G1.13.4 (Table G1-15) ]
  *
@@ -754,220 +742,6 @@ void arm_log_exception(int idx)
     }
 }
 
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
-    /* Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
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
 static void take_aarch32_exception(CPUARMState *env, int new_mode,
                                    uint32_t mask, uint32_t offset,
                                    uint32_t newpc)
-- 
2.26.2


