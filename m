Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5574CA07B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 10:20:26 +0100 (CET)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPL9l-0002mo-7f
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 04:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPL6x-00023R-2g
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:17:31 -0500
Received: from [2001:41c9:1:41f::167] (port=53276
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPL6v-0000of-Jn
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:17:30 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPL6B-0005zn-MR; Wed, 02 Mar 2022 09:16:47 +0000
Message-ID: <8bf2239d-aaff-a45f-f316-97c7cd52bc1e@ilande.co.uk>
Date: Wed, 2 Mar 2022 09:17:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, laurent@vivier.eu, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
 <20220228222527.8234-9-mark.cave-ayland@ilande.co.uk>
 <f4927d00-f37a-3970-37ba-40e672154c0d@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <f4927d00-f37a-3970-37ba-40e672154c0d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/10] esp: convert ESPState pdma_cb from a function
 pointer to an integer
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/02/2022 23:10, Philippe Mathieu-Daudé wrote:

> On 28/2/22 23:25, Mark Cave-Ayland wrote:
>> This prepares for the inclusion of the current PDMA callback in the migration
>> stream since the callback is referenced by an integer instead of a function
>> pointer.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c         | 47 ++++++++++++++++++++++++++++++-------------
>>   include/hw/scsi/esp.h | 11 +++++++++-
>>   2 files changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 035fb0d1f6..e8b6f25dbb 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -195,14 +195,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>>       esp_set_tc(s, dmalen);
>>   }
>> -static void esp_set_pdma_cb(ESPState *s, void (*cb)(ESPState *))
>> +static void esp_set_pdma_cb(ESPState *s, int pdma_cb)
> 
> Why signed?

Ooops.

>>   {
>> -    s->pdma_cb = cb;
>> -}
>> -
>> -static void esp_pdma_cb(ESPState *s)
>> -{
>> -    s->pdma_cb(s);
>> +    assert(pdma_cb >= 0 && pdma_cb < PDMA_NUM_CBS);
> 
> No need to check >=0 if using unsigned.

Agreed.

>> +    s->pdma_cb = pdma_cb;
>>   }
> 
>> +static void esp_pdma_cb(ESPState *s)
>> +{
>> +    switch (s->pdma_cb) {
>> +    case PDMA_SATN_PDMA_CB:
>> +        satn_pdma_cb(s);
>> +        break;
>> +    case PDMA_S_WITHOUT_SATN_PDMA_CB:
>> +        s_without_satn_pdma_cb(s);
>> +        break;
>> +    case PDMA_SATN_STOP_PDMA_CB:
>> +        satn_stop_pdma_cb(s);
>> +        break;
>> +    case PDMA_WRITE_RESPONSE_PDMA_CB:
>> +        write_response_pdma_cb(s);
>> +        break;
>> +    case PDMA_DO_DMA_PDMA_CB:
>> +        do_dma_pdma_cb(s);
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
> 
>> index b1ec27612f..885ccf4660 100644
>> --- a/include/hw/scsi/esp.h
>> +++ b/include/hw/scsi/esp.h
>> @@ -51,7 +51,7 @@ struct ESPState {
>>       ESPDMAMemoryReadWriteFunc dma_memory_write;
>>       void *dma_opaque;
>>       void (*dma_cb)(ESPState *s);
>> -    void (*pdma_cb)(ESPState *s);
>> +    uint8_t pdma_cb;
> 
> And here you use unsigned :)
> 
>>       uint8_t mig_version_id;
>> @@ -150,6 +150,15 @@ struct SysBusESPState {
>>   #define TCHI_FAS100A 0x4
>>   #define TCHI_AM53C974 0x12
>> +/* PDMA callbacks */
>> +#define PDMA_SATN_PDMA_CB              0
>> +#define PDMA_S_WITHOUT_SATN_PDMA_CB    1
>> +#define PDMA_SATN_STOP_PDMA_CB         2
>> +#define PDMA_WRITE_RESPONSE_PDMA_CB    3
>> +#define PDMA_DO_DMA_PDMA_CB            4
> 
> I'd rather use an enum (and in esp_pdma_cb's switch).
> 
>> +#define PDMA_NUM_CBS                   5
>> +
>>   void esp_dma_enable(ESPState *s, int irq, int level);
>>   void esp_request_cancelled(SCSIRequest *req);
>>   void esp_command_complete(SCSIRequest *req, size_t resid);
> 
> Preferrably using unsigned:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I'll aim to keep the unsigned type in ESPState, and experiment with changing the 
#defines to an enum. If it looks good, I'll include the enum version in v2.


ATB,

Mark.

