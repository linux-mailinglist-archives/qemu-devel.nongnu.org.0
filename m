Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16888BFECE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 08:03:09 +0200 (CEST)
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDjLP-0001es-S5
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 02:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9R-0006lG-SK
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9Q-00050A-18
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:45 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39149)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDj9P-0004xT-FY; Fri, 27 Sep 2019 01:50:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46fgrD49Bhz9sQn; Fri, 27 Sep 2019 15:50:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569563436;
 bh=KAjpXK1XJaeXMysUyEuwfLiwnpMGp2yr5NbNM5um/d4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hiKip/0tqA3OQmlz9eByEtznOCfrgj2GA1LLeHPKOBxbdFE1gZvhOKMNgf0lJEDSq
 SmNEsN70edvTVKEayzm+kktwgWkvYDJ4tiGDhB2fRYZGwt/xl+B92W3OXgPybWzUEZ
 LXK9XIKcKUxaZEyVIy7pjry70kVb8xsE+V799SHA=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 11/33] spapr: Fix indexing of XICS irqs
Date: Fri, 27 Sep 2019 15:50:06 +1000
Message-Id: <20190927055028.11493-12-david@gibson.dropbear.id.au>
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

spapr global irq numbers are different from the source numbers on the ICS
when using XICS - they're offset by XICS_IRQ_BASE (0x1000).  But
spapr_irq_set_irq_xics() was passing through the global irq number to
the ICS code unmodified.

We only got away with this because of a counteracting bug - we were
incorrectly adjusting the qemu_irq we returned for a requested global irq
number.

That approach mostly worked but is very confusing, incorrectly relies on
the way the qemu_irq array is allocated, and undermines the intention of
having the global array of qemu_irqs for spapr have a consistent meaning
regardless of irq backend.

So, fix both set_irq and qemu_irq indexing.  We rename some parameters at
the same time to make it clear that they are referring to spapr global
irq numbers.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_irq.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index cded3a0154..8f79aa829f 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -153,10 +153,9 @@ static void spapr_irq_free_xics(SpaprMachineState *s=
papr, int irq, int num)
 static qemu_irq spapr_qirq_xics(SpaprMachineState *spapr, int irq)
 {
     ICSState *ics =3D spapr->ics;
-    uint32_t srcno =3D irq - ics->offset;
=20
     if (ics_valid_irq(ics, irq)) {
-        return spapr->qirqs[srcno];
+        return spapr->qirqs[irq];
     }
=20
     return NULL;
@@ -204,9 +203,10 @@ static int spapr_irq_post_load_xics(SpaprMachineStat=
e *spapr, int version_id)
     return 0;
 }
=20
-static void spapr_irq_set_irq_xics(void *opaque, int srcno, int val)
+static void spapr_irq_set_irq_xics(void *opaque, int irq, int val)
 {
     SpaprMachineState *spapr =3D opaque;
+    uint32_t srcno =3D irq - spapr->ics->offset;
=20
     ics_set_irq(spapr->ics, srcno, val);
 }
@@ -377,14 +377,14 @@ static void spapr_irq_reset_xive(SpaprMachineState =
*spapr, Error **errp)
     spapr_xive_mmio_set_enabled(spapr->xive, true);
 }
=20
-static void spapr_irq_set_irq_xive(void *opaque, int srcno, int val)
+static void spapr_irq_set_irq_xive(void *opaque, int irq, int val)
 {
     SpaprMachineState *spapr =3D opaque;
=20
     if (kvm_irqchip_in_kernel()) {
-        kvmppc_xive_source_set_irq(&spapr->xive->source, srcno, val);
+        kvmppc_xive_source_set_irq(&spapr->xive->source, irq, val);
     } else {
-        xive_source_set_irq(&spapr->xive->source, srcno, val);
+        xive_source_set_irq(&spapr->xive->source, irq, val);
     }
 }
=20
@@ -558,11 +558,11 @@ static void spapr_irq_reset_dual(SpaprMachineState =
*spapr, Error **errp)
     spapr_irq_current(spapr)->reset(spapr, errp);
 }
=20
-static void spapr_irq_set_irq_dual(void *opaque, int srcno, int val)
+static void spapr_irq_set_irq_dual(void *opaque, int irq, int val)
 {
     SpaprMachineState *spapr =3D opaque;
=20
-    spapr_irq_current(spapr)->set_irq(spapr, srcno, val);
+    spapr_irq_current(spapr)->set_irq(spapr, irq, val);
 }
=20
 static const char *spapr_irq_get_nodename_dual(SpaprMachineState *spapr)
--=20
2.21.0


