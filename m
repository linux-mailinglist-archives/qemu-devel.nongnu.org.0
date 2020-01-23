Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29201462C9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 08:42:53 +0100 (CET)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuX8e-0002b5-Mo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 02:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1iuX7g-00020G-DZ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:41:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1iuX7f-0005PB-Bc
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:41:52 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:45924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1iuX7f-0005LM-5b
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:41:51 -0500
Received: from fwd29.aul.t-online.de (fwd29.aul.t-online.de [172.20.26.134])
 by mailout11.t-online.de (Postfix) with SMTP id 1F962422B887;
 Thu, 23 Jan 2020 08:41:48 +0100 (CET)
Received: from [192.168.211.200]
 (rIZPGYZdwhDHRe+GAqfr5AAcz2nzkPUgDJCRzYoQM82HGjLY0bbWl120vLmGvVYgtk@[46.86.62.122])
 by fwd29.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1iuX7b-0l15Sy0; Thu, 23 Jan 2020 08:41:47 +0100
To: Gerd Hoffmann <kraxel@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/9] more audio fixes and improvements
Message-ID: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
Date: Thu, 23 Jan 2020 08:41:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ID: rIZPGYZdwhDHRe+GAqfr5AAcz2nzkPUgDJCRzYoQM82HGjLY0bbWl120vLmGvVYgtk
X-TOI-MSGID: 9a71f653-af86-46d5-8997-0572de5e9b7b
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
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first two patches "audio: fix audio_generic_write" and
"audio: fix audio_generic_read" are only compile tested. The
code is only reachable from the DirectSound backend with the
mixing-engine off. I don't know if it is reachable at all.
I can't test because I don't have a Windows computer.

Volker R=C3=BCmelin (9):
  audio: fix audio_generic_write
  audio: fix audio_generic_read
  paaudio: remove unused variables
  audio: prevent SIGSEGV in AUD_get_buffer_size_out
  audio: fix bug 1858488
  ossaudio: prevent SIGSEGV in oss_enable_out
  ossaudio: prevent SIGPFE in oss_write
  ossaudio: disable poll mode can't be reached
  audio: audio_generic_get_buffer_in should honor *size

 audio/alsaaudio.c |  1 +
 audio/audio.c     | 77 ++++++++++++++++++++++++++-----------------------=
------
 audio/audio_int.h |  4 +--
 audio/coreaudio.c |  7 +++--
 audio/noaudio.c   |  1 +
 audio/ossaudio.c  | 28 ++++++++++++--------
 audio/paaudio.c   |  6 ++---
 audio/sdlaudio.c  |  7 +++--
 audio/wavaudio.c  |  1 +
 9 files changed, 71 insertions(+), 61 deletions(-)

--=20
2.16.4


