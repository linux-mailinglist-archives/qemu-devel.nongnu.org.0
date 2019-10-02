Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F42C460D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 05:14:52 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFV6J-0005dx-Cv
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 23:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkq-0001hw-I3
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkn-0002zg-VY
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58857)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iFUkn-0002va-Fy; Tue, 01 Oct 2019 22:52:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46jgf90XDDz9sRp; Wed,  2 Oct 2019 12:52:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569984737;
 bh=QE+VjKlHW32sv6S8hNVKI2dRx7I/EdLEKnK8b1S4tII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bG2r2QK7g3WSi4P7+wGOisxb9EGx8uGVh58bv7tQsi7KocRuqs97t0Hv+UUJi3H8c
 UOd35/AmdO2ImNyzuuxkDZKl9wRfSZUgWqOjjPTiVHF94uVIPCHpMgk35cppBOcS0w
 hJ6JI/4vpS7JbqunFsouNREjhQuKkeSh9OUpGYTA=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	clg@kaod.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 21/34] spapr, xics,
 xive: Introduce SpaprInterruptController QOM interface
Date: Wed,  2 Oct 2019 12:51:55 +1000
Message-Id: <20191002025208.3487-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002025208.3487-1-david@gibson.dropbear.id.au>
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
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
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org,
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


