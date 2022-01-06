Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6748634A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:57:37 +0100 (CET)
Received: from localhost ([::1]:60590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QSe-0001yQ-4S
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:57:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDX-0007hX-N9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:59 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDQ-0004jg-I2
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:59 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6DSi-1n3FQM0VAm-006f0M; Thu, 06
 Jan 2022 11:41:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/27] linux-user/nios2: Fixes for signal frame setup
Date: Thu,  6 Jan 2022 11:41:28 +0100
Message-Id: <20220106104137.732883-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n4PmSp8DhyGWOJ+w0pJKMyIQ3ECft+pn8dPmJGnpNAzTTRNyJMB
 El5Z4w1fWDcY8bu9mIkI68XBmHQd4DaEVT4GjT5P4QOjCqIyrMbbHUmbM32gbLNac4ZS8iB
 Z8jtl5CHmhceOBqi5kmfW4gXjs1859/8IdK2hirYtJW1xdtgSsPzvUA2Prb2XtN+3r07AHi
 7qkgG3mkD5Jf/D4M+gVYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y+ARbSwUk8k=:oOPBZU+KZovnxBROXNetay
 cgAFpcbGmghQpTlwud9Qi94YRAp4dxrsxUsD/2XFASheg1Q9iJFIzG/oMEl0MvtN81QF+yzIY
 sZm1lvwGSWXQBmlvu1H0SS+3ZKCf46yO8ANIvna+7h0nE+KeLdiHgd1r2YI7lff8XIKA2gFLz
 pYYmUsfDrRZJQGl31VHHhzn506yqOP7oYb7b+X6OQ48Vqd/QjnRkRrcbXqdIaldP7RQ6T8JTe
 KtU/SQr/oRMwoyqmi8vqXPWEChKV8LAFmPpGv+HeVwtSU6WKaQy/2RfLSYC6Zl/oe/+1KBtRZ
 oT5tQqcpMSW1bJ99rMWEZCt1Xsv2WHiPT3Px6h1PymeO9z8bDrWfTzUW1rq0CFg4NPaNMGNXr
 CStskYnVYgjlIVwXN5zZYPX759TZmCcYR+pytFR2SvK1RtrjqK44l+nm0A2DAbki2VGAZZGjG
 3L7yuU2HeKu8aIjKq4xDNgMu+g8UjPMlhVnuNAD8DIPL/bLJjbx7eyHTLbSyjrrXb+CHB9uds
 xjaN+73O0vyJOGSMhmncygkeofgeygsEMuM21hlogmmgB6uSQ6qbLuZPh+nTAuX5RXqwVg4ZG
 IawqLs3JjnMKgNDaN7BKTEiMlmTmqxPfuq3SiGi/v62BQsAOdJ3EsdNdX/yhHJgBo0nG8vCDs
 z6CUDbZNDktlMhUwTJ48W3H8dHNfRMfP88myhjPOD6kLEh5f2mKtroZbnOXZInZ8cM8Q=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Do not confuse host and guest addresses.  Lock and unlock
the target_rt_sigframe structure in setup_rt_sigframe.

Since rt_setup_ucontext always returns 0, drop the return
value entirely.  This eliminates the only write to the err
variable in setup_rt_sigframe.

Always copy the siginfo structure.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221025012.1057923-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/nios2/signal.c | 51 ++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index a77e8a40f468..adbffe32e3c8 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -42,7 +42,7 @@ struct target_rt_sigframe {
     struct target_ucontext uc;
 };
 
-static int rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
+static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
 {
     unsigned long *gregs = uc->tuc_mcontext.gregs;
 
@@ -75,8 +75,6 @@ static int rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
     __put_user(env->regs[R_GP], &gregs[25]);
     __put_user(env->regs[R_EA], &gregs[27]);
     __put_user(env->regs[R_SP], &gregs[28]);
-
-    return 0;
 }
 
 static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
@@ -135,8 +133,8 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     return 0;
 }
 
-static void *get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
-                          size_t frame_size)
+static abi_ptr get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
+                            size_t frame_size)
 {
     unsigned long usp;
 
@@ -144,7 +142,7 @@ static void *get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
     usp = target_sigsp(get_sp_from_cpustate(env), ka);
 
     /* Verify, is it 32 or 64 bit aligned */
-    return (void *)((usp - frame_size) & -8UL);
+    return (usp - frame_size) & -8;
 }
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
@@ -153,26 +151,25 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     CPUNios2State *env)
 {
     struct target_rt_sigframe *frame;
-    int i, err = 0;
+    abi_ptr frame_addr;
+    int i;
 
-    frame = get_sigframe(ka, env, sizeof(*frame));
-
-    if (ka->sa_flags & SA_SIGINFO) {
-        tswap_siginfo(&frame->info, info);
+    frame_addr = get_sigframe(ka, env, sizeof(*frame));
+    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+        force_sigsegv(sig);
+        return;
     }
 
+    tswap_siginfo(&frame->info, info);
+
     /* Create the ucontext.  */
     __put_user(0, &frame->uc.tuc_flags);
     __put_user(0, &frame->uc.tuc_link);
     target_save_altstack(&frame->uc.tuc_stack, env);
-    err |= rt_setup_ucontext(&frame->uc, env);
+    rt_setup_ucontext(&frame->uc, env);
     for (i = 0; i < TARGET_NSIG_WORDS; i++) {
         __put_user((abi_ulong)set->sig[i],
-            (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
-    }
-
-    if (err) {
-        goto give_sigsegv;
+                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
     }
 
     /* Set up to return from userspace; jump to fixed address sigreturn
@@ -180,19 +177,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[R_RA] = (unsigned long) (0x1044);
 
     /* Set up registers for signal handler */
-    env->regs[R_SP] = (unsigned long) frame;
-    env->regs[4] = (unsigned long) sig;
-    env->regs[5] = (unsigned long) &frame->info;
-    env->regs[6] = (unsigned long) &frame->uc;
-    env->regs[R_EA] = (unsigned long) ka->_sa_handler;
-    return;
-
-give_sigsegv:
-    if (sig == TARGET_SIGSEGV) {
-        ka->_sa_handler = TARGET_SIG_DFL;
-    }
-    force_sigsegv(sig);
-    return;
+    env->regs[R_SP] = frame_addr;
+    env->regs[4] = sig;
+    env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
+    env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
+    env->regs[R_EA] = ka->_sa_handler;
+
+    unlock_user_struct(frame, frame_addr, 1);
 }
 
 long do_sigreturn(CPUNios2State *env)
-- 
2.33.1


