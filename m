Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095644F562
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 22:10:58 +0100 (CET)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mm0Ia-0003DW-VQ
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 16:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mm0HN-0002SU-UM
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 16:09:41 -0500
Received: from [2607:f938:3000:8::2] (port=8819 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mm0HM-00077G-32
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 16:09:41 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Hs7PY2Wh1z8PbN;
 Sat, 13 Nov 2021 16:09:37 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=WG4x2JrqZ
 EnbqJOLBdOPp0wor24=; b=qsMqcB0ZG2YoZbrBIIuMySaWMKkmZZfytU4C431Iq
 U4dMlatxsRTHDnN+cuHfJb0FBIL4PMMvxAV0o7HHlYOJx76r1p3GCHsjy1F56W+R
 NKlxERuRXK6uwAc5swYfsPDgU/h59ljLWw3Y8vMgd51J7YUpOTZPJUoCNGiUUAnM
 GY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=aJe
 +3iPKlYZCOJyqejcn5FMf0gTqj/4ZopKOV0HSTEBBrdyafgpbvq0tW4xD/tm9JXu
 Gj6a05woUwb3YgLrX75Mo/OgzHSigLmgNr7n7+TnUMrLSEa6ZAlUDmcWgJ62/f/j
 J+6mSiJjfZ34W2JmgMu395BjL56OfEY80jrOoKHo=
Received: from [192.168.6.70]
 (bras-base-toroon2719w-grc-40-174-88-240-196.dsl.bell.ca [174.88.240.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Hs7PY1g1xz8PbK;
 Sat, 13 Nov 2021 16:09:37 -0500 (EST)
Message-ID: <11ebfc9f-b689-27c6-b4fe-c2872d2d4146@comstyle.com>
Date: Sat, 13 Nov 2021 16:09:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH] audio: Add sndio backend
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
 <f1a61afe-9be4-557e-1f35-ed8d9ea53cad@xen0n.name>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <f1a61afe-9be4-557e-1f35-ed8d9ea53cad@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f938:3000:8::2
 (failed)
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.852,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/2021 1:22 AM, WANG Xuerui wrote:

> On 2021/11/7 13:19, Brad Smith wrote:
>> audio: Add sndio backend
>>
>> Add a sndio backend.
>>
>> sndio is the native API used by OpenBSD, although it has been ported to
>> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
>>
>> The C code is from Alexandre Ratchov <alex@caoua.org> and the rest of
>> the bits are from me.
> As pointed out by others, this is lacking Signed-off-by lines; IIUC you
> may contact Alexandre to get theirs, and then add yours.
>
> I'm not familiar with this part of qemu, so what follows is only a
> somewhat brief review. That said...
>
>> ---
>>   audio/audio.c          |   1 +
>>   audio/audio_template.h |   2 +
>>   audio/meson.build      |   1 +
>>   audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
>>   meson.build            |   7 +
>>   meson_options.txt      |   4 +-
>>   qapi/audio.json        |  25 +-
>>   qemu-options.hx        |   8 +
>>   tests/vm/freebsd       |   3 +
>>   9 files changed, 604 insertions(+), 2 deletions(-)
>>   create mode 100644 audio/sndioaudio.c
>>
>> diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
>> new file mode 100644
>> index 0000000000..204af07781
>> --- /dev/null
>> +++ b/audio/sndioaudio.c
>> @@ -0,0 +1,555 @@
>> +/*
>> + * Copyright (c) 2019 Alexandre Ratchov <alex@caoua.org>
>> + *
>> + * Permission to use, copy, modify, and distribute this software for any
>> + * purpose with or without fee is hereby granted, provided that the above
>> + * copyright notice and this permission notice appear in all copies.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
>> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
>> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
>> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
>> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
>> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
>> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>> + */
> Perhaps using an SPDX license identifier would be better?
Have done so.
>> +
>> +/*
>> + * TODO :
>> + *
>> + * Use a single device and open it in full-duplex rather than
>> + * opening it twice (once for playback once for recording).
>> + *
>> + * This is the only way to ensure that playback doesn't drift with respect
>> + * to recording, which is what guest systems expect.
>> + */
>> +
>> +#include <poll.h>
>> +#include <sndio.h>
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include "qemu/main-loop.h"
>> +#include "audio.h"
>> +#include "trace.h"
>> +
>> +#define AUDIO_CAP "sndio"
>> +#include "audio_int.h"
>> +
>> +/* default latency in ms if no option is set */
>> +#define SNDIO_LATENCY_US   50000
> Maybe you mean "microseconds" in the comment? 50 *seconds* seems a bit
> long ;)
I have corrected the comment.

