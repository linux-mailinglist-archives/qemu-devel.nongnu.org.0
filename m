Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7543CCCE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:54:08 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkJa-0003g1-Rt
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjS5-0003tm-CC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:28126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjRz-0004Tw-RN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0FDD1756194;
 Wed, 27 Oct 2021 15:58:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB40775604D; Wed, 27 Oct 2021 15:58:41 +0200 (CEST)
Message-Id: <6fd93d725fb78049b395eac1dcb06fb5fe5e46b4.1635342377.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635342377.git.balaton@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 06/11] hw/char/sh_serial: QOM-ify
Date: Wed, 27 Oct 2021 15:46:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/char/sh_serial.c | 107 +++++++++++++++++++++++++++-----------------
 hw/sh4/sh7750.c     |  62 ++++++++++++++++++-------
 include/hw/sh4/sh.h |   9 +---
 3 files changed, 114 insertions(+), 64 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 6d02e0ad11..ad576b693b 100644
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
@@ -59,13 +63,12 @@ typedef struct {
     uint8_t rx_tail;
     uint8_t rx_head;
 
-    int freq;
-    int feat;
+    uint8_t feat;
     int flags;
     int rtrg;
 
     CharBackend chr;
-    QEMUTimer *fifo_timeout_timer;
+    QEMUTimer fifo_timeout_timer;
     uint64_t etu; /* Elementary Time Unit (ns) */
 
     qemu_irq eri;
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
@@ -353,11 +360,11 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
                 if (s->rx_cnt >= s->rtrg) {
                     s->flags |= SH_SERIAL_FLAG_RDF;
                     if (s->scr & (1 << 6) && s->rxi) {
-                        timer_del(s->fifo_timeout_timer);
+                        timer_del(&s->fifo_timeout_timer);
                         qemu_set_irq(s->rxi, 1);
                     }
                 } else {
-                    timer_mod(s->fifo_timeout_timer,
+                    timer_mod(&s->fifo_timeout_timer,
                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 15 * s->etu);
                 }
             }
@@ -381,18 +388,10 @@ static const MemoryRegionOps sh_serial_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void sh_serial_init(MemoryRegion *sysmem,
-                    hwaddr base, int feat,
-                    uint32_t freq, Chardev *chr,
-                    qemu_irq eri_source,
-                    qemu_irq rxi_source,
-                    qemu_irq txi_source,
-                    qemu_irq tei_source,
-                    qemu_irq bri_source)
+static void sh_serial_reset(DeviceState *dev)
 {
-    SHSerialState *s = g_malloc0(sizeof(*s));
+    SHSerialState *s = SH_SERIAL(dev);
 
-    s->feat = feat;
     s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
     s->rtrg = 1;
 
@@ -401,38 +400,64 @@ void sh_serial_init(MemoryRegion *sysmem,
     s->scr = 1 << 5; /* pretend that TX is enabled so early printk works */
     s->sptr = 0;
 
-    if (feat & SH_SERIAL_FEAT_SCIF) {
+    if (s->feat & SH_SERIAL_FEAT_SCIF) {
         s->fcr = 0;
     } else {
         s->dr = 0xff;
     }
 
     sh_serial_clear_fifo(s);
+}
 
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
+static void sh_serial_realize(DeviceState *d, Error **errp)
+{
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
     }
 
-    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                         sh_serial_timeout_int, s);
+    timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
+                  sh_serial_timeout_int, s);
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
index c3c3caf952..dba40a6fb4 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -24,10 +24,14 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "qemu/log.h"
+#include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "sh7750_regs.h"
 #include "sh7750_regnames.h"
 #include "hw/sh4/sh_intc.h"
@@ -761,6 +765,9 @@ static const MemoryRegionOps sh7750_mmct_ops = {
 SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
+    DeviceState *dev;
+    SysBusDevice *sb;
+    MemoryRegion *mr, *alias;
 
     s = g_malloc0(sizeof(SH7750State));
     s->cpu = cpu;
@@ -806,21 +813,46 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
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
+    mr = sysbus_mmio_get_region(sb, 0);
+    alias = g_malloc(sizeof(*alias));
+    memory_region_init_alias(alias, OBJECT(dev), "sci-p4", mr,
+                             0, memory_region_size(mr));
+    memory_region_add_subregion(sysmem, P4ADDR(0x1fe00000), alias);
+    alias = g_malloc(sizeof(*alias));
+    memory_region_init_alias(alias, OBJECT(dev), "sci-a7", mr,
+                             0, memory_region_size(mr));
+    memory_region_add_subregion(sysmem, A7ADDR(0x1fe00000), alias);
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
+    mr = sysbus_mmio_get_region(sb, 0);
+    alias = g_malloc(sizeof(*alias));
+    memory_region_init_alias(alias, OBJECT(dev), "scif-p4", mr,
+                             0, memory_region_size(mr));
+    memory_region_add_subregion(sysmem, P4ADDR(0x1fe80000), alias);
+    alias = g_malloc(sizeof(*alias));
+    memory_region_init_alias(alias, OBJECT(dev), "scif-a7", mr,
+                             0, memory_region_size(mr));
+    memory_region_add_subregion(sysmem, A7ADDR(0x1fe80000), alias);
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


