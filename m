Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C389660F0DF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:02:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwr3-0006QQ-4Z; Thu, 27 Oct 2022 02:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onwqj-0006BF-0i
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:58:46 -0400
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onwqg-0006uW-GF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1666853919; bh=T25pljQnIusPjzDPi4ssIlPiCYIn3r7qd1HK4PXbz60=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=jo4ACq5mAEiMqg8RKZJCFGATCiayceGMayJrvWcYSWS9u/aLQ9UXrhqjNkiYltAIy
 whIPERo6bRCOkIQyTRF3DK5jEehqeZ8pP7+BnUQQpyxUvdzpiCZZZO8J4BxGL0TVMr
 dq4vSwTBGsz23EDCbEU6HEumCDGpbzO3kXQQVI6NukS/jV61G+0BlVU16zBy6ZaH54
 uOhb1XJox4WSaZZ75Kutn62GkmisbWPLWl0jqJjVZDEDEY94Aqg/eXu1EOxLIEQpiw
 lwqz4GFe38JJiPN6FtIca/VF1vv4AL/XRus3lClhbI2O4lnpQgxHYCjODRW3LDjMBy
 QzmNJC8VlG5lA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.164.228]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXBj-1osbgU1SS1-00DU0v; Thu, 27
 Oct 2022 08:58:39 +0200
Date: Thu, 27 Oct 2022 08:58:37 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user/hppa: Detect glibc ABORT_INSTRUCTION and
 EXCP_BREAK handler
Message-ID: <Y1osHVsylkuZNUnY@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:5W1IATQXUnViYZogmQCIhgoiAOsAQ4aShw+IQjdqb75oCNOCkTd
 l1KmhrZUjwrhH8EXJjfI1EFvWF6s4QcpUihMEPoRNNuauX4Lzq5CUKW3EljWWJt9yrQCmO1
 SFun+qZS2y5D+hOOJg5Yp2318X39oT3Z6XhgxCYwORYR+hL+ULtekcEVxy2yEE42Q9wsFXR
 w0D1APTOvCdupE5oVDvow==
UI-OutboundReport: notjunk:1;M01:P0:YKRPiQSPN88=;uUjlE02XsOe2NEboBCmRKCQf5xS
 mBNkK3Vh7rfziXxRQH8EbZd5WdK5KBKyjPj7fEZHSF1ht4lRSKJmBW3N/JPUoMAX2Zdt5C7W9
 huriv3XEcMLN5Ufb+kRjkiYWyPoN7rBcgC7OfJff4Ag0Th2Z0Iwo6EPLhq+Hm8yDwQcx910P2
 rFOcn38Pw0VRCfkozQuuXyEhckF8fmJ1RWY0zeKn1OWWQIm7rtV8I6mcFRswKdDtfdotvD2Ls
 lLWXyLItCCQPU5LHgWavinXBCYGnpXdFRkTb8+lMLYXk6CSX8gcPUjHXYiEbWgNGk3UFFEEpf
 feHc+ukZFYkpH6QpODYQcN7bQukIaG6+FU0DHJlhG0MF/qNpDZNLG8z322mC2JRpuU1xWhmYV
 gBKpR4fvDR5Ptl4YLkZNfrlqqj0gD9zti8FAK4D3TqXK5CVHMzK3wwx9OK77NrNWMfBh/lXZy
 JHUFRDaSC9Y1ImGPF4kRBTtx5AcRn6XVikkf63EntNMls5K5Zhkiiz5r8ZQ+/eBaBuWQ0uUdX
 8bZGvvnggOloX7KE8Zvfb7buhnNYzn+TIOZR5sR94LMblo4hO0m+ZyiC2cxZKdcYn4gPwjhPM
 Cx0fxwFwNNQNf3QXeNuJRG1XH/ijb100vo2YpKbpkJtUSQMnjORdb4S7ERBNsM1fF5jjP/uCa
 gYQbWV4vK0xKf9DeblV7e/lSox6lj6wy6a/KP9aEIKxRsg3qZpSqmIqaPg+y+fjL4irDLO4j4
 N2mlp6hFndN/moC+7YiaVt5GV25j6LliNyzwaBuCML+i1EHKLHqYhtj3vXquTY1wkViur1NSP
 UWCTadzyKdyGmbnXHIolownUOy1Q4r8XhgbNUS4XQo832e9LdIgP+1sHtfUrgMR+KqPFwmGwJ
 acdVLn+O5rf2nlZcoUg99e98u0sMl6cHNXzXW1iXTTnv3BIKjso9Wew6g+1nEq0RU3wSF882e
 UBrALKxJH+DYb5R8m+X3Owh32ig=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 98c51e9b8b..a42c34e549 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -196,15 +196,20 @@ void cpu_loop(CPUHPPAState *env)
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
@@ -216,6 +221,10 @@ void cpu_loop(CPUHPPAState *env)
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

