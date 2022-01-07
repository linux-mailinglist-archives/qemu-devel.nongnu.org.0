Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFAD487E7D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:50:07 +0100 (CET)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x7d-0001vI-Vv
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:50:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr3-0005BB-0N
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:57 -0500
Received: from [2607:f8b0:4864:20::1035] (port=46900
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr1-0007qB-4Y
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so7582438pjb.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RA0Ku7nHSdkDF6d4ejtW3+OZBLOqDrcXi6Q40nYBNk=;
 b=yzxsLNj2398e2P12uc5PmL4TZv2DopJyIyRLcyZIDutm6CN0revZ2+2TRatvasCESs
 pUgdegaYjd+VUIJepwqhmlVP3/0CwmrVs94pORHLpu/8C35B8HVBNQPpiJJ0wswG4ltN
 Rxc+G/18GpGrOg4y9+mCsDM07M00R6LHRjQuEGvMnBx726vWqZwexLDkGKRXDuOhcI8u
 pktyPtNvf9x4KYDLFJABsvcRMx+nV//dqeQmX+j9Ehm0Y94pRDC3VoSclwOSZ3fx+0M9
 kqtHdb7Bb0SZFPugnMZrfcbTHjUHE/ArlaAxketz1ocoL/p/tGlDgVZsO3QXkXLm79NV
 ffHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RA0Ku7nHSdkDF6d4ejtW3+OZBLOqDrcXi6Q40nYBNk=;
 b=wqNlEaXjCxiumhRgUzjN5ZWZCIzpm8VsQ/GHHC6hekQpq9t/PjKR77psWir71+ZRN/
 NJ3w7lRCXdHwrZk60/G+QyKn4xwoQZe/+E9Zz5WtDP1+qj5f1/o3B/pyepxsieFW6l3D
 UWozuuNVxAHvUDyXw2mnZEi5avcLrbuYyE6gsoTIMAF7NGjdCOwtzRi8gVNPGdZ/9SQd
 KlfdX0+rynPo3Hs3wDS/eC7zmU3j6ZwRZV6ZMSz4AERnTlrscn33qNSs4PGLGkLR4oV2
 eot0EP+ajJ8mMbtsD/Zw5CcYzdTaPpp+cyp2nfKjp9zGI0o8gTTisGrgVAmWyFLDScuv
 CiCw==
X-Gm-Message-State: AOAM533P8YTz2fZi1ejyk/BV/K19IsGF9XChxQ4r/NiSKNtDTQU7+RIu
 MsR+v/Xo7B2yrbUeWUxB8IhJIWTHyPTwLA==
X-Google-Smtp-Source: ABdhPJxNfDGCoOTPZPz3Id5RBKm+DBLS6Zlxwf0FQFt6mXO6we0giYPkrtVWJRWlR3fYjiF/6hc4aQ==
X-Received: by 2002:a17:90a:fe7:: with SMTP id 94mr8870914pjz.23.1641591173452; 
 Fri, 07 Jan 2022 13:32:53 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/24] linux-user/mips: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:34 -0800
Message-Id: <20220107213243.212806-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP
and SIGFPE; use force_sig (SI_KERNEL) for EXCP_DSPDIS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 4fa24cc074..1286fbc2e0 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -64,8 +64,7 @@ static void do_tr_or_bp(CPUMIPSState *env, unsigned int code, bool trap)
 void cpu_loop(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
-    int trapnr;
+    int trapnr, si_code;
     abi_long ret;
 # ifdef TARGET_ABI_MIPSO32
     unsigned int syscall_num;
@@ -156,43 +155,32 @@ done_syscall:
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


