Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDCD310EDB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:38:14 +0100 (CET)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l853d-0001I9-53
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tj-0006r5-De
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:09 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TG-00044M-Hq
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:07 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so8465473wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bR3iCRZSQtsiL/0YanNf64ks34qWLJ5kgt2Osppz8EY=;
 b=s1UguYTa03aWaHgLSvHXJdyKdN4ZML9BystZ+BkSLCscJL4XZPhXxmfAVwRbW2+iio
 Z2ffNjAz++Bk23K8g9sQzy5TZJV5GlsKoAI3kchYYSky0BU6+EFn4VDAGpAvwaIbYt+j
 x1WZVzeZtTU/R3vVYNLVGX7G2ZzjL4Q9Yfp98LqLInKTEc0d/3PHB+kGHq4TARYXIrU/
 89ChX6SrDVf7Yfmc89Z2hKkg0ZO2dBMn9oeAsYtnJGGfYgWlRzRBKkOZVV0fc9wQ9SdK
 BgTUCchVOBnpj0mzWjFrVb+NxE6KOUoXPiT7Luq/ubh16hJvNPXdgnfk154PzgmG1FuP
 nr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bR3iCRZSQtsiL/0YanNf64ks34qWLJ5kgt2Osppz8EY=;
 b=Xg+dkJM3y6K/key7U+JCY4iRTcsK4M2/ua8O5ft1V9Ww2/uGvBlieNic2flfBJnVoZ
 nVNlknleX4QUbGpNmcuPzHJrzRVbC47wKNiQGnJT/FXsTjcR0PTSiMvxlA7BgceurCYH
 vvGPmq4YE1oOL9O8V4oQmQcoZR4fdugcu1JHeO3ARdp+AadDUWQkXpgVHW+6l8a1s2qv
 JzGsBZ7pEb6pFYh25eVufDpjiyAByxJWB+A6FG9H/DC1VcNAQbQez5dz8r9+Pzc02ewa
 4PAKg3w0wqFYUgyxe4+0I6BzwaESlPkf6dJRxSnDZb8BbWtH5sLIIb5wuJyKYPuY8Ak0
 OnGg==
X-Gm-Message-State: AOAM530pkQH/EDEi7Famm+/w+EgOBEC0xKBx/njzUGyCUWBYY215+KFF
 sOLaT96xvhQPFF4fS1S6/mQiB1MoUpA6Vw==
X-Google-Smtp-Source: ABdhPJwHtJlMh2wTaoDLRkGyYHEn4DLkeLbo3k7jLtMQaLg6OgLs6TkzUFlfkBxHo/Bw49Qwb6Zjpg==
X-Received: by 2002:a5d:6a8f:: with SMTP id s15mr6098511wru.252.1612544432527; 
 Fri, 05 Feb 2021 09:00:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/24] hw/arm/mps2-tz: Move device IRQ info to data structures
Date: Fri,  5 Feb 2021 17:00:08 +0000
Message-Id: <20210205170019.25319-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the specification of the IRQ information for the uart, ethernet,
dma and spi devices to the data structures.  (The other devices
handled by the PPCPortInfo structures don't have any interrupt lines
we need to wire up.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 52 +++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 0c75b2230ed..07694413005 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -208,12 +208,10 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
                                const char *name, hwaddr size,
                                const int *irqs)
 {
+    /* The irq[] array is tx, rx, combined, in that order */
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
     int i = uart - &mms->uart[0];
-    int rxirqno = i * 2 + 32;
-    int txirqno = i * 2 + 33;
-    int combirqno = i + 42;
     SysBusDevice *s;
     DeviceState *orgate_dev = DEVICE(&mms->uart_irq_orgate);
 
@@ -222,11 +220,11 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->sysclk_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, txirqno));
-    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, rxirqno));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
+    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[1]));
     sysbus_connect_irq(s, 2, qdev_get_gpio_in(orgate_dev, i * 2));
     sysbus_connect_irq(s, 3, qdev_get_gpio_in(orgate_dev, i * 2 + 1));
-    sysbus_connect_irq(s, 4, get_sse_irq_in(mms, combirqno));
+    sysbus_connect_irq(s, 4, get_sse_irq_in(mms, irqs[2]));
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(uart), 0);
 }
 
@@ -283,7 +281,7 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
 
     s = SYS_BUS_DEVICE(mms->lan9118);
     sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 48));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
     return sysbus_mmio_get_region(s, 0);
 }
 
@@ -329,6 +327,7 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
                               const int *irqs)
 {
+    /* The irq[] array is DMACINTR, DMACINTERR, DMACINTTC, in that order */
     PL080State *dma = opaque;
     int i = dma - &mms->dma[0];
     SysBusDevice *s;
@@ -373,9 +372,9 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
 
     s = SYS_BUS_DEVICE(dma);
     /* Wire up DMACINTR, DMACINTERR, DMACINTTC */
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 58 + i * 3));
-    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, 56 + i * 3));
-    sysbus_connect_irq(s, 2, get_sse_irq_in(mms, 57 + i * 3));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
+    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[1]));
+    sysbus_connect_irq(s, 2, get_sse_irq_in(mms, irqs[2]));
 
     g_free(mscname);
     return sysbus_mmio_get_region(s, 0);
@@ -394,13 +393,12 @@ static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
      * lines are set via the "MISC" register in the MPS2 FPGAIO device.
      */
     PL022State *spi = opaque;
-    int i = spi - &mms->spi[0];
     SysBusDevice *s;
 
     object_initialize_child(OBJECT(mms), name, spi, TYPE_PL022);
     sysbus_realize(SYS_BUS_DEVICE(spi), &error_fatal);
     s = SYS_BUS_DEVICE(spi);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 51 + i));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
     return sysbus_mmio_get_region(s, 0);
 }
 
@@ -551,16 +549,16 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "apb_ppcexp1",
             .ports = {
-                { "spi0", make_spi, &mms->spi[0], 0x40205000, 0x1000 },
-                { "spi1", make_spi, &mms->spi[1], 0x40206000, 0x1000 },
-                { "spi2", make_spi, &mms->spi[2], 0x40209000, 0x1000 },
-                { "spi3", make_spi, &mms->spi[3], 0x4020a000, 0x1000 },
-                { "spi4", make_spi, &mms->spi[4], 0x4020b000, 0x1000 },
-                { "uart0", make_uart, &mms->uart[0], 0x40200000, 0x1000 },
-                { "uart1", make_uart, &mms->uart[1], 0x40201000, 0x1000 },
-                { "uart2", make_uart, &mms->uart[2], 0x40202000, 0x1000 },
-                { "uart3", make_uart, &mms->uart[3], 0x40203000, 0x1000 },
-                { "uart4", make_uart, &mms->uart[4], 0x40204000, 0x1000 },
+                { "spi0", make_spi, &mms->spi[0], 0x40205000, 0x1000, { 51 } },
+                { "spi1", make_spi, &mms->spi[1], 0x40206000, 0x1000, { 52 } },
+                { "spi2", make_spi, &mms->spi[2], 0x40209000, 0x1000, { 53 } },
+                { "spi3", make_spi, &mms->spi[3], 0x4020a000, 0x1000, { 54 } },
+                { "spi4", make_spi, &mms->spi[4], 0x4020b000, 0x1000, { 55 } },
+                { "uart0", make_uart, &mms->uart[0], 0x40200000, 0x1000, { 32, 33, 42 } },
+                { "uart1", make_uart, &mms->uart[1], 0x40201000, 0x1000, { 34, 35, 43 } },
+                { "uart2", make_uart, &mms->uart[2], 0x40202000, 0x1000, { 36, 37, 44 } },
+                { "uart3", make_uart, &mms->uart[3], 0x40203000, 0x1000, { 38, 39, 45 } },
+                { "uart4", make_uart, &mms->uart[4], 0x40204000, 0x1000, { 40, 41, 46 } },
                 { "i2c0", make_i2c, &mms->i2c[0], 0x40207000, 0x1000 },
                 { "i2c1", make_i2c, &mms->i2c[1], 0x40208000, 0x1000 },
                 { "i2c2", make_i2c, &mms->i2c[2], 0x4020c000, 0x1000 },
@@ -582,15 +580,15 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x40101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x40102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x40103000, 0x1000 },
-                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000 },
+                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000, { 48 } },
             },
         }, {
             .name = "ahb_ppcexp1",
             .ports = {
-                { "dma0", make_dma, &mms->dma[0], 0x40110000, 0x1000 },
-                { "dma1", make_dma, &mms->dma[1], 0x40111000, 0x1000 },
-                { "dma2", make_dma, &mms->dma[2], 0x40112000, 0x1000 },
-                { "dma3", make_dma, &mms->dma[3], 0x40113000, 0x1000 },
+                { "dma0", make_dma, &mms->dma[0], 0x40110000, 0x1000, { 58, 56, 57 } },
+                { "dma1", make_dma, &mms->dma[1], 0x40111000, 0x1000, { 61, 59, 60 } },
+                { "dma2", make_dma, &mms->dma[2], 0x40112000, 0x1000, { 64, 62, 63 } },
+                { "dma3", make_dma, &mms->dma[3], 0x40113000, 0x1000, { 67, 65, 66 } },
             },
         },
     };
-- 
2.20.1


