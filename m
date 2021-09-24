Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0F417660
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:58:49 +0200 (CEST)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlix-0005f6-GP
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgt-0002zJ-6P
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:39 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgq-00058q-Hc
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:38 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MlO9r-1n85CG3njR-00lqMU; Fri, 24
 Sep 2021 15:56:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] linux-user/arm: Use force_sig() to deliver fpa11 emulation
 SIGFPE
Date: Fri, 24 Sep 2021 15:56:27 +0200
Message-Id: <20210924135631.2067582-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
References: <20210924135631.2067582-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WOmLcxSORRujtu9L/LcTUgSJGpqELirPKh1VErxI4QC+PGxIwZH
 wZEpEL/0mEnoJ/bPblYB58GVc8tEMDHBZhDeDwm2twPv5ZYHzHv5NEZNSPoKEpF4HJZoc78
 lP6XU8I7vzPoF46k+OvYa3tfXeF05DSG+EU2oKHCdFd5l/wrOJgz1R5+yY7OD6fkV8QEU9K
 0pETnl78uqR8jPndnx2DQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DLmTv2KpK4M=:eSoCpIzkS+03dk0PdP97sj
 Dl4QWHN2rV91QRpe/TgtwD0K+1lzLthzL3GZA0en0X/wEP3Wujtx0KGiC2XOVzQ2ceRZVzaL/
 6/JW905HAYm+UETifkgcAhfexk0IoThajQ6p4VFAT+43ZnUxjTETNAt490arI4VLhs0SKv7Jk
 CJWW3/eP/RMg33XSmiZDUUKsbf5AmEkpq1e7fstCwo/xIvpbZ7HAYsy3IN34kG2uwNO6M52cK
 hOK4wbckR/eGsr/rX1NA2pYsojkedyyGdEPOdczLO6RXq4JTNHFShts9CIrlYveQc9BsGFRfu
 a55NKKlyIsBIPs+o67Rl+l0vSlc08PQ6VOe9BzhJ1JRLRYkO7qm6AT7RqgRbfsgN6Nn+V2aOj
 ROmT3LnZ2L7tCKNjRI3p8wFqHsBFaLAE12Z+WcRqiPmtN2fqSip8gDjQH2Pd47XBy1pWZyPDb
 FNORzoDuWJJ3Dk3vJm0N/W81fDUQ/IlvickS4wNwpXHCtjKKy76WJ6SIz41sFl+yq83XE6/0C
 wRKXMKmN/CFjfYZ3O4H5ViB91wXwNjwXp+s/To1GcBq3JTHTt7VVIcgFv7iYNlmIY3jQ7NEeI
 /T3NLGRhr424PRszoC6NGkNJOQ6W9E31p+MosPlp3bJPnKuKEGBfwT8AHqv2JFn2vL8ETb/47
 eKoLeqNKjIsbnUGXC3Q9pzDFWwRV5DhIXkrVn1AXjgKRIYyAUicQIcOWxvt0Gf9IZESCPN5Lq
 JzvDq+UziKqF17iBIzkzf6dDbRSQ/rOmzUs9nQ==
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
X-Mailman-Version: 2.1.23
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

From: Peter Maydell <peter.maydell@linaro.org>

In the Arm target code, when the fpa11 emulation code tells us we
need to send the guest a SIGFPE, we do this with queue_signal(), but
we are using the wrong si_type, and we aren't setting the _sifields
union members corresponding to either the si_type we are using or the
si_type we should be using.

As the existing comment notes, the kernel code for this calls the old
send_sig() function to deliver the signal.  This eventually results
in the kernel's signal handling code fabricating a siginfo_t with a
SI_KERNEL code and a zero pid and uid.  For QEMU this means we need
to use QEMU_SI_KILL.  We already have a function for that:
force_sig() sets up the whole target_siginfo_t the way we need it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210813131809.28655-4-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 0900d18105a1..fb78a1aab308 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -268,16 +268,13 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     ts->fpa.fpsr |= raise & ~enabled;
 
     if (raise & enabled) {
-        target_siginfo_t info = { };
-
         /*
          * The kernel's nwfpe emulator does not pass a real si_code.
-         * It merely uses send_sig(SIGFPE, current, 1).
+         * It merely uses send_sig(SIGFPE, current, 1), which results in
+         * __send_signal() filling out SI_KERNEL with pid and uid 0 (under
+         * the "SEND_SIG_PRIV" case). That's what our force_sig() does.
          */
-        info.si_signo = TARGET_SIGFPE;
-        info.si_code = TARGET_SI_KERNEL;
-
-        queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        force_sig(TARGET_SIGFPE);
     } else {
         env->regs[15] += 4;
     }
-- 
2.31.1


