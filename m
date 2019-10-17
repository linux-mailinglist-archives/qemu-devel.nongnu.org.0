Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E9DA535
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 07:47:41 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKydQ-0006Mc-8z
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 01:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iKyYO-00016E-Ha
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 01:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iKyYN-0005IO-2q
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 01:42:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34509 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iKyYL-0005HY-SK; Thu, 17 Oct 2019 01:42:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46tyjT62qhz9sPW; Thu, 17 Oct 2019 16:42:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571290941;
 bh=qeV4bTD0CrZcVuH/WEAA1NqQ/0d0617D6DXPN3gPjK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GzdT5c+wRt8g8RPorfRghqoB7zQ8ShLWhkIKKcwlz/OtHLkKWlGQNE2Q9ETWS3xZ2
 hn1cmDG2Fbl/YhsTJt7yaPTDMtSwSTIc0Rnvbj82xNkrH3XzKQHwQHFhmKeqbtcp6r
 uO55kX84H6U3NYBfbOGc+bl6EFYc9nSHeDAtspBo=
From: David Gibson <david@gibson.dropbear.id.au>
To: alex.williamson@redhat.com,
	clg@kaod.org,
	groug@kaod.org
Subject: [RFC 5/5] spapr: Work around spurious warnings from vfio INTx
 initialization
Date: Thu, 17 Oct 2019 16:42:18 +1100
Message-Id: <20191017054218.8876-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017054218.8876-1-david@gibson.dropbear.id.au>
References: <20191017054218.8876-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Traditional PCI INTx for vfio devices can only perform well if using
an in-kernel irqchip.  Therefore, vfio_intx_update() issues a warning
if an in kernel irqchip is not available.

We usually do have an in-kernel irqchip available for pseries machines
on POWER hosts.  However, because the platform allows feature
negotiation of what interrupt controller model to use, we don't
currently initialize it until machine reset.  vfio_intx_update() is
called (first) from vfio_realize() before that, so it can issue a
spurious warning, even if we will have an in kernel irqchip by the
time we need it.

To workaround this, make a call to spapr_irq_update_active_intc() from
spapr_irq_init() which is called at machine realize time, before the
vfio realize.  This call will be pretty much obsoleted by the later
call at reset time, but it serves to suppress the spurious warning
from VFIO.

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 45544b8976..bb91c61fa0 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -345,6 +345,14 @@ void spapr_irq_init(SpaprMachineState *spapr, Error =
**errp)
=20
     spapr->qirqs =3D qemu_allocate_irqs(spapr_set_irq, spapr,
                                       smc->nr_xirqs + SPAPR_XIRQ_BASE);
+
+    /*
+     * Mostly we don't actually need this until reset, except that not
+     * having this set up can cause VFIO devices to issue a
+     * false-positive warning during realize(), because they don't yet
+     * have an in-kernel irq chip.
+     */
+    spapr_irq_update_active_intc(spapr);
 }
=20
 int spapr_irq_claim(SpaprMachineState *spapr, int irq, bool lsi, Error *=
*errp)
@@ -500,7 +508,8 @@ void spapr_irq_update_active_intc(SpaprMachineState *=
spapr)
          * this.
          */
         new_intc =3D SPAPR_INTC(spapr->xive);
-    } else if (spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
+    } else if (spapr->ov5_cas
+               && spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         new_intc =3D SPAPR_INTC(spapr->xive);
     } else {
         new_intc =3D SPAPR_INTC(spapr->ics);
--=20
2.21.0


