Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6B48B7CF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:05:53 +0100 (CET)
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NOy-00049n-DZ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:05:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCZ-0007x9-Fh
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:03 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:47567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCX-0008Gv-Fe
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:02 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MVeDq-1mxNL51qho-00RaBO; Tue, 11
 Jan 2022 20:52:59 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] linux-user/s390x: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:38 +0100
Message-Id: <20220111195247.1737641-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xXYbnggBpHice1j8KQ61ckvVlBlTSwThdP+l0zzZZ/lnurPOnRX
 QgRHqopYvD13CArWjsI+G+FQccaae9Nd6hEazyoNDOk6HN5yrXIkEXwfTTHQEt4EM2uZ/Lt
 7Dp1dq+ORYkM3SXFqn+RmaUtU2EF836AWZ82i+P6Z0EqPK64fZUNH+n9lvz4iPcloxhlz88
 KZOQdmLnaFz9fx/sQILgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dbWlLPKaIoo=:TUl9dF3l5K4OqCky6bi5CJ
 dI/9tBnLRk5PWkjfOE3pnXTIWbZ9u0hlPJjGXNJZVlZg1W2jW+MqDTDwdJlGJRMAZLhz9aiHa
 v7oT14s7quIpIqxXXjQbKIHuabNfcExZAhpKroJzMpwk3d75xhgMi3zVsDzueShQhjIe+Obg8
 WD11qm1R3INTArTnBukg4xW+HpKbTeOL8Jv/qndI8udJGp3Lnx5aq4vs1GcZI4hub0RwxzAsC
 r2KjGHjjOrs7mWroa4Uod8kJ/i1uwTRnOUWbxucu2dmmVGi9RYRDZz6KZns9baUAMps7xSLKV
 4HuqsRY4gJU2DH4sGp6PqWY4ogv+R37UAE+pkFrHctZvWyhmxi6oT+XnX8Yac0oEF/xcJNr2o
 OhE28R4z6J72GIN1zk6oVcBhdLLd5iRNtKwIyBzrvLtQA0n43rN7tJkz80uzdj5LwxuiqIqcR
 h4957eyZ5iuYqIoZD6oIEJViUFj6UUyMxf50c4gflmpljrSa0alihICBZqNQDrr01RTvdOvxu
 fiqf88K2dO5H0S6EtoYZgQCLapdxZzjPxn5MlNDRjgk2nBQ7kghVml/2v5Zzy4ytvA/XS15wh
 3oAKb+OkeBTOmmCOQEt2S0P7mJ2GrWC/PET3Ym6LIkxz+a9PBnURcHntanUX7p2ZD/xdPr7oI
 4DO90gwT5uXIFLD8mqToTTuNXyHPbp+k7vnVw3Xur983TWSZ2Qb+gMU43cImuxdelbOQ=
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
and calling queue_signal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-22-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/cpu_loop.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index ad0c3cd2635d..7901dfe6f518 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -58,7 +58,6 @@ void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, n, sig;
-    target_siginfo_t info;
     target_ulong addr;
     abi_long ret;
 
@@ -158,11 +157,7 @@ void cpu_loop(CPUS390XState *env)
              */
             env->psw.addr += env->int_pgm_ilen;
         do_signal:
-            info.si_signo = sig;
-            info.si_errno = 0;
-            info.si_code = n;
-            info._sifields._sigfault._addr = addr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(sig, n, addr);
             break;
 
         case EXCP_ATOMIC:
-- 
2.33.1


