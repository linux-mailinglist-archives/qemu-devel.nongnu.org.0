Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE3232B5F7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:37:22 +0100 (CET)
Received: from localhost ([::1]:44610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHN0T-00060f-6F
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHMyg-00054a-Pk
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:35:30 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45360
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHMye-0003Tl-M5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:35:30 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHMya-0002O5-MO; Wed, 03 Mar 2021 08:35:27 +0000
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-10-mark.cave-ayland@ilande.co.uk>
 <464b5903-412a-50be-1811-f906d896779a@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <17ac8fd1-b0ae-02d0-9eb9-6b5a9c071fdf@ilande.co.uk>
Date: Wed, 3 Mar 2021 08:35:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <464b5903-412a-50be-1811-f906d896779a@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 09/42] esp: introduce esp_get_tc() and esp_set_tc()
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

On 01/03/2021 21:24, Laurent Vivier wrote:

> Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
>> This simplifies reading and writing the TC register value without having to
>> manually shift each individual 8-bit value.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/scsi/esp.c | 38 +++++++++++++++++++++++---------------
>>   1 file changed, 23 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index e82e75d490..3a39450930 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -98,6 +98,24 @@ void esp_request_cancelled(SCSIRequest *req)
>>       }
>>   }
>>   
>> +static uint32_t esp_get_tc(ESPState *s)
>> +{
>> +    uint32_t dmalen;
>> +
>> +    dmalen = s->rregs[ESP_TCLO];
>> +    dmalen |= s->rregs[ESP_TCMID] << 8;
>> +    dmalen |= s->rregs[ESP_TCHI] << 16;
>> +
>> +    return dmalen;
>> +}
>> +
>> +static void esp_set_tc(ESPState *s, uint32_t dmalen)
>> +{
>> +    s->rregs[ESP_TCLO] = dmalen & 0xff;
> 
> The "& 0xff" is not needed as rregs is uint8_t.

That's true - I think it's just done that way since that was how it was originally 
written in the section below where I copied it from. I'll remove it in the next version.

>> +    s->rregs[ESP_TCMID] = dmalen >> 8;
>> +    s->rregs[ESP_TCHI] = dmalen >> 16;
>> +}
>> +
>>   static void set_pdma(ESPState *s, enum pdma_origin_id origin,
>>                        uint32_t index, uint32_t len)
>>   {
>> @@ -157,9 +175,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
>>   
>>       target = s->wregs[ESP_WBUSID] & BUSID_DID;
>>       if (s->dma) {
>> -        dmalen = s->rregs[ESP_TCLO];
>> -        dmalen |= s->rregs[ESP_TCMID] << 8;
>> -        dmalen |= s->rregs[ESP_TCHI] << 16;
>> +        dmalen = esp_get_tc(s);
>>           if (dmalen > buflen) {
>>               return 0;
>>           }
>> @@ -348,9 +364,7 @@ static void esp_dma_done(ESPState *s)
>>       s->rregs[ESP_RINTR] = INTR_BS;
>>       s->rregs[ESP_RSEQ] = 0;
>>       s->rregs[ESP_RFLAGS] = 0;
>> -    s->rregs[ESP_TCLO] = 0;
>> -    s->rregs[ESP_TCMID] = 0;
>> -    s->rregs[ESP_TCHI] = 0;
>> +    esp_set_tc(s, 0);
>>       esp_raise_irq(s);
>>   }
>>   
>> @@ -536,9 +550,7 @@ static void handle_ti(ESPState *s)
>>           return;
>>       }
>>   
>> -    dmalen = s->rregs[ESP_TCLO];
>> -    dmalen |= s->rregs[ESP_TCMID] << 8;
>> -    dmalen |= s->rregs[ESP_TCHI] << 16;
>> +    dmalen = esp_get_tc(s);
>>       if (dmalen == 0) {
>>           dmalen = 0x10000;
>>       }
>> @@ -889,9 +901,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>>   
>>       trace_esp_pdma_write(size);
>>   
>> -    dmalen = s->rregs[ESP_TCLO];
>> -    dmalen |= s->rregs[ESP_TCMID] << 8;
>> -    dmalen |= s->rregs[ESP_TCHI] << 16;
>> +    dmalen = esp_get_tc(s);
>>       if (dmalen == 0 || s->pdma_len == 0) {
>>           return;
>>       }
>> @@ -908,9 +918,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>>           dmalen -= 2;
>>           break;
>>       }
>> -    s->rregs[ESP_TCLO] = dmalen & 0xff;
>> -    s->rregs[ESP_TCMID] = dmalen >> 8;
>> -    s->rregs[ESP_TCHI] = dmalen >> 16;
>> +    esp_set_tc(s, dmalen);
>>       if (s->pdma_len == 0 && s->pdma_cb) {
>>           esp_lower_drq(s);
>>           s->pdma_cb(s);
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>


ATB,

Mark.

