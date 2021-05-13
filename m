Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C200B37F815
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:38:57 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAcC-0000yS-MW
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lhAOQ-0004Nr-9h; Thu, 13 May 2021 08:24:42 -0400
Received: from [201.28.113.2] (port=58078 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lhAOL-0003Pa-9T; Thu, 13 May 2021 08:24:38 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 13 May 2021 09:24:33 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 13AE880139F;
 Thu, 13 May 2021 09:24:33 -0300 (-03)
Subject: Re: [PATCH v4 29/31] target/ppc: Implement cfuged instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-30-matheus.ferst@eldorado.org.br>
 <49b2a677-a3cc-b944-dd4d-edd115c81039@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <60f639cf-50e6-d967-a24b-a862b5a9e8fd@eldorado.org.br>
Date: Thu, 13 May 2021 09:24:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <49b2a677-a3cc-b944-dd4d-edd115c81039@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 May 2021 12:24:33.0429 (UTC)
 FILETIME=[EE2CCC50:01D747F2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/2021 08:31, Richard Henderson wrote:
> On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
>> +    while (i) {
>> +        n = ctz64(mask);
>> +        if (n > i) {
>> +            n = i;
>> +        }
>> +
>> +        m = (1ll << n) - 1;
>> +        if (bit) {
>> +            right = ror64(right | (src & m), n);
>> +        } else {
>> +            left = ror64(left | (src & m), n);
>> +        }
>> +
>> +        src >>= n;
>> +        mask >>= n;
>> +        i -= n;
>> +        bit = !bit;
>> +        mask = ~mask;
>> +    }
>> +
>> +    if (bit) {
>> +        n = ctpop64(mask);
>> +    } else {
>> +        n = 64 - ctpop64(mask);
>> +    }
>> +
>> +    return left | (right >> n);
>> +}
> 
> This doesn't correspond to the algorithm presented in the manual.  Thus 
> this requires lots of extra commentary.
> 
> I guess I see how you're trying to process blocks at a time, instead of 
> single bits at a time.  But I don't think the merging of data into 
> "right" and "left" looks right.  I would have expected
> 
>      right = (right << n) | (src & m);
> 
> and similarly for left.
> 
> It doesn't look like that the ctpop at the end is correct, given how 
> mask has been modified.  I would have thought that
> 
>      n = ctpop64(orig_mask);
>      return (left << n) | right;
> 
> would be the correct answer.
> 
> I could be wrong about the above, but that's what the missing commentary 
> should have helped me understand.
> 

It sure worth more comments. Yes, the idea is to process in blocks, and 
we negate the mask to avoid deciding between ctz and cto inside the 
loop. We use rotate instead of shift so it don't change the number of 
zeros and ones, and then we don't need orig_mask.

You'll find my test cases for cfuged and vcfuged on 
https://github.com/PPC64/qemu/blob/ferst-tcg-cfuged/tests/tcg/ppc64le/ . 
I got the same results by running them with this implementation and with 
the Power10 Functional Simulator.

>> +static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
>> +{
>> +    REQUIRE_64BIT(ctx);
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>> +#if defined(TARGET_PPC64)
>> +    gen_helper_cfuged(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
>> +#else
>> +    gen_invalid(ctx);
>> +#endif
>> +    return true;
>> +}
> 
> Given that this helper will also be used by vcfuged, there's no point in 
> hiding it in a TARGET_PPC64 block, and thus you can drop the ifdefs.
> 
> 
> r~
> 

If I remove it, the build for ppc will fail, because cpu_gpr is declared 
as TCGv, and the helper uses i64 to match {get,set}_cpu_vsr{l,h}. 
REQUIRE_64BIT makes the helper call unreachable for ppc, but it's a 
runtime check. At build time, the compiler will check the types anyway, 
and give us an error.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

