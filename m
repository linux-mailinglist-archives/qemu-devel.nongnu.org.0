Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D487A6563DC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 16:39:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9pYC-0004xN-UV; Mon, 26 Dec 2022 10:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p9pYB-0004x8-Fk
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 10:38:03 -0500
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p9pY9-00057Q-9c
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 10:38:03 -0500
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout01.t-online.de (Postfix) with SMTP id BD3DE685A;
 Mon, 26 Dec 2022 16:37:29 +0100 (CET)
Received: from [192.168.211.200] ([79.208.21.92]) by fwd75.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p9pXc-0DtnH70; Mon, 26 Dec 2022 16:37:28 +0100
Message-ID: <ec319082-7572-2c6d-aba5-d555d5399a59@t-online.de>
Date: Mon, 26 Dec 2022 16:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 10/11] alsaaudio: change default playback settings
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-10-vr_qemu@t-online.de> <2230283.NDGgU1aIbp@silver>
 <a257ab88-a779-bb84-e96e-664a3434b417@t-online.de>
In-Reply-To: <a257ab88-a779-bb84-e96e-664a3434b417@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1672069048-2FFFE535-4A55A58A/0/0 CLEAN NORMAL
X-TOI-MSGID: 3774af61-0d80-4de2-a385-cd2a06bf7a65
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
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


>>> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
>>> index 5f50dfa0bf..0cc982e61f 100644
>>> --- a/audio/alsaaudio.c
>>> +++ b/audio/alsaaudio.c
>>> @@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
>>>       alsa_init_per_direction(aopts->in);
>>>       alsa_init_per_direction(aopts->out);
>>>   -    /*
>>> -     * need to define them, as otherwise alsa produces no sound
>>> -     * doesn't set has_* so alsa_open can identify it wasn't set by 
>>> the user
>>> -     */
>>> +    /* don't set has_* so alsa_open can identify it wasn't set by 
>>> the user */
>>>       if (!dev->u.alsa.out->has_period_length) {
>>> -        /* 1024 frames assuming 44100Hz */
>>> -        dev->u.alsa.out->period_length = 1024 * 1000000 / 44100;
>>> +        /* 256 frames assuming 44100Hz */
>>> +        dev->u.alsa.out->period_length = 5805;
>>>       }
>>>       if (!dev->u.alsa.out->has_buffer_length) {
>>>           /* 4096 frames assuming 44100Hz */
>>> -        dev->u.alsa.out->buffer_length = 4096ll * 1000000 / 44100;
>>> +        dev->u.alsa.out->buffer_length = 92880;
>> Not a big fan of magic numbers, as it makes code less readable.
>
> I can't see how this can be improved. The buffer length is unchanged. 
> I just evaluated the constant expression to have a time in 
> microseconds like the rest of the audio backends. And libasound tells 
> me to use 5804us for the period length which I rounded up to 5805us. I 
> would prefer a period length of 5000us.
>
> ./qemu-system-x86_64 -device ich9-intel-hda -device 
> hda-duplex,audiodev=audio0 -audiodev 
> alsa,id=audio0,out.period-length=5000,out.dev=PCH,,0
> alsa: Requested period time 5000 was rejected, using 5804

The correct command line is:
./qemu-system-x86_64 -device ich9-intel-hda -device 
hda-duplex,audiodev=audio0 -audiodev 
alsa,id=audio0,out.period-length=5000,out.dev=hw:PCH,,0
alsa: Requested period time 5000 was rejected, using 5804

>
>
>>>       }
>>>         /*
>>>
>


