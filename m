Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3618B67F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 13:21:02 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxUrN-00065C-Fd
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 07:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41675)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hxUou-000192-AY
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 07:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hxUos-00053i-5R
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 07:18:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hxUoq-00051s-6Y
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 07:18:25 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7131866971;
 Tue, 13 Aug 2019 11:18:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225FF100195F;
 Tue, 13 Aug 2019 11:18:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76CFE9D22; Tue, 13 Aug 2019 13:18:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 13:18:01 +0200
Message-Id: <20190813111809.3141-8-kraxel@redhat.com>
In-Reply-To: <20190813111809.3141-1-kraxel@redhat.com>
References: <20190813111809.3141-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 13 Aug 2019 11:18:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/15] paaudio: do not move stream when
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Kővágó@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Walle <michael@walle.cc>, Gerd Hoffmann <kraxel@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, =?UTF-8?q?Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Unless we disable stream moving, pulseaudio can easily move the stream
on connect, effectively ignoring the source/sink specified by the user.

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 274fc4ecc9125605a210b737c7fd927c51ff08ce.1564925486.git.DirtY=
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


