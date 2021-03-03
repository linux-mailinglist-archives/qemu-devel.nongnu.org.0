Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E199A32B5FF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:46:26 +0100 (CET)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHN9F-0002By-Vw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHN7q-0001O2-04
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:44:58 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45382
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHN7o-0006IX-7F
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:44:57 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHN7i-0002S7-KA; Wed, 03 Mar 2021 08:44:55 +0000
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-12-mark.cave-ayland@ilande.co.uk>
 <147ddcd7-4797-51da-7940-e6d0fa77ee2c@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <23e87985-002b-9c54-f137-19e4bdfe2053@ilande.co.uk>
Date: Wed, 3 Mar 2021 08:44:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <147ddcd7-4797-51da-7940-e6d0fa77ee2c@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 11/42] esp: apply transfer length adjustment when STC
 is zero at TC load time
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

On 01/03/2021 21:35, Laurent Vivier wrote:

> Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
>> Perform the length adjustment whereby a value of 0 in the STC represents
>> a transfer length of 0x10000 at the point where the TC is loaded at the
>> start of a DMA command rather than just when a TI (Transfer Information)
>> command is executed. This better matches the description as given in the
>> datasheet.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index a1acc2c9bd..02b7876394 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -562,9 +562,6 @@ static void handle_ti(ESPState *s)
>>       }
>>   
>>       dmalen = esp_get_tc(s);
>> -    if (dmalen == 0) {
>> -        dmalen = 0x10000;
>> -    }
>>       s->dma_counter = dmalen;
>>   
>>       if (s->do_cmd) {
>> @@ -699,7 +696,11 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>>           if (val & CMD_DMA) {
>>               s->dma = 1;
>>               /* Reload DMA counter.  */
>> -            esp_set_tc(s, esp_get_stc(s));
>> +            if (esp_get_stc(s) == 0) {
>> +                esp_set_tc(s, 0x10000);
>> +            } else {
>> +                esp_set_tc(s, esp_get_stc(s));
>> +            }
> 
> More fun?
> 
>      esp_set_tc(s, esp_get_stc(s) ?: 0x10000);

I've just tried this, and it feels less intuitive to read when skimming over the 
code. I'd prefer to keep this in its current form and just accept that my coding 
style is more functional than artistic :/

>>           } else {
>>               s->dma = 0;
>>           }
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>


ATB,

Mark.

