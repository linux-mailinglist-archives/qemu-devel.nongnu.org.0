Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436B33754B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:18:55 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKM9O-0006XQ-9i
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lKLnp-0002z7-Hg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:56:37 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lKLnn-0003WP-Sz
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:56:37 -0500
Received: by mail-pf1-x433.google.com with SMTP id y13so11082536pfr.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HdXHfF0esxqgy+KWP8ooxVtoJqVDo9Tm/88wrB+K/2Q=;
 b=TxIw5lNGwW49OH8v+7e2nB0JQFHEH2sQAh5dIgvfK8vqskuCe2DhNiBCo7FLFwpmvf
 N5/ghmBWngGbyHDwz9fddASPwIc9P50J0XIPCwfY6aSwWtFAKTylcS85o9wdkZi1p/vY
 3Ug3Gr41ftGX4z6B604OreSMMUOf4Fxfrmxv1OrC6chKieyo9FK7L1D7Q6UFAyWt6xYl
 Nw/vcOJePTvjf2NqtWCHwt6MlJwb2MOVYtSrUPbBv0m0/1vU3dzIjvQfX0FRh5OZe81m
 l2eJJH8MJuCoKwa+v1E8GXppKLjQGuodvowd4SN+WxyduamYVe1Poz6z0Cxio4gF/Ntx
 imgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HdXHfF0esxqgy+KWP8ooxVtoJqVDo9Tm/88wrB+K/2Q=;
 b=WsWHsDY8DcVv89MLRHqN0rHyzcz+FMinwUquu12vgp8vTGE9VyZK9Oy0hKBQm+V/w+
 UX09ElJKUjbhI+ZRTa16vaZQETMfYiPwDEmJpG8Mwy72y9Wq5DPQm8pH8JIJ9qUvBTQL
 Jb4bLy0PzuvNP7CjqrG2IGRJIr95K4x6ExgGknFizKVJj5VA7mj4f3WYLICsXWNxz7ZV
 y9u04esyPR++vvsGXp9gZ1A1bhPmaKCDv/DaldHdPxxB97ss3QaNexJPuuN5kVN4atDc
 sbGcEvVPfDuQoxUai7y/++GDISyaBTAFaqa9BoJE+dMEt/bf4zd/S75l/yE/U+ZlX3Ot
 WCDQ==
X-Gm-Message-State: AOAM530dGTuu3FcJJpekF7v8Uaun6z6p1ycHr8flX2p59xx2rUuIWgbb
 NYUIEF1cSwCxXw/cnyzqcViLvV34QTBxgg==
X-Google-Smtp-Source: ABdhPJwjqm8D2qVW1xZU8+YessZEZ2XrRpQkRWFiCdL73dRHZAn1Av4mvjFyT8skgX1iQ4t1xjFyQQ==
X-Received: by 2002:aa7:829a:0:b029:1c1:1a3f:db25 with SMTP id
 s26-20020aa7829a0000b02901c11a3fdb25mr7609175pfm.60.1615470994332; 
 Thu, 11 Mar 2021 05:56:34 -0800 (PST)
Received: from localhost.localdomain ([120.138.12.210])
 by smtp.gmail.com with ESMTPSA id a7sm2582392pfo.105.2021.03.11.05.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:56:34 -0800 (PST)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] avr/arduino: Add D13 LED
Date: Thu, 11 Mar 2021 19:25:39 +0530
Message-Id: <20210311135539.10206-4-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311135539.10206-1-niteesh.gs@gmail.com>
References: <20210311135539.10206-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: S.E.Harris@kent.ac.uk, mrolnik@gmail.com, f4bug@amsat.org,
 G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 hw/avr/Kconfig   |  1 +
 hw/avr/arduino.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index 16a57ced11..e0d4fc5537 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -8,3 +8,4 @@ config AVR_ATMEGA_MCU
 config ARDUINO
     select AVR_ATMEGA_MCU
     select UNIMP
+    select LED
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 3c8388490d..5cdba3201c 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/misc/led.h"
 #include "atmega.h"
 #include "boot.h"
 #include "qom/object.h"
@@ -22,6 +23,8 @@ struct ArduinoMachineState {
     MachineState parent_obj;
     /*< public >*/
     AtmegaMcuState mcu;
+
+    LEDState *onboard_led;
 };
 typedef struct ArduinoMachineState ArduinoMachineState;
 
@@ -49,6 +52,18 @@ static void arduino_machine_init(MachineState *machine)
                              amc->xtal_hz, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
 
+    ams->onboard_led = led_create_simple(OBJECT(ams),
+                                         GPIO_POLARITY_ACTIVE_HIGH,
+                                         LED_COLOR_BLUE,
+                                         "D13 LED");
+
+    /* TODO: Add macro or function to map pins to ports */
+    /* The onboard led is connected to PIN 13 in all boards currently supported
+     * in QEMU. And PIN 13 is mapped to PORT B BIT 5.
+     */
+    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]), 5,
+                          qdev_get_gpio_in(DEVICE(ams->onboard_led), 0));
+
     if (machine->firmware) {
         if (!avr_load_firmware(&ams->mcu.cpu, machine,
                                &ams->mcu.flash, machine->firmware)) {
-- 
2.17.1


