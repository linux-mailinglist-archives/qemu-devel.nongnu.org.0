Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884192443C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 01:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSrc7-000804-L2
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 19:22:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrR3-0007dH-3u
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:11:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrR1-0008CV-U8
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:11:13 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSrR1-0008C7-OY
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:11:11 -0400
Received: by mail-qk1-f196.google.com with SMTP id m18so92144qki.8
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 16:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=msyvcVYsP3DYZeJrb9pSd9mjMLqWB65TS3wRXlKOwsQ=;
	b=BxWjwakHImlHSngS1lbwtjQDHQ6pbtr6uYo+gH21ug7J5v+78S9CdIBTV/7IntS4Rb
	A4ghVLWA3d3W/9k1HLL3uHiHyjOTQmcuLRUn26TFUqEz2EWWHxlN4UvnsdDy3WBhMtba
	Tj6Dmxf0Cggmm+zf4r1PlQi36SCfZuuhv8KNsw0OrPnUBfXW6h5RJaZeSr+v72AlsB7c
	Jm/06iFTisJJ0lBVrMx+/qK3IYydl3MwIOiG7ijySAsmAq/4AXwx7QEERMjKIc/Jh1LZ
	eVJ2ihWdWPO1dURB23Y6Cey7cArNE1O91z+LB+o+DyIy9PMdDMVSC1coycLQr9JR8Ss8
	oq2A==
X-Gm-Message-State: APjAAAXwZG5GqDJlbEnuvWG7HsjG/zMtrC+DxQNIi+P4Ebp4dHaCzqdE
	kv9mMAQNfpe1gakq+mMdoxjgUmYFwUI=
X-Google-Smtp-Source: APXvYqxp23ZfJn9INY+Zw6SoKrqSGNb5yN/aPBO/0s9K9GS/sXrL92CowU56KyLotdWfg9qh2MNxIQ==
X-Received: by 2002:a05:620a:231:: with SMTP id
	u17mr27966989qkm.359.1558393870969; 
	Mon, 20 May 2019 16:11:10 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	c30sm12172385qta.25.2019.05.20.16.11.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 16:11:10 -0700 (PDT)
Date: Mon, 20 May 2019 19:11:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190424041959.4087-3-david@gibson.dropbear.id.au>
References: <20190520231008.20140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520231008.20140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.196
Subject: [Qemu-devel] [PULL v2 21/36] pci: Simplify pci_bus_is_root()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
	Peter Xu <peterx@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Gibson <david@gibson.dropbear.id.au>

pci_bus_is_root() currently relies on a method in the PCIBusClass.
But it's always known if a PCI bus is a root bus when we create it, so
using a dynamic method is overkill.

This replaces it with an IS_ROOT bit in a new flags field, which is set on
root buses and otherwise clear.  As a bonus this removes the special
is_root logic from pci_expander_bridge, since it already creates its bus
as a root bus.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20190424041959.4087-3-david@gibson.dropbear.id.au>
---
 include/hw/pci/pci.h                |  1 -
 include/hw/pci/pci_bus.h            | 12 +++++++++++-
 hw/pci-bridge/pci_expander_bridge.c |  6 ------
 hw/pci/pci.c                        | 14 ++------------
 hw/virtio/virtio-pci.c              |  1 +
 5 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index fdd4c43d3a..edf44de21d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -395,7 +395,6 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 #define TYPE_PCIE_BUS "PCIE"
 
 bool pci_bus_is_express(PCIBus *bus);
-bool pci_bus_is_root(PCIBus *bus);
 bool pci_bus_allows_extended_config_space(PCIBus *bus);
 
 void pci_root_bus_new_inplace(PCIBus *bus, size_t bus_size, DeviceState *parent,
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index f6df834170..aea98d5040 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -15,14 +15,19 @@ typedef struct PCIBusClass {
     BusClass parent_class;
     /*< public >*/
 
-    bool (*is_root)(PCIBus *bus);
     int (*bus_num)(PCIBus *bus);
     uint16_t (*numa_node)(PCIBus *bus);
     bool (*allows_extended_config_space)(PCIBus *bus);
 } PCIBusClass;
 
+enum PCIBusFlags {
+    /* This bus is the root of a PCI domain */
+    PCI_BUS_IS_ROOT                                         = 0x0001,
+};
+
 struct PCIBus {
     BusState qbus;
+    enum PCIBusFlags flags;
     PCIIOMMUFunc iommu_fn;
     void *iommu_opaque;
     uint8_t devfn_min;
@@ -47,4 +52,9 @@ struct PCIBus {
     Notifier machine_done;
 };
 
+static inline bool pci_bus_is_root(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_IS_ROOT);
+}
+
 #endif /* QEMU_PCI_BUS_H */
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index e62de4218f..ca66bc721a 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -66,11 +66,6 @@ static int pxb_bus_num(PCIBus *bus)
     return pxb->bus_nr;
 }
 
-static bool pxb_is_root(PCIBus *bus)
-{
-    return true; /* by definition */
-}
-
 static uint16_t pxb_bus_numa_node(PCIBus *bus)
 {
     PXBDev *pxb = convert_to_pxb(bus->parent_dev);
@@ -83,7 +78,6 @@ static void pxb_bus_class_init(ObjectClass *class, void *data)
     PCIBusClass *pbc = PCI_BUS_CLASS(class);
 
     pbc->bus_num = pxb_bus_num;
-    pbc->is_root = pxb_is_root;
     pbc->numa_node = pxb_bus_numa_node;
 }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a78023f669..b386777045 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -129,14 +129,9 @@ static void pci_bus_unrealize(BusState *qbus, Error **errp)
     vmstate_unregister(NULL, &vmstate_pcibus, bus);
 }
 
-static bool pcibus_is_root(PCIBus *bus)
-{
-    return !bus->parent_dev;
-}
-
 static int pcibus_num(PCIBus *bus)
 {
-    if (pcibus_is_root(bus)) {
+    if (pci_bus_is_root(bus)) {
         return 0; /* pci host bridge */
     }
     return bus->parent_dev->config[PCI_SECONDARY_BUS];
@@ -164,7 +159,6 @@ static void pci_bus_class_init(ObjectClass *klass, void *data)
     k->unrealize = pci_bus_unrealize;
     k->reset = pcibus_reset;
 
-    pbc->is_root = pcibus_is_root;
     pbc->bus_num = pcibus_num;
     pbc->numa_node = pcibus_numa_node;
     pbc->allows_extended_config_space = pcibus_allows_extended_config_space;
@@ -398,6 +392,7 @@ static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
     bus->slot_reserved_mask = 0x0;
     bus->address_space_mem = address_space_mem;
     bus->address_space_io = address_space_io;
+    bus->flags |= PCI_BUS_IS_ROOT;
 
     /* host bridge */
     QLIST_INIT(&bus->child);
@@ -415,11 +410,6 @@ bool pci_bus_is_express(PCIBus *bus)
     return object_dynamic_cast(OBJECT(bus), TYPE_PCIE_BUS);
 }
 
-bool pci_bus_is_root(PCIBus *bus)
-{
-    return PCI_BUS_GET_CLASS(bus)->is_root(bus);
-}
-
 bool pci_bus_allows_extended_config_space(PCIBus *bus)
 {
     return PCI_BUS_GET_CLASS(bus)->allows_extended_config_space(bus);
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 509c1ff555..9056cdfa3c 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -20,6 +20,7 @@
 #include "standard-headers/linux/virtio_pci.h"
 #include "hw/virtio/virtio.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/pci/msi.h"
-- 
MST


