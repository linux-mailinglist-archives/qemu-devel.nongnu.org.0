Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6925F679215
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:35:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDpD-0004zU-4v; Tue, 24 Jan 2023 02:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pKDpA-0004v8-Mf
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:34:32 -0500
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pKDp8-00061V-RC
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:34:32 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout02.t-online.de (Postfix) with SMTP id B069C1B7CF;
 Tue, 24 Jan 2023 08:34:25 +0100 (CET)
Received: from [192.168.211.200] ([79.208.25.151]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pKDoz-4VqpxR0; Tue, 24 Jan 2023 08:34:21 +0100
Message-ID: <88f1e2ba-8f72-87ae-7c1b-e9ad6911ba6c@t-online.de>
Date: Tue, 24 Jan 2023 08:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 10/11] alsaaudio: change default playback settings
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
 <20230121094735.11644-10-vr_qemu@t-online.de>
 <63031751-f30a-d562-4e6e-6a6d936b1f74@linaro.org>
Content-Language: en-US
In-Reply-To: <63031751-f30a-d562-4e6e-6a6d936b1f74@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1674545661-D5F1C046-5D91F265/0/0 CLEAN NORMAL
X-TOI-MSGID: 44ff3bfe-67db-4d21-b045-efdf3a7ba36a
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

Am 23.01.23 um 08:43 schrieb Philippe Mathieu-Daudé:
> On 21/1/23 10:47, Volker Rümelin wrote:
>> The currently used default playback settings in the ALSA audio
>> backend are a bit unfortunate. With a few emulated audio devices,
>> audio playback does not work properly. Here is a short part of
>> the debug log while audio is playing (elapsed time in seconds).
>>
>> audio: Elapsed since last alsa run (running): 0.046244
>> audio: Elapsed since last alsa run (running): 0.023137
>> audio: Elapsed since last alsa run (running): 0.023170
>> audio: Elapsed since last alsa run (running): 0.023650
>> audio: Elapsed since last alsa run (running): 0.060802
>> audio: Elapsed since last alsa run (running): 0.031931
>>
>> For some audio devices the time of more than 23ms between updates
>> is too long.
>>
>> Set the period time to 5.8ms so that the maximum time between
>> two updates typically does not exceed 11ms. This roughly matches
>> the 10ms period time when doing playback with the audio timer.
>> After this patch the debug log looks like this.
>>
>> audio: Elapsed since last alsa run (running): 0.011919
>> audio: Elapsed since last alsa run (running): 0.005788
>> audio: Elapsed since last alsa run (running): 0.005995
>> audio: Elapsed since last alsa run (running): 0.011069
>> audio: Elapsed since last alsa run (running): 0.005901
>> audio: Elapsed since last alsa run (running): 0.006084
>>
>> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>> ---
>>   audio/alsaaudio.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
>> index 5f50dfa0bf..0cc982e61f 100644
>> --- a/audio/alsaaudio.c
>> +++ b/audio/alsaaudio.c
>> @@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
>>       alsa_init_per_direction(aopts->in);
>>       alsa_init_per_direction(aopts->out);
>>   -    /*
>> -     * need to define them, as otherwise alsa produces no sound
>> -     * doesn't set has_* so alsa_open can identify it wasn't set by 
>> the user
>> -     */
>> +    /* don't set has_* so alsa_open can identify it wasn't set by 
>> the user */
>>       if (!dev->u.alsa.out->has_period_length) {
>> -        /* 1024 frames assuming 44100Hz */
>> -        dev->u.alsa.out->period_length = 1024 * 1000000 / 44100;
>> +        /* 256 frames assuming 44100Hz */
>> +        dev->u.alsa.out->period_length = 5805;
>
> Please use DIV_ROUND_UP():
>
>     DIV_ROUND_UP(1000000ul << 8, 44100);
>
> Or
>
>     DIV_ROUND_UP(512 * 1000000ul, 44100);

Hi,

the corresponding -audiodev alsa command line parameters 
out.buffer-length, in.buffer-length, out.period-length and 
in.period-lenght are specified in microseconds. I prefer that the 
default values use the same unit. I believe that specifying buffer 
lengths in microseconds makes more sense than specifying buffer lengths 
in audio frames.

With best regards,
Volker

>
>
>>       }
>>       if (!dev->u.alsa.out->has_buffer_length) {
>>           /* 4096 frames assuming 44100Hz */
>> -        dev->u.alsa.out->buffer_length = 4096ll * 1000000 / 44100;
>> +        dev->u.alsa.out->buffer_length = 92880;
>
> Ditto:
>
>     DIV_ROUND_UP(1000000ul << 12, 44100);
>
>>       }
>>         /*
>


