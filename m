Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D848B7D7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:06:18 +0100 (CET)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NPN-0004nJ-VJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:06:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCT-0007nh-Qw
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:57 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:37823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCR-0008FP-Uv
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:57 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXpM2-1mqnl345ZE-00YDQn; Tue, 11
 Jan 2022 20:52:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] linux-user/microblaze: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:29 +0100
Message-Id: <20220111195247.1737641-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Da3nXB/wYZTz+H3crD6MsB9vxY7bHZl9cWvtXR8sxI/nu1lloix
 4NNwlPLdwWj0HEbEXdjcUR/NKQOzCsDuGMuPWUcDKI16CD20WRBmdidvV9zgUgA/Ydwvbrp
 cLFajwoqUQfPcSA56QkCH3x/h4AsenZ3g7bHDB7DqThJKMzlyDbvHmjGBKkpNj1ZXEWlecy
 TmLYB5rTVZDeR7vwxw1hA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hOJpoaK4thw=:B8LPQ3k+iVU8KOJXgTczma
 kUS6kbi1rcoaZWfuKWV/VedrrrP9zsXh0TPXZ0gyXrXCjRUFk9qx4y4KGALHMBuajgEVAJO11
 oNReWkXJHrXE23qyu2Wh6CybmdYkiTa4yoRz4GyEiXPL9Z8lEocSsLqORpPlCzw4Jj38JMyKv
 uAfyGduSkSXArWk+r0Xfg2KfeAdsnzzz7B9N17xEUeTovmyjU5QaslU3SM/4W4DZBWynyAb18
 qxLbk1Yo0btC0zBfr7qOWJ0d8rcGNUePQ7bH5W1Gm+yDlw+rEGPbNEes7lmP4gPNVR8r3/1ET
 zh2z0wbfm8vfhz3UA9IiWlq/IYzTGraCgTl/xwkBfOYaemBw85NgP/hiBLo9fuiqZWsItjfT+
 mvu8xhj2bYX/uKNHsnuR/N0TeA7x9W1kssPaK2BUIuy6dfxt5cxobeb1IxGXOBs5TV3MlXKYU
 J0Jzz9UZDUUuecE/DhXIqYiQtdcQkuAdU2AqXgBlOjpRmk+sZAOQbVWEyceOUoBoMsD8JILW3
 tAUB3UeRO3U+xgJVShj7wl2xac2QinTq3bj4UPgVMWjNC7Kp7nUIGTuFrZD5d2knl1No3VLAW
 XLPOZn3jPX4/iQR8hpTc0mqKiE5sMLoa2XBPAY5rC0Yrc4kjQ/d3DJEXu5oJuPG+i7QhBPjF7
 OD8Z9IQoEMXalfgaARORSwY5oSoTqXv1dCKosuzD5nFaX3f4PFm4jUERmcndAVtRK8iE=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/microblaze/cpu_loop.c | 61 +++++++++++++-------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index ff1fb26c8baf..08620d4e6899 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -27,9 +27,8 @@
 void cpu_loop(CPUMBState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ret;
-    target_siginfo_t info;
-    
+    int trapnr, ret, si_code;
+
     while (1) {
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
@@ -38,8 +37,8 @@ void cpu_loop(CPUMBState *env)
 
         switch (trapnr) {
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_SYSCALL:
             /* Return address is 4 bytes after the call.  */
             env->regs[14] += 4;
@@ -67,6 +66,7 @@ void cpu_loop(CPUMBState *env)
              */
             env->regs[14] = env->pc;
             break;
+
         case EXCP_HW_EXCP:
             env->regs[17] = env->pc + 4;
             if (env->iflags & D_FLAG) {
@@ -74,42 +74,31 @@ void cpu_loop(CPUMBState *env)
                 env->pc -= 4;
                 /* FIXME: if branch was immed, replay the imm as well.  */
             }
-
             env->iflags &= ~(IMM_FLAG | D_FLAG);
-
             switch (env->esr & 31) {
-                case ESR_EC_DIVZERO:
-                    info.si_signo = TARGET_SIGFPE;
-                    info.si_errno = 0;
-                    info.si_code = TARGET_FPE_FLTDIV;
-                    info._sifields._sigfault._addr = 0;
-                    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                    break;
-                case ESR_EC_FPU:
-                    info.si_signo = TARGET_SIGFPE;
-                    info.si_errno = 0;
-                    if (env->fsr & FSR_IO) {
-                        info.si_code = TARGET_FPE_FLTINV;
-                    }
-                    if (env->fsr & FSR_DZ) {
-                        info.si_code = TARGET_FPE_FLTDIV;
-                    }
-                    info._sifields._sigfault._addr = 0;
-                    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                    break;
-                default:
-                    fprintf(stderr, "Unhandled hw-exception: 0x%x\n",
-                            env->esr & ESR_EC_MASK);
-                    cpu_dump_state(cs, stderr, 0);
-                    exit(EXIT_FAILURE);
-                    break;
+            case ESR_EC_DIVZERO:
+                si_code = TARGET_FPE_FLTDIV;
+                break;
+            case ESR_EC_FPU:
+                si_code = 0;
+                if (env->fsr & FSR_IO) {
+                    si_code = TARGET_FPE_FLTINV;
+                }
+                if (env->fsr & FSR_DZ) {
+                    si_code = TARGET_FPE_FLTDIV;
+                }
+                break;
+            default:
+                fprintf(stderr, "Unhandled hw-exception: 0x%x\n",
+                        env->esr & ESR_EC_MASK);
+                cpu_dump_state(cs, stderr, 0);
+                exit(EXIT_FAILURE);
             }
+            force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
             break;
+
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.33.1


