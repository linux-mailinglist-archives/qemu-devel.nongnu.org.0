Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3B677CBE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx02-0006F2-F6; Mon, 23 Jan 2023 08:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzW-0005vx-0L
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzS-0002MF-VN
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso10605050wmc.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6g1ePUTRmriS5gLoLUmsa+TXq6zNdDNdJGL0C/i+UZw=;
 b=gapkhKbB3ip3m2EWJSaRXMuGmifZOlxOyeicz9GJew4wRgNjcwkonC7mfxJzkXFNq8
 ZFE1ugLpxLbj2n9zBtqlatRhsqh5Gj/p7zkzFmk6kn97oSL2xxJ0aTUDjkwLhNKllaOd
 2OASyKZk1jQfLQedxwbttCQeyzgwaz8Kb8q8haM7gnUUYCYbxLTb6Q9izmnN2EaW+ACO
 CBU5D1QcAcXS26MecWDSUl5VaFfK5xHf3FsE0X6z8jj2LjeU9zfC53KW478Z8oPQtCr6
 VAN4530AUsyxjYSAIubbRlXvpCfjNm3JspXRgnAkLgbEh05Pr0KrDGkpFQBLQPF9X1vc
 O4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6g1ePUTRmriS5gLoLUmsa+TXq6zNdDNdJGL0C/i+UZw=;
 b=CiHtU4846GbbImg8CgkZNKK1Uc4peC1pYGiVQdbrHn3aDw/zJBpcx9bfQWm5OZl+A4
 4eVqZFee05+FIHDJ3hU6kWUBIsp0qSn3SSyeDnjQzFa1zFWJ2n42Xd3DBc1BkYFA2EOD
 8it02/NbcvEqppjMHK2nF/L90xxnVlWj7LQWepRaydXR0Xh+/wQ1td0lgwaScHpOnwOm
 6VTF3Jl1RubnzjjF69tyI6zrim8xvNM/q9DK7OWnvN/DBuLgPQ+2Ww72DKal+11Ed72w
 afUywnr02ovFDc3asthzlSUfZ0SfAqKtNgm+Te5sXZzvmEcBjnyjMxzqcOhHj2nU37nu
 k/vQ==
X-Gm-Message-State: AFqh2krfZQHTeyHaGiGRlTE2wOKMg48WNyTmMXnXotTu+IbXtKyd6nWf
 b+os830PzK7MLIMkcWqfvQ8O9D+00bNnTXCV
X-Google-Smtp-Source: AMrXdXtAARE7+HlZjRCUffaBFb7K9jYXhSRQ5SX0ntGQ/Q+7MnN0oHXQiNDdyGrYwohc3k1VcnoTtQ==
X-Received: by 2002:a05:600c:510d:b0:3da:f6ae:faa9 with SMTP id
 o13-20020a05600c510d00b003daf6aefaa9mr28700687wms.29.1674480960748; 
 Mon, 23 Jan 2023 05:36:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.35.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/26] hw/i2c/bitbang_i2c: Change state calling
 bitbang_i2c_set_state() helper
Date: Mon, 23 Jan 2023 13:35:32 +0000
Message-Id: <20230123133553.2171158-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-id: 20230111085016.44551-4-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e41cb63daa7..bf4b781393d 100644
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
2.34.1


