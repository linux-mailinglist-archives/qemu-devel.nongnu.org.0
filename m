Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A646389B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 17:28:16 +0200 (CEST)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hks2R-0000bz-Gw
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkrwZ-0002rS-Po
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:22:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkrwV-0007km-Ql
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:22:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkrwR-0007iM-Rq; Tue, 09 Jul 2019 11:22:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B4402C0733C9;
 Tue,  9 Jul 2019 15:21:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE26A8491B;
 Tue,  9 Jul 2019 15:21:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 17:21:45 +0200
Message-Id: <20190709152145.21308-2-philmd@redhat.com>
In-Reply-To: <20190709152145.21308-1-philmd@redhat.com>
References: <20190709152145.21308-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 09 Jul 2019 15:22:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/1] Revert "hw/block/pflash_cfi02: Reduce I/O
 accesses to 16-bit"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 3ae0343db69c379beb5750b4ed70794bbed51b85.

Stephen Checkoway noticed commit 3ae0343db69 is incorrect.
This commit state all parallel flashes are limited to 16-bit
accesses, however the x32 configuration exists in some models,
such the Cypress S29CL032J, which CFI Device Geometry Definition
announces:

  CFI ADDR     DATA
  0x28,0x29 =3D 0x0003 (x32-only asynchronous interface)

Guests should not be affected by the previous change, because
QEMU does not announce itself as x32 capable:

    /* Flash device interface (8 & 16 bits) */
    pfl->cfi_table[0x28] =3D 0x02;
    pfl->cfi_table[0x29] =3D 0x00;

Commit 3ae0343db69 does not restrict the bus to 16-bit accesses,
but restrict the implementation as 16-bit access max, so a guest
32-bit access will result in 2x 16-bit calls.

Now, we have 2 boards that register the flash device in 32-bit
access:

- PPC: taihu_405ep

  The CFI id matches the S29AL008J that is a 1MB in x16, while
  the code QEMU forces it to be 2MB, and checking Linux it expects
  a 4MB flash.

- ARM: Digic4

  While the comment says "Samsung K8P3215UQB 64M Bit (4Mx16)",
  this flash is 32Mb (2MB). Also note the CFI id does not match
  the comment.

To avoid unexpected side effect, we revert commit 3ae0343db69,
and will clean the board code later.

Reported-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 5392290c72..83084b9d72 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -317,6 +317,8 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)
     boff =3D offset & 0xFF;
     if (pfl->width =3D=3D 2) {
         boff =3D boff >> 1;
+    } else if (pfl->width =3D=3D 4) {
+        boff =3D boff >> 2;
     }
     switch (pfl->cmd) {
     default:
@@ -447,6 +449,8 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
     boff =3D offset;
     if (pfl->width =3D=3D 2) {
         boff =3D boff >> 1;
+    } else if (pfl->width =3D=3D 4) {
+        boff =3D boff >> 2;
     }
     /* Only the least-significant 11 bits are used in most cases. */
     boff &=3D 0x7FF;
@@ -706,7 +710,6 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
 static const MemoryRegionOps pflash_cfi02_ops =3D {
     .read =3D pflash_read,
     .write =3D pflash_write,
-    .impl.max_access_size =3D 2,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
--=20
2.20.1


