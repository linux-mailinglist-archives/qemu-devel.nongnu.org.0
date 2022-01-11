Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BE548B828
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:18:00 +0100 (CET)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Nah-0005ti-UM
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCd-000841-5m
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:07 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:60865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCa-0008Hl-9X
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:05 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MsIbU-1mEjRk3yOY-00tmGl; Tue, 11
 Jan 2022 20:52:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] linux-user/mips: Improve do_break
Date: Tue, 11 Jan 2022 20:52:31 +0100
Message-Id: <20220111195247.1737641-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6FVp8rF6uC1I7u7c6uWHPNox3Ug+JF04THgAaKDcq/7c21W7PpM
 gQxn9q1fTNIOsDPh5pl8c/c1EgLe6vPapAz7ktk565yQsOlsreYA/NKsIoAB12zBOmU9+Yq
 VCHFsqlo0vgSLmMH1ebCfJqqHafmc1Yl3xwuZgPJGdiTyK70/pSjUVN6VvNr8vfWZMxVuRV
 VStzPsR/mq68E3LnTasbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zI5vTTebP7s=:cw6cbn4F6pMcCx7UfNdk7J
 7bOdHkol2suDxPUMX2LxjoO+3oBSg/Fgj4XyFxlX5epFKbHTvMko0PV/rb57qqtKLd1+EAUiZ
 PqaLVVBNGA9sfbTcyOpY/LM0FargOsc5ak3FGNzGSPq1dtyNhfhFZaBoxZs6Tj6mMidR9nJky
 17i9Qlw93Xn/my5IeSnToFQ9qreOMKf8FSIVKx+vpW4zsqVINDco2yV5970yvd+8NBtgWCvES
 /+Z7kaVJBzr/bFfX+cRdljYawnTZ7vmBPEPNRVzZAxkjj9kBtI9ggT2fbx6fU1Q7HDRTgv/zv
 I2pUy+CRyCuqAJfTffaiiREwXd/hu2cvrge0gk8N8ue8l1MzpvZxpasZSLBnPM3mOyaniEBnQ
 1L6l9a5p0/3HzQFEj/BFAujrri/7IHER56uVP2I5RvuhYsC7POkgacqselXtLu2VLQKhLAK6T
 rbUrMgLelWwKUhAVZ6lfmHKUGgmjguWyzatpOYWcQrxtcNfqKQ1+sA6WOar2tXuAfgc5zfl5Z
 n0+O3NP5B0kd3585oiKYxE8PWD+kXfNsjgNn1aarj0FGYt1XC6erK3s3L3uPsAAWnQWjcY788
 FsfO0uQ3/3lO4PEG+2pEjvOuQH3CoXCX9XJYZNZKC3vtPyXIIYa2/9VdWewyoDrbLte3tBla+
 QYDEthPFCwlL5A88UDDNr3SKmadEI2kYsxEHkkcZq+ypu82uBVTvY1QD9SgWhSejrzDc=
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rename to do_tr_or_bp, as per the kernel function.
Add a 'trap' argument, akin to the kernel's si_code, but clearer.
The return value is always 0, so change the return value to void.
Use force_sig and force_sig_fault.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-15-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/cpu_loop.c | 46 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 32f9fc1c1c7c..4fa24cc07452 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -40,29 +40,25 @@ enum {
     BRK_DIVZERO = 7
 };
 
-static int do_break(CPUMIPSState *env, target_siginfo_t *info,
-                    unsigned int code)
+static void do_tr_or_bp(CPUMIPSState *env, unsigned int code, bool trap)
 {
-    int ret = -1;
+    target_ulong pc = env->active_tc.PC;
 
     switch (code) {
     case BRK_OVERFLOW:
+        force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, pc);
+        break;
     case BRK_DIVZERO:
-        info->si_signo = TARGET_SIGFPE;
-        info->si_errno = 0;
-        info->si_code = (code == BRK_OVERFLOW) ? FPE_INTOVF : FPE_INTDIV;
-        queue_signal(env, info->si_signo, QEMU_SI_FAULT, &*info);
-        ret = 0;
+        force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, pc);
         break;
     default:
-        info->si_signo = TARGET_SIGTRAP;
-        info->si_errno = 0;
-        queue_signal(env, info->si_signo, QEMU_SI_FAULT, &*info);
-        ret = 0;
+        if (trap) {
+            force_sig(TARGET_SIGTRAP);
+        } else {
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, pc);
+        }
         break;
     }
-
-    return ret;
 }
 
 void cpu_loop(CPUMIPSState *env)
@@ -205,6 +201,13 @@ done_syscall:
                 abi_ulong trap_instr;
                 unsigned int code;
 
+                /*
+                 * FIXME: It would be better to decode the trap number
+                 * during translate, and store it in error_code while
+                 * raising the exception.  We should not be re-reading
+                 * the opcode here.
+                 */
+
                 if (env->hflags & MIPS_HFLAG_M16) {
                     if (env->insn_flags & ASE_MICROMIPS) {
                         /* microMIPS mode */
@@ -257,9 +260,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, false);
             }
             break;
         case EXCP_TRAP:
@@ -267,6 +268,13 @@ done_syscall:
                 abi_ulong trap_instr;
                 unsigned int code = 0;
 
+                /*
+                 * FIXME: It would be better to decode the trap number
+                 * during translate, and store it in error_code while
+                 * raising the exception.  We should not be re-reading
+                 * the opcode here.
+                 */
+
                 if (env->hflags & MIPS_HFLAG_M16) {
                     /* microMIPS mode */
                     abi_ulong instr[2];
@@ -293,9 +301,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, true);
             }
             break;
         case EXCP_ATOMIC:
-- 
2.33.1


