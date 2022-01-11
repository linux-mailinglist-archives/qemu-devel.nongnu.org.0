Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A833F48B7B9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:58:47 +0100 (CET)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NI6-0000tf-OH
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCQ-0007iH-5C
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:54 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:33853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCN-0008Df-Mc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:53 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M5PVb-1n60Hs334P-001Opc; Tue, 11
 Jan 2022 20:52:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] linux-user/alpha: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:20 +0100
Message-Id: <20220111195247.1737641-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:m3Vaeu/omFkKSeda42RnV+zY9Rj40yHIsn0LbpTH8PGaUck6+XT
 MbAuOiELMg7/xfkTR6rrVU20w7EDxxN9BJqt45q6GPXJuUTEhLSk/Fht5e0zLhodRo50rU7
 nDgH/zZy/xk8ZrBmyZfOMysTh1TIxXNUyHE4eT6LuUEVt2w8NqnkLzyjVMLLE6S2xoDTgEH
 L+2FWzVu2Tu0e5I5psaUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:39tqvgblDUs=:KENi40eP65SBp1R3J2WJH5
 RDhPguMymeBQSyUeF1eFvVvrxsM0BWsOibg54lNmfSXwL/8dFFbYpK8i1gvMTGrk6CKIYPZp9
 zXapX75Iiwzvs8ygUtLHB09nDVuRfhY7yYh0jjwFn714yvg5B1NSn2bLmMkb/uKlizVoO873j
 PbbsSV0TJZRsSJ/tadOtO0y/3/CDuSt7JvfbH0dk1578TE/AFEDHN3PfC2PmvolFaju/gunIM
 4/fBz4OlWtAPpLHJLwEa+IilOEEcn+wPj2bSHndu+Lu5s26YJ6+dYuR8o3ol84B/oOwPvzbzU
 4ZLTxNmazJHiP9iiMIxcIEk/CaRwRtO1ghHU9IYDy4xMfGf1N5XEMak1QZMk85mIndA4dVb8c
 V13u7aqDxeEerjMgoLTbsrEdKG2FZU4YU0/SpNvzNkwCEsDCkkJ1DjsTkvdqmt1bTH7YZx3Js
 iWHEYZjjpOH9mP7K0NT2yXflNqDfx8diZPCkTocZFnKZKLMobv2iYLOpYiti8pRwY8kFUps10
 GtIFDrxACV7E6+eeYkWyUrMgsyCVJsoqvm5+uiRJZ2P97FuXrUxl2LmTPLlObVSx4yV1cS29c
 /sL9ce9F2wUb6YkCxFBDNx2F8RpPnUt0LirbTeMM4Qwy0blq+hrZ9HKi/LmazwmB+s99x4FfZ
 P2hRLpWAi0x03vdcJT0+SoYmnnzQpOML8Yt7V9SW+QUqQSDzcMcAvRLcCfmmTcnIP+yM=
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
and calling queue_signal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/cpu_loop.c | 61 ++++++++++++-------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index caeea97b9d96..de6e0c901cdf 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -27,8 +27,7 @@
 void cpu_loop(CPUAlphaState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    target_siginfo_t info;
+    int trapnr, si_code;
     abi_long sysret;
 
     while (1) {
@@ -56,18 +55,10 @@ void cpu_loop(CPUAlphaState *env)
             break;
         case EXCP_OPCDEC:
         do_sigill:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_ARITH:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_FLTINV;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_FLTINV, env->pc);
             break;
         case EXCP_FEN:
             /* No-op.  Linux simply re-enables the FPU.  */
@@ -76,20 +67,10 @@ void cpu_loop(CPUAlphaState *env)
             switch (env->error_code) {
             case 0x80:
                 /* BPT */
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                break;
+                goto do_sigtrap_brkpt;
             case 0x81:
                 /* BUGCHK */
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_UNK;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                break;
+                goto do_sigtrap_unk;
             case 0x83:
                 /* CALLSYS */
                 trapnr = env->ir[IR_V0];
@@ -130,47 +111,43 @@ void cpu_loop(CPUAlphaState *env)
                 abort();
             case 0xAA:
                 /* GENTRAP */
-                info.si_signo = TARGET_SIGFPE;
                 switch (env->ir[IR_A0]) {
                 case TARGET_GEN_INTOVF:
-                    info.si_code = TARGET_FPE_INTOVF;
+                    si_code = TARGET_FPE_INTOVF;
                     break;
                 case TARGET_GEN_INTDIV:
-                    info.si_code = TARGET_FPE_INTDIV;
+                    si_code = TARGET_FPE_INTDIV;
                     break;
                 case TARGET_GEN_FLTOVF:
-                    info.si_code = TARGET_FPE_FLTOVF;
+                    si_code = TARGET_FPE_FLTOVF;
                     break;
                 case TARGET_GEN_FLTUND:
-                    info.si_code = TARGET_FPE_FLTUND;
+                    si_code = TARGET_FPE_FLTUND;
                     break;
                 case TARGET_GEN_FLTINV:
-                    info.si_code = TARGET_FPE_FLTINV;
+                    si_code = TARGET_FPE_FLTINV;
                     break;
                 case TARGET_GEN_FLTINE:
-                    info.si_code = TARGET_FPE_FLTRES;
+                    si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = TARGET_FPE_FLTUNK;
+                    si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
-                    info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = TARGET_TRAP_UNK;
-                    break;
+                    goto do_sigtrap_unk;
                 }
-                info.si_errno = 0;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
                 break;
             default:
                 goto do_sigill;
             }
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        do_sigtrap_brkpt:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
+            break;
+        do_sigtrap_unk:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_UNK, env->pc);
             break;
         case EXCP_INTERRUPT:
             /* Just indicate that signals should be handled asap.  */
-- 
2.33.1


