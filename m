Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA6B72F6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 07:59:36 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iApTa-0002AB-OD
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 01:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApL8-0000uD-D8
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApL7-0007rx-33
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:50 -0400
Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]:43071)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApL6-0007r7-Tr
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:49 -0400
Received: from player788.ha.ovh.net (unknown [10.109.159.136])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id A86462064DC
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 07:50:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 3C3D49F173A3;
 Thu, 19 Sep 2019 05:50:41 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:49:46 +0200
Message-Id: <20190919055002.6729-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1672805790456449809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.33.112
Subject: [Qemu-devel] [PATCH 05/21] aspeed/timer: Add support for control
 register 3
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

The AST2500 timer has a third control register that is used to
implement a set-to-clear feature for the main control register.

This models the behaviour expected by the AST2500 while maintaining
the same behaviour for the AST2400.

The vmstate version is not increased yet because the structure is
modified again in the following patches.

Based on previous work from Joel Stanley.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h |  1 +
 hw/timer/aspeed_timer.c         | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index a791fee276f4..1e0288ebc49f 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -58,6 +58,7 @@ typedef struct AspeedTimerCtrlState {
=20
     uint32_t ctrl;
     uint32_t ctrl2;
+    uint32_t ctrl3;
     AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
=20
     AspeedSCUState *scu;
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index c78bc1bd2d25..d70e78a0293e 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -498,6 +498,8 @@ static uint64_t aspeed_2500_timer_read(AspeedTimerCtr=
lState *s, hwaddr offset)
=20
     switch (offset) {
     case 0x38:
+        value =3D s->ctrl3 & BIT(0);
+        break;
     case 0x3C:
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
@@ -511,9 +513,24 @@ static uint64_t aspeed_2500_timer_read(AspeedTimerCt=
rlState *s, hwaddr offset)
 static void aspeed_2500_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
                                     uint64_t value)
 {
+    const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
+    uint8_t command;
+
     switch (offset) {
     case 0x38:
+        command =3D (value >> 1) & 0xFF;
+        if (command =3D=3D 0xAE) {
+            s->ctrl3 =3D 0x1;
+        } else if (command =3D=3D 0xEA) {
+            s->ctrl3 =3D 0x0;
+        }
+        break;
     case 0x3C:
+        if (s->ctrl3 & BIT(0)) {
+            aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
+        }
+        break;
+
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
                 __func__, offset);
@@ -574,6 +591,7 @@ static void aspeed_timer_reset(DeviceState *dev)
     }
     s->ctrl =3D 0;
     s->ctrl2 =3D 0;
+    s->ctrl3 =3D 0;
 }
=20
 static const VMStateDescription vmstate_aspeed_timer =3D {
@@ -597,6 +615,7 @@ static const VMStateDescription vmstate_aspeed_timer_=
state =3D {
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
         VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
+        VMSTATE_UINT32(ctrl3, AspeedTimerCtrlState),
         VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
                              ASPEED_TIMER_NR_TIMERS, 1, vmstate_aspeed_t=
imer,
                              AspeedTimer),
--=20
2.21.0


