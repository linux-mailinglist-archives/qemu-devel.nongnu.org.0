Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3D955BEC7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:37:24 +0200 (CEST)
Received: from localhost ([::1]:33816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64qh-00029W-Pt
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JS-0001yX-Ep
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:58:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JQ-0000Vy-Ps
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:58:58 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c4so10024091plc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s5yvC5+jgu+oomjjgt/lH/bjvfcHjmqplnFnsHD+6cE=;
 b=gEYpunoXsdElb/xsiVOf7ZhcIikAKdM//IguWcqio4khuTT9GqJ/NINnGl+1eb0BSP
 KKwJWZg0loTExrH0XUnpZ/QEl7V0MPH4FkPcfNEUBWpLCaVzXTykLkyp+mljoacRTLgm
 TKR02ugJKWVvbi8RwglFrTzjTk+bhqRZZz31gYPiQDL6j8RJG3bx+XY64acR1SoVf77t
 8qesmlazB34WlcYD7ub0hIEiAhwl09Pxcaudl/pJ6A04j3pxNVXusLgDfZXR46hKxbJj
 iimx2Yq7/YnEH8Hl2M1+P2NiG2TpET56doooEtosqxa8GBwc3xYHHXXt3tp/fG2YwDE+
 WLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5yvC5+jgu+oomjjgt/lH/bjvfcHjmqplnFnsHD+6cE=;
 b=Ju5Snip4/pfcr+265IvJu40fcvcLP4Yqxl6MwLePbfpPa2z3xvOSXGp/Lzaqp2kP7q
 4VF4rLF+gz3ISHEnVBNSu3EVAEWLWW8EKhTE40vyZhgRdL6Zao77qIYMtaUZhfUTWerm
 d0jjDzMiEELT0vCbTAR4EK7/REQJZrZ0etsgfJv1FhSaFkK4U17p2NogSK/Blyy2O0k1
 bhzuUsGNPB4l7YbrPR8l/N1cR+Rf0qelVbjMsdecJJdRJLNyll8d974lnaRa5Ovj9yRi
 71z79mnDnr/SWL/7cHXYIt3cE5K+qNmIeBCBO4z1bmECgsp66H9aFzvm3TzFC8XnF3IX
 CWCg==
X-Gm-Message-State: AJIora+Rpnz1fuAc77RRbkLbFY5EE6ihDDre32DL36sS0vsAa7FLig7R
 DoXlLVEN5rYYNaiF6GcKBmDkqXdERR4FLA==
X-Google-Smtp-Source: AGRyM1tO6sv3Pnyb4EdTRMnCoQjE0t9ZxRjnIqKYToCjNeiYRguIzla+VC2gbQ/HzQyvcSLEl9D7DQ==
X-Received: by 2002:a17:902:d488:b0:16a:158e:dd0b with SMTP id
 c8-20020a170902d48800b0016a158edd0bmr1795761plg.162.1656392335259; 
 Mon, 27 Jun 2022 21:58:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:58:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 42/60] semihosting: Pass CPUState to
 qemu_semihosting_console_inc
Date: Tue, 28 Jun 2022 10:23:45 +0530
Message-Id: <20220628045403.508716-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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
index 1b0505987a..40f3730778 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -428,7 +428,7 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(env);
+        ret = qemu_semihosting_console_inc(cs);
         common_semi_set_ret(cs, ret);
         break;
 
diff --git a/semihosting/console.c b/semihosting/console.c
index 4e49202b2a..17ece6bdca 100644
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


