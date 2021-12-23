Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A147E55A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:14:09 +0100 (CET)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0PnE-0001SP-CC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:14:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n0Pk5-0008Kj-1Q
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 10:10:53 -0500
Received: from mail.xen0n.name ([115.28.160.31]:60094
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n0Pjz-0001jD-Nt
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 10:10:52 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B99C7600B5;
 Thu, 23 Dec 2021 23:10:35 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640272235; bh=GMIKbX2kxv6pCoxsOhZ0D6s8h75YLKfSP5Lx1l3ZhbQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UYP6MH/vfNvjg86vGk0S4/VY7/sAZKdUiIvBaci1d/3WdKZ8hpRgpDGbh+nCGcFXP
 uE3OBbRb8EN6dCePhXj+iG0GXrWmwoX5JCNEj37hdzuhUKECn16QdvCWf1A3jvIkqI
 MwO0SgWuQO6NKk/dYK10gOzRahAVdcxRSZkgjI/c=
Message-ID: <7b86800a-2303-bbd8-3e61-4eca1c5aabfa@xen0n.name>
Date: Thu, 23 Dec 2021 23:10:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v2] audio: Add sndio backend
Content-Language: en-US
To: Alexandre Ratchov <alex@caoua.org>, qemu-devel@nongnu.org
References: <YbxamMLKHp3IbtlW@moule.localdomain>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <YbxamMLKHp3IbtlW@moule.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alexandre,

On 12/17/21 17:38, Alexandre Ratchov wrote:
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
Here we can see the file added is named "sndioaudio.c", so...
>   meson.build            |   9 +-
>   meson_options.txt      |   4 +-
>   qapi/audio.json        |  25 +-
>   qemu-options.hx        |  16 ++
>   tests/vm/freebsd       |   3 +
>   10 files changed, 618 insertions(+), 3 deletions(-)
>   create mode 100644 audio/sndioaudio.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7543eb4d59..76bdad064f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2307,6 +2307,7 @@ X: audio/jackaudio.c
>   X: audio/ossaudio.c
>   X: audio/paaudio.c
>   X: audio/sdlaudio.c
> +X: audio/sndio.c
it should say "sndioaudio.c" here...
>   X: audio/spiceaudio.c
>   F: qapi/audio.json
>   
> @@ -2349,6 +2350,10 @@ R: Thomas Huth <huth@tuxfamily.org>
>   S: Odd Fixes
>   F: audio/sdlaudio.c
>   
> +Sndio Audio backend
> +R: Alexandre Ratchov <alex@caoua.org>
> +F: audio/sndio.c
and here.
> +
>   Block layer core
>   M: Kevin Wolf <kwolf@redhat.com>
>   M: Hanna Reitz <hreitz@redhat.com>

