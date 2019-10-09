Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C969D145B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 18:43:59 +0200 (CEST)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIF49-0007RK-Se
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 12:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iI59B-0001XP-VB
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 02:08:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iI59A-0006UD-C8
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 02:08:29 -0400
Received: from ozlabs.org ([203.11.71.1]:58779)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iI599-0006PP-BW; Wed, 09 Oct 2019 02:08:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46p3gD3NzCz9sPd; Wed,  9 Oct 2019 17:08:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570601304;
 bh=QE+VjKlHW32sv6S8hNVKI2dRx7I/EdLEKnK8b1S4tII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kalbbc3ja3trmtvTcpq1kwYFb3BeU6Szg0mNPw6rBVagcSFVMg/z2RnxSEx3iykNK
 Ou7uANbJsCmxjvdWJfPxjYxGGoQRSSXLfhShblASmaJtjfpWX0IeRjRBuxsoASKSy6
 x6y6qHBtUB/IVBg1CM7Y1zMw5hJO/Ub3rBP2aNjs=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 04/19] spapr, xics,
 xive: Introduce SpaprInterruptController QOM interface
Date: Wed,  9 Oct 2019 17:08:03 +1100
Message-Id: <20191009060818.29719-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009060818.29719-1-david@gibson.dropbear.id.au>
References: <20191009060818.29719-1-david@gibson.dropbear.id.au>
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SpaprIrq structure is used to represent ths spapr machine's irq
backend.  Except that it kind of conflates two concepts: one is the
backend proper - a specific interrupt controller that we might or
might not be using, the other is the irq configuration which covers
the layout of irq space and which interrupt controllers are allowed.

This leads to some pretty confusing code paths for the "dual"
configuration where its hooks redirect to other SpaprIrq structures
depending on the currently active irq controller.

To clean this up, we start by introducing a new
SpaprInterruptController QOM interface to represent strictly an
interrupt controller backend, not counting anything configuration
related.  We implement this interface in the XICs and XIVE interrupt
controllers, and in future we'll move relevant methods from SpaprIrq
into it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/spapr_xive.c       |  4 ++++
 hw/intc/xics_spapr.c       |  4 ++++
 hw/ppc/spapr_irq.c         | 13 +++++++++++++
 include/hw/ppc/spapr_irq.h | 14 ++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 04879abf2e..b67e9c3245 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -519,6 +519,10 @@ static const TypeInfo spapr_xive_info =3D {
     .instance_init =3D spapr_xive_instance_init,
     .instance_size =3D sizeof(SpaprXive),
     .class_init =3D spapr_xive_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_SPAPR_INTC },
+        { }
+    },
 };
=20
 static void spapr_xive_register_types(void)
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 6e5eb24b3c..4874e6be55 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -343,6 +343,10 @@ static const TypeInfo ics_spapr_info =3D {
     .name =3D TYPE_ICS_SPAPR,
     .parent =3D TYPE_ICS,
     .class_init =3D ics_spapr_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_SPAPR_INTC },
+        { }
+    },
 };
=20
 static void xics_spapr_register_types(void)
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 457eabe24c..8791dec1ba 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -23,6 +23,12 @@
=20
 #include "trace.h"
=20
+static const TypeInfo spapr_intc_info =3D {
+    .name =3D TYPE_SPAPR_INTC,
+    .parent =3D TYPE_INTERFACE,
+    .class_size =3D sizeof(SpaprInterruptControllerClass),
+};
+
 void spapr_irq_msi_init(SpaprMachineState *spapr, uint32_t nr_msis)
 {
     spapr->irq_map_nr =3D nr_msis;
@@ -762,3 +768,10 @@ SpaprIrq spapr_irq_xics_legacy =3D {
     .set_irq     =3D spapr_irq_set_irq_xics,
     .init_kvm    =3D spapr_irq_init_kvm_xics,
 };
+
+static void spapr_irq_register_types(void)
+{
+    type_register_static(&spapr_intc_info);
+}
+
+type_init(spapr_irq_register_types)
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 69a37f608e..b9398e0be3 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -31,6 +31,20 @@
=20
 typedef struct SpaprMachineState SpaprMachineState;
=20
+typedef struct SpaprInterruptController SpaprInterruptController;
+
+#define TYPE_SPAPR_INTC "spapr-interrupt-controller"
+#define SPAPR_INTC(obj)                                     \
+    INTERFACE_CHECK(SpaprInterruptController, (obj), TYPE_SPAPR_INTC)
+#define SPAPR_INTC_CLASS(klass)                                     \
+    OBJECT_CLASS_CHECK(SpaprInterruptControllerClass, (klass), TYPE_SPAP=
R_INTC)
+#define SPAPR_INTC_GET_CLASS(obj)                                   \
+    OBJECT_GET_CLASS(SpaprInterruptControllerClass, (obj), TYPE_SPAPR_IN=
TC)
+
+typedef struct SpaprInterruptControllerClass {
+    InterfaceClass parent;
+} SpaprInterruptControllerClass;
+
 void spapr_irq_msi_init(SpaprMachineState *spapr, uint32_t nr_msis);
 int spapr_irq_msi_alloc(SpaprMachineState *spapr, uint32_t num, bool ali=
gn,
                         Error **errp);
--=20
2.21.0


