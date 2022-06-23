Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A3557DEF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:34:27 +0200 (CEST)
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Nuc-0006Sp-9c
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4NoE-0003T4-Oy; Thu, 23 Jun 2022 10:27:51 -0400
Received: from [187.72.171.209] (port=53290 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4NoB-0007dm-ME; Thu, 23 Jun 2022 10:27:49 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 23 Jun 2022 11:26:42 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 1D48D800150;
 Thu, 23 Jun 2022 11:26:42 -0300 (-03)
Message-ID: <2c09284c-777a-2dc0-7bf6-52e1eb23b4bc@eldorado.org.br>
Date: Thu, 23 Jun 2022 11:26:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] target/ppc: Check page dir/table base alignment
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
 <20220620202704.78978-4-leandro.lupori@eldorado.org.br>
 <87edzhaet6.fsf@linux.ibm.com>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <87edzhaet6.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Jun 2022 14:26:42.0490 (UTC)
 FILETIME=[425941A0:01D8870D]
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

On 6/21/22 18:26, Fabiano Rosas wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
> 
>> Check if each page dir/table base address is properly aligned and
>> log a guest error if not, as real hardware behave incorrectly in
>> this case.
>>
>> These checks are only performed when DEBUG_MMU is defined, to avoid
>> hurting the performance.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   target/ppc/mmu-radix64.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>> index 2f0bcbfe2e..80d945a7c3 100644
>> --- a/target/ppc/mmu-radix64.c
>> +++ b/target/ppc/mmu-radix64.c
>> @@ -28,6 +28,8 @@
>>   #include "mmu-radix64.h"
>>   #include "mmu-book3s-v3.h"
>>
>> +/* #define DEBUG_MMU */
>> +
>>   static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
>>                                                    vaddr eaddr,
>>                                                    uint64_t *lpid, uint64_t *pid)
>> @@ -277,6 +279,16 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>>       if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
>>           ++*level;
>>           *nls = pde & R_PDE_NLS;
>> +
>> +#ifdef DEBUG_MMU
>> +        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
>> +                " page dir size: 0x%"PRIx64" level: %d\n",
>> +                __func__, (pde & R_PDE_NLB), BIT(*nls + 3), *level);
>> +        }
>> +#endif
> 
> Maybe use qemu_log_enabled() instead of the define? I think it is a
> little more useful and has less chance to rot.
> 

Ok. I wanted to avoid introducing any extra overhead, but I guess just 
checking qemu_log_enabled() should be ok.

>> +
>>           index = eaddr >> (*psize - *nls);       /* Shift */
>>           index &= ((1UL << *nls) - 1);           /* Mask */
>>           *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
>> @@ -297,6 +309,15 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
>>           return 1;
>>       }
>>
>> +#ifdef DEBUG_MMU
>> +    if (base_addr & MAKE_64BIT_MASK(0, nls + 3)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +            "%s: misaligned page dir base: 0x%"VADDR_PRIx
>> +            " page dir size: 0x%"PRIx64"\n",
>> +            __func__, base_addr, BIT(nls + 3));
>> +    }
>> +#endif
>> +
>>       index = eaddr >> (*psize - nls);    /* Shift */
>>       index &= ((1UL << nls) - 1);       /* Mask */
>>       *pte_addr = base_addr + (index * sizeof(pde));


