Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7392914C82E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 10:37:01 +0100 (CET)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwjmO-0005No-HK
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 04:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl3-0003bV-TS
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl1-0000k9-RS
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:37 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50046)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1iwjl1-0000jY-N6; Wed, 29 Jan 2020 04:35:35 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 57278299BE; Wed, 29 Jan 2020 04:35:35 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <1753b927c867d25e87da8d5d20fa0b9d60f938cb.1580290069.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580290069.git.fthain@telegraphics.com.au>
References: <cover.1580290069.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v4 04/14] dp8393x: Have dp8393x_receive() return the packet
 size
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

This function re-uses its 'size' argument as a scratch variable.
Instead, declare a local 'size' variable for that purpose so that the
function result doesn't get messed up.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/dp8393x.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 2d2ace2549..ece72cbf42 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -757,20 +757,21 @@ static int dp8393x_receive_filter(dp8393xState *s, =
const uint8_t * buf,
 }
=20
 static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
-                               size_t size)
+                               size_t pkt_size)
 {
     dp8393xState *s =3D qemu_get_nic_opaque(nc);
     int packet_type;
     uint32_t available, address;
-    int width, rx_len =3D size;
+    int width, rx_len =3D pkt_size;
     uint32_t checksum;
+    int size;
=20
     width =3D (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
=20
     s->regs[SONIC_RCR] &=3D ~(SONIC_RCR_PRX | SONIC_RCR_LBK | SONIC_RCR_=
FAER |
         SONIC_RCR_CRCR | SONIC_RCR_LPKT | SONIC_RCR_BC | SONIC_RCR_MC);
=20
-    packet_type =3D dp8393x_receive_filter(s, buf, size);
+    packet_type =3D dp8393x_receive_filter(s, buf, pkt_size);
     if (packet_type < 0) {
         DPRINTF("packet not for netcard\n");
         return -1;
@@ -864,7 +865,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, co=
nst uint8_t * buf,
     /* Done */
     dp8393x_update_irq(s);
=20
-    return size;
+    return pkt_size;
 }
=20
 static void dp8393x_reset(DeviceState *dev)
--=20
2.24.1


