Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFDA48B7DF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:10:49 +0100 (CET)
Received: from localhost ([::1]:57334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NTk-0002CP-HH
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:10:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCV-0007qC-8o
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:59 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCT-0008Fu-EZ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:58 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MjSsm-1mfAGT1gXC-00kwb9; Tue, 11
 Jan 2022 20:52:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] linux-user/mips: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:32 +0100
Message-Id: <20220111195247.1737641-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aASmtJmOOqOnnulFlK7ktVjscrOUC0SNYVY5wcfT2BShQqi6i3d
 Zz0JChYByvBUjft9csC3OUbW2tOQeP8JfY1dkz1FkgCDNr94WnDc2vetIRBBnz98KUMybiG
 alxde7YQfAjCsdvxIbkfKJPBrgr+GIhKygh8+QljnXRFwyEsz+rUSkwKbvQZsyz+r0bTDO7
 NR2JpXFLUYALu6uocJFhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mPpgFwZxTaQ=:LHo13RTzNiWCABnEQptoz+
 UHPbs9IEvWf9eYozHZ+34GiwuMBriMwwzpuk3jxp3PJggiI5j4wrCcpyAzotiF5z3mykFdQMC
 YZj+auH+pRR2qp2j+aGrfhfAyBzYgWPaEJ3Zb1N2HOPKdq5HyP/nz7Y9EPZzy5DIE5Sj8jLC3
 uWoDH8So5PXuASbTAlnon1/wOfKFd7r8yYU7fQbgBucUDihHRMzBsqISGrSOk4XvVkCmcdX7J
 GYaPT10IENLdzwFUzzAP1AYrGiF0JNAoFnC+6kR0SPYThAYzXSjAkyIzxu4IXP6g9ly43elcH
 gpzE5qznQS+gWtZjpBTkq8jFilPcH+Mcn7FDfYI9AnSmrg9pb8r1nn32PyAcLEWDOMoy6/dN0
 d9t+pVVXceW/yEPNEoHfFTrBuz3E1f+xtf5tzjwDduwCoHCZEG6KiICiLWRasU83xRwTPrr1J
 cK9GnlwXKJirAeljAELQnNK1F4kJKLV8ikRPECKI4ijMRWNen4orG20J9mzmGDKiFIhbI1mC6
 DPMy6h6uXXPY680OFvNTqa5E93xj4/O6840pMHacVVoi+rF4nNGs1jcgxPXEeyB+Ug69mHa42
 wRehPJ+2N2apSW7v1nVcBRe0U4xqAT48EwYFqC0DIq+EtV5tm4e0xqgJOJOxhUcl2SDb1hfSb
 Fxo5pNXkOYwG9iJrFxAIQJq83MzBU1wug9f2nIf14pHhxBS/vLStbyWlntf9hAG3ai48=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP
and SIGFPE; use force_sig (SI_KERNEL) for EXCP_DSPDIS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-16-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/cpu_loop.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 4fa24cc07452..1286fbc2e0d3 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -64,8 +64,7 @@ static void do_tr_or_bp(CPUMIPSState *env, unsigned int code, bool trap)
 void cpu_loop(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
-    int trapnr;
+    int trapnr, si_code;
     abi_long ret;
 # ifdef TARGET_ABI_MIPSO32
     unsigned int syscall_num;
@@ -156,43 +155,32 @@ done_syscall:
             break;
         case EXCP_CpU:
         case EXCP_RI:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = 0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        case EXCP_DSPDIS:
+            force_sig(TARGET_SIGILL);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
-        case EXCP_DSPDIS:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT,
+                            env->active_tc.PC);
             break;
         case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_FLTUNK;
+            si_code = TARGET_FPE_FLTUNK;
             if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_INVALID) {
-                info.si_code = TARGET_FPE_FLTINV;
+                si_code = TARGET_FPE_FLTINV;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_DIV0) {
-                info.si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_FLTDIV;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_OVERFLOW) {
-                info.si_code = TARGET_FPE_FLTOVF;
+                si_code = TARGET_FPE_FLTOVF;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_UNDERFLOW) {
-                info.si_code = TARGET_FPE_FLTUND;
+                si_code = TARGET_FPE_FLTUND;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_INEXACT) {
-                info.si_code = TARGET_FPE_FLTRES;
+                si_code = TARGET_FPE_FLTRES;
             }
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, si_code, env->active_tc.PC);
             break;
+
         /* The code below was inspired by the MIPS Linux kernel trap
          * handling code in arch/mips/kernel/traps.c.
          */
-- 
2.33.1


