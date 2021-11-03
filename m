Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6872A4443A4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:32:58 +0100 (CET)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHJx-0000ZC-Jl
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwr-0002ck-3Y
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:05 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:42540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwo-0005B7-DZ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:04 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bm28so2356857qkb.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zc3+Ihp6y4hHFXMKLdPsirKMIyUJ0yRqgI5dfqy9/NI=;
 b=mzwo7YNn3gkJbpoQ+rAYrt+gfyXGMQzfTw9+y9zCgrW+9g6hht6Z6Js5ZIEI8QZTQZ
 mjeBysO+Xa+wTk1zermTIz7axCbyHyFB4mI6yrY4gl+MrZQ1Z/CpedAnmIYoPQJNxahH
 x7RIfzcuXIRl6vaOLpvdODvqZ8WcO5Izh5pO7GP2fmM/TtN8NJWgERsQo3s+UR5xV7lE
 rShpNzmqENSIuDVOykKbPzyCY/126e7YYJzrYSpqG/VGp/jeQFEoErCOHkOInbDryvUS
 0OghU+YEbH7AVoaIjsSw1gcicXCkjmUZLbZ+3UGUelFeWbtrw1W5rMvtAlde8ab+cSkw
 7rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zc3+Ihp6y4hHFXMKLdPsirKMIyUJ0yRqgI5dfqy9/NI=;
 b=XDarFyQPMxlH7bapb3LHwXlRBAi8aiQKdhJsrLBBtXMadUjAIIQabOd31UhBl8S66O
 FwGeYmMRB2Zh4aDr3nquPV0OsbUQ15Xf6xV8J6OWYiavdo8fledx5o9qn/wdWZ5AVkZs
 7ebiwFjQ6ohKY8fT8wFA073mlyGI+85dpJXtc2LxDWECHYmF5QR1qPNI1dms07l5DDdZ
 /S4oM9lYr1S5nbhvzRRSNdW27znZlO2jHGFcX85iW6CXC1uEYd/xRjCN6R8OFS+syps5
 UW0v5CbDThQa5Iy8TXXGjZxCLFSDJlFhvNm7RN+Pyp/FVqm9yu2MDPQMwi8m+nyALnKw
 7iWQ==
X-Gm-Message-State: AOAM531+m2CfhjO+c+VY7/gN7cxbTkjmuJrvAtQfuAJjDQZh7hvxKGIb
 vha7zBx5IEF9MgAU/Vlb2l+bR57pQA19cA==
X-Google-Smtp-Source: ABdhPJwTE8Us5b6EL53WZWAHI+tF9nmMQQ3OC/q8Jia/MNLz2o2oC458fhILSwGLNY60P5K6NoHTBg==
X-Received: by 2002:a05:620a:424b:: with SMTP id
 w11mr34440688qko.179.1635948541588; 
 Wed, 03 Nov 2021 07:09:01 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:09:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/23] linux-user/riscv: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:43 -0400
Message-Id: <20211103140847.454070-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Fix missing PC from EXCP_DEBUG by
merging the case with EXCP_BREAKPOINT.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index b301dac802..92a5a113f6 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -30,8 +30,7 @@
 void cpu_loop(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, signum, sigcode;
-    target_ulong sigaddr;
+    int trapnr;
     target_ulong ret;
 
     for (;;) {
@@ -40,10 +39,6 @@ void cpu_loop(CPURISCVState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        signum = 0;
-        sigcode = 0;
-        sigaddr = 0;
-
         switch (trapnr) {
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
@@ -79,39 +74,23 @@ void cpu_loop(CPURISCVState *env)
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


