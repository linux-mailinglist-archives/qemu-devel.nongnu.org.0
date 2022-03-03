Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39224CC466
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:52:47 +0100 (CET)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpd8-0000NO-La
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpbJ-0007JN-42
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:50:53 -0500
Received: from [2001:41c9:1:41f::167] (port=56348
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpbG-0005g8-G9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:50:52 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpaX-0006tY-6C; Thu, 03 Mar 2022 17:50:09 +0000
Message-ID: <60925b7c-69cc-f291-fa38-4825910a964a@ilande.co.uk>
Date: Thu, 3 Mar 2022 17:50:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-10-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9eMZFvqn-VuA2EevOM7ZV3PiVYora+CsKpdjcqM7L4_Q@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA9eMZFvqn-VuA2EevOM7ZV3PiVYora+CsKpdjcqM7L4_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 09/10] esp: include the current PDMA callback in the
 migration stream
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2022 15:40, Peter Maydell wrote:

> On Wed, 2 Mar 2022 at 21:38, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This involves (re)adding a PDMA-specific subsection to hold the reference to the
>> current PDMA callback.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index a818b2b07a..32926834bc 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -1209,6 +1209,25 @@ static int esp_post_load(void *opaque, int version_id)
>>       return 0;
>>   }
>>
>> +static bool esp_pdma_needed(void *opaque)
>> +{
>> +    ESPState *s = ESP(opaque);
>> +
>> +    return s->dma_memory_read == NULL && s->dma_memory_write == NULL &&
>> +           s->dma_enabled;
> 
> A comment about why this is the correct condition would be helpful.
> If I understand it correctly, something like this ?
> 
>   /*
>    * pdma_cb is used only by the sysbus ESP device, not the PCI ESP
>    * device. The PCI device sets the s->dma_memory_read and
>    * s->dma_memory_write function pointers at realize.
>    */

Even more specifically, PDMA is only used by the Macintosh which is detected by not 
having DMA memory access functions (because the movement between the SCSI bus and the 
CPU is done by the guest) yet DMA is enabled.

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
>> +}
>> +
>> +static const VMStateDescription vmstate_esp_pdma = {
>> +    .name = "esp/pdma",
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .needed = esp_pdma_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(pdma_cb, ESPState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>   const VMStateDescription vmstate_esp = {
>>       .name = "esp",
>>       .version_id = 6,
>> @@ -1243,6 +1262,10 @@ const VMStateDescription vmstate_esp = {
>>           VMSTATE_UINT8_TEST(lun, ESPState, esp_is_version_6),
>>           VMSTATE_END_OF_LIST()
>>       },
>> +    .subsections = (const VMStateDescription * []) {
>> +        &vmstate_esp_pdma,
>> +        NULL
>> +    }
>>   };
> 
> Do we need to do something similar to handle s->dma_cb ?

I don't believe so. From IRC my understanding was that for normal DMA where the SCSI 
data is copied directly to memory, if migration is requested the iothread will run to 
completion first which finishes the SCSIRequest before migration starts. It is only 
in the PDMA case where the guest OS has to do the data movement that a reference to 
the current callback is required to allow the SCSIRequest to continue post-migration.


ATB,

Mark.

