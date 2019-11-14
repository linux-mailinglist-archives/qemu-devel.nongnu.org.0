Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9CFC311
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 10:52:26 +0100 (CET)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVBnc-0004Li-Cl
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 04:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVBha-0007h3-6u
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVBhZ-0004KN-0v
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:10 -0500
Received: from 20.mo1.mail-out.ovh.net ([188.165.45.168]:38269)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVBhY-0004Iu-Py
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:08 -0500
Received: from player737.ha.ovh.net (unknown [10.109.159.7])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 8981E1961D4
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 10:46:05 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 75B0F2A7832C;
 Thu, 14 Nov 2019 09:45:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/5] aspeed/smc: Restore default AHB window mapping at reset
Date: Thu, 14 Nov 2019 10:45:40 +0100
Message-Id: <20191114094544.30114-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114094544.30114-1-clg@kaod.org>
References: <20191114094544.30114-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2476135371268131601
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.45.168
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
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current model only restores the Segment Register values but leaves
the previous CS mapping behind. Introduce a helper setting the
register value and mapping the region at the requested address. Use
this helper when a Segment register is set and at reset.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index f0c7bbbad302..955ec21852ac 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -475,10 +475,26 @@ static bool aspeed_smc_flash_overlap(const AspeedSM=
CState *s,
     return false;
 }
=20
+static void aspeed_smc_flash_set_segment_region(AspeedSMCState *s, int c=
s,
+                                                uint64_t regval)
+{
+    AspeedSMCFlash *fl =3D &s->flashes[cs];
+    AspeedSegments seg;
+
+    s->ctrl->reg_to_segment(s, regval, &seg);
+
+    memory_region_transaction_begin();
+    memory_region_set_size(&fl->mmio, seg.size);
+    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
+    memory_region_set_enabled(&fl->mmio, true);
+    memory_region_transaction_commit();
+
+    s->regs[R_SEG_ADDR0 + cs] =3D regval;
+}
+
 static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
                                          uint64_t new)
 {
-    AspeedSMCFlash *fl =3D &s->flashes[cs];
     AspeedSegments seg;
=20
     s->ctrl->reg_to_segment(s, new, &seg);
@@ -529,13 +545,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSt=
ate *s, int cs,
     aspeed_smc_flash_overlap(s, &seg, cs);
=20
     /* All should be fine now to move the region */
-    memory_region_transaction_begin();
-    memory_region_set_size(&fl->mmio, seg.size);
-    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
-    memory_region_set_enabled(&fl->mmio, true);
-    memory_region_transaction_commit();
-
-    s->regs[R_SEG_ADDR0 + cs] =3D new;
+    aspeed_smc_flash_set_segment_region(s, cs, new);
 }
=20
 static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
@@ -897,10 +907,10 @@ static void aspeed_smc_reset(DeviceState *d)
         qemu_set_irq(s->cs_lines[i], true);
     }
=20
-    /* setup default segment register values for all */
+    /* setup the default segment register values and regions for all */
     for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
-        s->regs[R_SEG_ADDR0 + i] =3D
-            s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]);
+        aspeed_smc_flash_set_segment_region(s, i,
+                    s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]));
     }
=20
     /* HW strapping flash type for the AST2600 controllers  */
--=20
2.21.0


