Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539FB41093B
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:16:42 +0200 (CEST)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmNl-00017S-Cv
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5O-00045Q-3E
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:43 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5K-0005Ft-N7
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:41 -0400
Received: by mail-pl1-x62d.google.com with SMTP id bg1so8717582plb.13
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T1XRhqsnyLvkQPB9MYeH1KY/Vip5aHodZw4fWmIOwYc=;
 b=Js7NMZX5iiEe3EcOS3n565oKM0PQ+UaNNSbIA1Vxu2bIZXOCP5Ew/05tuMQnjsP22B
 /2ei7kpTHV6rB799hGyTWi+nF7rw0gyji1htuuItECV3CmaTN6V53IZvePoUDv5Ts4uD
 fbd2lePDleW5vBGLpQie+E71vPAY0YfzJFITL1v33D1vkQpWo9R85laj4YoxLWyOGFy0
 Kl9SvofuDL7qgYHFo6DtZSE8U1XHHO5J2jDhOSn9sOfxHtARAhIQZEGPp9VcBju1dwAT
 GSFpDuZGvvApwepBoVodElyp6zG9eZ4grXJ0hXF8CeezvC8JcLQ88tt2LbwzzdFRPBl+
 xJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T1XRhqsnyLvkQPB9MYeH1KY/Vip5aHodZw4fWmIOwYc=;
 b=dNye2kbP02MP2Hr1lMhTY5pxuTmGeaUJS6iMhXUGsMp8UwJBD7w56KsZAMFk8NsgjO
 XWje/eeSSmuTU3nZYlay6VvpHO8cCl30k8dAVJO7fD/vO3foABwH4JnYj9v7RKbZCxgG
 8+ICLUFkIdXATvcTCulePQx5LRkhUfpYqbTKA0mXvXgWWVdPW8qpasvW6EHd1HtKaDS9
 cuJtya+a1ugefApDvLoAqd/0fqlTXA6B3SutMhEdih4upKO93l9MhPhC26Srgg1HvQsr
 gm8JmF+kCJlqgANPV2V0FiBXTMSRlyuPRgUEc9fThTUbXhdMtkuUa4SlnCgPh0tWNNv2
 TG6w==
X-Gm-Message-State: AOAM531/I8VhUHnuqwIoowUouahQFc4/aZZXVKJh7HDBvqsaB7x7qxBX
 qit2omrklXKI5R27UVTUb5xzJUtnkykqYw==
X-Google-Smtp-Source: ABdhPJyYqZsgRXOPHJErgfZ80dw7onyeeYpVAcHkilxb0p1UyO/TZH0Bv89r8SqiFDHBC+uOElAR6A==
X-Received: by 2002:a17:90a:7185:: with SMTP id
 i5mr21235178pjk.236.1632016657379; 
 Sat, 18 Sep 2021 18:57:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/25] linux-user/riscv: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:14 -0700
Message-Id: <20210919015718.466207-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 linux-user/riscv/cpu_loop.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 49fa2209a7..9912796ebf 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -22,14 +22,14 @@
 #include "qemu/error-report.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "elf.h"
 #include "semihosting/common-semi.h"
 
 void cpu_loop(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, signum, sigcode;
-    target_ulong sigaddr;
+    int trapnr;
     target_ulong ret;
 
     for (;;) {
@@ -38,10 +38,6 @@ void cpu_loop(CPURISCVState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        signum = 0;
-        sigcode = 0;
-        sigaddr = 0;
-
         switch (trapnr) {
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
@@ -77,39 +73,23 @@ void cpu_loop(CPURISCVState *env)
             }
             break;
         case RISCV_EXCP_ILLEGAL_INST:
-            signum = TARGET_SIGILL;
-            sigcode = TARGET_ILL_ILLOPC;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case RISCV_EXCP_BREAKPOINT:
-            signum = TARGET_SIGTRAP;
-            sigcode = TARGET_TRAP_BRKPT;
-            sigaddr = env->pc;
+        case EXCP_DEBUG:
+        gdbstep:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
             break;
-        case EXCP_DEBUG:
-        gdbstep:
-            signum = TARGET_SIGTRAP;
-            sigcode = TARGET_TRAP_BRKPT;
-            break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
                      trapnr);
             exit(EXIT_FAILURE);
         }
 
-        if (signum) {
-            target_siginfo_t info = {
-                .si_signo = signum,
-                .si_errno = 0,
-                .si_code = sigcode,
-                ._sifields._sigfault._addr = sigaddr
-            };
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-        }
-
         process_pending_signals(env);
     }
 }
-- 
2.25.1


