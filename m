Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B0541F42
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:02:00 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiD1-0007iL-5k
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg98-0005qH-Ig
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0001pb-JV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so16464567pjq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3j65Vrb+cTtoRUM0a2SN2E+0qaLnPvILTBqh1dXrOWQ=;
 b=CTbUxD06GTwnD2/vMtdaBUnq3oF4Tpapf/hYoet9kddAAHDaqxVjtR1G0i50HLgwUj
 iFYUnYQUtPjGsw35QwhtdQx7hi2a4Rr8ZQPOJyymMpxHpdlEiyuAGAming3azGmjfJi1
 X+PDmc+WAovohrUwJLIEMf+dKrsgJxLv9qicAoIe4doz4H1gSeuh7U4JDL6o4hWM4SRk
 jm3dqGLGmVIuPD+NI0njpglxHeniJVdzVIxRLIPDGr1N4/6YB3EUF8Z5PhJtU8+fEZ+m
 xWzJ9TDGOlYGPHi+Ah1nepDymh67bOcIvkLWFYLJhzzyJshWsznLh5hZwC0zAVWbSnEq
 Fldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3j65Vrb+cTtoRUM0a2SN2E+0qaLnPvILTBqh1dXrOWQ=;
 b=qZNchTIFdcFdIhSv/vYC2mg2/v9RiEevXDiRe282L5E+0Aqtkkg3CNK1prwR98/G4P
 3kW4hTRoBIj/v5792CsnBGvSgwfAJyt/AQeKi8UlolYocAKlf6a61nbInt05zhcOc6qQ
 rbPYfr8Tl7VnGl7MNZ4fR7dvCBwfFfWaSvj70qV+XmSMzSh2/SIC83eViPAUDLteG+sF
 2z5QmhNNMVMMlcn4buDSsu14gGf/5Sa9MUVShsdMGG5/iPyKtYStOCopJ1SZ7g2DvlJ0
 YLdVN4t+gJ4kTYcPLTfJ44r8FsXHD+sClsBT3+VTSeQlPdp74cKrfla0AYQCb7py64fB
 39eg==
X-Gm-Message-State: AOAM531Jv4kzrDwjzI7SFcISJrZ9heQR6ooZ9+SqzOFC3IZTuzE6ogIX
 GhgXMWrTiE+xRPYNjUglQCX6l0Y/xVpkEg==
X-Google-Smtp-Source: ABdhPJxUGBHJPLdI1lhDgPPthAjaylFlL9Ujo3R8+nGfgS0K+3PsGL8dMt+n2ALPmxNpG5nH3MCkSg==
X-Received: by 2002:a17:90a:ce18:b0:1e7:71de:7721 with SMTP id
 f24-20020a17090ace1800b001e771de7721mr28024103pju.244.1654634983767; 
 Tue, 07 Jun 2022 13:49:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 50/53] semihosting: Remove qemu_semihosting_console_outc
Date: Tue,  7 Jun 2022 13:45:54 -0700
Message-Id: <20220607204557.658541-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 include/semihosting/console.h | 13 -------------
 linux-user/semihost.c         | 16 ----------------
 semihosting/console.c         | 18 ------------------
 3 files changed, 47 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 6994f23c82..d6c1cc58ab 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -24,19 +24,6 @@
  */
 int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
 
-/**
- * qemu_semihosting_console_outc:
- * @env: CPUArchState
- * @s: host address of null terminated guest string
- *
- * Send single character from guest memory to the debug console. This
- * may be the remote gdb session if a softmmu guest is currently being
- * debugged.
- *
- * Returns: nothing
- */
-void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
-
 /**
  * qemu_semihosting_console_read:
  * @cs: CPUState
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index 871edf993a..f8bc8889f3 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -33,22 +33,6 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
     return len;
 }
 
-void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
-{
-    char c;
-
-    if (get_user_u8(c, addr)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: passed inaccessible address " TARGET_FMT_lx,
-                      __func__, addr);
-    } else {
-        if (write(STDERR_FILENO, &c, 1) != 1) {
-            qemu_log_mask(LOG_UNIMP, "%s: unexpected write to stdout failure",
-                          __func__);
-        }
-    }
-}
-
 /*
  * For linux-user we can safely block. However as we want to return as
  * soon as a character is read we need to tweak the termio to disable
diff --git a/semihosting/console.c b/semihosting/console.c
index 677ec2b176..f6fab5933a 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -96,24 +96,6 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
     return out;
 }
 
-void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
-{
-    CPUState *cpu = env_cpu(env);
-    uint8_t c;
-
-    if (cpu_memory_rw_debug(cpu, addr, &c, 1, 0) == 0) {
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, 1);
-        } else {
-            qemu_semihosting_log_out((const char *) &c, 1);
-        }
-    } else {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: passed inaccessible address " TARGET_FMT_lx,
-                      __func__, addr);
-    }
-}
-
 #define FIFO_SIZE   1024
 
 static int console_can_read(void *opaque)
-- 
2.34.1


