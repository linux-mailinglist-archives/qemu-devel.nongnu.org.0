Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8F2387144
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:33:18 +0200 (CEST)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisM0-0001In-UN
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKR-0006fL-Kl
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:39 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:38281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKP-0006rY-85
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:39 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M27ix-1lko8d3fxp-002Vdo; Tue, 18
 May 2021 07:31:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/59] linux-user/arm: Do not fill in si_code for fpa11
 exceptions
Date: Tue, 18 May 2021 07:30:37 +0200
Message-Id: <20210518053131.87212-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5D98tTpusNVYKwgF/UlPpY4Q7yRnTsGkIxu0I/TyQXiSoN6Vqan
 M3pXP2zd+Fn+s6PLdCoINwpfYtB4QikbU/NUioGAAlEmfhAaplq+icpkJSkwPucRYsOkEwC
 7Bd60NVvYqZFj6BWWg3fphjsU6Of2FhILwjJ2f+2VVDJDSm8kvq5pZJmLpz14emWai53dVR
 Uwk27wUbx6+pp+ejddy3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wK/v6X9ir5k=:apC3rRfzW1AL9gpKZniGYg
 tH4SXtAQjUJpwH7gn4xm5PtzRp8E6/HWeHC4eFLiLNEJASk087wrg9EHNo+Vk82jhWwICZoQk
 tvP7v1lCr26sSxwQjmgsNEby4BYpAltq0PqltLKx39mPGEiBtoLXpSRqEEUH2KuQI5ACcMYwL
 En6K7E/TLqdZG1eI47oDAC/WfQTeHUiKtJ2MityP2HFb4LtLQ0Ye4ZcIIeMqo/7S2Wrzf+3n8
 vC27kuIhYRTQ1bKFhdZZ1/WLB6zdO2ch1f84c5qc6PJwm4gfDOLGYs0Kty9BsV9lhN4N4h+y8
 0sbEbKW0OrsOQZDHvX4rajR8doX0MQreGdUyW5LI4OZtYgLTWoIBJb2eGryZQ49VJNSDl/GMn
 KJJsp+bFDzRHBcSVg+3TtFBu/l7JrVV2JVDuLqCJ4hlDB4s35UOSHZ8WuljpCop27GwOfy0jS
 F8d+t9UxCHucR3XepF/JpJIC4IWc3M02f4b8ZVa2omPYvIApfPGlLmTS5Wfxq1Jq9Bd2FI9/l
 alELUjnKOrfSM2XD5esgew=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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


