Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7647B513
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:20:34 +0100 (CET)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ5B-00067c-PE
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:20:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPr2-0000ot-Cq
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:57 -0500
Received: from [2607:f8b0:4864:20::52d] (port=40597
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqz-0005wU-3q
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:56 -0500
Received: by mail-pg1-x52d.google.com with SMTP id l10so10431495pgm.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zc3+Ihp6y4hHFXMKLdPsirKMIyUJ0yRqgI5dfqy9/NI=;
 b=zAvnhJQHvV/h7cy2gml4QM7cAnU9Pp403vqvAdvoCIrcXnxUmU8oQZd7VVDInFM1CX
 +eZs34ICSaZty5iPPQ7iTV+98w+KSQvbRG5MGq5cdOLOTZs0F6WAJsZBG6m9jVcwlleA
 z3rEdsncfCCvnR0BUVk//EghMv9EUbBWl6JiHrfWk+krr4ggkWGTVd4eQRx7r8IziR+G
 byb3jC9q8dRAJWuB9yyVYHWbeqaORdYNfdoicgkEC7yoh8wnRk6BSioOftMrtgJGwfzP
 kdBTVGMvToNah4asFLgzy9nBHh0iiBDGy9GFAEYOCBL3nV1TZF2WB0wICRLoYlHEd0eh
 LmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zc3+Ihp6y4hHFXMKLdPsirKMIyUJ0yRqgI5dfqy9/NI=;
 b=EjwVkT4w259OTEbE5CbpG2rfEf9oCslZMwGYaQS7XJ7se65EPWqzTrHC+4ZtdONyOS
 FxbIyohUM/JfSrupdfJnUhx69k/59e39qz9vwKSIOYfEblCq0F73ph8sxQull491mZdf
 rMGWtK2vajaI0oDkFCfaRIgUh8acHmWbUskajuk7yV3/emWLihXPjudApRkf/BxouQww
 3CexbPyOAV2emYNROOeVRKHqfjVNS6Edfwv3wqa3/XsxOCVo5LgCcj6eV+sDUSAfzc59
 xufipQeCtcHVAndkAadgRwLr9Hjj3o98uwCy9ZsHyyITG0VobqJgZTP96YTszJxlu/UH
 dJUg==
X-Gm-Message-State: AOAM530UmS5K+2AAXlNEwx7ZCzDpseDy5l5/P4Aq9HHybnzYpjRH6Z5l
 zAAYFlMu3JDmpmf0/526IKGnaoqtBttOEA==
X-Google-Smtp-Source: ABdhPJw8KKMC8afgQDzfLuKde9V3RIf/4q8BVsb5mUKLWAh3pmBKRG89fpicQW+9sEXPQYZFTzn9Qg==
X-Received: by 2002:a05:6a00:2151:b0:4a2:5c9a:f0a9 with SMTP id
 o17-20020a056a00215100b004a25c9af0a9mr18652450pfk.39.1640034347347; 
 Mon, 20 Dec 2021 13:05:47 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/24] linux-user/riscv: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:24 -0800
Message-Id: <20211220210529.150423-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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


