Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0947B7585
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 10:56:52 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAsF9-0002ye-Ad
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 04:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iArvk-000595-4r
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iArvg-0000H1-Af
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:36:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iArvf-0000GL-UK
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 04:36:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2CB630832C8;
 Thu, 19 Sep 2019 08:36:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D904360C18;
 Thu, 19 Sep 2019 08:36:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 915981FCC2; Thu, 19 Sep 2019 10:36:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 Sep 2019 10:36:27 +0200
Message-Id: <20190919083629.29998-25-kraxel@redhat.com>
In-Reply-To: <20190919083629.29998-1-kraxel@redhat.com>
References: <20190919083629.29998-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 19 Sep 2019 08:36:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 24/26] usbaudio: change playback counters to 64
 bit
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
Cc: Kővágó@redhat.com, =?UTF-8?q?Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

With stereo playback, they need about 375 minutes of continuous audio
playback to overflow, which is usually not a problem (as stopping and
later resuming playback resets the counters).  But with 7.1 audio, they
only need about 95 minutes to overflow.

After the overflow, the buf->prod % USBAUDIO_PACKET_SIZE(channels)
assertion no longer holds true, which will result in overflowing the
buffer.  With 64 bit variables, it would take about 762000 years to
overflow.

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: c0a8d934c145bab55506e0623cc0206e2632a196.1568574965.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-audio.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index e42bdfbdc101..ea604bbb8e4a 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -578,9 +578,9 @@ static const USBDesc desc_audio_multi =3D {
=20
 struct streambuf {
     uint8_t *data;
-    uint32_t size;
-    uint32_t prod;
-    uint32_t cons;
+    size_t size;
+    uint64_t prod;
+    uint64_t cons;
 };
=20
 static void streambuf_init(struct streambuf *buf, uint32_t size,
@@ -601,7 +601,7 @@ static void streambuf_fini(struct streambuf *buf)
=20
 static int streambuf_put(struct streambuf *buf, USBPacket *p, uint32_t c=
hannels)
 {
-    uint32_t free =3D buf->size - (buf->prod - buf->cons);
+    int64_t free =3D buf->size - (buf->prod - buf->cons);
=20
     if (free < USBAUDIO_PACKET_SIZE(channels)) {
         return 0;
@@ -610,6 +610,8 @@ static int streambuf_put(struct streambuf *buf, USBPa=
cket *p, uint32_t channels)
         return 0;
     }
=20
+    /* can happen if prod overflows */
+    assert(buf->prod % USBAUDIO_PACKET_SIZE(channels) =3D=3D 0);
     usb_packet_copy(p, buf->data + (buf->prod % buf->size),
                     USBAUDIO_PACKET_SIZE(channels));
     buf->prod +=3D USBAUDIO_PACKET_SIZE(channels);
@@ -618,10 +620,10 @@ static int streambuf_put(struct streambuf *buf, USB=
Packet *p, uint32_t channels)
=20
 static uint8_t *streambuf_get(struct streambuf *buf, size_t *len)
 {
-    uint32_t used =3D buf->prod - buf->cons;
+    int64_t used =3D buf->prod - buf->cons;
     uint8_t *data;
=20
-    if (!used) {
+    if (used <=3D 0) {
         *len =3D 0;
         return NULL;
     }
--=20
2.18.1


