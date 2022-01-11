Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6323048B7C6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:02:48 +0100 (CET)
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NLz-00072Q-Gn
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCS-0007ke-U2
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:56 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:59661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCR-0008F2-3L
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:56 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M1ZUb-1n5Sak0Aix-0033G2; Tue, 11
 Jan 2022 20:52:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] linux-user/i386: Use force_sig, force_sig_fault
Date: Tue, 11 Jan 2022 20:52:27 +0100
Message-Id: <20220111195247.1737641-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SGn145ZFC4PBL62+hbmIA2uCUNxQU1jlTrXkJV7UYRoNyq67L6y
 5jyhby7zawW2DTow9CVdTyoB2BIRH4c2Z+Zud6qv8nGn+5qIINInPceqbFT4VPDmiWjk/qB
 pLormt3UwVwrh0q4lBLaSZLr4eUozUaUbyWj5KfhbLttzoueXdH4yrNaAgNyrsMva8yUiOu
 8KtgU1Js50NgDxiWOAWxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/rO+vsvH5+4=:I3+nF2eR/EiLA/FmYON0GV
 AdrN1l2r6iD/GZsbvOR6kOW+Gf+LSURh6blqKmpJZuhgK+HmJfN4jyUXemX8gWrhkZDKRpeKD
 tq00/iQdeadCsy8BxBFR859eHJaOt7Om6HSQb6ZYjslLaHWaSd+WuT8xwP3iI67wzGwIBJMOG
 N2eEKDZUkNvyrJKb3bYXqXFIv2f8JI6s12HGQGiCvOVXR/WJqE/mYvvlkE73Y7Gly0DgqCG8G
 eMY/7AZLJLIUL0V7HZuOEwRz0JhpWwU9s89hBTBkO06t9DttvkCCXuZ7/9v9TnO5wKnAK/CZi
 Ju5HlLLKdRWO1cl0tTHgti2PAAOx8RfsrN24/E0zi06IMny6JRjLRq5KJrz1ytrltlml44g++
 9OtuZjJIW7xusHWqcNHqWersH9ST5sAF9GN/k7/clSMa9iMnn0Lss9OEKTlsh7OCNShrS2W31
 noeYVeVm5ahpHZQvIzMmBtfhob0sQgYW+r7DBs/4ddK5UA3aTBbY0T92FBcRQpHksT3xGTXzS
 n6F11eVN4zzAhf7X9IivadOCZaSS1jZRMP1dI+lyXevZ9jzA65+yF1ijYLyJZda4d2ZA1tazy
 GVos0oZJ/yKg74O67QdA15X2LJQHKMy7RtcNiH0lNeuqOAQ4QlcoW/jJkvDbfrIDSlOltaZA0
 uifS+MEs1ujLncsVuBdGYTXNOoDc/ywM9baGs3IVZj1uin82KuKQWGA4u126bHU/ZUuw=
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

Replace the local gen_signal with the generic functions that match
how the kernel raises signals. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-11-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/cpu_loop.c | 47 +++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index ac0f4e321111..29dfd7cd0c54 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -84,17 +84,6 @@ static void set_idt(int n, unsigned int dpl)
 }
 #endif
 
-static void gen_signal(CPUX86State *env, int sig, int code, abi_ptr addr)
-{
-    target_siginfo_t info = {
-        .si_signo = sig,
-        .si_code = code,
-        ._sifields._sigfault._addr = addr
-    };
-
-    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-}
-
 #ifdef TARGET_X86_64
 static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
 {
@@ -107,7 +96,7 @@ static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
     }
 
     env->error_code = PG_ERROR_W_MASK | PG_ERROR_U_MASK;
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
+    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
     return false;
 }
 
@@ -193,8 +182,7 @@ static void emulate_vsyscall(CPUX86State *env)
     return;
 
  sigsegv:
-    /* Like force_sig(SIGSEGV).  */
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+    force_sig(TARGET_SIGSEGV);
 }
 #endif
 
@@ -266,53 +254,54 @@ void cpu_loop(CPUX86State *env)
 #endif
         case EXCP0B_NOSEG:
         case EXCP0C_STACK:
-            gen_signal(env, TARGET_SIGBUS, TARGET_SI_KERNEL, 0);
+            force_sig(TARGET_SIGBUS);
             break;
         case EXCP0D_GPF:
             /* XXX: potential problem if ABI32 */
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+            force_sig(TARGET_SIGSEGV);
             break;
         case EXCP0E_PAGE:
-            gen_signal(env, TARGET_SIGSEGV,
-                       (env->error_code & 1 ?
-                        TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR),
-                       env->cr[2]);
+            force_sig_fault(TARGET_SIGSEGV,
+                            (env->error_code & PG_ERROR_P_MASK ?
+                             TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR),
+                            env->cr[2]);
             break;
         case EXCP00_DIVZ:
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            gen_signal(env, TARGET_SIGFPE, TARGET_FPE_INTDIV, env->eip);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->eip);
             break;
         case EXCP01_DB:
-        case EXCP03_INT3:
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            if (trapnr == EXCP01_DB) {
-                gen_signal(env, TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
-            } else {
-                gen_signal(env, TARGET_SIGTRAP, TARGET_SI_KERNEL, 0);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
+            break;
+        case EXCP03_INT3:
+            if (maybe_handle_vm86_trap(env, trapnr)) {
+                break;
             }
+            force_sig(TARGET_SIGTRAP);
             break;
         case EXCP04_INTO:
         case EXCP05_BOUND:
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+            force_sig(TARGET_SIGSEGV);
             break;
         case EXCP06_ILLOP:
-            gen_signal(env, TARGET_SIGILL, TARGET_ILL_ILLOPN, env->eip);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->eip);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            gen_signal(env, TARGET_SIGTRAP, TARGET_TRAP_BRKPT, 0);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.33.1


