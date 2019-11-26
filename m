Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73797109926
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 07:22:30 +0100 (CET)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZUF3-0005rU-FS
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 01:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iZU8y-0007Jf-Sd
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 01:16:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iZTvI-0004PC-Un
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 01:02:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38781 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iZTvI-0004NP-JN; Tue, 26 Nov 2019 01:02:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47MYFd3L5gz9sRG; Tue, 26 Nov 2019 17:01:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574748117;
 bh=/Lv46GlVbuezd+dx9seCW3M8TgeG6tuTmE2nbMPiE+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RxoooOJCcQDnZLrDegDqBMfk7mb0FiKoGGjECSSrqvo9+edcGaeEiVyi0L0kcCEeU
 /kOnzJCMnJJ57QVgflOq3eVPoRlNWnmUx00mdCdBac+YFpwpvOgNmUzaRwNV2TJYFN
 4/lll/+ry+7sGu3D28KW8aTErtGWOFSVsQv0jmAM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 6/8] spapr: Work around spurious warnings from vfio INTx
 initialization
Date: Tue, 26 Nov 2019 17:01:49 +1100
Message-Id: <20191126060151.729845-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126060151.729845-1-david@gibson.dropbear.id.au>
References: <20191126060151.729845-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, groug@kaod.org,
 Alex Williamson <alex.williamson@redhat.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/ppc/spapr_irq.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 1d27034962..d6bb7fd2d6 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -373,6 +373,14 @@ void spapr_irq_init(SpaprMachineState *spapr, Error =
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
@@ -528,7 +536,8 @@ void spapr_irq_update_active_intc(SpaprMachineState *=
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
2.23.0


