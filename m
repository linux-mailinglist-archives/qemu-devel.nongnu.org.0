Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5963F3D87
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:16:14 +0200 (CEST)
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHeu5-0001w4-54
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaU-0007u8-Mh
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaT-0000mh-5M
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so9900784pjb.2
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HGVPe/pQ5/XkIwVDPflmpNkSXdRjb5w/EgQJjUaxxk=;
 b=fJXbaeGV3G6HRxu/+VHOLCNOhZK3QnUCDHFLA32KyCWYUinJGq7nbU2KzeNm7SzBA8
 Nzc4zXsa8zzOuHMEag9n446bN3Xd1oiHx02MTepUzYD7oo1ph7SCdul41/+e+G1JgOPO
 0XQ1tpNX09IaC+8n+p6ppZbsQQf1szDLop5bkQnsnFmz5A2cwVvUGtvVm8Z7dy+jF6Qq
 okPLQ98Uk99p/29dYc1niNVrj/gwzXVoJwDBv8fKQ+/JjseRfJRDmgDxgMDIN61h1zP5
 0Abcnt71dRCtygCH0IQ0vWXQzY6tnyGDhj1T+CWqxdKoMbouCWIhXLxZqop6pM7odWxJ
 MkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HGVPe/pQ5/XkIwVDPflmpNkSXdRjb5w/EgQJjUaxxk=;
 b=l92Tnlut0CeeDQvMoi91fbR2kHz8SRNHj6IcNJIrP7HHeitEdHU0GnXe27Y4wh0grK
 f3HLdiAU6Lsz074W3NqfKymD/Nc5Rbp4fO8yCk68PE4oxf+U6wFsF3Hg0VKX4d/fXUe1
 4Zs1Yr+VvrfLljz0BMUR+Vmxo9hNhQzSx3GpQBgHM6Vv3irqHxeZnoV+Dqj6VtKXtoXC
 kt25YhTU9t9O1jifmadCtM1NfgNMQIueXP2sYauoHkUFKg0I2eQk1rq3ndwlp/4Q0jZg
 S0jP866oT61n2p1vW6fXP3t7/FW0sMiKhzQQgW6TrO2GuF/mogwKrNzM17RQSwR/TzKA
 DULQ==
X-Gm-Message-State: AOAM5316TddY7a2G9zsT9UaURyUuJ+zONWU1oSRY2f0/tCgdSTzq1A14
 BQFYcjboRUBZ09/c8Vw/vcI+ojZvIo07ug==
X-Google-Smtp-Source: ABdhPJzdkN9EiBmGE2C7leZFebYfzHv424tcvbh1TNThHsc4az2Ue/Cy3OgqBOcDapajMqpBSfbGZw==
X-Received: by 2002:a17:902:b093:b029:12c:843:b55a with SMTP id
 p19-20020a170902b093b029012c0843b55amr23065852plr.83.1629604555642; 
 Sat, 21 Aug 2021 20:55:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/30] linux-user/riscv: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:33 -0700
Message-Id: <20210822035537.283193-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Use the new functions instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 36 +++++++-----------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9..32c440365c 100644
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
@@ -77,46 +73,28 @@ void cpu_loop(CPURISCVState *env)
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
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            signum = TARGET_SIGSEGV;
-            sigcode = TARGET_SEGV_MAPERR;
-            sigaddr = env->badaddr;
+            force_sigsegv_for_addr(env->badaddr);
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


