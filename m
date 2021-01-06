Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF82EC5CD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 22:37:18 +0100 (CET)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxGUX-0003r6-5e
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 16:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxGMX-0002rm-Ll
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:29:01 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxGMV-0001l6-AH
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:29:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0DF6D7470F8;
 Wed,  6 Jan 2021 22:28:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 40FF47470FB; Wed,  6 Jan 2021 22:28:51 +0100 (CET)
Message-Id: <4699a79a989538458fc335d74a7bf52e8608e5e2.1609967638.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609967638.git.balaton@eik.bme.hu>
References: <cover.1609967638.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 09/12] vt82c686: Implement control of serial port io ranges
 via config regs
Date: Wed, 06 Jan 2021 22:13:58 +0100
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In VIA super south bridge the io ranges of superio components
(parallel and serial ports and FDC) can be controlled by superio
config registers to set their base address and enable/disable them.
This is not easy to implement in QEMU because ISA emulation is only
designed to set io base address once on creating the device and io
ranges are registered at creation and cannot easily be disabled or
moved later.

In this patch we hack around that but only for serial ports because
those have a single io range at port base that's relatively easy to
handle and it's what guests actually use and set address different
than the default.

We do not attempt to handle controlling the parallel and FDC regions
because those have multiple io ranges so handling them would be messy
and guests either don't change their deafult or don't care. We could
even get away with disabling and not emulating them, but since they
are already there, this patch leaves them mapped at their default
address just in case this could be useful for a guest in the future.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 84 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 1a876a1fbf..26db1a18e2 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -252,8 +252,24 @@ static const TypeInfo vt8231_pm_info = {
 typedef struct SuperIOConfig {
     uint8_t regs[0x100];
     MemoryRegion io;
+    ISASuperIODevice *superio;
+    MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
 } SuperIOConfig;
 
+static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
+                                    int offs)
+{
+    MemoryRegion *subregion, *mr = NULL;
+
+    QTAILQ_FOREACH(subregion, &parent->subregions, subregions_link) {
+        if (subregion->addr == offs) {
+            mr = subregion;
+            break;
+        }
+    }
+    return mr;
+}
+
 static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
                               unsigned size)
 {
@@ -279,7 +295,53 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
     case 0xfd ... 0xff:
         /* ignore write to read only registers */
         return;
-    /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
+    case 0xe2:
+    {
+        data &= 0x1f;
+        if (data & BIT(2)) { /* Serial port 1 enable */
+            ISADevice *dev = sc->superio->serial[0];
+            if (!memory_region_is_mapped(sc->serial_io[0])) {
+                memory_region_add_subregion(isa_address_space_io(dev),
+                                            dev->ioport_id, sc->serial_io[0]);
+            }
+        } else {
+            MemoryRegion *io = isa_address_space_io(sc->superio->serial[0]);
+            if (memory_region_is_mapped(sc->serial_io[0])) {
+                memory_region_del_subregion(io, sc->serial_io[0]);
+            }
+        }
+        if (data & BIT(3)) { /* Serial port 2 enable */
+            ISADevice *dev = sc->superio->serial[1];
+            if (!memory_region_is_mapped(sc->serial_io[1])) {
+                memory_region_add_subregion(isa_address_space_io(dev),
+                                            dev->ioport_id, sc->serial_io[1]);
+            }
+        } else {
+            MemoryRegion *io = isa_address_space_io(sc->superio->serial[1]);
+            if (memory_region_is_mapped(sc->serial_io[1])) {
+                memory_region_del_subregion(io, sc->serial_io[1]);
+            }
+        }
+        break;
+    }
+    case 0xe7: /* Serial port 1 io base address */
+    {
+        data &= 0xfe;
+        sc->superio->serial[0]->ioport_id = data << 2;
+        if (memory_region_is_mapped(sc->serial_io[0])) {
+            memory_region_set_address(sc->serial_io[0], data << 2);
+        }
+        break;
+    }
+    case 0xe8: /* Serial port 2 io base address */
+    {
+        data &= 0xfe;
+        sc->superio->serial[1]->ioport_id = data << 2;
+        if (memory_region_is_mapped(sc->serial_io[1])) {
+            memory_region_set_address(sc->serial_io[1], data << 2);
+        }
+        break;
+    }
     default:
         qemu_log_mask(LOG_UNIMP,
                       "via_superio_cfg: unimplemented register 0x%x\n", idx);
@@ -385,6 +447,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
     qemu_irq *isa_irq;
+    ISASuperIOClass *ic;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
@@ -394,7 +457,9 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
+    s->superio_cfg.superio = ISA_SUPERIO(isa_create_simple(isa_bus,
+                                                      TYPE_VT82C686B_SUPERIO));
+    ic = ISA_SUPERIO_GET_CLASS(s->superio_cfg.superio);
     mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
@@ -412,6 +477,21 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
      */
     memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
                                 &s->superio_cfg.io);
+
+    /* Grab io regions of serial devices so we can control them */
+    for (i = 0; i < ic->serial.count; i++) {
+        ISADevice *sd = s->superio_cfg.superio->serial[i];
+        MemoryRegion *io = isa_address_space_io(sd);
+        MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
+        if (!mr) {
+            error_setg(errp, "Could not get io region for serial %d", i);
+            return;
+        }
+        s->superio_cfg.serial_io[i] = mr;
+        if (memory_region_is_mapped(mr)) {
+            memory_region_del_subregion(io, mr);
+        }
+    }
 }
 
 static void via_class_init(ObjectClass *klass, void *data)
-- 
2.21.3


