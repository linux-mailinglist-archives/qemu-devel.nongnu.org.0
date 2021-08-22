Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7B03F3D64
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:02:44 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHeh1-00053j-VT
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaJ-0007mY-4N
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:47 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaH-0000cu-I3
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id 17so13325252pgp.4
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qGpOhcDg+ef3HF+AW1Lu1mwmMePA2ZX5mvS/TXPUc4Q=;
 b=xchPxoDAQ04Eb5iiEHoc4Bee7DGqSwqeKuibN8T6S2vugK8iMJU67nCOn0UYusc5sj
 T7NQypJaVKqFIX2/C5oIOazxz8bI3W5R78YA+iWuber2asmW5No0pltsx6lglJi0724E
 Klq417kaIKeITb1VGbIgys5Y/nsZVU3+G/f2Fkm4vCzKnxDkTlwZ/Tcos/GNefA95ODo
 gGANtF3FgxCrqj0WqyfxuVdAnBkdWOzBUpSv9YA9LfHQqSEUELfQtb+FLN1lHQ9zCy90
 m1dYI0qGtkrTJp/bQ7cV6qprMlI3xlF6Y25gXUJdaQqiYdm8PNOcXby32bHrU127LEIz
 rhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGpOhcDg+ef3HF+AW1Lu1mwmMePA2ZX5mvS/TXPUc4Q=;
 b=kOQHMHcOIXEFTgKsRr9oL+oyOGgkAh28bqLiDi6FxgEMucfvf4acBcE8AsOxjZ9UjS
 UzqfNC1JKuTO/YB0TvyTkRavDoG6K0kzKR3DutnLhs3bZMLgCXzRad2H/kOHrcI7Jm0G
 6n3AtZsYj8cPwoydzBBxR2LYhwNt2N48N8GTTM7y13qHqNzTcSgMT7nkh3BQKrxBnzlR
 +I0EKgFNYvlTYORzyBEWlN5b0v6+vaC+QP2zqTdHZ5R1IUv0qf+UTSuVGvVRG6qDOq/d
 aMmt9UTn8ZppmcaSZHwOtdmst+GqgS68ibJ2/KLHGSrR1oPq57cb9yFACKpsgnYlvYOl
 JytQ==
X-Gm-Message-State: AOAM533iDqy2LcYHu91l9wmsouwmCk9SeJH8s/NTpUqkquDrFyoDTr5y
 Q/ySTdESWNoUObmQEc8xNuLJD/shXnOAaQ==
X-Google-Smtp-Source: ABdhPJzehx3DTdCosori/GTKqDIIqzMEJklZ5Oqbu7Ltv/5hRACjBqv3K+A+m5BTZKibTWGXarCz8Q==
X-Received: by 2002:a05:6a00:a8a:b029:356:be61:7f18 with SMTP id
 b10-20020a056a000a8ab0290356be617f18mr27434020pfl.29.1629604544241; 
 Sat, 21 Aug 2021 20:55:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/30] linux-user/aarch64: Use force_sig_fault()
Date: Sat, 21 Aug 2021 20:55:15 -0700
Message-Id: <20210822035537.283193-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


