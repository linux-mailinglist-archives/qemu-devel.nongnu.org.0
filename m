Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677F316A54
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:36:26 +0100 (CET)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rXV-0003tp-Hk
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQl-0004C6-Su
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:54692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQe-00005c-5G
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D607FB13A;
 Wed, 10 Feb 2021 15:29:08 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 14/14] i386: split seg_helper into user-only and softmmu
 parts
Date: Wed, 10 Feb 2021 16:28:59 +0100
Message-Id: <20210210152859.25920-15-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210152859.25920-1-cfontana@suse.de>
References: <20210210152859.25920-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/tcg/helper-tcg.h                 |   5 +
 target/i386/tcg/seg_helper.h                 |  66 ++++++
 target/i386/tcg/seg_helper.c                 | 233 +------------------
 target/i386/tcg/softmmu/seg_helper_softmmu.c | 129 ++++++++++
 target/i386/tcg/user/seg_helper_user.c       | 111 +++++++++
 target/i386/tcg/softmmu/meson.build          |   1 +
 target/i386/tcg/user/meson.build             |   1 +
 7 files changed, 317 insertions(+), 229 deletions(-)
 create mode 100644 target/i386/tcg/seg_helper.h
 create mode 100644 target/i386/tcg/softmmu/seg_helper_softmmu.c
 create mode 100644 target/i386/tcg/user/seg_helper_user.c

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index b420b3356d..30eacdbbc9 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -88,6 +88,11 @@ void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1);
 
 /* seg_helper.c */
 void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
+void do_interrupt_all(X86CPU *cpu, int intno, int is_int,
+                      int error_code, target_ulong next_eip, int is_hw);
+void handle_even_inj(CPUX86State *env, int intno, int is_int,
+                     int error_code, int is_hw, int rm);
+int exception_has_error_code(int intno);
 
 /* smm_helper.c */
 void do_smm_enter(X86CPU *cpu);
diff --git a/target/i386/tcg/seg_helper.h b/target/i386/tcg/seg_helper.h
new file mode 100644
index 0000000000..ebf1035277
--- /dev/null
+++ b/target/i386/tcg/seg_helper.h
@@ -0,0 +1,66 @@
+/*
+ *  x86 segmentation related helpers macros
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef SEG_HELPER_H
+#define SEG_HELPER_H
+
+//#define DEBUG_PCALL
+
+#ifdef DEBUG_PCALL
+# define LOG_PCALL(...) qemu_log_mask(CPU_LOG_PCALL, ## __VA_ARGS__)
+# define LOG_PCALL_STATE(cpu)                                  \
+    log_cpu_state_mask(CPU_LOG_PCALL, (cpu), CPU_DUMP_CCOP)
+#else
+# define LOG_PCALL(...) do { } while (0)
+# define LOG_PCALL_STATE(cpu) do { } while (0)
+#endif
+
+/*
+ * TODO: Convert callers to compute cpu_mmu_index_kernel once
+ * and use *_mmuidx_ra directly.
+ */
+#define cpu_ldub_kernel_ra(e, p, r) \
+    cpu_ldub_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
+#define cpu_lduw_kernel_ra(e, p, r) \
+    cpu_lduw_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
+#define cpu_ldl_kernel_ra(e, p, r) \
+    cpu_ldl_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
+#define cpu_ldq_kernel_ra(e, p, r) \
+    cpu_ldq_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
+
+#define cpu_stb_kernel_ra(e, p, v, r) \
+    cpu_stb_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
+#define cpu_stw_kernel_ra(e, p, v, r) \
+    cpu_stw_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
+#define cpu_stl_kernel_ra(e, p, v, r) \
+    cpu_stl_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
+#define cpu_stq_kernel_ra(e, p, v, r) \
+    cpu_stq_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
+
+#define cpu_ldub_kernel(e, p)    cpu_ldub_kernel_ra(e, p, 0)
+#define cpu_lduw_kernel(e, p)    cpu_lduw_kernel_ra(e, p, 0)
+#define cpu_ldl_kernel(e, p)     cpu_ldl_kernel_ra(e, p, 0)
+#define cpu_ldq_kernel(e, p)     cpu_ldq_kernel_ra(e, p, 0)
+
+#define cpu_stb_kernel(e, p, v)  cpu_stb_kernel_ra(e, p, v, 0)
+#define cpu_stw_kernel(e, p, v)  cpu_stw_kernel_ra(e, p, v, 0)
+#define cpu_stl_kernel(e, p, v)  cpu_stl_kernel_ra(e, p, v, 0)
+#define cpu_stq_kernel(e, p, v)  cpu_stq_kernel_ra(e, p, v, 0)
+
+#endif /* SEG_HELPER_H */
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 180d47f0e9..532f6f40d1 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -26,49 +26,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "helper-tcg.h"
-
-//#define DEBUG_PCALL
-
-#ifdef DEBUG_PCALL
-# define LOG_PCALL(...) qemu_log_mask(CPU_LOG_PCALL, ## __VA_ARGS__)
-# define LOG_PCALL_STATE(cpu)                                  \
-    log_cpu_state_mask(CPU_LOG_PCALL, (cpu), CPU_DUMP_CCOP)
-#else
-# define LOG_PCALL(...) do { } while (0)
-# define LOG_PCALL_STATE(cpu) do { } while (0)
-#endif
-
-/*
- * TODO: Convert callers to compute cpu_mmu_index_kernel once
- * and use *_mmuidx_ra directly.
- */
-#define cpu_ldub_kernel_ra(e, p, r) \
-    cpu_ldub_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
-#define cpu_lduw_kernel_ra(e, p, r) \
-    cpu_lduw_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
-#define cpu_ldl_kernel_ra(e, p, r) \
-    cpu_ldl_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
-#define cpu_ldq_kernel_ra(e, p, r) \
-    cpu_ldq_mmuidx_ra(e, p, cpu_mmu_index_kernel(e), r)
-
-#define cpu_stb_kernel_ra(e, p, v, r) \
-    cpu_stb_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
-#define cpu_stw_kernel_ra(e, p, v, r) \
-    cpu_stw_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
-#define cpu_stl_kernel_ra(e, p, v, r) \
-    cpu_stl_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
-#define cpu_stq_kernel_ra(e, p, v, r) \
-    cpu_stq_mmuidx_ra(e, p, v, cpu_mmu_index_kernel(e), r)
-
-#define cpu_ldub_kernel(e, p)    cpu_ldub_kernel_ra(e, p, 0)
-#define cpu_lduw_kernel(e, p)    cpu_lduw_kernel_ra(e, p, 0)
-#define cpu_ldl_kernel(e, p)     cpu_ldl_kernel_ra(e, p, 0)
-#define cpu_ldq_kernel(e, p)     cpu_ldq_kernel_ra(e, p, 0)
-
-#define cpu_stb_kernel(e, p, v)  cpu_stb_kernel_ra(e, p, v, 0)
-#define cpu_stw_kernel(e, p, v)  cpu_stw_kernel_ra(e, p, v, 0)
-#define cpu_stl_kernel(e, p, v)  cpu_stl_kernel_ra(e, p, v, 0)
-#define cpu_stq_kernel(e, p, v)  cpu_stq_kernel_ra(e, p, v, 0)
+#include "seg_helper.h"
 
 /* return non zero if error */
 static inline int load_segment_ra(CPUX86State *env, uint32_t *e1_ptr,
@@ -531,7 +489,7 @@ static inline unsigned int get_sp_mask(unsigned int e2)
     }
 }
 
-static int exception_has_error_code(int intno)
+int exception_has_error_code(int intno)
 {
     switch (intno) {
     case 8:
@@ -976,72 +934,6 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
 }
 #endif
 
-#ifdef TARGET_X86_64
-#if defined(CONFIG_USER_ONLY)
-void helper_syscall(CPUX86State *env, int next_eip_addend)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_SYSCALL;
-    env->exception_is_int = 0;
-    env->exception_next_eip = env->eip + next_eip_addend;
-    cpu_loop_exit(cs);
-}
-#else
-void helper_syscall(CPUX86State *env, int next_eip_addend)
-{
-    int selector;
-
-    if (!(env->efer & MSR_EFER_SCE)) {
-        raise_exception_err_ra(env, EXCP06_ILLOP, 0, GETPC());
-    }
-    selector = (env->star >> 32) & 0xffff;
-    if (env->hflags & HF_LMA_MASK) {
-        int code64;
-
-        env->regs[R_ECX] = env->eip + next_eip_addend;
-        env->regs[11] = cpu_compute_eflags(env) & ~RF_MASK;
-
-        code64 = env->hflags & HF_CS64_MASK;
-
-        env->eflags &= ~(env->fmask | RF_MASK);
-        cpu_load_eflags(env, env->eflags, 0);
-        cpu_x86_load_seg_cache(env, R_CS, selector & 0xfffc,
-                           0, 0xffffffff,
-                               DESC_G_MASK | DESC_P_MASK |
-                               DESC_S_MASK |
-                               DESC_CS_MASK | DESC_R_MASK | DESC_A_MASK |
-                               DESC_L_MASK);
-        cpu_x86_load_seg_cache(env, R_SS, (selector + 8) & 0xfffc,
-                               0, 0xffffffff,
-                               DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
-                               DESC_S_MASK |
-                               DESC_W_MASK | DESC_A_MASK);
-        if (code64) {
-            env->eip = env->lstar;
-        } else {
-            env->eip = env->cstar;
-        }
-    } else {
-        env->regs[R_ECX] = (uint32_t)(env->eip + next_eip_addend);
-
-        env->eflags &= ~(IF_MASK | RF_MASK | VM_MASK);
-        cpu_x86_load_seg_cache(env, R_CS, selector & 0xfffc,
-                           0, 0xffffffff,
-                               DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
-                               DESC_S_MASK |
-                               DESC_CS_MASK | DESC_R_MASK | DESC_A_MASK);
-        cpu_x86_load_seg_cache(env, R_SS, (selector + 8) & 0xfffc,
-                               0, 0xffffffff,
-                               DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
-                               DESC_S_MASK |
-                               DESC_W_MASK | DESC_A_MASK);
-        env->eip = (uint32_t)env->star;
-    }
-}
-#endif
-#endif
-
 #ifdef TARGET_X86_64
 void helper_sysret(CPUX86State *env, int dflag)
 {
@@ -1136,84 +1028,13 @@ static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
     env->eflags &= ~(IF_MASK | TF_MASK | AC_MASK | RF_MASK);
 }
 
-#if defined(CONFIG_USER_ONLY)
-/* fake user mode interrupt. is_int is TRUE if coming from the int
- * instruction. next_eip is the env->eip value AFTER the interrupt
- * instruction. It is only relevant if is_int is TRUE or if intno
- * is EXCP_SYSCALL.
- */
-static void do_interrupt_user(CPUX86State *env, int intno, int is_int,
-                              int error_code, target_ulong next_eip)
-{
-    if (is_int) {
-        SegmentCache *dt;
-        target_ulong ptr;
-        int dpl, cpl, shift;
-        uint32_t e2;
-
-        dt = &env->idt;
-        if (env->hflags & HF_LMA_MASK) {
-            shift = 4;
-        } else {
-            shift = 3;
-        }
-        ptr = dt->base + (intno << shift);
-        e2 = cpu_ldl_kernel(env, ptr + 4);
-
-        dpl = (e2 >> DESC_DPL_SHIFT) & 3;
-        cpl = env->hflags & HF_CPL_MASK;
-        /* check privilege if software int */
-        if (dpl < cpl) {
-            raise_exception_err(env, EXCP0D_GPF, (intno << shift) + 2);
-        }
-    }
-
-    /* Since we emulate only user space, we cannot do more than
-       exiting the emulation with the suitable exception and error
-       code. So update EIP for INT 0x80 and EXCP_SYSCALL. */
-    if (is_int || intno == EXCP_SYSCALL) {
-        env->eip = next_eip;
-    }
-}
-
-#else
-
-static void handle_even_inj(CPUX86State *env, int intno, int is_int,
-                            int error_code, int is_hw, int rm)
-{
-    CPUState *cs = env_cpu(env);
-    uint32_t event_inj = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
-                                                          control.event_inj));
-
-    if (!(event_inj & SVM_EVTINJ_VALID)) {
-        int type;
-
-        if (is_int) {
-            type = SVM_EVTINJ_TYPE_SOFT;
-        } else {
-            type = SVM_EVTINJ_TYPE_EXEPT;
-        }
-        event_inj = intno | type | SVM_EVTINJ_VALID;
-        if (!rm && exception_has_error_code(intno)) {
-            event_inj |= SVM_EVTINJ_VALID_ERR;
-            x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
-                                             control.event_inj_err),
-                     error_code);
-        }
-        x86_stl_phys(cs,
-                 env->vm_vmcb + offsetof(struct vmcb, control.event_inj),
-                 event_inj);
-    }
-}
-#endif
-
 /*
  * Begin execution of an interruption. is_int is TRUE if coming from
  * the int instruction. next_eip is the env->eip value AFTER the interrupt
  * instruction. It is only relevant if is_int is TRUE.
  */
-static void do_interrupt_all(X86CPU *cpu, int intno, int is_int,
-                             int error_code, target_ulong next_eip, int is_hw)
+void do_interrupt_all(X86CPU *cpu, int intno, int is_int,
+                      int error_code, target_ulong next_eip, int is_hw)
 {
     CPUX86State *env = &cpu->env;
 
@@ -1289,36 +1110,6 @@ static void do_interrupt_all(X86CPU *cpu, int intno, int is_int,
 #endif
 }
 
-void x86_cpu_do_interrupt(CPUState *cs)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-
-#if defined(CONFIG_USER_ONLY)
-    /* if user mode only, we simulate a fake exception
-       which will be handled outside the cpu execution
-       loop */
-    do_interrupt_user(env, cs->exception_index,
-                      env->exception_is_int,
-                      env->error_code,
-                      env->exception_next_eip);
-    /* successfully delivered */
-    env->old_exception = -1;
-#else
-    if (cs->exception_index >= EXCP_VMEXIT) {
-        assert(env->old_exception == -1);
-        do_vmexit(env, cs->exception_index - EXCP_VMEXIT, env->error_code);
-    } else {
-        do_interrupt_all(cpu, cs->exception_index,
-                         env->exception_is_int,
-                         env->error_code,
-                         env->exception_next_eip, 0);
-        /* successfully delivered */
-        env->old_exception = -1;
-    }
-#endif
-}
-
 void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw)
 {
     do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_hw);
@@ -2622,22 +2413,6 @@ void helper_verw(CPUX86State *env, target_ulong selector1)
     CC_SRC = eflags | CC_Z;
 }
 
-#if defined(CONFIG_USER_ONLY)
-void cpu_x86_load_seg(CPUX86State *env, X86Seg seg_reg, int selector)
-{
-    if (!(env->cr[0] & CR0_PE_MASK) || (env->eflags & VM_MASK)) {
-        int dpl = (env->eflags & VM_MASK) ? 3 : 0;
-        selector &= 0xffff;
-        cpu_x86_load_seg_cache(env, seg_reg, selector,
-                               (selector << 4), 0xffff,
-                               DESC_P_MASK | DESC_S_MASK | DESC_W_MASK |
-                               DESC_A_MASK | (dpl << DESC_DPL_SHIFT));
-    } else {
-        helper_load_seg(env, seg_reg, selector);
-    }
-}
-#endif
-
 /* check if Port I/O is allowed in TSS */
 static inline void check_io(CPUX86State *env, int addr, int size,
                             uintptr_t retaddr)
diff --git a/target/i386/tcg/softmmu/seg_helper_softmmu.c b/target/i386/tcg/softmmu/seg_helper_softmmu.c
new file mode 100644
index 0000000000..a89a7577a2
--- /dev/null
+++ b/target/i386/tcg/softmmu/seg_helper_softmmu.c
@@ -0,0 +1,129 @@
+/*
+ *  x86 segmentation related helpers: (softmmu-only code)
+ *  TSS, interrupts, system calls, jumps and call/task gates, descriptors
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/log.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/log.h"
+#include "tcg/helper-tcg.h"
+#include "tcg/seg_helper.h"
+
+#ifdef TARGET_X86_64
+void helper_syscall(CPUX86State *env, int next_eip_addend)
+{
+    int selector;
+
+    if (!(env->efer & MSR_EFER_SCE)) {
+        raise_exception_err_ra(env, EXCP06_ILLOP, 0, GETPC());
+    }
+    selector = (env->star >> 32) & 0xffff;
+    if (env->hflags & HF_LMA_MASK) {
+        int code64;
+
+        env->regs[R_ECX] = env->eip + next_eip_addend;
+        env->regs[11] = cpu_compute_eflags(env) & ~RF_MASK;
+
+        code64 = env->hflags & HF_CS64_MASK;
+
+        env->eflags &= ~(env->fmask | RF_MASK);
+        cpu_load_eflags(env, env->eflags, 0);
+        cpu_x86_load_seg_cache(env, R_CS, selector & 0xfffc,
+                           0, 0xffffffff,
+                               DESC_G_MASK | DESC_P_MASK |
+                               DESC_S_MASK |
+                               DESC_CS_MASK | DESC_R_MASK | DESC_A_MASK |
+                               DESC_L_MASK);
+        cpu_x86_load_seg_cache(env, R_SS, (selector + 8) & 0xfffc,
+                               0, 0xffffffff,
+                               DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
+                               DESC_S_MASK |
+                               DESC_W_MASK | DESC_A_MASK);
+        if (code64) {
+            env->eip = env->lstar;
+        } else {
+            env->eip = env->cstar;
+        }
+    } else {
+        env->regs[R_ECX] = (uint32_t)(env->eip + next_eip_addend);
+
+        env->eflags &= ~(IF_MASK | RF_MASK | VM_MASK);
+        cpu_x86_load_seg_cache(env, R_CS, selector & 0xfffc,
+                           0, 0xffffffff,
+                               DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
+                               DESC_S_MASK |
+                               DESC_CS_MASK | DESC_R_MASK | DESC_A_MASK);
+        cpu_x86_load_seg_cache(env, R_SS, (selector + 8) & 0xfffc,
+                               0, 0xffffffff,
+                               DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
+                               DESC_S_MASK |
+                               DESC_W_MASK | DESC_A_MASK);
+        env->eip = (uint32_t)env->star;
+    }
+}
+#endif /* TARGET_X86_64 */
+
+void handle_even_inj(CPUX86State *env, int intno, int is_int,
+                     int error_code, int is_hw, int rm)
+{
+    CPUState *cs = env_cpu(env);
+    uint32_t event_inj = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
+                                                          control.event_inj));
+
+    if (!(event_inj & SVM_EVTINJ_VALID)) {
+        int type;
+
+        if (is_int) {
+            type = SVM_EVTINJ_TYPE_SOFT;
+        } else {
+            type = SVM_EVTINJ_TYPE_EXEPT;
+        }
+        event_inj = intno | type | SVM_EVTINJ_VALID;
+        if (!rm && exception_has_error_code(intno)) {
+            event_inj |= SVM_EVTINJ_VALID_ERR;
+            x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
+                                             control.event_inj_err),
+                     error_code);
+        }
+        x86_stl_phys(cs,
+                 env->vm_vmcb + offsetof(struct vmcb, control.event_inj),
+                 event_inj);
+    }
+}
+
+void x86_cpu_do_interrupt(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    if (cs->exception_index >= EXCP_VMEXIT) {
+        assert(env->old_exception == -1);
+        do_vmexit(env, cs->exception_index - EXCP_VMEXIT, env->error_code);
+    } else {
+        do_interrupt_all(cpu, cs->exception_index,
+                         env->exception_is_int,
+                         env->error_code,
+                         env->exception_next_eip, 0);
+        /* successfully delivered */
+        env->old_exception = -1;
+    }
+}
diff --git a/target/i386/tcg/user/seg_helper_user.c b/target/i386/tcg/user/seg_helper_user.c
new file mode 100644
index 0000000000..8d10425914
--- /dev/null
+++ b/target/i386/tcg/user/seg_helper_user.c
@@ -0,0 +1,111 @@
+/*
+ *  x86 segmentation related helpers:
+ *  TSS, interrupts, system calls, jumps and call/task gates, descriptors
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/log.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/log.h"
+#include "tcg/helper-tcg.h"
+#include "tcg/seg_helper.h"
+
+#ifdef TARGET_X86_64
+void helper_syscall(CPUX86State *env, int next_eip_addend)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_SYSCALL;
+    env->exception_is_int = 0;
+    env->exception_next_eip = env->eip + next_eip_addend;
+    cpu_loop_exit(cs);
+}
+#endif /* TARGET_X86_64 */
+
+/*
+ * fake user mode interrupt. is_int is TRUE if coming from the int
+ * instruction. next_eip is the env->eip value AFTER the interrupt
+ * instruction. It is only relevant if is_int is TRUE or if intno
+ * is EXCP_SYSCALL.
+ */
+static void do_interrupt_user(CPUX86State *env, int intno, int is_int,
+                              int error_code, target_ulong next_eip)
+{
+    if (is_int) {
+        SegmentCache *dt;
+        target_ulong ptr;
+        int dpl, cpl, shift;
+        uint32_t e2;
+
+        dt = &env->idt;
+        if (env->hflags & HF_LMA_MASK) {
+            shift = 4;
+        } else {
+            shift = 3;
+        }
+        ptr = dt->base + (intno << shift);
+        e2 = cpu_ldl_kernel(env, ptr + 4);
+
+        dpl = (e2 >> DESC_DPL_SHIFT) & 3;
+        cpl = env->hflags & HF_CPL_MASK;
+        /* check privilege if software int */
+        if (dpl < cpl) {
+            raise_exception_err(env, EXCP0D_GPF, (intno << shift) + 2);
+        }
+    }
+
+    /* Since we emulate only user space, we cannot do more than
+       exiting the emulation with the suitable exception and error
+       code. So update EIP for INT 0x80 and EXCP_SYSCALL. */
+    if (is_int || intno == EXCP_SYSCALL) {
+        env->eip = next_eip;
+    }
+}
+
+void x86_cpu_do_interrupt(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    /* if user mode only, we simulate a fake exception
+       which will be handled outside the cpu execution
+       loop */
+    do_interrupt_user(env, cs->exception_index,
+                      env->exception_is_int,
+                      env->error_code,
+                      env->exception_next_eip);
+    /* successfully delivered */
+    env->old_exception = -1;
+}
+
+void cpu_x86_load_seg(CPUX86State *env, X86Seg seg_reg, int selector)
+{
+    if (!(env->cr[0] & CR0_PE_MASK) || (env->eflags & VM_MASK)) {
+        int dpl = (env->eflags & VM_MASK) ? 3 : 0;
+        selector &= 0xffff;
+        cpu_x86_load_seg_cache(env, seg_reg, selector,
+                               (selector << 4), 0xffff,
+                               DESC_P_MASK | DESC_S_MASK | DESC_W_MASK |
+                               DESC_A_MASK | (dpl << DESC_DPL_SHIFT));
+    } else {
+        helper_load_seg(env, seg_reg, selector);
+    }
+}
diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
index ded71d8103..e22ddf6fad 100644
--- a/target/i386/tcg/softmmu/meson.build
+++ b/target/i386/tcg/softmmu/meson.build
@@ -6,4 +6,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'misc_helper_softmmu.c',
   'fpu_helper_softmmu.c',
   'svm_helper.c',
+  'seg_helper_softmmu.c',
 ))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index cf7025c63c..7d84197c49 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -6,4 +6,5 @@ i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'misc_helper_user.c',
   'fpu_helper_user.c',
   'svm_helper_user.c',
+  'seg_helper_user.c',
 ))
-- 
2.26.2


