Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2636204E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 14:54:26 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXNzN-0002Za-QO
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 08:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXNy9-00023r-Gw
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXNy5-0007iA-1v
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618577584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2e59MtSLhx7S3f+tAr2YfXXoO6u82PDESXCpvKv5zc4=;
 b=h4LpiJM7wDLscL80jvMMQyxkMyngO2cWAd2Jys3EpThMaovXrJS7SHHWclPmQsguZ4HQjx
 Kup2HrC3yEiCvGVwWVFpKUqSY4MFz4pbvc58AEArFUQro3uL9xMk6SmVYs3/vxLYDmqIb7
 +YVGAgeE0ieyAQV1uGwj5T6dkM8iQtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-woi9wyM5NVCEed1KWmxFxg-1; Fri, 16 Apr 2021 08:53:02 -0400
X-MC-Unique: woi9wyM5NVCEed1KWmxFxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C57E1006C87;
 Fri, 16 Apr 2021 12:53:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 726E65D9C6;
 Fri, 16 Apr 2021 12:52:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into the
 x-remote machine
Date: Fri, 16 Apr 2021 14:52:56 +0200
Message-Id: <20210416125256.2039734-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently crashes when the user tries to do something like:

 qemu-system-x86_64 -M x-remote -device piix3-ide

This happens because the "isabus" variable is not initialized with
the x-remote machine yet. Add a proper check for this condition
and propagate the error to the caller, so we can fail there gracefully.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/ioport.c           | 16 ++++++++++------
 hw/ide/piix.c             | 22 +++++++++++++++++-----
 hw/isa/isa-bus.c          | 14 ++++++++++----
 include/hw/ide/internal.h |  2 +-
 include/hw/isa/isa.h      | 13 ++++++++-----
 5 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index b613ff3bba..e6caa537fa 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,15 +50,19 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 {
+    int ret;
+
     /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
        bridge has been setup properly to always register with ISA.  */
-    isa_register_portio_list(dev, &bus->portio_list,
-                             iobase, ide_portio_list, bus, "ide");
+    ret = isa_register_portio_list(dev, &bus->portio_list,
+                                   iobase, ide_portio_list, bus, "ide");
 
-    if (iobase2) {
-        isa_register_portio_list(dev, &bus->portio2_list,
-                                 iobase2, ide_portio2_list, bus, "ide");
+    if (ret == 0 && iobase2) {
+        ret = isa_register_portio_list(dev, &bus->portio2_list,
+                                       iobase2, ide_portio2_list, bus, "ide");
     }
+
+    return ret;
 }
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b9860e35a5..d3e738320b 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
@@ -123,7 +124,8 @@ static void piix_ide_reset(DeviceState *dev)
     pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
 }
 
-static void pci_piix_init_ports(PCIIDEState *d) {
+static int pci_piix_init_ports(PCIIDEState *d)
+{
     static const struct {
         int iobase;
         int iobase2;
@@ -132,24 +134,30 @@ static void pci_piix_init_ports(PCIIDEState *d) {
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i;
+    int i, ret;
 
     for (i = 0; i < 2; i++) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                        port_info[i].iobase2);
+        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
+                              port_info[i].iobase2);
+        if (ret) {
+            return ret;
+        }
         ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
         ide_register_restart_cb(&d->bus[i]);
     }
+
+    return 0;
 }
 
 static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 {
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
+    int rc;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
@@ -158,7 +166,11 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    pci_piix_init_ports(d);
+    rc = pci_piix_init_ports(d);
+    if (rc) {
+        error_setg_errno(errp, -rc, "Failed to realize %s",
+                         object_get_typename(OBJECT(dev)));
+    }
 }
 
 int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 7820068e6e..cffaa35e9c 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -131,13 +131,17 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
     isa_init_ioport(dev, start);
 }
 
-void isa_register_portio_list(ISADevice *dev,
-                              PortioList *piolist, uint16_t start,
-                              const MemoryRegionPortio *pio_start,
-                              void *opaque, const char *name)
+int isa_register_portio_list(ISADevice *dev,
+                             PortioList *piolist, uint16_t start,
+                             const MemoryRegionPortio *pio_start,
+                             void *opaque, const char *name)
 {
     assert(piolist && !piolist->owner);
 
+    if (!isabus) {
+        return -ENODEV;
+    }
+
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
@@ -145,6 +149,8 @@ void isa_register_portio_list(ISADevice *dev,
 
     portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
     portio_list_add(piolist, isabus->address_space_io, start);
+
+    return 0;
 }
 
 static void isa_device_init(Object *obj)
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 2d09162eeb..79172217cc 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -624,7 +624,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
-void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index ddaae89a85..d4417b34b6 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -132,12 +132,15 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start);
  * @portio: the ports, sorted by offset.
  * @opaque: passed into the portio callbacks.
  * @name: passed into memory_region_init_io.
+ *
+ * Returns: 0 on success, negative error code otherwise (e.g. if the
+ *          ISA bus is not available)
  */
-void isa_register_portio_list(ISADevice *dev,
-                              PortioList *piolist,
-                              uint16_t start,
-                              const MemoryRegionPortio *portio,
-                              void *opaque, const char *name);
+int isa_register_portio_list(ISADevice *dev,
+                             PortioList *piolist,
+                             uint16_t start,
+                             const MemoryRegionPortio *portio,
+                             void *opaque, const char *name);
 
 static inline ISABus *isa_bus_from_device(ISADevice *d)
 {
-- 
2.27.0


