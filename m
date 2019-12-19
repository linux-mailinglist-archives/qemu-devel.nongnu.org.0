Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE3D125C1A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 08:38:14 +0100 (CET)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihqNx-0005uS-6l
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 02:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ihqGt-00072S-RQ
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ihqGs-00041t-G8
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:55 -0500
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:40317)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ihqGs-0003sW-5c
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:54 -0500
Received: from player714.ha.ovh.net (unknown [10.108.35.12])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 6DE4D1BC985
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 08:30:52 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 9369CD671EE1;
 Thu, 19 Dec 2019 07:30:46 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 07/10] spapr, pnv,
 xive: Add a "xive-fabric" link to the XIVE router
Date: Thu, 19 Dec 2019 08:29:58 +0100
Message-Id: <20191219073001.26790-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219073001.26790-1-clg@kaod.org>
References: <20191219073001.26790-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2822631069322349542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.172.75
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

In order to get rid of qdev_get_machine(), first add a pointer to the
XIVE fabric under the XIVE router and make it configurable through a
QOM link property.

Configure it in the spapr and pnv machine. In the case of pnv, the XIVE
routers are under the chip, so this is done with a QOM alias property of
the POWER9 pnv chip.

Signed-off-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h | 5 +++--
 hw/intc/xive.c        | 8 ++++++++
 hw/ppc/pnv.c          | 6 ++++++
 hw/ppc/spapr_irq.c    | 2 ++
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 1b7b89098f71..1ded82b1cda8 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -324,9 +324,12 @@ typedef struct XiveTCTX {
 /*
  * XIVE Router
  */
+typedef struct XiveFabric XiveFabric;
=20
 typedef struct XiveRouter {
     SysBusDevice    parent;
+
+    XiveFabric *xfb;
 } XiveRouter;
=20
 #define TYPE_XIVE_ROUTER "xive-router"
@@ -402,8 +405,6 @@ int xive_presenter_tctx_match(XivePresenter *xptr, Xi=
veTCTX *tctx,
  * XIVE Fabric (Interface between Interrupt Controller and Machine)
  */
=20
-typedef struct XiveFabric XiveFabric;
-
 #define TYPE_XIVE_FABRIC "xive-fabric"
 #define XIVE_FABRIC(obj)                                     \
     INTERFACE_CHECK(XiveFabric, (obj), TYPE_XIVE_FABRIC)
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index d4c6e21703b3..6df89b06da38 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1714,12 +1714,19 @@ void xive_router_notify(XiveNotifier *xn, uint32_=
t lisn)
                            xive_get_field64(EAS_END_DATA,  eas.w));
 }
=20
+static Property xive_router_properties[] =3D {
+    DEFINE_PROP_LINK("xive-fabric", XiveRouter, xfb,
+                     TYPE_XIVE_FABRIC, XiveFabric *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void xive_router_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     XiveNotifierClass *xnc =3D XIVE_NOTIFIER_CLASS(klass);
=20
     dc->desc    =3D "XIVE Router Engine";
+    dc->props   =3D xive_router_properties;
     xnc->notify =3D xive_router_notify;
 }
=20
@@ -1727,6 +1734,7 @@ static const TypeInfo xive_router_info =3D {
     .name          =3D TYPE_XIVE_ROUTER,
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .abstract      =3D true,
+    .instance_size =3D sizeof(XiveRouter),
     .class_size    =3D sizeof(XiveRouterClass),
     .class_init    =3D xive_router_class_init,
     .interfaces    =3D (InterfaceInfo[]) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6500efba1317..023010bcf696 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -804,6 +804,10 @@ static void pnv_init(MachineState *machine)
         if (object_dynamic_cast(OBJECT(pnv), TYPE_XICS_FABRIC)) {
             object_property_set_link(chip, OBJECT(pnv), "xics", &error_a=
bort);
         }
+        if (object_dynamic_cast(OBJECT(pnv), TYPE_XIVE_FABRIC)) {
+            object_property_set_link(chip, OBJECT(pnv), "xive-fabric",
+                                     &error_abort);
+        }
         object_property_set_bool(chip, true, "realized", &error_fatal);
     }
     g_free(chip_typename);
@@ -1224,6 +1228,8 @@ static void pnv_chip_power9_instance_init(Object *o=
bj)
=20
     object_initialize_child(obj, "xive", &chip9->xive, sizeof(chip9->xiv=
e),
                             TYPE_PNV_XIVE, &error_abort, NULL);
+    object_property_add_alias(obj, "xive-fabric", OBJECT(&chip9->xive),
+                              "xive-fabric", &error_abort);
=20
     object_initialize_child(obj, "psi",  &chip9->psi, sizeof(chip9->psi)=
,
                             TYPE_PNV9_PSI, &error_abort, NULL);
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 07e08d6544a0..2b656649ad6a 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -340,6 +340,8 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
          * priority
          */
         qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
+        object_property_set_link(OBJECT(dev), OBJECT(spapr), "xive-fabri=
c",
+                                 &error_abort);
         qdev_init_nofail(dev);
=20
         spapr->xive =3D SPAPR_XIVE(dev);
--=20
2.21.0


