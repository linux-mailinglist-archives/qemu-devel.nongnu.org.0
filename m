Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4413018C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jan 2020 10:08:55 +0100 (CET)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1infQU-0008Th-RB
	for lists+qemu-devel@lfdr.de; Sat, 04 Jan 2020 04:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1infPd-0007rZ-Vs
 for qemu-devel@nongnu.org; Sat, 04 Jan 2020 04:08:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1infPd-00078M-1h
 for qemu-devel@nongnu.org; Sat, 04 Jan 2020 04:08:01 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:33518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1infPc-00071Z-R0
 for qemu-devel@nongnu.org; Sat, 04 Jan 2020 04:08:00 -0500
Received: from fwd01.aul.t-online.de (fwd01.aul.t-online.de [172.20.27.147])
 by mailout11.t-online.de (Postfix) with SMTP id 2C9EC4251D9A;
 Sat,  4 Jan 2020 10:07:59 +0100 (CET)
Received: from [192.168.211.200]
 (X7F69cZDYhFrmCyPx5hYY-zMJS9NtoHNR8Kk-j+m0d-qzfGH5-u+KOa69WV87nBgZc@[46.86.52.107])
 by fwd01.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1infPP-0CxDrE0; Sat, 4 Jan 2020 10:07:47 +0100
To: Gerd Hoffmann <kraxel@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v2 0/5] audio fixes
Message-ID: <07d61da6-51fb-8599-ea27-dae828fbdb3c@t-online.de>
Date: Sat, 4 Jan 2020 10:07:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
X-ID: X7F69cZDYhFrmCyPx5hYY-zMJS9NtoHNR8Kk-j+m0d-qzfGH5-u+KOa69WV87nBgZc
X-TOI-MSGID: 779782ab-eb07-431f-942d-365c62903f20
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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

Here are five patches to fix PulseAudio playback/recording with
the mixing engine off.

v2:
- Patch 3/5: Corrected error log message.

Volker R=C3=BCmelin (5):
  hda-codec: fix playback rate control
  hda-codec: fix recording rate control
  paaudio: drop recording stream in qpa_fini_in
  paaudio: try to drain the recording stream
  paaudio: wait until the recording stream is ready

 audio/paaudio.c      | 70 ++++++++++++++++++++++++++++++++++++----------=
------
 hw/audio/hda-codec.c |  8 +++---
 2 files changed, 53 insertions(+), 25 deletions(-)

--=20
2.16.4


