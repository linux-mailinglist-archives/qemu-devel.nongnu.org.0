Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1815F2EBD80
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:10:21 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7dr-0008P4-P9
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7Ze-0004dZ-3Z
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:05:59 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57840
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7ZZ-0002B5-6s
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:05:57 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7Zb-0006Sn-5k; Wed, 06 Jan 2021 12:05:59 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  6 Jan 2021 12:05:24 +0000
Message-Id: <20210106120526.29857-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
References: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 2/4] hw/sparc: Make grlib-irqmp device handle its own inbound
 IRQ lines
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Message-Id: <20201212144134.29594-2-peter.maydell@linaro.org>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/intc/grlib_irqmp.c    |  5 ++++-
 hw/sparc/leon3.c         | 21 +++++++++------------
 include/hw/sparc/grlib.h |  2 --
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index ffec4a07ee..984334fa7b 100644
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
index 4bc4ebea84..7e16eea9e6 100644
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
diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
index 78b6178fcd..e1d1beaa73 100644
--- a/include/hw/sparc/grlib.h
+++ b/include/hw/sparc/grlib.h
@@ -36,8 +36,6 @@
 
 typedef void (*set_pil_in_fn) (void *opaque, uint32_t pil_in);
 
-void grlib_irqmp_set_irq(void *opaque, int irq, int level);
-
 void grlib_irqmp_ack(DeviceState *dev, int intno);
 
 /* GPTimer */
-- 
2.20.1


