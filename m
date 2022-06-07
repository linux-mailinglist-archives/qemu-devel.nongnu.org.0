Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FF541F4E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:04:16 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiFD-0002HV-Nk
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg98-0005rM-Qz
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:50 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0001q4-LF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d22so15813711plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G8jUXILSyQ3ZGWS4huZP/MGa3C/uuyreOxdJ2Jh/tu0=;
 b=Gsxj8Rc8XH2LUjoZJISL67JgE28hoQQeP+oxnX1ZC29CKdGiDkB3eaN/v82bLR/A9y
 95HQPEL78pxRJfL773hBJmGwaeIGmBXlLPR2ZcjTb1vwi251UbuFIHbffIJKpzBMijfU
 ADvmNPNsmPTSyhTw/Ym9a62swSddnY3bvUkyrHno1SNlfl2DXMgDLOEgdutzzWnVOkzA
 RwH9esR342PNX8H/hr0IGSLJTTHGwTGaC4ntfxi7W+R/XX6ObJ/5vdYglkn7nSy29sX7
 Pnf1b0eS64FudNUh+26j3X6HFwxB4SkTvTe8v/Ns5RDVvWHtpVAYpUY2k41yKUO9kom9
 u0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G8jUXILSyQ3ZGWS4huZP/MGa3C/uuyreOxdJ2Jh/tu0=;
 b=4oj2KKyQXiNUcZU8SEI++IPQxgZbom9ZfZ5LgGTuuInbpibXLCpnIY4DOS3j6GTqCb
 IA6knhfrUt4vYCI0QqV7sz/1uc0wPv1G+JFDf3gdV0JqzCR1tMTtq8JPyHTfVVm8GX1C
 XFLbCkVqaiQq+xT6/1DPR9buN9i8fJzjhhawI2tdqC3maBAAdvFfOlTkLwZfFEp8ZLhF
 W0Ade0BGkv03NiOBO+gr0asjUcWltSqNkzBETjal/DgcQBIg74kFJYh2mGKyYbfGlXz5
 ZtLpwIye30Tj2dPzL6gn5blQo1DImKhOM8TI6wHOYhfEsnnH+WZqZ/U4fIQqUHnoJIWP
 5aZQ==
X-Gm-Message-State: AOAM530JKp4UB9VAtabUjmkBEJ/MPQHj8GUJ42vFkxcffou/FOHPptR+
 5bmTcJoH4mMcXMIx1DWTSdYNDPi2X18y/g==
X-Google-Smtp-Source: ABdhPJx5+hcLRfgee2wm4VjhDARN3xjmCdFn742OiLeQF7eL6E7SAHfF57XmVEJcf7uRA++oTmKtFg==
X-Received: by 2002:a17:90b:388d:b0:1e6:a0a4:c80f with SMTP id
 mu13-20020a17090b388d00b001e6a0a4c80fmr29289678pjb.39.1654634985564; 
 Tue, 07 Jun 2022 13:49:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 52/53] semihosting: Remove qemu_semihosting_console_outs
Date: Tue,  7 Jun 2022 13:45:56 -0700
Message-Id: <20220607204557.658541-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


