Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7838716C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:48:06 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisaL-0004m0-If
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKq-0007ii-Gy
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:04 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:35795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007Ag-21
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:04 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPK73-1m7pAn3RGf-00PfAB; Tue, 18
 May 2021 07:31:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 46/59] linux-user/s390x: Clean up signal.c
Date: Tue, 18 May 2021 07:31:18 +0200
Message-Id: <20210518053131.87212-47-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aF01Q0c1rPkGnQ23tgwGNdebELuEzZ8xhHxMhWwu+us3Mz1WpYN
 MHmD9D7XNKBslsN9VrHQMN7Zx8N48fpHZ1FpP2Xm9Wh+vvy2sU7VWCXa+SJ4hI0AZxsIS2x
 lP9uhbbtsY5HELTHOBLhKXKz28nUGfl/Whm7sO2jzLLBSZ8BET7NwSDlLtM2yYozhnJttDW
 GAj3Du/9vcEUWiu8EnhDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dt3sB+B6qk0=:kAtX3DkjoKRJH9v7IeaxnE
 nxU/YeG/vWxquBEo8bXOGITxfE0r7cVaKyS+b/njDBJpba+QYV/hCix5ALR63jlfVnVldQbUE
 UegTlt/ug+tR+JxCWakEMr03lHqbcqOHC2IsXy7cKXBk8v2uo6ssXlhneBGXm7PqRFlh5xHEH
 HH1ChwO8V05CYXDB5AjtGYgB8BRzXTFXSgsD5UvXg8lVItEtFodWusnqFnvAaDdxq3cXt0l4d
 4IGLvrMh42T4FhIZWVwhdFlGL529hGD6rKzMESioKOSB7WzRuY3ihstdEuuSL+2bHQB0Vzt5W
 ymkbl1hhCsgHwb4T2SSZzRP14lW4ICEZ64mPlUBeqpi11VcBbgHmgc7IHB3dKCPMzg4c2cPm9
 kul1IO1FrKICFw9Gl6/JOmbqvNQjvAfloqcPOtRVe5d3hbeGKR39c+oPr3Fk0xYIExgiRHXYd
 ryW3mLhhuCjyxU2OqLYWY9V2bNWWgz2LGSWOY9PwOek15QmxVud5MH30Gum4r5srHvchucpkf
 TQ3SbFdQ3x3r4DRE8PgBxA=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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


