Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2461019E2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 08:00:14 +0100 (CET)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWxUj-0007Bt-Dy
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 02:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1iWxTa-0006Zl-Rk
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 01:59:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1iWxTZ-0000kX-QX
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 01:59:02 -0500
Received: from mailout10.t-online.de ([194.25.134.21]:57538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1iWxTZ-0000jX-G5
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 01:59:01 -0500
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout10.t-online.de (Postfix) with SMTP id 14F5A41D7029;
 Tue, 19 Nov 2019 07:58:58 +0100 (CET)
Received: from [192.168.211.101]
 (VOcBk-ZEYhrR15P8gXfBXy982L1bOT5cKE+R-5oHwekIa1qieEwkYqn+c2oJHbWQM1@[46.86.57.145])
 by fwd22.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1iWxTO-10MFdY0; Tue, 19 Nov 2019 07:58:50 +0100
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH] audio: fix audio recording
Message-ID: <2fc947cf-7b42-de68-3f11-cbcf1c096be9@t-online.de>
Date: Tue, 19 Nov 2019 07:58:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ID: VOcBk-ZEYhrR15P8gXfBXy982L1bOT5cKE+R-5oHwekIa1qieEwkYqn+c2oJHbWQM1
X-TOI-MSGID: e5905e3c-b204-49f7-83f6-affbfef475fe
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With current code audio recording with all audio backends
except PulseAudio and DirectSound is broken. The generic audio
recording buffer management forgot to update the current read
position after a read.

Fixes: ff095e5231 "audio: api for mixeng code free backends"

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/audio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/audio/audio.c b/audio/audio.c
index 7fc3aa9d16..56fae55047 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1390,6 +1390,7 @@ void *audio_generic_get_buffer_in(HWVoiceIn *hw, si=
ze_t *size)
         size_t read =3D hw->pcm_ops->read(hw, hw->buf_emul + hw->pos_emu=
l,
                                         read_len);
         hw->pending_emul +=3D read;
+        hw->pos_emul =3D (hw->pos_emul + read) % hw->size_emul;
         if (read < read_len) {
             break;
         }
--=20
2.16.4


