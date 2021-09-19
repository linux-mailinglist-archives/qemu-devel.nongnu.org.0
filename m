Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC541091F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:03:09 +0200 (CEST)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmAe-0003TO-Hy
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm58-0003Tu-Rp
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:26 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm57-00054l-4q
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:26 -0400
Received: by mail-pl1-x631.google.com with SMTP id c4so8750919pls.6
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DP6CysYqyI4zUx+NQSroBUcZ3sHISL9BNa/2VuWYkc8=;
 b=rku6lImTHyJwJ1DRxvU9aEPlmFxfeFgaxBlGADHI+FeW3/Rtlyfqu12jiBg2Uo6vp3
 iBad4LzyBMdgB09u0rAT6yy9DLalsQ5nUk42s84O5+LJ9ChszaiKQeyjBzGt9cumrtDx
 K8sqgvqoUsRsaDCg6YAhMWQEqqEGcE2XooCQR4cGyzDdl1Pqx/+DinoT4UZ1vo4+hiAX
 cVOurimqyuRQuJT7W3Iw2rC3KY6J0EqlOIcnOlvZByfgq5MstA3qdpa3mEVF514Drt0D
 9+RE2+xGYompwN+dnBavpdUTpcS57u0rLWAMRQW1vzAVqRHubQBrZuIRjCxfZLi0fPSQ
 SMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DP6CysYqyI4zUx+NQSroBUcZ3sHISL9BNa/2VuWYkc8=;
 b=mm+WcV9IcdecQIYnQ1Ar6sMkeX2/yMtdhGT97fE3VA2EDck84BsjpghEvyX0eh8DyN
 Gzv9h0faKJk9ZlSakm250k0XwH74V8FOrpqXcnI/s/aPaVvjIx96plCHmeP3L+yh6foJ
 qA8A4Dkc/trwdpSctnq8EE5w2I/GFVUrRNkPMWSVpvFmNYS+mwmusHFwWSfGBHcSLSjv
 mdxHISasVkYAG3Dg5LnbjTwYqjDlUXPULQBrgE+kQtrb3fBeKMhUm5SArtQ210FeE6yu
 l07oUTWLDo0IONgncynkcrBTqT2eDKokGTjTScAU/sjvHKI0EaO/FxqmBYwQQr9nH4L9
 5o3A==
X-Gm-Message-State: AOAM533hNo/zUIhF0XTOX/9vckiGf5amNRgvP8E/Gln3vojEY7SonHRf
 RM9FTfAxmlcQMDW1b1aq3DspXXaqIrqaWg==
X-Google-Smtp-Source: ABdhPJx+E0bppu3TdMuscvnY6Y+fcnYpuimHPPwqXc8ku8KW/ttj7blgQAV8UMWEXYJ3G7AjFT9MNw==
X-Received: by 2002:a17:90a:5889:: with SMTP id
 j9mr29702057pji.91.1632016643852; 
 Sat, 18 Sep 2021 18:57:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/25] linux-user/alpha: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:56:58 -0700
Message-Id: <20210919015718.466207-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 69 ++++++++++++-------------------------
 1 file changed, 22 insertions(+), 47 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 18698d9515..09455eff2e 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -21,12 +21,13 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUAlphaState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    target_siginfo_t info;
+    int trapnr, si_code;
     abi_long sysret;
 
     while (1) {
@@ -53,26 +54,14 @@ void cpu_loop(CPUAlphaState *env)
             exit(EXIT_FAILURE);
             break;
         case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->trap_arg0);
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
@@ -81,20 +70,10 @@ void cpu_loop(CPUAlphaState *env)
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
@@ -135,47 +114,43 @@ void cpu_loop(CPUAlphaState *env)
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


