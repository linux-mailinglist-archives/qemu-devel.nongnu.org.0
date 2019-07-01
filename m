Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6719D12869
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 09:04:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMSFW-0007YX-Je
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 03:04:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMSAx-0003oO-4r
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:00:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMSAu-0006IU-BU
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:00:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54294)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hMSAu-0006II-1o
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:00:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8046A30C021B;
	Fri,  3 May 2019 07:00:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 687C75C642;
	Fri,  3 May 2019 06:59:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 53EAE1753A; Fri,  3 May 2019 08:59:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 08:59:53 +0200
Message-Id: <20190503065954.17069-7-kraxel@redhat.com>
In-Reply-To: <20190503065954.17069-1-kraxel@redhat.com>
References: <20190503065954.17069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 03 May 2019 07:00:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 6/7] hw/usb/hcd-ohci: Move PCI-related code into
 a separate file
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Some machines (like the pxa2xx-based ARM machines) only have a sysbus
OHCI controller, but no PCI. With the new Kconfig-style build system,
it will soon be possible to create QEMU binaries that only contain
such PCI-less machines. However, the two OHCI controllers, for sysbus
and for PCI, are currently both located in one file, so the PCI code
is still required for linking here. Move the OHCI-PCI device code
into a separate file, so that it is possible to use the sysbus OHCI
device also without the PCI dependency.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190419075625.24251-3-thuth@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ohci.h     | 104 ++++++++++++++++++++
 hw/usb/hcd-ohci-pci.c | 163 +++++++++++++++++++++++++++++++
 hw/usb/hcd-ohci.c     | 216 ++----------------------------------------
 hw/sh4/Kconfig        |   2 +-
 hw/usb/Kconfig        |   6 +-
 hw/usb/Makefile.objs  |   1 +
 6 files changed, 284 insertions(+), 208 deletions(-)
 create mode 100644 hw/usb/hcd-ohci.h
 create mode 100644 hw/usb/hcd-ohci-pci.c

diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
new file mode 100644
index 000000000000..16e3f1e13a31
--- /dev/null
+++ b/hw/usb/hcd-ohci.h
@@ -0,0 +1,104 @@
+/*
+ * QEMU USB OHCI Emulation
+ * Copyright (c) 2004 Gianni Tedesco
+ * Copyright (c) 2006 CodeSourcery
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
+ */
+
+#ifndef HCD_OHCI_H
+#define HCD_OHCI_H
+
+#include "sysemu/dma.h"
+
+/* Number of Downstream Ports on the root hub: */
+#define OHCI_MAX_PORTS 15
+
+typedef struct OHCIPort {
+    USBPort port;
+    uint32_t ctrl;
+} OHCIPort;
+
+typedef struct OHCIState {
+    USBBus bus;
+    qemu_irq irq;
+    MemoryRegion mem;
+    AddressSpace *as;
+    uint32_t num_ports;
+    const char *name;
+
+    QEMUTimer *eof_timer;
+    int64_t sof_time;
+
+    /* OHCI state */
+    /* Control partition */
+    uint32_t ctl, status;
+    uint32_t intr_status;
+    uint32_t intr;
+
+    /* memory pointer partition */
+    uint32_t hcca;
+    uint32_t ctrl_head, ctrl_cur;
+    uint32_t bulk_head, bulk_cur;
+    uint32_t per_cur;
+    uint32_t done;
+    int32_t done_count;
+
+    /* Frame counter partition */
+    uint16_t fsmps;
+    uint8_t fit;
+    uint16_t fi;
+    uint8_t frt;
+    uint16_t frame_number;
+    uint16_t padding;
+    uint32_t pstart;
+    uint32_t lst;
+
+    /* Root Hub partition */
+    uint32_t rhdesc_a, rhdesc_b;
+    uint32_t rhstatus;
+    OHCIPort rhport[OHCI_MAX_PORTS];
+
+    /* PXA27x Non-OHCI events */
+    uint32_t hstatus;
+    uint32_t hmask;
+    uint32_t hreset;
+    uint32_t htest;
+
+    /* SM501 local memory offset */
+    dma_addr_t localmem_base;
+
+    /* Active packets.  */
+    uint32_t old_ctl;
+    USBPacket usb_packet;
+    uint8_t usb_buf[8192];
+    uint32_t async_td;
+    bool async_complete;
+
+    void (*ohci_die)(struct OHCIState *ohci);
+} OHCIState;
+
+extern const VMStateDescription vmstate_ohci_state;
+
+void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports=
,
+                   dma_addr_t localmem_base, char *masterbus,
+                   uint32_t firstport, AddressSpace *as,
+                   void (*ohci_die_fn)(struct OHCIState *), Error **errp=
);
+void ohci_bus_stop(OHCIState *ohci);
+void ohci_stop_endpoints(OHCIState *ohci);
+void ohci_hard_reset(OHCIState *ohci);
+void ohci_sysbus_die(struct OHCIState *ohci);
+
+#endif
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
new file mode 100644
index 000000000000..e8f372c6ad30
--- /dev/null
+++ b/hw/usb/hcd-ohci-pci.c
@@ -0,0 +1,163 @@
+/*
+ * QEMU USB OHCI Emulation
+ * Copyright (c) 2004 Gianni Tedesco
+ * Copyright (c) 2006 CodeSourcery
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
+#include "hw/usb.h"
+#include "hw/pci/pci.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-dma.h"
+#include "trace.h"
+#include "hcd-ohci.h"
+
+#define TYPE_PCI_OHCI "pci-ohci"
+#define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI)
+
+typedef struct {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+
+    OHCIState state;
+    char *masterbus;
+    uint32_t num_ports;
+    uint32_t firstport;
+} OHCIPCIState;
+
+/**
+ * A typical PCI OHCI will additionally set PERR in its configspace to
+ * signal that it got an error.
+ */
+static void ohci_pci_die(struct OHCIState *ohci)
+{
+    OHCIPCIState *dev =3D container_of(ohci, OHCIPCIState, state);
+
+    ohci_sysbus_die(ohci);
+
+    pci_set_word(dev->parent_obj.config + PCI_STATUS,
+                 PCI_STATUS_DETECTED_PARITY);
+}
+
+static void usb_ohci_realize_pci(PCIDevice *dev, Error **errp)
+{
+    Error *err =3D NULL;
+    OHCIPCIState *ohci =3D PCI_OHCI(dev);
+
+    dev->config[PCI_CLASS_PROG] =3D 0x10; /* OHCI */
+    dev->config[PCI_INTERRUPT_PIN] =3D 0x01; /* interrupt pin A */
+
+    usb_ohci_init(&ohci->state, DEVICE(dev), ohci->num_ports, 0,
+                  ohci->masterbus, ohci->firstport,
+                  pci_get_address_space(dev), ohci_pci_die, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    ohci->state.irq =3D pci_allocate_irq(dev);
+    pci_register_bar(dev, 0, 0, &ohci->state.mem);
+}
+
+static void usb_ohci_exit(PCIDevice *dev)
+{
+    OHCIPCIState *ohci =3D PCI_OHCI(dev);
+    OHCIState *s =3D &ohci->state;
+
+    trace_usb_ohci_exit(s->name);
+    ohci_bus_stop(s);
+
+    if (s->async_td) {
+        usb_cancel_packet(&s->usb_packet);
+        s->async_td =3D 0;
+    }
+    ohci_stop_endpoints(s);
+
+    if (!ohci->masterbus) {
+        usb_bus_release(&s->bus);
+    }
+
+    timer_del(s->eof_timer);
+    timer_free(s->eof_timer);
+}
+
+static void usb_ohci_reset_pci(DeviceState *d)
+{
+    PCIDevice *dev =3D PCI_DEVICE(d);
+    OHCIPCIState *ohci =3D PCI_OHCI(dev);
+    OHCIState *s =3D &ohci->state;
+
+    ohci_hard_reset(s);
+}
+
+static Property ohci_pci_properties[] =3D {
+    DEFINE_PROP_STRING("masterbus", OHCIPCIState, masterbus),
+    DEFINE_PROP_UINT32("num-ports", OHCIPCIState, num_ports, 3),
+    DEFINE_PROP_UINT32("firstport", OHCIPCIState, firstport, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_ohci =3D {
+    .name =3D "ohci",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj, OHCIPCIState),
+        VMSTATE_STRUCT(state, OHCIPCIState, 1, vmstate_ohci_state, OHCIS=
tate),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void ohci_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
+
+    k->realize =3D usb_ohci_realize_pci;
+    k->exit =3D usb_ohci_exit;
+    k->vendor_id =3D PCI_VENDOR_ID_APPLE;
+    k->device_id =3D PCI_DEVICE_ID_APPLE_IPID_USB;
+    k->class_id =3D PCI_CLASS_SERIAL_USB;
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+    dc->desc =3D "Apple USB Controller";
+    dc->props =3D ohci_pci_properties;
+    dc->hotpluggable =3D false;
+    dc->vmsd =3D &vmstate_ohci;
+    dc->reset =3D usb_ohci_reset_pci;
+}
+
+static const TypeInfo ohci_pci_info =3D {
+    .name          =3D TYPE_PCI_OHCI,
+    .parent        =3D TYPE_PCI_DEVICE,
+    .instance_size =3D sizeof(OHCIPCIState),
+    .class_init    =3D ohci_pci_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void ohci_pci_register_types(void)
+{
+    type_register_static(&ohci_pci_info);
+}
+
+type_init(ohci_pci_register_types)
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 6d3f556989fb..aaba09058896 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -30,87 +30,19 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "hw/usb.h"
-#include "hw/pci/pci.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-dma.h"
 #include "trace.h"
+#include "hcd-ohci.h"
=20
 /* This causes frames to occur 1000x slower */
 //#define OHCI_TIME_WARP 1
=20
-/* Number of Downstream Ports on the root hub.  */
-
-#define OHCI_MAX_PORTS 15
-
 #define ED_LINK_LIMIT 32
=20
 static int64_t usb_frame_time;
 static int64_t usb_bit_time;
=20
-typedef struct OHCIPort {
-    USBPort port;
-    uint32_t ctrl;
-} OHCIPort;
-
-typedef struct OHCIState {
-    USBBus bus;
-    qemu_irq irq;
-    MemoryRegion mem;
-    AddressSpace *as;
-    uint32_t num_ports;
-    const char *name;
-
-    QEMUTimer *eof_timer;
-    int64_t sof_time;
-
-    /* OHCI state */
-    /* Control partition */
-    uint32_t ctl, status;
-    uint32_t intr_status;
-    uint32_t intr;
-
-    /* memory pointer partition */
-    uint32_t hcca;
-    uint32_t ctrl_head, ctrl_cur;
-    uint32_t bulk_head, bulk_cur;
-    uint32_t per_cur;
-    uint32_t done;
-    int32_t done_count;
-
-    /* Frame counter partition */
-    uint16_t fsmps;
-    uint8_t fit;
-    uint16_t fi;
-    uint8_t frt;
-    uint16_t frame_number;
-    uint16_t padding;
-    uint32_t pstart;
-    uint32_t lst;
-
-    /* Root Hub partition */
-    uint32_t rhdesc_a, rhdesc_b;
-    uint32_t rhstatus;
-    OHCIPort rhport[OHCI_MAX_PORTS];
-
-    /* PXA27x Non-OHCI events */
-    uint32_t hstatus;
-    uint32_t hmask;
-    uint32_t hreset;
-    uint32_t htest;
-
-    /* SM501 local memory offset */
-    dma_addr_t localmem_base;
-
-    /* Active packets.  */
-    uint32_t old_ctl;
-    USBPacket usb_packet;
-    uint8_t usb_buf[8192];
-    uint32_t async_td;
-    bool async_complete;
-
-    void (*ohci_die)(struct OHCIState *ohci);
-} OHCIState;
-
 /* Host Controller Communications Area */
 struct ohci_hcca {
     uint32_t intr[32];
@@ -123,7 +55,6 @@ struct ohci_hcca {
 #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
 #define ED_WBACK_SIZE   4
=20
-static void ohci_bus_stop(OHCIState *ohci);
 static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev);
=20
 /* Bitfields for the first word of an Endpoint Desciptor.  */
@@ -430,7 +361,7 @@ static USBDevice *ohci_find_device(OHCIState *ohci, u=
int8_t addr)
     return NULL;
 }
=20
-static void ohci_stop_endpoints(OHCIState *ohci)
+void ohci_stop_endpoints(OHCIState *ohci)
 {
     USBDevice *dev;
     int i, j;
@@ -502,7 +433,7 @@ static void ohci_soft_reset(OHCIState *ohci)
     ohci->lst =3D OHCI_LS_THRESH;
 }
=20
-static void ohci_hard_reset(OHCIState *ohci)
+void ohci_hard_reset(OHCIState *ohci)
 {
     ohci_soft_reset(ohci);
     ohci->ctl =3D 0;
@@ -1376,7 +1307,7 @@ static int ohci_bus_start(OHCIState *ohci)
 }
=20
 /* Stop sending SOF tokens on the bus */
-static void ohci_bus_stop(OHCIState *ohci)
+void ohci_bus_stop(OHCIState *ohci)
 {
     trace_usb_ohci_stop(ohci->name);
     timer_del(ohci->eof_timer);
@@ -1856,10 +1787,10 @@ static USBPortOps ohci_port_ops =3D {
 static USBBusOps ohci_bus_ops =3D {
 };
=20
-static void usb_ohci_init(OHCIState *ohci, DeviceState *dev,
-                          uint32_t num_ports, dma_addr_t localmem_base,
-                          char *masterbus, uint32_t firstport, AddressSp=
ace *as,
-                          void (*ohci_die_fn)(struct OHCIState *), Error=
 **errp)
+void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports=
,
+                   dma_addr_t localmem_base, char *masterbus,
+                   uint32_t firstport, AddressSpace *as,
+                   void (*ohci_die_fn)(struct OHCIState *), Error **errp=
)
 {
     Error *err =3D NULL;
     int i;
@@ -1924,25 +1855,11 @@ static void usb_ohci_init(OHCIState *ohci, Device=
State *dev,
                                    ohci_frame_boundary, ohci);
 }
=20
-#define TYPE_PCI_OHCI "pci-ohci"
-#define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI)
-
-typedef struct {
-    /*< private >*/
-    PCIDevice parent_obj;
-    /*< public >*/
-
-    OHCIState state;
-    char *masterbus;
-    uint32_t num_ports;
-    uint32_t firstport;
-} OHCIPCIState;
-
 /**
  * A typical OHCI will stop operating and set itself into error state
  * (which can be queried by MMIO) to signal that it got an error.
  */
-static void ohci_sysbus_die(struct OHCIState *ohci)
+void ohci_sysbus_die(struct OHCIState *ohci)
 {
     trace_usb_ohci_die();
=20
@@ -1950,71 +1867,6 @@ static void ohci_sysbus_die(struct OHCIState *ohci=
)
     ohci_bus_stop(ohci);
 }
=20
-/**
- * A typical PCI OHCI will additionally set PERR in its configspace to
- * signal that it got an error.
- */
-static void ohci_pci_die(struct OHCIState *ohci)
-{
-    OHCIPCIState *dev =3D container_of(ohci, OHCIPCIState, state);
-
-    ohci_sysbus_die(ohci);
-
-    pci_set_word(dev->parent_obj.config + PCI_STATUS,
-                 PCI_STATUS_DETECTED_PARITY);
-}
-
-static void usb_ohci_realize_pci(PCIDevice *dev, Error **errp)
-{
-    Error *err =3D NULL;
-    OHCIPCIState *ohci =3D PCI_OHCI(dev);
-
-    dev->config[PCI_CLASS_PROG] =3D 0x10; /* OHCI */
-    dev->config[PCI_INTERRUPT_PIN] =3D 0x01; /* interrupt pin A */
-
-    usb_ohci_init(&ohci->state, DEVICE(dev), ohci->num_ports, 0,
-                  ohci->masterbus, ohci->firstport,
-                  pci_get_address_space(dev), ohci_pci_die, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
-    ohci->state.irq =3D pci_allocate_irq(dev);
-    pci_register_bar(dev, 0, 0, &ohci->state.mem);
-}
-
-static void usb_ohci_exit(PCIDevice *dev)
-{
-    OHCIPCIState *ohci =3D PCI_OHCI(dev);
-    OHCIState *s =3D &ohci->state;
-
-    trace_usb_ohci_exit(s->name);
-    ohci_bus_stop(s);
-
-    if (s->async_td) {
-        usb_cancel_packet(&s->usb_packet);
-        s->async_td =3D 0;
-    }
-    ohci_stop_endpoints(s);
-
-    if (!ohci->masterbus) {
-        usb_bus_release(&s->bus);
-    }
-
-    timer_del(s->eof_timer);
-    timer_free(s->eof_timer);
-}
-
-static void usb_ohci_reset_pci(DeviceState *d)
-{
-    PCIDevice *dev =3D PCI_DEVICE(d);
-    OHCIPCIState *ohci =3D PCI_OHCI(dev);
-    OHCIState *s =3D &ohci->state;
-
-    ohci_hard_reset(s);
-}
-
 #define TYPE_SYSBUS_OHCI "sysbus-ohci"
 #define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SYSBU=
S_OHCI)
=20
@@ -2055,13 +1907,6 @@ static void usb_ohci_reset_sysbus(DeviceState *dev=
)
     ohci_hard_reset(ohci);
 }
=20
-static Property ohci_pci_properties[] =3D {
-    DEFINE_PROP_STRING("masterbus", OHCIPCIState, masterbus),
-    DEFINE_PROP_UINT32("num-ports", OHCIPCIState, num_ports, 3),
-    DEFINE_PROP_UINT32("firstport", OHCIPCIState, firstport, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static const VMStateDescription vmstate_ohci_state_port =3D {
     .name =3D "ohci-core/port",
     .version_id =3D 1,
@@ -2090,7 +1935,7 @@ static const VMStateDescription vmstate_ohci_eof_ti=
mer =3D {
     },
 };
=20
-static const VMStateDescription vmstate_ohci_state =3D {
+const VMStateDescription vmstate_ohci_state =3D {
     .name =3D "ohci-core",
     .version_id =3D 1,
     .minimum_version_id =3D 1,
@@ -2137,46 +1982,6 @@ static const VMStateDescription vmstate_ohci_state=
 =3D {
     }
 };
=20
-static const VMStateDescription vmstate_ohci =3D {
-    .name =3D "ohci",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
-    .fields =3D (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(parent_obj, OHCIPCIState),
-        VMSTATE_STRUCT(state, OHCIPCIState, 1, vmstate_ohci_state, OHCIS=
tate),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void ohci_pci_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(klass);
-    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
-
-    k->realize =3D usb_ohci_realize_pci;
-    k->exit =3D usb_ohci_exit;
-    k->vendor_id =3D PCI_VENDOR_ID_APPLE;
-    k->device_id =3D PCI_DEVICE_ID_APPLE_IPID_USB;
-    k->class_id =3D PCI_CLASS_SERIAL_USB;
-    set_bit(DEVICE_CATEGORY_USB, dc->categories);
-    dc->desc =3D "Apple USB Controller";
-    dc->props =3D ohci_pci_properties;
-    dc->hotpluggable =3D false;
-    dc->vmsd =3D &vmstate_ohci;
-    dc->reset =3D usb_ohci_reset_pci;
-}
-
-static const TypeInfo ohci_pci_info =3D {
-    .name          =3D TYPE_PCI_OHCI,
-    .parent        =3D TYPE_PCI_DEVICE,
-    .instance_size =3D sizeof(OHCIPCIState),
-    .class_init    =3D ohci_pci_class_init,
-    .interfaces =3D (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
 static Property ohci_sysbus_properties[] =3D {
     DEFINE_PROP_STRING("masterbus", OHCISysBusState, masterbus),
     DEFINE_PROP_UINT32("num-ports", OHCISysBusState, num_ports, 3),
@@ -2205,7 +2010,6 @@ static const TypeInfo ohci_sysbus_info =3D {
=20
 static void ohci_register_types(void)
 {
-    type_register_static(&ohci_pci_info);
     type_register_static(&ohci_sysbus_info);
 }
=20
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 593662d28ade..4cbce3a0ed5e 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -6,7 +6,7 @@ config R2D
     select I82378 if TEST_DEVICES
     select IDE_MMIO
     select PFLASH_CFI02
-    select USB_OHCI
+    select USB_OHCI_PCI
     select PCI
     select SM501
     select SH4
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index a1b7acb12a37..564305e28339 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -8,10 +8,14 @@ config USB_UHCI
     select USB
=20
 config USB_OHCI
+    bool
+    select USB
+
+config USB_OHCI_PCI
     bool
     default y if PCI_DEVICES
     depends on PCI
-    select USB
+    select USB_OHCI
=20
 config USB_EHCI
     bool
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 2b929649acd0..81688f6e7062 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -5,6 +5,7 @@ common-obj-$(CONFIG_USB) +=3D desc.o desc-msos.o
 # usb host adapters
 common-obj-$(CONFIG_USB_UHCI) +=3D hcd-uhci.o
 common-obj-$(CONFIG_USB_OHCI) +=3D hcd-ohci.o
+common-obj-$(CONFIG_USB_OHCI_PCI) +=3D hcd-ohci-pci.o
 common-obj-$(CONFIG_USB_EHCI) +=3D hcd-ehci.o hcd-ehci-pci.o
 common-obj-$(CONFIG_USB_EHCI_SYSBUS) +=3D hcd-ehci.o hcd-ehci-sysbus.o
 common-obj-$(CONFIG_USB_XHCI) +=3D hcd-xhci.o
--=20
2.18.1


