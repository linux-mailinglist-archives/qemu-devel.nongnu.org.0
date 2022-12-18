Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5121065043B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:40:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xd3-0005Re-KM; Sun, 18 Dec 2022 12:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p6xd0-0005RD-Ht
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:39:10 -0500
Received: from mailout04.t-online.de ([194.25.134.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p6xcy-0006ak-Ea
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:39:10 -0500
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout04.t-online.de (Postfix) with SMTP id 5933BED50;
 Sun, 18 Dec 2022 18:39:03 +0100 (CET)
Received: from [192.168.211.200] ([79.208.21.92]) by fwd81.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xcq-0bWtqz0; Sun, 18 Dec 2022 18:39:00 +0100
Message-ID: <e4276dbf-ba7c-0ee4-88f8-4b0cffee46f7@t-online.de>
Date: Sun, 18 Dec 2022 18:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-7-vr_qemu@t-online.de>
 <9b60cdc7-3bd3-6651-2e7e-29673731aabd@linaro.org>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <9b60cdc7-3bd3-6651-2e7e-29673731aabd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671385140-EF7E87E2-1614C148/0/0 CLEAN NORMAL
X-TOI-MSGID: 031d9f82-8973-4420-8aaf-e71556d5b5df
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Am 18.12.22 um 18:26 schrieb Philippe Mathieu-Daudé:
> On 18/12/22 18:15, Volker Rümelin wrote:
>> Use g_malloc0() as a direct replacement for audio_calloc().
>>
>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>> ---
>>   audio/audio_template.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/audio/audio_template.h b/audio/audio_template.h
>> index d343a1dcb3..5f51ef26b2 100644
>> --- a/audio/audio_template.h
>> +++ b/audio/audio_template.h
>> @@ -273,7 +273,7 @@ static HW *glue(audio_pcm_hw_add_new_, 
>> TYPE)(AudioState *s,
>>           return NULL;
>>       }
>>   -    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
>> +    hw = g_malloc0(glue(drv->voice_size_, TYPE));
>>       if (!hw) {
>
> g_malloc0() can't fail. Either you want g_try_malloc0() or
> remove the error path.
>

g_malloc0() returns NULL if drv->voice_size_(out|in) is 0. I think the 
code is correct.

>>           dolog ("Can not allocate voice `%s' size %d\n",
>>                  drv->name, glue (drv->voice_size_, TYPE));
>


