Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66310650807
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:23:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7AUD-0008Ca-MF; Mon, 19 Dec 2022 02:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p7ATq-0008Bp-Kv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:22:34 -0500
Received: from mailout04.t-online.de ([194.25.134.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p7ATn-0002Bu-IT
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:22:33 -0500
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout04.t-online.de (Postfix) with SMTP id 89EA321EF8;
 Mon, 19 Dec 2022 08:22:25 +0100 (CET)
Received: from [192.168.211.200] ([79.208.21.92]) by fwd81.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p7ATh-1C0M4H0; Mon, 19 Dec 2022 08:22:25 +0100
Message-ID: <69c72205-b6cc-9e07-a15e-ae7491d7e0c5@t-online.de>
Date: Mon, 19 Dec 2022 08:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 01/11] audio: log unimplemented audio device sample rates
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-1-vr_qemu@t-online.de> <3246935.mafvd9ugAF@silver>
Content-Language: en-US
In-Reply-To: <3246935.mafvd9ugAF@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671434545-F4FD47E2-61F0B696/0/0 CLEAN NORMAL
X-TOI-MSGID: ce88068b-9b47-4bb8-8862-15950d3407ad
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

Am 18.12.22 um 21:26 schrieb Christian Schoenebeck:
> On Sunday, December 18, 2022 6:15:29 PM CET Volker Rümelin wrote:
>> Some emulated audio devices allow guests to select very low
>> sample rates that the audio subsystem doesn't support. The lowest
>> supported sample rate depends on the audio backend used and in
>> most cases can be changed with various -audiodev arguments. Until
>> now, the audio_bug function emits an error message similar to the
>> following error message
>>
>> A bug was just triggered in audio_calloc
>> Save all your work and restart without audio
>> I am sorry
>> Context:
>> audio_pcm_sw_alloc_resources_out passed invalid arguments to
>>   audio_calloc
>> nmemb=0 size=16 (len=0)
>> audio: Could not allocate buffer for `ac97.po' (0 samples)
>>
>> and the audio subsystem continues without sound for the affected
>> device.
>>
>> The fact that the selected sample rate is not supported is not a
>> guest error. Instead of displaying an error message, the missing
>> audio support is now logged. Simply continuing without sound is
>> correct, since the audio stream won't transport anything
>> reasonable at such high resample ratios anyway.
>>
>> The AUD_open_* functions return NULL like before. The opened
>> audio device will not be registered in the audio subsystem and
>> consequently the audio frontend callback functions will not be
>> called. The AUD_read and AUD_write functions return early in this
>> case. This is necessary because, for example, the Sound Blaster 16
>> emulation calls AUD_write from the DMA callback function.
>>
>> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>> ---
>>   audio/audio.c          |  1 +
>>   audio/audio_template.h | 13 +++++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index d849a94a81..f6b420688d 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -31,6 +31,7 @@
>>   #include "qapi/qobject-input-visitor.h"
>>   #include "qapi/qapi-visit-audio.h"
>>   #include "qemu/cutils.h"
>> +#include "qemu/log.h"
>>   #include "qemu/module.h"
>>   #include "qemu/help_option.h"
>>   #include "sysemu/sysemu.h"
>> diff --git a/audio/audio_template.h b/audio/audio_template.h
>> index 720a32e57e..bfa94b4d22 100644
>> --- a/audio/audio_template.h
>> +++ b/audio/audio_template.h
>> @@ -115,6 +115,19 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
>>   #else
>>       samples = (int64_t)sw->HWBUF->size * sw->ratio >> 32;
>>   #endif
>> +    if (samples == 0) {
>> +        HW *hw = sw->hw;
>> +        size_t f_fe_min;
>> +
>> +        /* f_fe_min = ceil(1 [frames] * f_be [Hz] / size_be [frames]) */
>> +        f_fe_min = (hw->info.freq + HWBUF->size - 1) / HWBUF->size;
>> +        qemu_log_mask(LOG_UNIMP,
>> +                      AUDIO_CAP ": The guest selected a " NAME " sample rate"
>> +                      " of %d Hz for %s. Only sample rates >= %zu Hz are"
>> +                      " supported.\n",
>> +                      sw->info.freq, sw->name, f_fe_min);
>> +        return -1;
> You probably want to `sw->buf = NULL;` before returning here, or adjust the
> condition for the error message below.

sw->buf is always NULL here. In the audio_pcm_create_voice_pair_*() 
functions we have sw = audio_calloc(__func__, 1, sizeof(*sw)) (after 
patch 08/11 sw = g_new0(SW, 1)) and the audio_pcm_sw_free_resources_*() 
functions also set sw->buf = NULL after freeing sw->buf.

> The other thing that puzzles me, in error case these template functions return
> -1, which would then be feed to g_malloc*()?

Sorry, I can't see where -1 would be fed to g_malloc*().

On error the audio_pcm_sw_alloc_resources_*() functions return error 
code -1, and that error code propagates up to the AUD_open_*() functions 
or the audio_pcm_create_voice_pair_*() functions which return NULL.

>> +    }
>>   
>>       sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
>>       if (!sw->buf) {
>>


