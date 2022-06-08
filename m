Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828F8542139
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:23:14 +0200 (CEST)
Received: from localhost ([::1]:35746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyo9x-0000gq-Gs
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6n-0006vd-LH
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:57 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6m-00023W-0C
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id d22so16654615plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hrYGm6CB5wl83BARKhSg3dxjfTTX0HLuXW9+o58cZc=;
 b=IuGF6ySv0370yKn52DUQm+78xcb46sg7ZJPS1Kz2moi07HrQnuVBliDqhWEq3rYU6M
 i8R0sXlieBGs2ovK90kIvVfcx+RVi3Y5Zk2taOIBNan0n1/umZ0PY7rjzEOE0HoIcOAZ
 OHM1tbyuhs1pf1BLmW5ZXRSdDRhQiWa3RSyCLb4oItpXHrmzpPvcz/1zSQoPse50KTCp
 8et6k/7RSLPvKKYjOD2XFdK8qhB674hm7ly7JF30qN9/V5nn4mF+f3vKHR2u8OqTOkwU
 LHT8hBREJ1Wv8ytSUtgJH2eOHkLTDdhmiHAH+4LumNgI0w5cxHPAnRASks2oT1uGCdPu
 eNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hrYGm6CB5wl83BARKhSg3dxjfTTX0HLuXW9+o58cZc=;
 b=TsJ2BuvX8uTvUsvWVQ2vI+7C2Oz4oDSjRy02OAl3Bj4tWqCjsWyu2hAB/pPoywk3Os
 IITM8R5k5KI2w5m8bjwntInpFsIloiUEMSekQG2qp2eVPJP/poSZtt2cWBBOPObHwv6y
 1GP/v0z0EaZiCn20fGoRv2WQ6Bo1q8Z2wdBv/XlNas5cEwoWy8PyrokZxKskH6M3Btoq
 WZV9kR3O1EzDpl7LYj/X/7nbkwQo/KAtTqa4+iPXXvvErP9KBmqODWR1t4mcu6OZ4Sr1
 bmRyLaxo71JB0lowFXfd5aJ6mjtlVbCDmQfZn6InBITt38OkLp9RCxTUX0g0jHnSrakp
 DNAA==
X-Gm-Message-State: AOAM530cbkex2jUMC/ccBfgNzKwW4bZbTq/3aDCBS/8sSxPDst8mBlCw
 XLJ6fBQpM2BgRjBuSztc14HgBanKNbDXng==
X-Google-Smtp-Source: ABdhPJwsaSXvAkui0/Q5ZkW2MOjHfC2W/jqjAww4zLqR4ntqi11iN9lKAX8Tw80IyrI6cYbGvhX5Rg==
X-Received: by 2002:a17:902:e888:b0:163:f3e5:b379 with SMTP id
 w8-20020a170902e88800b00163f3e5b379mr32680921plg.62.1654665594551; 
 Tue, 07 Jun 2022 22:19:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 09/11] semihosting: Remove qemu_semihosting_log_out
Date: Tue,  7 Jun 2022 22:19:43 -0700
Message-Id: <20220608051945.802339-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

The function is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.34.1


