Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F2955BEF6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:06:17 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Ie-0004Xb-M7
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jo-00026L-K0
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jn-0000YT-4r
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:20 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 dw10-20020a17090b094a00b001ed00a16eb4so11495395pjb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VcbXRuc9p7xnMmio/gUl33BwOOt/KNGf1EdU6Sq8hhs=;
 b=tu2q1HkuuHDYgTQOZcvytJU41cHMM57GoxsK69uZnVRqC0gSeUqkFa7QyWOvgSahjW
 aF0sgBoY/fzOnspifTdR4JrcJ3BF0hISXVk4qlg3Vr1E51iviWVBc6IGRmOBDqdQhXC0
 wNc7FSDWgn324lDlazRqF+2/r67hrE6rp3y5+l1WJ6j25EeXykLmQRmPmKuCo3ttYNDK
 3BuPw3hWsuaVmTdt1MYNXyLJ51IVfqf6xLZSJkFuEPCqDsvzdCOhU32KrYdo7CrhbfpO
 2sxSlvsXUqTXj5IxFLnZVw2d6Wvb2BUJc3s6JwV0wq9qjwvxzuObYcd4u3YosjDp9nxM
 FYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VcbXRuc9p7xnMmio/gUl33BwOOt/KNGf1EdU6Sq8hhs=;
 b=hVw9gMBewVMcfVWmbTm7EqqoQyQTA2plqlN3y0WkzWf7LdhrmisyIDrR+kiUjbUQcy
 26oUSg7cDUGpQlRggpi5UTAjOGa4ILn1shCpr3v4cWJo8eLlaAqWMu1VANNrS6Yw13Q2
 iU5QGkkgug5PvlosAaemPQ9FOLxYj1iKubrR54TXQAHSSVFs5sIZGfdWokY8KBstzd2k
 ku1wlcbaRpkcy+HsBT8klAckHvFKWcrV6ZsYidpZ7nPnqMeZ+ooR3XkxfiiOpl44ldhE
 zv3cIt539SC5v8Cnt8xkJUDKVE82EZ7dw8LbU16cd/YOji++SZNn5dnJtStnR54bGicA
 APrg==
X-Gm-Message-State: AJIora8mw38naDFw3nUWArRBRgWkZn6O4E7+khLbm+8OTxsefEeuBHoy
 J+XZKTyknlhS3PGGK45Mnd6kQrsPKH9xFw==
X-Google-Smtp-Source: AGRyM1vk8Bjmkv13qCMjwatM5gyufrk1LURS5vAmRlxiML55SyDcNuDCSrTNrVVGAUN0zWqNoBxPUw==
X-Received: by 2002:a17:90a:5b0d:b0:1ea:d1ed:186e with SMTP id
 o13-20020a17090a5b0d00b001ead1ed186emr19525459pji.240.1656392357910; 
 Mon, 27 Jun 2022 21:59:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 52/60] semihosting: Remove qemu_semihosting_console_outs
Date: Tue, 28 Jun 2022 10:23:55 +0530
Message-Id: <20220628045403.508716-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

This function has been replaced by *_write.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 13 ----------
 linux-user/semihost.c         | 17 ------------
 semihosting/console.c         | 49 -----------------------------------
 3 files changed, 79 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index d6c1cc58ab..20c31d89d4 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -11,19 +11,6 @@
 
 #include "cpu.h"
 
-/**
- * qemu_semihosting_console_outs:
- * @env: CPUArchState
- * @s: host address of null terminated guest string
- *
- * Send a null terminated guest string to the debug console. This may
- * be the remote gdb session if a softmmu guest is currently being
- * debugged.
- *
- * Returns: number of bytes written.
- */
-int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
-
 /**
  * qemu_semihosting_console_read:
  * @cs: CPUState
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index f8bc8889f3..cee62a365c 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -16,23 +16,6 @@
 #include "user-internals.h"
 #include <termios.h>
 
-int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
-{
-    int len = target_strlen(addr);
-    void *s;
-    if (len < 0){
-       qemu_log_mask(LOG_GUEST_ERROR,
-                     "%s: passed inaccessible address " TARGET_FMT_lx,
-                     __func__, addr);
-       return 0;
-    }
-    s = lock_user(VERIFY_READ, addr, (long)(len + 1), 1);
-    g_assert(s);  /* target_strlen has already verified this will work */
-    len = write(STDERR_FILENO, s, len);
-    unlock_user(s, addr, 0);
-    return len;
-}
-
 /*
  * For linux-user we can safely block. However as we want to return as
  * soon as a character is read we need to tweak the termio to disable
diff --git a/semihosting/console.c b/semihosting/console.c
index fe7ee85137..c84ab97ab6 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -47,55 +47,6 @@ int qemu_semihosting_log_out(const char *s, int len)
     }
 }
 
-/*
- * A re-implementation of lock_user_string that we can use locally
- * instead of relying on softmmu-semi. Hopefully we can deprecate that
- * in time. Copy string until we find a 0 or address error.
- */
-static GString *copy_user_string(CPUArchState *env, target_ulong addr)
-{
-    CPUState *cpu = env_cpu(env);
-    GString *s = g_string_sized_new(128);
-    uint8_t c;
-
-    do {
-        if (cpu_memory_rw_debug(cpu, addr++, &c, 1, 0) == 0) {
-            if (c) {
-                s = g_string_append_c(s, c);
-            }
-        } else {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: passed inaccessible address " TARGET_FMT_lx,
-                          __func__, addr);
-            break;
-        }
-    } while (c!=0);
-
-    return s;
-}
-
-static void semihosting_cb(CPUState *cs, uint64_t ret, int err)
-{
-    if (err) {
-        qemu_log("%s: gdb console output failed (%d)\n", __func__, err);
-    }
-}
-
-int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
-{
-    GString *s = copy_user_string(env, addr);
-    int out = s->len;
-
-    if (use_gdb_syscalls()) {
-        gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, s->len);
-    } else {
-        out = qemu_semihosting_log_out(s->str, s->len);
-    }
-
-    g_string_free(s, true);
-    return out;
-}
-
 #define FIFO_SIZE   1024
 
 static int console_can_read(void *opaque)
-- 
2.34.1


