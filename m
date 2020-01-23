Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673991462E5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 08:52:20 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuXHm-0007xe-QV
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 02:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFe-00064E-Tr
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:50:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFd-0004k4-Or
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:50:06 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:52880)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1iuXFd-0004iw-If
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:50:05 -0500
Received: from fwd28.aul.t-online.de (fwd28.aul.t-online.de [172.20.26.133])
 by mailout11.t-online.de (Postfix) with SMTP id AB0C7420CE02;
 Thu, 23 Jan 2020 08:50:04 +0100 (CET)
Received: from linpower.localnet
 (bHQziOZJ8hihzvynLX2VZ7WNABYdTbkckmy6-wzT15PRNqmXAUFxGBvKiAAcuHcw2P@[46.86.62.122])
 by fwd28.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1iuXFb-4bEfKa0; Thu, 23 Jan 2020 08:50:03 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 62E8420109E; Thu, 23 Jan 2020 08:49:43 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 9/9] audio: audio_generic_get_buffer_in should honor *size
Date: Thu, 23 Jan 2020 08:49:43 +0100
Message-Id: <20200123074943.6699-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
References: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: bHQziOZJ8hihzvynLX2VZ7WNABYdTbkckmy6-wzT15PRNqmXAUFxGBvKiAAcuHcw2P
X-TOI-MSGID: 2e6beee5-9e20-489a-9183-2aa25db3e52f
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 194.25.134.85
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

The function generic_get_buffer_in currently ignores the *size
parameter and may return a buffer larger than *size.

As a result the variable samples in function
audio_pcm_hw_run_in may underflow. The while loop then most
likely will never termiate.

This bug was reported at http://bugs.debian.org/948658.

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/audio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 81822bfec9..f5fb6cbf53 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1406,7 +1406,8 @@ void *audio_generic_get_buffer_in(HWVoiceIn *hw, si=
ze_t *size)
     }
     assert(start >=3D 0 && start < hw->size_emul);
=20
-    *size =3D MIN(hw->pending_emul, hw->size_emul - start);
+    *size =3D MIN(*size, hw->pending_emul);
+    *size =3D MIN(*size, hw->size_emul - start);
     return hw->buf_emul + start;
 }
=20
--=20
2.16.4


