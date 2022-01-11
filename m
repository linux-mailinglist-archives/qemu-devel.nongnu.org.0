Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C5048B7C8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:02:51 +0100 (CET)
Received: from localhost ([::1]:40272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NM2-0007CW-JR
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCQ-0007ib-MT
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:54 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCO-0008E1-LA
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:54 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N64FC-1mIYw60qsK-016Rin; Tue, 11
 Jan 2022 20:52:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/30] linux-user/cris: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:21 +0100
Message-Id: <20220111195247.1737641-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zqtwRw+ig3JKJVHP9PCTZrVb6v55lA8kSHVK1gRfKq84IuG4imq
 /9jxzDi0yFL1tlLhYnolVnFQZAFFGThp+a6x1WhC7kxm1RBryPpYpDp0c3a0Qq+T8mbbUav
 s/E/CP8SpBqT/WnTxfGuH1Vlyhec05nBRT7RI0RsFuO3YtrYv2c6lO72SX7o0sHzhjlvWMs
 nZgexZztaQiSdPjXjb3bw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GkQKE3HP49M=:6UL42okBykWQhIv2IdlTEf
 34OPeRndZTAPm0kM4dJYacFKuGaTOiiq2Qllccv1ZZkvqJiDmJHuds9GO8Xo2WyGhqqxvmOFA
 yESzM3BjVaLdkiah5w36F4zmqXcWi7ZA5S9ePXG5DvMX2AE1RGJS9ybdsQJsLoCtqfJwB9kDW
 7pVDzBp+UWRCCgiMljSNMfXtDl0xzqEZkryJF3JlRw5wu9LSm5BVNpsqqkE+miLi9cUbNeJe8
 X3TTgTfkBm7QMIsVZrZ7GcOhaXfvyN6TaRBWZ1Q4BUNtz3oz7K886UXlA/STu56TP0tI6WqsS
 Yi4WD8B31I+BUbbfZ1l2qUXMOXzhje8aTdeYOz7fmer9L9ey91txyhgWGhPVN++jNgSGL8kRx
 N42YicW4W9S+osKXB9bDm0Ns0vPR9G/973zx7Je4hqEBV6w9HaXOSJp7lJOMpVzSfZqLzKoNA
 z/nkb+657cIA/pAH60TKgp6gCBvNjTMUJNtRmzbTVtfjTzSv6oR6TysOA9rMrMvC007iVyU++
 nsmnFzRDGLFG04bPyhQ6TEUqZljaapmwiTGWX+NdI5Eu3QWXoET+0OYM489uNwGtIhUZpxkCx
 LZ+RnNj0dKoR3aQoZYYdgdoZNXyzhWld3fvh1B2bRk+U6F5T0pYVlfFMUyELMNjvq5tBaxvap
 Pz47f4LqMMcNAqdhCOCBWv/6XHcFxhv116UsE+L2ZpNH4eGWGXwKiAMOR7R/ibbGJctE=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
and calling queue_signal.  Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/cris/cpu_loop.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 5213aebf5549..0f46b3c1a87a 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -28,8 +28,7 @@ void cpu_loop(CPUCRISState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
-    
+
     while (1) {
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
@@ -38,8 +37,8 @@ void cpu_loop(CPUCRISState *env)
 
         switch (trapnr) {
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_BREAK:
             ret = do_syscall(env, 
                              env->regs[9], 
@@ -57,10 +56,7 @@ void cpu_loop(CPUCRISState *env)
             }
             break;
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


