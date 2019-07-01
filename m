Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772921B044
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 08:24:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ4OP-0006TG-GH
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 02:24:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hQ4JR-0002h2-3Y
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hQ4JP-0004LK-Qf
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:19:49 -0400
Received: from ozlabs.org ([203.11.71.1]:45615)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hQ4JO-0004KB-O9; Mon, 13 May 2019 02:19:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 452Vz23RZtz9s4V; Mon, 13 May 2019 16:19:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1557728382;
	bh=eXt6jbXbDf70/Q2NJBka7jj4BKphfb5wCwAJcdlJZis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mUHZ9VSDjUr4KdNQIuzKi5+CloY82L5r6bTrO5MWo+oqkX7d0j2l7ZWhvmlBbuHfO
	24nl2O7uq7B2WafSDTxaSQvqBbGwNzfT6f1jg0wNxZq+f4iFcyvQ/9brr+vOoWjfGj
	4ZdNtkE1Bn3QfkngMvjvKGZInMbl7rLiJNUXkdys=
From: David Gibson <david@gibson.dropbear.id.au>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Date: Mon, 13 May 2019 16:19:36 +1000
Message-Id: <20190513061939.3464-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513061939.3464-1-david@gibson.dropbear.id.au>
References: <20190513061939.3464-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH v4 2/5] pci: Simplify pci_bus_is_root()
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
Cc: aik@ozlabs.ru, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	groug@kaod.org, Peter Xu <peterx@redhat.com>,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pci_bus_is_root() currently relies on a method in the PCIBusClass.
But it's always known if a PCI bus is a root bus when we create it, so
using a dynamic method is overkill.

This replaces it with an IS_ROOT bit in a new flags field, which is set o=
n
root buses and otherwise clear.  As a bonus this removes the special
is_root logic from pci_expander_bridge, since it already creates its bus
as a root bus.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/pci-bridge/pci_expander_bridge.c |  6 ------
 hw/pci/pci.c                        | 14 ++------------
 hw/virtio/virtio-pci.c              |  1 +
 include/hw/pci/pci.h                |  1 -
 include/hw/pci/pci_bus.h            | 12 +++++++++++-
 5 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expa=
nder_bridge.c
index e62de4218f..ca66bc721a 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -66,11 +66,6 @@ static int pxb_bus_num(PCIBus *bus)
     return pxb->bus_nr;
 }
=20
-static bool pxb_is_root(PCIBus *bus)
-{
-    return true; /* by definition */
-}
-
 static uint16_t pxb_bus_numa_node(PCIBus *bus)
 {
     PXBDev *pxb =3D convert_to_pxb(bus->parent_dev);
@@ -83,7 +78,6 @@ static void pxb_bus_class_init(ObjectClass *class, void=
 *data)
     PCIBusClass *pbc =3D PCI_BUS_CLASS(class);
=20
     pbc->bus_num =3D pxb_bus_num;
-    pbc->is_root =3D pxb_is_root;
     pbc->numa_node =3D pxb_bus_numa_node;
 }
=20
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a78023f669..b386777045 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -129,14 +129,9 @@ static void pci_bus_unrealize(BusState *qbus, Error =
**errp)
     vmstate_unregister(NULL, &vmstate_pcibus, bus);
 }
=20
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
@@ -164,7 +159,6 @@ static void pci_bus_class_init(ObjectClass *klass, vo=
id *data)
     k->unrealize =3D pci_bus_unrealize;
     k->reset =3D pcibus_reset;
=20
-    pbc->is_root =3D pcibus_is_root;
     pbc->bus_num =3D pcibus_num;
     pbc->numa_node =3D pcibus_numa_node;
     pbc->allows_extended_config_space =3D pcibus_allows_extended_config_=
space;
@@ -398,6 +392,7 @@ static void pci_root_bus_init(PCIBus *bus, DeviceStat=
e *parent,
     bus->slot_reserved_mask =3D 0x0;
     bus->address_space_mem =3D address_space_mem;
     bus->address_space_io =3D address_space_io;
+    bus->flags |=3D PCI_BUS_IS_ROOT;
=20
     /* host bridge */
     QLIST_INIT(&bus->child);
@@ -415,11 +410,6 @@ bool pci_bus_is_express(PCIBus *bus)
     return object_dynamic_cast(OBJECT(bus), TYPE_PCIE_BUS);
 }
=20
-bool pci_bus_is_root(PCIBus *bus)
-{
-    return PCI_BUS_GET_CLASS(bus)->is_root(bus);
-}
-
 bool pci_bus_allows_extended_config_space(PCIBus *bus)
 {
     return PCI_BUS_GET_CLASS(bus)->allows_extended_config_space(bus);
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index cb44e19b67..942173d830 100644
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
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index fdd4c43d3a..edf44de21d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -395,7 +395,6 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque=
, int pin);
 #define TYPE_PCIE_BUS "PCIE"
=20
 bool pci_bus_is_express(PCIBus *bus);
-bool pci_bus_is_root(PCIBus *bus);
 bool pci_bus_allows_extended_config_space(PCIBus *bus);
=20
 void pci_root_bus_new_inplace(PCIBus *bus, size_t bus_size, DeviceState =
*parent,
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index f6df834170..aea98d5040 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -15,14 +15,19 @@ typedef struct PCIBusClass {
     BusClass parent_class;
     /*< public >*/
=20
-    bool (*is_root)(PCIBus *bus);
     int (*bus_num)(PCIBus *bus);
     uint16_t (*numa_node)(PCIBus *bus);
     bool (*allows_extended_config_space)(PCIBus *bus);
 } PCIBusClass;
=20
+enum PCIBusFlags {
+    /* This bus is the root of a PCI domain */
+    PCI_BUS_IS_ROOT                                         =3D 0x0001,
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
=20
+static inline bool pci_bus_is_root(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_IS_ROOT);
+}
+
 #endif /* QEMU_PCI_BUS_H */
--=20
2.21.0


