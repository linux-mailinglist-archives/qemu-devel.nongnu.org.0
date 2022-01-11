Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C1648B7E0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:10:53 +0100 (CET)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NTo-0002Qe-2D
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:10:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCX-0007tu-5d
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:01 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:57511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCV-0008GU-Cy
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:00 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M6m1g-1n0FvC3iEY-008GJf; Tue, 11
 Jan 2022 20:52:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] linux-user/openrisc: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:35 +0100
Message-Id: <20220111195247.1737641-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cdvF8q/Jys4QuCzSI6kxTZvivKO55tbItbk0cs+UTZUxUrCYBMY
 gPIp/QWd2Ia4MSKeKEbHDtpLAF3tI66Jk0P/Ystp3n7GxURfxZNup/psLzzB3GR9pwDHbPU
 z0tLg8gyRzN0oj3zFpciOZ015/7xYTRj1ynP39+xZ9q+mFiTnm0njPgRLQkZ5Fp2QHWXwqt
 eh6U+WDO/gB4WPWCn9j6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bQrn4owSXOQ=:+3gU/wK5GkGlYyMUkgQbg7
 3mPAe1kBmKWYo55VVezMEPDVgr7PkyroZHFTNjG5DwzfWz4j7MzfPRxfXh6cLOYFXn603tRMS
 P6rOmxQ3LfzhVdTh3Z+QKIqVWKg+LhUusgBNo9vVkU+Ypm8tW7uqm3kQlYqMDA6DueoUYfgij
 lSc1t7ugGu6/+o3+X5HT6FO6kKD8V9e5dVPcFDViWAjqyaHihwi5UGgeMDDRDr8hs3YezmVzZ
 iig8Yn2Wxmf3IYC/ynj3Za8xboz44Ru5l79/vDu8NlezxvdmHFdKo5R57uLqgafi2Aa5hMUqA
 j+BchySYOkLJ+oXkS3WSYTx03GNFY1J6dvn6FnH/l41Whtct0TpRpOYtrj9NSnroQWVZjyTBD
 07tfumD8K+cHfw1nGCOAInXi90XSLLFVbZdTdMOOlziQvpOVlKKkpT8kekGzgI6jdlkjSK7vo
 3fbIoKmeTuCIz+2gDovxjDDoprIbWwTOkHA51eRpePrvCREQZaYm5uC+eB8jMVSsPla0RPMsc
 cOh8IS3jCYIcytHSPHBuS9hlAxEUSbaaHrh1yC9W+1mcdWg3nZC2hAE0KbydYRaosvykB7e+7
 Sf3H/WcGCCrA0IBavuUUhPAw0qdhxOh+576OZqqvC9NhRWJbjJWOqT/c4EboKUAyxu4t8y0+E
 dM7NCHham5Wv+NWg3O2fX/fIccUcVXtkz/Lxtybyi548phfjqipnzxSaWAoYZOQFi5Kk=
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
Cc: Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-19-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/openrisc/cpu_loop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 592901a68b73..7683bea0649e 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -29,7 +29,6 @@ void cpu_loop(CPUOpenRISCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -55,27 +54,16 @@ void cpu_loop(CPUOpenRISCState *env)
             }
             break;
         case EXCP_ALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->eear);
             break;
         case EXCP_ILLEGAL:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_INTERRUPT:
             /* We processed the pending cpu work above.  */
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


