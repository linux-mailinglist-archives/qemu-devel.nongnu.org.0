Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC3A48B7C5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:02:45 +0100 (CET)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NLw-0006k6-7q
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCT-0007ll-7p
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:57 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:39301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCR-0008FG-Gd
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:56 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5n81-1mIqBa277z-017Gnm; Tue, 11
 Jan 2022 20:52:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] linux-user/m68k: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:28 +0100
Message-Id: <20220111195247.1737641-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MdrzzfhVoq9tVMw62rjEUDbCgU0cliZHcxgswHoRy1p2SWHlzEI
 CpN6y6DLyWePM56HBnXSgly+TE3Wor+5ztGj37IvRwwRg38megI9ynKljZhQYfngyNSy2gN
 uq4moRT1yJfAamqmpKaYd1GvnXesUeW77ZrDM1UL2f8jRvU+XyYYRScc1++ymYgF7GojlKK
 wDPEGs8ANhPPrfRwC0L8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r51uxBuJoqs=:b2SdO0p2+McD+EDunsKqV5
 Kid//WS2XpIOeygS2muqC6vmPaohRSO1+FAxLYMXfm3DwidYLDrv0vbKrnT8I3dEOogMx0kQE
 PCagD820ZXvAXIOPByqRTuBx+d+i3xElTQuQXp7eJHb1w79PrFIyMNrMl21W6XfAAkjzkr1Xx
 Xhhb2XNIAAwZWmvyti+i1JhDtvXXcvCGdfoPPg7iy4f+DqJ5qX49THCEY9yi+GszRBBHNflrk
 d8YYypESCxv8ZDEZAtxdatEsvji6baq9PAQnMVDwGDTuLhfiFH/JTl99YydKIO4uCYDeY95eI
 Ua4jsuFWjmbjWvpL9LMHF2pm9Vh601/F4WnE/PF8n2jSqwi8BfIohgvVGPkhD2TrDQHLVja+8
 stlkvuBOLlOlhZbTxxZL4G5gehpHJ2lHtMKD3dP237lvT+esP4D4mfUi0TEoFhj0IJdQAtwEI
 N1aQi/9/LYb1wZ8oKEmtDmA9n9vptHSbey5BdN7PYzFDVv0adPO7fGJ7+QBG1/hyhCm/GDZMN
 A6N9ODLhYU2Xl3E8HiQ9h5T5kN8zjEeHjoZ8ZqYJ2QdzY1bQEEeVwHw/iSm6n/MovmwIiA4G7
 QHcT9AuChIzteLetY9wDuXBhC02IUS/Kybx/3mMoxkNk8vuq3DInOLhakIb9T6ohXtAStzPiz
 p4opvJJkB2ocblBkJkuy9CRLP9zOX/feNc4gldiOMsSuvBqPQyaFgBS85QnNne0kx7ks=
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-12-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/m68k/cpu_loop.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 318159441440..928a18e3cf05 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -29,7 +29,6 @@ void cpu_loop(CPUM68KState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n;
-    target_siginfo_t info;
 
     for(;;) {
         cpu_exec_start(cs);
@@ -46,25 +45,13 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTOVF;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
             break;
         case EXCP_DIV0:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTDIV;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
         case EXCP_TRAP0:
             {
@@ -91,10 +78,7 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
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


