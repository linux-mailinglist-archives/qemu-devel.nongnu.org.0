Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9B339F54
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:03:39 +0100 (CET)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7fu-0003og-D6
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Y3-0005Zu-MD
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:32 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xy-00019b-Dp
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:30 -0500
Received: by mail-wr1-x436.google.com with SMTP id x16so3460960wrn.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLdAaDmbcOJIXm/9S2O8i5XmFL6rQSFPNhj2QWqHs1U=;
 b=mEeHqS+DSW8bv4ypABPR4FjHEkIa2elGDPdCWQJO6bTy5peCqSgWQfgbkFqX5FQyr5
 MG2hTSqRZ8wpMIijUsWGmzzRTqXrlk1ijzJ/j73XMouXE1XfcyAVKHXFHDCZX6ZytPC7
 IrwTD+NcSYOn1XPVwbRS5jT2aGNqPVkvP4HusSntvpYrcECYkN43/KJx0+yf8Dc7unl/
 UjKP1jBQcZCdKgxLRc6Qxkq38HMNxgpAKdUSA91ztmLiqpPGDZqOnfzZ+g4qOJZOSCop
 MkNLvmUneQw/dljyuHkcsMHyxiC3YdZTemwWaZwLi5R5VuR+jO1IftiIpcZcdJ3bB2Oa
 2//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nLdAaDmbcOJIXm/9S2O8i5XmFL6rQSFPNhj2QWqHs1U=;
 b=fEWKfFd2HXks8ehebiwF2928WrEhQfkzd3WNLO0ThRYriSWj+n7X1Y0xJ8To5t8G1B
 x/ImZRvohwayGfX68EvDFYhIpkBjVVQXnaFmiVzqnxB3Q/j8txq3/nJWMmfiTeYlVxCH
 ZUCMm7x0E/Qa1JRS1UFwjvJNkPnENs+QnoLdYuIlDdtYQTHmS0lgTyAcNEePrWN5sySZ
 8FCPptZN0YyzH7geZ32+x2ZO5Tif6Ev8qKIxnv5ijXiXqpqY6mtmnvXBGd8DYS7AlkDW
 UQIMjjRH6EzI/RVDQks66ghmqiT01juIFGRgYHtQJQ2kjZKZYZgKxyBY7BA3RS7SyQYM
 Dzsg==
X-Gm-Message-State: AOAM533T/foB1/i+8JKDU0UCdU3cpdMfzAGqHpMqp+6cdis6PaKyZ9eM
 e5PBlc+kWTMFiIJeo/iEg+WIj+yXYDcT9Q==
X-Google-Smtp-Source: ABdhPJxADrIONzA4amZTxrc41hPoAMf3HnzY5MEYtihBeRzUDfN/BFTgJRpVoa+KW2pRX94T4YM8TQ==
X-Received: by 2002:adf:dd47:: with SMTP id u7mr19783967wrm.13.1615654525047; 
 Sat, 13 Mar 2021 08:55:25 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l15sm7135538wme.43.2021.03.13.08.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] hw/gpio/avr_gpio: Add tracing for reads and writes
Date: Sat, 13 Mar 2021 17:54:41 +0100
Message-Id: <20210313165445.2113938-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: G S Niteesh Babu <niteesh.gs@gmail.com>

Added tracing for gpio read, write, and update output irq.

1) trace_avr_gpio_update_ouput_irq
2) trace_avr_gpio_read
3) trace_avr_gpio_write

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20210311135539.10206-3-niteesh.gs@gmail.com>
[PMD: Added port_name(), display port name in trace events]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/gpio/avr_gpio.c   | 26 +++++++++++++++++++++-----
 hw/gpio/trace-events |  5 +++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index e4c7122e62c..29252d6ccfe 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -2,6 +2,7 @@
  * AVR processors GPIO registers emulation.
  *
  * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
+ * Copyright (C) 2021 Niteesh Babu G S <niteesh.gs@gmail.com>
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
@@ -26,6 +27,12 @@
 #include "hw/gpio/avr_gpio.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "trace.h"
+
+static char port_name(AVRGPIOState *s)
+{
+    return 'A' + s->id;
+}
 
 static void avr_gpio_reset(DeviceState *dev)
 {
@@ -47,32 +54,41 @@ static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
 
         if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
             qemu_set_irq(s->out[pin], new_port_pin_val);
+            trace_avr_gpio_update_output_irq(port_name(s), pin, new_port_pin_val);
         }
     }
     s->reg.port = value & s->reg.ddr;
 }
 static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int size)
 {
+    uint8_t val = 0;
     AVRGPIOState *s = (AVRGPIOState *)opaque;
     switch (offset) {
     case GPIO_PIN:
-        return s->reg.pin;
+        val = s->reg.pin;
+        break;
     case GPIO_DDR:
-        return s->reg.ddr;
+        val = s->reg.ddr;
+        break;
     case GPIO_PORT:
-        return s->reg.port;
+        val = s->reg.port;
+        break;
     default:
         g_assert_not_reached();
         break;
     }
-    return 0;
+
+    trace_avr_gpio_read(port_name(s), offset, val);
+    return val;
 }
 
 static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
                                 unsigned int size)
 {
     AVRGPIOState *s = (AVRGPIOState *)opaque;
-    value = value & 0xF;
+    value = value & 0xFF;
+
+    trace_avr_gpio_write(port_name(s), offset, value);
     switch (offset) {
     case GPIO_PIN:
         s->reg.pin = value;
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 46ab9323bd0..640834597a8 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -18,3 +18,8 @@ sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" P
 sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
 sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+
+# avr_gpio.c
+avr_gpio_read(unsigned id, uint64_t offset, uint64_t r) "port %c offset 0x%" PRIx64 " value 0x%" PRIx64
+avr_gpio_write(unsigned id, uint64_t offset, uint64_t value) "port %c offset 0x%" PRIx64 " value 0x%" PRIx64
+avr_gpio_update_output_irq(unsigned id, int64_t line, int64_t value) "port %c pin %" PRIi64 " value %" PRIi64
-- 
2.26.2


