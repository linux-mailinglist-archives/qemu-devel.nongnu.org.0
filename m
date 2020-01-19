Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D237A1420AF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 00:15:35 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itJn4-0006M8-8y
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 18:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJfi-00049i-Le
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:07:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJfh-0003ls-7f
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:07:58 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54736)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1itJfh-0003lU-3K; Sun, 19 Jan 2020 18:07:57 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 507472997B; Sun, 19 Jan 2020 18:07:55 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <e4fd3638021d2b469f4e786ea82d5b9284e8627b.1579474761.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1579474761.git.fthain@telegraphics.com.au>
References: <cover.1579474761.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 08/14] dp8393x: Don't clobber packet checksum
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2020 09:59:21 +1100
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A received packet consumes pkt_size bytes in the buffer and the frame
checksum that's appended to it consumes another 4 bytes. The Receive
Buffer Address register takes the former quantity into account but
not the latter. So the next packet written to the buffer overwrites
the frame checksum. Fix this.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/dp8393x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 0309365fda..947ceef37c 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -816,6 +816,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, co=
nst uint8_t * buf,
     address +=3D rx_len;
     address_space_rw(&s->as, address,
         MEMTXATTRS_UNSPECIFIED, (uint8_t *)&checksum, 4, 1);
+    address +=3D 4;
     rx_len +=3D 4;
     s->regs[SONIC_CRBA1] =3D address >> 16;
     s->regs[SONIC_CRBA0] =3D address & 0xffff;
--=20
2.24.1


