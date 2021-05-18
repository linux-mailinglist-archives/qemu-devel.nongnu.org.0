Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248A387151
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:35:19 +0200 (CEST)
Received: from localhost ([::1]:51962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisNy-0006pP-1i
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKR-0006eJ-0H
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:39 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:42215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKO-0006pm-0S
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:38 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mk178-1l3G6n3jnk-00kKmn; Tue, 18
 May 2021 07:31:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/59] linux-user/arm: Split out emulate_arm_fpa11
Date: Tue, 18 May 2021 07:30:35 +0200
Message-Id: <20210518053131.87212-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1Tw5RwhX65xUtanJL7lMepIhmcLRDc4JczHhiGsOnKOMeKKNJdH
 gzn4zkFqwcx//io4O41vkee2DlYSrxL5VieQGpLWUjO5Vc5p7bqAIM85HxY5gJq5mlEvhBa
 8zONab+u2ZLTpK6scAjOs7yW4HgKwvj0VlKE5vS+sB3wT9r7ZzkFaQkp8v7VzKFCUoivaHb
 xUetbFqctBtiMHYEyf34w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ijddHn25e7c=:Vsvgtw+7w4TXA+e86U2Avp
 tAJQPFS43083PwZOLOOaQR6E3RhCoYZpJavZ61VjJiXPh5cIU/TSiGL2a//kME9UGSDXDpcIg
 siTWnhiF1hVuh9V9njZXqSEavyBBG6yXE3sMcon56tLXcKvjHzVQQYtAuJR9UhHy1bauNkhJV
 oTokT8iuA1ioLzMnHjTZMwFtJhNfsWtxIeobAxSDs5VsYSuVRTqH1MZYX+dCUiQTWvD1d4GE4
 RnE0SqYP58Y2m1pRgS+hWgivjyvI8elTAZKuxUySFXKigZK4DQKuL5fX7ajZJrMkjPWnNAQZ/
 uqwzghrhKVe1ubrQ7m+uMDO87jXXgPUiL9nvI2KrmrqjfKInoABrssQQ1Ca1sXBY8oDzJ8oiA
 smoJxS7jdW+pJ7AGKGA/lpT6OTcVjvslNKwx6gvsWw7K3EKTmiJjuHAWiILudx/gWAXpi0Emr
 ypfUOrG9JWJhnAhw6rQ971yRZb6VT2AWfRLWUBhDG7SKp29zfZheH58LCCFcCI6OvKyOYTQ/t
 ZdTLrO6tA2EOrg8O5Q07To=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

Pull out the fpa11 emulation to a helper function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210423165413.338259-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 153 +++++++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 59 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 989d03cd89d8..106909c7d880 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -224,6 +224,92 @@ static bool insn_is_linux_bkpt(uint32_t opcode, bool is_thumb)
     }
 }
 
+static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
+{
+    TaskState *ts = env_cpu(env)->opaque;
+    int rc = EmulateAll(opcode, &ts->fpa, env);
+
+    if (rc == 0) {
+        /* Illegal instruction */
+        return false;
+    }
+    if (rc > 0) {
+        /* Everything ok. */
+        env->regs[15] += 4;
+        return true;
+    }
+
+    /* FP exception */
+    int arm_fpe = 0;
+
+    /* Translate softfloat flags to FPSR flags */
+    if (-rc & float_flag_invalid) {
+        arm_fpe |= BIT_IOC;
+    }
+    if (-rc & float_flag_divbyzero) {
+        arm_fpe |= BIT_DZC;
+    }
+    if (-rc & float_flag_overflow) {
+        arm_fpe |= BIT_OFC;
+    }
+    if (-rc & float_flag_underflow) {
+        arm_fpe |= BIT_UFC;
+    }
+    if (-rc & float_flag_inexact) {
+        arm_fpe |= BIT_IXC;
+    }
+
+    /* Exception enabled? */
+    FPSR fpsr = ts->fpa.fpsr;
+    if (fpsr & (arm_fpe << 16)) {
+        target_siginfo_t info;
+
+        info.si_signo = TARGET_SIGFPE;
+        info.si_errno = 0;
+
+        /* ordered by priority, least first */
+        if (arm_fpe & BIT_IXC) {
+            info.si_code = TARGET_FPE_FLTRES;
+        }
+        if (arm_fpe & BIT_UFC) {
+            info.si_code = TARGET_FPE_FLTUND;
+        }
+        if (arm_fpe & BIT_OFC) {
+            info.si_code = TARGET_FPE_FLTOVF;
+        }
+        if (arm_fpe & BIT_DZC) {
+            info.si_code = TARGET_FPE_FLTDIV;
+        }
+        if (arm_fpe & BIT_IOC) {
+            info.si_code = TARGET_FPE_FLTINV;
+        }
+
+        info._sifields._sigfault._addr = env->regs[15];
+        queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+    } else {
+        env->regs[15] += 4;
+    }
+
+    /* Accumulate unenabled exceptions */
+    if ((!(fpsr & BIT_IXE)) && (arm_fpe & BIT_IXC)) {
+        fpsr |= BIT_IXC;
+    }
+    if ((!(fpsr & BIT_UFE)) && (arm_fpe & BIT_UFC)) {
+        fpsr |= BIT_UFC;
+    }
+    if ((!(fpsr & BIT_OFE)) && (arm_fpe & BIT_OFC)) {
+        fpsr |= BIT_OFC;
+    }
+    if ((!(fpsr & BIT_DZE)) && (arm_fpe & BIT_DZC)) {
+        fpsr |= BIT_DZC;
+    }
+    if ((!(fpsr & BIT_IOE)) && (arm_fpe & BIT_IOC)) {
+        fpsr |= BIT_IOC;
+    }
+    ts->fpa.fpsr = fpsr;
+    return true;
+}
+
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -244,9 +330,7 @@ void cpu_loop(CPUARMState *env)
         case EXCP_NOCP:
         case EXCP_INVSTATE:
             {
-                TaskState *ts = cs->opaque;
                 uint32_t opcode;
-                int rc;
 
                 /* we handle the FPU emulation here, as Linux */
                 /* we get the opcode */
@@ -263,64 +347,15 @@ void cpu_loop(CPUARMState *env)
                     goto excp_debug;
                 }
 
-                rc = EmulateAll(opcode, &ts->fpa, env);
-                if (rc == 0) { /* illegal instruction */
-                    info.si_signo = TARGET_SIGILL;
-                    info.si_errno = 0;
-                    info.si_code = TARGET_ILL_ILLOPN;
-                    info._sifields._sigfault._addr = env->regs[15];
-                    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                } else if (rc < 0) { /* FP exception */
-                    int arm_fpe=0;
-
-                    /* translate softfloat flags to FPSR flags */
-                    if (-rc & float_flag_invalid)
-                      arm_fpe |= BIT_IOC;
-                    if (-rc & float_flag_divbyzero)
-                      arm_fpe |= BIT_DZC;
-                    if (-rc & float_flag_overflow)
-                      arm_fpe |= BIT_OFC;
-                    if (-rc & float_flag_underflow)
-                      arm_fpe |= BIT_UFC;
-                    if (-rc & float_flag_inexact)
-                      arm_fpe |= BIT_IXC;
-
-                    FPSR fpsr = ts->fpa.fpsr;
-                    //printf("fpsr 0x%x, arm_fpe 0x%x\n",fpsr,arm_fpe);
-
-                    if (fpsr & (arm_fpe << 16)) { /* exception enabled? */
-                      info.si_signo = TARGET_SIGFPE;
-                      info.si_errno = 0;
-
-                      /* ordered by priority, least first */
-                      if (arm_fpe & BIT_IXC) info.si_code = TARGET_FPE_FLTRES;
-                      if (arm_fpe & BIT_UFC) info.si_code = TARGET_FPE_FLTUND;
-                      if (arm_fpe & BIT_OFC) info.si_code = TARGET_FPE_FLTOVF;
-                      if (arm_fpe & BIT_DZC) info.si_code = TARGET_FPE_FLTDIV;
-                      if (arm_fpe & BIT_IOC) info.si_code = TARGET_FPE_FLTINV;
-
-                      info._sifields._sigfault._addr = env->regs[15];
-                      queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                    } else {
-                      env->regs[15] += 4;
-                    }
-
-                    /* accumulate unenabled exceptions */
-                    if ((!(fpsr & BIT_IXE)) && (arm_fpe & BIT_IXC))
-                      fpsr |= BIT_IXC;
-                    if ((!(fpsr & BIT_UFE)) && (arm_fpe & BIT_UFC))
-                      fpsr |= BIT_UFC;
-                    if ((!(fpsr & BIT_OFE)) && (arm_fpe & BIT_OFC))
-                      fpsr |= BIT_OFC;
-                    if ((!(fpsr & BIT_DZE)) && (arm_fpe & BIT_DZC))
-                      fpsr |= BIT_DZC;
-                    if ((!(fpsr & BIT_IOE)) && (arm_fpe & BIT_IOC))
-                      fpsr |= BIT_IOC;
-                    ts->fpa.fpsr=fpsr;
-                } else { /* everything OK */
-                    /* increment PC */
-                    env->regs[15] += 4;
+                if (emulate_arm_fpa11(env, opcode)) {
+                    break;
                 }
+
+                info.si_signo = TARGET_SIGILL;
+                info.si_errno = 0;
+                info.si_code = TARGET_ILL_ILLOPN;
+                info._sifields._sigfault._addr = env->regs[15];
+                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             }
             break;
         case EXCP_SWI:
-- 
2.31.1


