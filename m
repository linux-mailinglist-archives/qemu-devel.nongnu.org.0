Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D23552F6FD
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:50:16 +0200 (CEST)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDJv-0004Nx-5l
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc7-0008CP-CN
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbw-00042v-94
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ds11so9333068pjb.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NkYDWZD4Kl/AmjNy/kSwweyafB44BYvhT/zKiCaM700=;
 b=NF36B6opwH1/yH8in3Gz8o1zhOVYxCJDM6o8+tMoKDSIkXYZeK1DwhY/sAbWXc24Lz
 FfWx01tddEH3skAkoQjPj2yRdhsPgQIwPQqUuXqez0HJzmKaXBliD2wXMivvn9txdK0l
 FYpTko7kMg3biIOcQu7bjCiteZTknxCOAFeXrTZYFuOcPk4zEOuJ0M4m6+rR/NM9gqbq
 PBg1kiK1QNDTvwX2Uu671NkAAYPclu9NoZe4K7Y7s4xYchfTRzaZ/TI1IHHeQ4O4agmp
 fuXC6Gij20DOCGMEmbnXpswdZoshLkFlYXBhJ5iIMDuDropAoq2Q74BOX1k68ZPJoike
 /s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NkYDWZD4Kl/AmjNy/kSwweyafB44BYvhT/zKiCaM700=;
 b=mSvdjeFzEbNUsaTZMngyemI7EuxbO0wqPrUqxYqDykhf1BRxZk2WVXY1NrQxIHDBr+
 znpbNVXGdkNvOzyQgZpOcJVH9noYeZGYrw/ab7gvbnD4zWjv1QR/hmREtpcDwD7RDyoe
 jH/p22M7m/2s2pBkmyR/mt5Z40NvJE5h8tVDipKqoeLSvt4WBo/NVs3wQzUxvGr40Vx3
 inuHmHlrKv4tj0JTn/0Zw0R4oZDFziCHMJ6RRmFbQH1Rq5hr4WUHu25J0mOLXCw+I44g
 sUefkq4rCUmwFt1I5HsJb7odKF9A9pzw04sdzFGjAWMWAsgfdlJJ98CtkDhmfp63hmJV
 FmjA==
X-Gm-Message-State: AOAM530xIdZRykE+rxGO6M/LbpaabA9R9wtDd0x1WN/smZgaB4risBmb
 boSgukysCcIncUc2TPKP5tEMdheZVkBbcQ==
X-Google-Smtp-Source: ABdhPJzwAl96d+3W1/6D9EC4/usCKYov7Z5RPC/9Le5sJmWCJox09TLDJn8X48JgH8Xtpi3+V0vQ5A==
X-Received: by 2002:a17:90b:4a07:b0:1df:7c10:7d3e with SMTP id
 kk7-20020a17090b4a0700b001df7c107d3emr14371970pjb.109.1653091484088; 
 Fri, 20 May 2022 17:04:44 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 38/49] semihosting: Pass CPUState to
 qemu_semihosting_console_inc
Date: Fri, 20 May 2022 17:03:49 -0700
Message-Id: <20220521000400.454525-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
index 3eb9d1c049..5d10a2b932 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -415,7 +415,7 @@ void do_common_semihosting(CPUState *cs)
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


