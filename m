Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C064141092F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:12:11 +0200 (CEST)
Received: from localhost ([::1]:42030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmJO-0003ey-SN
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5I-0003xQ-86
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5G-0005Cf-K6
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so10169716pji.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBhs/Q7ExZmqkuTooPQxpUl415pPIM7JuuK+7DyUZc8=;
 b=isX8uJ8B8R+0QpLtLK0bfWBOMLWLaIgsR3z7z04nzxr0Mrsw0B7ZZFzotXI7nhenbQ
 WGEg9llajuGpUZd2pamdDSJC7Jm4977xqXMRlh6+eYmUhQ2XkzQDkHl8v+oPE8iFZxf5
 W9Y21+Xcs/CZJcS0tY7boCMhgsIlIoNABETGTQmV5wYMOw8FOz8dYkZquV0/4ShMvkpT
 efCtNpzWfsrbZyai+oHNhWICTXljJZwozo1st1GLDNIDcKNfG+p3CEO+7DtIfJ1Xz+RE
 +iqZXoJ7vD7WTF3eQpzRin/pVzOYMmN8P7xbmwWGQE8aKJsmQ9wQLUGvZs1qTc6c55cR
 5s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBhs/Q7ExZmqkuTooPQxpUl415pPIM7JuuK+7DyUZc8=;
 b=1W8JBRud3w8uEH9QA1uBSIEM7FadYFt1i1ufeuL1LfZrNCXyWJaPFGEejal6MQ1yzF
 A9nFSJxhGe0NwdRex6kR2t6GLlkVl/MWPT2fF7QcqVFFWzwPJp7CYJm1CU/kecGJ52th
 UIZ+V7HQWPrbth3muJDKwnV1t0YtQoFHuJBQ52ptw+arR67HHA1uMdqXA7OqLiCYWubL
 hP0LYGl7iGIoWrI9TlbyS9rk9cBfkQuy3aiduFBGNeEHzkLj2VaRznWQqYCzoS8MrCdT
 MzbPY79hPeLFXbvw30VJTFwONEIUEGwSr0SKmRbbFWuKrmGyT8dS2kvyLd95poyG2AHj
 OVxg==
X-Gm-Message-State: AOAM530Q6ss+Z9OkH23vGxk89iEUWjOL9RQfKC1+H1RE7oYAMRE/wqQv
 kmSbSun8jflnBJBMP2byuOLTASaOkeBPrQ==
X-Google-Smtp-Source: ABdhPJyCJ/w3ddxKeS4CcoVuMZQ9lqDdxoAjwhHYQ5OPgKXzQ4Tg4lml1jaB+MLRFOnEx6TyeFmgDA==
X-Received: by 2002:a17:902:ab16:b0:13b:9892:4df2 with SMTP id
 ik22-20020a170902ab1600b0013b98924df2mr16599982plb.67.1632016653314; 
 Sat, 18 Sep 2021 18:57:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/25] linux-user/mips: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:09 -0700
Message-Id: <20210919015718.466207-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index a330dc03db..e9d9208e83 100644
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
@@ -155,43 +154,32 @@ done_syscall:
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


