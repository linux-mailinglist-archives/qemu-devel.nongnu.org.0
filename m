Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D36A1C1F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:28:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVX9l-00051z-Hp; Fri, 24 Feb 2023 07:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVX9j-00051Z-KU; Fri, 24 Feb 2023 07:26:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVX9h-0002RT-MX; Fri, 24 Feb 2023 07:26:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 76677746377;
 Fri, 24 Feb 2023 13:26:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 36A08746346; Fri, 24 Feb 2023 13:26:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 34B4B745720;
 Fri, 24 Feb 2023 13:26:25 +0100 (CET)
Date: Fri, 24 Feb 2023 13:26:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Subject: Re: [PATCH 5/5] hw/audio/via-ac97: Basic implementation of audio
 playback
In-Reply-To: <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
Message-ID: <1fb9a354-edff-cc60-2f53-bafd955daa6b@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <f84b42b8e811c6a0ddb23139fdfd654c8cc4f09c.1677004415.git.balaton@eik.bme.hu>
 <89f85024-6057-f0a8-3d4a-20eeaeec8878@t-online.de>
 <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1832779222-1677241585=:16812"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1832779222-1677241585=:16812
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 24 Feb 2023, Bernhard Beschow wrote:
> Am 23. Februar 2023 19:40:03 UTC schrieb "Volker Rümelin" <vr_qemu@t-online.de>:
>> Am 21.02.23 um 19:44 schrieb BALATON Zoltan:
>>> This adds basic implementation of the AC'97 sound part used in VIA
>>> south bridge chips. Not all features of the device is emulated, only
>>> one playback channel is supported but this is enough to get sound
>>> output from some guests running on machines using this device such as
>>> pegasos2.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/audio/trace-events     |   6 +
>>>   hw/audio/via-ac97.c       | 436 +++++++++++++++++++++++++++++++++++++-
>>>   hw/isa/vt82c686.c         |   3 +-
>>>   include/hw/isa/vt82c686.h |  26 +++
>>>   4 files changed, 466 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/audio/trace-events b/hw/audio/trace-events
>>> index e0e71cd9b1..6eccdaa4b5 100644
>>> --- a/hw/audio/trace-events
>>> +++ b/hw/audio/trace-events
>>> @@ -11,3 +11,9 @@ hda_audio_running(const char *stream, int nr, bool running) "st %s, nr %d, run %
>>>   hda_audio_format(const char *stream, int chan, const char *fmt, int freq) "st %s, %d x %s @ %d Hz"
>>>   hda_audio_adjust(const char *stream, int pos) "st %s, pos %d"
>>>   hda_audio_overrun(const char *stream) "st %s"
>>> +
>>> +#via-ac97.c
>>> +via_ac97_codec_write(uint8_t addr, uint16_t val) "0x%x <- 0x%x"
>>> +via_ac97_sgd_fetch(uint32_t addr, char stop, char eol, char flag, uint32_t len) "addr=0x%x %c%c%c len=%d"
>>> +via_ac97_sgd_read(uint64_t addr, unsigned size, uint64_t val) "0x%"PRIx64" %d -> 0x%"PRIx64
>>> +via_ac97_sgd_write(uint64_t addr, unsigned size, uint64_t val) "0x%"PRIx64" %d <- 0x%"PRIx64
>>> diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
>>> index d1a856f63d..cdac5bc14b 100644
>>> --- a/hw/audio/via-ac97.c
>>> +++ b/hw/audio/via-ac97.c
>>> @@ -1,39 +1,467 @@
>>>   /*
>>>    * VIA south bridges sound support
>>>    *
>>> + * Copyright (c) 2022-2023 BALATON Zoltan
>>> + *
>>>    * This work is licensed under the GNU GPL license version 2 or later.
>>>    */
>>>     /*
>>> - * TODO: This is entirely boiler plate just registering empty PCI devices
>>> - * with the right ID guests expect, functionality should be added here.
>>> + * TODO: This is only a basic implementation of one audio playback channel
>>> + *       more functionality should be added here.
>>>    */
>>>     #include "qemu/osdep.h"
>>> +#include "qemu/log.h"
>>>   #include "hw/isa/vt82c686.h"
>>> -#include "hw/pci/pci_device.h"
>>> +#include "ac97.h"
>>> +#include "trace.h"
>>> +
>>> +#define CLEN_IS_EOL(x)  ((x)->clen & BIT(31))
>>> +#define CLEN_IS_FLAG(x) ((x)->clen & BIT(30))
>>> +#define CLEN_IS_STOP(x) ((x)->clen & BIT(29))
>>> +#define CLEN_LEN(x)     ((x)->clen & 0xfff)
>>
>> Hi,
>>
>> the CLEN_LEN mask is 0xffffff instead of 0xfff. The SGD Table Base Count has 24 bits.
>
> This fixes sound for a x86 Linux guest on my pc-via branch.

Thanks, will be in next version. Not sure where have I lost that, maybe 
accidenatlly deleted part of the constant on a rebase and did not notice.
Bernhard does that mean you give a Tested-by for this patch?

Regards,
BALATON Zoltan
--3866299591-1832779222-1677241585=:16812--

