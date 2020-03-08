Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B517D5E4
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Mar 2020 20:37:28 +0100 (CET)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jB1jr-0006bs-FM
	for lists+qemu-devel@lfdr.de; Sun, 08 Mar 2020 15:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1jB1g5-0002M9-Ns
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 15:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1jB1g3-0006zD-S3
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 15:33:33 -0400
Received: from mailout10.t-online.de ([194.25.134.21]:49904)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jB1g3-0006yO-M8
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 15:33:31 -0400
Received: from fwd21.aul.t-online.de (fwd21.aul.t-online.de [172.20.27.66])
 by mailout10.t-online.de (Postfix) with SMTP id C08114165D92;
 Sun,  8 Mar 2020 20:33:30 +0100 (CET)
Received: from linpower.localnet
 (rfXi7EZcYhEYaecl9IiV6vn0SfQ5qcJ2B5vqiHMlset2WbpnC2qcATxOtNr2iJUwwm@[79.208.31.100])
 by fwd21.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jB1fz-2eqGjw0; Sun, 8 Mar 2020 20:33:27 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 95A842006CD; Sun,  8 Mar 2020 20:33:21 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 3/6] audio: consistency changes
Date: Sun,  8 Mar 2020 20:33:18 +0100
Message-Id: <20200308193321.20668-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <2a4ade5f-d39b-3094-578f-6cced4650720@t-online.de>
References: <2a4ade5f-d39b-3094-578f-6cced4650720@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: rfXi7EZcYhEYaecl9IiV6vn0SfQ5qcJ2B5vqiHMlset2WbpnC2qcATxOtNr2iJUwwm
X-TOI-MSGID: 4f0e0210-3d2d-468a-a782-98d07c436075
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.21
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
Cc: John Arbuckle <programmingkidx@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the clip_natural_float_from_mono() function in
audio/mixeng.c to be consistent with the clip_*_from_mono()
functions in audio/mixeng_template.h.

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/mixeng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/mixeng.c b/audio/mixeng.c
index b57fad83bf..725b529be7 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -316,7 +316,7 @@ static void clip_natural_float_from_mono(void *dst, c=
onst struct st_sample *src,
     float *out =3D (float *)dst;
=20
     while (samples--) {
-        *out++ =3D CLIP_NATURAL_FLOAT(src->l) + CLIP_NATURAL_FLOAT(src->=
r);
+        *out++ =3D CLIP_NATURAL_FLOAT(src->l + src->r);
         src++;
     }
 }
--=20
2.16.4


