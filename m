Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC82E14C835
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 10:39:50 +0100 (CET)
Received: from localhost ([::1]:43302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwjp7-0003k1-P5
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 04:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl4-0003bk-Kk
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl3-0000nb-H9
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:38 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50070)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1iwjl3-0000kF-Ch; Wed, 29 Jan 2020 04:35:37 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id C1180299C9; Wed, 29 Jan 2020 04:35:35 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <61d9753b631e9071809cdd1bb8e12385aa06c83e.1580290069.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580290069.git.fthain@telegraphics.com.au>
References: <cover.1580290069.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v4 13/14] dp8393x: Don't reset Silicon Revision register
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2020 20:27:49 +1100
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The jazzsonic driver in Linux uses the Silicon Revision register value
to probe the chip. The driver fails unless the SR register contains 4.
Unfortunately, reading this register in QEMU usually returns 0 because
the s->regs[] array gets wiped after a software reset.

Fixes: bd8f1ebce4 ("net/dp8393x: fix hardware reset")
Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
Changed since v3:
- Simplified as per suggestion from Philippe Mathieu-Daud=C3=A9.
---
 hw/net/dp8393x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 1b73a8703b..93eb07e6c8 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -919,6 +919,7 @@ static void dp8393x_reset(DeviceState *dev)
     timer_del(s->watchdog);
=20
     memset(s->regs, 0, sizeof(s->regs));
+    s->regs[SONIC_SR] =3D 0x0004; /* only revision recognized by Linux/m=
ips */
     s->regs[SONIC_CR] =3D SONIC_CR_RST | SONIC_CR_STP | SONIC_CR_RXDIS;
     s->regs[SONIC_DCR] &=3D ~(SONIC_DCR_EXBUS | SONIC_DCR_LBR);
     s->regs[SONIC_RCR] &=3D ~(SONIC_RCR_LB0 | SONIC_RCR_LB1 | SONIC_RCR_=
BRD | SONIC_RCR_RNT);
@@ -971,7 +972,6 @@ static void dp8393x_realize(DeviceState *dev, Error *=
*errp)
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
=20
     s->watchdog =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, dp8393x_watchdog, s=
);
-    s->regs[SONIC_SR] =3D 0x0004; /* only revision recognized by Linux *=
/
=20
     memory_region_init_ram(&s->prom, OBJECT(dev),
                            "dp8393x-prom", SONIC_PROM_SIZE, &local_err);
--=20
2.24.1


