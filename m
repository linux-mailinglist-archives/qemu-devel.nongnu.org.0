Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5E17D5DA
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Mar 2020 20:30:11 +0100 (CET)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jB1co-0000a0-8e
	for lists+qemu-devel@lfdr.de; Sun, 08 Mar 2020 15:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1jB1bs-00006c-M5
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 15:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1jB1br-0002CR-Me
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 15:29:12 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:55678)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1jB1bp-0002AA-2U
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 15:29:11 -0400
Received: from fwd34.aul.t-online.de (fwd34.aul.t-online.de [172.20.26.145])
 by mailout08.t-online.de (Postfix) with SMTP id 00D524153470;
 Sun,  8 Mar 2020 20:29:06 +0100 (CET)
Received: from [192.168.211.200]
 (XdjYOcZQ8h8CsdaUV4Y-sJkKvD8bH+9U24LocDL71fjiJhdv6q1jO9Z13rStaxCggH@[79.208.31.100])
 by fwd34.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jB1bl-23ytGq0; Sun, 8 Mar 2020 20:29:05 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v2 0/6] mostly changes related to audio float samples
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <2a4ade5f-d39b-3094-578f-6cced4650720@t-online.de>
Date: Sun, 8 Mar 2020 20:29:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ID: XdjYOcZQ8h8CsdaUV4Y-sJkKvD8bH+9U24LocDL71fjiJhdv6q1jO9Z13rStaxCggH
X-TOI-MSGID: 2a21eb4e-7cfa-475d-8f2c-5d19ff8de2a7
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: John Arbuckle <programmingkidx@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- "qapi/audio: add documentation for AudioFormat"
=C2=A0 Markus suggested to correct a spelling mistake.

- "audio: add audiodev format=3Df32 option documentation"
=C2=A0 New patch.

Volker R=C3=BCmelin (6):
=C2=A0 qapi/audio: add documentation for AudioFormat
=C2=A0 audio: change naming scheme of FLOAT_CONV macros
=C2=A0 audio: consistency changes
=C2=A0 audio: change mixing engine float range to [-1.f, 1.f]
=C2=A0 audio: fix saturation nonlinearity in clip_* functions
=C2=A0 audio: add audiodev format=3Df32 option documentation

=C2=A0audio/mixeng.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 26 +++++++++++++-------------
=C2=A0audio/mixeng_template.h | 22 ++++++++++------------
=C2=A0qapi/audio.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
4 ++++++++++++++
=C2=A0qemu-options.hx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++--
=C2=A04 files changed, 39 insertions(+), 27 deletions(-)

--=20
2.16.4


