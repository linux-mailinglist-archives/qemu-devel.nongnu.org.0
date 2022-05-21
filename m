Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD652F6D4
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:33:09 +0200 (CEST)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsD3M-0001na-G4
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCf0-00036E-6I
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCex-0004Zo-NM
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 fw21-20020a17090b129500b001df9f62edd6so7300144pjb.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3j65Vrb+cTtoRUM0a2SN2E+0qaLnPvILTBqh1dXrOWQ=;
 b=dM4S8zJujbi7Iz9EvhOuNYRzLUp86V9jeeUFkJBBxgMstO8j6cvrtQP5m/pH7MFzeb
 RDl0kOcQT57qAkze/Cih8ND7ULAUmazm9peisYi6bmaRXqz1GS0JEs0zc1kiu28SIlO0
 ViG3kOqPT6eQy8B/zxYQMMwrE/D+9RPPXFV2eSYbdvu6ZTkomqOBsUTBFn8d/T5Vzoln
 N0ulOFxYsOlZuN+F8lTMXXs7LGli9fZCoP1jAcx4u66x8NU64WA6w5OYmZz12JMBcDKb
 aELKcg2CyzcHTUsQsmpgKkE8Ba0aRd5mLR3Vgv/AEjhBEojjGfeCk1St4Gzq9eSfxITI
 ylQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3j65Vrb+cTtoRUM0a2SN2E+0qaLnPvILTBqh1dXrOWQ=;
 b=DaRexlx6yFkIabfXnfjUSh+7kBeLKEestMg2/MyX/o5EA8YPRcONAS3gSknm/kVVPb
 vP90ezjm0/4w6tjGfnhwxsf18QASAyV65Cbg/h7fY6zYQ2OESXxN/EJv0qZ+cVuCrKKb
 utrz0zmWCyBjXAUrSJ+oi8EE/fAerDjjCAvLQ1T/5/Mey45KqkSTS4W9i7xEHyYAzBE/
 FBynYsuk1rRlZu5ED/Hq7iocMyn6v8BUEsMR7gEAgXzOHCygcdB1Lam5rjxgO6L/6eMI
 VmBOjrFnzqtAvTlYy0NKCAMwCegUjPMn5PbRYygWJUoAt6T7ulkEEZJEIIOwB1/iJMFx
 jotg==
X-Gm-Message-State: AOAM531rsAL7zubqfQZDnh/AykGUT9361a6Uxd1y0JtcfCLpOZHX2Wc9
 QrOIEJfbzVP8EukNtoT9TG96FJIpjw0XSw==
X-Google-Smtp-Source: ABdhPJzKE1an2tbYXWQ7mV/1sWju3ynkUhTwDJNA3rsCRaW9rIFVoaQxGMY+5UHrPOYwhz/Hr426/Q==
X-Received: by 2002:a17:902:f605:b0:154:aa89:bd13 with SMTP id
 n5-20020a170902f60500b00154aa89bd13mr12287828plg.112.1653091673658; 
 Fri, 20 May 2022 17:07:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 46/49] semihosting: Remove qemu_semihosting_console_outc
Date: Fri, 20 May 2022 17:03:57 -0700
Message-Id: <20220521000400.454525-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
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


