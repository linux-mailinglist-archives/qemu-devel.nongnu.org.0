Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF14A86D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 19:29:54 +0200 (CEST)
Received: from localhost ([::1]:60526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdHvd-0003mb-FU
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 13:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60475)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHN5-0008Ue-VA
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:54:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHN4-0004DK-Qm
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:54:11 -0400
Received: from 10.mo6.mail-out.ovh.net ([87.98.157.236]:57391)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHN4-0004BE-Le
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:54:10 -0400
Received: from player157.ha.ovh.net (unknown [10.108.54.172])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 5A08E1CC1D2
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 18:54:07 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id DE3B46EB51EE;
 Tue, 18 Jun 2019 16:53:59 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:56 +0200
Message-Id: <20190618165311.27066-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1670553987857419025
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.157.236
Subject: [Qemu-devel] [PATCH v2 06/21] aspeed: add support for multiple NICs
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Aspeed SoCs have two MACs. Extend the Aspeed model to support a
second NIC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  3 ++-
 hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++--------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index b613b00600fc..75b557060b9b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -25,6 +25,7 @@
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  3
 #define ASPEED_CPUS_NUM  2
+#define ASPEED_MACS_NUM  2
=20
 typedef struct AspeedSoCState {
     /*< private >*/
@@ -43,7 +44,7 @@ typedef struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
-    FTGMAC100State ftgmac100;
+    FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
 } AspeedSoCState;
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index d38fb0aaa0f5..736e52366a66 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -234,8 +234,10 @@ static void aspeed_soc_init(Object *obj)
                                     sc->info->silicon_rev);
     }
=20
-    sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
-                          sizeof(s->ftgmac100), TYPE_FTGMAC100);
+    for (i =3D 0; i < ASPEED_MACS_NUM; i++) {
+        sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[=
i]),
+                              sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
+    }
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -382,19 +384,22 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
     }
=20
     /* Net */
-    qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
-    object_property_set_bool(OBJECT(&s->ftgmac100), true, "aspeed", &err=
);
-    object_property_set_bool(OBJECT(&s->ftgmac100), true, "realized",
-                             &local_err);
-    error_propagate(&err, local_err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i =3D 0; i < nb_nics; i++) {
+        qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
+        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed=
",
+                                 &err);
+        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realiz=
ed",
+                                 &local_err);
+        error_propagate(&err, local_err);
+        if (err) {
+            error_propagate(errp, err);
+           return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+                        sc->info->memmap[ASPEED_ETH1 + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+                           aspeed_soc_get_irq(s, ASPEED_ETH1 + i));
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0,
-                    sc->info->memmap[ASPEED_ETH1]);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
-                       aspeed_soc_get_irq(s, ASPEED_ETH1));
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
--=20
2.21.0


