Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC614C82B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 10:36:59 +0100 (CET)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwjmM-0005Ir-LG
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 04:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl3-0003bU-Cr
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjl2-0000lS-An
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:37 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50070)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1iwjl2-0000kF-5n; Wed, 29 Jan 2020 04:35:36 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 9899F299C3; Wed, 29 Jan 2020 04:35:35 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <1aa42a73f9402b9fc9861e6df9ab3618b247c1bd.1580290069.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580290069.git.fthain@telegraphics.com.au>
References: <cover.1580290069.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v4 09/14] dp8393x: Use long-word-aligned RRA pointers in
 32-bit mode
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

Section 3.4.1 of the datasheet says,

    The alignment of the RRA is confined to either word or long word
    boundaries, depending upon the data width mode. In 16-bit mode,
    the RRA must be aligned to a word boundary (A0 is always zero)
    and in 32-bit mode, the RRA is aligned to a long word boundary
    (A0 and A1 are always zero).

This constraint has been implemented for 16-bit mode; implement it
for 32-bit mode too.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/dp8393x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 947ceef37c..b052e2c854 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -663,12 +663,16 @@ static void dp8393x_write(void *opaque, hwaddr addr=
, uint64_t data,
                 qemu_flush_queued_packets(qemu_get_queue(s->nic));
             }
             break;
-        /* Ignore least significant bit */
+        /* The guest is required to store aligned pointers here */
         case SONIC_RSA:
         case SONIC_REA:
         case SONIC_RRP:
         case SONIC_RWP:
-            s->regs[reg] =3D val & 0xfffe;
+            if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+                s->regs[reg] =3D val & 0xfffc;
+            } else {
+                s->regs[reg] =3D val & 0xfffe;
+            }
             break;
         /* Invert written value for some registers */
         case SONIC_CRCT:
--=20
2.24.1


