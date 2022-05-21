Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAFC52F6FC
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:49:17 +0200 (CEST)
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDIz-0003A3-3E
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCf2-00039W-HJ
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:08:00 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCez-0004aB-D5
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:59 -0400
Received: by mail-pl1-x632.google.com with SMTP id n18so8570020plg.5
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G8jUXILSyQ3ZGWS4huZP/MGa3C/uuyreOxdJ2Jh/tu0=;
 b=n5p3Xz8ZQjOeUQF0/vFCpuBIhLYUi1175k+CT4X7HylP5F/Cc0+YKJZZ7jPzCdggc+
 ZkAJmDzt+QfpAH00crA/UAl3t2GCW+u0Y3rPdhuSyio7odoa0U+hB18i0LotMouBd7U+
 +XHOjc3a+i7BoGpCNrJtnVUCJOZmVM/HCouKqllmI89OuoGUo3eEgDgluYEKdbwYrVpf
 7441asGyuIwCd27bleeIUr/ofHT9cYhr94hvMmyE7mncF5f3BElMDW023HxFndAZsYM5
 gyfz4jUTvRT6ExwJSxvQuvYt2Acfr72CpjlH3uInSdAmdrNHwZF1MD1DbFYlwotWv6OC
 waAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G8jUXILSyQ3ZGWS4huZP/MGa3C/uuyreOxdJ2Jh/tu0=;
 b=510bOLYtYLPZ1NHtCXPqd9W7oTgHkw0CKdu7sRujXxLfC9maJ2e6XFBI3Nq5rcQkC0
 H1eqXZKfIZ1HKeHoVj1jkxYfrnL2ngc9r2vW06dQvI2oh5N7yI0trb3yISv7L2+bW4Qf
 FwVAhhc0YWJb9SBx3N0KvPNdKf8NeBiF4f5XdLZ8ULS6o8HBYpadRcnZCJrpE0O5kLrQ
 BX8fRAoULITwksumT/cBe/tmCGfEi+F46P1SJxTiAl+4Qh+cJZp7luoQW4ybS24ln92q
 yrepw29PUp2flVjzAUYI2RsATjM2kTdgH7X+VjIZeUPy63DLcq4R4IBjaxLMJt/ZJ9lC
 E70g==
X-Gm-Message-State: AOAM530fgC5Qbi+AxDV3U3bCt0cRe6Fz8E/60Evh2Zx0wQ4kcydHjAK2
 Z6fp9huqPtq74GCVSVj7NnhMmMeTVr8qCg==
X-Google-Smtp-Source: ABdhPJwWrRUGjxfd4PhADa3SF8oqBXf+miI7O/EQzHzzQcDCh/tDArqVsnd41FTjRh5Vsf25lZi7eg==
X-Received: by 2002:a17:903:241:b0:15c:ee52:cbf2 with SMTP id
 j1-20020a170903024100b0015cee52cbf2mr11756664plh.10.1653091676019; 
 Fri, 20 May 2022 17:07:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 48/49] semihosting: Remove qemu_semihosting_console_outs
Date: Fri, 20 May 2022 17:03:59 -0700
Message-Id: <20220521000400.454525-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index f6fab5933a..c84ab97ab6 100644
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
-        qemu_log("%s: gdb console output failed (%d)", __func__, err);
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


