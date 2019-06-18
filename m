Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794D4A82B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 19:22:05 +0200 (CEST)
Received: from localhost ([::1]:60436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdHo4-0003PS-8h
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 13:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60593)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHNK-0000FX-Eh
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHNJ-0004WD-Cl
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:54:26 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:39296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHNH-0004Q9-CI
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:54:23 -0400
Received: from player157.ha.ovh.net (unknown [10.109.159.132])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 74BE66AE6B
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 18:54:20 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id E9F376EB52BD;
 Tue, 18 Jun 2019 16:54:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:58 +0200
Message-Id: <20190618165311.27066-9-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1674213165290654481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.61
Subject: [Qemu-devel] [PATCH v2 08/21] aspeed/timer: Status register
 contains reload for stopped timer
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

From: Andrew Jeffery <andrew@aj.id.au>

From the datasheet:

  This register stores the current status of counter #N. When timer
  enable bit TMC30[N * b] is disabled, the reload register will be
  loaded into this counter. When timer bit TMC30[N * b] is set, the
  counter will start to decrement. CPU can update this register value
  when enable bit is set.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 537f072cf87f..8d6266b0fd81 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -187,7 +187,11 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *=
t, int reg)
=20
     switch (reg) {
     case TIMER_REG_STATUS:
-        value =3D calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUA=
L));
+        if (timer_enabled(t)) {
+            value =3D calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VI=
RTUAL));
+        } else {
+            value =3D t->reload;
+        }
         break;
     case TIMER_REG_RELOAD:
         value =3D t->reload;
--=20
2.21.0


