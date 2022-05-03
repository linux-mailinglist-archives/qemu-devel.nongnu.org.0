Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EFF518F16
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:42:04 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzLP-0005tI-Fq
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZU-0007kf-5A
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZS-0006Gc-I9
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so2552004pjb.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3j65Vrb+cTtoRUM0a2SN2E+0qaLnPvILTBqh1dXrOWQ=;
 b=jrHav2i+5I/qLGY9K9HW1GUG1B0v0tqQaw1sxwF8+hAXzl/nlrWcIhOBNH+MhU01jj
 ybi0bBD4d39hxFNlMrwfj7I2Jce4BDonJqnCvr+kLxPQXhSNoc7N6gTJmXXp9lvPKXqY
 8A4X4Bzb8H6YFbH7gW8Xs82lEStXTeMOf4iTHs8nzmKZMsVmSDBudvNQu1nkr629NEMc
 iTL3WlJhoet6C+naIpnRPyzaJFoiJrJUqUCBxi1xFnrHsx1juSjFEZJHgOqwMonELOB7
 rnp9rASI/j35SJed8jEf1Z0jov2938eOKB1WZ1S+b6hBEd7OIYXVQlxN4EkfF3gGXJJr
 Z1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3j65Vrb+cTtoRUM0a2SN2E+0qaLnPvILTBqh1dXrOWQ=;
 b=nGlkYv7wLrVjoyQsLv2QQR2iri1ZrQWh9nW/+8p8NynNNAfACJw7JajPCpVlpNd+y0
 l53vA7qx8lmeZ0eIE1jkbw8D+0tl607nitr8oOYzSXOOCXigFwztlUvu6DkFNnhlwfQr
 dNhPxmMzwoAKE9JG7hkLirY7ckbfuCPSRlsGJsC6X1mYEeW8V9QcCS8IUviGf6UktPaC
 +Yz2VxZOazbiYN/E1YuTixViMjW6rECVtBuKhS8elouKDY4c/usDcjVs1z2DXvOQUbG9
 LAzA5ktVKMm2sK2NHvGRFhhKedKTeAf6za73WfWZzo65QUklqG48p67SFCdkrkF3UvLd
 OhjA==
X-Gm-Message-State: AOAM530mt9Ty35BtCUFCAVGRA/NQKyM40UY8LFVQ1oX8O6UktTRENnab
 WeJh81EZNdZtsKr/BtX1YPtptWRzYlRh9A==
X-Google-Smtp-Source: ABdhPJwMQmKXENmyF2BXZrzb5tZ0y9cP4jXyQF6JrkFrL5xpX4Fkr7Hy1pmU/eIPWGAzaRFPYwG3uw==
X-Received: by 2002:a17:902:8304:b0:155:d594:5c04 with SMTP id
 bd4-20020a170902830400b00155d5945c04mr17582533plb.105.1651607549270; 
 Tue, 03 May 2022 12:52:29 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 44/74] semihosting: Remove qemu_semihosting_console_outc
Date: Tue,  3 May 2022 12:48:13 -0700
Message-Id: <20220503194843.1379101-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


