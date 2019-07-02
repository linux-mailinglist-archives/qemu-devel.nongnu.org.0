Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD915C94C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:25:59 +0200 (CEST)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCEo-0002th-OR
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58415)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByk-0004z3-Oh
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByj-0002vc-KR
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39983 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByj-0002sm-6z; Tue, 02 Jul 2019 02:09:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMj3Rs6z9sPk; Tue,  2 Jul 2019 16:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047745;
 bh=vW2yiuB8A1re/ycwHnc2Ml8ORZUUQdkfjMx4qm0Rx+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mnDR/KxIeg33QwXvwHBlMRbLKTvmN14jzsoMZz3OVG3m/jypNfJ4jiOr2vjfB1sen
 eNU8R6oZ7znBVK5hfzsLz5VHkUbBZfFpDQhq3/CktngQkLQA+TPfONqonmZc+tV/Tj
 hpTxAp/N4EtuSyaUaindYYjdWlU/GG8C3fRDgf+c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:22 +1000
Message-Id: <20190702060857.3926-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 14/49] spapr_pci: Fix DRC owner in
 spapr_dt_pci_bus()
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

spapr_dt_drc() scans the aliases of all DRConnector objects and filters
the ones that it will use to generate OF properties according to their
owner and type.

Passing bus->parent_dev _works_ if bus belongs to a PCI bridge, but it is
NULL if it is the PHB's root bus. This causes all allocated PCI DRCs to
be associated to all PHBs (visible in their "ibm,drc-types" properties).
As a consequence, hot unplugging a PHB results in PCI devices from the
other PHBs to be unplugged as well, and likely confuses the guest.

Use the same logic as in add_drcs() to ensure the correct owner is passed
to spapr_dt_drc().

Fixes: 14e714900f6b "spapr: Allow hot plug/unplug of PCI bridges and devi=
ces under PCI bridges"
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156084737348.512412.3552825999605902691.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index fbeb1c90ee..2dca1e57f3 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1343,6 +1343,7 @@ static void spapr_dt_pci_device_cb(PCIBus *bus, PCI=
Device *pdev,
 static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
                                void *fdt, int offset)
 {
+    Object *owner;
     PciWalkFdt cbinfo =3D {
         .fdt =3D fdt,
         .offset =3D offset,
@@ -1363,7 +1364,13 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, P=
CIBus *bus,
         return cbinfo.err;
     }
=20
-    ret =3D spapr_dt_drc(fdt, offset, OBJECT(bus->parent_dev),
+    if (pci_bus_is_root(bus)) {
+        owner =3D OBJECT(sphb);
+    } else {
+        owner =3D OBJECT(pci_bridge_get_device(bus));
+    }
+
+    ret =3D spapr_dt_drc(fdt, offset, owner,
                        SPAPR_DR_CONNECTOR_TYPE_PCI);
     if (ret) {
         return ret;
--=20
2.21.0


