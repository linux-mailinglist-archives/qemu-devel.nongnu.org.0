Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624EF1462F3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 08:55:58 +0100 (CET)
Received: from localhost ([::1]:52426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuXLJ-0004aZ-AW
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 02:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFa-0005yI-G2
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFZ-0004g1-H3
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:50:02 -0500
Received: from mailout04.t-online.de ([194.25.134.18]:51794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1iuXFZ-0004dZ-Ah
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:50:01 -0500
Received: from fwd29.aul.t-online.de (fwd29.aul.t-online.de [172.20.26.134])
 by mailout04.t-online.de (Postfix) with SMTP id 18D9541FCB1C;
 Thu, 23 Jan 2020 08:50:00 +0100 (CET)
Received: from linpower.localnet
 (GFWNiEZAQhrdd42r1V37Wi9PdfyQtCetwxZWB5SNhsPudsjem+dOmwhMp9907QJQ9u@[46.86.62.122])
 by fwd29.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1iuXFW-3e3Ii80; Thu, 23 Jan 2020 08:49:58 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5EF22200F7A; Thu, 23 Jan 2020 08:49:43 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 7/9] ossaudio: prevent SIGPFE in oss_write
Date: Thu, 23 Jan 2020 08:49:41 +0100
Message-Id: <20200123074943.6699-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
References: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: GFWNiEZAQhrdd42r1V37Wi9PdfyQtCetwxZWB5SNhsPudsjem+dOmwhMp9907QJQ9u
X-TOI-MSGID: 10dee584-7dad-4154-905c-87869e450261
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new buffer write position is modulo the buffer size.

To reproduce start qemu with:
-audiodev oss,id=3Daudio0,try-mmap=3Don,out.mixing-engine=3Doff

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/ossaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 6a3b78b381..39a6fc09e5 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -429,7 +429,7 @@ static size_t oss_write(HWVoiceOut *hw, void *buf, si=
ze_t len)
             size_t to_copy =3D MIN(len, hw->size_emul - hw->pos_emul);
             memcpy(hw->buf_emul + hw->pos_emul, buf, to_copy);
=20
-            hw->pos_emul =3D (hw->pos_emul + to_copy) % hw->pos_emul;
+            hw->pos_emul =3D (hw->pos_emul + to_copy) % hw->size_emul;
             buf +=3D to_copy;
             len -=3D to_copy;
         }
--=20
2.16.4


