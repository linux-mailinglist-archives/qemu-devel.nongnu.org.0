Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E33E1462E1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 08:51:43 +0100 (CET)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuXHC-00079V-2h
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 02:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFL-0005h2-NE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:49:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFK-0004Om-PE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:49:47 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:45332)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1iuXFK-0004NX-JY
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:49:46 -0500
Received: from fwd21.aul.t-online.de (fwd21.aul.t-online.de [172.20.27.66])
 by mailout08.t-online.de (Postfix) with SMTP id 2005D41D32A5;
 Thu, 23 Jan 2020 08:49:44 +0100 (CET)
Received: from linpower.localnet
 (bNEJ2sZQwhPdF053p99rOr5eUOxzP1RKhWfabVigViNXshI5fz3GEbZxOaUAu9YwCt@[46.86.62.122])
 by fwd21.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1iuXFH-2K3ybo0; Thu, 23 Jan 2020 08:49:43 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 53C20200602; Thu, 23 Jan 2020 08:49:43 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/9] audio: fix audio_generic_write
Date: Thu, 23 Jan 2020 08:49:35 +0100
Message-Id: <20200123074943.6699-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
References: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: bNEJ2sZQwhPdF053p99rOr5eUOxzP1RKhWfabVigViNXshI5fz3GEbZxOaUAu9YwCt
X-TOI-MSGID: 1d46e7d3-5dca-40f8-b7d1-b8b55b8cbcbc
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 194.25.134.20
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

The pcm_ops function put_buffer_out expects the returned pointer
of function get_buffer_out as argument. Fix this.

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index abea027fdf..db44482342 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1475,7 +1475,7 @@ size_t audio_generic_write(HWVoiceOut *hw, void *bu=
f, size_t size)
     copy_size =3D MIN(size, dst_size);
=20
     memcpy(dst, buf, copy_size);
-    return hw->pcm_ops->put_buffer_out(hw, buf, copy_size);
+    return hw->pcm_ops->put_buffer_out(hw, dst, copy_size);
 }
=20
 size_t audio_generic_read(HWVoiceIn *hw, void *buf, size_t size)
--=20
2.16.4


