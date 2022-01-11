Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8A48B7DE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:10:41 +0100 (CET)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NTc-0001vP-0e
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:10:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCZ-0007x1-EY
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:03 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:35023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCX-0008Gp-4K
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:02 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Macay-1mWOoq44de-00c7Vc; Tue, 11
 Jan 2022 20:52:59 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] linux-user/riscv: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:37 +0100
Message-Id: <20220111195247.1737641-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fGQXr8FBrgCLpPRXMphAnIPCZ9lNj3vti3e14NtiMnVE1qgUlxn
 zN4I9q9iKllEvyMKrEdZcPaAkbjX1cklenHzZwhUpEGf5K0dX1hoz80QDW0KBw9H/Vi8CmR
 wfqVokIj1PTdn5/ji1G/DNiLCil5B7tsZM0MQlRWQ7UfHI2s0PBYgYq7a55bZeujdn5gsbj
 /vjE/hrpFLRJgiHDAweQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TTtKnOJ0hSY=:/CBAdi/54DYDMjwU6eRMl6
 xQG/iKL9RSKOVcQW4Vo51NglaaSaiOafz+F6FcGUiLDX1dS6YsSoPHTVYkKG0IA8cs23SgWKA
 hu7OjXKSElDEBKZ4WfZBHRqwRjNLg221jmW26IKvNAm/I7RKOKmiRcvb1CXfo/3OKBE6qeGJj
 Xf4DU75wHl/JzOEMqW+VNwBOsXEH4aGDk8aInW+bIJtkA9UPPxPGPXyUsPral+XdG0vfWNQoV
 JV1etuoUQixW4zJGN+mfiSudCeDkCGA4QHPSevDH//OVBzxKakkYlSM9Rfm95xl7AsKdis/WN
 P86yUbolNemXP1WlzmvRxDdgP9uqoIrlLOAlWxg2JI33HUhhGrNO7WGS53wslBOuoeNDuBA9A
 iWvoTJbw3AaYh8EZ/xr/x1pCG8JouEB30fg/s4CQSfjZQ+mGWZc/dagCPIIGFvW5dYoL85tOO
 End9A5MGY6gPNndbEWLn4pP6v4ZVoCH40xbvPJPn1MZucHLxPd0wYp6jqKW7s9TX/gtt+8TyG
 IOeqbSseqWXHQ2ttO9X+xJRnqjKUQ071ijdoUkmVf/Tw5vQdNWKktBplgGLhtvKSQM7M9mj8s
 ISIotWuttYn/owtufstl6lKbgUNMIAstTPBwFuoNjIPqMKwB2yJmuekrPVqv5DkhBUyZy18x3
 aoDU7FyZzRy+KIMUheObeI9SySoymMeJ/pRLBH/IYKnJg7pUWTUDNBanXyj1xAT1YC9E=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
and calling queue_signal.  Fix missing PC from EXCP_DEBUG by
merging the case with EXCP_BREAKPOINT.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-21-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/riscv/cpu_loop.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 0cd8985cb854..26d446f32379 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -30,8 +30,7 @@
 void cpu_loop(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, signum, sigcode;
-    target_ulong sigaddr;
+    int trapnr;
     target_ulong ret;
 
     for (;;) {
@@ -40,10 +39,6 @@ void cpu_loop(CPURISCVState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        signum = 0;
-        sigcode = 0;
-        sigaddr = 0;
-
         switch (trapnr) {
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
@@ -79,39 +74,23 @@ void cpu_loop(CPURISCVState *env)
             }
             break;
         case RISCV_EXCP_ILLEGAL_INST:
-            signum = TARGET_SIGILL;
-            sigcode = TARGET_ILL_ILLOPC;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case RISCV_EXCP_BREAKPOINT:
-            signum = TARGET_SIGTRAP;
-            sigcode = TARGET_TRAP_BRKPT;
-            sigaddr = env->pc;
+        case EXCP_DEBUG:
+        gdbstep:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
             break;
-        case EXCP_DEBUG:
-        gdbstep:
-            signum = TARGET_SIGTRAP;
-            sigcode = TARGET_TRAP_BRKPT;
-            break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
                      trapnr);
             exit(EXIT_FAILURE);
         }
 
-        if (signum) {
-            target_siginfo_t info = {
-                .si_signo = signum,
-                .si_errno = 0,
-                .si_code = sigcode,
-                ._sifields._sigfault._addr = sigaddr
-            };
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-        }
-
         process_pending_signals(env);
     }
 }
-- 
2.33.1


