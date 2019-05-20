Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4922BDF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 08:09:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSbTv-00042q-DU
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 02:09:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSbR1-0002UJ-4Y
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSbQz-0006uu-Ib
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:06:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43917 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSbQy-0006sV-I3; Mon, 20 May 2019 02:06:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 456pKt1Rbrz9s9N; Mon, 20 May 2019 16:05:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558332354;
	bh=DRw1tnaS7Zhh+M3o3db/LrmhVnucQH8IfA+GZrw+sSM=;
	h=From:To:Cc:Subject:Date:From;
	b=P8BsOlHu0NLDWQojxW0pmSCOA3OkM6U6aIuBeu4WakdF3ybeja3L6ZOWb/Vsvc9Xy
	80lrOYqhWA4YZBubQbAo0b+nBjgrDRvjdQcYf7MUrlSdiZOjn8tLsWxgsCx9vJaT6r
	j1tcJpt1jiKEdfm4vmWTtpVO/BzGCUJLoXt9g34Y=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	aik@ozlabs.ru,
	lvivier@redhat.com
Date: Mon, 20 May 2019 16:05:50 +1000
Message-Id: <20190520060550.29481-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH] Fix phb_placement backwards compatibility
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
Cc: gkurz@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
	alex.williamson@redhat.com, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we added support for NVLink2 passthrough devices, we changed the
phb_placement hook to handle the placement of NVLink2 bridges' specific
resources.  For compatibility we use a version that doesn't do this
allocation  for old machine types.

However, because of the delay between when the patch was posted and when
it was merged, we ended up with that compatibility hook applying for
machine versions 3.1 and earlier whereas it should apply for 4.0 and
earlier (since the patch was applied early in the 4.1 tree).

Fixes: ec132efaa81 "spapr: Support NVIDIA V100 GPU with NVLink2"

Reported-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bcae30ad26..39e698e9b0 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4411,18 +4411,7 @@ DEFINE_SPAPR_MACHINE(4_1, "4.1", true);
 /*
  * pseries-4.0
  */
-static void spapr_machine_4_0_class_options(MachineClass *mc)
-{
-    spapr_machine_4_1_class_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_4_0, hw_compat_4_0_len)=
;
-}
-
-DEFINE_SPAPR_MACHINE(4_0, "4.0", false);
-
-/*
- * pseries-3.1
- */
-static void phb_placement_3_1(SpaprMachineState *spapr, uint32_t index,
+static void phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
                               uint64_t *buid, hwaddr *pio,
                               hwaddr *mmio32, hwaddr *mmio64,
                               unsigned n_dma, uint32_t *liobns,
@@ -4434,6 +4423,20 @@ static void phb_placement_3_1(SpaprMachineState *s=
papr, uint32_t index,
     *nv2atsd =3D 0;
 }
=20
+static void spapr_machine_4_0_class_options(MachineClass *mc)
+{
+    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
+
+    spapr_machine_4_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_4_0, hw_compat_4_0_len)=
;
+    smc->phb_placement =3D phb_placement_4_0;
+}
+
+DEFINE_SPAPR_MACHINE(4_0, "4.0", false);
+
+/*
+ * pseries-3.1
+ */
 static void spapr_machine_3_1_class_options(MachineClass *mc)
 {
     SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
@@ -4449,7 +4452,6 @@ static void spapr_machine_3_1_class_options(Machine=
Class *mc)
     smc->default_caps.caps[SPAPR_CAP_SBBC] =3D SPAPR_CAP_BROKEN;
     smc->default_caps.caps[SPAPR_CAP_IBS] =3D SPAPR_CAP_BROKEN;
     smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] =3D SPAPR_CAP_OF=
F;
-    smc->phb_placement =3D phb_placement_3_1;
 }
=20
 DEFINE_SPAPR_MACHINE(3_1, "3.1", false);
--=20
2.21.0


