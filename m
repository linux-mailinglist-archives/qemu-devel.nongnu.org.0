Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB56A8F89
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcv-0007cJ-FK; Thu, 02 Mar 2023 21:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvct-0007bI-4r
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:31 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcr-0001q5-H0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:30 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so1304391plf.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CWVGvsm0VObLmtXd6+IOdcWIt2VbqCAgLdqZOqtIWuY=;
 b=IYGO5mGIcZ7UaHZbX7HYumvxijAinMeQIwqDcOkL3c0sUA+tSZdLz2l+gC0QSVBgrE
 MWgoihozps1NJ6dgAvPq0LpMl7yuVdiPBWPHOkii4CCiH7kwERVgeS9U3seQ2FJjhNfm
 4eunSQprzqSB+jaaduU0G+7w7i0vkGHgozHiQMMwjQv0AvwUEjHtZW0h8dago+U0bF6S
 RZ3/lD9qTY/kXQ1cCVTyggZCIozem47t1ixLTajqwMVrUhvUHtSNQR8S4QN6YeRTtzHe
 D4yPs2/raZYDzBIF19TyXZlZh+YBN+8TLMPkcKkQs+bNvNjhgC5uhcnHjQ4o8jR7fkg0
 zwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWVGvsm0VObLmtXd6+IOdcWIt2VbqCAgLdqZOqtIWuY=;
 b=5eMT7QT8WnlSFjHCqnYG8qjA5ujt/HK0aaKp+lEJ1CbGIA2Yc+JN2NY2Haau3ZQJjN
 xXks+vlNIHl3mnh4zp5yUxu6yQ4keA/2BX1fD7nOf42aB12nR2j2AFIIxlG0qn3waQ31
 dLODZWS0EWOSjAqvtZLVsm6vY21sgifXQEPrEExaVW2xg3oE9g6nH6HwZ0L5WStD2y/T
 h7Az98aiHoOi9QyZ8nRBNGUMqbqgX2pQ1ETyBhnwmHwK5fQfH3WYcNmooZEAjfwn/O4S
 XpGf/rSOoRqc32iWdZK4qUkzKYwLZTmOsEYB5Dfhg5cPXPS0mk6c+RSAzdkfayDZLZId
 7iTw==
X-Gm-Message-State: AO0yUKVxHJMNF9v7xIfBHC/y0Syh1Fq1xhRcFA63Lpe/vuy8DpLbIxTv
 7ICjWlSNG7gIfhapCpZ73fwDcXDRTOI3cJsBEvY=
X-Google-Smtp-Source: AK7set/AN4PYG0XP2E77dSaT0E6qT/LEjAb080Sq4Srmruap/D3xERkzuGa/kNwHr+gqGzLTEAKbNQ==
X-Received: by 2002:a17:902:d54f:b0:19e:73a9:c21b with SMTP id
 z15-20020a170902d54f00b0019e73a9c21bmr516795plf.45.1677812308751; 
 Thu, 02 Mar 2023 18:58:28 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 26/29] gdbstub: Remove gdb_do_syscallv
Date: Thu,  2 Mar 2023 18:58:02 -0800
Message-Id: <20230303025805.625589-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

This function is unused, except to implement gdb_do_syscall.
Fold the implementations together.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/gdbstub/syscalls.h | 11 -----------
 gdbstub/syscalls.c         | 26 ++++++++++----------------
 2 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/include/gdbstub/syscalls.h b/include/gdbstub/syscalls.h
index 5851a2c706..243eaf8ce4 100644
--- a/include/gdbstub/syscalls.h
+++ b/include/gdbstub/syscalls.h
@@ -91,17 +91,6 @@ typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
  */
 void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
 
-/**
- * gdb_do_syscallv:
- * @cb: function to call when the system call has completed
- * @fmt: gdb syscall format string
- * @va: arguments to interpolate into @fmt
- *
- * As gdb_do_syscall, but taking a va_list rather than a variable
- * argument list.
- */
-void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
-
 /**
  * use_gdb_syscalls() - report if GDB should be used for syscalls
  *
diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index 0a48f58d70..af42e244f9 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -92,24 +92,26 @@ bool gdb_handled_syscall(void)
  *   %lx - 64-bit argument printed in hex.
  *   %s  - string pointer (target_ulong) and length (int) pair.
  */
-void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
+void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
 {
-    char *p;
-    char *p_end;
-    target_ulong addr;
-    uint64_t i64;
+    char *p, *p_end;
+    va_list va;
 
     if (!gdb_attached()) {
         return;
     }
 
     gdbserver_syscall_state.current_syscall_cb = cb;
+    va_start(va, fmt);
 
-    p = &gdbserver_syscall_state.syscall_buf[0];
-    p_end = &gdbserver_syscall_state.syscall_buf[sizeof(gdbserver_syscall_state.syscall_buf)];
+    p = gdbserver_syscall_state.syscall_buf;
+    p_end = p + sizeof(gdbserver_syscall_state.syscall_buf);
     *(p++) = 'F';
     while (*fmt) {
         if (*fmt == '%') {
+            target_ulong addr;
+            uint64_t i64;
+
             fmt++;
             switch (*fmt++) {
             case 'x':
@@ -140,16 +142,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
     *p = 0;
 
-    gdb_syscall_handling(gdbserver_syscall_state.syscall_buf);
-}
-
-void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
-{
-    va_list va;
-
-    va_start(va, fmt);
-    gdb_do_syscallv(cb, fmt, va);
     va_end(va);
+    gdb_syscall_handling(gdbserver_syscall_state.syscall_buf);
 }
 
 /*
-- 
2.34.1


