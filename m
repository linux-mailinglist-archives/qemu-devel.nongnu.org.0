Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF61B043
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 08:24:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ4OO-0006TL-K1
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 02:24:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hQ4JR-0002h3-9u
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hQ4JP-0004LU-RC
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:19:49 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54939 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hQ4JO-0004KM-Ng; Mon, 13 May 2019 02:19:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 452Vz304S2z9sN6; Mon, 13 May 2019 16:19:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1557728383;
	bh=RKOH6Pg3qJU+4Km9IdQsBWZQJ1p/0qK29BKTd3RTKoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QsEm3xbW2UwmfuySN4nW74ZJUEUmZ4+oqyD3L5WECr7dNVYnHsBTn2glNjbjodgzP
	yvElZEP1FHWiFqps4JdsDWB4JrMIPowF1zAWXZrNgxhdNJk/P3J9bWdPcYnw4b7QCr
	DFi3erpDKwr6BJXm6vg9Raa+ILiXfKMvtmmYo7rk=
From: David Gibson <david@gibson.dropbear.id.au>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Date: Mon, 13 May 2019 16:19:38 +1000
Message-Id: <20190513061939.3464-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513061939.3464-1-david@gibson.dropbear.id.au>
References: <20190513061939.3464-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PATCH v4 4/5] pci: Make is_bridge a bool
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
	groug@kaod.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The is_bridge field in PCIDevice acts as a bool, but is declared as an in=
t.
Declare it as a bool for clarity, and change everything that writes it to
use true/false instead of 0/1 to match.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/pci-bridge/dec.c                | 4 ++--
 hw/pci-bridge/i82801b11.c          | 2 +-
 hw/pci-bridge/pci_bridge_dev.c     | 2 +-
 hw/pci-bridge/pcie_pci_bridge.c    | 2 +-
 hw/pci-bridge/pcie_root_port.c     | 2 +-
 hw/pci-bridge/simba.c              | 2 +-
 hw/pci-bridge/xio3130_downstream.c | 2 +-
 hw/pci-bridge/xio3130_upstream.c   | 2 +-
 include/hw/pci/pci.h               | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index 8484bfd434..ca40253730 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -68,7 +68,7 @@ static void dec_21154_pci_bridge_class_init(ObjectClass=
 *klass, void *data)
     k->vendor_id =3D PCI_VENDOR_ID_DEC;
     k->device_id =3D PCI_DEVICE_ID_DEC_21154;
     k->config_write =3D pci_bridge_write_config;
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     dc->desc =3D "DEC 21154 PCI-PCI bridge";
     dc->reset =3D pci_bridge_reset;
     dc->vmsd =3D &vmstate_pci_device;
@@ -129,7 +129,7 @@ static void dec_21154_pci_host_class_init(ObjectClass=
 *klass, void *data)
     k->device_id =3D PCI_DEVICE_ID_DEC_21154;
     k->revision =3D 0x02;
     k->class_id =3D PCI_CLASS_BRIDGE_PCI;
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     /*
      * PCI-facing part of the host bridge, not usable without the
      * host-facing part, which can't be device_add'ed, yet.
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index 10e590e5c6..6d8b0f54a7 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -90,7 +90,7 @@ static void i82801b11_bridge_class_init(ObjectClass *kl=
ass, void *data)
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     k->vendor_id =3D PCI_VENDOR_ID_INTEL;
     k->device_id =3D PCI_DEVICE_ID_INTEL_82801BA_11;
     k->revision =3D ICH9_D2P_A2_REVISION;
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_de=
v.c
index ff6b8323da..c56ed1f52f 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -253,7 +253,7 @@ static void pci_bridge_dev_class_init(ObjectClass *kl=
ass, void *data)
     k->vendor_id =3D PCI_VENDOR_ID_REDHAT;
     k->device_id =3D PCI_DEVICE_ID_REDHAT_BRIDGE;
     k->class_id =3D PCI_CLASS_BRIDGE_PCI;
-    k->is_bridge =3D 1,
+    k->is_bridge =3D true;
     dc->desc =3D "Standard PCI Bridge";
     dc->reset =3D qdev_pci_bridge_dev_reset;
     dc->props =3D pci_bridge_dev_properties;
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bri=
dge.c
index d491b40d04..9a4fba413a 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -143,7 +143,7 @@ static void pcie_pci_bridge_class_init(ObjectClass *k=
lass, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(klass);
=20
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     k->vendor_id =3D PCI_VENDOR_ID_REDHAT;
     k->device_id =3D PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE;
     k->realize =3D pcie_pci_bridge_realize;
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_por=
t.c
index e94d918b6d..be3f4d5e03 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -162,7 +162,7 @@ static void rp_class_init(ObjectClass *klass, void *d=
ata)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     k->config_write =3D rp_write_config;
     k->realize =3D rp_realize;
     k->exit =3D rp_exit;
diff --git a/hw/pci-bridge/simba.c b/hw/pci-bridge/simba.c
index dea4c8c5e7..7cf0d6e047 100644
--- a/hw/pci-bridge/simba.c
+++ b/hw/pci-bridge/simba.c
@@ -76,7 +76,7 @@ static void simba_pci_bridge_class_init(ObjectClass *kl=
ass, void *data)
     k->device_id =3D PCI_DEVICE_ID_SUN_SIMBA;
     k->revision =3D 0x11;
     k->config_write =3D pci_bridge_write_config;
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->reset =3D pci_bridge_reset;
     dc->vmsd =3D &vmstate_pci_device;
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_d=
ownstream.c
index 467bbabe4c..ab2a51e15d 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -152,7 +152,7 @@ static void xio3130_downstream_class_init(ObjectClass=
 *klass, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     k->config_write =3D xio3130_downstream_write_config;
     k->realize =3D xio3130_downstream_realize;
     k->exit =3D xio3130_downstream_exitfn;
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_ups=
tream.c
index b524908cf1..1d41a49ab0 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -126,7 +126,7 @@ static void xio3130_upstream_class_init(ObjectClass *=
klass, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
-    k->is_bridge =3D 1;
+    k->is_bridge =3D true;
     k->config_write =3D xio3130_upstream_write_config;
     k->realize =3D xio3130_upstream_realize;
     k->exit =3D xio3130_upstream_exitfn;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index da20c915ef..d082707dfa 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -234,7 +234,7 @@ typedef struct PCIDeviceClass {
      * This doesn't mean pci host switch.
      * When card bus bridge is supported, this would be enhanced.
      */
-    int is_bridge;
+    bool is_bridge;
=20
     /* rom bar */
     const char *romfile;
--=20
2.21.0


