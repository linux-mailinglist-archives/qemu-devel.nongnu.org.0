Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D8C4607
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 05:10:12 +0200 (CEST)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFV1m-0001Df-TJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 23:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUko-0001eZ-7A
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkl-0002ue-4Q
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:37 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:54387)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iFUkk-0002pn-GF; Tue, 01 Oct 2019 22:52:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46jgf80wRGz9sRR; Wed,  2 Oct 2019 12:52:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569984736;
 bh=Bv6Jko921HCxbyel5yjjwjhiYIts5Sy5F0DjgsOXyeo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KvXz3kOm+2kocBIbOODNr912WgOHlTX1tadPKXGXrxEcSJbUytDbnkZ5ifihQN9jI
 +hgeQ62wILr8UwjrIeazkm4fLhQi8FHJyr6WBTOzRKnAUArul6gA98dD1gRLS8tm6f
 +kPc8fBGtYPA6VQ7vc2Eufaxz9jBnZJjJQLgsxW4=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	clg@kaod.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 15/34] spapr: Handle freeing of multiple irqs in frontend
 only
Date: Wed,  2 Oct 2019 12:51:49 +1000
Message-Id: <20191002025208.3487-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002025208.3487-1-david@gibson.dropbear.id.au>
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_irq_free() can be used to free multiple irqs at once. That's useful
for its callers, but there's no need to make the individual backend hooks
handle this.  We can loop across the irqs in spapr_irq_free() itself and
have the hooks just do one at time.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c         | 27 ++++++++++++---------------
 include/hw/ppc/spapr_irq.h |  2 +-
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 9919910a86..d2ac35bbe1 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -133,16 +133,13 @@ static int spapr_irq_claim_xics(SpaprMachineState *=
spapr, int irq, bool lsi,
     return 0;
 }
=20
-static void spapr_irq_free_xics(SpaprMachineState *spapr, int irq, int n=
um)
+static void spapr_irq_free_xics(SpaprMachineState *spapr, int irq)
 {
     ICSState *ics =3D spapr->ics;
     uint32_t srcno =3D irq - ics->offset;
-    int i;
=20
     if (ics_valid_irq(ics, irq)) {
-        for (i =3D srcno; i < srcno + num; ++i) {
-            memset(&ics->irqs[i], 0, sizeof(ICSIRQState));
-        }
+        memset(&ics->irqs[srcno], 0, sizeof(ICSIRQState));
     }
 }
=20
@@ -269,13 +266,9 @@ static int spapr_irq_claim_xive(SpaprMachineState *s=
papr, int irq, bool lsi,
     return 0;
 }
=20
-static void spapr_irq_free_xive(SpaprMachineState *spapr, int irq, int n=
um)
+static void spapr_irq_free_xive(SpaprMachineState *spapr, int irq)
 {
-    int i;
-
-    for (i =3D irq; i < irq + num; ++i) {
-        spapr_xive_irq_free(spapr->xive, i);
-    }
+    spapr_xive_irq_free(spapr->xive, irq);
 }
=20
 static void spapr_irq_print_info_xive(SpaprMachineState *spapr,
@@ -433,10 +426,10 @@ static int spapr_irq_claim_dual(SpaprMachineState *=
spapr, int irq, bool lsi,
     return ret;
 }
=20
-static void spapr_irq_free_dual(SpaprMachineState *spapr, int irq, int n=
um)
+static void spapr_irq_free_dual(SpaprMachineState *spapr, int irq)
 {
-    spapr_irq_xics.free(spapr, irq, num);
-    spapr_irq_xive.free(spapr, irq, num);
+    spapr_irq_xics.free(spapr, irq);
+    spapr_irq_xive.free(spapr, irq);
 }
=20
 static void spapr_irq_print_info_dual(SpaprMachineState *spapr, Monitor =
*mon)
@@ -635,7 +628,11 @@ int spapr_irq_claim(SpaprMachineState *spapr, int ir=
q, bool lsi, Error **errp)
=20
 void spapr_irq_free(SpaprMachineState *spapr, int irq, int num)
 {
-    spapr->irq->free(spapr, irq, num);
+    int i;
+
+    for (i =3D irq; i < (irq + num); i++) {
+        spapr->irq->free(spapr, i);
+    }
 }
=20
 qemu_irq spapr_qirq(SpaprMachineState *spapr, int irq)
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 9b60378e28..ed88b4599a 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -43,7 +43,7 @@ typedef struct SpaprIrq {
=20
     void (*init)(SpaprMachineState *spapr, Error **errp);
     int (*claim)(SpaprMachineState *spapr, int irq, bool lsi, Error **er=
rp);
-    void (*free)(SpaprMachineState *spapr, int irq, int num);
+    void (*free)(SpaprMachineState *spapr, int irq);
     void (*print_info)(SpaprMachineState *spapr, Monitor *mon);
     void (*dt_populate)(SpaprMachineState *spapr, uint32_t nr_servers,
                         void *fdt, uint32_t phandle);
--=20
2.21.0


