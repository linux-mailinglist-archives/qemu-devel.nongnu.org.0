Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5103130193
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jan 2020 10:14:59 +0100 (CET)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1infWM-0005rB-Vi
	for lists+qemu-devel@lfdr.de; Sat, 04 Jan 2020 04:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1infT4-0001fu-5i
 for qemu-devel@nongnu.org; Sat, 04 Jan 2020 04:11:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1infT3-0006tL-5q
 for qemu-devel@nongnu.org; Sat, 04 Jan 2020 04:11:34 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:50330)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1infT2-0006oY-VJ
 for qemu-devel@nongnu.org; Sat, 04 Jan 2020 04:11:33 -0500
Received: from fwd24.aul.t-online.de (fwd24.aul.t-online.de [172.20.26.129])
 by mailout09.t-online.de (Postfix) with SMTP id C935D42B0144;
 Sat,  4 Jan 2020 10:11:31 +0100 (CET)
Received: from linpower.localnet
 (Vsp7dwZE8hpwRej46NpLTFiWFvj2SK016rerHX+lsK5vuuPi5AfAJTyyhjou9r7Qhm@[46.86.52.107])
 by fwd24.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1infSv-3aVadM0; Sat, 4 Jan 2020 10:11:25 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 2155220278E; Sat,  4 Jan 2020 10:11:22 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 2/5] hda-codec: fix recording rate control
Date: Sat,  4 Jan 2020 10:11:19 +0100
Message-Id: <20200104091122.13971-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <07d61da6-51fb-8599-ea27-dae828fbdb3c@t-online.de>
References: <07d61da6-51fb-8599-ea27-dae828fbdb3c@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: Vsp7dwZE8hpwRej46NpLTFiWFvj2SK016rerHX+lsK5vuuPi5AfAJTyyhjou9r7Qhm
X-TOI-MSGID: e3c19cee-8fcb-4b34-a0a0-7925696ff78a
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.84
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apply previous commit to hda_audio_input_cb for the same
reasons.

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 hw/audio/hda-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index 768ba31e79..e711a99a41 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -265,8 +265,6 @@ static void hda_audio_input_cb(void *opaque, int avai=
l)
=20
     int64_t to_transfer =3D MIN(B_SIZE - (wpos - rpos), avail);
=20
-    hda_timer_sync_adjust(st, -((wpos - rpos) + to_transfer - (B_SIZE >>=
 1)));
-
     while (to_transfer) {
         uint32_t start =3D (uint32_t) (wpos & B_MASK);
         uint32_t chunk =3D (uint32_t) MIN(B_SIZE - start, to_transfer);
@@ -278,6 +276,8 @@ static void hda_audio_input_cb(void *opaque, int avai=
l)
             break;
         }
     }
+
+    hda_timer_sync_adjust(st, -((wpos - rpos) - (B_SIZE >> 1)));
 }
=20
 static void hda_audio_output_timer(void *opaque)
--=20
2.16.4


