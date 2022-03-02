Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7124A4CB05C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:56:39 +0100 (CET)
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW1W-0001jR-IA
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:56:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nPVwb-0003pM-Ef
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:51:33 -0500
Received: from mailout03.t-online.de ([194.25.134.81]:42800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nPVwZ-0007oZ-CP
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:51:33 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout03.t-online.de (Postfix) with SMTP id 40B2E6AA5;
 Wed,  2 Mar 2022 21:51:27 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nPVwU-46uKu10; Wed, 2 Mar 2022 21:51:26 +0100
Message-ID: <aa2be4fc-89d6-e652-2294-a66726747f7a@t-online.de>
Date: Wed, 2 Mar 2022 21:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 06/15] jackaudio: use more jack audio buffers
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
 <20220301191311.26695-6-vr_qemu@t-online.de> <1951855.XoFpWQ29RW@silver>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <1951855.XoFpWQ29RW@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646254286-0000F5B3-D67405B5/0/0 CLEAN NORMAL
X-TOI-MSGID: cfb4e1ab-a5e3-4476-9d4c-f513aa458e17
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Dienstag, 1. März 2022 20:13:02 CET Volker Rümelin wrote:
>> The next patch reduces the effective qemu playback buffer size
>> by timer-period. Increase the number of jack audio buffers by
>> one to preserve the total effective buffer size. The size of one
>> jack audio buffer is 512 samples. With audio defaults that's
>> 512 samples / 44100 samples/s = 11.6 ms and only slightly larger
>> than the timer-period of 10 ms.
>>
>> The larger jack audio buffer increases audio dropout safety,
>> because the high priority jack-audio worker threads can provide
>> audio data for a longer period of time as with a smaller buffer
>> and more audio data in the mixing engine buffer that they can't
>> access.
>>
>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>> ---
> I actually reviewed this patch already, but OK, then a 2nd time:
>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Oh, now that you write it, I remember this. Thank you.

With best regards,
Volker

> Best regards,
> Christian Schoenebeck
>
>>   audio/jackaudio.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
>> index 317009e936..26246c3a8b 100644
>> --- a/audio/jackaudio.c
>> +++ b/audio/jackaudio.c
>> @@ -483,8 +483,8 @@ static int qjack_client_init(QJackClient *c)
>>           c->buffersize = 512;
>>       }
>>
>> -    /* create a 2 period buffer */
>> -    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 2);
>> +    /* create a 3 period buffer */
>> +    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 3);
>>
>>       qjack_client_connect_ports(c);
>>       c->state = QJACK_STATE_RUNNING;
>


