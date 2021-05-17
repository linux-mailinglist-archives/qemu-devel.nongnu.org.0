Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CC7383C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:18:52 +0200 (CEST)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihpL-0000dL-H0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlC-0005u8-DF
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:35 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihl9-0004Kj-Am
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:34 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MyJx6-1lYjSS1ujU-00yhMJ; Mon, 17
 May 2021 20:14:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/59] linux-user/arm: Do not fill in si_code for fpa11
 exceptions
Date: Mon, 17 May 2021 20:13:30 +0200
Message-Id: <20210517181424.8093-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rg9AVIG0sjYD3n7Givh8BQA4Ai+VHIKD10s4ZcYPPoq/biiojII
 d9NsXUQ1WYqxecHnDgrCwC1D0p2WNAWlpFo2Hof6jZd42grydQD6rYDAHl6N3nUcLqPqWG/
 c/lUECeJ7jFdx+cLXMtzKYekWxCIcKdgckpGqxWS4wyES9Yn17WWacqb6uMkL1ebIY/tMdG
 p5xuUXnASqw6C4WYvVViA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a9gGb7MCQMY=:s7h7DidPhQs0V7J+EYSA4T
 UawweaEm9L2q6RaC5p8FHMVUXryK1zuzaanYwgyxBXuFvoDTxlJHj73zTC5Vlj4T7y7kdon8r
 BNw+mbxABlDnptQD9SLpOKjlMOSxqUXrgIy2rN7xndMMlZ0e5/sU/1xplvS60KTRLSq23UA+t
 36EWGjfX1X1OmN2o944Nhh3eP8jYasXkPg/mk62EouFl8J3YLgPtn6DSXx3R9pJ38VvwiKpAu
 i/Qy9vLWQ4XdfNLYJfPZEYp2frUBz0uAOfjr7XIGENwBDFQjj/N7R/zQoVQIy+o8s63IDX9Uz
 YEbG7goe/nwhx2oG+WEX/gFeUhkwBgZkSosWAkl5Ckj+M8p+FVaSoXSAZ3ZCpkiVRXMONIKTW
 4Qy3wg38uNlHtnlG8tJb712giYgAtDYQ3YivnxvyfZC3Jm9VVuek+9hPvrHtJmPwhoiC9v4t2
 N4BrjG6Lso3przSMZAYuef/wZfaHRhTAr5mg9Ud1FjSYrCDw9zloxQ5uVvvIRr4D4xoVnKPjS
 AxZ9u1kSiJtWX6TWXOXjZE=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

There is no such decoding in linux/arch/arm/nwfpe/fpmodule.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210423165413.338259-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index e2a1496b9fe7..5f61d25717c3 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -262,29 +262,15 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     /* Exception enabled? */
     FPSR fpsr = ts->fpa.fpsr;
     if (fpsr & (arm_fpe << 16)) {
-        target_siginfo_t info;
+        target_siginfo_t info = { };
 
+        /*
+         * The kernel's nwfpe emulator does not pass a real si_code.
+         * It merely uses send_sig(SIGFPE, current, 1).
+         */
         info.si_signo = TARGET_SIGFPE;
-        info.si_errno = 0;
-
-        /* ordered by priority, least first */
-        if (arm_fpe & BIT_IXC) {
-            info.si_code = TARGET_FPE_FLTRES;
-        }
-        if (arm_fpe & BIT_UFC) {
-            info.si_code = TARGET_FPE_FLTUND;
-        }
-        if (arm_fpe & BIT_OFC) {
-            info.si_code = TARGET_FPE_FLTOVF;
-        }
-        if (arm_fpe & BIT_DZC) {
-            info.si_code = TARGET_FPE_FLTDIV;
-        }
-        if (arm_fpe & BIT_IOC) {
-            info.si_code = TARGET_FPE_FLTINV;
-        }
+        info.si_code = TARGET_SI_KERNEL;
 
-        info._sifields._sigfault._addr = env->regs[15];
         queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
     } else {
         env->regs[15] += 4;
-- 
2.31.1


