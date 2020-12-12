Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698C2D89ED
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:14:43 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBHu-0000mN-Fu
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koA0s-0006oI-9u
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:53:03 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koA0n-0006f7-F3
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:53:01 -0500
Received: by mail-lf1-x129.google.com with SMTP id 23so19945888lfg.10
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhgOuTbRi2E7pQrVYmttrJ7Nf5zTX932vd5VlD7ZYPg=;
 b=LETCNcxTMySC428A3u2URelUY2y97cYUrIU0DtnvsbBaGguDAgrtH0di7ox1RHVKT3
 auG0cM4fBTFR7v0X+TzmfI55syS6p3OkwxqtTkHae/vNV5Xr1y2NvUWwx6u8giTFAyve
 1q739KcQrHK0gibKX+/uzenam5aC4CBrQnX06J+LZFTQE1pqiENIS9HAZ21Bxk80BB+2
 +Zclm9Epcox71/ZaF3O7QyNC5AXiGGvj9ukjaEip7YCqnHzhIye6H3CWbsuYaPE/eFyR
 PTJVCPLzPvGKWTGjiDvFk1dvOOadmmEMmGw/wZsAHTiGy4yMIhyoRxN6H3n2Y41N1msk
 Noug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhgOuTbRi2E7pQrVYmttrJ7Nf5zTX932vd5VlD7ZYPg=;
 b=AID3RyLPRLhJrr79OFLR7y/lqa54MsVdyfDk4Emsx0qSBhtwmqWOaQpXasrW1M23fb
 Y9yjCTrpW1UVDRZpEVU/i/WtKpAtNIB1o/RGzK+giy4m5RKGb+ujoBfyA9DA6q+HOKdj
 JE0liylr8/0PSkedZhQ+dMzDHNZ6viRPa7gl1HCCcNyCCUO/Yem11wGhpMK6DoDMTAUX
 GWmt7s1YAoFtMPeGwaAzr1+9MiWaIsqqQJGAH44+NCQGnyM7ZXcHd79vL1LCzui7QtKc
 NfBYDhJddWGjn34toMIZbuiTTM4lSz8170MwrwjOa2sIUHJUVXbi1jkn1rglIqG6mKxt
 PJGQ==
X-Gm-Message-State: AOAM530av0hOhdTn3o7x/c0XcQ7pdpGyYbnRrriY7Yo0eHSp03BjuJgX
 1BFx9il6vfaf4RDJCMob9R1v4lSZRU9gLw==
X-Google-Smtp-Source: ABdhPJxPhVkmxPJxZfHWNADMDeUgi/9pKk6qDfLPDBVfTT8Hi4a3RPryQznpW0KbuLIe/hlQK7Re9Q==
X-Received: by 2002:a05:6000:ce:: with SMTP id
 q14mr19249973wrx.277.1607784098427; 
 Sat, 12 Dec 2020 06:41:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w3sm20146993wma.3.2020.12.12.06.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Dec 2020 06:41:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/sparc: Make grlib-irqmp device handle its own inbound
 IRQ lines
Date: Sat, 12 Dec 2020 14:41:33 +0000
Message-Id: <20201212144134.29594-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212144134.29594-1-peter.maydell@linaro.org>
References: <20201212144134.29594-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the GRLIB_IRQMP device is used in one place (the leon3 board),
but instead of the device providing inbound gpio lines for the board
to wire up, the board code itself calls qemu_allocate_irqs() with
the handler function being a set_irq function defined in the code
for the device.

Refactor this into the standard setup of a device having input
gpio lines.

This fixes a trivial Coverity memory leak report (the leon3
board code leaks the IRQ array returned from qemu_allocate_irqs()).

Fixes: Coverity CID 1421922
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/sparc/grlib.h |  2 --
 hw/intc/grlib_irqmp.c    |  5 ++++-
 hw/sparc/leon3.c         | 21 +++++++++------------
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
index 78b6178fcd8..e1d1beaa73f 100644
--- a/include/hw/sparc/grlib.h
+++ b/include/hw/sparc/grlib.h
@@ -36,8 +36,6 @@
 
 typedef void (*set_pil_in_fn) (void *opaque, uint32_t pil_in);
 
-void grlib_irqmp_set_irq(void *opaque, int irq, int level);
-
 void grlib_irqmp_ack(DeviceState *dev, int intno);
 
 /* GPTimer */
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index ffec4a07eec..984334fa7bf 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -51,6 +51,8 @@
 #define FORCE_OFFSET     0x80
 #define EXTENDED_OFFSET  0xC0
 
+#define MAX_PILS 16
+
 OBJECT_DECLARE_SIMPLE_TYPE(IRQMP, GRLIB_IRQMP)
 
 typedef struct IRQMPState IRQMPState;
@@ -126,7 +128,7 @@ void grlib_irqmp_ack(DeviceState *dev, int intno)
     grlib_irqmp_ack_mask(state, mask);
 }
 
-void grlib_irqmp_set_irq(void *opaque, int irq, int level)
+static void grlib_irqmp_set_irq(void *opaque, int irq, int level)
 {
     IRQMP      *irqmp = GRLIB_IRQMP(opaque);
     IRQMPState *s;
@@ -328,6 +330,7 @@ static void grlib_irqmp_init(Object *obj)
     IRQMP *irqmp = GRLIB_IRQMP(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
+    qdev_init_gpio_in(DEVICE(obj), grlib_irqmp_set_irq, MAX_PILS);
     qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1);
     memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp,
                           "irqmp", IRQMP_REG_SIZE);
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 4bc4ebea841..7e16eea9e67 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -52,8 +52,6 @@
 #define LEON3_PROM_OFFSET    (0x00000000)
 #define LEON3_RAM_OFFSET     (0x40000000)
 
-#define MAX_PILS 16
-
 #define LEON3_UART_OFFSET  (0x80000100)
 #define LEON3_UART_IRQ     (3)
 
@@ -194,11 +192,10 @@ static void leon3_generic_hw_init(MachineState *machine)
     MemoryRegion *prom = g_new(MemoryRegion, 1);
     int         ret;
     char       *filename;
-    qemu_irq   *cpu_irqs = NULL;
     int         bios_size;
     int         prom_size;
     ResetData  *reset_info;
-    DeviceState *dev;
+    DeviceState *dev, *irqmpdev;
     int i;
     AHBPnp *ahb_pnp;
     APBPnp *apb_pnp;
@@ -230,16 +227,15 @@ static void leon3_generic_hw_init(MachineState *machine)
                             GRLIB_AHB_SLAVE, GRLIB_AHBMEM_AREA);
 
     /* Allocate IRQ manager */
-    dev = qdev_new(TYPE_GRLIB_IRQMP);
+    irqmpdev = qdev_new(TYPE_GRLIB_IRQMP);
     qdev_init_gpio_in_named_with_opaque(DEVICE(cpu), leon3_set_pil_in,
                                         env, "pil", 1);
-    qdev_connect_gpio_out_named(dev, "grlib-irq", 0,
+    qdev_connect_gpio_out_named(irqmpdev, "grlib-irq", 0,
                                 qdev_get_gpio_in_named(DEVICE(cpu), "pil", 0));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_IRQMP_OFFSET);
-    env->irq_manager = dev;
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(irqmpdev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(irqmpdev), 0, LEON3_IRQMP_OFFSET);
+    env->irq_manager = irqmpdev;
     env->qemu_irq_ack = leon3_irq_manager;
-    cpu_irqs = qemu_allocate_irqs(grlib_irqmp_set_irq, dev, MAX_PILS);
     grlib_apb_pnp_add_entry(apb_pnp, LEON3_IRQMP_OFFSET, 0xFFF,
                             GRLIB_VENDOR_GAISLER, GRLIB_IRQMP_DEV,
                             2, 0, GRLIB_APBIO_AREA);
@@ -330,7 +326,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_TIMER_OFFSET);
     for (i = 0; i < LEON3_TIMER_COUNT; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-                           cpu_irqs[LEON3_TIMER_IRQ + i]);
+                           qdev_get_gpio_in(irqmpdev, LEON3_TIMER_IRQ + i));
     }
 
     grlib_apb_pnp_add_entry(apb_pnp, LEON3_TIMER_OFFSET, 0xFFF,
@@ -342,7 +338,8 @@ static void leon3_generic_hw_init(MachineState *machine)
     qdev_prop_set_chr(dev, "chrdev", serial_hd(0));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_UART_OFFSET);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irqs[LEON3_UART_IRQ]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
+                       qdev_get_gpio_in(irqmpdev, LEON3_UART_IRQ));
     grlib_apb_pnp_add_entry(apb_pnp, LEON3_UART_OFFSET, 0xFFF,
                             GRLIB_VENDOR_GAISLER, GRLIB_APBUART_DEV, 1,
                             LEON3_UART_IRQ, GRLIB_APBIO_AREA);
-- 
2.20.1


