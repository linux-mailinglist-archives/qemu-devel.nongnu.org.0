Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3C3126EFC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 21:35:44 +0100 (CET)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii2WM-0003Ck-Q1
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 15:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1ii2V8-0002S9-OZ
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 15:34:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1ii2V6-0004zl-Ag
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 15:34:25 -0500
Received: from mailout10.t-online.de ([194.25.134.21]:55858)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1ii2V5-0004vV-Ji
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 15:34:24 -0500
Received: from fwd08.aul.t-online.de (fwd08.aul.t-online.de [172.20.26.151])
 by mailout10.t-online.de (Postfix) with SMTP id 635EC41AB6CA;
 Thu, 19 Dec 2019 21:34:20 +0100 (CET)
Received: from [192.168.211.200]
 (ZwFKR-ZbZh+aWuW6Nnr+CUc6kXWuikxlDcXi2nzflh-LMBG+3W-8K0b5AbkWw5sQnC@[46.86.55.2])
 by fwd08.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1ii2Uo-2y5gzw0; Thu, 19 Dec 2019 21:34:06 +0100
To: Gerd Hoffmann <kraxel@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH] audio: fix integer overflow
Message-ID: <8893a235-66a8-8fbe-7d95-862e29da90b1@t-online.de>
Date: Thu, 19 Dec 2019 21:34:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
X-ID: ZwFKR-ZbZh+aWuW6Nnr+CUc6kXWuikxlDcXi2nzflh-LMBG+3W-8K0b5AbkWw5sQnC
X-TOI-MSGID: 47af9478-51e0-4a74-b0b0-ea4497754600
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tell the compiler to do a 32bit * 32bit -> 64bit multiplication
because period_ticks is a 64bit variable. The overflow occurs
for audio timer periods larger than 4294967us.

Fixes: be1092afa0 "audio: fix audio timer rate conversion bug"

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 56fae55047..abea027fdf 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1738,7 +1738,7 @@ static AudioState *audio_init(Audiodev *dev, const =
char *name)
     if (dev->timer_period <=3D 0) {
         s->period_ticks =3D 1;
     } else {
-        s->period_ticks =3D dev->timer_period * SCALE_US;
+        s->period_ticks =3D dev->timer_period * (int64_t)SCALE_US;
     }
=20
     e =3D qemu_add_vm_change_state_handler (audio_vm_change_state_handle=
r, s);
--=20
2.16.4


