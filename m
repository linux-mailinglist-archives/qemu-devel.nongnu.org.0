Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3F176395
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 20:13:22 +0100 (CET)
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8qVG-0007R3-1T
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 14:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1j8qSI-0003vB-EP
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:10:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1j8qSH-0005Gj-FC
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:10:18 -0500
Received: from mailout04.t-online.de ([194.25.134.18]:45714)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1j8qSH-0005Ex-8t
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:10:17 -0500
Received: from fwd24.aul.t-online.de (fwd24.aul.t-online.de [172.20.26.129])
 by mailout04.t-online.de (Postfix) with SMTP id D70FE41FE4B1;
 Mon,  2 Mar 2020 20:10:15 +0100 (CET)
Received: from linpower.localnet
 (JO0NbqZUghBncFwrVZOZcq8S8rgE5SI7sQyfrCrv5rMj+y2ddSFvFUlCGUDY4TvZKF@[79.208.28.226])
 by fwd24.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1j8qSA-0GSSUi0; Mon, 2 Mar 2020 20:10:10 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 906E221B1C0; Mon,  2 Mar 2020 20:10:04 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 3/5] audio: consistency changes
Date: Mon,  2 Mar 2020 20:10:02 +0100
Message-Id: <20200302191004.5991-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <417bfe2f-e3c1-d83d-b437-47859daf524d@t-online.de>
References: <417bfe2f-e3c1-d83d-b437-47859daf524d@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: JO0NbqZUghBncFwrVZOZcq8S8rgE5SI7sQyfrCrv5rMj+y2ddSFvFUlCGUDY4TvZKF
X-TOI-MSGID: df0916cc-babe-4635-b357-2682298f46c3
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.18
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


