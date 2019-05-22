Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E025D43
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:04:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJQL-00023p-MA
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:04:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9X-0003uV-UL
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9W-00074o-3h
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:59 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55971 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9V-0006qt-JV; Wed, 22 May 2019 00:46:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580Sz6Tjzz9sPl; Wed, 22 May 2019 14:46:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500371;
	bh=DkXn+bse8wGpz2JktjAb3Ez34ACjE6wQs4QiOTPh7SQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hzYupZFDwnTaoU32PuLSCKAaZsPCm5eMybGkM7VzXcBMuxAbti3X5wO0z04Cf0zIk
	ytppYAsm87jHLDrXQduFgVOuCmSb/w88WKgLIuhVUOjH+1Mj0xLoONFpzTidmCaGaj
	C7upBVnpjpid2MzNrSsFVblQ6CovGABy4yWT0eLk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:45 +1000
Message-Id: <20190522044600.16534-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 23/38] spapr: Fix phb_placement backwards
 compatibility
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
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


