Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDAC5C92C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:18:06 +0200 (CEST)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiC7B-0002O5-JB
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58317)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByh-0004r5-P6
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByg-0002s7-GP
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:19 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40123 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByg-0002nz-2Y; Tue, 02 Jul 2019 02:09:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMg4xDvz9sPX; Tue,  2 Jul 2019 16:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047743;
 bh=3lEr+MESFZD0be1ox06hv/RXOrEKuApQCasTBRwjQII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y1edzj2wh/OLlJUw+edNJuyHQdzyNuEfioWSs00VIuaLcItnu7a74M/VTzakVYawu
 uDYgOZpb/lF64SrJzIYUyerP3FbUivL4/3Pbr3ciL+e2LRPLVwQNw4RLiUSGzKaoO7
 dnlOPCcHwF412TTfIgTqGOtdGIaBMS1HZUteuwmo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:14 +1000
Message-Id: <20190702060857.3926-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 06/49] spapr_pci: Fix potential NULL pointer
 dereference in spapr_dt_pci_bus()
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Commit 14e714900f6 refactored the call to spapr_dt_drc(),
introducing a potential NULL pointer dereference while
accessing bus->parent_dev.
A trivial audit show 'bus' is not null in the two places
the static function spapr_dt_drc() is called.

Since the 'bus' parameter is not NULL in both callers, remove
remove the test on if (bus), and add an assert() to silent
static analyzers.

This fixes:

  /hw/ppc/spapr_pci.c: 1367 in spapr_dt_pci_bus()
  >>>     CID 1401933:  Null pointer dereferences  (FORWARD_NULL)
  >>>     Dereferencing null pointer "bus".
  1367         ret =3D spapr_dt_drc(fdt, offset, OBJECT(bus->parent_dev),
  1368                            SPAPR_DR_CONNECTOR_TYPE_PCI);

Fixes: 14e714900f6
Reported-by: Coverity (CID 1401933)
Suggested-by: Greg Kurz <groug@kaod.org>
Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190613213406.22053-1-philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 957ae88bbd..fbeb1c90ee 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1356,12 +1356,11 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, =
PCIBus *bus,
     _FDT(fdt_setprop_cell(fdt, offset, "#size-cells",
                           RESOURCE_CELLS_SIZE));
=20
-    if (bus) {
-        pci_for_each_device_reverse(bus, pci_bus_num(bus),
-                                    spapr_dt_pci_device_cb, &cbinfo);
-        if (cbinfo.err) {
-            return cbinfo.err;
-        }
+    assert(bus);
+    pci_for_each_device_reverse(bus, pci_bus_num(bus),
+                                spapr_dt_pci_device_cb, &cbinfo);
+    if (cbinfo.err) {
+        return cbinfo.err;
     }
=20
     ret =3D spapr_dt_drc(fdt, offset, OBJECT(bus->parent_dev),
--=20
2.21.0


