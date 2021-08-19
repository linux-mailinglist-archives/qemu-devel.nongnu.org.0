Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923393F20E8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:43:04 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnwN-0008IQ-LK
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mGntG-00052j-Fv; Thu, 19 Aug 2021 15:39:50 -0400
Received: from [201.28.113.2] (port=4611 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mGntE-0001E8-DQ; Thu, 19 Aug 2021 15:39:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 19 Aug 2021 16:39:43 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 7267580101D;
 Thu, 19 Aug 2021 16:39:43 -0300 (-03)
Subject: Re: [PATCH for-6.2 v2 2/2] target/ppc: fix vector registers access in
 gdbstub for little-endian
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
 <20210818110656.1993090-3-matheus.ferst@eldorado.org.br>
 <CAFEAcA89aPw5chrrzaV155Why0vjhN+BUQ7nfhz1_4EgcziBZw@mail.gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <f46a900b-c10c-b142-243c-58b0e0f22671@eldorado.org.br>
Date: Thu, 19 Aug 2021 16:39:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA89aPw5chrrzaV155Why0vjhN+BUQ7nfhz1_4EgcziBZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 Aug 2021 19:39:43.0856 (UTC)
 FILETIME=[F5AF4700:01D79531]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.591,
 PDS_HP_HELO_NORDNS=0.826, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/08/2021 09:42, Peter Maydell wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On Wed, 18 Aug 2021 at 12:11, <matheus.ferst@eldorado.org.br> wrote:
>>
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> As vector registers are stored in host endianness, we shouldn't swap its
>> 64-bit elements in user mode. Add a 16-byte case in
>> ppc_maybe_bswap_register to handle the reordering of elements in softmmu
>> and remove avr_need_swap which is now unused.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/gdbstub.c | 32 +++++++-------------------------
>>   1 file changed, 7 insertions(+), 25 deletions(-)
>>
>> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
>> index 09ff1328d4..011016edfa 100644
>> --- a/target/ppc/gdbstub.c
>> +++ b/target/ppc/gdbstub.c
>> @@ -101,6 +101,8 @@ void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
>>           bswap32s((uint32_t *)mem_buf);
>>       } else if (len == 8) {
>>           bswap64s((uint64_t *)mem_buf);
>> +    } else if (len == 16) {
>> +        bswap128s((Int128 *)mem_buf);
> 
> This cast looks dubious. Int128 is not necessarily a 128-bit value
> in host byte order: if !CONFIG_INT128 then an Int128 is defined as:
> struct Int128 {
>      uint64_t lo;
>      int64_t hi;
> };
> > with the low half always first.
> 
> So you can't cast your mem_buf* into an (Int128*) and then treat it
> like an Int128, I'm afraid.
> 

That's a good point. I think that it's not a problem in practice for 
this particular case because bswap128 will swap the struct members. Even 
if we get the high part in Int128.lo, it should give the correct result.

However, the code may be conceptually wrong. I'm probably breaking the 
intended API of int128.h by relying on how the struct is defined, 
instead of sticking to the provided int128_* methods. If someone 
reproduces this in another context, it'll likely give the wrong answer.

Maybe I should use int128_{make128,getlo,gethi} inside a #ifdef 
HOST_WORDS_BIGENDIAN. Not so brief, but probably less wrong.

> This also means that the "Int128 s128" field in the ppc_vsr_t union
> seems dubious -- how is that intended to work ?
> 

I'll look further into that. There are currently two uses of this 
member, one is just zeroing it, and the other is implementing the 
vextu[bhw][lr]x instructions.

> Maybe we should fix this by making the 'struct Int128' field order
> depend on HOST_WORDS_BIGENDIAN...
> 
> -- PMM
> 

I can make this change if you prefer, but I think I should change 
ppc_maybe_bswap_register to use int128_* methods anyway.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

