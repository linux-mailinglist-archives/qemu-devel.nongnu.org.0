Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611361791C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:51:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVuy-0006bk-Gb; Thu, 03 Nov 2022 04:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVum-0006Wm-NM
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:41 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVuj-0004B5-Hr
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:31 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mae7u-1pREZp0J10-00c6T0; Thu, 03
 Nov 2022 09:49:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 1/4] linux-user/hppa: Detect glibc ABORT_INSTRUCTION and
 EXCP_BREAK handler
Date: Thu,  3 Nov 2022 09:49:22 +0100
Message-Id: <20221103084925.3860524-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103084925.3860524-1-laurent@vivier.eu>
References: <20221103084925.3860524-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gM6NXiRLzzPvpRwDch01M6NZKw/xXzglwZTPhxlcnW3lX1iVH6M
 dk3dNk9tzlicme6QY3f0LImIgH48eixgY56KuFXeVqJ5n6J/rp+KfINP4/sEGnq4pVm6y0g
 f2oOHT084alPLzRtNwldxT2rV2ZLjQzKjMTgoCwnmTOUsEUqFFiK1EbuSC+bK/5IQtRQEIl
 MgLXqH4CMIlG/gV/GSFjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XZqdCWJtEdY=:OVaka1aAPzzN8MOTZirB0o
 TguoM0jDNLsaSXG7s/z9GzVW6mN2mk7Dl8SxqxSjqzhXE5RUuk4wPrUpCeF+TuXrPDfW8OK7A
 QJhXLq3DSPLJFc8yZf8Z2AKgQh0ckYm3UP3//mOdkhtIT+l7RxygwoUbm4/HphMVQx3dOJzQe
 t9/GwqCUAETQbILC5a5ODLe0zrtTA3ycHka35LRoVHW6BT8dNYBtvSM14VeRyQW7Nrr+zBaCp
 gu3KtgV4fzPTP4PNTblz9kQzH53tndwiE3QUZ/2L+8ZtgTA6Fdz5j5ei2n1Wse43Sp6mXkIfd
 hDxUfY3/7Fxj8Sg3UHUo32OjsYoNj7yo2Ku5cXgJFPfbHrPxEDj93NDapJZdHYheZ5U1zkNgM
 e/7oMSHmn0nw3/ZGn5Scc0Ys2Gefdz8IN4mWJrk82GwZikmIeGuLRHbHqGnol/VGCEpcto+AT
 fCXqUZG64ABDmqx7Q7MBuxY3tOwHjxhazAxR5gsRBdli99+vAVFzgkDLpbtBogdX/IKkIAyEM
 GqhR4/NT0Jdth21hw8bWCsQXboIXhtiIR4nVJo0JsZ1iuUSP8LnBjbYKILT17ToWkBkLDzRSF
 +yp92dACaUywk3DhVRhu3PlJ5vXKJIwZBMYRJXENfLi+zkrJjpnJHQIk+KW9DFlowooVxq5DJ
 cU1AbaUd9haGFTPawvA9dDATZodv3cXO4DIvYLTYbfSubEDTREOmDGJX6GMVkFBadBp2ay3rG
 cWcMbYCMzMtcJ6FZAnCJE3tAPvxcDzhg1pVCO5zQikTiqMa0P3AncrZ1cVx+FK8wwuskcNAnW
 xx02tbq
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

The glibc on the hppa platform uses the "iitlbp %r0,(%sr0, %r0)"
assembler instruction as ABORT_INSTRUCTION.
If this (in userspace context) illegal assembler statement is found,
dump the registers and report the failure to userspace the same way as
the Linux kernel on physical hardware.

For other illegal instructions report TARGET_ILL_ILLOPC instead of
TARGET_ILL_ILLOPN as si_code.

Additionally add the missing EXCP_BREAK exception handler which occurs
when the "break x,y" assembler instruction is executed and report
EXCP_ASSIST traps.

Signed-off-by: Helge Deller <deller@gmx.de>

Message-Id: <Y1osHVsylkuZNUnY@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/cpu_loop.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 1ef3b461911c..8ab133510602 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -147,15 +147,20 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
             break;
         case EXCP_ILL:
-            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
-            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
+            EXCP_DUMP(env, "qemu: EXCP_ILL exception %#x\n", trapnr);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->iaoq_f);
             break;
         case EXCP_PRIV_OPR:
-            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
-            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
+            /* check for glibc ABORT_INSTRUCTION "iitlbp %r0,(%sr0, %r0)" */
+            EXCP_DUMP(env, "qemu: EXCP_PRIV_OPR exception %#x\n", trapnr);
+            if (env->cr[CR_IIR] == 0x04000000) {
+		    force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->iaoq_f);
+            } else {
+		    force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
+            }
             break;
         case EXCP_PRIV_REG:
-            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
+            EXCP_DUMP(env, "qemu: EXCP_PRIV_REG exception %#x\n", trapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
@@ -167,6 +172,10 @@ void cpu_loop(CPUHPPAState *env)
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
+        case EXCP_BREAK:
+            EXCP_DUMP(env, "qemu: EXCP_BREAK exception %#x\n", trapnr);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f & ~3);
+            break;
         case EXCP_DEBUG:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f);
             break;
-- 
2.37.3


