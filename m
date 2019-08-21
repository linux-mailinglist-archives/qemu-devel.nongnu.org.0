Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8797549
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 10:46:59 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0MGf-00011u-Rj
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 04:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0MBH-0003mx-Gz
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0MBG-00054k-H1
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:41:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39562)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0MBG-00054A-Ac
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:41:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 992163060289;
 Wed, 21 Aug 2019 08:41:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4049384017;
 Wed, 21 Aug 2019 08:41:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D0F5F31E7A; Wed, 21 Aug 2019 10:41:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 10:41:06 +0200
Message-Id: <20190821084113.1840-9-kraxel@redhat.com>
In-Reply-To: <20190821084113.1840-1-kraxel@redhat.com>
References: <20190821084113.1840-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 21 Aug 2019 08:41:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/15] paaudio: do not move stream when
 sink/source name is specified
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Kővágó@redhat.com, Markus Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Michael Walle <michael@walle.cc>, Gerd Hoffmann <kraxel@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, =?UTF-8?q?Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Unless we disable stream moving, pulseaudio can easily move the stream
on connect, effectively ignoring the source/sink specified by the user.

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: c245929463e6e46a48b2875a150815e2ccba11b4.1566168923.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index cc3a34c2eaeb..24d98b344a37 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -517,6 +517,11 @@ static pa_stream *qpa_simple_new (
 #endif
         | PA_STREAM_AUTO_TIMING_UPDATE;
=20
+    if (dev) {
+        /* don't move the stream if the user specified a sink/source */
+        flags |=3D PA_STREAM_DONT_MOVE;
+    }
+
     if (dir =3D=3D PA_STREAM_PLAYBACK) {
         r =3D pa_stream_connect_playback(stream, dev, attr, flags, NULL,=
 NULL);
     } else {
--=20
2.18.1


