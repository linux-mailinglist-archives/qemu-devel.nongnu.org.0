Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93835125C07
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 08:36:03 +0100 (CET)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihqLq-0003ki-Kf
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 02:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ihqGj-0006he-47
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ihqGh-00034o-Gs
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:44 -0500
Received: from 4.mo6.mail-out.ovh.net ([87.98.184.159]:60682)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ihqGh-0002sd-7o
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:43 -0500
Received: from player714.ha.ovh.net (unknown [10.108.35.119])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3D6591F576E
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 08:30:41 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 0E7AFD671E4C;
 Thu, 19 Dec 2019 07:30:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 05/10] spapr/xive: Use device_class_set_parent_realize()
Date: Thu, 19 Dec 2019 08:29:56 +0100
Message-Id: <20191219073001.26790-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219073001.26790-1-clg@kaod.org>
References: <20191219073001.26790-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2819534842099698662
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepud
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.184.159
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The XIVE router base class currently inherits an empty realize hook
from the sysbus device base class, but it will soon implement one
of its own to perform some sanity checks. Do the preliminary plumbing
to have it called.

Signed-off-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/spapr_xive.h | 10 ++++++++++
 hw/intc/spapr_xive.c        | 12 +++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 3a103c224d44..93d09d68deb7 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -15,6 +15,10 @@
=20
 #define TYPE_SPAPR_XIVE "spapr-xive"
 #define SPAPR_XIVE(obj) OBJECT_CHECK(SpaprXive, (obj), TYPE_SPAPR_XIVE)
+#define SPAPR_XIVE_CLASS(klass)                                         =
\
+    OBJECT_CLASS_CHECK(SpaprXiveClass, (klass), TYPE_SPAPR_XIVE)
+#define SPAPR_XIVE_GET_CLASS(obj)                               \
+    OBJECT_GET_CLASS(SpaprXiveClass, (obj), TYPE_SPAPR_XIVE)
=20
 typedef struct SpaprXive {
     XiveRouter    parent;
@@ -47,6 +51,12 @@ typedef struct SpaprXive {
     VMChangeStateEntry *change;
 } SpaprXive;
=20
+typedef struct SpaprXiveClass {
+    XiveRouterClass parent;
+
+    DeviceRealize parent_realize;
+} SpaprXiveClass;
+
 /*
  * The sPAPR machine has a unique XIVE IC device. Assign a fixed value
  * to the controller block id value. It can nevertheless be changed
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 57305c56d707..32322470a8b8 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -286,10 +286,17 @@ static void spapr_xive_instance_init(Object *obj)
 static void spapr_xive_realize(DeviceState *dev, Error **errp)
 {
     SpaprXive *xive =3D SPAPR_XIVE(dev);
+    SpaprXiveClass *sxc =3D SPAPR_XIVE_GET_CLASS(xive);
     XiveSource *xsrc =3D &xive->source;
     XiveENDSource *end_xsrc =3D &xive->end_source;
     Error *local_err =3D NULL;
=20
+    sxc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     if (!xive->nr_irqs) {
         error_setg(errp, "Number of interrupt needs to be greater 0");
         return;
@@ -760,10 +767,12 @@ static void spapr_xive_class_init(ObjectClass *klas=
s, void *data)
     XiveRouterClass *xrc =3D XIVE_ROUTER_CLASS(klass);
     SpaprInterruptControllerClass *sicc =3D SPAPR_INTC_CLASS(klass);
     XivePresenterClass *xpc =3D XIVE_PRESENTER_CLASS(klass);
+    SpaprXiveClass *sxc =3D SPAPR_XIVE_CLASS(klass);
=20
     dc->desc    =3D "sPAPR XIVE Interrupt Controller";
     dc->props   =3D spapr_xive_properties;
-    dc->realize =3D spapr_xive_realize;
+    device_class_set_parent_realize(dc, spapr_xive_realize,
+                                    &sxc->parent_realize);
     dc->vmsd    =3D &vmstate_spapr_xive;
=20
     xrc->get_eas =3D spapr_xive_get_eas;
@@ -794,6 +803,7 @@ static const TypeInfo spapr_xive_info =3D {
     .instance_init =3D spapr_xive_instance_init,
     .instance_size =3D sizeof(SpaprXive),
     .class_init =3D spapr_xive_class_init,
+    .class_size =3D sizeof(SpaprXiveClass),
     .interfaces =3D (InterfaceInfo[]) {
         { TYPE_SPAPR_INTC },
         { }
--=20
2.21.0


