Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C764F658AC6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAoty-0005nt-T2; Thu, 29 Dec 2022 04:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pAotw-0005nd-Ku
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:08:36 -0500
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pAotu-00041j-Bu
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:08:36 -0500
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout06.t-online.de (Postfix) with SMTP id D9100E937;
 Thu, 29 Dec 2022 10:08:29 +0100 (CET)
Received: from [192.168.211.200] ([79.208.21.92]) by fwd85.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pAoto-0eTUKP0; Thu, 29 Dec 2022 10:08:28 +0100
Message-ID: <4b22cbe5-a1bc-6cbe-3d91-6c7518fd25da@t-online.de>
Date: Thu, 29 Dec 2022 10:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 10/11] alsaaudio: change default playback settings
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <2230283.NDGgU1aIbp@silver>
 <a257ab88-a779-bb84-e96e-664a3434b417@t-online.de>
 <2081398.TCYG2cGmvX@silver>
Content-Language: en-US
In-Reply-To: <2081398.TCYG2cGmvX@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1672304908-2E8B5EA1-E0286660/0/0 CLEAN NORMAL
X-TOI-MSGID: c0939a55-b61a-441b-8eec-c12a6ab56e21
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 28.12.22 um 14:52 schrieb Christian Schoenebeck:
> On Monday, December 26, 2022 4:08:37 PM CET Volker Rümelin wrote:
>> Am 21.12.22 um 12:03 schrieb Christian Schoenebeck:
>>> On Sunday, December 18, 2022 6:15:38 PM CET Volker Rümelin wrote:
>>>> The currently used default playback settings in the ALSA audio
>>>> backend are a bit unfortunate. With a few emulated audio devices,
>>>> audio playback does not work properly. Here is a short part of
>>>> the debug log while audio is playing (elapsed time in seconds).
>>> Which emulated devices are these?
>> The hda device and sb16. When I wrote this patch two months ago ac97
>> also had occasional dropouts, but at the moment ac97 works without issues.
>>
>>>> audio: Elapsed since last alsa run (running): 0.046244
>>>> audio: Elapsed since last alsa run (running): 0.023137
>>>> audio: Elapsed since last alsa run (running): 0.023170
>>>> audio: Elapsed since last alsa run (running): 0.023650
>>>> audio: Elapsed since last alsa run (running): 0.060802
>>>> audio: Elapsed since last alsa run (running): 0.031931
>>>>
>>>> For some audio devices the time of more than 23ms between updates
>>>> is too long.
>>>>
>>>> Set the period time to 5.8ms so that the maximum time between
>>>> two updates typically does not exceed 11ms. This roughly matches
>>>> the 10ms period time when doing playback with the audio timer.
>>>> After this patch the debug log looks like this.
>>> And what about dynamically adapting that value instead of reducing period time
>>> for everyone by default?
>> It seems this would be only needed for the ALSA backend. All other
>> backends with the exception of OSS are fine with a 10ms period, and the
>> ALSA audio backend also uses 10ms with -audiodev
>> alsa,out.try-poll=off,in.try-poll=off.
> OK, but all it would need was adjusting dev->timer_period appropriately either
> in audio_validate_opts() [audio/audio.c, line 2126] to handle it generalized
> or at the end of alsa_audio_init() [audio/alsaaudio.c, line 944] if
> specifically for ALSA only, no?

Yes, that could be done. But that's not the point of my statement. My 
point was that nearly every audio backend uses an update period of 10ms 
and the update period of 10ms works well in the majority of cases. 
Changing the update period depending on the audio frontend would be 
possible, but at the moment I see no reason to work on this.

>>> 23ms is usually a good trade off between low latency, CPU load and potential
>>> for audio dropouts.
>> Quite often it's longer than 23ms. For the rest of the audio backends a
>> timer period of 10ms was selected as a good trade off between CPU load
>> and audio dropouts. But you are right, this patch increases the CPU load.
>>
>> On my system the CPU load is increased by 0.9%. This was measured with a
>> Linux guest using rhythmbox for audio playback. The guest was configured
>> to use pulseaudio as sound server. The measurement was done with top -b
>> -d 10 -n 14 over a period of two minutes. The first and last measurement
>> was dropped. The average QEMU CPU load was 10.7% with and 9.8% without
>> this patch.
>>
>> I would prefer a system with a 0.9% increased CPU load where audio just
>> works over a system where you have to fine tune audio parameters.
>>
>>>> audio: Elapsed since last alsa run (running): 0.011919
>>>> audio: Elapsed since last alsa run (running): 0.005788
>>>> audio: Elapsed since last alsa run (running): 0.005995
>>>> audio: Elapsed since last alsa run (running): 0.011069
>>>> audio: Elapsed since last alsa run (running): 0.005901
>>>> audio: Elapsed since last alsa run (running): 0.006084
>>>>
>>>> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>>>> ---
>>>>    audio/alsaaudio.c | 11 ++++-------
>>>>    1 file changed, 4 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
>>>> index 5f50dfa0bf..0cc982e61f 100644
>>>> --- a/audio/alsaaudio.c
>>>> +++ b/audio/alsaaudio.c
>>>> @@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
>>>>        alsa_init_per_direction(aopts->in);
>>>>        alsa_init_per_direction(aopts->out);
>>>>    
>>>> -    /*
>>>> -     * need to define them, as otherwise alsa produces no sound
>>>> -     * doesn't set has_* so alsa_open can identify it wasn't set by the user
>>>> -     */
>>>> +    /* don't set has_* so alsa_open can identify it wasn't set by the user */
>>>>        if (!dev->u.alsa.out->has_period_length) {
>>>> -        /* 1024 frames assuming 44100Hz */
>>>> -        dev->u.alsa.out->period_length = 1024 * 1000000 / 44100;
>>>> +        /* 256 frames assuming 44100Hz */
>>>> +        dev->u.alsa.out->period_length = 5805;
>>>>        }
>>>>        if (!dev->u.alsa.out->has_buffer_length) {
>>>>            /* 4096 frames assuming 44100Hz */
>>>> -        dev->u.alsa.out->buffer_length = 4096ll * 1000000 / 44100;
>>>> +        dev->u.alsa.out->buffer_length = 92880;
>>> Not a big fan of magic numbers, as it makes code less readable.
>> I can't see how this can be improved. The buffer length is unchanged. I
>> just evaluated the constant expression to have a time in microseconds
>> like the rest of the audio backends. And libasound tells me to use
>> 5804us for the period length which I rounded up to 5805us. I would
>> prefer a period length of 5000us.
> Probably nitpicking as the preceding comment indicates the numbers, but maybe
> simply like this?
>
> dev->u.alsa.out->period_length = ceil(256.0 * 1000000.0 / 44100.0);
> ...
> dev->u.alsa.out->buffer_length = ceil(4096.0 * 1000000.0 / 44100.0);
>
> I mean these are number literals passed to a built-in function, so the
> compiler should automatically evaluate this constant expression at compile
> time, so it should end up in the binary with the same constant value as you
> did directly in code, at least if optimization was turned on.

It's not about optimization. The -audiodev alsa command line parameters 
out.buffer-length, in.buffer-length, out.period-length and 
in.period-lenght are specified in microseconds. I prefer the default 
values to use the same unit. I could add the unit in a comment after the 
values.

I shouldn't have written anything about rounding. The value 5805E-6 * 
44100 = 256.0005 is closer to 256 than 5804E-6 * 44100 = 255.9564. 
That's the only reason I selected 5805 /* us */.

>> ./qemu-system-x86_64 -device ich9-intel-hda -device
>> hda-duplex,audiodev=audio0 -audiodev
>> alsa,id=audio0,out.period-length=5000,out.dev=PCH,,0
>> alsa: Requested period time 5000 was rejected, using 5804
>>
>>>>        }
>>>>    
>>>>        /*
>>>>


