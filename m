Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9266D69B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 08:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHfzt-0007W8-O2; Tue, 17 Jan 2023 02:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pHfzd-0007VT-89
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:02:49 -0500
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pHfzb-0007jA-6N
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:02:49 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout02.t-online.de (Postfix) with SMTP id E080319BAA;
 Tue, 17 Jan 2023 08:02:42 +0100 (CET)
Received: from [192.168.211.200] ([79.208.25.151]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pHfzT-4c0VqD0; Tue, 17 Jan 2023 08:02:39 +0100
Message-ID: <fdf84e7b-6356-292b-d014-3ec65ce25603@t-online.de>
Date: Tue, 17 Jan 2023 08:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 08/11] audio/audio_template: use g_new0() to replace
 audio_calloc()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-8-vr_qemu@t-online.de> <Y8US3so1QkIOwucD@redhat.com>
Content-Language: en-US
In-Reply-To: <Y8US3so1QkIOwucD@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1673938959-427EAC4D-65772628/0/0 CLEAN NORMAL
X-TOI-MSGID: db51e736-6818-40ca-8d4d-9f1d29723051
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

Am 16.01.23 um 10:03 schrieb Daniel P. Berrangé:
> On Sun, Dec 18, 2022 at 06:15:36PM +0100, Volker Rümelin wrote:
>> Replace audio_calloc() with the equivalent g_new0().
>>
>> With a n_structs argument >= 1, g_new0() never returns NULL.
>> Also remove the unnecessary NULL checks.
>>
>> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>> ---
>>   audio/audio_template.h | 23 ++++++-----------------
>>   1 file changed, 6 insertions(+), 17 deletions(-)
>>
>> diff --git a/audio/audio_template.h b/audio/audio_template.h
>> index 5f51ef26b2..9c600448fb 100644
>> --- a/audio/audio_template.h
>> +++ b/audio/audio_template.h
>> @@ -129,12 +129,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
>>           return -1;
>>       }
>>   
>> -    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
>> -    if (!sw->buf) {
>> -        dolog ("Could not allocate buffer for `%s' (%d samples)\n",
>> -               SW_NAME (sw), samples);
>> -        return -1;
>> -    }
>> +    sw->buf = g_new0(st_sample, samples);
> "samples" is a signed integer, and audio_calloc would check for
> it being negative and raise an error. It would also check for
> samples being zero. I think we still need both these checks,
> as a negative value of samples when cast to size_t would be a
> huge size.

Hi Daniel,

patch 01/11 ("audio: log unimplemented audio device sample rates") takes 
care of samples == 0. But you are right, I didn't consider samples < 0. 
I will send a version 2 patch within the next few days.

With best regards,
Volker

> With regards,
> Daniel


