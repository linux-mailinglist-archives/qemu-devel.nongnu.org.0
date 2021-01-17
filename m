Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26942F9192
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 10:43:14 +0100 (CET)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l14aX-0007d5-HU
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 04:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1l14ZO-0007Cz-PN
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 04:42:03 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:42754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1l14ZJ-0008JY-7Y
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 04:42:02 -0500
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout05.t-online.de (Postfix) with SMTP id 8A5BC426F1C7;
 Sun, 17 Jan 2021 10:41:52 +0100 (CET)
Received: from [192.168.211.200]
 (G5WMHgZTQhQKkid6SxW9LIeutxYS-9h7wVssVWz1G0r3wxLAaNpGSIWQE1oQqQ4gfJ@[46.86.56.56])
 by fwd22.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1l14ZD-3Zv1840; Sun, 17 Jan 2021 10:41:51 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 06/23] sdlaudio: fill remaining sample buffer with silence
To: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-6-vr_qemu@t-online.de>
 <38da0ef3-d48c-2ff6-e1e4-240594dffdfc@redhat.com>
Message-ID: <198a071c-6540-1b62-001c-565f5200cff3@t-online.de>
Date: Sun, 17 Jan 2021 10:41:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <38da0ef3-d48c-2ff6-e1e4-240594dffdfc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: G5WMHgZTQhQKkid6SxW9LIeutxYS-9h7wVssVWz1G0r3wxLAaNpGSIWQE1oQqQ4gfJ
X-TOI-EXPURGATEID: 150726::1610876511-00011FFC-C0AB03B0/0/0 CLEAN NORMAL
X-TOI-MSGID: e7f58034-4073-43b8-97d9-6b7456e7a801
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.039, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

> On 10/01/2021 11.02, Volker Rümelin wrote:
>> Fill the remaining sample buffer with silence. To fill it with
>> zeroes is wrong for unsigned samples because this is silence
>> with a DC bias.
>>
>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>> ---
>>   audio/sdlaudio.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
>> index 79eed23849..01ae4c600e 100644
>> --- a/audio/sdlaudio.c
>> +++ b/audio/sdlaudio.c
>> @@ -235,7 +235,8 @@ static void sdl_callback (void *opaque, Uint8 
>> *buf, int len)
>>         /* clear remaining buffer that we couldn't fill with data */
>>       if (len) {
>> -        memset(buf, 0, len);
>> +        audio_pcm_info_clear_buf(&hw->info, buf,
>> +                                 len / hw->info.bytes_per_frame);
>>       }
>>   }
>>
>
> Ignorant question: Is anybody still using unsigned samples in the 21st 
> century?
>

Hi Thomas,

you are probably right that no one is knowingly using unsigned samples 
anymore. But qemu emulates audio devices from the last century. For 
example with the command line options -machine pcspk-audiodev=audio0 
-audiodev sdl,id=audio0,out.buffer-length=3750,out.mixing-engine=off you 
will see 8 bit unsigned samples in the SDL callback buffer.

With best regards,
Volker

> Anyway,
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>


