Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5412A519
	for <lists+qemu-devel@lfdr.de>; Sat, 25 May 2019 17:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUYVS-0004BB-R8
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 11:22:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMl-0005r3-MV
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMk-0001ky-Ni
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:13:47 -0400
Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140]:35608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYMk-0001jz-Ie
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:13:46 -0400
Received: from player698.ha.ovh.net (unknown [10.109.160.251])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 0B66D12FF82
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 17:13:43 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 84350625A7A9;
	Sat, 25 May 2019 15:13:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:29 +0200
Message-Id: <20190525151241.5017-8-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6604247382182759185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.140
Subject: [Qemu-devel] [PATCH 07/19] aspeed: add support for multiple NICs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
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
index 7247f6da2505..e8556abf4737 100644
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
@@ -42,7 +43,7 @@ typedef struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
-    FTGMAC100State ftgmac100;
+    FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
 } AspeedSoCState;
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b983d5efc5d1..8cfe9e9515ed 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -229,8 +229,10 @@ static void aspeed_soc_init(Object *obj)
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
@@ -371,19 +373,22 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
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
=20
 static void aspeed_soc_class_init(ObjectClass *oc, void *data)
--=20
2.20.1


