Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441EC4E4F0E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 10:19:52 +0100 (CET)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWx9i-0000pd-Sb
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 05:19:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1nWx7D-0008Px-Lp
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:17:15 -0400
Received: from exmail.andestech.com ([60.248.187.195]:39548
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1nWx78-0002Qq-Pw
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:17:14 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 22N9Gtem054560;
 Wed, 23 Mar 2022 17:16:55 +0800 (+08)
 (envelope-from dylan@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 23 Mar 2022 17:16:52 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH] hw/char/serial: Support serial_mm_init() with wakeup event.
Date: Wed, 23 Mar 2022 17:16:37 +0800
Message-ID: <20220323091637.5609-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1.390.g2ae0a9cb82
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 22N9Gtem054560
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Dylan Jhong <dylan@andestech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although the "wakeup" parameter is declared in SerialState,
but there is no function actually setting it up.
Support "wakeup" as parameter in serial_mm_init().

We also add a new parameter "wakeup_reason" to let users specify
their own wakeup event id.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 hw/arm/allwinner-a10.c              |  4 +++-
 hw/arm/allwinner-h3.c               | 13 +++++++++----
 hw/arm/aspeed_ast2600.c             |  4 +++-
 hw/arm/aspeed_soc.c                 |  4 +++-
 hw/arm/kzm.c                        |  4 +++-
 hw/arm/msf2-soc.c                   |  4 +++-
 hw/arm/musicpal.c                   |  6 ++++--
 hw/arm/npcm7xx.c                    |  4 +++-
 hw/arm/pxa2xx.c                     |  7 +++++--
 hw/char/omap_uart.c                 |  7 +++++--
 hw/char/serial.c                    |  9 +++++++--
 hw/hppa/lasi.c                      |  3 ++-
 hw/hppa/machine.c                   |  3 ++-
 hw/microblaze/petalogix_ml605_mmu.c |  3 ++-
 hw/mips/boston.c                    |  3 ++-
 hw/mips/jazz.c                      |  7 +++++--
 hw/mips/loongson3_virt.c            |  2 +-
 hw/mips/malta.c                     |  3 ++-
 hw/nios2/10m50_devboard.c           |  4 +++-
 hw/openrisc/openrisc_sim.c          |  4 +++-
 hw/ppc/e500.c                       |  6 ++++--
 hw/ppc/ppc405_uc.c                  |  7 +++++--
 hw/ppc/ppc440_bamboo.c              |  7 +++++--
 hw/ppc/sam460ex.c                   |  7 +++++--
 hw/ppc/virtex_ml507.c               |  4 +++-
 hw/riscv/virt.c                     |  4 +++-
 hw/sparc64/niagara.c                |  4 +++-
 hw/sparc64/sun4u.c                  |  3 ++-
 hw/xtensa/xtfpga.c                  |  3 ++-
 include/hw/char/serial.h            |  4 +++-
 30 files changed, 105 insertions(+), 42 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 05e84728cb..739aa9e535 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -21,6 +21,7 @@
 #include "hw/sysbus.h"
 #include "hw/arm/allwinner-a10.h"
 #include "hw/misc/unimp.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/usb/hcd-ohci.h"
@@ -124,7 +125,8 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     /* FIXME use a qdev chardev prop instead of serial_hd() */
     serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2,
                    qdev_get_gpio_in(dev, 1),
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     if (machine_usb(current_machine)) {
         int i;
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 318ed4348c..2801c2075f 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -28,6 +28,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/loader.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/allwinner-h3.h"
 
@@ -399,19 +400,23 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     /* UART0. For future clocktree API: All UARTS are connected to APB2_CLK. */
     serial_mm_init(get_system_memory(), s->memmap[AW_H3_DEV_UART0], 2,
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART0),
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
     /* UART1 */
     serial_mm_init(get_system_memory(), s->memmap[AW_H3_DEV_UART1], 2,
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART1),
-                   115200, serial_hd(1), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(1), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
     /* UART2 */
     serial_mm_init(get_system_memory(), s->memmap[AW_H3_DEV_UART2], 2,
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART2),
-                   115200, serial_hd(2), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(2), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
     /* UART3 */
     serial_mm_init(get_system_memory(), s->memmap[AW_H3_DEV_UART3], 2,
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART3),
-                   115200, serial_hd(3), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(3), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* DRAMC */
     sysbus_realize(SYS_BUS_DEVICE(&s->dramc), &error_fatal);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c1e15e3773..c3773253f5 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -16,6 +16,7 @@
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "net/net.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
@@ -350,7 +351,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     /* UART - attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 58714cb2a0..3215f00cc9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -19,6 +19,7 @@
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "net/net.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
@@ -300,7 +301,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     /* UART - attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index b1b281c9ac..fdcd75e68a 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -23,6 +23,7 @@
 #include "hw/net/lan9118.h"
 #include "hw/char/serial.h"
 #include "sysemu/qtest.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "qemu/cutils.h"
 
@@ -120,7 +121,8 @@ static void kzm_init(MachineState *machine)
     if (serial_hd(2)) { /* touchscreen */
         serial_mm_init(get_system_memory(), KZM_FPGA_ADDR+0x10, 0,
                        qdev_get_gpio_in(DEVICE(&s->soc.avic), 52),
-                       14745600, serial_hd(2), DEVICE_NATIVE_ENDIAN);
+                       14745600, serial_hd(2), DEVICE_NATIVE_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
 
     kzm_binfo.ram_size = machine->ram_size;
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index b5fe9f364d..ad22ee88b5 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -30,6 +30,7 @@
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
 #include "hw/qdev-clock.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
 #define MSF2_TIMER_BASE       0x40004000
@@ -148,7 +149,8 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         if (serial_hd(i)) {
             serial_mm_init(get_system_memory(), uart_addr[i], 2,
                            qdev_get_gpio_in(armv7m, uart_irq[i]),
-                           115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
+                           115200, serial_hd(i), DEVICE_NATIVE_ENDIAN,
+                           false, QEMU_WAKEUP_REASON_NONE);
         }
     }
 
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 7c840fb428..cc274bcc52 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1253,10 +1253,12 @@ static void musicpal_init(MachineState *machine)
 
     serial_mm_init(address_space_mem, MP_UART1_BASE, 2,
                    qdev_get_gpio_in(uart_orgate, 0),
-                   1825000, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   1825000, serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
     serial_mm_init(address_space_mem, MP_UART2_BASE, 2,
                    qdev_get_gpio_in(uart_orgate, 1),
-                   1825000, serial_hd(1), DEVICE_NATIVE_ENDIAN);
+                   1825000, serial_hd(1), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* Register flash */
     dinfo = drive_get(IF_PFLASH, 0, 0);
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc02765..20ad1ba1b7 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -25,6 +25,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/units.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
 /*
@@ -563,7 +564,8 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < ARRAY_SIZE(npcm7xx_uart_addr); i++) {
         serial_mm_init(get_system_memory(), npcm7xx_uart_addr[i], 2,
                        npcm7xx_irq(s, NPCM7XX_UART0_IRQ + i), 115200,
-                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
+                       serial_hd(i), DEVICE_LITTLE_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
 
     /* Random Number Generator. Cannot fail. */
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index a6f938f115..624a5a348a 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -27,6 +27,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
 #include "sysemu/rtc.h"
+#include "sysemu/runstate.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qom/object.h"
@@ -2153,7 +2154,8 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
             serial_mm_init(address_space, pxa270_serial[i].io_base, 2,
                            qdev_get_gpio_in(s->pic, pxa270_serial[i].irqn),
                            14857000 / 16, serial_hd(i),
-                           DEVICE_NATIVE_ENDIAN);
+                           DEVICE_NATIVE_ENDIAN,
+                           false, QEMU_WAKEUP_REASON_NONE);
         } else {
             break;
         }
@@ -2286,7 +2288,8 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
             serial_mm_init(address_space, pxa255_serial[i].io_base, 2,
                            qdev_get_gpio_in(s->pic, pxa255_serial[i].irqn),
                            14745600 / 16, serial_hd(i),
-                           DEVICE_NATIVE_ENDIAN);
+                           DEVICE_NATIVE_ENDIAN,
+                           false, QEMU_WAKEUP_REASON_NONE);
         } else {
             break;
         }
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index e8da933378..0fd9f3f933 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -22,6 +22,7 @@
 #include "hw/arm/omap.h"
 #include "hw/char/serial.h"
 #include "exec/address-spaces.h"
+#include "sysemu/runstate.h"
 
 /* UARTs */
 struct omap_uart_s {
@@ -63,7 +64,8 @@ struct omap_uart_s *omap_uart_init(hwaddr base,
     s->serial = serial_mm_init(get_system_memory(), base, 2, irq,
                                omap_clk_getrate(fclk)/16,
                                chr ?: qemu_chr_new(label, "null", NULL),
-                               DEVICE_NATIVE_ENDIAN);
+                               DEVICE_NATIVE_ENDIAN,
+                               false, QEMU_WAKEUP_REASON_NONE);
     return s;
 }
 
@@ -183,5 +185,6 @@ void omap_uart_attach(struct omap_uart_s *s, Chardev *chr)
     s->serial = serial_mm_init(get_system_memory(), s->base, 2, s->irq,
                                omap_clk_getrate(s->fclk) / 16,
                                chr ?: qemu_chr_new("null", "null", NULL),
-                               DEVICE_NATIVE_ENDIAN);
+                               DEVICE_NATIVE_ENDIAN,
+                               false, QEMU_WAKEUP_REASON_NONE);
 }
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7061aacbce..6861e66700 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -602,7 +602,7 @@ static void serial_receive1(void *opaque, const uint8_t *buf, int size)
     SerialState *s = opaque;
 
     if (s->wakeup) {
-        qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
+        qemu_system_wakeup_request(s->wakeup_reason, NULL);
     }
     if(s->fcr & UART_FCR_FE) {
         int i;
@@ -972,6 +972,8 @@ static Property serial_properties[] = {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
     DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
     DEFINE_PROP_BOOL("wakeup", SerialState, wakeup, false),
+    DEFINE_PROP_UINT32("wakeup-reason", SerialState,
+                       wakeup_reason, QEMU_WAKEUP_REASON_OTHER),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1062,7 +1064,8 @@ static const VMStateDescription vmstate_serial_mm = {
 SerialMM *serial_mm_init(MemoryRegion *address_space,
                          hwaddr base, int regshift,
                          qemu_irq irq, int baudbase,
-                         Chardev *chr, enum device_endian end)
+                         Chardev *chr, enum device_endian end,
+                         bool wakeup, uint32_t wakeup_reason)
 {
     SerialMM *smm = SERIAL_MM(qdev_new(TYPE_SERIAL_MM));
     MemoryRegion *mr;
@@ -1072,6 +1075,8 @@ SerialMM *serial_mm_init(MemoryRegion *address_space,
     qdev_prop_set_chr(DEVICE(smm), "chardev", chr);
     qdev_set_legacy_instance_id(DEVICE(smm), base, 2);
     qdev_prop_set_uint8(DEVICE(smm), "endianness", end);
+    qdev_prop_set_bit(DEVICE(smm), "wakeup", wakeup);
+    qdev_prop_set_uint32(DEVICE(smm), "wakeup-reason", wakeup_reason);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(smm), &error_fatal);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(smm), 0, irq);
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 88c3791eb6..7b23ea7842 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -334,7 +334,8 @@ DeviceState *lasi_init(MemoryRegion *address_space)
                 lasi_get_irq(LASI_UART_HPA));
         serial_mm_init(address_space, LASI_UART_HPA + 0x800, 0,
                 serial_irq, 8000000 / 16,
-                serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                false, QEMU_WAKEUP_REASON_NONE);
     }
 
     /* PS/2 Keyboard/Mouse */
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 98b30e0395..2ba39d39b2 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -181,7 +181,8 @@ static void machine_hppa_init(MachineState *machine)
     if (serial_hd(0)) {
         uint32_t addr = DINO_UART_HPA + 0x800;
         serial_mm_init(addr_space, addr, 0, serial_irq,
-                       115200, serial_hd(0), DEVICE_BIG_ENDIAN);
+                       115200, serial_hd(0), DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
 
     /* fw_cfg configuration interface */
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index a24fadddca..628f0d3236 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -32,6 +32,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/block/flash.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
@@ -122,7 +123,7 @@ petalogix_ml605_init(MachineState *machine)
 
     serial_mm_init(address_space_mem, UART16550_BASEADDR + 0x1000, 2,
                    irq[UART16550_IRQ], 115200, serial_hd(0),
-                   DEVICE_LITTLE_ENDIAN);
+                   DEVICE_LITTLE_ENDIAN, false, QEMU_WAKEUP_REASON_NONE);
 
     /* 2 timers at irq 2 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 59ca08b93a..a82a8dac8e 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -749,7 +749,8 @@ static void boston_mach_init(MachineState *machine)
 
     s->uart = serial_mm_init(sys_mem, boston_memmap[BOSTON_UART].base, 2,
                              get_cps_irq(&s->cps, 3), 10000000,
-                             serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                             serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                             false, QEMU_WAKEUP_REASON_NONE);
 
     lcd = g_new(MemoryRegion, 1);
     memory_region_init_io(lcd, NULL, &boston_lcd_ops, s, "boston-lcd", 0x8);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 44f0d48bfd..27da2f5bf7 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -49,6 +49,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/help_option.h"
@@ -369,10 +370,12 @@ static void mips_jazz_init(MachineState *machine,
     /* Serial ports */
     serial_mm_init(address_space, 0x80006000, 0,
                    qdev_get_gpio_in(rc4030, 8), 8000000 / 16,
-                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
     serial_mm_init(address_space, 0x80007000, 0,
                    qdev_get_gpio_in(rc4030, 9), 8000000 / 16,
-                   serial_hd(1), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(1), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* Parallel port */
     if (parallel_hds[0])
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index ae192db0c8..e6740f3a3a 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -521,7 +521,7 @@ static void mips_loongson3_virt_init(MachineState *machine)
 
     serial_mm_init(address_space_mem, virt_memmap[VIRT_UART].base, 0,
                    qdev_get_gpio_in(liointc, UART_IRQ), 115200, serial_hd(0),
-                   DEVICE_NATIVE_ENDIAN);
+                   DEVICE_NATIVE_ENDIAN, false, QEMU_WAKEUP_REASON_NONE);
 
     sysbus_create_simple("goldfish_rtc", virt_memmap[VIRT_RTC].base,
                          qdev_get_gpio_in(liointc, RTC_IRQ));
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 6288511723..085e65ecb7 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -587,7 +587,8 @@ static MaltaFPGAState *malta_fpga_init(MemoryRegion *address_space,
                              malta_fgpa_display_event, NULL, s, NULL, true);
 
     s->uart = serial_mm_init(address_space, base + 0x900, 3, uart_irq,
-                             230400, uart_chr, DEVICE_NATIVE_ENDIAN);
+                             230400, uart_chr, DEVICE_NATIVE_ENDIAN,
+                             false, QEMU_WAKEUP_REASON_NONE);
 
     malta_fpga_reset(s);
     qemu_register_reset(malta_fpga_reset, s);
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 3d1205b8bd..d5f8e3912d 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "exec/memory.h"
@@ -80,7 +81,8 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
 
     /* Register: Altera 16550 UART */
     serial_mm_init(address_space_mem, 0xf8001600, 2, irq[1], 115200,
-                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* Register: Timer sys_clk_timer  */
     dev = qdev_new("ALTR.timer");
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 8184caa60b..4e93cadecf 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -35,6 +35,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "hw/core/split-irq.h"
 
 #include <libfdt.h>
@@ -258,7 +259,8 @@ static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
         serial_irq = get_cpu_irq(cpus, 0, irq_pin);
     }
     serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
-                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* Add device tree node for serial. */
     nodename = g_strdup_printf("/serial@%" HWADDR_PRIx, base);
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c7e6767f91..ba4c85abbc 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -934,13 +934,15 @@ void ppce500_init(MachineState *machine)
     if (serial_hd(0)) {
         serial_mm_init(ccsr_addr_space, MPC8544_SERIAL0_REGS_OFFSET,
                        0, qdev_get_gpio_in(mpicdev, 42), 399193,
-                       serial_hd(0), DEVICE_BIG_ENDIAN);
+                       serial_hd(0), DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
 
     if (serial_hd(1)) {
         serial_mm_init(ccsr_addr_space, MPC8544_SERIAL1_REGS_OFFSET,
                        0, qdev_get_gpio_in(mpicdev, 42), 399193,
-                       serial_hd(1), DEVICE_BIG_ENDIAN);
+                       serial_hd(1), DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
         /* I2C */
     dev = qdev_new("mpc-i2c");
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 36c8ba6f3c..beb90ba439 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -34,6 +34,7 @@
 #include "hw/char/serial.h"
 #include "qemu/timer.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "hw/intc/ppc-uic.h"
@@ -1498,13 +1499,15 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
         serial_mm_init(address_space_mem, 0xef600300, 0,
                        qdev_get_gpio_in(uicdev, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
+                       DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
     if (serial_hd(1) != NULL) {
         serial_mm_init(address_space_mem, 0xef600400, 0,
                        qdev_get_gpio_in(uicdev, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
+                       DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
     /* OCM */
     ppc405_ocm_init(env);
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 7fb620b9a0..be071d1680 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -30,6 +30,7 @@
 #include "ppc405.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "hw/sysbus.h"
 #include "hw/intc/ppc-uic.h"
 #include "hw/qdev-properties.h"
@@ -238,13 +239,15 @@ static void bamboo_init(MachineState *machine)
         serial_mm_init(address_space_mem, 0xef600300, 0,
                        qdev_get_gpio_in(uicdev, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
+                       DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
     if (serial_hd(1) != NULL) {
         serial_mm_init(address_space_mem, 0xef600400, 0,
                        qdev_get_gpio_in(uicdev, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
+                       DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
 
     if (pcibus) {
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0737234d66..424348c66f 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -30,6 +30,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "hw/i2c/ppc4xx_i2c.h"
@@ -438,13 +439,15 @@ static void sam460ex_init(MachineState *machine)
         serial_mm_init(address_space_mem, 0x4ef600300, 0,
                        qdev_get_gpio_in(uic[1], 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
-                       DEVICE_BIG_ENDIAN);
+                       DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
     if (serial_hd(1) != NULL) {
         serial_mm_init(address_space_mem, 0x4ef600400, 0,
                        qdev_get_gpio_in(uic[0], 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
-                       DEVICE_BIG_ENDIAN);
+                       DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
     }
 
     /* Load U-Boot image. */
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 9c575403b8..135c06f505 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -32,6 +32,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "hw/boards.h"
 #include "sysemu/device_tree.h"
 #include "hw/loader.h"
@@ -248,7 +249,8 @@ static void virtex_init(MachineState *machine)
     }
 
     serial_mm_init(address_space_mem, UART16550_BASEADDR, 2, irq[UART16550_IRQ],
-                   115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                   115200, serial_hd(0), DEVICE_LITTLE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..8902d9ca15 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -39,6 +39,7 @@
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "hw/pci/pci.h"
@@ -1404,7 +1405,8 @@ static void virt_machine_init(MachineState *machine)
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
-        serial_hd(0), DEVICE_LITTLE_ENDIAN);
+        serial_hd(0), DEVICE_LITTLE_ENDIAN,
+        false, QEMU_WAKEUP_REASON_NONE);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index ccad2c43a3..47f78624a8 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -34,6 +34,7 @@
 #include "sysemu/block-backend.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
+#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 
@@ -151,7 +152,8 @@ static void niagara_init(MachineState *machine)
         }
     }
     serial_mm_init(sysmem, NIAGARA_UART_BASE, 0, NULL,
-                   115200, serial_hd(0), DEVICE_BIG_ENDIAN);
+                   115200, serial_hd(0), DEVICE_BIG_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
     create_unimplemented_device("sun4v-iob", NIAGARA_IOBBASE, NIAGARA_IOBSIZE);
     sun4v_rtc_init(NIAGARA_RTC_BASE);
 }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index cda7df36e3..09c2716fa4 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -326,7 +326,8 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     i = 0;
     if (s->console_serial_base) {
         serial_mm_init(pci_address_space(pci_dev), s->console_serial_base,
-                       0, NULL, 115200, serial_hd(i), DEVICE_BIG_ENDIAN);
+                       0, NULL, 115200, serial_hd(i), DEVICE_BIG_ENDIAN,
+                       false, QEMU_WAKEUP_REASON_NONE);
         i++;
     }
     serial_hds_isa_init(s->isa_bus, i, MAX_ISA_SERIAL_PORTS);
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index c1e004e882..e50aa646b7 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -312,7 +312,8 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     }
 
     serial_mm_init(system_io, 0x0d050020, 2, extints[0],
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN,
+                   false, QEMU_WAKEUP_REASON_NONE);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (dinfo) {
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 8ba7eca3d6..5d861094d4 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -62,6 +62,7 @@ struct SerialState {
     uint32_t tsr_retry;
     guint watch_tag;
     bool wakeup;
+    uint32_t wakeup_reason;
 
     /* Time when the last byte was successfully sent out of the tsr */
     uint64_t last_xmit_ts;
@@ -104,7 +105,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(SerialMM, SERIAL_MM)
 SerialMM *serial_mm_init(MemoryRegion *address_space,
                          hwaddr base, int regshift,
                          qemu_irq irq, int baudbase,
-                         Chardev *chr, enum device_endian end);
+                         Chardev *chr, enum device_endian end,
+                         bool wakeup, uint32_t wakeup_reason);
 
 /* serial-isa.c */
 
-- 
2.34.1.390.g2ae0a9cb82


