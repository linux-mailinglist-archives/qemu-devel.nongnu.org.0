Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27841314C8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:26:53 +0100 (CET)
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioUHM-0004Kj-Eg
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ioToz-0000pP-1Q
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:57:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ioTox-0000vi-RT
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:57:32 -0500
Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]:51347)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ioTox-0000uP-Lt
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:57:31 -0500
Received: from player731.ha.ovh.net (unknown [10.109.146.175])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 0A13D23BB63
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 15:57:29 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player731.ha.ovh.net (Postfix) with ESMTPSA id 33FA7DB3A6E1;
 Mon,  6 Jan 2020 14:57:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3 06/12] ppc/pnv: Add an "nr-threads" property to the base
 chip class
Date: Mon,  6 Jan 2020 15:56:39 +0100
Message-Id: <20200106145645.4539-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200106145645.4539-1-clg@kaod.org>
References: <20200106145645.4539-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5393342032797404134
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.165.232
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/pnv.h | 1 +
 hw/ppc/pnv.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 56277862dd53..4b9012f9949e 100644
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
index 6d003144b6fc..8f072ea7eff1 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -790,6 +790,8 @@ static void pnv_init(MachineState *machine)
                                 &error_fatal);
         object_property_set_int(chip, machine->smp.cores,
                                 "nr-cores", &error_fatal);
+        object_property_set_int(chip, machine->smp.threads,
+                                "nr-threads", &error_fatal);
         /*
          * The POWER8 machine use the XICS interrupt interface.
          * Propagate the XICS fabric to the chip and its controllers.
@@ -1514,7 +1516,6 @@ static void pnv_chip_core_sanitize(PnvChip *chip, E=
rror **errp)
=20
 static void pnv_chip_core_realize(PnvChip *chip, Error **errp)
 {
-    MachineState *ms =3D MACHINE(qdev_get_machine());
     Error *error =3D NULL;
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(chip);
     const char *typename =3D pnv_chip_core_typename(chip);
@@ -1550,8 +1551,8 @@ static void pnv_chip_core_realize(PnvChip *chip, Er=
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
@@ -1590,6 +1591,7 @@ static Property pnv_chip_properties[] =3D {
     DEFINE_PROP_UINT64("ram-size", PnvChip, ram_size, 0),
     DEFINE_PROP_UINT32("nr-cores", PnvChip, nr_cores, 1),
     DEFINE_PROP_UINT64("cores-mask", PnvChip, cores_mask, 0x0),
+    DEFINE_PROP_UINT32("nr-threads", PnvChip, nr_threads, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.21.1


