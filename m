Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC11663CA8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA17-0006fh-QR; Tue, 10 Jan 2023 03:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA11-0006eR-Sm
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:51 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA10-0006JN-CH
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:51 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m3so8200357wmq.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
 b=IhhgT/jdED5YXPhBH+OO3KYG25RU8oHkoKptSPMMkUnvrq14RWge8xot7+BYF/fYoa
 IaTA3ZiPJpi6oEoZd6PTQVbWG19MVIgK8ftcN9yXUO8/yWGOsYHDaSs1CIdGaaFKJnFw
 wYcriEdUxNH7+5Q1kj+bk5xgiBb3YhCFXoiGe1mOwD66anFS+8mTrkHbgJqPX6DkFa9i
 D15FCq9Yn9OgmbTvVrp2GLhTsFD/wzhs2fxME7j1YGeTo+3AGRUrJCeO72J/hQJNeJgd
 kF1i1Elf94RvJ51+/XFTS7sHeGD1urKDepnvnANCumMrir4PbVmOwjboXRQHfGItpObo
 YJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
 b=abF+unEnq9nqf3wEKICqsGXcIMEvV8NQdDoklQYSfbDLg+4RAF3Ml84gPDdwT2KOld
 4iwNBUI2CRjvDHXMyw9tKWY8cgZVAVM5HDfgoGd5aghvGxG6bjZXjbhLBumJyDYEWPoJ
 WYP/VML9RZhWqa2onPD7MgXHe3eAA1cbOFhlGBR5tBfiOTV02b6cLZglzVNwqCM3u+Yb
 k+xVk9HmSbjKnILpHQBRXWZezQ6c/o/JkFLYOfUb9okjFxir36a+ZMVHKN/O2cejkd3P
 oNzeqc5CoyWU5lcAndmF5aT4bsNdQJeEA0nj2BXrSaHI1gULuzNAqBK2yCy/1VQ7yD2g
 Tr4Q==
X-Gm-Message-State: AFqh2kphh0J50THQq4ET8UjFTcmhMLKCzlIafWHnC3KGAgRvY8ACZUbN
 gxTylKQ7SuWTrXoJJcnhVT5F8xCRvokFVGQS
X-Google-Smtp-Source: AMrXdXsnZYL5fy72RRlieJMCa9sswsYMKs7XxMecV/QeNKHFUz99GzaKKqvHBMG/9giPkjYjOqAaLw==
X-Received: by 2002:a05:600c:ac8:b0:3d7:7cea:b410 with SMTP id
 c8-20020a05600c0ac800b003d77ceab410mr48541017wmr.33.1673339388858; 
 Tue, 10 Jan 2023 00:29:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0ad200b003d9c97d82f2sm13869803wmr.8.2023.01.10.00.29.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/5] hw/i2c/bitbang_i2c: Change state calling
 bitbang_i2c_set_state() helper
Date: Tue, 10 Jan 2023 09:29:30 +0100
Message-Id: <20230110082932.24386-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e41cb63daa..bf4b781393 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -26,13 +26,19 @@ do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
 
+static void bitbang_i2c_set_state(bitbang_i2c_interface *i2c,
+                                  bitbang_i2c_state state)
+{
+    i2c->state = state;
+}
+
 static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 {
     DPRINTF("STOP\n");
     if (i2c->current_addr >= 0)
         i2c_end_transfer(i2c->bus);
     i2c->current_addr = -1;
-    i2c->state = STOPPED;
+    bitbang_i2c_set_state(i2c, STOPPED);
 }
 
 /* Set device data pin.  */
@@ -69,7 +75,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
         if (level == 0) {
             DPRINTF("START\n");
             /* START condition.  */
-            i2c->state = SENDING_BIT7;
+            bitbang_i2c_set_state(i2c, SENDING_BIT7);
             i2c->current_addr = -1;
         } else {
             /* STOP condition.  */
@@ -96,7 +102,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     case SENDING_BIT7 ... SENDING_BIT0:
         i2c->buffer = (i2c->buffer << 1) | data;
         /* will end up in WAITING_FOR_ACK */
-        i2c->state++; 
+        bitbang_i2c_set_state(i2c, i2c->state + 1);
         return bitbang_i2c_ret(i2c, 1);
 
     case WAITING_FOR_ACK:
@@ -117,13 +123,14 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
              * device we were sending to decided to NACK us).
              */
             DPRINTF("Got NACK\n");
+            bitbang_i2c_set_state(i2c, SENT_NACK);
             bitbang_i2c_enter_stop(i2c);
             return bitbang_i2c_ret(i2c, 1);
         }
         if (i2c->current_addr & 1) {
-            i2c->state = RECEIVING_BIT7;
+            bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         } else {
-            i2c->state = SENDING_BIT7;
+            bitbang_i2c_set_state(i2c, SENDING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 0);
     }
@@ -134,18 +141,18 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     case RECEIVING_BIT6 ... RECEIVING_BIT0:
         data = i2c->buffer >> 7;
         /* will end up in SENDING_ACK */
-        i2c->state++;
+        bitbang_i2c_set_state(i2c, i2c->state + 1);
         i2c->buffer <<= 1;
         return bitbang_i2c_ret(i2c, data);
 
     case SENDING_ACK:
-        i2c->state = RECEIVING_BIT7;
         if (data != 0) {
             DPRINTF("NACKED\n");
-            i2c->state = SENT_NACK;
+            bitbang_i2c_set_state(i2c, SENT_NACK);
             i2c_nack(i2c->bus);
         } else {
             DPRINTF("ACKED\n");
+            bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 1);
     }
-- 
2.38.1


