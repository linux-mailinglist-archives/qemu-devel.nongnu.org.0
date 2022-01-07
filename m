Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2E487E5F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:38:45 +0100 (CET)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wwe-0005Lp-HE
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:38:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqv-00057s-B9
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:50 -0500
Received: from [2607:f8b0:4864:20::430] (port=43909
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqt-0007lq-Nl
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:49 -0500
Received: by mail-pf1-x430.google.com with SMTP id 196so6161752pfw.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3SR4ipsMMycJcvIjccSrjD9V54L86dgx4hN5og06FQ=;
 b=zIy6o1PWZB+fHqMSzzCyc1g8lk8/IsvQjpNIojNd/5CLEWCmaxgC3CUsl/fVQS3BJw
 h9Z0TGKKWHAoGtbYZTS/mLCg6DMig0CRwT0BO/h9P2OZxkRBJ0RBeuatmuZIdBieYR90
 sBTlo512uiBLJORBr/Tqrx6dO6DJKdfzZTzFgF7vaAQidMnaftsmEx5mUkB/x6rxIY+l
 d8vrqbQiTkbXTrtu47EpQNjGqnQ7xxpJJ4rWQHr4zkNpV6IIx+xk2dhRzSJkfFh3h4r5
 xgW8Cb5PumGNs9Rp3+eYuKLxpOy+nSk5IOV+IowBPSLQ3UQJT3i0nM5ViYVKcyQI+lFC
 9hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T3SR4ipsMMycJcvIjccSrjD9V54L86dgx4hN5og06FQ=;
 b=T00SowtD0SC1R0VFHldda9MDy/4Qd+dlaYVYZjsyME7D76sJuxrM+q9zkjSMsIKopC
 byu+gfq9ckj8Unoi+FaQsYkjck6yMICvm/Fgpxwl0fD94SujPZtxUcRYg0Yl148Jdka0
 W9uHB5xZsOnsDHLEr0StMJWNFvaje8wOMA62UY/n9ekxIqnppxcZV2bxIi23gTF5mmO1
 o27dqdkKLPrAAqcF5LkUlmG2fkb6P5zRhrf2zOqia2Z4E4eFjWNfqPXragVjzOxpfOyZ
 24KdDA0DCYvyrwpGu15WytnBxQIdd7A+IxPruEnw18hWjcKnh5mgyzj64HICBxVBCrVn
 akIA==
X-Gm-Message-State: AOAM5336FvGA7QjY5TAgl3ooRlhLKXCxT4B4fu/Ypsx9/7nvWAm5mUgJ
 aDN+AS+uzqF2FXbMa7Ex4kEE09fPvl23Ng==
X-Google-Smtp-Source: ABdhPJxSLUXXiNXqZw/FR9K4n6xjYogzW9otxBPMl0h41JcEI5Tb26IszMSOvQQsdyz05sEL6TEtUQ==
X-Received: by 2002:a63:6b01:: with SMTP id g1mr4178340pgc.53.1641591166503;
 Fri, 07 Jan 2022 13:32:46 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/24] linux-user/alpha: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:22 -0800
Message-Id: <20220107213243.212806-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
and calling queue_signal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 61 ++++++++++++-------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index caeea97b9d..de6e0c901c 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -27,8 +27,7 @@
 void cpu_loop(CPUAlphaState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    target_siginfo_t info;
+    int trapnr, si_code;
     abi_long sysret;
 
     while (1) {
@@ -56,18 +55,10 @@ void cpu_loop(CPUAlphaState *env)
             break;
         case EXCP_OPCDEC:
         do_sigill:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_ARITH:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_FLTINV;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_FLTINV, env->pc);
             break;
         case EXCP_FEN:
             /* No-op.  Linux simply re-enables the FPU.  */
@@ -76,20 +67,10 @@ void cpu_loop(CPUAlphaState *env)
             switch (env->error_code) {
             case 0x80:
                 /* BPT */
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                break;
+                goto do_sigtrap_brkpt;
             case 0x81:
                 /* BUGCHK */
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_UNK;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                break;
+                goto do_sigtrap_unk;
             case 0x83:
                 /* CALLSYS */
                 trapnr = env->ir[IR_V0];
@@ -130,47 +111,43 @@ void cpu_loop(CPUAlphaState *env)
                 abort();
             case 0xAA:
                 /* GENTRAP */
-                info.si_signo = TARGET_SIGFPE;
                 switch (env->ir[IR_A0]) {
                 case TARGET_GEN_INTOVF:
-                    info.si_code = TARGET_FPE_INTOVF;
+                    si_code = TARGET_FPE_INTOVF;
                     break;
                 case TARGET_GEN_INTDIV:
-                    info.si_code = TARGET_FPE_INTDIV;
+                    si_code = TARGET_FPE_INTDIV;
                     break;
                 case TARGET_GEN_FLTOVF:
-                    info.si_code = TARGET_FPE_FLTOVF;
+                    si_code = TARGET_FPE_FLTOVF;
                     break;
                 case TARGET_GEN_FLTUND:
-                    info.si_code = TARGET_FPE_FLTUND;
+                    si_code = TARGET_FPE_FLTUND;
                     break;
                 case TARGET_GEN_FLTINV:
-                    info.si_code = TARGET_FPE_FLTINV;
+                    si_code = TARGET_FPE_FLTINV;
                     break;
                 case TARGET_GEN_FLTINE:
-                    info.si_code = TARGET_FPE_FLTRES;
+                    si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = TARGET_FPE_FLTUNK;
+                    si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
-                    info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = TARGET_TRAP_UNK;
-                    break;
+                    goto do_sigtrap_unk;
                 }
-                info.si_errno = 0;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
                 break;
             default:
                 goto do_sigill;
             }
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        do_sigtrap_brkpt:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
+            break;
+        do_sigtrap_unk:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_UNK, env->pc);
             break;
         case EXCP_INTERRUPT:
             /* Just indicate that signals should be handled asap.  */
-- 
2.25.1


