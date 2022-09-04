Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BAC5AC432
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 14:04:32 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUoMX-000237-SW
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 08:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oUoHn-0007MY-Pj; Sun, 04 Sep 2022 07:59:35 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oUoHk-0007bU-KR; Sun, 04 Sep 2022 07:59:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BE504746399;
 Sun,  4 Sep 2022 13:59:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 506E3746397; Sun,  4 Sep 2022 13:59:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4EB6C746396;
 Sun,  4 Sep 2022 13:59:27 +0200 (CEST)
Date: Sun, 4 Sep 2022 13:59:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 10/20] ppc440_sdram: Implement enable bit in the DDR2
 SDRAM controller
In-Reply-To: <13f53514-2e71-0832-2284-4fcd68385a26@amsat.org>
Message-ID: <5783c5b6-3ed2-6d4-be85-8be91f50971@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <b37dac18c136a1b3dfc40b443a55480dd1ad8e90.1660926381.git.balaton@eik.bme.hu>
 <13f53514-2e71-0832-2284-4fcd68385a26@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-104384963-1662292767=:66610"
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

--3866299591-104384963-1662292767=:66610
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 4 Sep 2022, Philippe Mathieu-Daudé via wrote:
> On 19/8/22 18:55, BALATON Zoltan wrote:
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
>
> You extracted sdram_bank_unmap() for "reuse", so better
> add the trace event there.

These will end up there in patch 19 after consolidating ppc4xx DDR and 
ppc440 DDR2 models.

Thanks for your time reviewing it

Regards,
BALATON Zoltan

>>           sdram_bank_unmap(&sdram->bank[i]);
>>       }
>>       sdram->bank[i].bcr = bcr & 0xffe0ffc1;
>>       sdram->bank[i].base = sdram_base(bcr);
>>       sdram->bank[i].size = sdram_size(bcr);
>>       if (enabled && (bcr & 1)) {
>> +        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
>
> Ditto.
>
>>           sdram_bank_map(&sdram->bank[i]);
>>       }
>>   }
>
>
--3866299591-104384963-1662292767=:66610--

