Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD39126907
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 19:25:46 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii0Ub-0007de-Fy
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 13:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ii0IH-00014K-B1
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:13:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ii0IG-0005gC-23
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:13:01 -0500
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:49340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ii0IF-0005Xi-Rr
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:12:59 -0500
Received: from player734.ha.ovh.net (unknown [10.108.54.203])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 2277A153174
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 19:12:58 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 9BB14D6D63E3;
 Thu, 19 Dec 2019 18:12:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 09/13] ppc/pnv: Add an "nr-threads" property to the base
 chip class
Date: Thu, 19 Dec 2019 19:11:51 +0100
Message-Id: <20191219181155.32530-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219181155.32530-1-clg@kaod.org>
References: <20191219181155.32530-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13666736021224262630
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepvd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.75.26
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Set it at chip creation and forward it to the cores. This allows to drop
a call to qdev_get_machine().

Signed-off-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h | 1 +
 hw/ppc/pnv.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 8b957dfb5736..4c13d4394a11 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -48,6 +48,7 @@ typedef struct PnvChip {
     uint64_t     ram_size;
=20
     uint32_t     nr_cores;
+    uint32_t     nr_threads;
     uint64_t     cores_mask;
     PnvCore      **cores;
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 915c80a24b3e..e638cdc93091 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -791,6 +791,8 @@ static void pnv_init(MachineState *machine)
                                 &error_fatal);
         object_property_set_int(chip, machine->smp.cores,
                                 "nr-cores", &error_fatal);
+        object_property_set_int(chip, machine->smp.threads,
+                                "nr-threads", &error_fatal);
         /*
          * TODO: Only the MMIO range should be of interest for the
          * controllers
@@ -1529,7 +1531,6 @@ static void pnv_chip_core_sanitize(PnvChip *chip, E=
rror **errp)
=20
 static void pnv_chip_core_realize(PnvChip *chip, Error **errp)
 {
-    MachineState *ms =3D MACHINE(qdev_get_machine());
     Error *error =3D NULL;
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(chip);
     const char *typename =3D pnv_chip_core_typename(chip);
@@ -1565,8 +1566,8 @@ static void pnv_chip_core_realize(PnvChip *chip, Er=
ror **errp)
         object_property_add_child(OBJECT(chip), core_name, OBJECT(pnv_co=
re),
                                   &error_abort);
         chip->cores[i] =3D pnv_core;
-        object_property_set_int(OBJECT(pnv_core), ms->smp.threads, "nr-t=
hreads",
-                                &error_fatal);
+        object_property_set_int(OBJECT(pnv_core), chip->nr_threads,
+                                "nr-threads", &error_fatal);
         object_property_set_int(OBJECT(pnv_core), core_hwid,
                                 CPU_CORE_PROP_CORE_ID, &error_fatal);
         object_property_set_int(OBJECT(pnv_core),
@@ -1609,6 +1610,7 @@ static Property pnv_chip_properties[] =3D {
     DEFINE_PROP_UINT64("cores-mask", PnvChip, cores_mask, 0x0),
     DEFINE_PROP_LINK("system-memory", PnvChip, system_memory,
                      TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_UINT32("nr-threads", PnvChip, nr_threads, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.21.0


