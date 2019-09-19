Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3263B7314
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 08:15:18 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iApin-0000fi-Jm
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 02:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApMe-0002iW-0L
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApMc-0000RX-LQ
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:23 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:48659)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApMc-0000QN-Dx
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:22 -0400
Received: from player788.ha.ovh.net (unknown [10.109.143.146])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 86A7C1AD4BE
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 07:52:20 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id A7FDD9F17680;
 Thu, 19 Sep 2019 05:52:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:50:00 +0200
Message-Id: <20190919055002.6729-20-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1698982963550718737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.172.75
Subject: [Qemu-devel] [PATCH 19/21] aspeed: Parameterise number of MACs
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

From: Joel Stanley <joel@jms.id.au>

To support the ast2600's four MACs allow SoCs to specify the number
they have, and create that many.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: included a check on sc->macs_num when realizing the macs ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 5 ++++-
 hw/arm/aspeed_ast2600.c     | 7 +++++--
 hw/arm/aspeed_soc.c         | 6 ++++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 67c59956f835..088a5d108185 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -30,7 +30,7 @@
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
-#define ASPEED_MACS_NUM  2
+#define ASPEED_MACS_NUM  4
=20
 typedef struct AspeedSoCState {
     /*< private >*/
@@ -69,6 +69,7 @@ typedef struct AspeedSoCClass {
     uint64_t sram_size;
     int spis_num;
     int wdts_num;
+    int macs_num;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
@@ -114,6 +115,8 @@ enum {
     ASPEED_I2C,
     ASPEED_ETH1,
     ASPEED_ETH2,
+    ASPEED_ETH3,
+    ASPEED_ETH4,
     ASPEED_SDRAM,
     ASPEED_XDMA,
 };
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cc50e52c24ca..ec51f9b6e617 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -32,7 +32,9 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_SPI1]      =3D 0x1E630000,
     [ASPEED_SPI2]      =3D 0x1E641000,
     [ASPEED_ETH1]      =3D 0x1E660000,
+    [ASPEED_ETH3]      =3D 0x1E670000,
     [ASPEED_ETH2]      =3D 0x1E680000,
+    [ASPEED_ETH4]      =3D 0x1E690000,
     [ASPEED_VIC]       =3D 0x1E6C0000,
     [ASPEED_SDMC]      =3D 0x1E6E0000,
     [ASPEED_SCU]       =3D 0x1E6E2000,
@@ -175,7 +177,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
                                        OBJECT(&s->scu), &error_abort);
     }
=20
-    for (i =3D 0; i < ASPEED_MACS_NUM; i++) {
+    for (i =3D 0; i < sc->macs_num; i++) {
         sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[=
i]),
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
     }
@@ -399,7 +401,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     }
=20
     /* Net */
-    for (i =3D 0; i < nb_nics; i++) {
+    for (i =3D 0; i < nb_nics && i < sc->macs_num; i++) {
         qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed=
",
                                  &err);
@@ -472,6 +474,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
     sc->sram_size    =3D 0x10000;
     sc->spis_num     =3D 2;
     sc->wdts_num     =3D 4;
+    sc->macs_num     =3D 4;
     sc->irqmap       =3D aspeed_soc_ast2600_irqmap;
     sc->memmap       =3D aspeed_soc_ast2600_memmap;
     sc->num_cpus     =3D 2;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a063be9fd795..6defb143acde 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -198,7 +198,7 @@ static void aspeed_soc_init(Object *obj)
                                        OBJECT(&s->scu), &error_abort);
     }
=20
-    for (i =3D 0; i < ASPEED_MACS_NUM; i++) {
+    for (i =3D 0; i < sc->macs_num; i++) {
         sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[=
i]),
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
     }
@@ -372,7 +372,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     }
=20
     /* Net */
-    for (i =3D 0; i < nb_nics; i++) {
+    for (i =3D 0; i < nb_nics && i < sc->macs_num; i++) {
         qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed=
",
                                  &err);
@@ -455,6 +455,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass=
 *oc, void *data)
     sc->sram_size    =3D 0x8000;
     sc->spis_num     =3D 1;
     sc->wdts_num     =3D 2;
+    sc->macs_num     =3D 2;
     sc->irqmap       =3D aspeed_soc_ast2400_irqmap;
     sc->memmap       =3D aspeed_soc_ast2400_memmap;
     sc->num_cpus     =3D 1;
@@ -478,6 +479,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass=
 *oc, void *data)
     sc->sram_size    =3D 0x9000;
     sc->spis_num     =3D 2;
     sc->wdts_num     =3D 3;
+    sc->macs_num     =3D 2;
     sc->irqmap       =3D aspeed_soc_ast2500_irqmap;
     sc->memmap       =3D aspeed_soc_ast2500_memmap;
     sc->num_cpus     =3D 1;
--=20
2.21.0


