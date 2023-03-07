Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38226AF787
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:26:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekx-0001sp-AP; Tue, 07 Mar 2023 16:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZeko-0001hC-LJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:51 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekl-000839-5o
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso3541wmp.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBIoK6dqvYDK3WhBiFD55F1jdFW37i31B3S62Pz0Wos=;
 b=ybO/vk5r4kJw2vyfeWS1NP00fCFx1XWzMl1DF3Qk8ax4W9G9RVFHI0vi6lwytVJdfg
 xwG56qjVNJpcL6Oy/MzdygNjGqmetrvLYOWyVj6ReYgMVIWuyEgx0e7j9qVVheblGGsc
 KzUxxCcBayVeAbuhT9HAPP1SSqFMuaR8xtG2y/29BDWuFHeJVBcT/m8ejnBCjwcGkWkV
 LahFn4tPC00sZ4ZwNm+G2tt90kXhz/Ww6yN58aiTK9cENlldM3cbVHMgNSCTEKX9s7uv
 nsMrUmiM3rZQU+c2efDBerJjVAHOSDz/IhUzc8Cbk/qGz5qmYRPkqn7TJ+9WrNNYe+7P
 OYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBIoK6dqvYDK3WhBiFD55F1jdFW37i31B3S62Pz0Wos=;
 b=78/3HWY2Mq0IKzBvL0a9XLxoq5yCStlc6xUzv2wbZlt2rx8//LjPJuD+xbfJ4RJkON
 j+JffyPWvNqqgBIKSN434R5u8d8kJtPcJgKQUK07Ghw/e9qpnv+EAyJRC+XLi7qcPFyv
 j4VSE3tMpFOmaBD0QFEKdxMQ12PzrItny+GwL3Z5u7tci7FtcR/wCCLFcFKAi78M779u
 CrwYLKkV8qZKvlf74ullwLMiSxZ0YAVfiu3DeZwOJgUVEUTiI5PpkO+b0AChHBUzb0FF
 17TboAtOxczCMdVb+j/5or/CoKHJcQAeoXVhm8CAmZf8m0wShrhnJvlr7xqnxkLrHDhw
 vxzw==
X-Gm-Message-State: AO0yUKUY/I644Zhh8OGxQAphewtAGcuRL7F/WIUwQ4spnv1qa8AlVXQd
 XANohyDsdumDk9CWYMw6VehlSw==
X-Google-Smtp-Source: AK7set9yHn05arPE8E0/MeNRkK1q3YQ36QM5gzRWaWm8g5AjoJHZLMWgFDi5SIKPyM5M6nYS3PfF5A==
X-Received: by 2002:a05:600c:548a:b0:3eb:5ab3:b6d0 with SMTP id
 iv10-20020a05600c548a00b003eb5ab3b6d0mr14387987wmb.6.1678224105738; 
 Tue, 07 Mar 2023 13:21:45 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a1c4c1a000000b003eb395a8280sm17973401wmf.37.2023.03.07.13.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 094011FFC3;
 Tue,  7 Mar 2023 21:21:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/30] gdbstub: specialise handle_query_attached
Date: Tue,  7 Mar 2023 21:21:23 +0000
Message-Id: <20230307212139.883112-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In both user and softmmu cases we are just replying with a constant.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-15-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-15-richard.henderson@linaro.org>

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 6534e373cb..20caacd744 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -154,7 +154,7 @@ int gdb_continue_partial(char *newstates);
 void gdb_put_buffer(const uint8_t *buf, int len);
 
 /*
- * Command handlers - either softmmu or user only
+ * Command handlers - either specialised or softmmu or user only
  */
 void gdb_init_gdbserver_state(void);
 
@@ -183,6 +183,8 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
 void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 
+void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 0476ee7039..52d1769f57 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -46,12 +46,6 @@
 
 #include "internals.h"
 
-#ifdef CONFIG_USER_ONLY
-#define GDB_ATTACHED "0"
-#else
-#define GDB_ATTACHED "1"
-#endif
-
 #ifndef CONFIG_USER_ONLY
 static int phy_memory_mode;
 #endif
@@ -1673,11 +1667,6 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
                       gdbserver_state.str_buf->len, true);
 }
 
-static void handle_query_attached(GArray *params, void *user_ctx)
-{
-    gdb_put_packet(GDB_ATTACHED);
-}
-
 static void handle_query_qemu_supported(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "sstepbits;sstep");
@@ -1787,12 +1776,12 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #endif
     {
-        .handler = handle_query_attached,
+        .handler = gdb_handle_query_attached,
         .cmd = "Attached:",
         .cmd_startswith = 1
     },
     {
-        .handler = handle_query_attached,
+        .handler = gdb_handle_query_attached,
         .cmd = "Attached",
     },
     {
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 04e75449a2..7c180b779a 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -446,6 +446,11 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
  * Execution state helpers
  */
 
+void gdb_handle_query_attached(GArray *params, void *user_ctx)
+{
+    gdb_put_packet("1");
+}
+
 void gdb_continue(void)
 {
     if (!runstate_needs_reset()) {
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 0c8cd028b1..c0fd83b373 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -345,6 +345,11 @@ void gdbserver_fork(CPUState *cpu)
  * Execution state helpers
  */
 
+void gdb_handle_query_attached(GArray *params, void *user_ctx)
+{
+    gdb_put_packet("0");
+}
+
 void gdb_continue(void)
 {
     gdbserver_user_state.running_state = 1;
-- 
2.39.2


