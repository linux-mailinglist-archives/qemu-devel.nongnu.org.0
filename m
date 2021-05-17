Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482DB383C1F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:21:32 +0200 (CEST)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihrv-0006Es-BA
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlH-0005v8-3c
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:44 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihl9-0004Kc-Er
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:38 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFbBO-1lh0wv23Ty-00H9Pd; Mon, 17
 May 2021 20:14:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/59] linux-user/arm: Split out emulate_arm_fpa11
Date: Mon, 17 May 2021 20:13:28 +0200
Message-Id: <20210517181424.8093-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SUrLuZA3bw1NwZTYcQOqHDe4/AKHYADCsiwaDiZd4nyz9L8IauU
 w0YGhigPoTcfeFxaSZp+gZnSqd5jXhChs5rpZ1e4DANfCczoZ3IK1zFIm0qhJuP0KZmD2f4
 BFCKcMmRtvY0JH4/qw0cVVZnZFUiCAotHEasDdKKnh+k2e64sjm8v+0Y6YtyoCjOD12cXBc
 OFnOV+6ZJl2DXO91nxZXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X6M2PtFSfRk=:fjpJNCaQ1JkLg+0JvXoEhH
 NLMqIoOMHWRewpNPZgiR6DWhT7vfiThhT4eEBIYmUb7MJEqL9zaQAdRvwG6smAG+r037C7SIn
 EzBnfpFN96XRdmt2PTbaNFbMmjvRtcLs8vP7mqnw6mIc2cr/RKq7rtASACWDZyReDuq9fVRaH
 6vesCz6+ns1pkWhDrrKDzSQJLAghB0+oFRTah3TtI5VKt9HWnfJBUH1lMSfVZX26bnQsDyPT/
 N214N9w/GpuQ2RL37e9J/XDI/ifs0vbpiDyft89GsuRUZmmhdK9OjUbwaUD79ARp23LilLWqS
 eo+++JxLFoVkg0wHSipBUxsUVgNIUVbYXXUlYPQsJlGvquP93C56uS6DMuCZJxGIA64LRkQH/
 gQ4lkGi9O9umr/NM9duTTpHPv2hMDj0UoPu6mNDSiZEVlLndj3RCxGCH26N2lVk6cvGGMJykF
 9vu3fvMF+jx56E4wPjb88G+Nhn5X5xqQOrJx3kFA4bTB0n13TFd3J2ZCextW4xYXSecelOLmD
 gQ44LpjV72TZJc3gyiyhwM=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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


