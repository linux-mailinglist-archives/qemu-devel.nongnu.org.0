Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B90309E16
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 18:33:16 +0100 (CET)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Gb5-0005s0-Hi
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 12:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1l6GYi-0005K8-Un
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 12:30:49 -0500
Received: from mailout10.t-online.de ([194.25.134.21]:52442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1l6GYg-0002fo-71
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 12:30:48 -0500
Received: from fwd33.aul.t-online.de (fwd33.aul.t-online.de [172.20.27.144])
 by mailout10.t-online.de (Postfix) with SMTP id 8330441D249F;
 Sun, 31 Jan 2021 18:30:41 +0100 (CET)
Received: from [192.168.211.200]
 (SODyl2ZBwhTMZo0Y7x873nQpvLJqfLNXHGuXbfnj4JA6vl5pfjuyre7qSPeTWCuwX7@[93.236.159.226])
 by fwd33.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1l6GYb-3iduKW0; Sun, 31 Jan 2021 18:30:41 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 03/23] sdlaudio: add -audiodev sdl, out.buffer-count option
To: Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-3-vr_qemu@t-online.de>
 <20210114142756.ixa3qhqtwcyebl6a@sirius.home.kraxel.org>
Message-ID: <872b13e9-36d9-1690-3b47-5943d9370164@t-online.de>
Date: Sun, 31 Jan 2021 18:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210114142756.ixa3qhqtwcyebl6a@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: SODyl2ZBwhTMZo0Y7x873nQpvLJqfLNXHGuXbfnj4JA6vl5pfjuyre7qSPeTWCuwX7
X-TOI-EXPURGATEID: 150726::1612114241-0000F1CF-7DD36653/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e49da22-0ff5-479e-9ff9-0785504bb935
Received-SPF: none client-ip=194.25.134.21; envelope-from=vr_qemu@t-online.de;
 helo=mailout10.t-online.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

>    Hi,
>
>> -    hw->samples = obt.samples;
>> +    hw->samples = (spdo->has_buffer_count ? spdo->buffer_count : 4) *
>> +        obt.samples;
>> +# @buffer-count: number of buffers (default 4)
> Any specific reason for this default?
>
> In my testing I've needed much higher values.
> 8 still got me crackling sound, 16 worked ok.

Hi Gerd,

this was an attempt to come up with SDL audio settings which work for 
all SDL audio drivers. Unfortunately, the different SDL audio drivers 
have different timings and there are no default settings that work for 
all of them. Here are two examples where buffer-count=4 works.

On my Linux system I use

export SDL_AUDIODRIVER=pulse
and start qemu with -device intel-hda -device hda-duplex,audiodev=audio0 
-machine pcspk-audiodev=audio0 -audiodev 
sdl,id=audio0,out.buffer-length=3750

Due to the mix-up of samples and frames in audio/sdlaudio.c the callback 
buffer has a size of 2 * 3.75ms = 7.5ms and SDL calls the callback 
function every 7.5ms. With out.buffer-count=4 that's a 4 * 7.5ms = 30ms 
buffer on the qemu side. This is larger than the minimum size of 
timer-period.

On Windows the timing is different. The time between SDL callback calls 
is a multiple of 10ms. I have to use

export SDL_AUDIODRIVER=directsound
and start qemu with -device intel-hda -device hda-duplex,audiodev=audio0 
-machine pcspk-audiodev=audio0 -audiodev 
sdl,id=audio0,timer-period=1000,out.buffer-length=5500

With the above settings the playback stream sometimes will see 2*10ms + 
1ms stalls. The qemu hda codec can barely handle this. On average it 
will drop playback data after 23.22ms.

With best regards,
Volker

> take care,
>    Gerd
>


