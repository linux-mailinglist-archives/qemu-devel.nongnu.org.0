Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C14E77B6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 18:37:18 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP8x8-0000Z4-UR
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 13:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iP7zE-00026z-GH
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iP7zB-0007Hn-T4
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:35:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31861
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iP7zB-0007Gt-Of
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572280515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaqc/vYnF8LB/YRJMD9N+iWM1u28Nhqe2r6uBf6Iyjs=;
 b=RozzBLhpg5WMV0AitUZNTa3aKX2oYNoQ3apVoFL7mo6e5uFF0IsIQan9zbC4QgPDeHVEIU
 xkEuKabxih2FQnW+qLwXwZu+3wJqmH4tP01Y72E2zjqt0i6seCDtr6Nk66jGEmSrDXD0t8
 Nk2D/kYzEbJ8E+L+f0mBrXqMZE60SgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-oWm4SKmNNE2KXH6m2pem6Q-1; Mon, 28 Oct 2019 12:35:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A95B71005509;
 Mon, 28 Oct 2019 16:35:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-87.brq.redhat.com [10.40.204.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89C731C941;
 Mon, 28 Oct 2019 16:35:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] piix4: Add an i8259 Interrupt Controller as specified in
 datasheet
Date: Mon, 28 Oct 2019 17:34:30 +0100
Message-Id: <20191028163447.18541-4-philmd@redhat.com>
In-Reply-To: <20191028163447.18541-1-philmd@redhat.com>
References: <20191028163447.18541-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: oWm4SKmNNE2KXH6m2pem6Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Add ISA irqs as piix4 gpio in, and CPU interrupt request as piix4 gpio out.
Remove i8259 instanciated in malta board, to not have it twice.

We can also remove the now unused piix4_init() function.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-8-hpoussin@reactos.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
[PMD: rebased, updated includes, use ISA_NUM_IRQS in for loop]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/piix4.c       | 43 ++++++++++++++++++++++++++++++++-----------
 hw/mips/mips_malta.c | 32 +++++++++++++-------------------
 include/hw/i386/pc.h |  1 -
 3 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 7a1361a9dd..7cf72e3118 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -24,6 +24,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
@@ -36,6 +37,8 @@ PCIDevice *piix4_dev;
=20
 typedef struct PIIX4State {
     PCIDevice dev;
+    qemu_irq cpu_intr;
+    qemu_irq *isa;
=20
     /* Reset Control Register */
     MemoryRegion rcr_mem;
@@ -94,6 +97,18 @@ static const VMStateDescription vmstate_piix4 =3D {
     }
 };
=20
+static void piix4_request_i8259_irq(void *opaque, int irq, int level)
+{
+    PIIX4State *s =3D opaque;
+    qemu_set_irq(s->cpu_intr, level);
+}
+
+static void piix4_set_i8259_irq(void *opaque, int irq, int level)
+{
+    PIIX4State *s =3D opaque;
+    qemu_set_irq(s->isa[irq], level);
+}
+
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -127,29 +142,35 @@ static const MemoryRegionOps piix4_rcr_ops =3D {
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
+    ISABus *isa_bus;
+    qemu_irq *i8259_out_irq;
=20
-    if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),
-                     pci_address_space_io(dev), errp)) {
+    isa_bus =3D isa_bus_new(DEVICE(dev), pci_address_space(dev),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
         return;
     }
=20
+    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
+                            "isa", ISA_NUM_IRQS);
+    qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
+                             "intr", 1);
+
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         RCR_IOPORT, &s->rcr_mem, 1);
=20
+    /* initialize i8259 pic */
+    i8259_out_irq =3D qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
+    s->isa =3D i8259_init(isa_bus, *i8259_out_irq);
+
+    /* initialize ISA irqs */
+    isa_bus_irqs(isa_bus, s->isa);
+
     piix4_dev =3D dev;
 }
=20
-int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
-{
-    PCIDevice *d;
-
-    d =3D pci_create_simple_multifunction(bus, devfn, true, "PIIX4");
-    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
-    return d->devfn;
-}
-
 static void piix4_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index c1c8810e71..6d9b230322 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -97,7 +97,7 @@ typedef struct {
     SysBusDevice parent_obj;
=20
     MIPSCPSState cps;
-    qemu_irq *i8259;
+    qemu_irq i8259[ISA_NUM_IRQS];
 } MaltaState;
=20
 static ISADevice *pit;
@@ -1235,8 +1235,8 @@ void mips_malta_init(MachineState *machine)
     int64_t kernel_entry, bootloader_run_addr;
     PCIBus *pci_bus;
     ISABus *isa_bus;
-    qemu_irq *isa_irq;
     qemu_irq cbus_irq, i8259_irq;
+    PCIDevice *pci;
     int piix4_devfn;
     I2CBus *smbus;
     DriveInfo *dinfo;
@@ -1407,30 +1407,24 @@ void mips_malta_init(MachineState *machine)
     /* Board ID =3D 0x420 (Malta Board with CoreLV) */
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
=20
-    /*
-     * We have a circular dependency problem: pci_bus depends on isa_irq,
-     * isa_irq is provided by i8259, i8259 depends on ISA, ISA depends
-     * on piix4, and piix4 depends on pci_bus.  To stop the cycle we have
-     * qemu_irq_proxy() adds an extra bit of indirection, allowing us
-     * to resolve the isa_irq -> i8259 dependency after i8259 is initializ=
ed.
-     */
-    isa_irq =3D qemu_irq_proxy(&s->i8259, 16);
-
     /* Northbridge */
-    pci_bus =3D gt64120_register(isa_irq);
+    pci_bus =3D gt64120_register(s->i8259);
=20
     /* Southbridge */
     ide_drive_get(hd, ARRAY_SIZE(hd));
=20
-    piix4_devfn =3D piix4_init(pci_bus, &isa_bus, 80);
+    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
+                                          true, "PIIX4");
+    dev =3D DEVICE(pci);
+    isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    piix4_devfn =3D pci->devfn;
=20
-    /*
-     * Interrupt controller
-     * The 8259 is attached to the MIPS CPU INT0 pin, ie interrupt 2
-     */
-    s->i8259 =3D i8259_init(isa_bus, i8259_irq);
+    /* Interrupt controller */
+    qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
+    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
+        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
+    }
=20
-    isa_bus_irqs(isa_bus, s->i8259);
     pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);
     pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
     smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index f040a72095..f553b29652 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -266,7 +266,6 @@ PCIBus *i440fx_init(const char *host_type, const char *=
pci_type,
 PCIBus *find_i440fx(void);
 /* piix4.c */
 extern PCIDevice *piix4_dev;
-int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
=20
 /* pc_sysfw.c */
 void pc_system_flash_create(PCMachineState *pcms);
--=20
2.21.0


