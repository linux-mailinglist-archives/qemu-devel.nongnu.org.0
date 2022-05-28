Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A551536E2C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:25:10 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv23h-0006wS-5y
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv205-0003YA-4O; Sat, 28 May 2022 15:21:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv203-00022D-7q; Sat, 28 May 2022 15:21:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id h5so1795335wrb.0;
 Sat, 28 May 2022 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPPu9ztlGgC25K6NHufCJRCYITpwHxc/qG5KCBbqSAs=;
 b=ca/a1U9qnxv08nZzLzBGnqHdf2He0QfrJP8LedF64vBtmUQ0vVnVp0xfl7q+UjnxSX
 ijhwslJSaZ28BgF5YqitUZFsRODNvzDQk/++iQ4IkC7O2fDVu/U8qKGaNVf/0ueRsmJD
 EKkO8D+j+YvlR3trQb3bIJJSWMpndK/jl1IjlYpja8ViXCal6y8CdCT3exY+isaa5TFq
 hxxHN4HCzZ6R8/XXdsFn4+aBulYBIVQerdHnOVmL6T/2LeXfa4zylggA8S4hHeIJhjnr
 BpeJ0aVfxWHCHpar/FkMeBTjKOR687a+ZhqGm+FRP5CD2E3JA+SrOkHBiEMDbQrPyu3Q
 MVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPPu9ztlGgC25K6NHufCJRCYITpwHxc/qG5KCBbqSAs=;
 b=NEm/R9ZMkQFZrw7zOAYpOMnD7js8kHj62/dn6Y7JBOunRAfxgqBHW5iliS/nfv8q4Z
 KeLLsW9Dt7l7vRk+afRa1uraXBD3+BfVHj+Nbq8tp/T+Ch1SBkZ0iXVj/WH7NcbxxdWL
 S8w63S5EoOPRQmA7inLGnl3lUuBfnjnJag8EOxnF0qh5cWVRteRsgavS5qu98X7Tares
 zSVKlTDZZryWVBq3+UC2thPJD6msMmaQmgGWiWRaNS+s9zyplQI+WERoG+75G2ZNoUcA
 yt2vNp7lEJmFzY6Xlwz0lJFfwb77vH0kikSwWAl52vbnlXTql17gxrF8cmvDXXIabhnj
 EDgw==
X-Gm-Message-State: AOAM530ARb/g9k8IOsyP1LJR7+8OzMmnwzgyHFbrbBS2LBkhDQBjURz1
 CahLjLXkcKWo8y7r+cyBKKN+Fyf6ddYO5hPfE5o=
X-Google-Smtp-Source: ABdhPJxxYq4sJWuyt2197ccvkdrTW64SOD4jZIQ+sTLmmIG1LwHHv+EKPpE8Uq4ia9YWw9Z5ofcPIg==
X-Received: by 2002:a5d:64ca:0:b0:20f:f216:bc8a with SMTP id
 f10-20020a5d64ca000000b0020ff216bc8amr18814477wri.114.1653765681321; 
 Sat, 28 May 2022 12:21:21 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:20 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v3 4/7] hw/isa/piix{3,
 4}: QOM'ify PCI device creation and wiring
Date: Sat, 28 May 2022 21:20:53 +0200
Message-Id: <20220528192057.30910-5-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
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
---
 hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----------------
 hw/isa/piix4.c | 30 ++++++++++++++++------
 2 files changed, 67 insertions(+), 30 deletions(-)

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
index 18aa24424f..058bebb5e2 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -35,6 +35,7 @@
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide/pci.h"
 #include "hw/acpi/piix4.h"
+#include "hw/usb/hcd-uhci.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -46,6 +47,8 @@ struct PIIX4State {
     qemu_irq *isa;
 
     RTCState rtc;
+    PCIIDEState ide;
+    UHCIState uhci;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
@@ -205,6 +208,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
 
@@ -243,6 +247,21 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
     s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+    pci_ide_create_devs(PCI_DEVICE(&s->ide));
+
+    /* USB */
+    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
+    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
+        return;
+    }
+
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
@@ -250,6 +269,8 @@ static void piix4_init(Object *obj)
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
+    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
 }
 
 static void piix4_class_init(ObjectClass *klass, void *data)
@@ -293,7 +314,6 @@ type_init(piix4_register_types)
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
-    PIIX4State *s;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -301,15 +321,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
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
         pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
         qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
@@ -320,7 +336,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
-
     return dev;
 }
-- 
2.36.1


