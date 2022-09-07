Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870445B0716
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 16:36:34 +0200 (CEST)
Received: from localhost ([::1]:39986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwAL-0008MY-FP
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 10:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVw8T-0006Dk-0j; Wed, 07 Sep 2022 10:34:37 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVw8N-0008W8-86; Wed, 07 Sep 2022 10:34:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EB3E874632B;
 Wed,  7 Sep 2022 16:34:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7C9E17461AE; Wed,  7 Sep 2022 16:34:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7AE86745702;
 Wed,  7 Sep 2022 16:34:26 +0200 (CEST)
Date: Wed, 7 Sep 2022 16:34:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 09/20] ppc440_sdram: Split off map/unmap of sdram banks
 for later reuse
In-Reply-To: <2fd70fa7-3620-2206-0d9a-2287e94e4a90@kaod.org>
Message-ID: <7be73bd-601a-46a5-4c71-f5689f30b1c4@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <fdce3e916e0020fbc084ba270d3c6d93e5f9a28f.1660926381.git.balaton@eik.bme.hu>
 <2fd70fa7-3620-2206-0d9a-2287e94e4a90@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-914918268-1662561266=:35947"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--3866299591-914918268-1662561266=:35947
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 7 Sep 2022, Cédric Le Goater wrote:
> On 8/19/22 18:55, BALATON Zoltan wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc440_uc.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index 3507c35b63..c33f91e134 100644
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
> I don't think we need to init the ->container memory region each time.
> This could be done once and for all in the realize handler.
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
>
> object_unparent could be dropped if the memory_region_init was called in
> realize.
>
> Also, memory_region_set_enabled() might be a better alternative.

I think these could be considered as a follow up later, I don't want to 
change it now to avoid breaking it more as I've already managed to break 
ref405ep as you found (this will be fixed in v2) so I'd not try to change 
this in this series.

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>
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
--3866299591-914918268-1662561266=:35947--

