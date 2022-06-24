Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C5559996
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:24:17 +0200 (CEST)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4iMB-0004Bc-SA
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4iJo-0003DX-Rj; Fri, 24 Jun 2022 08:21:48 -0400
Received: from [187.72.171.209] (port=23628 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4iJn-0007H0-3P; Fri, 24 Jun 2022 08:21:48 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 24 Jun 2022 09:20:41 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id D7ACF80031F;
 Fri, 24 Jun 2022 09:20:40 -0300 (-03)
Message-ID: <705975f7-ed9c-95d2-cd6d-f6a86b2c1a30@eldorado.org.br>
Date: Fri, 24 Jun 2022 09:20:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] target/ppc: Check page dir/table base alignment
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
 <20220620202704.78978-4-leandro.lupori@eldorado.org.br>
 <87edzhaet6.fsf@linux.ibm.com>
 <2c09284c-777a-2dc0-7bf6-52e1eb23b4bc@eldorado.org.br>
 <ee210642-b0ee-e584-4412-b50d3c66f71f@linaro.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <ee210642-b0ee-e584-4412-b50d3c66f71f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Jun 2022 12:20:41.0212 (UTC)
 FILETIME=[D1E38BC0:01D887C4]
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

On 6/23/22 18:34, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 6/23/22 07:26, Leandro Lupori wrote:
>> On 6/21/22 18:26, Fabiano Rosas wrote:
>>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
>>> possa confirmar o
>>> remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito 
>>> entre
>>> imediatamente em contato com o DTI.
>>>
>>> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
>>>
>>>> Check if each page dir/table base address is properly aligned and
>>>> log a guest error if not, as real hardware behave incorrectly in
>>>> this case.
>>>>
>>>> These checks are only performed when DEBUG_MMU is defined, to avoid
>>>> hurting the performance.
>>>>
>>>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>>> ---
>>>>   target/ppc/mmu-radix64.c | 21 +++++++++++++++++++++
>>>>   1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>>>> index 2f0bcbfe2e..80d945a7c3 100644
>>>> --- a/target/ppc/mmu-radix64.c
>>>> +++ b/target/ppc/mmu-radix64.c
>>>> @@ -28,6 +28,8 @@
>>>>   #include "mmu-radix64.h"
>>>>   #include "mmu-book3s-v3.h"
>>>>
>>>> +/* #define DEBUG_MMU */
>>>> +
>>>>   static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState 
>>>> *env,
>>>>                                                    vaddr eaddr,
>>>>                                                    uint64_t *lpid, 
>>>> uint64_t *pid)
>>>> @@ -277,6 +279,16 @@ static int ppc_radix64_next_level(AddressSpace 
>>>> *as, vaddr eaddr,
>>>>       if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
>>>>           ++*level;
>>>>           *nls = pde & R_PDE_NLS;
>>>> +
>>>> +#ifdef DEBUG_MMU
>>>> +        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
>>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
>>>> +                " page dir size: 0x%"PRIx64" level: %d\n",
>>>> +                __func__, (pde & R_PDE_NLB), BIT(*nls + 3), *level);
>>>> +        }
>>>> +#endif
>>>
>>> Maybe use qemu_log_enabled() instead of the define? I think it is a
>>> little more useful and has less chance to rot.
>>>
>>
>> Ok. I wanted to avoid introducing any extra overhead, but I guess just 
>> checking
>> qemu_log_enabled() should be ok.
> 
> No, qemu_log_enabled is *already* taken into account by qemu_log_mask.
> Just drop the ifdefs.
> 
> Do you in fact need to raise an exception here?
> 

Not in this case. I've tested it with KVM and it doesn't raise an 
exception. It seems to just ignore PDE_NLB's bits lower than nls + 3.

Thanks,
Leandro

> 
> r~


