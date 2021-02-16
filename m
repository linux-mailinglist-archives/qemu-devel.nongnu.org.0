Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66531D260
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 22:54:31 +0100 (CET)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC8Ig-0008PK-80
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 16:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lC8H8-0007wd-ER
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:52:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39742
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lC8H6-0007EZ-Nz
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:52:54 -0500
Received: from host86-150-128-218.range86-150.btcentralplus.com
 ([86.150.128.218] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lC8HM-0007bK-P6; Tue, 16 Feb 2021 21:53:13 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-12-mark.cave-ayland@ilande.co.uk>
 <215d5901-e5d9-fe70-1b46-5baadb7048df@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a10eb92a-ceb9-cee2-d747-172e56fba0bf@ilande.co.uk>
Date: Tue, 16 Feb 2021 21:52:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <215d5901-e5d9-fe70-1b46-5baadb7048df@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.150.128.218
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

On 16/02/2021 07:33, Philippe Mathieu-Daudé wrote:

> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>> Perform the length adjustment whereby a value of 0 in the STC represents
>> a transfer length of 0x10000 at the point where the TC is loaded at the
> 
> 0x10000 -> 64 KiB?

I'd prefer to keep these as they are, since TC is described in the documentation as 
16-bit counter: it is the number of bits that is relevant here as opposed to the 
absolute size.

There is a slight bit of trickery here in that the ESP emulation already handles a 
later variant of the chip which has a 24-bit counter which is why we can get away 
with setting its value to 0x10000 - guests that don't check for this will simply 
ignore the register containing the MSB.

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
> 
> 0x10000 -> 64 * KiB

And same here too.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


ATB,

Mark.

