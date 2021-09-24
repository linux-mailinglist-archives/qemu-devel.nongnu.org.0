Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC328417688
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:05:03 +0200 (CEST)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlp1-0007NC-0Q
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgu-00032i-KM
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:40 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgs-0005AF-5R
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:40 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N3bGP-1muGu01dop-010c3Y; Fri, 24
 Sep 2021 15:56:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] linux-user/arm: Use force_sig_fault()
Date: Fri, 24 Sep 2021 15:56:30 +0200
Message-Id: <20210924135631.2067582-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
References: <20210924135631.2067582-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GR3BsFG5L32UWDfi68Eb/l0ifBT1ItetpTC46iNdBYsV5jx+Jee
 1nm3TfPWBMjNPfjChpHxjcTz+vCA4a+RpvzFRnwItOHSAPi39hRepSq549WvlsK34h3i/5Y
 TTNBWUJIEj306mH+QdRNRivMfykFKRLiKNLbRmWrw2bUorP6MIeCJIRPqRC/ZjTt04JoF45
 lW1bWUcsNmzT69OeCMRUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DJQyKOes5TI=:faTkQ5QLfVg0DQJSUAajCm
 P+wrEh1GoxAGqFYED1CPQSgj6gT8QZd53r3t+q0V7VI5d6TtRf6YfQW5xbtaPx/ZhTHFKHe/Y
 ms0P4dkecvvWL1k2JQL3U4XH/58oYbg3eDjFc/wuNKH4j2Z2gwtRZymZ8Hgxy0KprlvNbiolX
 4MhlqYikDqgq3Gb4sZSPp3Tjj6OqAbJ8RMzWmB8X/o02cnc9YTiphwad2v5ACuyylGtsjgpQd
 BPqwEoevY4NcdpvCX2l4nm/JAaN50ZYXy1bUCNbr1edPWWwtZNfK3OAW4X5tlQbaE9aS6rLj9
 w6jbORUqkYQng7ICsC5BjU9ynAjT73GkqfwlNeN548bOej7MgffV6m/2NR05pl50Hz+HAUeza
 xi57A468AFEupY7GTC+vAS7xBgu7i2EK2xCjggkiEQnkoypGH3LkRG4Jy5NV6ClptMjv/WdYW
 KNyLcMt/8ohhjAbH3CNbDXA/i/aPqxVSCNrUDfP5RobgXx6Vp4qRftCGWRxeJH5vMR4NysNEm
 9Lej9JmFYrictpDBCt2SGcD7wbahELDzPnj2zfvEg4LKtrdNfeN+SO61AiXRn7dTonJhcu8bT
 ndnLkLzkM8SFp8H+lZNYiWNcG2Pt/X2HBkSsuuN4Ihmi5xLvwYXsBgopKqCCu1OKu6lYqtDfg
 kXmqKOZkTBzMYLuDjKCIs+k/5HsoElu/Ty4tRI7Z03BhGSOw0YSrOEmBSE/ynIH173K2vzj5a
 piun5XUBWldG/OOMviWCzTlRxGoAMeZ0M4Dp3g==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Use the new force_sig_fault() function instead of setting up
a target_siginfo_t and calling queue_signal().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210813131809.28655-7-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 53 +++++++++++----------------------------
 1 file changed, 15 insertions(+), 38 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index fb78a1aab308..ae09adcb9501 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -94,7 +94,6 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
 {
     uint64_t oldval, newval, val;
     uint32_t addr, cpsr;
-    target_siginfo_t info;
 
     /* Based on the 32 bit code in do_kernel_trap */
 
@@ -143,12 +142,9 @@ segv:
     end_exclusive();
     /* We get the PC of the entry address - which is as good as anything,
        on a real kernel what you get depends on which mode it uses. */
-    info.si_signo = TARGET_SIGSEGV;
-    info.si_errno = 0;
     /* XXX: check env->error_code */
-    info.si_code = TARGET_SEGV_MAPERR;
-    info._sifields._sigfault._addr = env->exception.vaddress;
-    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
+                    env->exception.vaddress);
 }
 
 /* Handle a jump to the kernel code page.  */
@@ -286,8 +282,6 @@ void cpu_loop(CPUARMState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n, insn;
-    target_siginfo_t info;
-    uint32_t addr;
     abi_ulong ret;
 
     for(;;) {
@@ -322,11 +316,8 @@ void cpu_loop(CPUARMState *env)
                     break;
                 }
 
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPN;
-                info._sifields._sigfault._addr = env->regs[15];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN,
+                                env->regs[15]);
             }
             break;
         case EXCP_SWI:
@@ -394,18 +385,14 @@ void cpu_loop(CPUARMState *env)
                              * Otherwise SIGILL. This includes any SWI with
                              * immediate not originally 0x9fxxxx, because
                              * of the earlier XOR.
+                             * Like the real kernel, we report the addr of the
+                             * SWI in the siginfo si_addr but leave the PC
+                             * pointing at the insn after the SWI.
                              */
-                            info.si_signo = TARGET_SIGILL;
-                            info.si_errno = 0;
-                            info.si_code = TARGET_ILL_ILLTRP;
-                            info._sifields._sigfault._addr = env->regs[15];
-                            if (env->thumb) {
-                                info._sifields._sigfault._addr -= 2;
-                            } else {
-                                info._sifields._sigfault._addr -= 4;
-                            }
-                            queue_signal(env, info.si_signo,
-                                         QEMU_SI_FAULT, &info);
+                            abi_ulong faultaddr = env->regs[15];
+                            faultaddr -= env->thumb ? 2 : 4;
+                            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
+                                            faultaddr);
                         }
                         break;
                     }
@@ -436,24 +423,14 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            addr = env->exception.vaddress;
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = addr;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            /* XXX: check env->error_code */
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
+                            env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
         excp_debug:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            info._sifields._sigfault._addr = env->regs[15];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[15]);
             break;
         case EXCP_KERNEL_TRAP:
             if (do_kernel_trap(env))
-- 
2.31.1


