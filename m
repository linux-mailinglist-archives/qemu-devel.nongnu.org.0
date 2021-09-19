Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3D410915
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 03:59:16 +0200 (CEST)
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRm6t-0006BZ-Ql
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 21:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm57-0003QZ-56
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:25 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm54-00052u-OM
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:24 -0400
Received: by mail-pf1-x431.google.com with SMTP id j6so12892147pfa.4
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qGpOhcDg+ef3HF+AW1Lu1mwmMePA2ZX5mvS/TXPUc4Q=;
 b=kqoHgzX0duOzz7KHyxzN7sFE8ey2OCxJE1Cjbmvxsiu+vtU2SKr9sRuug+T5qwBLFJ
 56qkKcWGLYvAEHqBn3cqsQk0Kpa5JgfxaSnNlVI2usuPZPk5HNQamyNKa9THejwObVCE
 ZYLE+HuuTFOOG+L+2BkrXtZZ5rJei9z2hqAQUr/NbrBmNA31BoPpYO/IsvJNZvzHZlxn
 1UQ7Ue6LMbxaNS5dxO8pG0OY03ZNJJ8BhEguP7QURxffcFR8y+R6brfR73K4nlyxky32
 9pW50G3DwU6NB8KF0QJaUowX0pVzAdyR0KJZQFgDB+Mrzn/M+EfttzZXm3yHg9Q6DCOY
 SVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGpOhcDg+ef3HF+AW1Lu1mwmMePA2ZX5mvS/TXPUc4Q=;
 b=mdVOZM/ZqedGDynYgEOcV07oLuWDdymWXVtfAJnczE3ZvNMqRewS9B/elXHgTdGI8M
 nVCGlH03H/C5tqIMJyii5lxxcH+KNbjJ2A5te/JUDWyGoeWLCYRAs9EED0i5DMEHblrI
 A5e76o0oJE1EfJlwBKjOBBdXDdqppwXxHs10p2C3MWX7i6+zKKiXccxNyNghHPjdQi8E
 IY0VzbLEXbkSektYLqqFiAEQ4U54KNppJv5MV5hKY2J06HJBbbKH3ltnRBNdLmPq5Tmk
 9KcqGMii3+G/sTsMf6lYBKrvoqkmgMhAzOaTk40wLsHwRqk5d3956hkIvD7WF7b69lU2
 4uqg==
X-Gm-Message-State: AOAM530HFB/iTclPsUnHHxXOaMQ+sSoZNZ3oO2MnyMcfH1Dq9E6DwApI
 DbYp2D2dcZ1gc3Vx1lYkUe7U6hy/fu6qjA==
X-Google-Smtp-Source: ABdhPJzd6Y1NDaFHPPBzvjLaJtALmODT2Ro1TYlDHSW9fJ7vjAEbX/O1E043O4kq6P0/gIuJ0k5RbQ==
X-Received: by 2002:a63:d80c:: with SMTP id b12mr17121823pgh.331.1632016641460; 
 Sat, 18 Sep 2021 18:57:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/25] linux-user/aarch64: Use force_sig_fault()
Date: Sat, 18 Sep 2021 18:56:55 -0700
Message-Id: <20210919015718.466207-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Use the new force_sig_fault() function instead of setting up
a target_siginfo_t and calling queue_signal().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210813131809.28655-8-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 5d8675944d..11e34cb100 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "qemu/guest-random.h"
 #include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
@@ -77,9 +78,8 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc;
+    int trapnr, ec, fsc, si_code;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -108,18 +108,10 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = env->exception.vaddress;
-
             /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
             assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
@@ -128,28 +120,24 @@ void cpu_loop(CPUARMState *env)
             fsc = extract32(env->exception.syndrome, 0, 6);
             switch (fsc) {
             case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                info.si_code = TARGET_SEGV_MAPERR;
+                si_code = TARGET_SEGV_MAPERR;
                 break;
             case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                info.si_code = TARGET_SEGV_ACCERR;
+                si_code = TARGET_SEGV_ACCERR;
                 break;
             case 0x11: /* Synchronous Tag Check Fault */
-                info.si_code = TARGET_SEGV_MTESERR;
+                si_code = TARGET_SEGV_MTESERR;
                 break;
             default:
                 g_assert_not_reached();
             }
 
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_SEMIHOST:
             env->xregs[0] = do_common_semihosting(cs);
@@ -169,11 +157,7 @@ void cpu_loop(CPUARMState *env)
         /* Check for MTE asynchronous faults */
         if (unlikely(env->cp15.tfsr_el[0])) {
             env->cp15.tfsr_el[0] = 0;
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = 0;
-            info.si_code = TARGET_SEGV_MTEAERR;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MTEAERR, 0);
         }
 
         process_pending_signals(env);
-- 
2.25.1


