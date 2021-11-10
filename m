Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5244BBA5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 07:24:51 +0100 (CET)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkh2Q-0003b9-Ew
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 01:24:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mkh0F-00027G-V9
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:22:36 -0500
Received: from mail.xen0n.name ([115.28.160.31]:50586
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mkh0C-00055X-SI
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:22:35 -0500
Received: from [100.100.56.238] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6A933600B5;
 Wed, 10 Nov 2021 14:22:23 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1636525343; bh=DwVE6OALGexr/F0SnrxyoFq0oGX4kiQU8pZAcvvC5xE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XXjYas4JTkJ0XIVbM+FF425scsnu/Nz62729UZRI8lqrdKVCDi/uE/fBsgxqs6pxO
 iul59TN39yS/901ODdkTmE89Ed2hsa1wu8v+7w5++tgBmsgjsNvzwL12k63nxXS6TV
 y3o3352hHIzGo9x4nRg/uN4F+iFYbG54f4pq1w+Q=
Message-ID: <f1a61afe-9be4-557e-1f35-ed8d9ea53cad@xen0n.name>
Date: Wed, 10 Nov 2021 14:22:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH] audio: Add sndio backend
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/7 13:19, Brad Smith wrote:
> audio: Add sndio backend
>
> Add a sndio backend.
>
> sndio is the native API used by OpenBSD, although it has been ported to
> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
>
> The C code is from Alexandre Ratchov <alex@caoua.org> and the rest of
> the bits are from me.

As pointed out by others, this is lacking Signed-off-by lines; IIUC you
may contact Alexandre to get theirs, and then add yours.

I'm not familiar with this part of qemu, so what follows is only a
somewhat brief review. That said...

> ---
>  audio/audio.c          |   1 +
>  audio/audio_template.h |   2 +
>  audio/meson.build      |   1 +
>  audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
>  meson.build            |   7 +
>  meson_options.txt      |   4 +-
>  qapi/audio.json        |  25 +-
>  qemu-options.hx        |   8 +
>  tests/vm/freebsd       |   3 +
>  9 files changed, 604 insertions(+), 2 deletions(-)
>  create mode 100644 audio/sndioaudio.c
>
> diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
> new file mode 100644
> index 0000000000..204af07781
> --- /dev/null
> +++ b/audio/sndioaudio.c
> @@ -0,0 +1,555 @@
> +/*
> + * Copyright (c) 2019 Alexandre Ratchov <alex@caoua.org>
> + *
> + * Permission to use, copy, modify, and distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> + */
Perhaps using an SPDX license identifier would be better?
> +
> +/*
> + * TODO :
> + *
> + * Use a single device and open it in full-duplex rather than
> + * opening it twice (once for playback once for recording).
> + *
> + * This is the only way to ensure that playback doesn't drift with respect
> + * to recording, which is what guest systems expect.
> + */
> +
> +#include <poll.h>
> +#include <sndio.h>
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/main-loop.h"
> +#include "audio.h"
> +#include "trace.h"
> +
> +#define AUDIO_CAP "sndio"
> +#include "audio_int.h"
> +
> +/* default latency in ms if no option is set */
> +#define SNDIO_LATENCY_US   50000

Maybe you mean "microseconds" in the comment? 50 *seconds* seems a bit
long ;)


