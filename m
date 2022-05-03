Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A077518EDA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:32:41 +0200 (CEST)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzCK-0005No-Cy
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWW-0002Hv-Lx
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:29 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWR-0003cv-Pr
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:26 -0400
Received: by mail-pf1-x430.google.com with SMTP id z16so15569197pfh.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OGBm2n7ExoD8rG+nhfGrAKA5WPrKK898UQl1Rl1Fe4M=;
 b=Tktp30/3EPU1bBRlphcmNpsHS2rlR5+3jISDjJPTQfkl+fur6/LyBqjh9OHnjVxjD0
 AIA8c90DIiyHHdBHmalwAWKxyLkshZwk0TMj+DrzYeBm+wd7MAN9UamD+WqKhJqHLA5e
 sZHZhMPipcd5DywtiI1yl/GY7t/KUxHBa/AENlqLm1e/miqR3d8UdrL75q6NV7xYYV5D
 WVTm/mxIc9Wt5dufXerSoX3677m/pJGY410Lb7FRBVh4irUwgW6jbSuNZhx7UT7K5T/w
 8f8Af6d03euJdnBFq3x4eRaOkdTER8qXuEt6GGAXFfL8gBcT/Pkz2vB0sv68o5sJx2Fd
 J2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OGBm2n7ExoD8rG+nhfGrAKA5WPrKK898UQl1Rl1Fe4M=;
 b=2ZxmGDv/YF+4fCNjogh1D0ozcUV3/CoCA9UV9fSRxzsQKawlAH22nzaB8tnCdvOEkP
 lb/Z2Tu35A0tR8TX3VVRhZNtgXlUKlTNGJKiMPil/35yGKMfgucNLohhPKxh3M1kuyQe
 ejQj23ufTQ9o7Rilffr0olhWuhXOmZTmpQ2Eyudyhln6wC9D9WiiMx7tbRgYGuiglmj5
 v5XJ07CKDdBCeJk7+lIQDvk3URA6d8siAeZKpOOMPz23PvKXEY+C3GoiJgZx7OhLUACk
 ZnZx6cy7JmRR+60wTUu7IWi5KQbkyHddN1Je6Kks+Pkp/w/SW9/PNSYJjgsTsBnDntMu
 F29A==
X-Gm-Message-State: AOAM5315ICsgPwqk19SLdtKn0c5yHZVGnGqe4dtuyf1YfelL+1hgh7ii
 4CyE2vmeOkbtvzstnVlQdtsHTfqyA8IgWw==
X-Google-Smtp-Source: ABdhPJxQ2Ie9kPUmamUZZFhPWxaoRLh2IShejA0Yv/t3UQFuEEoJeONAbnBxfDVBqoqDRsjEGBhryg==
X-Received: by 2002:a65:6149:0:b0:3a9:7e8f:6429 with SMTP id
 o9-20020a656149000000b003a97e8f6429mr14962164pgv.613.1651607361274; 
 Tue, 03 May 2022 12:49:21 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/74] semihosting: Pass CPUState to
 qemu_semihosting_console_inc
Date: Tue,  3 May 2022 12:48:05 -0700
Message-Id: <20220503194843.1379101-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h |  4 ++--
 linux-user/semihost.c         |  2 +-
 semihosting/arm-compat-semi.c |  2 +-
 semihosting/console.c         | 12 ++++++------
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 4f6217bf10..afc961057c 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -39,7 +39,7 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
 /**
  * qemu_semihosting_console_inc:
- * @env: CPUArchState
+ * @: CPUState
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
index 3ca8b6455c..c4cf33fe0e 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -418,7 +418,7 @@ void do_common_semihosting(CPUState *cs)
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


