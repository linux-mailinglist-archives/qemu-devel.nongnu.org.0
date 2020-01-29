Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE314C82C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 10:37:01 +0100 (CET)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwjmO-0005OG-8T
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 04:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl4-0003bW-2N
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl2-0000ka-2s
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:37 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50072)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1iwjl1-0000kD-Uz; Wed, 29 Jan 2020 04:35:36 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 7BD39299C1; Wed, 29 Jan 2020 04:35:35 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <f82cde3965560ed22bb7e57841023b6b882793d4.1580290069.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580290069.git.fthain@telegraphics.com.au>
References: <cover.1580290069.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v4 06/14] dp8393x: Clear RRRA command register bit only when
 appropriate
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

It doesn't make sense to clear the command register bit unless the
command was actually issued.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/dp8393x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 249be403af..2e976781e2 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -352,9 +352,6 @@ static void dp8393x_do_read_rra(dp8393xState *s)
         s->regs[SONIC_ISR] |=3D SONIC_ISR_RBE;
         dp8393x_update_irq(s);
     }
-
-    /* Done */
-    s->regs[SONIC_CR] &=3D ~SONIC_CR_RRRA;
 }
=20
 static void dp8393x_do_software_reset(dp8393xState *s)
@@ -563,8 +560,10 @@ static void dp8393x_do_command(dp8393xState *s, uint=
16_t command)
         dp8393x_do_start_timer(s);
     if (command & SONIC_CR_RST)
         dp8393x_do_software_reset(s);
-    if (command & SONIC_CR_RRRA)
+    if (command & SONIC_CR_RRRA) {
         dp8393x_do_read_rra(s);
+        s->regs[SONIC_CR] &=3D ~SONIC_CR_RRRA;
+    }
     if (command & SONIC_CR_LCAM)
         dp8393x_do_load_cam(s);
 }
--=20
2.24.1


