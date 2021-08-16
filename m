Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13473ED3D5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 14:20:13 +0200 (CEST)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFbbA-0000vJ-GT
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 08:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFbYB-0008AI-QB; Mon, 16 Aug 2021 08:17:07 -0400
Received: from [201.28.113.2] (port=20811 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFbYA-0001Np-0J; Mon, 16 Aug 2021 08:17:07 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 16 Aug 2021 09:17:01 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D276F801091;
 Mon, 16 Aug 2021 09:17:00 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: fix vector registers access in gdbstub
 for little-endian
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210812191007.70331-1-matheus.ferst@eldorado.org.br>
 <7b8530e0-4dc8-ea7f-3cac-e6ae623e6770@linaro.org>
 <CAFEAcA8=auwb6vjPZqoem4vYoVUecbgsxSXjwZGPzDhQOkLqhQ@mail.gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <c4955d12-df60-e5bc-6a56-8ef91beef700@eldorado.org.br>
Date: Mon, 16 Aug 2021 09:17:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=auwb6vjPZqoem4vYoVUecbgsxSXjwZGPzDhQOkLqhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Aug 2021 12:17:01.0257 (UTC)
 FILETIME=[9DE71390:01D79298]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.71,
 PDS_HP_HELO_NORDNS=0.825, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/08/2021 06:17, Peter Maydell wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On Thu, 12 Aug 2021 at 21:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/12/21 9:10 AM, matheus.ferst@eldorado.org.br wrote:
>>>    static bool avr_need_swap(CPUPPCState *env)
>>>    {
>>> +    bool le;
>>> +#if defined(CONFIG_USER_ONLY)
>>> +    le = false;
>>> +#else
>>> +    le = msr_le;
>>> +#endif
>>
>> It certainly doesn't seem like the right fix.
>>
>> My first guess was that MSR_LE wasn't being properly set up at cpu_reset for user-only,
>> but it's there.
> 
> This code is confusing because there are multiple possible swaps happening:
> 
> (1) gdb_get_regl() and friends assume they are passed a host-endian value
> and will tswap to get a value of TARGET_WORDS_BIGENDIAN endianness.
> (For the other direction, ldl_p() et al do target-endian accesses.)
> (2) for ppc softmmu, TARGET_WORDS_BIGENDIAN is always true, and so
> if the CPU is in LE mode then the ppc gdbstub code needs to swap
> (ppc_maybe_bswap_register() does this)
> (3) for ppc usermode, TARGET_WORDS_BIGENDIAN matches the actual binary's
> ordering, so the gdb_get_regl() etc swap is always correct and sufficient
> and ppc_maybe_bswap_register() does nothing
> (4) the data affected by this avr_need_swap() function is the 128
> bit registers, and it has to do with whether we consider the two
> 64-bit halves as (high, low) or (low, high). (The swapping or not
> of each 64-bit half is done with the same steps 1 2 3 above as for a
> 64-bit value.)
> 

Thanks for this explanation, I think I can better understand the problem 
now.

> I haven't yet worked through the 128 bit case -- I'd need to look at
> whether we store the AVR data in the CPU struct as a pair of uint64
> host-order values (Arm does this, it's always index 0 is lo, 1 is hi
> regardless of host endianness) or really as a host-order 128 bit integer.

I believe it's the latter. Looking at vsr64_offset in target/ppc/cpu.h, 
VsrD macro is used to determine the index of the high element, and the 
definition of this macro depends on HOST_WORDS_BIGENDIAN.

> But I think the code is pretty confusing, and to make it a bit less
> so it would be useful to:
>   * unify the "do we need to do an extra swap" logic that is currently
> split between avr_need_swap() and ppc_maybe_bswap_register() (assuming
> that the answer is really the same for both cases, of course...)

I think we can remove avr_need_swap and handle everything in 
ppc_maybe_bswap_register. I'll provide another patch with this approach.

>   * look at whether there is a nicer way to handle the 128 bit
> register case than "byteswap the two 64-bit halves and then decide
> which order to use them in"

We could use bswap128 from int128.h and something else to handle the 
!CONFIG_INT128 case.

>   * write a good explanatory comment...
> 
> -- PMM
> 

IIUC, usermode doesn't need any swap, and system does. What puzzles me 
is that the original commit (ea499e71506) mentions that the 64-bit 
elements need to be reordered "for both system and user mode". But that 
was in 2016, so maybe things have changed since then.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

