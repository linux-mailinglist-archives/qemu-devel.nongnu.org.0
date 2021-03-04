Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D732D96D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 19:28:06 +0100 (CET)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHshh-0004oU-6x
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 13:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHsgE-0004Ii-7b
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:26:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39480
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHsgC-0008OM-Kf
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:26:34 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHsfz-00076V-4F; Thu, 04 Mar 2021 18:26:23 +0000
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-32-mark.cave-ayland@ilande.co.uk>
 <d764e7e2-2171-4fe9-b73e-197f892c148b@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1c9f8851-a75c-34f0-ddb6-1414085eccd8@ilande.co.uk>
Date: Thu, 4 Mar 2021 18:26:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d764e7e2-2171-4fe9-b73e-197f892c148b@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 31/42] esp: implement FIFO flush command
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 19:32, Laurent Vivier wrote:

> Le 09/02/2021 à 20:30, Mark Cave-Ayland a écrit :
>> At this point it is now possible to properly implement the FIFO flush command
>> without causing guest errors.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 1d56c99527..0994673ff8 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -770,6 +770,8 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>>           case CMD_FLUSH:
>>               trace_esp_mem_writeb_cmd_flush(val);
>>               /*s->ti_size = 0;*/
>> +            s->ti_wptr = 0;
>> +            s->ti_rptr = 0;
>>               s->rregs[ESP_RINTR] = INTR_FC;
>>               s->rregs[ESP_RSEQ] = 0;
>>               s->rregs[ESP_RFLAGS] = 0;
>>
> 
> Why don't  you set aso ti_size to 0?

I remember trying this and there was a sequence in one of my test images whereby the 
OS submitted a SCSI CDB followed by a flush (presumably to clear the CDB from the 
FIFO): this caused ti_size to be zeroed, losing the response reply size.

As Phil's original comment was against patch 38 "esp: convert ti_buf from array to 
Fifo8" that's where the comment is finally removed - it doesn't make sense to keep it 
after the conversion.

> Anyway:
> 
> Reviwed-by: Laurent Vivier <laurent@vivier.eu>
> 
> Thanks,
> Laurent


ATB,

Mark.

