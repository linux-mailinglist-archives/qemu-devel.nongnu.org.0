Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700FDCB882
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:40:32 +0200 (CEST)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGL0h-0003fU-4d
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3U-0006Gn-VS
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3T-0006LM-Lf
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:20 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55085)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK3T-0006J5-9n; Fri, 04 Oct 2019 05:39:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YT3cYZz9sSd; Fri,  4 Oct 2019 19:38:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181885;
 bh=Hrt+neE3jUIVeh3i1+Ng8FI9VT/eHGjQlwvnQTX38yE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dak6aK7/yJG8VOVXNQwyfLdSp1SzCzpm7ONXYRkjP7ZfwZe1akjUcG/NY0yLzoDK1
 k7s/Tf9Ge08skuV6fn/afh26w/ym8LHIAA5vuv8NCzERZrvu2rtJPFuifhZ60FacsN
 02+88TOhivvBJtKU/sOZkNS+ta8QEhKAOtrugwm8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 51/53] spapr: Add return value to spapr_irq_check()
Date: Fri,  4 Oct 2019 19:37:45 +1000
Message-Id: <20191004093747.31350-52-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Explicitly return success or failure, rather than just relying on the
Error ** parameter.  This makes handling it less verbose in the caller.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_irq.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 3ac67ba0c7..0413fbd0a3 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -529,7 +529,7 @@ SpaprIrq spapr_irq_dual =3D {
 };
=20
=20
-static void spapr_irq_check(SpaprMachineState *spapr, Error **errp)
+static int spapr_irq_check(SpaprMachineState *spapr, Error **errp)
 {
     MachineState *machine =3D MACHINE(spapr);
=20
@@ -545,7 +545,7 @@ static void spapr_irq_check(SpaprMachineState *spapr,=
 Error **errp)
          */
         if (spapr->irq =3D=3D &spapr_irq_dual) {
             spapr->irq =3D &spapr_irq_xics;
-            return;
+            return 0;
         }
=20
         /*
@@ -565,7 +565,7 @@ static void spapr_irq_check(SpaprMachineState *spapr,=
 Error **errp)
          */
         if (spapr->irq =3D=3D &spapr_irq_xive) {
             error_setg(errp, "XIVE-only machines require a POWER9 CPU");
-            return;
+            return -1;
         }
     }
=20
@@ -579,8 +579,10 @@ static void spapr_irq_check(SpaprMachineState *spapr=
, Error **errp)
         machine_kernel_irqchip_required(machine) &&
         xics_kvm_has_broken_disconnect(spapr)) {
         error_setg(errp, "KVM is too old to support ic-mode=3Ddual,kerne=
l-irqchip=3Don");
-        return;
+        return -1;
     }
+
+    return 0;
 }
=20
 /*
@@ -589,7 +591,6 @@ static void spapr_irq_check(SpaprMachineState *spapr,=
 Error **errp)
 void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
 {
     MachineState *machine =3D MACHINE(spapr);
-    Error *local_err =3D NULL;
=20
     if (machine_kernel_irqchip_split(machine)) {
         error_setg(errp, "kernel_irqchip split mode not supported on pse=
ries");
@@ -602,9 +603,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
         return;
     }
=20
-    spapr_irq_check(spapr, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (spapr_irq_check(spapr, errp) < 0) {
         return;
     }
=20
--=20
2.21.0


