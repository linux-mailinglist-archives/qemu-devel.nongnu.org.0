Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4053063B
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:32:54 +0200 (CEST)
Received: from localhost ([::1]:46914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstC1-00046r-2Q
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4T-0002xx-Ll; Sun, 22 May 2022 17:25:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4R-0005SP-QB; Sun, 22 May 2022 17:25:05 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i27so25016414ejd.9;
 Sun, 22 May 2022 14:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+UD5jMouYtP7bslZ2bQ9vwheRStZc9WMtVYW+dp4Pc=;
 b=Sh1bmCjwJG8fdznxKbZepARRbCVlWbPYbPjYBg0lGlD/uXJSWHg4UtYVHlj5WtWw2D
 YUwON2WpYk134Bu9n6aganRB/SgM4rzyzc+NlITS2Gg86gRE0uVS2OmU2IdQG9t30LUt
 ZLCXdA7tXThyP2edAU7vAccQb5ut4+6il4B/h0u80Ubg3EOkJAVL4gYWwzzkbW3jKbHA
 Rw//DIDqk5R0ZwuZetzEMENO8LkhNNd8sT7oLJvr0uKNFwWl/x8zMV4lomoydC1Ih6Oj
 xyscF+daAY00Ucfxf8aMFvRjQgRWP80x4jz6eJP5KOJyLXD+QXGDsOzVO0kDvJpRU6kB
 V4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U+UD5jMouYtP7bslZ2bQ9vwheRStZc9WMtVYW+dp4Pc=;
 b=niqxoxCOspdilVsFSGslATr9dMvVTVTrw1JOTixUZmpt3Hf7IDOU5JkZ5xTGUXz0Qt
 sAlLYxc7d/EbGVxe9kFjHNQeu2hlxkEP7VSnZ9yKB3YIiFkxfCZWaAfmi7W31AY/qzke
 Wjo+eGkDnepb47FQue9hsgTOPSwUj4J5mZ+f/Q3KyYAyxuS02YIqaZQkKUZEiksDgmZa
 QXdSlP4sDQzd9frWVfzjU6XWGwU/I+nNZeaNfw4RD+TNIEmh166heJzrsfubItwJr2Pi
 KO5GQWIoxaxV6GlbSWJKNZ7NYBES3r5+5fAmzBiKYsihv9udRl6PrbQgh6tXnI9MpWQv
 Bacw==
X-Gm-Message-State: AOAM532Fho5tawTVBHaDxJnTUYuNUXZASqqSSDK7DOwoIFW4cAj3Pv/m
 7R9ht8donTj/cXlArafVMsVuvMLB4rM=
X-Google-Smtp-Source: ABdhPJynUPXZNHsCeu10/Dnjjl7JR/XDyod5VLrBMb3xaIeLuOfZ6ogZ9ZqrPEw2ejjCzZfrrDlP5A==
X-Received: by 2002:a17:907:2d29:b0:6fe:c413:d9a4 with SMTP id
 gs41-20020a1709072d2900b006fec413d9a4mr5400778ejc.694.1653254701890; 
 Sun, 22 May 2022 14:25:01 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170907270400b006f3ef214e22sm5418768ejk.136.2022.05.22.14.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:25:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2 3/6] hw/isa/piix{3,
 4}: QOM'ify PCI device creation and wiring
Date: Sun, 22 May 2022 23:24:28 +0200
Message-Id: <20220522212431.14598-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522212431.14598-1-shentey@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCI interrupt wiring and device creation (piix4 only) were performed
in create() functions which are obsolete. Move these tasks into QOM
functions to modernize the code.

In order to avoid duplicate checking for xen_enabled() the piix3 realize
methods are now split.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----------------
 hw/isa/piix4.c | 20 +++++++++------
 2 files changed, 57 insertions(+), 30 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c7a9014c3f..de532cc692 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/range.h"
+#include "qapi/error.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
@@ -277,7 +278,7 @@ static const MemoryRegionOps rcr_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN
 };
 
-static void piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
 
@@ -302,7 +303,6 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-    k->realize      = piix3_realize;
     k->vendor_id    = PCI_VENDOR_ID_INTEL;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -326,11 +326,28 @@ static const TypeInfo piix3_pci_type_info = {
     },
 };
 
+static void piix3_realize(PCIDevice *dev, Error **errp)
+{
+    ERRP_GUARD();
+    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
+
+    pci_piix3_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+                 piix3, PIIX_NUM_PIRQS);
+    pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
+};
+
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config;
+    k->realize = piix3_realize;
 }
 
 static const TypeInfo piix3_info = {
@@ -339,11 +356,33 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
+static void piix3_xen_realize(PCIDevice *dev, Error **errp)
+{
+    ERRP_GUARD();
+    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
+
+    pci_piix3_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    /*
+     * Xen supports additional interrupt routes from the PCI devices to
+     * the IOAPIC: the four pins of each PCI device on the bus are also
+     * connected to the IOAPIC directly.
+     * These additional routes can be discovered through ACPI.
+     */
+    pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
+                 piix3, XEN_PIIX_NUM_PIRQS);
+};
+
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
+    k->realize = piix3_xen_realize;
 };
 
 static const TypeInfo piix3_xen_info = {
@@ -365,27 +404,11 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 {
     PIIX3State *piix3;
     PCIDevice *pci_dev;
+    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                     : TYPE_PIIX3_DEVICE;
 
-    /*
-     * Xen supports additional interrupt routes from the PCI devices to
-     * the IOAPIC: the four pins of each PCI device on the bus are also
-     * connected to the IOAPIC directly.
-     * These additional routes can be discovered through ACPI.
-     */
-    if (xen_enabled()) {
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
-                                                  TYPE_PIIX3_XEN_DEVICE);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
-                     piix3, XEN_PIIX_NUM_PIRQS);
-    } else {
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
-                                                  TYPE_PIIX3_DEVICE);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
-                     piix3, PIIX_NUM_PIRQS);
-        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
-    }
+    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+    piix3 = PIIX3_PCI_DEVICE(pci_dev);
     *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
 
     return piix3;
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a223b69e24..134d23aea7 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -204,6 +204,8 @@ static const MemoryRegionOps piix4_rcr_ops = {
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PCIDevice *pci;
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
 
@@ -242,6 +244,15 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
     s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+
+    /* IDE */
+    pci = pci_create_simple(pci_bus, dev->devfn + 1, "piix4-ide");
+    pci_ide_create_devs(pci);
+
+    /* USB */
+    pci_create_simple(pci_bus, dev->devfn + 2, "piix4-usb-uhci");
+
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
@@ -292,7 +303,6 @@ type_init(piix4_register_types)
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
-    PIIX4State *s;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -300,22 +310,16 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
-    s = PIIX4_PCI_DEVICE(pci);
+
     if (isa_bus) {
         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     }
 
-    pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
-    pci_ide_create_devs(pci);
-
-    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
                                qdev_get_gpio_in_named(dev, "isa", 9),
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
-
     return dev;
 }
-- 
2.36.1


