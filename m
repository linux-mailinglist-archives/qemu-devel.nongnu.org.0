Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A057C6AF79C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:30:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesC-0004i5-5u; Tue, 07 Mar 2023 16:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes9-0004gV-Lm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:25 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes6-0000v7-LV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:25 -0500
Received: by mail-wr1-x434.google.com with SMTP id l25so13544872wrb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UJFR9YSQYJuT5oOotPCg6xiwzMZMMvlKZkAiVaMoUI=;
 b=GumiT++mtfmGD6OGjDXH5QhxOjZS83IeSqkHu+ZIa0g7HVkdzab22NUPY86fy4BL8k
 6qamsdnow2kwHNp7OOaZaFK9SIpaJ+YGSXVsChxU1w5uEW/ePMUkNy68jYY+3v5JSm5x
 za6xxV5tqULgBRFMo8OYjBrOCjx52P4UVe5N8yH24BJtk3XrWc1Oakfey/TyIIcc7TLS
 frVsDE431uTRCdUQZUo91Bnlai1vzTsTtLJRCPnY2Wel7Ot7e5bSUbzX2EFynJNKhpwu
 x8EBheXseyG8xy9+rziQQnyct4/OoyRDpnYUGXZaKL9FkUjz14UwdPWb5pM91kX0Jzm0
 GzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UJFR9YSQYJuT5oOotPCg6xiwzMZMMvlKZkAiVaMoUI=;
 b=bQ0uS/TMX5AXqiX4OedwG8O40EsOBF0hatUzfu1m2j/ElhjEWo+1iNFKcUI5kz12J7
 3CnhEr1RgFOmpCuk8XLx2VHzkFgDQkeZv/J/P8ILoVU69b+cQern80iIItJW8IjHEA1P
 EzkUB8RCFaohU3i1YpN6FA+g3n11jxrRBtVJLjMccFHhpEq6uru4o2j57LgnKRDBaS+L
 W7NHWT/ovv+oKDu/KZSJzFLTfX0WXYB4/yDhVsQIsVzUsoxYVF54GYSUCPv8haMWvG9P
 lYidPZH4YaN89DvV3NV6SJI9JAYn6KehFZF7s8qazew186V8NYYiMaARCNN6XkDvFXJo
 ThlA==
X-Gm-Message-State: AO0yUKVVkeUDvavgq9xAofMkGnverfleTX3cqmW+Evg66koNy6dWB13i
 2oQaOLeVkLC9egITBRThcLmLQw==
X-Google-Smtp-Source: AK7set8WNTZ873FSDejITc1otjv7BiR9wliehvnubaEvQ7CA+WMpGtA+tJh1PHliqhV5tu/9MveWTg==
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id
 g4-20020a5d5544000000b0024218097e17mr10701170wrw.6.1678224560730; 
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b002c703d59fa7sm13477322wrx.12.2023.03.07.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E83A1FFD2;
 Tue,  7 Mar 2023 21:21:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 26/30] gdbstub: Remove gdb_do_syscallv
Date: Tue,  7 Mar 2023 21:21:35 +0000
Message-Id: <20230307212139.883112-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This function is unused, except to implement gdb_do_syscall.
Fold the implementations together.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-27-richard.henderson@linaro.org>

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
index 6189940005..fdc68e452a 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -93,24 +93,26 @@ bool gdb_handled_syscall(void)
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
@@ -141,16 +143,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
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
2.39.2


