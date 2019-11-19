Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8836C10266F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 15:18:47 +0100 (CET)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX4L8-0002qj-G1
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 09:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4GC-0006kf-4s
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:13:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4GA-0005Yt-Sk
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:13:39 -0500
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:51207)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4GA-0005Xq-Mu
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:13:38 -0500
Received: from player795.ha.ovh.net (unknown [10.108.35.124])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 45B5714AE01
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 15:13:37 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 469EFC18AC24;
 Tue, 19 Nov 2019 14:13:29 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 09/17] watchdog/aspeed: Fix AST2600 frequency behaviour
Date: Tue, 19 Nov 2019 15:12:03 +0100
Message-Id: <20191119141211.25716-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17911097193377270545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeeg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.56.76
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

The AST2600 control register sneakily changed the meaning of bit 4
without anyone noticing. It no longer controls the 1MHz vs APB clock
select, and instead always runs at 1MHz.

The AST2500 was always 1MHz too, but it retained bit 4, making it read
only. We can model both using the same fixed 1MHz calculation.

Fixes: 6b2b2a703cad ("hw: wdt_aspeed: Add AST2600 support")
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index dfedd7662dd1..819c22993a6e 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -47,6 +47,7 @@ typedef struct AspeedWDTClass {
     uint32_t ext_pulse_width_mask;
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
+    void (*wdt_reload)(AspeedWDTState *s);
 }  AspeedWDTClass;
=20
 #endif /* WDT_ASPEED_H */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d283d07d6546..122aa8daaadf 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -93,11 +93,11 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr =
offset, unsigned size)
=20
 }
=20
-static void aspeed_wdt_reload(AspeedWDTState *s, bool pclk)
+static void aspeed_wdt_reload(AspeedWDTState *s)
 {
     uint64_t reload;
=20
-    if (pclk) {
+    if (!(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK)) {
         reload =3D muldiv64(s->regs[WDT_RELOAD_VALUE], NANOSECONDS_PER_S=
ECOND,
                           s->pclk_freq);
     } else {
@@ -109,6 +109,16 @@ static void aspeed_wdt_reload(AspeedWDTState *s, boo=
l pclk)
     }
 }
=20
+static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
+{
+    uint64_t reload =3D s->regs[WDT_RELOAD_VALUE] * 1000ULL;
+
+    if (aspeed_wdt_is_enabled(s)) {
+        timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + relo=
ad);
+    }
+}
+
+
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
@@ -130,13 +140,13 @@ static void aspeed_wdt_write(void *opaque, hwaddr o=
ffset, uint64_t data,
     case WDT_RESTART:
         if ((data & 0xFFFF) =3D=3D WDT_RESTART_MAGIC) {
             s->regs[WDT_STATUS] =3D s->regs[WDT_RELOAD_VALUE];
-            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK=
));
+            awc->wdt_reload(s);
         }
         break;
     case WDT_CTRL:
         if (enable && !aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] =3D data;
-            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
+            awc->wdt_reload(s);
         } else if (!enable && aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] =3D data;
             timer_del(s->timer);
@@ -283,6 +293,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *k=
lass, void *data)
     awc->offset =3D 0x20;
     awc->ext_pulse_width_mask =3D 0xff;
     awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
+    awc->wdt_reload =3D aspeed_wdt_reload;
 }
=20
 static const TypeInfo aspeed_2400_wdt_info =3D {
@@ -317,6 +328,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *k=
lass, void *data)
     awc->ext_pulse_width_mask =3D 0xfffff;
     awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
     awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
 }
=20
 static const TypeInfo aspeed_2500_wdt_info =3D {
@@ -336,6 +348,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *k=
lass, void *data)
     awc->ext_pulse_width_mask =3D 0xfffff; /* TODO */
     awc->reset_ctrl_reg =3D AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
 }
=20
 static const TypeInfo aspeed_2600_wdt_info =3D {
--=20
2.21.0


