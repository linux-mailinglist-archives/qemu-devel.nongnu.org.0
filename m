Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DA17739A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:13:57 +0100 (CET)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j94Ym-0004l3-CI
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j94Vw-0007Y6-IT
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j94Vv-00068S-Ef
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:00 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54752
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j94Vv-00068L-BV
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583230259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OQLIIsu9IUkx4F4aWeIGd+dq+m+Lo5MX36L6VEBCAk=;
 b=bPau8qgXat+82KCiYgD/NOzQ/bxuIHlxXx4MdhHDN4NuwhlWiyVPaGvRxIC5XoeF61m9qy
 b6EPpyG6wiOy572eTMJXv2BnsAJWifTeepZn+D98DbStlNIbFSGWYDRWKsJ9s37mGAA92t
 MbsQnodrcYVLzsSxCGb7VRV9UGVD87M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-eDXgoL5DMbKEX7ej6UqnUQ-1; Tue, 03 Mar 2020 05:10:55 -0500
X-MC-Unique: eDXgoL5DMbKEX7ej6UqnUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E67AA8017CC;
 Tue,  3 Mar 2020 10:10:53 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-98.pek2.redhat.com
 [10.72.12.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE648D553;
 Tue,  3 Mar 2020 10:10:52 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 03/23] dp8393x: Clean up endianness hacks
Date: Tue,  3 Mar 2020 18:10:22 +0800
Message-Id: <1583230242-14597-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
References: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Finn Thain <fthain@telegraphics.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Finn Thain <fthain@telegraphics.com.au>

According to the datasheet, section 3.4.4, "in 32-bit mode ... the SONIC
always writes long words".

Therefore, use the same technique for the 'in_use' field that is used
everywhere else, and write the full long word.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/dp8393x.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 51b71da..1844482 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -778,8 +778,6 @@ static ssize_t dp8393x_receive(NetClientState *nc, cons=
t uint8_t * buf,
         return -1;
     }
=20
-    /* XXX: Check byte ordering */
-
     /* Check for EOL */
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* Are we still in resource exhaustion? */
@@ -851,15 +849,12 @@ static ssize_t dp8393x_receive(NetClientState *nc, co=
nst uint8_t * buf,
         /* EOL detected */
         s->regs[SONIC_ISR] |=3D SONIC_ISR_RDE;
     } else {
-        /* Clear in_use, but it is always 16bit wide */
-        int offset =3D dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        if (s->big_endian && width =3D=3D 2) {
-            /* we need to adjust the offset of the 16bit field */
-            offset +=3D sizeof(uint16_t);
-        }
-        s->data[0] =3D 0;
-        address_space_write(&s->as, offset, MEMTXATTRS_UNSPECIFIED,
-                            s->data, sizeof(uint16_t));
+        /* Clear in_use */
+        size =3D sizeof(uint16_t) * width;
+        address =3D dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
+        dp8393x_put(s, width, 0, 0);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            s->data, size);
         s->regs[SONIC_CRDA] =3D s->regs[SONIC_LLFA];
         s->regs[SONIC_ISR] |=3D SONIC_ISR_PKTRX;
         s->regs[SONIC_RSC] =3D (s->regs[SONIC_RSC] & 0xff00) | (((s->regs[=
SONIC_RSC] & 0x00ff) + 1) & 0x00ff);
--=20
2.5.0


