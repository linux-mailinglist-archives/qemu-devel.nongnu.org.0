Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78F55A26E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 22:17:15 +0200 (CEST)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4pjv-0006l8-0H
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 16:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4peh-0004q6-Iz; Fri, 24 Jun 2022 16:11:53 -0400
Received: from [187.72.171.209] (port=59617 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4pef-0001eT-Fe; Fri, 24 Jun 2022 16:11:51 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 24 Jun 2022 17:10:39 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id CD0F980003F;
 Fri, 24 Jun 2022 17:10:38 -0300 (-03)
Message-ID: <d1d4e520-e1b2-9b12-d90a-fcd6d5a627dc@eldorado.org.br>
Date: Fri, 24 Jun 2022 17:10:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] target/ppc: Check page dir/table base alignment
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
 <20220624171653.143740-4-leandro.lupori@eldorado.org.br>
 <1228a7e9-4c25-bd43-68d6-53225fc30384@linaro.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <1228a7e9-4c25-bd43-68d6-53225fc30384@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Jun 2022 20:10:39.0202 (UTC)
 FILETIME=[79335C20:01D88806]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/24/22 15:04, Richard Henderson wrote:
> 
> On 6/24/22 10:16, Leandro Lupori wrote:
>> Check if each page dir/table base address is properly aligned and
>> log a guest error if not, as real hardware behave incorrectly in
>> this case.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   target/ppc/mmu-radix64.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>> index 339cf5b4d8..1e7d932893 100644
>> --- a/target/ppc/mmu-radix64.c
>> +++ b/target/ppc/mmu-radix64.c
>> @@ -280,6 +280,14 @@ static int ppc_radix64_next_level(AddressSpace 
>> *as, vaddr eaddr,
>>       *psize -= *nls;
>>       if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
>>           *nls = pde & R_PDE_NLS;
>> +
>> +        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
>> +                " page dir size: 0x"TARGET_FMT_lx"\n",
>> +                __func__, (pde & R_PDE_NLB), BIT(*nls + 3));
>> +        }
>> +
>>           index = eaddr >> (*psize - *nls);       /* Shift */
>>           index &= ((1UL << *nls) - 1);           /* Mask */
>>           *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
> 
> In your response to my question on v1, you said that it appears that the 
> cpu ignores bits
> *nls+3. This isn't ignoring them -- it's including [nls+2 : nls] into 
> pte_addr.
> 
> It would be better to compute this as
> 
>      index = ...
>      index &= ...
>      *pte_addr = ...
>      if (*pte_addr & 7) {
>          qemu_log(...);
>      }
> 

Right, I wanted to warn about the invalid alignment but I ended up 
forgetting to make QEMU match the CPU behavior.

The CPU seems to ignore bits [nls+2 : 0] of NLB.

The multiplication of index by sizeof(pde) discards the 3 lower bits and 
it's not possible for NLB to have its 8 lower bits set, as these are 
used for NLS plus some reserved bits in the PDE.
Then we need to make sure that bits [nls+2 : 8] of NLB are also 0.

So maybe something like this would do it:

     index = eaddr >> (*psize - *nls);       /* Shift */
     index &= ((1UL << *nls) - 1);           /* Mask */
     *pte_addr = pde & R_PDE_NLB;
     mask = MAKE_64BIT_MASK(0, *nls + 3);
     if (*pte_addr & mask) {
         qemu_log(...);
         *pte_addr &= ~mask;
     }
     *pte_addr += index * sizeof(pde);

Thanks,
Leandro

> 
> r~


