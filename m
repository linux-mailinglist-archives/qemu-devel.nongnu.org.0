Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45848B7EC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:14:06 +0100 (CET)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NWv-0008FH-Gy
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:14:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCb-00082I-88
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:05 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:38127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCZ-0008HD-Fb
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:04 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MxmBc-1m9FnG1WtK-00zJDs; Tue, 11
 Jan 2022 20:53:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] linux-user/sparc: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:40 +0100
Message-Id: <20220111195247.1737641-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ygX5BjSRQiIlCvBEMpI8fe/3afRBof4vum2DYpje31DUOmHiwlK
 EnPSyl7skrAg38WiVq2BzK0naoMffllYRgOefjMJygpiJZ26wKOzSe8sLHjv4nUUDcVz+qe
 Dszj6neIBbiwEeVQoeOtrNWU+exi0iVCnvdyUKB64nvFDmnBfSxloOCSMrR+8m5hiDCJXIu
 0JIcoROe+ljMO262nzaSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oDZ88V+z/Dc=:Jbgr/6xVwAklUeG9tGlvCY
 nG/ukMYVSvJx9Ze2/hXMFamjJfFeaWaSFYDnPn0HzoxqUWjSTcXh+HWlOnAO/5GJXL4m4lul5
 /oLxTs8L0424ocA4hAvBCntafgRV2FDau4lWyg2nJkqY7FgG3/Qbu7C+Wi41gE1J1kDchwUyU
 HE8qnVrDsGz6eh3YveQ68T+/zC1UveiV+eZPYwnZ4fo06//i1wLp4bQgUEOEjWshATPuEWL61
 BO5Ggooq5B3j8bBi7AzCq+C5PCjtL5In/n51Z0t01STU52mlaxCgSrhZ/hrw5BlBEdXWnoQZ3
 tTz0F/0KnShUn0vuighjG0T9tIZLr5F8IcJ1Y83v9CS9+zc4yPaxbmFrWy6FDvyCm5cZui92x
 4X8YBpzv//jqTWbej+0ixbhbbv//arGze8pU0hyK8N+bLZqWTEoCi48bu+j3Z9wn2x6CrQFKv
 O7kg/y2RDJ4FINADSpXbx+cmY3j42Nj+oPiFShsZBPRSlRATxL/iUGpRkxtt+NxOFMNDXCJCR
 C+RRpUIpU0tJGKq5TxrApvT9I35A56LawMI73eODuL2Mz4k8p6qYNwe8SvXrWs8lj74ymkq/T
 qz0UkBdMJHHC4biGClp4hzs6+Oao+8GWxDPEtZ2WcCXKQ/6Mz3EtYSZsO+emFI8Q3DgAhMhqy
 JzY/wmkmL9c9TMzesrjRuqHawyK272Fndi5ykrxmCyDdCgG7zovBftkB5lzscEbCZHxo=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Message-Id: <20220107213243.212806-24-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 8765ab60205c..baf3d9ae011f 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -155,7 +155,6 @@ void cpu_loop (CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     while (1) {
         cpu_exec_start(cs);
@@ -241,19 +240,10 @@ void cpu_loop (CPUSPARCState *env)
             /* just indicate that signals should be handled asap */
             break;
         case TT_ILL_INSN:
-            {
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
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


