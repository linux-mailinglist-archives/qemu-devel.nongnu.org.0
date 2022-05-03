Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC2518F45
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:46:00 +0200 (CEST)
Received: from localhost ([::1]:48478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzPD-0003yS-Ux
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZW-0007qU-6B
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:34 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZU-0006H5-Il
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:33 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a191so2224580pge.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G8jUXILSyQ3ZGWS4huZP/MGa3C/uuyreOxdJ2Jh/tu0=;
 b=vfWQt7phsrg4z/+cQTmB5XoHiL5pR35cSpU+J98bjl3RE4q2+KtUDcXKn92CMHIh/I
 X+dgh7H/9Jq5LSlw+l51+phSUwvx1dEKr135ZJuYCdfhz+zDWtZRJlxX108n6g97RIgh
 G6mo8taPkUVgfo/50Kum+G1y3hsrkdjCRhY/WyBpYQwL0H6na4/3LjHFibaBSCWbFdFM
 j7g65DTrbN3tYvU3vOzVGpJsoawefCkG8dtJnB/ThOIYrakzBh6i8vtqNExSa6bZboyH
 ms9gOzcI5DOrbIdSGo1EAJtogbXJIsGQv4ZNSdocr9L742X5zA8ncxjNIEJbmdYF/gE8
 5mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G8jUXILSyQ3ZGWS4huZP/MGa3C/uuyreOxdJ2Jh/tu0=;
 b=cuyrUH5UUNmXpQpoLxFiAwy7xw6ct5xIcmkS68LZtk6Stwj353sFyZ7LM7661QWvDq
 p6hLhGniClvmEMJgM7AaR7tGRLddXjPLcD6ZHGfHM99MUrgSqWTTaFgJYQfj8qtFQbDf
 n074dsYF+jx8ajfvhxw0ua2A2u0DS5W3YwIz7MPNmXp8uCGDFi6KaG+vmuxrilHjnRwC
 S8dhfNCt4IYlb5igANkf7ybLcMXDQ8h2wyIqn+D2E83pnYRNObMurAlmP+42LWopr9V9
 F0Vxtxtia/LDDkm2zKoDyH0s2RLqD+xQvqzWgg3S1LMXUR3gljo7ivaRGgexZozihNWp
 J1Ug==
X-Gm-Message-State: AOAM533MYOVwZO6qR2zPDFbVEMCQVltKQ5k+7yx90RV0s1AZUQ5T++Yf
 gDHICQrxvq8PxyIMgYn0/DJ0I2WPENXnLw==
X-Google-Smtp-Source: ABdhPJzfkXkRxfNNWDyhjDL6hSOl2p5doz5626XwIicYDkHayRyhrHOoTlb/m8UjcFgxJFjau19xxQ==
X-Received: by 2002:a63:f1e:0:b0:3c1:d54f:fc47 with SMTP id
 e30-20020a630f1e000000b003c1d54ffc47mr13777583pgl.51.1651607551231; 
 Tue, 03 May 2022 12:52:31 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/74] semihosting: Remove qemu_semihosting_console_outs
Date: Tue,  3 May 2022 12:48:15 -0700
Message-Id: <20220503194843.1379101-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


