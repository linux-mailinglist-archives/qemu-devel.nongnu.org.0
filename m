Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2919563C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 12:23:04 +0100 (CET)
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHn4p-0004sm-Hq
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 07:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jHmwn-0001Uq-Bz
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1jHmwm-0002Ml-7s
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:14:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31951)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1jHmwm-0002Kz-3X
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585307683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVjR52ndEVQzi/3Y7VF32r03ZxvHDDMkrTSaExrTLgI=;
 b=MNdqEt9sDALnn1gjlfATbXv8eXxVqgLa3N9bDs876JcHGGbhMQCAfsp54/fbmIfeRuHz7R
 qubghfJSdsfkjrpuhMTKNMLpD0UmoKJhjYg9i5aFckCbjubODkNp7loUBmh5zYpLRd5I7l
 zUVddAcg1/YIs73JKM+CIuMzpENWYzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-aVUtkcF2Pqi02TIcCnSVYQ-1; Fri, 27 Mar 2020 07:14:41 -0400
X-MC-Unique: aVUtkcF2Pqi02TIcCnSVYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0CB13E2;
 Fri, 27 Mar 2020 11:14:40 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-77.pek2.redhat.com
 [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC9C5E01F;
 Fri, 27 Mar 2020 11:14:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 13/13] hw/net/allwinner-sun8i-emac.c: Fix REG_ADDR_HIGH/LOW
 reads
Date: Fri, 27 Mar 2020 19:14:07 +0800
Message-Id: <1585307647-24456-14-git-send-email-jasowang@redhat.com>
In-Reply-To: <1585307647-24456-1-git-send-email-jasowang@redhat.com>
References: <1585307647-24456-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out (CID 1421926) that the read code for
REG_ADDR_HIGH reads off the end of the buffer, because it does a
32-bit read from byte 4 of a 6-byte buffer.

The code also has an endianness issue for both REG_ADDR_HIGH and
REG_ADDR_LOW, because it will do the wrong thing on a big-endian
host.

Rewrite the read code to use ldl_le_p() and lduw_le_p() to fix this;
the write code is not incorrect, but for consistency we make it use
stl_le_p() and stw_le_p().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/allwinner-sun8i-emac.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 3fc5e34..fc67a1b 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -611,10 +611,10 @@ static uint64_t allwinner_sun8i_emac_read(void *opaqu=
e, hwaddr offset,
         value =3D s->mii_data;
         break;
     case REG_ADDR_HIGH:         /* MAC Address High */
-        value =3D *(((uint32_t *) (s->conf.macaddr.a)) + 1);
+        value =3D lduw_le_p(s->conf.macaddr.a + 4);
         break;
     case REG_ADDR_LOW:          /* MAC Address Low */
-        value =3D *(uint32_t *) (s->conf.macaddr.a);
+        value =3D ldl_le_p(s->conf.macaddr.a);
         break;
     case REG_TX_DMA_STA:        /* Transmit DMA Status */
         break;
@@ -728,14 +728,10 @@ static void allwinner_sun8i_emac_write(void *opaque, =
hwaddr offset,
         s->mii_data =3D value;
         break;
     case REG_ADDR_HIGH:         /* MAC Address High */
-        s->conf.macaddr.a[4] =3D (value & 0xff);
-        s->conf.macaddr.a[5] =3D (value & 0xff00) >> 8;
+        stw_le_p(s->conf.macaddr.a + 4, value);
         break;
     case REG_ADDR_LOW:          /* MAC Address Low */
-        s->conf.macaddr.a[0] =3D (value & 0xff);
-        s->conf.macaddr.a[1] =3D (value & 0xff00) >> 8;
-        s->conf.macaddr.a[2] =3D (value & 0xff0000) >> 16;
-        s->conf.macaddr.a[3] =3D (value & 0xff000000) >> 24;
+        stl_le_p(s->conf.macaddr.a, value);
         break;
     case REG_TX_DMA_STA:        /* Transmit DMA Status */
     case REG_TX_CUR_DESC:       /* Transmit Current Descriptor */
--=20
2.5.0


