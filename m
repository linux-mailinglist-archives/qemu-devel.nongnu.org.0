Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC6A7C98
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 09:18:00 +0200 (CEST)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5PYF-0003Ge-B5
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 03:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PND-0002Xr-Jj
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PNC-0006sG-8i
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:06:35 -0400
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:51650)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PNC-0006ra-3E
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 03:06:34 -0400
Received: from player690.ha.ovh.net (unknown [10.109.146.211])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 82916142055
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 09:06:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 7CC7894DCC6F;
 Wed,  4 Sep 2019 07:06:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:05:06 +0200
Message-Id: <20190904070506.1052-11-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
References: <20190904070506.1052-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7095421216039602961
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.63.230
Subject: [Qemu-devel] [PATCH 10/10] aspeed/scu: Introduce a
 aspeed_scu_get_apb_freq() routine
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

The APB frequency can be calculated directly when needed from the
HPLL_PARAM and CLK_SEL register values. This removes useless state in
the model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h |  8 +++-----
 hw/misc/aspeed_scu.c         | 25 +++++++++----------------
 hw/timer/aspeed_timer.c      |  3 ++-
 3 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 90dd4dadedeb..239e94fe2c47 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -32,10 +32,6 @@ typedef struct AspeedSCUState {
     uint32_t hw_strap1;
     uint32_t hw_strap2;
     uint32_t hw_prot_key;
-
-    uint32_t clkin;
-    uint32_t hpll;
-    uint32_t apb_freq;
 } AspeedSCUState;
=20
 #define AST2400_A0_SILICON_REV   0x02000303U
@@ -56,12 +52,14 @@ typedef struct  AspeedSCUClass {
     SysBusDeviceClass parent_class;
=20
     const uint32_t *resets;
-    uint32_t (*calc_hpll)(AspeedSCUState *s);
+    uint32_t (*calc_hpll)(AspeedSCUState *s, uint32_t hpll_reg);
     uint32_t apb_divider;
 }  AspeedSCUClass;
=20
 #define ASPEED_SCU_PROT_KEY      0x1688A8A8
=20
+uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
+
 /*
  * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
  * were added.
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index d284458b9b3d..620b25c20476 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -164,11 +164,12 @@ static uint32_t aspeed_scu_get_random(void)
     return num;
 }
=20
-static void aspeed_scu_set_apb_freq(AspeedSCUState *s)
+uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
 {
     AspeedSCUClass *asc =3D ASPEED_SCU_GET_CLASS(s);
+    uint32_t hpll =3D asc->calc_hpll(s, s->regs[HPLL_PARAM]);
=20
-    s->apb_freq =3D s->hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[CLK_SEL]) + =
1)
+    return hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[CLK_SEL]) + 1)
         / asc->apb_divider;
 }
=20
@@ -228,7 +229,6 @@ static void aspeed_scu_write(void *opaque, hwaddr off=
set, uint64_t data,
         return;
     case CLK_SEL:
         s->regs[reg] =3D data;
-        aspeed_scu_set_apb_freq(s);
         break;
     case HW_STRAP1:
         if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
@@ -290,11 +290,11 @@ static const uint32_t hpll_ast2400_freqs[][4] =3D {
     { 400, 375, 350, 425 }, /* 25MHz */
 };
=20
-static uint32_t aspeed_2400_scu_calc_hpll(AspeedSCUState *s)
+static uint32_t aspeed_2400_scu_calc_hpll(AspeedSCUState *s, uint32_t hp=
ll_reg)
 {
-    uint32_t hpll_reg =3D s->regs[HPLL_PARAM];
     uint8_t freq_select;
     bool clk_25m_in;
+    uint32_t clkin =3D aspeed_scu_get_clkin(s);
=20
     if (hpll_reg & SCU_AST2400_H_PLL_OFF) {
         return 0;
@@ -311,7 +311,7 @@ static uint32_t aspeed_2400_scu_calc_hpll(AspeedSCUSt=
ate *s)
             multiplier =3D (2 - od) * ((n + 2) / (d + 1));
         }
=20
-        return s->clkin * multiplier;
+        return clkin * multiplier;
     }
=20
     /* HW strapping */
@@ -321,10 +321,10 @@ static uint32_t aspeed_2400_scu_calc_hpll(AspeedSCU=
State *s)
     return hpll_ast2400_freqs[clk_25m_in][freq_select] * 1000000;
 }
=20
-static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s)
+static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s, uint32_t hp=
ll_reg)
 {
-    uint32_t hpll_reg   =3D s->regs[HPLL_PARAM];
     uint32_t multiplier =3D 1;
+    uint32_t clkin =3D aspeed_scu_get_clkin(s);
=20
     if (hpll_reg & SCU_H_PLL_OFF) {
         return 0;
@@ -338,7 +338,7 @@ static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUSt=
ate *s)
         multiplier =3D ((m + 1) / (n + 1)) / (p + 1);
     }
=20
-    return s->clkin * multiplier;
+    return clkin * multiplier;
 }
=20
 static void aspeed_scu_reset(DeviceState *dev)
@@ -351,13 +351,6 @@ static void aspeed_scu_reset(DeviceState *dev)
     s->regs[HW_STRAP1] =3D s->hw_strap1;
     s->regs[HW_STRAP2] =3D s->hw_strap2;
     s->regs[PROT_KEY] =3D s->hw_prot_key;
-
-    /*
-     * All registers are set. Now compute the frequencies of the main cl=
ocks
-     */
-    s->clkin =3D aspeed_scu_get_clkin(s);
-    s->hpll =3D asc->calc_hpll(s);
-    aspeed_scu_set_apb_freq(s);
 }
=20
 static uint32_t aspeed_silicon_revs[] =3D {
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 59c2bbeee602..2bda826882d9 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -93,7 +93,8 @@ static inline uint32_t calculate_rate(struct AspeedTime=
r *t)
 {
     AspeedTimerCtrlState *s =3D timer_to_ctrl(t);
=20
-    return timer_external_clock(t) ? TIMER_CLOCK_EXT_HZ : s->scu->apb_fr=
eq;
+    return timer_external_clock(t) ? TIMER_CLOCK_EXT_HZ :
+        aspeed_scu_get_apb_freq(s->scu);
 }
=20
 static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t n=
ow_ns)
--=20
2.21.0


