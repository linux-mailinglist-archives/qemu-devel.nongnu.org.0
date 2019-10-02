Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695FC461E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 05:21:05 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFVCK-0005VL-Ba
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 23:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUko-0001fR-OR
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkl-0002v8-Dl
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:38 -0400
Received: from ozlabs.org ([203.11.71.1]:48503)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iFUkk-0002qe-KE; Tue, 01 Oct 2019 22:52:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46jgf85sygz9sRX; Wed,  2 Oct 2019 12:52:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569984736;
 bh=ET03O7NV0B342KhddhNyJoe1JCAACjXCRRmULjrrXw0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oVs11NJJErkDQdZdoJjCHg/vpM8N9Sqtu8efmdRaV4NjfgICoMltJhTW80Z74JnMP
 x7ivJxUYzf6nmwWLEBcITVOtbOJy3YiAbszeazxg3SNs7FzlzYEf7Pjfw6wuu9SwHy
 zf1Qyzr2QAQFFOoTu0RzaFT8R7j8jhJdjMep3QEE=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	clg@kaod.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 19/34] spapr: Add return value to spapr_irq_check()
Date: Wed,  2 Oct 2019 12:51:53 +1000
Message-Id: <20191002025208.3487-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002025208.3487-1-david@gibson.dropbear.id.au>
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Explicitly return success or failure, rather than just relying on the
Error ** parameter.  This makes handling it less verbose in the caller.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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


