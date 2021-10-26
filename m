Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E943B46A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:38:30 +0200 (CEST)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNat-0003zO-Uw
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfNWv-0000hK-Dh; Tue, 26 Oct 2021 10:34:23 -0400
Received: from [201.28.113.2] (port=6421 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfNWs-00038m-0X; Tue, 26 Oct 2021 10:34:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 26 Oct 2021 11:33:10 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 25A1480012A;
 Tue, 26 Oct 2021 11:33:10 -0300 (-03)
Subject: Re: [PATCH 07/33] target/ppc: Implement cntlzdm
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-8-matheus.ferst@eldorado.org.br>
 <b46ddf0b-d8fa-ab15-4f6f-aa8a24ff7e45@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <f6b312b9-7d07-c07b-de3e-1f8b72d37c50@eldorado.org.br>
Date: Tue, 26 Oct 2021 11:33:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b46ddf0b-d8fa-ab15-4f6f-aa8a24ff7e45@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Oct 2021 14:33:10.0623 (UTC)
 FILETIME=[668DA6F0:01D7CA76]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_40=-0.001, NICE_REPLY_A=-0.215,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/2021 20:16, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
>> +uint64_t helper_CNTLZDM(uint64_t src, uint64_t mask)
>> +{
>> +    uint64_t sel_bit, count = 0;
>> +
>> +    while (mask != 0) {
>> +        sel_bit = 0x8000000000000000ULL >> clz64(mask);
>> +
>> +        if (src & sel_bit) {
>> +            break;
>> +        }
> 
> We need to count how many mask are set left of mask & src.
> How about
> 
>      sh = clz64(src & mask);
>      if (sh == 0) {
>          return 0;
>      }
>      return ctpop64(mask >> (64 - sh));
> 
> which could probably be implemented inline relatively easy.
> 

Thanks for this suggestion Richard, we'll try to inline it.

>> +static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
>> +{
>> +    REQUIRE_64BIT(ctx);
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>> +#if defined(TARGET_PPC64)
>> +    gen_helper_CNTLZDM(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
>> +#else
>> +    qemu_build_not_reached();
>> +#endif
>> +    return true;
>> +}
> 
> Why the ifdef here?  Oh, I see. You could just use target_long in the 
> helper to avoid
> that.  And if not, you should move the helper into an ifdef too.
> 

That's the same case of cfuged. There is a vector version of this 
instruction (vclzdm) that is not 64-bits only (at least on paper), so it 
should receive i64 and cannot be inside an ifdef(TARGET_PPC64). I'll add 
this info to the commit message.

If we dismiss the possibility of a future 32-bits implementation of 
PowerISA v3.1, we can move the helper inside the ifdef and add 
REQUIRE_64BITS in vclzdm/vctzdm (and vcfuged, vpdepd, vpextd, etc.)

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

