Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA661133B33
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 06:34:30 +0100 (CET)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip3zB-0000lI-AW
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 00:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oZ-0003qt-L5
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oY-0002g5-FR
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:31 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37841 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ip3oY-0002dQ-3x; Wed, 08 Jan 2020 00:23:30 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47syMB4srTz9sSJ; Wed,  8 Jan 2020 16:23:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578460998;
 bh=K4gmsQsjqkgxHMHY6wYcJkaVCCpvjnAzS4xbEtMGHfU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mKU4LJz5VnbpK0PjUrno0/Pez/6DJLWnSlifmx3xj1n4rBI+IbXjXxoC1sk2grzex
 QW9OuujZKjbDeMxp9BQssnDQeYVa5nBi2fi1GqQbMUZ/kUBf/d7GJgxkaplAeCfnjk
 Gu1kkyciG/V3iqZDFr40FPyztK38dfvpkjthBfEg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 06/26] mos6522: remove anh register
Date: Wed,  8 Jan 2020 16:22:52 +1100
Message-Id: <20200108052312.238710-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108052312.238710-1-david@gibson.dropbear.id.au>
References: <20200108052312.238710-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

Register addr 1 is defined as buffer A with handshake (vBufAH),
register addr 15 is also defined as buffer A without handshake (vBufA).

As both addresses access the same register, remove the definition of
'anh' and use only 'a' (with VIA_REG_ANH and VIA_REG_A).

Fixes: 51f233ec92cd ("misc: introduce new mos6522 VIA device and enable i=
t for ppc builds")
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191220214054.76525-1-laurent@vivier.eu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/misc/mos6522.c         | 16 ++++++++--------
 include/hw/misc/mos6522.h |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index cecf0be59e..10b85bf751 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -244,6 +244,9 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsi=
gned size)
         val =3D s->b;
         break;
     case VIA_REG_A:
+       qemu_log_mask(LOG_UNIMP, "Read access to register A with handshak=
e");
+       /* fall through */
+    case VIA_REG_ANH:
         val =3D s->a;
         break;
     case VIA_REG_DIRB:
@@ -297,9 +300,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsi=
gned size)
         val =3D s->ier | 0x80;
         break;
     default:
-    case VIA_REG_ANH:
-        val =3D s->anh;
-        break;
+        g_assert_not_reached();
     }
=20
     if (addr !=3D VIA_REG_IFR || val !=3D 0) {
@@ -322,6 +323,9 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_=
t val, unsigned size)
         mdc->portB_write(s);
         break;
     case VIA_REG_A:
+       qemu_log_mask(LOG_UNIMP, "Write access to register A with handsha=
ke");
+       /* fall through */
+    case VIA_REG_ANH:
         s->a =3D (s->a & ~s->dira) | (val & s->dira);
         mdc->portA_write(s);
         break;
@@ -395,9 +399,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_=
t val, unsigned size)
                               qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     default:
-    case VIA_REG_ANH:
-        s->anh =3D val;
-        break;
+        g_assert_not_reached();
     }
 }
=20
@@ -439,7 +441,6 @@ const VMStateDescription vmstate_mos6522 =3D {
         VMSTATE_UINT8(pcr, MOS6522State),
         VMSTATE_UINT8(ifr, MOS6522State),
         VMSTATE_UINT8(ier, MOS6522State),
-        VMSTATE_UINT8(anh, MOS6522State),
         VMSTATE_STRUCT_ARRAY(timers, MOS6522State, 2, 0,
                              vmstate_mos6522_timer, MOS6522Timer),
         VMSTATE_END_OF_LIST()
@@ -460,7 +461,6 @@ static void mos6522_reset(DeviceState *dev)
     s->ifr =3D 0;
     s->ier =3D 0;
     /* s->ier =3D T1_INT | SR_INT; */
-    s->anh =3D 0;
=20
     s->timers[0].frequency =3D s->frequency;
     s->timers[0].latch =3D 0xffff;
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index 493c907537..97384c6e02 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -115,7 +115,6 @@ typedef struct MOS6522State {
     uint8_t pcr;
     uint8_t ifr;
     uint8_t ier;
-    uint8_t anh;
=20
     MOS6522Timer timers[2];
     uint64_t frequency;
--=20
2.24.1


