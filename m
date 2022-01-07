Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B36A487EB6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:59:18 +0100 (CET)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xGX-00045e-8j
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr7-0005H4-KF
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:02 -0500
Received: from [2607:f8b0:4864:20::102a] (port=40748
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr4-0007r0-QT
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:00 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso5905616pjo.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJB67htN9cbgKBCPEjsPU66VMJ8WI8q4gXhnM+e3yvM=;
 b=fRwcVV4sq1ZJ6dBkJqmoKb7VH1al7xZ20N3SHQtLbAvFG63t0cpIS/SVKVjB4phcXY
 nUUT9MTpqOUbgymv8WjsI8uCEHB2g+eFBve7cn6dmJMWwpwzzaG7mi/kZXFslnUEAwRR
 XjR9d42TG+AKWH1I5GYrRcqdfJ5/RGjmFklUAiUNJ101Esevp529uINdvJRqdOAXy+50
 BNV8yKySoo7gtdaZS+5pkpYXfegLSZ8EcZML6EP0sCaEA3NSSMaDUqfz5cSQb7cfTYjZ
 Xi1ilO2GPMiX/EsBGxx/N2IH+eD1Xjzsy5TuUo4/y781WKRJRxwI9M0VihP3wP/YDQjL
 wjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJB67htN9cbgKBCPEjsPU66VMJ8WI8q4gXhnM+e3yvM=;
 b=SQk6Uj4upMpAl2MYHOpKX5Q9yr76AyFUI2+pOOcVDdsjBOHrnTwpiUjCRkMXlJcowl
 wgu3/Zeeep4jAgFuwDVFWNHMPflfRbEiHywlPOiPbGo6oPTo5a31yoMTgL0cDRDeyTfS
 7odghYoqGGl569lBjzzJTzJMXu7eEXMX50co8FqRHDrKY1DosMv7skdH3ZJeExwzYO7G
 3lNC1UJbeJfvbtQQitM7aDyz03gxD+hlruuL8pYzGI++lDnBTzpYrQpbbHbVs9TlFM8q
 qjEYFmdQkSiMrS1XZ4+N9CgV6oG/75baDGYCqBT5jmisuUzp6b71EwAjSCIjjcxIwEbq
 eljA==
X-Gm-Message-State: AOAM532QcdGupuG+AH306xe87VrI91Tb7fNB5bfYqI6gYPVfqX34cIsq
 kjNMYFBToi68aQIJAJdq6j8WhosSY1N4rA==
X-Google-Smtp-Source: ABdhPJwJscWPigymoABbJ/crLHhCPLpBY9TbhXJoRgr1FoYPJp/e/DXKwKKBeiasp9jxV2bBeYwoxQ==
X-Received: by 2002:a17:90b:388d:: with SMTP id
 mu13mr6465604pjb.193.1641591176736; 
 Fri, 07 Jan 2022 13:32:56 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/24] linux-user/riscv: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:39 -0800
Message-Id: <20220107213243.212806-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index 0cd8985cb8..26d446f323 100644
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


