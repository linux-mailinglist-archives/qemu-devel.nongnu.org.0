Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE5126E52
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 21:01:49 +0100 (CET)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii1zX-0006KG-RK
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 15:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1ii1yT-0005la-Uo
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 15:00:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1ii1yS-0002Wt-NE
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 15:00:41 -0500
Received: from mailout10.t-online.de ([194.25.134.21]:53114)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1ii1yS-0002OG-F8
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 15:00:40 -0500
Received: from fwd13.aul.t-online.de (fwd13.aul.t-online.de [172.20.27.62])
 by mailout10.t-online.de (Postfix) with SMTP id B5EE2416C754;
 Thu, 19 Dec 2019 21:00:36 +0100 (CET)
Received: from [192.168.211.200]
 (TJKyPqZerhccG50u6-CgfpTYjwjvgRi6rPOCcT3nSR-ukEfYytgXpHQoUfWE4vWgVl@[46.86.55.2])
 by fwd13.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1ii1yN-0xgA640; Thu, 19 Dec 2019 21:00:35 +0100
To: Gerd Hoffmann <kraxel@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/5] audio fixes
Message-ID: <fe427705-ef37-d48e-526c-7dc8025425b6@t-online.de>
Date: Thu, 19 Dec 2019 21:00:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Language: de-DE
X-ID: TJKyPqZerhccG50u6-CgfpTYjwjvgRi6rPOCcT3nSR-ukEfYytgXpHQoUfWE4vWgVl
X-TOI-MSGID: fb55c1f9-f6e4-417b-b362-e009ce6d5cfd
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here are five patches to fix PulseAudio playback/recording with
the mixing engine off.

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


