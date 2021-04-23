Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF83369782
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:57:57 +0200 (CEST)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZz7s-0001rP-HE
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4f-0008Qw-33
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:37 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4X-0008B0-E4
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id s14so18571670pjl.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OF9GCiPmwtEZD3+W9XODFXfhzEfD8yc9sVldJzd/aQ=;
 b=UWPPqTbPkHndNkGfrbKYTSWVaItFkjIV7WFdH9e3PhSUGmqZaXK5YDBqslg3w7U5Yk
 A6TF6QIMMhhN0ZJSOOYXUY1tsuJs4OpU8HmlEXeRQo3TndHjo9NafoDvPt+Xizm6MkXQ
 EJuPD8PkrhY/4xPpHpEZQSI/TNTPG86N6lkyOPi2yzIB74J7DDxCGeQibrba0IIZJ2du
 HsVTSWJxAoDjkLUCn5d1+yBcccOJxe8DiYN+H5BIChKMwvULHti5xZYzJYH7b5rc1wr4
 Ag/Xlmk+liryF43FehIJr8761V3Ecg5UoOa1j8kprYfCF7M+elh1nasd23d2yP+kwY3N
 gFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0OF9GCiPmwtEZD3+W9XODFXfhzEfD8yc9sVldJzd/aQ=;
 b=uG0r1p06sPLocutSTOP5PAbFyyEadsgy8GJNAmJFVEJu98n1X4cbqr+JeHMDWGtYaM
 vGjnZF9pFBSDZ7fA+7F7aY95jKDkYEuoRM8LADtjbLGnJX10xae5AQ1/98IwpBZSj8YZ
 VWqSCOdD8I20ngZm/usugg4/BOGsvF3j5cFD/9lY08ODu9E0U4zDfa35VYGAuh++te5e
 vbZPwFS9thNcBjsaRfzHGH00Z+Ix/s8BFEzkgFWRdMVxs2X69u1yuQfBHfrPuzksKHRY
 yOTkln/Vzmvlwfepul+WOAszxE1gGBsp55bY6XOK81GA/F4lEUg6Td4n/18vT4gUDomv
 i03g==
X-Gm-Message-State: AOAM533s6RETdD7bK9QCmlsa1cvXFZczF7GGg9nMVkgv+n9FDsb4qtiK
 3E7y+NDC1aIKwCYshRLIzvPIRjPTn3xxnw==
X-Google-Smtp-Source: ABdhPJzMnH5qGKxAEIyNP8s81lYnEmC+SQZSbfshSPu3RF/KygiunLE9R5zyKCSU4CxTf7nOOiNwYw==
X-Received: by 2002:a17:902:9890:b029:ec:8e2a:d6e4 with SMTP id
 s16-20020a1709029890b02900ec8e2ad6e4mr4671750plp.13.1619196855625; 
 Fri, 23 Apr 2021 09:54:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] linux-user/arm: Split out emulate_arm_fpa11
Date: Fri, 23 Apr 2021 09:54:10 -0700
Message-Id: <20210423165413.338259-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
References: <20210423165413.338259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull out the fpa11 emulation to a helper function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 153 +++++++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 59 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 989d03cd89..106909c7d8 100644
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
2.25.1


