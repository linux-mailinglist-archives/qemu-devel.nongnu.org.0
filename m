Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2E572829
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:01:21 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN0S-0007Jy-BW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMu7-0006dP-3Y
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:47 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMu5-0007HS-KN
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:46 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c131-20020a1c3589000000b003a2cc290135so95269wma.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0pu9Y3XzRXbWbXaSGS52OJ20ieZtVBHvHSmSmKTWtx8=;
 b=Vb/vDw/TuUH61UbGVx6e/2yAqiGSuSCKG6QkOPkXdDf94KdOGRFiBv69czy4Yo6x5V
 b9DVuW7duxlMTx9WvyNLKNzahnj7vFa8Zw/rT1BWJVUOqjZbKrg8EftOpg5P9JmgWD2p
 KRZet9ita5kYuUq6TB7UxvJtmzdFg1lqKuNLiM0Ht/ZzqxFdvjP022xhKoGEA3IHJbos
 UFr3M0NGEwdLJncZ1m9ANVLkkLorxYmdoqTH/QpKo2l6DwRNwdWhWJJiJovpbbClD5RR
 0PoJqcCZtHizSsbFmkz2U3II9x02F6WktHCnBKuZDKFvsxsFdfZ9sCswTZVFtJ7b/FRR
 yDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0pu9Y3XzRXbWbXaSGS52OJ20ieZtVBHvHSmSmKTWtx8=;
 b=i1d5M/hbftnG4t98mMU9pX3K2XVEBv9wsHhsMV7BKcbCSLhoN9QdlbeVELz0cMYncY
 SUvwicr6X0kPxYwBKkVoZrXMCtxXm5d+3uan/7pgHq3k04BKuigXDckwMML04h1feSV1
 tc9iNaSIMr3DDpk/dRH1+tFCPBWwoHa9cf2GfpCxFqZzxrpGOR5quDbHJX9u5AS58K57
 2Y1abaBHLYUavCrghaADNDbh8ANWQxPJhusroamiPnAmYWaLbKtHmj2J4wsFnWLmVoFD
 6PVfYIHMgB3MqeWEj+p40t3nkYRpR4Md4hku9Q1f7uqTteO8XiwkxfCvDF//qNGAUfVz
 JbYA==
X-Gm-Message-State: AJIora8zrx7huN5rzRSPvVFjl4x1W1o3/zI2HQ0YuvlsA95idKE0EZYa
 adwwg/s4eSDuqaV8HG9MxJJX3fEOrZ3sN0og
X-Google-Smtp-Source: AGRyM1v1N4q/tW+Ejh8tuY0Rv2yvR6LhVyol5g3WjrFBwOp2n0Hpw5qVZgK58kgm1gvRmFryfxuybw==
X-Received: by 2002:a05:600c:1c1a:b0:3a2:d8e7:c15b with SMTP id
 j26-20020a05600c1c1a00b003a2d8e7c15bmr6100469wms.45.1657659284038; 
 Tue, 12 Jul 2022 13:54:44 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c480400b003a2eacc8179sm46176wmo.27.2022.07.12.13.54.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:43 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/12] semihosting: Remove qemu_semihosting_log_out
Date: Tue, 12 Jul 2022 22:53:45 +0200
Message-Id: <20220712205347.58372-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The function is no longer used.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220628111701.677216-7-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/semihosting/console.h | 13 -------------
 semihosting/console.c         |  9 ---------
 2 files changed, 22 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 61b0cb3a94..bd78e5f03f 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -40,19 +40,6 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
  */
 int qemu_semihosting_console_write(void *buf, int len);
 
-/**
- * qemu_semihosting_log_out:
- * @s: pointer to string
- * @len: length of string
- *
- * Send a string to the debug output. Unlike console_out these strings
- * can't be sent to a remote gdb instance as they don't exist in guest
- * memory.
- *
- * Returns: number of bytes written
- */
-int qemu_semihosting_log_out(const char *s, int len);
-
 /*
  * qemu_semihosting_console_block_until_ready:
  * @cs: CPUState
diff --git a/semihosting/console.c b/semihosting/console.c
index cda7cf1905..5b1ec0a1c3 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -38,15 +38,6 @@ typedef struct SemihostingConsole {
 
 static SemihostingConsole console;
 
-int qemu_semihosting_log_out(const char *s, int len)
-{
-    if (console.chr) {
-        return qemu_chr_write_all(console.chr, (uint8_t *) s, len);
-    } else {
-        return write(STDERR_FILENO, s, len);
-    }
-}
-
 #define FIFO_SIZE   1024
 
 static int console_can_read(void *opaque)
-- 
2.36.1


