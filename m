Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C4A952B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 23:34:21 +0200 (CEST)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5cuy-0007pY-7b
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 17:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5cCB-0000VW-8y
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5cC9-0001bx-JU
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:48:03 -0400
Received: from 5.mo7.mail-out.ovh.net ([178.32.120.239]:49610)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5cC9-0001ak-D9
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:48:01 -0400
Received: from player691.ha.ovh.net (unknown [10.108.35.185])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 5471012E8EF
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 22:47:59 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 351E698B285F;
 Wed,  4 Sep 2019 20:47:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 22:46:51 +0200
Message-Id: <20190904204659.13878-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904204659.13878-1-clg@kaod.org>
References: <20190904204659.13878-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2521734316675468049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedgudehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.120.239
Subject: [Qemu-devel] [RFC PATCH 07/15] aspeed/sdmc: Add AST2600 support
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

The AST2600 SDMC controller is slightly different from its predecessor
(DRAM training). Max memory is now 2G on the AST2600.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - improved commit log ]
      - reworked mode integration into new objet class ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_sdmc.h |  1 +
 hw/misc/aspeed_scu.c          |  2 +
 hw/misc/aspeed_sdmc.c         | 82 +++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.=
h
index 81156320c497..5dbde59fe777 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -15,6 +15,7 @@
 #define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEE=
D_SDMC)
 #define TYPE_ASPEED_2400_SDMC TYPE_ASPEED_SDMC "-ast2400"
 #define TYPE_ASPEED_2500_SDMC TYPE_ASPEED_SDMC "-ast2500"
+#define TYPE_ASPEED_2600_SDMC TYPE_ASPEED_SDMC "-ast2600"
=20
 #define ASPEED_SDMC_NR_REGS (0x174 >> 2)
=20
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 4190adab8220..df76bd58a1bb 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -99,6 +99,7 @@
 #define AST2600_CLK_STOP_CTRL_CLR TO_REG(0x84)
 #define AST2600_CLK_STOP_CTRL2     TO_REG(0x90)
 #define AST2600_CLK_STOP_CTR2L_CLR TO_REG(0x94)
+#define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
 #define AST2600_MPLL_EXT          TO_REG(0x224)
 #define AST2600_EPLL_EXT          TO_REG(0x244)
 #define AST2600_CLK_SEL           TO_REG(0x300)
@@ -599,6 +600,7 @@ static const uint32_t ast2600_a0_resets[ASPEED_AST260=
0_SCU_NR_REGS] =3D {
     [AST2600_SYS_RST_CTRL2]     =3D 0xFFFFFFFC,
     [AST2600_CLK_STOP_CTRL]     =3D 0xEFF43E8B,
     [AST2600_CLK_STOP_CTRL2]    =3D 0xFFF0FFF0,
+    [AST2600_SDRAM_HANDSHAKE]   =3D 0x00000040,  /* SoC completed DRAM i=
nit */
 };
=20
 static void aspeed_ast2600_scu_reset(DeviceState *dev)
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 60c99e773488..f3a63a2e01db 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -28,6 +28,7 @@
 /* Control/Status Register #1 (ast2500) */
 #define R_STATUS1         (0x60 / 4)
 #define   PHY_BUSY_STATE      BIT(0)
+#define   PHY_PLL_LOCK_STATUS BIT(4)
=20
 #define R_ECC_TEST_CTRL   (0x70 / 4)
 #define   ECC_TEST_FINISHED   BIT(12)
@@ -85,6 +86,11 @@
 #define     ASPEED_SDMC_AST2500_512MB       0x2
 #define     ASPEED_SDMC_AST2500_1024MB      0x3
=20
+#define     ASPEED_SDMC_AST2600_256MB       0x0
+#define     ASPEED_SDMC_AST2600_512MB       0x1
+#define     ASPEED_SDMC_AST2600_1024MB      0x2
+#define     ASPEED_SDMC_AST2600_2048MB      0x3
+
 #define ASPEED_SDMC_AST2500_READONLY_MASK                               =
\
     (ASPEED_SDMC_HW_VERSION(0xf) | ASPEED_SDMC_CACHE_INITIAL_DONE |     =
\
      ASPEED_SDMC_AST2500_RESERVED | ASPEED_SDMC_VGA_COMPAT |            =
\
@@ -186,6 +192,28 @@ static int ast2500_rambits(AspeedSDMCState *s)
     return ASPEED_SDMC_AST2500_512MB;
 }
=20
+static int ast2600_rambits(AspeedSDMCState *s)
+{
+    switch (s->ram_size >> 20) {
+    case 256:
+        return ASPEED_SDMC_AST2600_256MB;
+    case 512:
+        return ASPEED_SDMC_AST2600_512MB;
+    case 1024:
+        return ASPEED_SDMC_AST2600_1024MB;
+    case 2048:
+        return ASPEED_SDMC_AST2600_2048MB;
+    default:
+        break;
+    }
+
+    /* use a common default */
+    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
+                s->ram_size);
+    s->ram_size =3D 512 << 20;
+    return ASPEED_SDMC_AST2600_512MB;
+}
+
 static void aspeed_sdmc_reset(DeviceState *dev)
 {
     AspeedSDMCState *s =3D ASPEED_SDMC(dev);
@@ -340,11 +368,65 @@ static const TypeInfo aspeed_2500_sdmc_info =3D {
     .class_init =3D aspeed_2500_sdmc_class_init,
 };
=20
+static uint32_t aspeed_2600_sdmc_compute_conf(AspeedSDMCState *s, uint32=
_t data)
+{
+    uint32_t fixed_conf =3D ASPEED_SDMC_HW_VERSION(3) |
+        ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
+        ASPEED_SDMC_DRAM_SIZE(ast2600_rambits(s));
+
+    /* Make sure readonly bits are kept (use ast2500 mask) */
+    data &=3D ~ASPEED_SDMC_AST2500_READONLY_MASK;
+
+    return data | fixed_conf;
+}
+
+static void aspeed_2600_sdmc_write(AspeedSDMCState *s, uint32_t reg,
+                                   uint32_t data)
+{
+    switch (reg) {
+    case R_CONF:
+        data =3D aspeed_2600_sdmc_compute_conf(s, data);
+        break;
+    case R_STATUS1:
+        /* Will never return 'busy'. 'lock status' is always set */
+        data &=3D ~PHY_BUSY_STATE;
+        data |=3D PHY_PLL_LOCK_STATUS;
+        break;
+    case R_ECC_TEST_CTRL:
+        /* Always done, always happy */
+        data |=3D ECC_TEST_FINISHED;
+        data &=3D ~ECC_TEST_FAIL;
+        break;
+    default:
+        break;
+    }
+
+    s->regs[reg] =3D data;
+}
+
+static void aspeed_2600_sdmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedSDMCClass *asc =3D ASPEED_SDMC_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2600 SDRAM Memory Controller";
+    asc->max_ram_size =3D 2048 << 20;
+    asc->compute_conf =3D aspeed_2600_sdmc_compute_conf;
+    asc->write =3D aspeed_2600_sdmc_write;
+}
+
+static const TypeInfo aspeed_2600_sdmc_info =3D {
+    .name =3D TYPE_ASPEED_2600_SDMC,
+    .parent =3D TYPE_ASPEED_SDMC,
+    .class_init =3D aspeed_2600_sdmc_class_init,
+};
+
 static void aspeed_sdmc_register_types(void)
 {
     type_register_static(&aspeed_sdmc_info);
     type_register_static(&aspeed_2400_sdmc_info);
     type_register_static(&aspeed_2500_sdmc_info);
+    type_register_static(&aspeed_2600_sdmc_info);
 }
=20
 type_init(aspeed_sdmc_register_types);
--=20
2.21.0


