Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3C2BFED6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 08:06:59 +0200 (CEST)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDjP7-0005ea-QX
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 02:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9Y-0006ui-8h
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9V-00057j-MM
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:52 -0400
Received: from ozlabs.org ([203.11.71.1]:57713)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDj9V-00054K-8K; Fri, 27 Sep 2019 01:50:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46fgrG1RSfz9sRN; Fri, 27 Sep 2019 15:50:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569563438;
 bh=jucEmQc02V/SPbPhx9z04GrpW+GAuAPPDzHEoKOFjCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C4Hh943ExS3ECqD5F1UFxTRZ52dDzM5W+LBLhtzIg+S4NKDTmjUsZxx44JqNMwmAT
 Thw2z606P3fQO/LwjxPGCK/68Pr9TEzAM38uUfnOqAIQGmeDborFuFjybD1mBumayR
 7qqxEETeUUbYgOb2wN2XKatb4rgpqGGaL052dooI=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 23/33] spapr: Formalize notion of active interrupt
 controller
Date: Fri, 27 Sep 2019 15:50:18 +1000
Message-Id: <20190927055028.11493-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927055028.11493-1-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
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
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr now has the mechanism of constructing both XICS and XIVE instances =
of
the SpaprInterruptController interface.  However, only one of the interru=
pt
controllers will actually be active at any given time, depending on featu=
re
negotiation with the guest.  This is handled in the current code via
spapr_irq_current() which checks the OV5 vector from feature negotiation =
to
determine the current backend.

Determining the active controller at the point we need it like this
can be pretty confusing, because it makes it very non obvious at what
points the active controller can change.  This can make it difficult
to reason about the code and where a change of active controller could
appear in sequence with other events.

Make this mechanism more explicit by adding an 'active_intc' pointer
and an explicit spapr_irq_update_active_intc() function to update it
from the CAS state.  We also add hooks on the intc backend which will
get called when it is activated or deactivated.

For now we just introduce the switch and hooks, later patches will
actually start using them.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c         | 51 ++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h     |  5 ++--
 include/hw/ppc/spapr_irq.h |  5 ++++
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index ea44378d8c..dfa875b7cd 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -593,6 +593,7 @@ qemu_irq spapr_qirq(SpaprMachineState *spapr, int irq=
)
=20
 int spapr_irq_post_load(SpaprMachineState *spapr, int version_id)
 {
+    spapr_irq_update_active_intc(spapr);
     return spapr->irq->post_load(spapr, version_id);
 }
=20
@@ -600,6 +601,8 @@ void spapr_irq_reset(SpaprMachineState *spapr, Error =
**errp)
 {
     assert(!spapr->irq_map || bitmap_empty(spapr->irq_map, spapr->irq_ma=
p_nr));
=20
+    spapr_irq_update_active_intc(spapr);
+
     if (spapr->irq->reset) {
         spapr->irq->reset(spapr, errp);
     }
@@ -626,6 +629,54 @@ int spapr_irq_get_phandle(SpaprMachineState *spapr, =
void *fdt, Error **errp)
     return phandle;
 }
=20
+static void set_active_intc(SpaprMachineState *spapr,
+                            SpaprInterruptController *new_intc)
+{
+    SpaprInterruptControllerClass *sicc;
+
+    assert(new_intc);
+
+    if (new_intc =3D=3D spapr->active_intc) {
+        /* Nothing to do */
+        return;
+    }
+
+    if (spapr->active_intc) {
+        sicc =3D SPAPR_INTC_GET_CLASS(spapr->active_intc);
+        if (sicc->deactivate) {
+            sicc->deactivate(spapr->active_intc);
+        }
+    }
+
+    sicc =3D SPAPR_INTC_GET_CLASS(new_intc);
+    if (sicc->activate) {
+        sicc->activate(new_intc, &error_fatal);
+    }
+
+    spapr->active_intc =3D new_intc;
+}
+
+void spapr_irq_update_active_intc(SpaprMachineState *spapr)
+{
+    SpaprInterruptController *new_intc;
+
+    if (!spapr->ics) {
+        /*
+         * XXX before we run CAS, ov5_cas is initialized empty, which
+         * indicates XICS, even if we have ic-mode=3Dxive.  TODO: clean
+         * up the CAS path so that we have a clearer way of handling
+         * this.
+         */
+        new_intc =3D SPAPR_INTC(spapr->xive);
+    } else if (spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
+        new_intc =3D SPAPR_INTC(spapr->xive);
+    } else {
+        new_intc =3D SPAPR_INTC(spapr->ics);
+    }
+
+    set_active_intc(spapr, new_intc);
+}
+
 /*
  * XICS legacy routines - to deprecate one day
  */
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index cbd1a4c9f3..763da757f0 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -143,7 +143,6 @@ struct SpaprMachineState {
     struct SpaprVioBus *vio_bus;
     QLIST_HEAD(, SpaprPhbState) phbs;
     struct SpaprNvram *nvram;
-    ICSState *ics;
     SpaprRtcState rtc;
=20
     SpaprResizeHpt resize_hpt;
@@ -195,9 +194,11 @@ struct SpaprMachineState {
=20
     int32_t irq_map_nr;
     unsigned long *irq_map;
-    SpaprXive  *xive;
     SpaprIrq *irq;
     qemu_irq *qirqs;
+    SpaprInterruptController *active_intc;
+    ICSState *ics;
+    SpaprXive *xive;
=20
     bool cmd_line_caps[SPAPR_CAP_NUM];
     SpaprCapabilities def, eff, mig;
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 616086f9bb..3102d152b2 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -44,6 +44,9 @@ typedef struct SpaprInterruptController SpaprInterruptC=
ontroller;
 typedef struct SpaprInterruptControllerClass {
     InterfaceClass parent;
=20
+    void (*activate)(SpaprInterruptController *intc, Error **errp);
+    void (*deactivate)(SpaprInterruptController *intc);
+
     /*
      * These methods will typically be called on all intcs, active and
      * inactive
@@ -55,6 +58,8 @@ typedef struct SpaprInterruptControllerClass {
     void (*free_irq)(SpaprInterruptController *intc, int irq);
 } SpaprInterruptControllerClass;
=20
+void spapr_irq_update_active_intc(SpaprMachineState *spapr);
+
 void spapr_irq_print_info(SpaprMachineState *spapr, Monitor *mon);
 void spapr_irq_dt(SpaprMachineState *spapr, uint32_t nr_servers,
                   void *fdt, uint32_t phandle);
--=20
2.21.0


