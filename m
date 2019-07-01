Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C349F41BAE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 07:55:09 +0200 (CEST)
Received: from localhost ([::1]:56836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hawDz-00021u-9J
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 01:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8m-0004Ux-8q
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8k-00073L-UW
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:44 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34235 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1haw8k-00071A-GK; Wed, 12 Jun 2019 01:49:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45NwtR2Dcxz9sPG; Wed, 12 Jun 2019 15:49:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560318575;
 bh=Dc4e87KbcUk5ty+IGSWNE2GcGV1SyAd7CLeN6PnTLas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G55+4eoy8K+fVQhB3IrHB3OnJWCbU/UZWR2e4HQ1B2BEx58apc/+0/Vc6uNYVAbkq
 ck5B+WKz053gmvgvvh7ZxLVe/ISCQEVnhAmmJpXKca3wW3GmS4qsSDHn74R7ybXbK3
 n2aYgHV86Y4eSUlaHypXvoBJKM/zCRV0Ld6B0m+4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 12 Jun 2019 15:49:25 +1000
Message-Id: <20190612054929.21136-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612054929.21136-1-david@gibson.dropbear.id.au>
References: <20190612054929.21136-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 09/13] spapr: Direct all PCI hotplug to host
 bridge, rather than P2P bridge
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
Cc: lvivier@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A P2P bridge will attempt to handle the hotplug with SHPC, which doesn't
work in the PAPR environment.  Instead we want to direct all PCI hotplug
actions to the PAPR specific host bridge which will use the PAPR hotplug
mechanism.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/ppc/spapr.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 507fd50dd5..6dd8aaac33 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4094,6 +4094,17 @@ static HotplugHandler *spapr_get_hotplug_handler(M=
achineState *machine,
         object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
         return HOTPLUG_HANDLER(machine);
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        PCIDevice *pcidev =3D PCI_DEVICE(dev);
+        PCIBus *root =3D pci_device_root_bus(pcidev);
+        SpaprPhbState *phb =3D
+            (SpaprPhbState *)object_dynamic_cast(OBJECT(BUS(root)->paren=
t),
+                                                 TYPE_SPAPR_PCI_HOST_BRI=
DGE);
+
+        if (phb) {
+            return HOTPLUG_HANDLER(phb);
+        }
+    }
     return NULL;
 }
=20
--=20
2.21.0


