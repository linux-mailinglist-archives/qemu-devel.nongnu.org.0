Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084F5B071E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 16:39:23 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwD4-0001rW-Ei
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 10:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVwBH-0008VB-FQ; Wed, 07 Sep 2022 10:37:33 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVwBE-0000Yn-Og; Wed, 07 Sep 2022 10:37:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4D6C174633D;
 Wed,  7 Sep 2022 16:37:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D2BE974632B; Wed,  7 Sep 2022 16:37:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D14FF746335;
 Wed,  7 Sep 2022 16:37:25 +0200 (CEST)
Date: Wed, 7 Sep 2022 16:37:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 10/20] ppc440_sdram: Implement enable bit in the DDR2
 SDRAM controller
In-Reply-To: <89b5bf70-87ee-f9b0-f731-a3abbce0c893@kaod.org>
Message-ID: <eee76724-42a0-3cb3-1b4b-26d8ab401e50@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <b37dac18c136a1b3dfc40b443a55480dd1ad8e90.1660926381.git.balaton@eik.bme.hu>
 <89b5bf70-87ee-f9b0-f731-a3abbce0c893@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-313994485-1662561445=:35947"
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

--3866299591-313994485-1662561445=:35947
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 7 Sep 2022, Cédric Le Goater wrote:
> On 8/19/22 18:55, BALATON Zoltan wrote:
>> To allow removing the do_init hack we need to improve the DDR2 SDRAM
>> controller model to handle the enable/disable bit that it ignored so
>> far.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc440_uc.c | 34 ++++++++++++++++++++++++++++++++--
>>   1 file changed, 32 insertions(+), 2 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index c33f91e134..7c1513ff69 100644
>> --- a/hw/ppc/ppc440_uc.c
>> +++ b/hw/ppc/ppc440_uc.c
>> @@ -23,6 +23,7 @@
>>   #include "sysemu/reset.h"
>>   #include "ppc440.h"
>>   #include "qom/object.h"
>> +#include "trace.h"
>>     /*****************************************************************************/
>>   /* L2 Cache as SRAM */
>> @@ -484,6 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>>   /* SDRAM controller */
>>   typedef struct ppc440_sdram_t {
>>       uint32_t addr;
>> +    uint32_t mcopt2;
>>       int nbanks;
>>       Ppc4xxSdramBank bank[4];
>>   } ppc440_sdram_t;
>> @@ -581,12 +583,15 @@ static void sdram_set_bcr(ppc440_sdram_t *sdram, int 
>> i,
>>   {
>>       if (sdram->bank[i].bcr & 1) {
>>           /* First unmap RAM if enabled */
>> +        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
>> +                                 sdram_size(sdram->bank[i].bcr));
>>           sdram_bank_unmap(&sdram->bank[i]);
>>       }
>>       sdram->bank[i].bcr = bcr & 0xffe0ffc1;
>>       sdram->bank[i].base = sdram_base(bcr);
>>       sdram->bank[i].size = sdram_size(bcr);
>>       if (enabled && (bcr & 1)) {
>> +        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
>>           sdram_bank_map(&sdram->bank[i]);
>>       }
>>   }
>> @@ -596,7 +601,7 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
>>       int i;
>>         for (i = 0; i < sdram->nbanks; i++) {
>> -        if (sdram->bank[i].size != 0) {
>> +        if (sdram->bank[i].size) {
>>               sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
>>                                                 sdram->bank[i].size), 1);
>>           } else {
>> @@ -605,6 +610,17 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
>>       }
>>   }
>>   +static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < sdram->nbanks; i++) {
>> +        if (sdram->bank[i].size) {
>> +            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
>> +        }
>> +    }
>> +}
>> +
>>   static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>>   {
>>       ppc440_sdram_t *sdram = opaque;
>> @@ -636,7 +652,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>>               ret = 0x80000000;
>>               break;
>>           case 0x21: /* SDRAM_MCOPT2 */
>> -            ret = 0x08000000;
>> +            ret = sdram->mcopt2;
>>               break;
>>           case 0x40: /* SDRAM_MB0CF */
>>               ret = 0x00008001;
>> @@ -680,6 +696,19 @@ static void dcr_write_sdram(void *opaque, int dcrn, 
>> uint32_t val)
>>           switch (sdram->addr) {
>>           case 0x00: /* B0CR */
>>               break;
>> +        case 0x21: /* SDRAM_MCOPT2 */
>> +            if (!(sdram->mcopt2 & 0x08000000) && (val & 0x08000000)) {
>> +                trace_ppc4xx_sdram_enable("enable");
>> +                /* validate all RAM mappings */
>> +                sdram_map_bcr(sdram);
>> +                sdram->mcopt2 |= 0x08000000;
>> +            } else if ((sdram->mcopt2 & 0x08000000) && !(val & 
>> 0x08000000)) {
>> +                trace_ppc4xx_sdram_enable("disable");
>> +                /* invalidate all RAM mappings */
>> +                sdram_unmap_bcr(sdram);
>> +                sdram->mcopt2 &= ~0x08000000;
>> +            }
>> +            break;
>>           default:
>>               break;
>>           }
>> @@ -694,6 +723,7 @@ static void sdram_reset(void *opaque)
>>       ppc440_sdram_t *sdram = opaque;
>>         sdram->addr = 0;
>> +    sdram->mcopt2 = 0x08000000;
>
> Introducing a define for the 0x08000000 value would make the code easier
> to read.

How about BIT(27) instead of a new define just for this one? Adding e 
define would probably lead to a long name which results in split lines and 
less redable code in the end.

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>>   }
>>     void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>
>
>
--3866299591-313994485-1662561445=:35947--

