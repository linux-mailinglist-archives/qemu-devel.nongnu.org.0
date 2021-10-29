Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35D440504
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:43:20 +0200 (CEST)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZeh-0006bA-PQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJ5-0007JB-2Z
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJ2-0005aV-54
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:20:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 758A275621D;
 Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AC920756192; Fri, 29 Oct 2021 23:20:43 +0200 (CEST)
Message-Id: <92902ba34fdf2c8c62232365fbb6531b1036d557.1635541329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 13/30] hw/char/sh_serial: QOM-ify
Date: Fri, 29 Oct 2021 23:02:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/char/sh_serial.c | 98 +++++++++++++++++++++++++++------------------
 hw/sh4/sh7750.c     | 56 +++++++++++++++++++-------
 include/hw/sh4/sh.h |  9 +----
 3 files changed, 101 insertions(+), 62 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 80a548d19d..808d4ebae7 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -26,7 +26,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "hw/sh4/sh.h"
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
@@ -42,10 +46,10 @@
 
 #define SH_RX_FIFO_LENGTH (16)
 
-typedef struct {
-    MemoryRegion iomem;
-    MemoryRegion iomem_p4;
-    MemoryRegion iomem_a7;
+OBJECT_DECLARE_SIMPLE_TYPE(SHSerialState, SH_SERIAL)
+
+struct SHSerialState {
+    SysBusDevice parent;
     uint8_t smr;
     uint8_t brr;
     uint8_t scr;
@@ -59,8 +63,7 @@ typedef struct {
     uint8_t rx_tail;
     uint8_t rx_head;
 
-    int freq;
-    int feat;
+    uint8_t feat;
     int flags;
     int rtrg;
 
@@ -73,7 +76,11 @@ typedef struct {
     qemu_irq txi;
     qemu_irq tei;
     qemu_irq bri;
-} SHSerialState;
+};
+
+typedef struct {} SHSerialStateClass;
+
+OBJECT_DEFINE_TYPE(SHSerialState, sh_serial, SH_SERIAL, SYS_BUS_DEVICE)
 
 static void sh_serial_clear_fifo(SHSerialState *s)
 {
@@ -381,8 +388,10 @@ static const MemoryRegionOps sh_serial_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void sh_serial_reset(SHSerialState *s)
+static void sh_serial_reset(DeviceState *dev)
 {
+    SHSerialState *s = SH_SERIAL(dev);
+
     s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
     s->rtrg = 1;
 
@@ -400,33 +409,21 @@ static void sh_serial_reset(SHSerialState *s)
     sh_serial_clear_fifo(s);
 }
 
-void sh_serial_init(MemoryRegion *sysmem,
-                    hwaddr base, int feat,
-                    uint32_t freq, Chardev *chr,
-                    qemu_irq eri_source,
-                    qemu_irq rxi_source,
-                    qemu_irq txi_source,
-                    qemu_irq tei_source,
-                    qemu_irq bri_source)
+static void sh_serial_realize(DeviceState *d, Error **errp)
 {
-    SHSerialState *s = g_malloc0(sizeof(*s));
-
-    s->feat = feat;
-    sh_serial_reset(s);
-
-    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
-                          "serial", 0x100000000ULL);
-
-    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4", &s->iomem,
-                             0, 0x28);
-    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
-
-    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7", &s->iomem,
-                             0, 0x28);
-    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
-
-    if (chr) {
-        qemu_chr_fe_init(&s->chr, chr, &error_abort);
+    SHSerialState *s = SH_SERIAL(d);
+    MemoryRegion *iomem = g_malloc(sizeof(*iomem));
+
+    assert(d->id);
+    memory_region_init_io(iomem, OBJECT(d), &sh_serial_ops, s, d->id, 0x28);
+    sysbus_init_mmio(SYS_BUS_DEVICE(d), iomem);
+    qdev_init_gpio_out_named(d, &s->eri, "eri", 1);
+    qdev_init_gpio_out_named(d, &s->rxi, "rxi", 1);
+    qdev_init_gpio_out_named(d, &s->txi, "txi", 1);
+    qdev_init_gpio_out_named(d, &s->tei, "tei", 1);
+    qdev_init_gpio_out_named(d, &s->bri, "bri", 1);
+
+    if (qemu_chr_fe_backend_connected(&s->chr)) {
         qemu_chr_fe_set_handlers(&s->chr, sh_serial_can_receive1,
                                  sh_serial_receive1,
                                  sh_serial_event, NULL, s, NULL, true);
@@ -435,9 +432,32 @@ void sh_serial_init(MemoryRegion *sysmem,
     timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
                   sh_serial_timeout_int, s);
     s->etu = NANOSECONDS_PER_SECOND / 9600;
-    s->eri = eri_source;
-    s->rxi = rxi_source;
-    s->txi = txi_source;
-    s->tei = tei_source;
-    s->bri = bri_source;
+}
+
+static void sh_serial_finalize(Object *obj)
+{
+    SHSerialState *s = SH_SERIAL(obj);
+
+    timer_del(&s->fifo_timeout_timer);
+}
+
+static void sh_serial_init(Object *obj)
+{
+}
+
+static Property sh_serial_properties[] = {
+    DEFINE_PROP_CHR("chardev", SHSerialState, chr),
+    DEFINE_PROP_UINT8("features", SHSerialState, feat, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void sh_serial_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    device_class_set_props(dc, sh_serial_properties);
+    dc->realize = sh_serial_realize;
+    dc->reset = sh_serial_reset;
+    /* Reason: part of SuperH CPU/SoC, needs to be wired up */
+    dc->user_creatable = false;
 }
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 6c702d627c..7b21f1ce44 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -24,9 +24,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "sh7750_regs.h"
 #include "sh7750_regnames.h"
 #include "hw/sh4/sh_intc.h"
@@ -762,6 +766,9 @@ static const MemoryRegionOps sh7750_mmct_ops = {
 SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
+    DeviceState *dev;
+    SysBusDevice *sb;
+    MemoryRegion *mr, *alias;
 
     s = g_malloc0(sizeof(SH7750State));
     s->cpu = cpu;
@@ -807,21 +814,40 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
     cpu->env.intc_handle = &s->intc;
 
-    sh_serial_init(sysmem, 0x1fe00000,
-                   0, s->periph_freq, serial_hd(0),
-                   s->intc.irqs[SCI1_ERI],
-                   s->intc.irqs[SCI1_RXI],
-                   s->intc.irqs[SCI1_TXI],
-                   s->intc.irqs[SCI1_TEI],
-                   NULL);
-    sh_serial_init(sysmem, 0x1fe80000,
-                   SH_SERIAL_FEAT_SCIF,
-                   s->periph_freq, serial_hd(1),
-                   s->intc.irqs[SCIF_ERI],
-                   s->intc.irqs[SCIF_RXI],
-                   s->intc.irqs[SCIF_TXI],
-                   NULL,
-                   s->intc.irqs[SCIF_BRI]);
+    /* SCI */
+    dev = qdev_new(TYPE_SH_SERIAL);
+    dev->id = (char *)"sci";
+    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    sb = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sb, &error_fatal);
+    sysbus_mmio_map(sb, 0, 0xffe00000);
+    alias = g_malloc(sizeof(*alias));
+    mr = sysbus_mmio_get_region(sb, 0);
+    memory_region_init_alias(alias, OBJECT(dev), "sci-a7", mr,
+                             0, memory_region_size(mr));
+    memory_region_add_subregion(sysmem, A7ADDR(0xffe00000), alias);
+    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCI1_ERI]);
+    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCI1_RXI]);
+    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCI1_TXI]);
+    qdev_connect_gpio_out_named(dev, "tei", 0, s->intc.irqs[SCI1_TEI]);
+
+    /* SCIF */
+    dev = qdev_new(TYPE_SH_SERIAL);
+    dev->id =  (char *)"scif";
+    qdev_prop_set_chr(dev, "chardev", serial_hd(1));
+    qdev_prop_set_uint8(dev, "features", SH_SERIAL_FEAT_SCIF);
+    sb = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sb, &error_fatal);
+    sysbus_mmio_map(sb, 0, 0xffe80000);
+    alias = g_malloc(sizeof(*alias));
+    mr = sysbus_mmio_get_region(sb, 0);
+    memory_region_init_alias(alias, OBJECT(dev), "scif-a7", mr,
+                             0, memory_region_size(mr));
+    memory_region_add_subregion(sysmem, A7ADDR(0xffe80000), alias);
+    qdev_connect_gpio_out_named(dev, "eri", 0, s->intc.irqs[SCIF_ERI]);
+    qdev_connect_gpio_out_named(dev, "rxi", 0, s->intc.irqs[SCIF_RXI]);
+    qdev_connect_gpio_out_named(dev, "txi", 0, s->intc.irqs[SCIF_TXI]);
+    qdev_connect_gpio_out_named(dev, "bri", 0, s->intc.irqs[SCIF_BRI]);
 
     tmu012_init(sysmem, 0x1fd80000,
                 TMU012_FEAT_TOCR | TMU012_FEAT_3CHAN | TMU012_FEAT_EXTCLK,
diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index 366cedcda0..ec716cdd45 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -54,15 +54,8 @@ int sh7750_register_io_device(struct SH7750State *s,
                               sh7750_io_device *device);
 
 /* sh_serial.c */
+#define TYPE_SH_SERIAL "sh-serial"
 #define SH_SERIAL_FEAT_SCIF (1 << 0)
-void sh_serial_init(MemoryRegion *sysmem,
-                    hwaddr base, int feat,
-                    uint32_t freq, Chardev *chr,
-                    qemu_irq eri_source,
-                    qemu_irq rxi_source,
-                    qemu_irq txi_source,
-                    qemu_irq tei_source,
-                    qemu_irq bri_source);
 
 /* sh7750.c */
 qemu_irq sh7750_irl(struct SH7750State *s);
-- 
2.21.4


