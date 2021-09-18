Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4DC41083E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:02:36 +0200 (CEST)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfbf-0005ZT-3P
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLk-0005FC-WA
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:09 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLZ-0006uv-9u
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:08 -0400
Received: by mail-pg1-x52a.google.com with SMTP id k24so13081200pgh.8
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cte6pKzcMfKewPWftjin4gW1GIttpyjIUNnwyFMUyW8=;
 b=sLE8gW4PKxYcJCz+Yog9sjqdfn+aMf+Lm/+Pr8H5UU0EGFQiuxADYeJRldBpJT7fu5
 r6U7GMwh0+h1UJSw0eTu8OFG/3QbTLTuao2AihKh89S4nEShvuZ4zurwIwvR0N8w431x
 jeVPl+UEbzXlDATtzPacWb+4QGGGiU8gBKgvIkEggv7+RRenLPc7df4ucgIGevoZx9Sj
 JjQju7pPCk73l9fPz73VWq4WthmhPX4yeOqvcqOckVqEaRPg+iB2ACbjofnLfEKC4lVR
 mZve0uCYJE1rIiZ25col2FRcBL/RmEHTLjuIZ829mIqbBPItqEbt/99RbkI19EG3126Y
 FHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cte6pKzcMfKewPWftjin4gW1GIttpyjIUNnwyFMUyW8=;
 b=gEPkQDr9GiZMk6HJ79sUqn9BY4WKzjxF9z1w9rKaP1pqr4hX2yRptY6N9rYPkqU0B3
 2R7MMCQ/T5tCe/wzu7K1msAkjtRi8ZPVQ1+qhj3oDYeZ2LJ9DmuVO8Jq8E9qSH19nT2u
 Zwon1U2ZleFxwUrm3ZGMZt+SmW2smdv4nqGYPXF5rdjZmWFZEN8rJiPPThIbXbU7Fonr
 NzDP9ZgSwxA6tLOsjZ1Qj3kqJLTjCav4JutsUwz70rVgaPRHa2SwOU85sc5D4Sfa9dOy
 5SD8x6BXzHdnBlCukcA5v8NfwX2EVghRFl8mPDYFJkI1/soMYf6ZHTq2yiRIzBeAI7e3
 avUg==
X-Gm-Message-State: AOAM530SqcyKm5XrUHcX/3RQyBguukhkiccXeNCxElO7crVkXWSt3xvL
 MmpvUKJ4hza7z/qkZ762sX1JvHnjtn8EEw==
X-Google-Smtp-Source: ABdhPJwWUTdG2bkoKUacU1dCPcVCzYqYWRhPGoj/5uBJ0sUseO6pV8bcEFNXOqh4sBWdxqN3gQBBSQ==
X-Received: by 2002:a62:63c6:0:b0:43f:cbf9:4383 with SMTP id
 x189-20020a6263c6000000b0043fcbf94383mr17208135pfb.14.1631990749548; 
 Sat, 18 Sep 2021 11:45:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/41] target/hexagon: Remove hexagon_cpu_tlb_fill
Date: Sat, 18 Sep 2021 11:45:11 -0700
Message-Id: <20210918184527.408540-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

The fallback code in raise_sigsegv is sufficient for hexagon.
Remove the code from cpu_loop that raises SIGSEGV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hexagon/cpu_loop.c | 24 +-----------------------
 target/hexagon/cpu.c          | 23 -----------------------
 2 files changed, 1 insertion(+), 46 deletions(-)

diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index bc34f5d7c3..244917e27f 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -26,8 +26,7 @@
 void cpu_loop(CPUHexagonState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, signum, sigcode;
-    target_ulong sigaddr;
+    int trapnr;
     target_ulong syscallnum;
     target_ulong ret;
 
@@ -37,10 +36,6 @@ void cpu_loop(CPUHexagonState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        signum = 0;
-        sigcode = 0;
-        sigaddr = 0;
-
         switch (trapnr) {
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
@@ -63,12 +58,6 @@ void cpu_loop(CPUHexagonState *env)
                 env->gpr[0] = ret;
             }
             break;
-        case HEX_EXCP_FETCH_NO_UPAGE:
-        case HEX_EXCP_PRIV_NO_UREAD:
-        case HEX_EXCP_PRIV_NO_UWRITE:
-            signum = TARGET_SIGSEGV;
-            sigcode = TARGET_SEGV_MAPERR;
-            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
@@ -77,17 +66,6 @@ void cpu_loop(CPUHexagonState *env)
                      trapnr);
             exit(EXIT_FAILURE);
         }
-
-        if (signum) {
-            target_siginfo_t info = {
-                .si_signo = signum,
-                .si_errno = 0,
-                .si_code = sigcode,
-                ._sifields._sigfault._addr = sigaddr
-            };
-            queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
-        }
-
         process_pending_signals(env);
     }
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index aa01974807..96cd7db170 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -240,34 +240,11 @@ static void hexagon_cpu_init(Object *obj)
     qdev_property_add_static(DEVICE(obj), &hexagon_lldb_stack_adjust_property);
 }
 
-static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
-                             MMUAccessType access_type, int mmu_idx,
-                             bool probe, uintptr_t retaddr)
-{
-#ifdef CONFIG_USER_ONLY
-    switch (access_type) {
-    case MMU_INST_FETCH:
-        cs->exception_index = HEX_EXCP_FETCH_NO_UPAGE;
-        break;
-    case MMU_DATA_LOAD:
-        cs->exception_index = HEX_EXCP_PRIV_NO_UREAD;
-        break;
-    case MMU_DATA_STORE:
-        cs->exception_index = HEX_EXCP_PRIV_NO_UWRITE;
-        break;
-    }
-    cpu_loop_exit_restore(cs, retaddr);
-#else
-#error System mode not implemented for Hexagon
-#endif
-}
-
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
-    .tlb_fill = hexagon_tlb_fill,
 };
 
 static void hexagon_cpu_class_init(ObjectClass *c, void *data)
-- 
2.25.1


