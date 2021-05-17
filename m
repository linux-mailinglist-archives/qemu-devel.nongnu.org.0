Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFC383CB7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:52:59 +0200 (CEST)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiMM-0001CZ-4r
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlj-0006m4-Tf
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:17 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004Z2-9b
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:07 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPaQU-1m4Cee1caA-00MdiF; Mon, 17
 May 2021 20:14:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 46/59] linux-user/s390x: Clean up signal.c
Date: Mon, 17 May 2021 20:14:11 +0200
Message-Id: <20210517181424.8093-47-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HVBt4BQ80O7tbhyiWe6Y04tifcA3ZgB4LCPnE/7eNcbqtC4glHc
 e9jhTYakGc+6ec04L5gasNdchvLVP3jFmWx1qceSwIdiPF/X/qu0v6u+hXlJ2cbCLHrI3t9
 VYMeFT+ZhbHemGAq4PDK7yzQpTjCj+pwqCa8LrWTGNm/nvH1EaEkohUSHqnZ+zr3CUFiQVo
 R8037PJfCK/+2Liop+Wxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rynPxZnuPXg=:0ao8TcilgcMD4mTl7Ls8Jz
 vbpBHPTlwwW23pr4G8KO8lG6HDq7xe5liht6n8hY8oIWGZxYrQ+mBNbixlx/4KsoOEq5AInHm
 QfSxjVx9vlNlqTuJuvAlnDeAWfJF+N7ed1rT8cjEfGH+xowGnKzLTy8nhqvk+nTf1kBcVGHYu
 /ScyKCoj5B66sjHJ67vi4AYMdyKVfFRXdzXQ8kkZh3FTVbkGKDaokWJE7TKk+d4NDHI8vaBfy
 6VOnGVvqkP/VHyX5B/Aneo5OvVuNjkUgmFJrXcN5xGn+el26uB6fMnaYt+brBJ+5WgjJYonxB
 xkA/+wCfuRA7opwDgHxZld3+45CiW7lK4jP/Yj5/9k5/MrfcYYvCGgypbUeQAk44V2SMRiIpH
 D2of6EYAsHgndPUa0KSZdoLA+1EtBh1N/qwAlcXeyGfeLZWjNuLT5Ea6n1ZnSsfOuBoZoemTC
 f9izbUiAxQe0s28unThj8rnoD03Z3B6vNTk4UfHefDn7Es9weuoYgxDzyzv/KEbFLlOl5qckI
 koobZ+yl0AyHlSb+21BYaM=
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
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reorder the function bodies to correspond to the kernel source.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-15-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 63 ++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 839a7ae4b3d6..9d470e4ca069 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -133,6 +133,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     sigframe *frame;
     abi_ulong frame_addr;
+    abi_ulong restorer;
 
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
     trace_user_setup_frame(env, frame_addr);
@@ -141,28 +142,39 @@ void setup_frame(int sig, struct target_sigaction *ka,
         return;
     }
 
+    /* Set up backchain. */
+    __put_user(env->regs[15], (abi_ulong *) frame);
+
+    /* Create struct sigcontext on the signal stack. */
     /* Make sure that we're initializing all of oldmask. */
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(frame->sc.oldmask) != 1);
     __put_user(set->sig[0], &frame->sc.oldmask[0]);
+    __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
 
+    /* Create _sigregs on the signal stack */
     save_sigregs(env, &frame->sregs);
 
-    __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
+    /*
+     * ??? The kernel uses regs->gprs[2] here, which is not yet the signo.
+     * Moreover the comment talks about allowing backtrace, which is really
+     * done by the r15 copy above.
+     */
+    __put_user(sig, &frame->signo);
 
-    /* Set up to return from userspace.  If provided, use a stub
-       already in userspace.  */
+    /*
+     * Set up to return from userspace.
+     * If provided, use a stub already in userspace.
+     */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer;
+        restorer = ka->sa_restorer;
     } else {
-        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
+        restorer = frame_addr + offsetof(sigframe, retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
                    &frame->retcode);
     }
 
-    /* Set up backchain. */
-    __put_user(env->regs[15], (abi_ulong *) frame);
-
     /* Set up registers for signal handler */
+    env->regs[14] = restorer;
     env->regs[15] = frame_addr;
     /* Force default amode and default user address space control. */
     env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
@@ -180,8 +192,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[5] = 0; /* FIXME: regs->int_parm_long */
     env->regs[6] = 0; /* FIXME: current->thread.last_break */
 
-    /* Place signal number on stack to allow backtrace from handler.  */
-    __put_user(env->regs[2], &frame->signo);
     unlock_user_struct(frame, frame_addr, 1);
 }
 
@@ -191,6 +201,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 {
     rt_sigframe *frame;
     abi_ulong frame_addr;
+    abi_ulong restorer;
 
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
@@ -199,29 +210,33 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         return;
     }
 
-    tswap_siginfo(&frame->info, info);
-
-    /* Create the ucontext.  */
-    __put_user(0, &frame->uc.tuc_flags);
-    __put_user((abi_ulong)0, (abi_ulong *)&frame->uc.tuc_link);
-    target_save_altstack(&frame->uc.tuc_stack, env);
-    save_sigregs(env, &frame->uc.tuc_mcontext);
-    tswap_sigset(&frame->uc.tuc_sigmask, set);
+    /* Set up backchain. */
+    __put_user(env->regs[15], (abi_ulong *) frame);
 
-    /* Set up to return from userspace.  If provided, use a stub
-       already in userspace.  */
+    /*
+     * Set up to return from userspace.
+     * If provided, use a stub already in userspace.
+     */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer;
+        restorer = ka->sa_restorer;
     } else {
-        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
+        restorer = frame_addr + offsetof(typeof(*frame), retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    &frame->retcode);
     }
 
-    /* Set up backchain. */
-    __put_user(env->regs[15], (abi_ulong *) frame);
+    /* Create siginfo on the signal stack. */
+    tswap_siginfo(&frame->info, info);
+
+    /* Create ucontext on the signal stack. */
+    __put_user(0, &frame->uc.tuc_flags);
+    __put_user(0, &frame->uc.tuc_link);
+    target_save_altstack(&frame->uc.tuc_stack, env);
+    save_sigregs(env, &frame->uc.tuc_mcontext);
+    tswap_sigset(&frame->uc.tuc_sigmask, set);
 
     /* Set up registers for signal handler */
+    env->regs[14] = restorer;
     env->regs[15] = frame_addr;
     /* Force default amode and default user address space control. */
     env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
-- 
2.31.1


