Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D4351129
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:52:56 +0200 (CEST)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRt4R-00040t-Ra
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt2D-0002hB-RS
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:50:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57268
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt1w-0004Qw-71
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:50:35 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt1y-0004jI-Re; Thu, 01 Apr 2021 09:50:27 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-4-mark.cave-ayland@ilande.co.uk>
 <bc8795c0-4fc6-a923-0458-f2ac0feb590c@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0629537e-f168-020b-7252-8e59028c62b3@ilande.co.uk>
Date: Thu, 1 Apr 2021 09:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bc8795c0-4fc6-a923-0458-f2ac0feb590c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 03/11] esp: consolidate esp_cmdfifo_push() into
 esp_fifo_push()
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

On 01/04/2021 09:15, Philippe Mathieu-Daudé wrote:

> On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
>> Each FIFO currently has its own push functions with the only difference being
>> the capacity check. The original reason for this was that the fifo8
>> implementation doesn't have a formal API for retrieving the FIFO capacity,
>> however there are multiple examples within QEMU where the capacity field is
>> accessed directly.
> 
> So the Fifo8 API is not complete / practical.

I guess it depends what you consider to be public and private to Fifo8: what is 
arguably missing is something like:

int fifo8_capacity(Fifo8 *fifo)
{
     return fifo->capacity;
}

But given that most other users access fifo->capacity directly then I might as well 
do the same and save myself requiring 2 separate implementations of esp_fifo_pop_buf() :)

>> Change esp_fifo_push() to access the FIFO capacity directly and then consolidate
>> esp_cmdfifo_push() into esp_fifo_push().
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 27 ++++++++-------------------
>>   1 file changed, 8 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 26fe1dcb9d..16aaf8be93 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -98,16 +98,15 @@ void esp_request_cancelled(SCSIRequest *req)
>>       }
>>   }
>>   
>> -static void esp_fifo_push(ESPState *s, uint8_t val)
>> +static void esp_fifo_push(Fifo8 *fifo, uint8_t val)
>>   {
>> -    if (fifo8_num_used(&s->fifo) == ESP_FIFO_SZ) {
>> +    if (fifo8_num_used(fifo) == fifo->capacity) {
>>           trace_esp_error_fifo_overrun();
>>           return;
>>       }
>>   
>> -    fifo8_push(&s->fifo, val);
>> +    fifo8_push(fifo, val);
>>   }
>> -
> 
> Spurious line removal?

Ooops yes. I'm not too worried about this, but if Paolo has any other changes then I 
can roll this into a v4.

>>   static uint8_t esp_fifo_pop(ESPState *s)
>>   {
>>       if (fifo8_is_empty(&s->fifo)) {
>> @@ -117,16 +116,6 @@ static uint8_t esp_fifo_pop(ESPState *s)
>>       return fifo8_pop(&s->fifo);
>>   }
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


ATB,

Mark.

