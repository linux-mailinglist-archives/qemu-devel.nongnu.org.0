Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B048479B91
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 16:18:15 +0100 (CET)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybTS-0004bk-6J
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 10:18:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mybRr-0002fv-UG
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:16:35 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:44450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mybRp-0007n0-Us
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:16:35 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout09.t-online.de (Postfix) with SMTP id 04178AB72;
 Sat, 18 Dec 2021 16:16:30 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mybRl-308jar0; Sat, 18 Dec 2021 16:16:29 +0100
Message-ID: <d4cd0aa3-9a16-d1a8-5fdf-53d7682e91f1@t-online.de>
Date: Sat, 18 Dec 2021 16:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] audio: Add sndio backend
Content-Language: en-US
To: Alexandre Ratchov <alex@caoua.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <YbxamMLKHp3IbtlW@moule.localdomain>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <YbxamMLKHp3IbtlW@moule.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1639840589-00001674-8A917193/0/0 CLEAN NORMAL
X-TOI-MSGID: a12b017f-6d76-4ca6-bc31-4fe4ab35e130
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alexandre,

> sndio is the native API used by OpenBSD, although it has been ported to
> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
> Signed-off-by: Alexandre Ratchov <alex@caoua.org>
> ---
>
> Thank you for the reviews and all the comments. Here's a second diff
> with all the suggested changes:
>
> - Replace ISC license by SPDX-License-Identifier header
> - Fix units (milli- vs micro-) in comment about SNDIO_LATENCY_US
> - Drop outdated comment about the "size" argument of sndio_get_buffer_out()
> - Fix AUDIO_FORMAT_U32 handling (missing "break" statement)
> - Set {read,write] methods to audio_generic_{read,write} (fixes craches)
> - Check if backend is enabled in sndio_poll_event()
> - Use https://sndio.org in description
> - Mark options as available after 7.0 release (instead of 6.2)
> - Describe sndio-specific options (dev, latency) in qemu-options.hx
> - Add myself as reviewer to MAINTAINERS
> - Style fixes: no space after function names, use 4-space indent
> - Don't use "return foo()" if foo() returns void
> - Include backend to audio_drivers_priority[]
>
> Tested on OpenBSD, works as expected!
>
>   MAINTAINERS            |   5 +
>   audio/audio.c          |   1 +
>   audio/audio_template.h |   2 +
>   audio/meson.build      |   1 +
>   audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
>   meson.build            |   9 +-
>   meson_options.txt      |   4 +-
>   qapi/audio.json        |  25 +-
>   qemu-options.hx        |  16 ++
>   tests/vm/freebsd       |   3 +
>   10 files changed, 618 insertions(+), 3 deletions(-)
>   create mode 100644 audio/sndioaudio.c

Tested on Linux.

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>
Tested-by: Volker Rümelin <vr_qemu@t-online.de>


