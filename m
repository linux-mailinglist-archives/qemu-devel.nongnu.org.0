Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6548B7EB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:14:02 +0100 (CET)
Received: from localhost ([::1]:37334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NWr-0007uv-RW
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:14:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCZ-0007yZ-Q2
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:03 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:36205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCW-0008Gi-I8
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:03 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MC2sF-1nCZs71Zm9-00CNc3; Tue, 11
 Jan 2022 20:52:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] linux-user/ppc: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:36 +0100
Message-Id: <20220111195247.1737641-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mMC3Rm7cC5yvtCN7sJzI3HiZrEs8fbKR5lAYgBNDRMtQz7Dsaux
 Oc/KEza3lE4NVvrRmNEMV0sKmY7RmkdXvdpyGRpNK8WYn7wj060K2sHH7kF+aqTDGL6bu/Y
 LMdKyDm/rOlXMELlqCDw6S9BGyOSrILqCa6Qaj+JIDQqd+XTCYozyKO2r72GwtljP9v0rio
 BJqQxcbWVGijs1SKXg3rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:baXzJXeE9Xw=:bznoprZpSslhH7wxEo1Xqx
 EffFqKQy0CsswAQjCpXlBQlfA+iEn9qWSI1xqtOKeY8sQ0OyiayAiEJTDT11EPjSiy+tV7MQg
 SBLKWMdW3FmKRzaz/ETlbQWiZO0wFa7hOEF4RHL5dkMUxagA2wNcJ2HqH3Tuoag8PFTOQAKP4
 GnBZBf0LPv2I0wTkjgiIkSL5UE56m63I3QMPqAkVR1fgqJmAguaWpaZP7aN9B8FNOXusNDZ8J
 ywZK5CFFhzpFSsW91jZDmUdGtxVjEtHChQJP2PSX6kzWogdXCFwwD4XTatXPZNwHBYpGALsRG
 ZZsLWEepnnMhXSfgu5cjxmjL4qht3MO5pgGmuDRrbPdKM0iMJDR+LnHEsb6jnfMZ280C87tp9
 yvMDNxbaeQ4Eira8cz19pq/wIpNhSkiJA9QaGgbX27OxdAZlmB9Nj4UuOUM2ALWraxV2qMdxk
 QrpAW2b2rXWkExAcdQ+0oImL2LTPcRg/JsXgEwHfH9y5RaAvS/1YAqnEouvxH6RkJcU9gFMKA
 Jn4xFLwwU9ZmFs7YxHRP+dMA4eNVDRikPyJr8RnewA1Ld699n0JlezFus0v4roYa4VtsxiWfE
 RyUc+8hx4t8lLMBQDEOW8II6TAXCY60pgXACRYBPHwjZeNz7zw25Ym0Ja9rMSANPMpHeSIj0/
 WJYhEhju8DgFZbMpKlw0jf7C70vlnS+TnQkRTxcncnfBX28mul360DnQ0z1L0Q4t3gSo=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
and calling queue_signal.  Fill in the missing PC for SIGTRAP.
The fault address for POWERPC_EXCP_ISI is nip exactly, not nip - 4.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-20-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ppc/cpu_loop.c | 136 ++++++++------------------------------
 1 file changed, 28 insertions(+), 108 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 30c82f23540a..46e6ffd6d300 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -76,8 +76,7 @@ int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, uint32_t val)
 void cpu_loop(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
-    int trapnr;
+    int trapnr, si_signo, si_code;
     target_ulong ret;
 
     for(;;) {
@@ -102,61 +101,10 @@ void cpu_loop(CPUPPCState *env)
                       "Aborting\n");
             break;
         case POWERPC_EXCP_DSI:      /* Data storage exception                */
-            /* XXX: check this. Seems bugged */
-            switch (env->error_code & 0xFF000000) {
-            case 0x40000000:
-            case 0x42000000:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            case 0x04000000:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLADR;
-                break;
-            case 0x08000000:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_ACCERR;
-                break;
-            default:
-                /* Let's send a regular segfault... */
-                EXCP_DUMP(env, "Invalid segfault errno (%02x)\n",
-                          env->error_code);
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            }
-            info._sifields._sigfault._addr = env->spr[SPR_DAR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_ISI:      /* Instruction storage exception         */
-            /* XXX: check this */
-            switch (env->error_code & 0xFF000000) {
-            case 0x40000000:
-                info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            case 0x10000000:
-            case 0x08000000:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_ACCERR;
-                break;
-            default:
-                /* Let's send a regular segfault... */
-                EXCP_DUMP(env, "Invalid segfault errno (%02x)\n",
-                          env->error_code);
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            }
-            info._sifields._sigfault._addr = env->nip - 4;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            /* FIXME: handle maperr in ppc_cpu_record_sigsegv. */
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
+                            env->spr[SPR_DAR]);
             break;
         case POWERPC_EXCP_EXTERNAL: /* External input                        */
             cpu_abort(cs, "External interrupt while in user mode. "
@@ -167,24 +115,23 @@ void cpu_loop(CPUPPCState *env)
             /* XXX: check this */
             switch (env->error_code & ~0xF) {
             case POWERPC_EXCP_FP:
-                info.si_signo = TARGET_SIGFPE;
-                info.si_errno = 0;
+                si_signo = TARGET_SIGFPE;
                 switch (env->error_code & 0xF) {
                 case POWERPC_EXCP_FP_OX:
-                    info.si_code = TARGET_FPE_FLTOVF;
+                    si_code = TARGET_FPE_FLTOVF;
                     break;
                 case POWERPC_EXCP_FP_UX:
-                    info.si_code = TARGET_FPE_FLTUND;
+                    si_code = TARGET_FPE_FLTUND;
                     break;
                 case POWERPC_EXCP_FP_ZX:
                 case POWERPC_EXCP_FP_VXZDZ:
-                    info.si_code = TARGET_FPE_FLTDIV;
+                    si_code = TARGET_FPE_FLTDIV;
                     break;
                 case POWERPC_EXCP_FP_XX:
-                    info.si_code = TARGET_FPE_FLTRES;
+                    si_code = TARGET_FPE_FLTRES;
                     break;
                 case POWERPC_EXCP_FP_VXSOFT:
-                    info.si_code = TARGET_FPE_FLTINV;
+                    si_code = TARGET_FPE_FLTINV;
                     break;
                 case POWERPC_EXCP_FP_VXSNAN:
                 case POWERPC_EXCP_FP_VXISI:
@@ -193,51 +140,50 @@ void cpu_loop(CPUPPCState *env)
                 case POWERPC_EXCP_FP_VXVC:
                 case POWERPC_EXCP_FP_VXSQRT:
                 case POWERPC_EXCP_FP_VXCVI:
-                    info.si_code = TARGET_FPE_FLTSUB;
+                    si_code = TARGET_FPE_FLTSUB;
                     break;
                 default:
                     EXCP_DUMP(env, "Unknown floating point exception (%02x)\n",
                               env->error_code);
+                    si_code = 0;
                     break;
                 }
                 break;
             case POWERPC_EXCP_INVAL:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
+                si_signo = TARGET_SIGILL;
                 switch (env->error_code & 0xF) {
                 case POWERPC_EXCP_INVAL_INVAL:
-                    info.si_code = TARGET_ILL_ILLOPC;
+                    si_code = TARGET_ILL_ILLOPC;
                     break;
                 case POWERPC_EXCP_INVAL_LSWX:
-                    info.si_code = TARGET_ILL_ILLOPN;
+                    si_code = TARGET_ILL_ILLOPN;
                     break;
                 case POWERPC_EXCP_INVAL_SPR:
-                    info.si_code = TARGET_ILL_PRVREG;
+                    si_code = TARGET_ILL_PRVREG;
                     break;
                 case POWERPC_EXCP_INVAL_FP:
-                    info.si_code = TARGET_ILL_COPROC;
+                    si_code = TARGET_ILL_COPROC;
                     break;
                 default:
                     EXCP_DUMP(env, "Unknown invalid operation (%02x)\n",
                               env->error_code & 0xF);
-                    info.si_code = TARGET_ILL_ILLADR;
+                    si_code = TARGET_ILL_ILLADR;
                     break;
                 }
                 break;
             case POWERPC_EXCP_PRIV:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
+                si_signo = TARGET_SIGILL;
                 switch (env->error_code & 0xF) {
                 case POWERPC_EXCP_PRIV_OPC:
-                    info.si_code = TARGET_ILL_PRVOPC;
+                    si_code = TARGET_ILL_PRVOPC;
                     break;
                 case POWERPC_EXCP_PRIV_REG:
-                    info.si_code = TARGET_ILL_PRVREG;
+                    si_code = TARGET_ILL_PRVREG;
                     break;
                 default:
                     EXCP_DUMP(env, "Unknown privilege violation (%02x)\n",
                               env->error_code & 0xF);
-                    info.si_code = TARGET_ILL_PRVOPC;
+                    si_code = TARGET_ILL_PRVOPC;
                     break;
                 }
                 break;
@@ -250,28 +196,19 @@ void cpu_loop(CPUPPCState *env)
                           env->error_code);
                 break;
             }
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(si_signo, si_code, env->nip);
             break;
         case POWERPC_EXCP_FPU:      /* Floating-point unavailable exception  */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        case POWERPC_EXCP_APU:      /* Auxiliary processor unavailable       */
+        case POWERPC_EXCP_SPEU:     /* SPE/embedded floating-point unavail.  */
+        case POWERPC_EXCP_VPU:      /* Vector unavailable exception          */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->nip);
             break;
         case POWERPC_EXCP_SYSCALL:  /* System call exception                 */
         case POWERPC_EXCP_SYSCALL_VECTORED:
             cpu_abort(cs, "Syscall exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_APU:      /* Auxiliary processor unavailable       */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_DECR:     /* Decrementer exception                 */
             cpu_abort(cs, "Decrementer interrupt while in user mode. "
                       "Aborting\n");
@@ -292,13 +229,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Instruction TLB exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_SPEU:     /* SPE/embedded floating-point unavail.  */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_EFPDI:    /* Embedded floating-point data IRQ      */
             cpu_abort(cs, "Embedded floating-point data IRQ not handled\n");
             break;
@@ -355,13 +285,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Hypervisor instruction segment exception "
                       "while in user mode. Aborting\n");
             break;
-        case POWERPC_EXCP_VPU:      /* Vector unavailable exception          */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_PIT:      /* Programmable interval timer IRQ       */
             cpu_abort(cs, "Programmable interval timer interrupt "
                       "while in user mode. Aborting\n");
@@ -444,10 +367,7 @@ void cpu_loop(CPUPPCState *env)
             env->gpr[3] = ret;
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->nip);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
-- 
2.33.1


