Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B9383C4C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:31:39 +0200 (CEST)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lii1f-0007LJ-I4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlO-0005wU-4i
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:50157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlB-0004LG-Rh
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:45 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MZCvh-1lwCJj1bzV-00V5dG; Mon, 17
 May 2021 20:14:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/59] linux-user: Use target_restore_altstack in all sigreturn
Date: Mon, 17 May 2021 20:13:34 +0200
Message-Id: <20210517181424.8093-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iFN+cImS2y9vJCQ8GlM7Tg4y8B+SOBuWxFznwXpysevEG4bov4p
 gCf2Zcnl5/Mfw7BONoA7olTh/ammwxK42VR33Kf9o1f2NIMLuE6PEXy78BwpQWwZIINI11o
 J2pPJ6qlwtKhVU0atGIk6OCKByRDCe3cyHfqVuSa1WZdG0zE6aZN0X/Z/9vZ4W2DQViui1K
 8rih/XGiyY8AhnjvW+Cxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h/CTGCyXH6k=:ycLowW03RVV8nKvgE8Q4FK
 tS+pCgEwJroGLiIK3lKj5m4C+zwn1JrbudUSKFXAReyjFJGBxvt5geO8hCeZGcOZ/+8O6IC+F
 PDyL1TEaUepCLljdsnxaUnSr7879W2ET+03nHe8oT8HO5kJq0jQzr6NKJbgiurHPOwsKpDIcR
 QHPdeuiA8p0fc5X5WUCM/AnDN0RkvM0O6DInJoOWVkTWMyuXEU/vdD6itmL9kSfWe+oOyQpXh
 pAxYoEwkZU0Slo5FPnWrTIJwD0iE8yVPF/YtACIgPwDEgyAoKc/SFJaTp5lZDvSklUmjrt0Cn
 kihZvhLNTl5OKyxT2Sb/jApc07h/2Ot3tmCiniMPjGVbHCn7WNi8tPcgCeY0e/eRZluGkGWqT
 guoF3eiC1UqDQgPDPAAzyCSP71pKdOJ1eWuYyblwNiVqqQiPY5h5QwjFDYZUzICXk/5HL6u0y
 egogHgGl2iThymkj+1S7J59RICl4JqAsQbpa3Dg4tvRMGZUyUtSNshzlGaL5qoMzbPi3ZRO5m
 YDLlgAR++X9nnDHI4YbC10=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Note that target_restore_altstack uses the host memory
pointer that we have already verified, so TARGET_EFAULT
is not a possible return value.

Note that using -EFAULT was a bug.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/signal.c    | 6 +-----
 linux-user/alpha/signal.c      | 6 +-----
 linux-user/arm/signal.c        | 9 ++-------
 linux-user/hexagon/signal.c    | 6 +-----
 linux-user/hppa/signal.c       | 8 +-------
 linux-user/i386/signal.c       | 5 +----
 linux-user/m68k/signal.c       | 5 +----
 linux-user/microblaze/signal.c | 6 +-----
 linux-user/mips/signal.c       | 6 +-----
 linux-user/nios2/signal.c      | 8 +-------
 linux-user/openrisc/signal.c   | 5 +----
 linux-user/ppc/signal.c        | 4 +---
 linux-user/riscv/signal.c      | 6 +-----
 linux-user/s390x/signal.c      | 6 ++----
 linux-user/sh4/signal.c        | 7 +------
 linux-user/xtensa/signal.c     | 6 +-----
 16 files changed, 18 insertions(+), 81 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index b591790c22ed..2a1b7dbcdc2b 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -561,11 +561,7 @@ long do_rt_sigreturn(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr +
-            offsetof(struct target_rt_sigframe, uc.tuc_stack),
-            0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index c5c27ce08419..0af022711815 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -257,11 +257,7 @@ long do_rt_sigreturn(CPUAlphaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-                                             uc.tuc_stack),
-                       0, env->ir[IR_SP]) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, env->ir[IR_SP]);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index f21d1535e4d9..b7a772302f45 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -685,11 +685,7 @@ static int do_sigframe_return_v2(CPUARMState *env,
         }
     }
 
-    if (do_sigaltstack(context_addr
-                       + offsetof(struct target_ucontext_v2, tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT) {
-        return 1;
-    }
+    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
@@ -773,8 +769,7 @@ static long do_rt_sigreturn_v1(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr + offsetof(struct rt_sigframe_v1, uc.tuc_stack), 0, get_sp_from_cpustate(env)) == -EFAULT)
-        goto badframe;
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index fde8dc93b7a6..3854eb4709be 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -260,11 +260,7 @@ long do_rt_sigreturn(CPUHexagonState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-            uc.uc_stack), 0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index d1a58feeb36f..578874cf27e6 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -187,13 +187,7 @@ long do_rt_sigreturn(CPUArchState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    unlock_user_struct(frame, frame_addr, 0);
-
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-                                             uc.tuc_stack),
-                       0, env->gr[30]) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, env->gr[30]);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 9320e1d47267..3a0a1546a63e 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -581,10 +581,7 @@ long do_rt_sigreturn(CPUX86State *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr + offsetof(struct rt_sigframe, uc.tuc_stack), 0,
-                       get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index 49ff87c77bce..004b59fb6118 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -400,10 +400,7 @@ long do_rt_sigreturn(CPUM68KState *env)
     if (target_rt_restore_ucontext(env, &frame->uc))
         goto badframe;
 
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT)
-        goto badframe;
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index cf0707b5564b..f59a1faf47bb 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -209,11 +209,7 @@ long do_rt_sigreturn(CPUMBState *env)
 
     restore_sigcontext(&frame->uc.tuc_mcontext, env);
 
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 455a8a229a83..456fa64f41cd 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -368,11 +368,7 @@ long do_rt_sigreturn(CPUMIPSState *env)
     set_sigmask(&blocked);
 
     restore_sigcontext(env, &frame->rs_uc.tuc_mcontext);
-
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, rs_uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT)
-        goto badframe;
+    target_restore_altstack(&frame->rs_uc.tuc_stack, get_sp_from_cpustate(env));
 
     env->active_tc.PC = env->CP0_EPC;
     mips_set_hflags_isa_mode_from_pc(env);
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 7d535065ed98..751ea88811f8 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -82,9 +82,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
                                int *pr2)
 {
     int temp;
-    abi_ulong off, frame_addr = env->regs[R_SP];
     unsigned long *gregs = uc->tuc_mcontext.gregs;
-    int err;
 
     /* Always make any pending restarted system calls return -EINTR */
     /* current->restart_block.fn = do_no_restart_syscall; */
@@ -130,11 +128,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
 
-    off = offsetof(struct target_rt_sigframe, uc.tuc_stack);
-    err = do_sigaltstack(frame_addr + off, 0, get_sp_from_cpustate(env));
-    if (err == -EFAULT) {
-        return 1;
-    }
+    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
 
     *pr2 = env->regs[2];
     return 0;
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 232ad82b98be..86f94d7f766d 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -158,10 +158,7 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    if (do_sigaltstack(frame_addr + offsetof(target_rt_sigframe, uc.tuc_stack),
-                       0, frame_addr) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, frame_addr);
 
     unlock_user_struct(frame, frame_addr, 0);
     return cpu_get_gpr(env, 11);
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index bad38f8ed9b1..b44d5ce73c31 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -655,9 +655,7 @@ long do_rt_sigreturn(CPUPPCState *env)
     if (do_setcontext(&rt_sf->uc, env, 1))
         goto sigsegv;
 
-    do_sigaltstack(rt_sf_addr
-                   + offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                   0, env->gpr[1]);
+    target_restore_altstack(&rt_sf->uc.tuc_stack, env->gpr[1]);
 
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 67a95dbc7b91..81d1129da3d2 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -192,11 +192,7 @@ long do_rt_sigreturn(CPURISCVState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-            uc.uc_stack), 0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 7107c5fb5335..73806f547270 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -307,10 +307,8 @@ long do_rt_sigreturn(CPUS390XState *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr + offsetof(rt_sigframe, uc.tuc_stack), 0,
-                       get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index 29c1ee30e6d6..684f18da5862 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -323,12 +323,7 @@ long do_rt_sigreturn(CPUSH4State *regs)
     set_sigmask(&blocked);
 
     restore_sigcontext(regs, &frame->uc.tuc_mcontext);
-
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(regs)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(regs));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 590f0313ffe9..22ec6cdeb98e 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -253,12 +253,8 @@ long do_rt_sigreturn(CPUXtensaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, frame);
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -TARGET_EFAULT) {
-        goto badframe;
-    }
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 
-- 
2.31.1


