Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414566A8F8F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:01:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcp-0007WB-4Z; Thu, 02 Mar 2023 21:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvck-0007Tj-EM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:22 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvci-0001qG-K0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:22 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so967570pjp.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLmx2eJEzrcuefRjyJcG44ypWKcZev5YnQRPSJMGOkQ=;
 b=EOPJ71RO/fkKGs8g/MCBwM9kCbc4f0MSBSeB76VvG/FL1T2K3brPGOGy7hcuzXe/vR
 f72pPwH6MTef97wJDPBDUXxCQ8t9RFUZDKbfbwTDr+bvzAAqQsKIzmCSUcjSViE0leSz
 4PxO/y8/6cRnkPy+khNhYa6slCol9HHz0R0H31EcKl2zmeyGg1CFk1nLGYocXj5/tw7O
 QSCBx46kpW11tCJOb4leHCf7bXcf7JAyfoUY9buCI4yBj98M+GalTZ754D+a/TMwnNyJ
 viOoq3NKZ7K9dw5ttw6tP2hE8m79FBXPU4n1pedg0/eYVs0RBQBSlTY6qzTYhCapsI6I
 4qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLmx2eJEzrcuefRjyJcG44ypWKcZev5YnQRPSJMGOkQ=;
 b=4FJnqgPJdgj0Bqmc7d63r86c8sh2cvIZhOEFN8OuczTvng5ioAbUxEsj/UZgVj7SEs
 rSJ1vwCuXTTax+CLCb1+iYsUUpzLvVtBXj9KZSWlLhyKyal+ur09jR89kQPRmpMotxVe
 bT76en8g8T/ELQg0uTbWVGG0sKv9MylVSyboVZC7rjo33Qp0XxYBq2t1pWcLNnIuL55a
 /R+NlRmTNp3IUN8ZEe8a5EzfElePfKXDWZKRTs/2QZdnQ9eS7uxWIu/S/m4bLW65PykO
 E7A29MkLkaKVVt+l1GUPgJnxTDgB9DnIZysR2FvRr8apNMkOojf4zNemIyxZdWSPNC2T
 aGBQ==
X-Gm-Message-State: AO0yUKUVwEYhZudTBHd+opQf3m3FFu1M2e9qII8X9aQMzwwUu6TOgk8D
 wn3mup2YzQmg8dETrc0QkO244yaOXillDQ5F8rU=
X-Google-Smtp-Source: AK7set9Nsh8HfbZgRXWsbxx7qj6paQUikICJXJIUF8yMrwEieDwFWr5BKxIWeBWBW+1vI+1fSiX/AQ==
X-Received: by 2002:a17:902:f54b:b0:19c:f16c:5cb4 with SMTP id
 h11-20020a170902f54b00b0019cf16c5cb4mr653004plf.1.1677812299238; 
 Thu, 02 Mar 2023 18:58:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 14/29] gdbstub: specialise handle_query_attached
Date: Thu,  2 Mar 2023 18:57:50 -0800
Message-Id: <20230303025805.625589-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

In both user and softmmu cases we are just replying with a constant.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-15-alex.bennee@linaro.org>
---
 gdbstub/internals.h |  4 +++-
 gdbstub/gdbstub.c   | 15 ++-------------
 gdbstub/softmmu.c   |  5 +++++
 gdbstub/user.c      |  5 +++++
 4 files changed, 15 insertions(+), 14 deletions(-)

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
2.34.1


