Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B548B7DC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:10:13 +0100 (CET)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NTA-0001fd-I3
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:10:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCa-000821-SW
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:05 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCZ-0008HL-57
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:04 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MIMXC-1nAezY3XS0-00EKcM; Tue, 11
 Jan 2022 20:53:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] linux-user/xtensa: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:41 +0100
Message-Id: <20220111195247.1737641-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eYEeRwehWZjj3fsdJIxfyy9hMcsfYP9gy/rl2O+b8nLVIY3KZ8K
 jSNfbwIkbV2tiou3iincqt7ZIZO1al17udYJeUsJ5ma5dgh/o1wTAHIZCDoD/aDcOX4pA1v
 1Zi8kQz+sHrnagWbf5Kpx0hl5W/QlbN+nh8cT6q/fZ3fm+TNtim67PIUTI8YbV6hL15hsZ4
 2yM5Db40tcJRCSl/Oq+Bg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ezd9my7NH+w=:sgqTWBo2c4hxbEhfTY/24Z
 cYGeUYAgfIWyeqdqwGqjmvDzxEoD6r14JyByU6vfc5rkZblYSZj+IvucMhiyLE/GGhF0IVwQj
 4vURmasz0KYguG1ZLi+/2iUxnkrKfU3fyLfTOrn+ZybeBG4826DP4e5BMlcn8zsZ8dAVUHyta
 1LWgIv364DAh8gmi5Vjxx9U/XEWbug965eViPguBZhW0f/ZnfGQJn/3LNV5PZYk3lEb/HCnok
 uYH7621wm3xTUysQnsu/hTph3KqhzsOVg1H6yW3wx16WeiCfdZdlsU2Cf/BgTaEzqgi2QmqDw
 wJlHAQGdetRfC/FHzG0L8BueV3AaOrOjLeO3OkguNUeLm0BB/3UDZZ8RmtfpXxDuzFRD8cBJt
 ah1mnk9wcBdfi9RwWCyc53gPmA4hUVpna4Xc4Md8GGHPCVgFRnEkexHsb+pwTAz5CV9fGbdRK
 2hfLsdlcnpkuqMlIN/FxgIDIIdJYuhyTrWOaJ3k5aBubsoN09bswJ9aqUMurUn0AETYondxUF
 J1Dai5YtNboosgTrVOFq4jwvUq11m3HR0xggh2pcme9jtOpncOFRF/QpiygAx3kPu246ucq/X
 /FyxmkN/PSY+qm3/3XLQCxtHiNNW/Gv6AeeGoFrqyhzwL5ygGMPLyPM54nBYj3Rz42TxLOJls
 hj9mdhq+KKMfcuJknszjg8cd10XFn0BfUhOz7iIlrChsSw1e1BwOJlwng7Pkjkn3c16g=
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-25-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/xtensa/cpu_loop.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index 6bc6d6dee6c4..d51ce053926d 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -126,7 +126,6 @@ static void xtensa_underflow12(CPUXtensaState *env)
 void cpu_loop(CPUXtensaState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -163,14 +162,12 @@ void cpu_loop(CPUXtensaState *env)
         case EXC_USER:
             switch (env->sregs[EXCCAUSE]) {
             case ILLEGAL_INSTRUCTION_CAUSE:
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC,
+                                env->sregs[EPC1]);
+                break;
             case PRIVILEGED_CAUSE:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code =
-                    env->sregs[EXCCAUSE] == ILLEGAL_INSTRUCTION_CAUSE ?
-                    TARGET_ILL_ILLOPC : TARGET_ILL_PRVOPC;
-                info._sifields._sigfault._addr = env->sregs[EPC1];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC,
+                                env->sregs[EPC1]);
                 break;
 
             case SYSCALL_CAUSE:
@@ -219,11 +216,8 @@ void cpu_loop(CPUXtensaState *env)
                 break;
 
             case INTEGER_DIVIDE_BY_ZERO_CAUSE:
-                info.si_signo = TARGET_SIGFPE;
-                info.si_errno = 0;
-                info.si_code = TARGET_FPE_INTDIV;
-                info._sifields._sigfault._addr = env->sregs[EPC1];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV,
+                                env->sregs[EPC1]);
                 break;
 
             default:
@@ -232,10 +226,8 @@ void cpu_loop(CPUXtensaState *env)
             }
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT,
+                            env->sregs[EPC1]);
             break;
         case EXC_DEBUG:
         default:
-- 
2.33.1


