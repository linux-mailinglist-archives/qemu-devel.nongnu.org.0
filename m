Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0293AA649
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:47:16 +0200 (CEST)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdNU-0006Zx-00
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKE-0001yD-Kf; Wed, 16 Jun 2021 17:43:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKD-0006fV-6W; Wed, 16 Jun 2021 17:43:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y7so4231104wrh.7;
 Wed, 16 Jun 2021 14:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMrFIFZX4VBJPQraxvDxEyJhOku4B5f9uSq095+uB5I=;
 b=ROhKU7Wv2GyicVLuhMGoTxFgsEj2O4goVxWO7/ymmFTnyWm6R9IfEF2+GfVWa8Ni97
 JTuwnqrkiZWg36fIYxXq2dd37lKX1QIrodDhOz2QSKAdNxCUm7CY8W2ocZu4z4EYCma5
 BBIagxNwBNpgWigIuzE7TcjalGQOJgBc2tcbq7LaVROwUVBKxarY3v75RDCMJAnxtqIk
 PKxlGTKDJd7pYbEBTItjJjKCGGev/YvcG+qSzavGXGrz4AdE8DrivP8+1jTE7VCxnAft
 avRtnWiOPR5Kok6y2mMYhWOghx1wjpN08lpVEuT6UmwUmCQtOSPrOm8ecR3ZohIzm4f2
 SHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lMrFIFZX4VBJPQraxvDxEyJhOku4B5f9uSq095+uB5I=;
 b=qnvUucZhr3UvpcW/xWQqhvwJDKsKSL5/c547H0XHiPycDKrIYLwEk3AKidQl/Q5UCA
 OE8bFmEHNtC32gTqwxJ2yPQco+nV8m+TEquOdnfb9lfsVtl/XHgBRas6oSZsycE8Hi1l
 paidQ5fxuZNBD/OPCIgqm2YtoU/03eQ8KAU5QTCHenRegWDbOwX3/Okc5meZbMEyvVQo
 f3dUvUjVAjPmML4CK7VTqIZVFgUEXUHV7vAqUlhIGqgtMAIXogq1yF/D9otfxnfJMmBT
 drk2XeCPljGhw+NzeCJDMHqEgfBOXZdzQcuXv3NUxDVaNSeBfa4S90Z5G56zrNaFRL9G
 o9Ag==
X-Gm-Message-State: AOAM531lXBh3NeHP+k/LlJTrS3KT5/Ihz02S+u6FGORkwEFdwA5Id3UF
 GyYPUNHhIJ9JPG0RTRIExPqq7hjRqMxlrQ==
X-Google-Smtp-Source: ABdhPJx1sca0UXmy/lGQ9mieLhWuE+h/r4JlJOMlOMsurTYpapJiZGbCP6y+wLOoCg7bdOQxW0ZuoA==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr1418652wri.291.1623879831081; 
 Wed, 16 Jun 2021 14:43:51 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f5sm3882154wrf.22.2021.06.16.14.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/15] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 23:42:49 +0200
Message-Id: <20210616214254.2647796-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using the confuse i2c_send_recv(), replace
  i2c_send_recv(send = true) by i2c_send() and
  i2c_send_recv(send = false) by i2c_recv().
During the replacement we also change a while() statement by for().
The resulting code is easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index d96219aef88..44aa9730bc9 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -141,12 +141,8 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
 
         ret = AUX_I2C_ACK;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
-                ret = AUX_I2C_NACK;
-                break;
-            }
-            len--;
+        for (i = 0; i < len; i++) {
+            data[i] = i2c_recv(i2c_bus);
         }
         i2c_end_transfer(i2c_bus);
         break;
@@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
 
         ret = AUX_I2C_ACK;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
+        for (i = 0; i < len; i++) {
+            if (i2c_send(i2c_bus, data[i]) < 0) {
                 ret = AUX_I2C_NACK;
                 break;
             }
-            len--;
         }
         i2c_end_transfer(i2c_bus);
         break;
@@ -200,15 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
 
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
+        ret = AUX_I2C_ACK;
+        for (i = 0; i < len; i++) {
+            if (i2c_send(i2c_bus, data[i]) < 0) {
                 i2c_end_transfer(i2c_bus);
+                ret = AUX_I2C_NACK;
                 break;
             }
-            len--;
-        }
-        if (len == 0) {
-            ret = AUX_I2C_ACK;
         }
         break;
     case READ_I2C_MOT:
@@ -233,16 +226,10 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
 
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
-                i2c_end_transfer(i2c_bus);
-                break;
-            }
-            len--;
-        }
-        if (len == 0) {
-            ret = AUX_I2C_ACK;
+        for (i = 0; i < len; i++) {
+            data[i] = i2c_recv(i2c_bus);
         }
+        ret = AUX_I2C_ACK;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "AUX cmd=%u not implemented\n", cmd);
-- 
2.31.1


