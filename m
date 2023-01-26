Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290467D791
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dR-000886-8Z; Thu, 26 Jan 2023 16:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d9-0007xH-It; Thu, 26 Jan 2023 16:18:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d7-0007jn-Dm; Thu, 26 Jan 2023 16:17:59 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kt14so8685472ejc.3;
 Thu, 26 Jan 2023 13:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWcvHkgyfXqKn+dsG6qj6iJyl76389CHLqD2jjmiaFM=;
 b=l/OJx7ng+XN5KzkiCo6I2lHZCKTVaDFkbaS0qLTR8Urhrc4D/x8EPEvWojaougHfUJ
 uRDkw1mTyQFsn/f3kBC5HzBz+2Zpl9a8oQ7HNThG6TqGmbQJICQrqhW+AhWgnDZbNJ47
 BLNKZ9n9Ysmg0HaASkAlQs3pdU3kpeJAjMm02sdIKuZq3P8jVj+9sp9FK2tN+uclzYcL
 7nLU10HvQtMj/y9Wcv4Z+BLXP3MuDMTGNvThoj7AQIh7yLqLbxg2lVMNYCfn/Mdgsjd0
 XO/zelBPdXy4eRxM6KpkfhJixKCu9eGZ1DwFwutCfGaBLtL0SNXxONXIzOXwJyk6KIDV
 moOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWcvHkgyfXqKn+dsG6qj6iJyl76389CHLqD2jjmiaFM=;
 b=WHWqYn3ewHsgV3fydUBYMcxMFf4P+CmLzqZo0YUoIKmucZdD0OLuNE1URE8b8kgUXv
 KkJP5F+SeeMAQ8/ulE8E5AodMRVoi6UDOIS8dZeSuaPKGcYR/PwlNjQjZpLsNRllSOIN
 BBG4bfpB8TMK/mC2QuGmwpMpDiKg+HZdJbJs9CrT6fWy8cHwYNTWIqk7r5pQmfHWyzrg
 e2oEuY02q00wJrOseyY2NNhSEe5KnFve5rEo6V5Qc/g+sluScTdaR+P7HsM42iE+HJ91
 nqBnifuc4qS1dbMUxD8ChD9w2l6Fo24MUJkoV+0bHBbop/hzbHFm/8HfmJker4ou/sVC
 fM+w==
X-Gm-Message-State: AO0yUKX9ELeSblTZTQOkcmTeoWZ7stMrPzLQfth/B/vg4GEvuwYHx6vI
 knQ1fwTwo0Q9EdkA9R0fPkt9HvzF+ZyKxQ==
X-Google-Smtp-Source: AK7set+y4WY59FtXzaAY/llDy62MY0b1iGbZNC6At6nFwhQO6Vr0TcnA9eqkzdf69Hz6C7lB2sFTKg==
X-Received: by 2002:a17:907:9625:b0:879:6abc:3bfc with SMTP id
 gb37-20020a170907962500b008796abc3bfcmr1004805ejc.19.1674767875199; 
 Thu, 26 Jan 2023 13:17:55 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:54 -0800 (PST)
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
Subject: [PATCH v2 05/10] Revert "hw/ide: Fix crash when plugging a piix3-ide
 device into the x-remote machine"
Date: Thu, 26 Jan 2023 22:17:35 +0100
Message-Id: <20230126211740.66874-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

Now that the PIIX IDE device models check for presence of an ISABus before
using it, this fix isn't needed any longer.

This reverts commit 9405d87be25db6dff4d7b5ab48a81bbf6d083e47.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/internal.h |  2 +-
 include/hw/isa/isa.h      | 13 +++++--------
 hw/ide/ioport.c           | 16 ++++++----------
 hw/ide/piix.c             | 20 +++++---------------
 hw/isa/isa-bus.c          | 14 ++++----------
 5 files changed, 21 insertions(+), 44 deletions(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index fc0aa81a88..42c49414f4 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -628,7 +628,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
-int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 6c8a8a92cb..8dd2953211 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -114,15 +114,12 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start);
  * @portio: the ports, sorted by offset.
  * @opaque: passed into the portio callbacks.
  * @name: passed into memory_region_init_io.
- *
- * Returns: 0 on success, negative error code otherwise (e.g. if the
- *          ISA bus is not available)
  */
-int isa_register_portio_list(ISADevice *dev,
-                             PortioList *piolist,
-                             uint16_t start,
-                             const MemoryRegionPortio *portio,
-                             void *opaque, const char *name);
+void isa_register_portio_list(ISADevice *dev,
+                              PortioList *piolist,
+                              uint16_t start,
+                              const MemoryRegionPortio *portio,
+                              void *opaque, const char *name);
 
 static inline ISABus *isa_bus_from_device(ISADevice *d)
 {
diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e6caa537fa..b613ff3bba 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,19 +50,15 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 {
-    int ret;
-
     /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
        bridge has been setup properly to always register with ISA.  */
-    ret = isa_register_portio_list(dev, &bus->portio_list,
-                                   iobase, ide_portio_list, bus, "ide");
+    isa_register_portio_list(dev, &bus->portio_list,
+                             iobase, ide_portio_list, bus, "ide");
 
-    if (ret == 0 && iobase2) {
-        ret = isa_register_portio_list(dev, &bus->portio2_list,
-                                       iobase2, ide_portio2_list, bus, "ide");
+    if (iobase2) {
+        isa_register_portio_list(dev, &bus->portio2_list,
+                                 iobase2, ide_portio2_list, bus, "ide");
     }
-
-    return ret;
 }
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index a6646d9657..5980045db0 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -126,7 +126,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static int pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
+static void pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
 {
     static const struct {
         int iobase;
@@ -136,23 +136,18 @@ static int pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i, ret;
+    int i;
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                              port_info[i].iobase2);
-        if (ret) {
-            return ret;
-        }
+        ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
+                        port_info[i].iobase2);
         ide_init2(&d->bus[i], isa_bus->irqs[port_info[i].isairq]);
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
         ide_register_restart_cb(&d->bus[i]);
     }
-
-    return 0;
 }
 
 static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
@@ -161,7 +156,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf = dev->config;
     ISABus *isa_bus;
     bool ambiguous;
-    int rc;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
@@ -183,11 +177,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    rc = pci_piix_init_ports(d, isa_bus);
-    if (rc) {
-        error_setg_errno(errp, -rc, "Failed to realize %s",
-                         object_get_typename(OBJECT(dev)));
-    }
+    pci_piix_init_ports(d, isa_bus);
 }
 
 static void pci_piix_ide_exitfn(PCIDevice *dev)
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index b3497dad61..d3e2d9de35 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -119,15 +119,11 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
     isa_init_ioport(dev, start);
 }
 
-int isa_register_portio_list(ISADevice *dev,
-                             PortioList *piolist, uint16_t start,
-                             const MemoryRegionPortio *pio_start,
-                             void *opaque, const char *name)
+void isa_register_portio_list(ISADevice *dev,
+                              PortioList *piolist, uint16_t start,
+                              const MemoryRegionPortio *pio_start,
+                              void *opaque, const char *name)
 {
-    if (!isabus) {
-        return -ENODEV;
-    }
-
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
@@ -135,8 +131,6 @@ int isa_register_portio_list(ISADevice *dev,
 
     portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name,
                      isabus->address_space_io, start);
-
-    return 0;
 }
 
 ISADevice *isa_new(const char *name)
-- 
2.39.1


