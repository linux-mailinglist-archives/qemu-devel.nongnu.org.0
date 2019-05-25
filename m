Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5C2A522
	for <lists+qemu-devel@lfdr.de>; Sat, 25 May 2019 17:37:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUYk3-0004gK-Ef
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 11:37:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYe1-0007m2-Ex
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:31:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNN-0002hX-Mq
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:26 -0400
Received: from 4.mo5.mail-out.ovh.net ([178.33.111.247]:55025)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNN-0002fV-Hf
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:25 -0400
Received: from player698.ha.ovh.net (unknown [10.109.159.154])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 80B26237847
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 17:14:23 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id F256B625A837;
	Sat, 25 May 2019 15:14:16 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:35 +0200
Message-Id: <20190525151241.5017-14-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6615506381132827409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.111.247
Subject: [Qemu-devel] [PATCH 13/19] aspeed/smc: add a 'sdram_base' propertie
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

The DRAM address of a DMA transaction depends on the DRAM base address
of the SoC. Inform the SMC controller model of this value.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 3 +++
 hw/arm/aspeed_soc.c         | 6 ++++++
 hw/ssi/aspeed_smc.c         | 1 +
 3 files changed, 10 insertions(+)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 3b1e7fce6c86..591279ba1f43 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -97,6 +97,9 @@ typedef struct AspeedSMCState {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
=20
+    /* for DMA support */
+    uint64_t sdram_base;
+
     AspeedSMCFlash *flashes;
=20
     uint8_t snoop_index;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 8cfe9e9515ed..65fbac896c85 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -326,6 +326,12 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                        aspeed_soc_get_irq(s, ASPEED_I2C));
=20
     /* FMC, The number of CS is set at the board level */
+    object_property_set_int(OBJECT(&s->fmc), sc->info->memmap[ASPEED_SDR=
AM],
+                            "sdram-base", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index f1e66870d71f..4ff12f7b27fc 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -912,6 +912,7 @@ static const VMStateDescription vmstate_aspeed_smc =3D=
 {
=20
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
+    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.20.1


