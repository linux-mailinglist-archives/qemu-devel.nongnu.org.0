Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E0324CC0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:25:09 +0100 (CET)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCtQ-0004jv-O9
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFCkT-0004Qz-6a
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36870
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFCkR-0006SD-BU
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:52 -0500
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFCkE-000899-74; Thu, 25 Feb 2021 09:15:42 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-39-mark.cave-ayland@ilande.co.uk>
 <69c265c8-1d68-4e09-971a-98233e7debee@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1d690842-17a4-b2d4-1cc1-03b6bc37d263@ilande.co.uk>
Date: Thu, 25 Feb 2021 09:15:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <69c265c8-1d68-4e09-971a-98233e7debee@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 38/42] esp: convert ti_buf from array to Fifo8
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

On 23/02/2021 18:49, Philippe Mathieu-Daudé wrote:

> On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
>> Rename TI_BUFSZ to ESP_FIFO_SZ since this constant is really describing the size
>> of the FIFO and is not directly related to the TI size.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c         | 117 ++++++++++++++++++++++++++----------------
>>   include/hw/scsi/esp.h |   8 +--
>>   2 files changed, 79 insertions(+), 46 deletions(-)
> 
>> @@ -806,11 +818,9 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>>               } else {
>>                   trace_esp_error_fifo_overrun();
>>               }
>> -        } else if (s->ti_wptr == TI_BUFSZ - 1) {
>> -            trace_esp_error_fifo_overrun();
>>           } else {
>>               s->ti_size++;
>> -            s->ti_buf[s->ti_wptr++] = val & 0xff;
>> +            esp_fifo_push(s, val & 0xff);
> 
> Personally I'd drop the '& 0xff' part.

I left it as it was so that it was direct translation of the code it was replacing, 
but I can easily drop it.

>>           }
>>   
>>           /* Non-DMA transfers raise an interrupt after every byte */
>> @@ -839,8 +849,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>>           case CMD_FLUSH:
>>               trace_esp_mem_writeb_cmd_flush(val);
>>               /*s->ti_size = 0;*/
> 
> Is this comment still meaningful?

This line can also be removed, so I will make this change for v3.

>> -            s->ti_wptr = 0;
>> -            s->ti_rptr = 0;
>> +            fifo8_reset(&s->fifo);
>>               break;
>>           case CMD_RESET:
>>               trace_esp_mem_writeb_cmd_reset(val);
>> @@ -958,11 +967,18 @@ static int esp_pre_save(void *opaque)
>>   static int esp_post_load(void *opaque, int version_id)
>>   {
>>       ESPState *s = ESP(opaque);
>> +    int len, i;
>>   
>>       version_id = MIN(version_id, s->mig_version_id);
>>   
>>       if (version_id < 5) {
>>           esp_set_tc(s, s->mig_dma_left);
>> +
>> +        /* Migrate ti_buf to fifo */
>> +        len = s->mig_ti_wptr - s->mig_ti_rptr;
>> +        for (i = 0; i < len; i++) {
>> +            fifo8_push(&s->fifo, s->mig_ti_buf[i]);
> 
> Again I dare to add:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thank you :)


ATB,

Mark.

