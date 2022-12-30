Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5565967F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 10:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBBH9-0005AF-L2; Fri, 30 Dec 2022 04:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pBBGz-00058c-Nn
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:01:59 -0500
Received: from mailout04.t-online.de ([194.25.134.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pBBGx-00017s-Ko
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:01:53 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout04.t-online.de (Postfix) with SMTP id 4D99014B17;
 Fri, 30 Dec 2022 10:01:48 +0100 (CET)
Received: from [192.168.211.200] ([79.208.21.92]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pBBGt-1HyCqf0; Fri, 30 Dec 2022 10:01:48 +0100
Message-ID: <fa8fbff9-5c8d-d8c8-ae87-01d235ad5f98@t-online.de>
Date: Fri, 30 Dec 2022 10:01:47 +0100
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
X-TOI-EXPURGATEID: 150726::1672390908-0A697417-37D731C5/0/0 CLEAN NORMAL
X-TOI-MSGID: f3db2c1c-c6da-4e26-958f-33bd7a18fba0
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

I think this should be the other way around. If period-length wasn't 
specified on the command line, it should be calculated from 
timer-period. With timer based playback or recording, the guest should 
be able to write or read new audio frames every timer-period 
microseconds. To have a high probability that the guest can write or 
read new frames every timer-period, the asynchronous updates of the 
audio backend have to be faster than timer-period e.g. 75-80% of 
timer-period. But that's a different patch.

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


