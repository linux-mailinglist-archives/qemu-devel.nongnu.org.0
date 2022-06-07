Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EDC541F3B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:53:13 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi4W-00056S-A7
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg92-0005eg-J3
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:46 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg8x-0001om-IR
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:43 -0400
Received: by mail-pg1-x532.google.com with SMTP id 123so6623232pgb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcKcbuHpae2wG44hmgdN3EhtSwRafPOrATlYMDNb6tY=;
 b=yA3NsPggRY6PlKoxCtskat9jAtjNtJFt2H/gxHCx2O8dD2Ghl894VQoI+OmNoO/PH4
 JQKJp+XqdFzDHGbx7qefXcPC4VhMcNumesNVnI5d4/KucFbH/V++9RWYTIoGDlBkxk+G
 fQIud1qgpbJQXW5DytUg92g+yRka/RS8eWZT3fSZJmyegKxNwXvueXKmhsatn73W+nt5
 ikxlSK+SanwQ7haE8I+DZmtQwUpI9FwmqIJMAnZo3acAexrYBCIYtBuQ7aZfmkAJxFNc
 RtuyNoWiYBF5wiXrYJs1Gjd60BpWQ8BL6GYxpuK8keZKNkoSWi9iuVdqxLHoJjw8UhF5
 5kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcKcbuHpae2wG44hmgdN3EhtSwRafPOrATlYMDNb6tY=;
 b=ubRFjLs1Ie6CCTW2M+o+Gq4FcEZsQteH+mdSU/hEr+SoayxnIwVoFqGJW9O2RnVSwH
 nWZOB1lB9tMJSVmBXkv83BxltBBUZUQgoqe3ocQNzE+N9j5gZmzXgsCDU+2s25CLIkgN
 7pQ/BSoJLvjS3MZtChhn/H0TVUcfYv9UYZMr1VofEyKHnCHTSp4w0IyIFhJa4QMxptDd
 9lJSJsQIgeHHvhaOREtfa1rXMDHEHOUdtQaTMcKhSnqDjuJTlfktwvm+HBlviR3Nykky
 H+b1Gie1zkTJt+wUMB/bD8zNPR3PeB638d3dXwQ5yTFiowo2kfYbUF6waXHe6coUSJps
 Ie7g==
X-Gm-Message-State: AOAM5333ySMHoVWGinJhM+OZRvwoM8kBRJw1ewwGgFlua0/KhhXfm3QC
 k6qXdSfn0bHjt4T8IKWH/2pZU0fbV6mrQA==
X-Google-Smtp-Source: ABdhPJznXf3fzEkEn8Bi1NJH4zvumqdtcaMrpgErDk7JodIG4NmBIP8nfzjs32v9xIp0EBvo+fMQ0w==
X-Received: by 2002:a63:b1e:0:b0:3fd:43d9:5354 with SMTP id
 30-20020a630b1e000000b003fd43d95354mr18769073pgl.294.1654634977428; 
 Tue, 07 Jun 2022 13:49:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 42/53] semihosting: Pass CPUState to
 qemu_semihosting_console_inc
Date: Tue,  7 Jun 2022 13:45:46 -0700
Message-Id: <20220607204557.658541-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need CPUArchState, and we do want the CPUState of the
thread performing the operation -- use this instead of current_cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h |  4 ++--
 linux-user/semihost.c         |  2 +-
 semihosting/arm-compat-semi.c |  2 +-
 semihosting/console.c         | 12 ++++++------
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 4f6217bf10..27f8e9ae2e 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -39,7 +39,7 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
 /**
  * qemu_semihosting_console_inc:
- * @env: CPUArchState
+ * @cs: CPUState
  *
  * Receive single character from debug console.  As this call may block
  * if no data is available we suspend the CPU and will re-execute the
@@ -50,7 +50,7 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
  *
  * Returns: character read OR cpu_loop_exit!
  */
-target_ulong qemu_semihosting_console_inc(CPUArchState *env);
+target_ulong qemu_semihosting_console_inc(CPUState *cs);
 
 /**
  * qemu_semihosting_log_out:
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index 17f074ac56..f14c6ae21d 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -56,7 +56,7 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
  * program is expecting more normal behaviour. This is slow but
  * nothing using semihosting console reading is expecting to be fast.
  */
-target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+target_ulong qemu_semihosting_console_inc(CPUState *cs)
 {
     uint8_t c;
     struct termios old_tio, new_tio;
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index f992b60b6b..e7de52d042 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -427,7 +427,7 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(env);
+        ret = qemu_semihosting_console_inc(cs);
         common_semi_set_ret(cs, ret);
         break;
 
diff --git a/semihosting/console.c b/semihosting/console.c
index 3dd0ac60e2..7b896fe43b 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -144,17 +144,17 @@ static void console_read(void *opaque, const uint8_t *buf, int size)
     c->sleeping_cpus = NULL;
 }
 
-target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+target_ulong qemu_semihosting_console_inc(CPUState *cs)
 {
     uint8_t ch;
     SemihostingConsole *c = &console;
+
     g_assert(qemu_mutex_iothread_locked());
-    g_assert(current_cpu);
     if (fifo8_is_empty(&c->fifo)) {
-        c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, current_cpu);
-        current_cpu->halted = 1;
-        current_cpu->exception_index = EXCP_HALTED;
-        cpu_loop_exit(current_cpu);
+        c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, cs);
+        cs->halted = 1;
+        cs->exception_index = EXCP_HALTED;
+        cpu_loop_exit(cs);
         /* never returns */
     }
     ch = fifo8_pop(&c->fifo);
-- 
2.34.1


