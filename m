Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA26D3F3D86
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:16:13 +0200 (CEST)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHeu4-0001v5-UD
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaV-0007u9-3F
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaR-0000lU-2v
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:58 -0400
Received: by mail-pf1-x430.google.com with SMTP id k19so12312884pfc.11
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CM+P5kCp2bGplgCBuu0CKtvfrg+9JXuhdewm1jvsnkY=;
 b=V9g94EqcSUn8LEzZ03ro9P4HJJ+fJIPDVR3TZuO+k28P/xpmgt/ynSW9A4vZubwBdf
 6+QsmIX3NUbojH0P6hiPbfdV8KEo25vMicyYTcufwivieMl4SiHAwlAXCkOnrFiOjHHy
 Ii5MWUc+RJERJhdGoH/a7/bkESXzRrZ9gchJbQnaOljbOiqouAd4Kz4QdzsEzBkDu8m6
 xh0vpXdbGVbKwzf+wpoqZt7zdR/PcCGB+06kKg1ak/q6qp5+Ldj0+qQWoBidcURV6S8Y
 fhzqjbn43zr7uRQrG31q3Rm1pHYVMrSLhfn1ul0y7ncDPA0UpM2Z4NEgfuRjlVDtK+AD
 MB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CM+P5kCp2bGplgCBuu0CKtvfrg+9JXuhdewm1jvsnkY=;
 b=T685juau3cs25IjOG3dj9/hsJPqhra67qqJguH1/xCpPKRGYK6ndhhNEbIbxOUs1bt
 fLIQ4vMFXZl2DYhd846bc94U1NsaQP07owpBoXXJ7fV624eAVKiuJydryfQZmWeDLZcl
 cQudAJJ4zCl8T+q3CcdANwP6kRXJ3Dm6HFALbdEXaQJeU5pKyL8YAX0DY+rhilJlimAf
 nQc+i9tkdegXCqOntTeKgFYtzG3gupwgKz1L4lzdXMuUu399SoBGLn36i2xdl+W8ytGj
 ftvCL8oAzlj/RU90GvpYqyBtXxzIQwHAwz5uYMLmq78qI3+NsgOHHRQiYtgP7OkYMb6G
 bMNA==
X-Gm-Message-State: AOAM530pM0glczNSuAArkVIp9Z9XVmMwX0UGG5HrD34qzx8eukklQ4kb
 25hMgaNfGFi1kMgvPMsXh+9cIidpikApTw==
X-Google-Smtp-Source: ABdhPJyiowhIp/asuV9QlUxIFssrLFXjXC8Cl6+7SDDEweeKg5+lPB5G9HvVGE0PwYLZZ9ejmnEYsw==
X-Received: by 2002:a63:df49:: with SMTP id h9mr26139673pgj.228.1629604553824; 
 Sat, 21 Aug 2021 20:55:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/30] linux-user/mips: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:30 -0700
Message-Id: <20210822035537.283193-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new functions instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c | 45 ++++++++++++--------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 797b6bf659..2350ac66e1 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -63,8 +63,7 @@ static void do_tr_or_bp(CPUMIPSState *env, unsigned int code, bool trap)
 void cpu_loop(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
-    int trapnr;
+    int trapnr, si_code;
     abi_long ret;
 # ifdef TARGET_ABI_MIPSO32
     unsigned int syscall_num;
@@ -157,52 +156,36 @@ done_syscall:
         case EXCP_TLBS:
         case EXCP_AdEL:
         case EXCP_AdES:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->CP0_BadVAddr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sigsegv_for_addr(env->CP0_BadVAddr);
             break;
         case EXCP_CpU:
         case EXCP_RI:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = 0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        case EXCP_DSPDIS:
+            force_sig(TARGET_SIGILL);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
-        case EXCP_DSPDIS:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT,
+                            env->active_tc.PC);
             break;
         case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_FLTUNK;
+            si_code = TARGET_FPE_FLTUNK;
             if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_INVALID) {
-                info.si_code = TARGET_FPE_FLTINV;
+                si_code = TARGET_FPE_FLTINV;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_DIV0) {
-                info.si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_FLTDIV;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_OVERFLOW) {
-                info.si_code = TARGET_FPE_FLTOVF;
+                si_code = TARGET_FPE_FLTOVF;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_UNDERFLOW) {
-                info.si_code = TARGET_FPE_FLTUND;
+                si_code = TARGET_FPE_FLTUND;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_INEXACT) {
-                info.si_code = TARGET_FPE_FLTRES;
+                si_code = TARGET_FPE_FLTRES;
             }
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, si_code, env->active_tc.PC);
             break;
+
         /* The code below was inspired by the MIPS Linux kernel trap
          * handling code in arch/mips/kernel/traps.c.
          */
-- 
2.25.1


