Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881EF5B8866
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:38:44 +0200 (CEST)
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRf9-0004pu-LI
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYQul-0007NP-BF; Wed, 14 Sep 2022 07:50:52 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYQui-0008HV-Ee; Wed, 14 Sep 2022 07:50:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2A29C7462D3;
 Wed, 14 Sep 2022 13:50:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E21B27461AE; Wed, 14 Sep 2022 13:50:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E0196745702;
 Wed, 14 Sep 2022 13:50:39 +0200 (CEST)
Date: Wed, 14 Sep 2022 13:50:39 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 09/20] ppc440_sdram: Split off map/unmap of sdram
 banks for later reuse
In-Reply-To: <06bed718-ab49-27d5-ba92-1a2892b86334@kaod.org>
Message-ID: <b58aac6f-e29e-81eb-1bc9-3c1932b15239@eik.bme.hu>
References: <cover.1663097286.git.balaton@eik.bme.hu>
 <4229345309c2320430c0649be5b02c8194d207f6.1663097286.git.balaton@eik.bme.hu>
 <06bed718-ab49-27d5-ba92-1a2892b86334@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-992748831-1663156239=:20411"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-992748831-1663156239=:20411
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 14 Sep 2022, Cédric Le Goater wrote:
> On 9/13/22 21:52, BALATON Zoltan wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc440_uc.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index 5db59d1190..01184e717b 100644
>> --- a/hw/ppc/ppc440_uc.c
>> +++ b/hw/ppc/ppc440_uc.c
>> @@ -561,26 +561,33 @@ static uint64_t sdram_size(uint32_t bcr)
>>       return size;
>>   }
>>   +static void sdram_bank_map(Ppc4xxSdramBank *bank)
>> +{
>> +    memory_region_init(&bank->container, NULL, "sdram-container", 
>> bank->size);
>
> This init belongs to the realize routine.
>
> It is a oneliner. I think you can do it now without risks.

Not in this patch for sure as this is just moving this out from the write 
callback here. What you suggest is a separate clean up that could be 
considered as a followup after this series. I'm not sure which way is best 
as one could argue that we don't need this container region and could just 
create the ram region alias with the right size and offset but that may 
need to store more info or understand the register values better. Since I 
may not understand it completely I chose to not break it more and just 
leave it as it is for now. You could think about changing it afterwards 
separately.

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>> +    memory_region_add_subregion(&bank->container, 0, &bank->ram);
>> +    memory_region_add_subregion(get_system_memory(), bank->base,
>> +                                &bank->container);
>> +}
>> +
>> +static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
>> +{
>> +    memory_region_del_subregion(get_system_memory(), &bank->container);
>> +    memory_region_del_subregion(&bank->container, &bank->ram);
>> +    object_unparent(OBJECT(&bank->container));
>> +}
>> +
>>   static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
>>                             uint32_t bcr, int enabled)
>>   {
>>       if (sdram->bank[i].bcr & 1) {
>>           /* First unmap RAM if enabled */
>> -        memory_region_del_subregion(get_system_memory(),
>> -                                    &sdram->bank[i].container);
>> -        memory_region_del_subregion(&sdram->bank[i].container,
>> -                                    &sdram->bank[i].ram);
>> -        object_unparent(OBJECT(&sdram->bank[i].container));
>> +        sdram_bank_unmap(&sdram->bank[i]);
>>       }
>>       sdram->bank[i].bcr = bcr & 0xffe0ffc1;
>> +    sdram->bank[i].base = sdram_base(bcr);
>> +    sdram->bank[i].size = sdram_size(bcr);
>>       if (enabled && (bcr & 1)) {
>> -        memory_region_init(&sdram->bank[i].container, NULL, 
>> "sdram-container",
>> -                           sdram_size(bcr));
>> -        memory_region_add_subregion(&sdram->bank[i].container, 0,
>> -                                    &sdram->bank[i].ram);
>> -        memory_region_add_subregion(get_system_memory(),
>> -                                    sdram_base(bcr),
>> -                                    &sdram->bank[i].container);
>> +        sdram_bank_map(&sdram->bank[i]);
>>       }
>>   }
>> 
>
>
>
--3866299591-992748831-1663156239=:20411--

