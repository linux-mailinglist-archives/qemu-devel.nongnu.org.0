Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87E47B4E0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:13:16 +0100 (CET)
Received: from localhost ([::1]:46126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPy6-0006Pm-Ji
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqr-0000YS-CP
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:45 -0500
Received: from [2607:f8b0:4864:20::42e] (port=37430
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqp-0005vE-RP
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:45 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 8so9805615pfo.4
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVhhElrpe+4XPKy6R1NWowFrVYM3GvIonkol7qAjv2A=;
 b=sCvKwgLVkvUg+Fr2s93NNjt3f+OFXdI83+y7JkhBS6Ufd4uE8jusw3TKqd9PNQIq+C
 f0PjQm4asGRbc8C9zbRm3L8SZKBMn2+1STCO4D83Dnr1gZMk2qcFC3jlq14NkoLCO/HK
 QbOO8PVCekoH7IWh0we5MGe9peTCfFb8O2cpgiYonBtegiEBP9DY1Az8HbkBhlVE193V
 AJwAoJ7jbpfE/2cGotbxHyrCJM1ci5vJUbY+Xt9f3jYvYIwAho+A2fv8t4H9Hnsgm6bX
 zCfHMS+W6cw8HCYGlLJKK/LpD8eDFpgdSsqYPNxOZB5uIf6kIWydzFCcE5Fn5xbHYAG8
 xPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVhhElrpe+4XPKy6R1NWowFrVYM3GvIonkol7qAjv2A=;
 b=qIHcxbbkgrCSah1NXXJZrBXdmKAtHwaLBeu1p2jI/c7p7NAQXwsdmO6ysjBh7ykxFp
 PvDXXo1fAG+HZ0JdTzbwSzcUDF2TRKLoYb3+F0OQy5ECOyl6bw6y9i82f8XCRAOKWZOr
 E+kiYaLvPmLlj+cMNjcgM58yHcOaxfVpfgbXCLRlFDskHBTMm86FETnBdcXPaXaEOodM
 T5RaLOQA2OkG/JfuyvRbkLAQ7SSch4AbTJkyxXaij+bVkiqHbsQN3ibhCz2zo1goGNNJ
 nVT5HVbiVnUPvXDJ2eaV7CKvWZde2cCOrLX+TNiMIoiTl0CRUCCrQamEhkF6j4iWAfKB
 HBSw==
X-Gm-Message-State: AOAM530aN9cwmNDWjnA0oVKBYUZv46NxvqJDFNYmqNXUgviducAHNSLt
 w/O6nOQbJG7879PIEraHap47eMrvv5HQCg==
X-Google-Smtp-Source: ABdhPJxcJQlmf5V1HV9wbQlibUCQWR4NsEocYPyMu/uGUfO3hIYS0QJI7oYGns9gjuiniTfypBgeGA==
X-Received: by 2002:a63:b50d:: with SMTP id y13mr16340575pge.286.1640034342618; 
 Mon, 20 Dec 2021 13:05:42 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/24] linux-user/mips: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:19 -0800
Message-Id: <20211220210529.150423-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
index 7317194cc3..034b31f853 100644
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


