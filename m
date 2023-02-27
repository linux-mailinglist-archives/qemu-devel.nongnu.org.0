Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C36A43EF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5I-0003Uv-Er; Mon, 27 Feb 2023 09:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4N-0000lm-7w
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:36 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4K-0007c6-5I
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bt28so6326858wrb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qm89jNZzQrE8sBPqBWdhslClrvicJCmDVh4kNrz6Gcg=;
 b=D7CntBw7raCyyiA7qN+bhq/iWLoOdtJHd5z1WsXKP/AWlUWHlj85IvtYz53rrV2tJ2
 ZsQRXZBsnWBZ0EtCBIokjtAo+Cul0iJYKa2pCgzeziFv8epzD5UsQT4Qrb7MAUHBjM9k
 M7xP1lV0cQLgx2qgttmncy/DdtTGAI1XJDGcPF0VC24E618BiBYhrCvwItGmmxqr1Of6
 I04fAA7wWeQo0+F49LUIw0fJ5epJKQwP6TVChoY8tD0o8zCFROHKwVYZGP3KXsvoHZp8
 4PPJfEbVi3mSJMWxqB3e836LEX5PrSSf5Xvb6POuQw2jcVuYICcxWwhv0Fhr01R/TClE
 2wFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qm89jNZzQrE8sBPqBWdhslClrvicJCmDVh4kNrz6Gcg=;
 b=rstdMuRySFaBWq56cLEee0EM/4DwIrooKXzSPtFaW56on49LXohV+kLgcCWFRib1+B
 KP1wCIO+EJ51lvMGuIWd1mXvX5+zFZQ31gNHiMVCeQcKNPnSECKySdxc+l1llcwW4s36
 6ykJ0f3gVn4JAUYD46DeS4cjkgpgIDy3C87QCb//WkxOBv7ueHTFqTMp3CFDqwNAfk2q
 RROwIqYX9kREKZ/uApUWJXGSTAT1MQ40PT+CIipTPyj6LwGY30Y42YjCezYmeQlEVFqr
 JHUMaXOkXVv6KuydSDPXC5qIjPTNhZMSl5r0iqPjmLbn4h+Gi7cq5EWmHZvLIq+YQALq
 DcYA==
X-Gm-Message-State: AO0yUKXMl5Yplq62X0HghOfIPRPH6s72ejREjpMqmx1phRU60gB9cxdy
 IeAoKI7y5WO5w0T7YiOB2ip0yIZZtNC6tA/4
X-Google-Smtp-Source: AK7set/ks4AhZBlvUYlUVcauH8CtwY+3s61cmuq3ZIwzwljaepzfuiOTGkBN8jwFhw/gggZCvgh4ug==
X-Received: by 2002:a5d:60ca:0:b0:2c7:e909:5fcf with SMTP id
 x10-20020a5d60ca000000b002c7e9095fcfmr8141292wrt.3.1677506489697; 
 Mon, 27 Feb 2023 06:01:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/25] hw/char/cmsdk-apb-uart: Open-code cmsdk_apb_uart_create()
Date: Mon, 27 Feb 2023 14:00:55 +0000
Message-Id: <20230227140102.3712344-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

cmsdk_apb_uart_create() is only used twice in the same
file. Open-code it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230220115114.25237-7-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/cmsdk-apb-uart.h | 34 --------------------------
 hw/arm/mps2.c                    | 41 +++++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 48 deletions(-)

diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
index 64b0a3d5345..7de8f8d1b94 100644
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
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index a86a994dbac..d92fd60684c 100644
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
-- 
2.34.1


