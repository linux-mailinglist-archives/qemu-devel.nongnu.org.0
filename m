Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31FFBFECD
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 08:01:39 +0200 (CEST)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDjJx-0000JN-Ka
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 02:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9V-0006qi-Px
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9T-00053w-8Z
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35017)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDj9S-00050z-KK; Fri, 27 Sep 2019 01:50:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46fgrF3T7Mz9sR4; Fri, 27 Sep 2019 15:50:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569563437;
 bh=OfiVi6coWOMzrhnazpihkF8xpcfkbqtn9EnlH+S5bXo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XMpSve6wNGUh+9QhCP0NcL1w1InwrPEDNIKT/pH2M0zPpkz2XTZqSQ8TczvxeEHBu
 5e5j3zjvBGixKR2Kow//F+J6e38IDIuUdH5nratnw34uRN60M0Uplk7saT5tz/HQZX
 vVFlwsXJ0P7XjHppEi4WLbw6K47lzj5lDBMerc0s=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 16/33] spapr, xics,
 xive: Better use of assert()s on irq claim/free paths
Date: Fri, 27 Sep 2019 15:50:11 +1000
Message-Id: <20190927055028.11493-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927055028.11493-1-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The irq claim and free paths for both XICS and XIVE check for some
validity conditions.  Some of these represent genuine runtime failures,
however others - particularly checking that the basic irq number is in a
sane range - could only fail in the case of bugs in the callin code.
Therefore use assert()s instead of runtime failures for those.

In addition the non backend-specific part of the claim/free paths should
only be used for PAPR external irqs, that is in the range SPAPR_XIRQ_BASE
to the maximum irq number.  Put assert()s for that into the top level
dispatchers as well.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/spapr_xive.c |  8 ++------
 hw/ppc/spapr_irq.c   | 18 ++++++++++--------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index c1c97192a7..47b5ec0b56 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -532,9 +532,7 @@ bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t l=
isn, bool lsi)
 {
     XiveSource *xsrc =3D &xive->source;
=20
-    if (lisn >=3D xive->nr_irqs) {
-        return false;
-    }
+    assert(lisn < xive->nr_irqs);
=20
     /*
      * Set default values when allocating an IRQ number
@@ -559,9 +557,7 @@ bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t l=
isn, bool lsi)
=20
 bool spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn)
 {
-    if (lisn >=3D xive->nr_irqs) {
-        return false;
-    }
+    assert(lisn < xive->nr_irqs);
=20
     xive->eat[lisn].w &=3D cpu_to_be64(~EAS_VALID);
     return true;
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 37c51c96ae..da9e80b24e 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -118,11 +118,7 @@ static int spapr_irq_claim_xics(SpaprMachineState *s=
papr, int irq, bool lsi,
     ICSState *ics =3D spapr->ics;
=20
     assert(ics);
-
-    if (!ics_valid_irq(ics, irq)) {
-        error_setg(errp, "IRQ %d is invalid", irq);
-        return -1;
-    }
+    assert(ics_valid_irq(ics, irq));
=20
     if (!ics_irq_free(ics, irq - ics->offset)) {
         error_setg(errp, "IRQ %d is not free", irq);
@@ -138,9 +134,9 @@ static void spapr_irq_free_xics(SpaprMachineState *sp=
apr, int irq)
     ICSState *ics =3D spapr->ics;
     uint32_t srcno =3D irq - ics->offset;
=20
-    if (ics_valid_irq(ics, irq)) {
-        memset(&ics->irqs[srcno], 0, sizeof(ICSIRQState));
-    }
+    assert(ics_valid_irq(ics, irq));
+
+    memset(&ics->irqs[srcno], 0, sizeof(ICSIRQState));
 }
=20
 static void spapr_irq_print_info_xics(SpaprMachineState *spapr, Monitor =
*mon)
@@ -623,6 +619,9 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
=20
 int spapr_irq_claim(SpaprMachineState *spapr, int irq, bool lsi, Error *=
*errp)
 {
+    assert(irq >=3D SPAPR_XIRQ_BASE);
+    assert(irq < (spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE));
+
     return spapr->irq->claim(spapr, irq, lsi, errp);
 }
=20
@@ -630,6 +629,9 @@ void spapr_irq_free(SpaprMachineState *spapr, int irq=
, int num)
 {
     int i;
=20
+    assert(irq >=3D SPAPR_XIRQ_BASE);
+    assert((irq + num) <=3D (spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE));
+
     for (i =3D irq; i < (irq + num); i++) {
         spapr->irq->free(spapr, irq);
     }
--=20
2.21.0


