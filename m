Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9092069CA4B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4iD-00022u-Kl; Mon, 20 Feb 2023 06:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hz-000202-1R
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:51 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hw-00058X-MM
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so774009wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KmAzFzjUSjv0qxGwYUyPOJl5AM69yzfJfvbL6ZRJSM=;
 b=fS8RjV1nt//Qk8Wzqr38mbXdX+qAyXMqAYIX/F45S0ClGwVRhzigJuAhtrGsEARfhY
 t3GivPLqDBy0YTSdB3YoBhGyXfjMVriwDm7MBfBCSRsBKa/efV+2MU1S0rdHE8xpP5mp
 4h0JMz3M/cwTLvzoblXkyoGM/aH8MOMtMlfI6dPNqCeR9cGbCRiW+/jai7PLR3FhDY6H
 Rq/T1XTidvxEBGBsijhfOJGElGkAOBqcJ+vGKzhKhR9HlczHG1uL6NO7MMelt9mxK0RG
 Myr9/paRmH7tKxgSgF30QChg+LGNvNepu/orSo5EtQDnnnKHXIXd/r/I3pQSIWoVLC5O
 8TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9KmAzFzjUSjv0qxGwYUyPOJl5AM69yzfJfvbL6ZRJSM=;
 b=vk86JhyvHIr8l42EBKl7StEJUR2vNfe3FR3V9BfZHZgAmbTSDAJjVopYrXqN1bECal
 cJqwQ0gKJ+9PkV6lllPshcSr0ye33pNPF4WAQXmsndpd2Kfg9ApUeI1cDzIauw8WgOjc
 c67tL3ahMSEq739tSd5Zrq9GNVSei3r8clu8c/8I2RvghKAX1SWyUPfpld9oroWiVgK5
 FScC1bv55jqc9kbJKo1QBqQe2ZEuk5PHMucFLXkwmzj2lxFmYrCtGOAKm0DTlfOGs5CJ
 g7GeJPVEpXl4w/4Uv2j3VxsREtMLpAgCXNpN7mEkFthiqHgAZd2i9f79UAhEn9eL1pTw
 aEDQ==
X-Gm-Message-State: AO0yUKVnBDbz/3Avw+tAP+gxQSrENxBKuljIkHzksXcuEWf/ZWqrLzr7
 ErYnW5MQcvECCFOTnVDAYw6fh3LcCpQ5mpFc
X-Google-Smtp-Source: AK7set8xJlpmfaIBVB5pLex640/xzoeAhI/M6G/QCLoiMwhSwWJtfAHBFA2MYWvIzH54Q5nmQV3GKw==
X-Received: by 2002:a05:600c:1714:b0:3e0:c0d:75d8 with SMTP id
 c20-20020a05600c171400b003e00c0d75d8mr6439284wmn.23.1676893906976; 
 Mon, 20 Feb 2023 03:51:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e21356bddcsm14361345wmj.33.2023.02.20.03.51.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/8] hw/char/cmsdk-apb-uart: Open-code cmsdk_apb_uart_create()
Date: Mon, 20 Feb 2023 12:51:12 +0100
Message-Id: <20230220115114.25237-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

cmsdk_apb_uart_create() is only used twice in the same
file. Open-code it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/mps2.c                    | 41 +++++++++++++++++++++-----------
 include/hw/char/cmsdk-apb-uart.h | 34 --------------------------
 2 files changed, 27 insertions(+), 48 deletions(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index a86a994dba..d92fd60684 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -35,6 +35,7 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-properties.h"
 #include "hw/misc/unimp.h"
 #include "hw/char/cmsdk-apb-uart.h"
 #include "hw/timer/cmsdk-apb-timer.h"
@@ -282,6 +283,9 @@ static void mps2_common_init(MachineState *machine)
         qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12));
 
         for (i = 0; i < 5; i++) {
+            DeviceState *dev;
+            SysBusDevice *s;
+
             static const hwaddr uartbase[] = {0x40004000, 0x40005000,
                                               0x40006000, 0x40007000,
                                               0x40009000};
@@ -294,12 +298,16 @@ static void mps2_common_init(MachineState *machine)
                 rxovrint = qdev_get_gpio_in(orgate_dev, i * 2 + 1);
             }
 
-            cmsdk_apb_uart_create(uartbase[i],
-                                  qdev_get_gpio_in(armv7m, uartirq[i] + 1),
-                                  qdev_get_gpio_in(armv7m, uartirq[i]),
-                                  txovrint, rxovrint,
-                                  NULL,
-                                  serial_hd(i), SYSCLK_FRQ);
+            dev = qdev_new(TYPE_CMSDK_APB_UART);
+            s = SYS_BUS_DEVICE(dev);
+            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
+            qdev_prop_set_uint32(dev, "pclk-frq", SYSCLK_FRQ);
+            sysbus_realize_and_unref(s, &error_fatal);
+            sysbus_mmio_map(s, 0, uartbase[i]);
+            sysbus_connect_irq(s, 0, qdev_get_gpio_in(armv7m, uartirq[i] + 1));
+            sysbus_connect_irq(s, 1, qdev_get_gpio_in(armv7m, uartirq[i]));
+            sysbus_connect_irq(s, 2, txovrint);
+            sysbus_connect_irq(s, 3, rxovrint);
         }
         break;
     }
@@ -324,7 +332,8 @@ static void mps2_common_init(MachineState *machine)
                                               0x4002c000, 0x4002d000,
                                               0x4002e000};
             Object *txrx_orgate;
-            DeviceState *txrx_orgate_dev;
+            DeviceState *txrx_orgate_dev, *dev;
+            SysBusDevice *s;
 
             txrx_orgate = object_new(TYPE_OR_IRQ);
             object_property_set_int(txrx_orgate, "num-lines", 2, &error_fatal);
@@ -332,13 +341,17 @@ static void mps2_common_init(MachineState *machine)
             txrx_orgate_dev = DEVICE(txrx_orgate);
             qdev_connect_gpio_out(txrx_orgate_dev, 0,
                                   qdev_get_gpio_in(armv7m, uart_txrx_irqno[i]));
-            cmsdk_apb_uart_create(uartbase[i],
-                                  qdev_get_gpio_in(txrx_orgate_dev, 0),
-                                  qdev_get_gpio_in(txrx_orgate_dev, 1),
-                                  qdev_get_gpio_in(orgate_dev, i * 2),
-                                  qdev_get_gpio_in(orgate_dev, i * 2 + 1),
-                                  NULL,
-                                  serial_hd(i), SYSCLK_FRQ);
+
+            dev = qdev_new(TYPE_CMSDK_APB_UART);
+            s = SYS_BUS_DEVICE(dev);
+            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
+            qdev_prop_set_uint32(dev, "pclk-frq", SYSCLK_FRQ);
+            sysbus_realize_and_unref(s, &error_fatal);
+            sysbus_mmio_map(s, 0, uartbase[i]);
+            sysbus_connect_irq(s, 0, qdev_get_gpio_in(txrx_orgate_dev, 0));
+            sysbus_connect_irq(s, 1, qdev_get_gpio_in(txrx_orgate_dev, 1));
+            sysbus_connect_irq(s, 2, qdev_get_gpio_in(orgate_dev, i * 2));
+            sysbus_connect_irq(s, 3, qdev_get_gpio_in(orgate_dev, i * 2 + 1));
         }
         break;
     }
diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
index 64b0a3d534..7de8f8d1b9 100644
--- a/include/hw/char/cmsdk-apb-uart.h
+++ b/include/hw/char/cmsdk-apb-uart.h
@@ -12,10 +12,8 @@
 #ifndef CMSDK_APB_UART_H
 #define CMSDK_APB_UART_H
 
-#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
-#include "qapi/error.h"
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
@@ -45,36 +43,4 @@ struct CMSDKAPBUART {
     uint8_t rxbuf;
 };
 
-/**
- * cmsdk_apb_uart_create - convenience function to create TYPE_CMSDK_APB_UART
- * @addr: location in system memory to map registers
- * @chr: Chardev backend to connect UART to, or NULL if no backend
- * @pclk_frq: frequency in Hz of the PCLK clock (used for calculating baud rate)
- */
-static inline DeviceState *cmsdk_apb_uart_create(hwaddr addr,
-                                                 qemu_irq txint,
-                                                 qemu_irq rxint,
-                                                 qemu_irq txovrint,
-                                                 qemu_irq rxovrint,
-                                                 qemu_irq uartint,
-                                                 Chardev *chr,
-                                                 uint32_t pclk_frq)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_CMSDK_APB_UART);
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    qdev_prop_set_uint32(dev, "pclk-frq", pclk_frq);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, txint);
-    sysbus_connect_irq(s, 1, rxint);
-    sysbus_connect_irq(s, 2, txovrint);
-    sysbus_connect_irq(s, 3, rxovrint);
-    sysbus_connect_irq(s, 4, uartint);
-    return dev;
-}
-
 #endif
-- 
2.38.1


