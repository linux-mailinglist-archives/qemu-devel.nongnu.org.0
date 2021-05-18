Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F138715F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:39:22 +0200 (CEST)
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisRt-0001Wy-E0
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKU-0006pj-UI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:42 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:48659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKS-0006uh-0c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:42 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5W0q-1lOcjr3epO-016yGp; Tue, 18
 May 2021 07:31:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/59] linux-user: Pass CPUArchState to target_restore_altstack
Date: Tue, 18 May 2021 07:30:43 +0200
Message-Id: <20210518053131.87212-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:paTfZ3iBZq58bYEomJI9ql453V7ZpPsTY39F2bg9JPy157o0ywI
 7D1OzbJ7bB2kbpz5UYrVIW0VAbdi71Au5aaXR3amSVt6TXQEkHjdGcRkn1qIxSkGuaCBEKE
 Id3oP3/krsD89aJf/98s757svtHSDiif5axOMGbNixyT2jOC8f2T7d353Fg4W+0Ta3IrG99
 5Lus7COb0+t6UIgg3X+Lw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z263EZEcSFE=:BRf+2tyANL4s4v3v0O3OY4
 /z1ZW4e/xu+p1Kf82DacsEhxh+crD0mewE8DQBZ3XKjesfFxu4jEjdp1oTmoFAsc3BMOrxut6
 MPU6TfDYNTPecoLrcj/jm2kodXqkb3R7YezQR21PIr1z8L9ak/rMxtmBTLrmSFQfNwK59nEuc
 2ptNIwZyjTQwL8HuscRiRWmfrn4CrH1cDocgQfBObEjXMSuNx+unBPwXoneFOqS3TpfTujred
 rwCbnz/I3NJfCtdIqrp26ewC/7sM4vIcD4tkzjJIe5TJlmNr59EFDPz1rHf7hU5elodkptgGU
 r62xnMPtcg9lGi5nruG+sTcFJlrZkTqA1+21jvXS01vYbegnRlXOOlnGScnH8BKOgd4++hWU9
 zz1DqSEnCJABC+LMk/oDCbVZ8Hu96rzkkw/I3/zME6zFv82erWk0ld1aLhgHBUbbvjKBOi8ef
 4jZSCHI1aye4X1oymujIF65TN58wPMxIFaOXnPcRYb43cTzjDGP4iN1cb73CD7lZ3WTYg8/wh
 CZilp1G0Qgr/dY370+lPxU=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In most cases we were already passing get_sp_from_cpustate
directly to the function.  In other cases, we were passing
a local variable which already contained the same value.
In the rest of the cases, we were passing the stack pointer
out of env directly.

Reviewed by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/signal.c    | 2 +-
 linux-user/alpha/signal.c      | 2 +-
 linux-user/arm/signal.c        | 4 ++--
 linux-user/hexagon/signal.c    | 2 +-
 linux-user/hppa/signal.c       | 2 +-
 linux-user/i386/signal.c       | 2 +-
 linux-user/m68k/signal.c       | 2 +-
 linux-user/microblaze/signal.c | 2 +-
 linux-user/mips/signal.c       | 2 +-
 linux-user/nios2/signal.c      | 2 +-
 linux-user/openrisc/signal.c   | 2 +-
 linux-user/ppc/signal.c        | 2 +-
 linux-user/riscv/signal.c      | 2 +-
 linux-user/s390x/signal.c      | 2 +-
 linux-user/sh4/signal.c        | 2 +-
 linux-user/signal-common.h     | 2 +-
 linux-user/signal.c            | 6 +++---
 linux-user/xtensa/signal.c     | 2 +-
 18 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 2a1b7dbcdc2b..662bcd1c4e57 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -561,7 +561,7 @@ long do_rt_sigreturn(CPUARMState *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 0af022711815..d4e4666874e3 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -257,7 +257,7 @@ long do_rt_sigreturn(CPUAlphaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, env->ir[IR_SP]);
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index b7a772302f45..32b68ee302ba 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -685,7 +685,7 @@ static int do_sigframe_return_v2(CPUARMState *env,
         }
     }
 
-    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&uc->tuc_stack, env);
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
@@ -769,7 +769,7 @@ static long do_rt_sigreturn_v1(CPUARMState *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 3854eb4709be..85eab5e94382 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -260,7 +260,7 @@ long do_rt_sigreturn(CPUHexagonState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.uc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 578874cf27e6..0e266f472d5a 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -187,7 +187,7 @@ long do_rt_sigreturn(CPUArchState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, env->gr[30]);
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 3a0a1546a63e..8701774e3791 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -581,7 +581,7 @@ long do_rt_sigreturn(CPUX86State *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index 004b59fb6118..d06230655e98 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -400,7 +400,7 @@ long do_rt_sigreturn(CPUM68KState *env)
     if (target_rt_restore_ucontext(env, &frame->uc))
         goto badframe;
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index f59a1faf47bb..4c483bd8c606 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -209,7 +209,7 @@ long do_rt_sigreturn(CPUMBState *env)
 
     restore_sigcontext(&frame->uc.tuc_mcontext, env);
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 456fa64f41cd..e6be807a81ae 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -368,7 +368,7 @@ long do_rt_sigreturn(CPUMIPSState *env)
     set_sigmask(&blocked);
 
     restore_sigcontext(env, &frame->rs_uc.tuc_mcontext);
-    target_restore_altstack(&frame->rs_uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->rs_uc.tuc_stack, env);
 
     env->active_tc.PC = env->CP0_EPC;
     mips_set_hflags_isa_mode_from_pc(env);
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 751ea88811f8..cc3872f11da2 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -128,7 +128,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
 
-    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&uc->tuc_stack, env);
 
     *pr2 = env->regs[2];
     return 0;
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 86f94d7f766d..5c5640a28487 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -158,7 +158,7 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, frame_addr);
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return cpu_get_gpr(env, 11);
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index b44d5ce73c31..edfad28a375a 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -655,7 +655,7 @@ long do_rt_sigreturn(CPUPPCState *env)
     if (do_setcontext(&rt_sf->uc, env, 1))
         goto sigsegv;
 
-    target_restore_altstack(&rt_sf->uc.tuc_stack, env->gpr[1]);
+    target_restore_altstack(&rt_sf->uc.tuc_stack, env);
 
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 81d1129da3d2..9405c7fd9af6 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -192,7 +192,7 @@ long do_rt_sigreturn(CPURISCVState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.uc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 73806f547270..b68b44ae7e99 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -307,7 +307,7 @@ long do_rt_sigreturn(CPUS390XState *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index 684f18da5862..0451e65806a1 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -323,7 +323,7 @@ long do_rt_sigreturn(CPUSH4State *regs)
     set_sigmask(&blocked);
 
     restore_sigcontext(regs, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(regs));
+    target_restore_altstack(&frame->uc.tuc_stack, regs);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 34b963af9abc..ea86328b289a 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -24,7 +24,7 @@ int on_sig_stack(unsigned long sp);
 int sas_ss_flags(unsigned long sp);
 abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka);
 void target_save_altstack(target_stack_t *uss, CPUArchState *env);
-abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp);
+abi_long target_restore_altstack(target_stack_t *uss, CPUArchState *env);
 
 static inline void target_sigemptyset(target_sigset_t *set)
 {
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 2e1095055b7c..cbd80b28cf5a 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -297,7 +297,7 @@ void target_save_altstack(target_stack_t *uss, CPUArchState *env)
     __put_user(ts->sigaltstack_used.ss_size, &uss->ss_size);
 }
 
-abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp)
+abi_long target_restore_altstack(target_stack_t *uss, CPUArchState *env)
 {
     TaskState *ts = (TaskState *)thread_cpu->opaque;
     size_t minstacksize = TARGET_MINSIGSTKSZ;
@@ -315,7 +315,7 @@ abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp)
     __get_user(ss.ss_size, &uss->ss_size);
     __get_user(ss.ss_flags, &uss->ss_flags);
 
-    if (on_sig_stack(sp)) {
+    if (on_sig_stack(get_sp_from_cpustate(env))) {
         return -TARGET_EPERM;
     }
 
@@ -820,7 +820,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
         if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
             goto out;
         }
-        ret = target_restore_altstack(uss, get_sp_from_cpustate(env));
+        ret = target_restore_altstack(uss, env);
         if (ret) {
             goto out;
         }
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 22ec6cdeb98e..72771e1294b6 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -253,7 +253,7 @@ long do_rt_sigreturn(CPUXtensaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, frame);
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-- 
2.31.1


