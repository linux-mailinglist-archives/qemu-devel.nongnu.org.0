Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CDE67D795
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dR-000888-MJ; Thu, 26 Jan 2023 16:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dB-0007yu-Bj; Thu, 26 Jan 2023 16:18:02 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d9-0007kR-GO; Thu, 26 Jan 2023 16:18:01 -0500
Received: by mail-ej1-x631.google.com with SMTP id ss4so8572874ejb.11;
 Thu, 26 Jan 2023 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+0raqkDXWQWPBkic8BAc4ozUWXA5qkVo1EM1DG1MHQ=;
 b=fbhT2Wf12e3Y8dvlbs0Ac1eGV1bm6TWMeYWfp40bfTgeaDhppILO1G04rFob1naJM8
 K+giGKPygPNbT2J8VZLWgWoxODK4BKaSJS0dGETI0d15V3O3MFeAkutjyi1Qq25duhyB
 1ouGiQ5cZ6f5nZoPeFR87p35mh8FMfsbw8aIHXYYcih34MafK8A7K0oegZQzORqepGFP
 w+5ZS+MBINy13dJiIl7IpdaUBdJ/p4BBKpGPwyEvRBmFl1CgHmRpw/E+K40+v/sw3xO8
 zSN3d/5fkwEzUYFXYIEZThw7owvnIhchg7u9HpVxDnGzgBf3HSa/C4b3m+0yag4d74+S
 9f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+0raqkDXWQWPBkic8BAc4ozUWXA5qkVo1EM1DG1MHQ=;
 b=j3JGlE+fy+T/8/Kq4j+Mo8R+ysRfU45e1rzwBT0wtutq+IkHXfUh31AgEsn+t6na+/
 hHcDq9fD7LihtB56kY60hu21VHX5CxXTNR6TKWjMvNt9XZhX5ZJvG0F5h9Ug7mzO/kjr
 6qAK4RGcx6ORjC2f3nFq6kPeE1RQXJkiOjD+l2aJx0e8ACIyD47DPFOnsVK3KufX4SHF
 gYjE4egbyK+/Wu774/2vf3lwWMSBIjf48vYLJdKfTanFRb9JsfvNo8SCgRKVihOVfLwe
 61YDerG1vDGuxb8pDDRZDR7lKnTh7auxsTTR8udpGbEkEnvzQ6uR/IQBjSDUIzLhZ8Bv
 ZmwQ==
X-Gm-Message-State: AFqh2kq+mACOqvribL/J8N4vkeXs3CyFI+153ykc41gYlE1xiofyFgX4
 z2MbgsNezm1QgDMVE0sFohaAMFdRyeIqeg==
X-Google-Smtp-Source: AMrXdXsI/peXlhxMg0oZ8ahP++jiimXbNmvIm9IaErhetcapmj4EkrS7wzVjWLFfHkLydmNxG9vO+Q==
X-Received: by 2002:a17:906:368f:b0:877:593a:58d0 with SMTP id
 a15-20020a170906368f00b00877593a58d0mr33509499ejc.29.1674767877348; 
 Thu, 26 Jan 2023 13:17:57 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 07/10] hw/ide/piix: Require an ISABus only for user-created
 instances
Date: Thu, 26 Jan 2023 22:17:37 +0100
Message-Id: <20230126211740.66874-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Internal instances now defer interrupt wiring to the caller which
decouples them from the ISABus. User-created devices still fish out the
ISABus from the QOM tree and the interrupt wiring remains in PIIX IDE.
The latter mechanism is considered a workaround and intended to be
removed once a deprecation period for user-created PIIX IDE devices is
over.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/pci.h |  1 +
 hw/ide/piix.c        | 64 ++++++++++++++++++++++++++++++++++----------
 hw/isa/piix.c        |  5 ++++
 3 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 24c0b7a2dd..ee2c8781b7 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -54,6 +54,7 @@ struct PCIIDEState {
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
+    bool user_created;
 };
 
 static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 5980045db0..f0d95761ac 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -108,6 +108,13 @@ static void bmdma_setup_bar(PCIIDEState *d)
     }
 }
 
+static void piix_ide_set_irq(void *opaque, int n, int level)
+{
+    PCIIDEState *d = opaque;
+
+    qemu_set_irq(d->isa_irqs[n], level);
+}
+
 static void piix_ide_reset(DeviceState *dev)
 {
     PCIIDEState *d = PCI_IDE(dev);
@@ -138,11 +145,18 @@ static void pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
     };
     int i;
 
+    if (isa_bus) {
+        d->isa_irqs[0] = isa_bus->irqs[port_info[0].isairq];
+        d->isa_irqs[1] = isa_bus->irqs[port_info[1].isairq];
+    } else {
+        qdev_init_gpio_out(DEVICE(d), d->isa_irqs, 2);
+    }
+
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
         ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
                         port_info[i].iobase2);
-        ide_init2(&d->bus[i], isa_bus->irqs[port_info[i].isairq]);
+        ide_init2(&d->bus[i], qdev_get_gpio_in(DEVICE(d), i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
@@ -154,8 +168,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 {
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
-    ISABus *isa_bus;
-    bool ambiguous;
+    ISABus *isa_bus = NULL;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
@@ -164,22 +177,36 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous));
-    if (ambiguous) {
-        error_setg(errp,
-                   "More than one ISA bus found while %s supports only one",
-                   object_get_typename(OBJECT(dev)));
-        return;
-    }
-    if (!isa_bus) {
-        error_setg(errp, "No ISA bus found while %s requires one",
-                   object_get_typename(OBJECT(dev)));
-        return;
+    if (d->user_created) {
+        bool ambiguous;
+
+        isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS,
+                                                   &ambiguous));
+
+        if (ambiguous) {
+            error_setg(errp,
+                       "More than one ISA bus found while %s supports only one",
+                       object_get_typename(OBJECT(dev)));
+            return;
+        }
+
+        if (!isa_bus) {
+            error_setg(errp, "No ISA bus found while %s requires one",
+                       object_get_typename(OBJECT(dev)));
+            return;
+        }
     }
 
     pci_piix_init_ports(d, isa_bus);
 }
 
+static void pci_piix_ide_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_init_gpio_in(dev, piix_ide_set_irq, 2);
+}
+
 static void pci_piix_ide_exitfn(PCIDevice *dev)
 {
     PCIIDEState *d = PCI_IDE(dev);
@@ -191,6 +218,11 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property piix_ide_properties[] = {
+    DEFINE_PROP_BOOL("user-created", PCIIDEState, user_created, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -205,11 +237,13 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix_ide_properties);
 }
 
 static const TypeInfo piix3_ide_info = {
     .name          = TYPE_PIIX3_IDE,
     .parent        = TYPE_PCI_IDE,
+    .instance_init = pci_piix_ide_init,
     .class_init    = piix3_ide_class_init,
 };
 
@@ -227,11 +261,13 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix_ide_properties);
 }
 
 static const TypeInfo piix4_ide_info = {
     .name          = TYPE_PIIX4_IDE,
     .parent        = TYPE_PCI_IDE,
+    .instance_init = pci_piix_ide_init,
     .class_init    = piix4_ide_class_init,
 };
 
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 54a1246a9d..f9974c2a77 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -345,9 +345,14 @@ static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 1);
+    qdev_prop_set_bit(DEVICE(&d->ide), "user-created", false);
     if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
         return;
     }
+    qdev_connect_gpio_out(DEVICE(&d->ide), 0,
+                          qdev_get_gpio_in(DEVICE(&d->pic), 14));
+    qdev_connect_gpio_out(DEVICE(&d->ide), 1,
+                          qdev_get_gpio_in(DEVICE(&d->pic), 15));
 
     /* USB */
     if (d->has_usb) {
-- 
2.39.1


