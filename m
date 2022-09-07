Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17345B0701
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 16:34:16 +0200 (CEST)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVw86-00066p-HT
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 10:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVw6P-0004PP-3z; Wed, 07 Sep 2022 10:32:29 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:65514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVw6M-000814-JA; Wed, 07 Sep 2022 10:32:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7108E74632B;
 Wed,  7 Sep 2022 16:32:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7287D74633E; Wed,  7 Sep 2022 16:32:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7054974633D;
 Wed,  7 Sep 2022 16:32:20 +0200 (CEST)
Date: Wed, 7 Sep 2022 16:32:20 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 08/20] ppc4xx_sdram: Drop extra zeros for readability
In-Reply-To: <19465d5c-6411-37cf-444b-98b643682c7e@kaod.org>
Message-ID: <45322b4f-1b2e-3b49-2568-f67fe347458c@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <f6d9eec237e5cc84a314d8eb67294212f93076ef.1660926381.git.balaton@eik.bme.hu>
 <19465d5c-6411-37cf-444b-98b643682c7e@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-592307034-1662561140=:35947"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-592307034-1662561140=:35947
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 7 Sep 2022, Cédric Le Goater wrote:
> On 8/19/22 18:55, BALATON Zoltan wrote:
>> Constants that are written zero padded for no good reason are hard to
>> read, it's easier to see what is meant if it's just 0 or 1 instead.
>
> I would keep the 0x prefix though.

I'm not a fan of 0x0 or 0x prefix for numbers below 0xa as it's more 
confusing than just having the simple number since these are the same in 
decimal and hex so I always think it might be 0xC or something not just 0 
when I see a prefix and have to double check. So unless there's a good 
reaon to write them in hex it's simpler to only use the 0x when really 
needed. Maybe if you really want the 0x I could keep it in the switch 
below just for consistency with other cases there but wouldn't have them 
elsewhere. Is it really not acceptable for you as in this patch?

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc4xx_devs.c | 40 ++++++++++++++++++++--------------------
>>   1 file changed, 20 insertions(+), 20 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>> index 375834a52b..bfe7b2d3a6 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -49,31 +49,31 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr 
>> ram_size)
>>         switch (ram_size) {
>>       case 4 * MiB:
>> -        bcr = 0x00000000;
>> +        bcr = 0;
>>           break;
>>       case 8 * MiB:
>> -        bcr = 0x00020000;
>> +        bcr = 0x20000;
>>           break;
>>       case 16 * MiB:
>> -        bcr = 0x00040000;
>> +        bcr = 0x40000;
>>           break;
>>       case 32 * MiB:
>> -        bcr = 0x00060000;
>> +        bcr = 0x60000;
>>           break;
>>       case 64 * MiB:
>> -        bcr = 0x00080000;
>> +        bcr = 0x80000;
>>           break;
>>       case 128 * MiB:
>> -        bcr = 0x000A0000;
>> +        bcr = 0xA0000;
>>           break;
>>       case 256 * MiB:
>> -        bcr = 0x000C0000;
>> +        bcr = 0xC0000;
>>           break;
>>       default:
>>           qemu_log_mask(LOG_GUEST_ERROR,
>>                         "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", 
>> __func__,
>>                         ram_size);
>> -        return 0x00000000;
>> +        return 0;
>>       }
>>       bcr |= ram_base & 0xFF800000;
>>       bcr |= 1;
>> @@ -104,7 +104,7 @@ static target_ulong sdram_size(uint32_t bcr)
>>   static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
>>                             uint32_t bcr, int enabled)
>>   {
>> -    if (sdram->bank[i].bcr & 0x00000001) {
>> +    if (sdram->bank[i].bcr & 1) {
>>           /* Unmap RAM */
>>           trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
>>                                    sdram_size(sdram->bank[i].bcr));
>> @@ -115,7 +115,7 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, 
>> int i,
>>           object_unparent(OBJECT(&sdram->bank[i].container));
>>       }
>>       sdram->bank[i].bcr = bcr & 0xFFDEE001;
>> -    if (enabled && (bcr & 0x00000001)) {
>> +    if (enabled && (bcr & 1)) {
>>           trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
>>           memory_region_init(&sdram->bank[i].container, NULL, 
>> "sdram-container",
>>                              sdram_size(bcr));
>> @@ -136,7 +136,7 @@ static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
>>               sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
>>                                                     sdram->bank[i].size), 
>> 1);
>>           } else {
>> -            sdram_set_bcr(sdram, i, 0x00000000, 0);
>> +            sdram_set_bcr(sdram, i, 0, 0);
>>           }
>>       }
>>   }
>> @@ -213,7 +213,7 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int 
>> dcrn)
>>           break;
>>       default:
>>           /* Avoid gcc warning */
>> -        ret = 0x00000000;
>> +        ret = 0;
>>           break;
>>       }
>>   @@ -306,18 +306,18 @@ static void ppc4xx_sdram_ddr_reset(DeviceState 
>> *dev)
>>   {
>>       Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
>>   -    sdram->addr = 0x00000000;
>> -    sdram->bear = 0x00000000;
>> -    sdram->besr0 = 0x00000000; /* No error */
>> -    sdram->besr1 = 0x00000000; /* No error */
>> -    sdram->cfg = 0x00000000;
>> -    sdram->ecccfg = 0x00000000; /* No ECC */
>> -    sdram->eccesr = 0x00000000; /* No error */
>> +    sdram->addr = 0;
>> +    sdram->bear = 0;
>> +    sdram->besr0 = 0; /* No error */
>> +    sdram->besr1 = 0; /* No error */
>> +    sdram->cfg = 0;
>> +    sdram->ecccfg = 0; /* No ECC */
>> +    sdram->eccesr = 0; /* No error */
>>       sdram->pmit = 0x07C00000;
>>       sdram->rtr = 0x05F00000;
>>       sdram->tr = 0x00854009;
>>       /* We pre-initialize RAM banks */
>> -    sdram->status = 0x00000000;
>> +    sdram->status = 0;
>>       sdram->cfg = 0x00800000;
>>   }
>> 
>
>
>
--3866299591-592307034-1662561140=:35947--

