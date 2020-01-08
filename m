Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F9133B4E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 06:41:28 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip45v-000398-OU
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 00:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oc-0003u4-Ta
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3ob-0002m1-6l
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:34 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43869 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ip3oa-0002iI-R2; Wed, 08 Jan 2020 00:23:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47syMD2K1qz9sSm; Wed,  8 Jan 2020 16:23:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578461000;
 bh=s3S48w7lUh4NbJMRnR1fcE0FvP/vfvziUb8fZ1unML4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ENN/RqJIPyJsld6aZT3kisJP8q189gGt7ZMmJbfYpy6tT4DWPxgOAotdkvWxNPq/w
 TuqYLcGJSWudmDQ0Ve8F+oOItx7MACLaaIl8TI4mWBXPxAnb4ado6TYjFqqIy6RXm7
 WBd0g9koB+6dFTaLmsJdSvVTPfHvk/Hl8a9rYlus=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 19/26] ppc/pnv: Add a "pnor" const link property to the BMC
 internal simulator
Date: Wed,  8 Jan 2020 16:23:05 +1100
Message-Id: <20200108052312.238710-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108052312.238710-1-david@gibson.dropbear.id.au>
References: <20200108052312.238710-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

This allows to get rid of a call to qdev_get_machine().

Signed-off-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20200106145645.4539-8-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c         | 2 +-
 hw/ppc/pnv_bmc.c     | 8 +++++---
 include/hw/ppc/pnv.h | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6a0aa78d53..f0b8f3ad26 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -820,7 +820,7 @@ static void pnv_init(MachineState *machine)
     g_free(chip_typename);
=20
     /* Create the machine BMC simulator */
-    pnv->bmc =3D pnv_bmc_create();
+    pnv->bmc =3D pnv_bmc_create(pnv->pnor);
=20
     /* Instantiate ISA bus on chip 0 */
     pnv->isa_bus =3D pnv_isa_create(pnv->chips[0], &error_fatal);
diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 07fa1e1c7e..8863354c1c 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -143,8 +143,8 @@ static uint16_t bytes_to_blocks(uint32_t bytes)
 static void hiomap_cmd(IPMIBmcSim *ibs, uint8_t *cmd, unsigned int cmd_l=
en,
                        RspBuffer *rsp)
 {
-    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
-    PnvPnor *pnor =3D pnv->pnor;
+    PnvPnor *pnor =3D PNV_PNOR(object_property_get_link(OBJECT(ibs), "pn=
or",
+                                                      &error_abort));
     uint32_t pnor_size =3D pnor->size;
     uint32_t pnor_addr =3D PNOR_SPI_OFFSET;
     bool readonly =3D false;
@@ -217,11 +217,13 @@ static const IPMINetfn hiomap_netfn =3D {
  * Instantiate the machine BMC. PowerNV uses the QEMU internal
  * simulator but it could also be external.
  */
-IPMIBmc *pnv_bmc_create(void)
+IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
 {
     Object *obj;
=20
     obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
+    object_ref(OBJECT(pnor));
+    object_property_add_const_link(obj, "pnor", OBJECT(pnor), &error_abo=
rt);
     object_property_set_bool(obj, true, "realized", &error_fatal);
=20
     /* Install the HIOMAP protocol handlers to access the PNOR */
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 4b9012f994..2504d8cd4f 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -229,7 +229,7 @@ PnvChip *pnv_get_chip(uint32_t chip_id);
  */
 void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt);
 void pnv_bmc_powerdown(IPMIBmc *bmc);
-IPMIBmc *pnv_bmc_create(void);
+IPMIBmc *pnv_bmc_create(PnvPnor *pnor);
=20
 /*
  * POWER8 MMIO base addresses
--=20
2.24.1


