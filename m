Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A244525F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:42:26 +0100 (CET)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mib8T-0005ZC-92
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mib3g-0004dM-Ac; Thu, 04 Nov 2021 07:37:28 -0400
Received: from [201.28.113.2] (port=18950 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mib3d-0007Mk-UK; Thu, 04 Nov 2021 07:37:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 08:37:21 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 50BDB800BA7;
 Thu,  4 Nov 2021 08:37:21 -0300 (-03)
Subject: Re: [PATCH v2 07/34] target/ppc: Implement cntlzdm
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-8-matheus.ferst@eldorado.org.br>
 <65bd3052-fbe9-33ff-585c-b5259ebd46e0@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <b9532756-da5d-f584-a4d3-ab0923b092a7@eldorado.org.br>
Date: Thu, 4 Nov 2021 08:37:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <65bd3052-fbe9-33ff-585c-b5259ebd46e0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 11:37:21.0687 (UTC)
 FILETIME=[549D8270:01D7D170]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/10/2021 18:17, Richard Henderson wrote:
> On 10/29/21 1:23 PM, matheus.ferst@eldorado.org.br wrote:
>> From: Luis Pires <luis.pires@eldorado.org.br>
>>
>> Implement the following PowerISA v3.1 instruction:
>> cntlzdm: Count Leading Zeros Doubleword Under Bit Mask
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>> v2:
>> - Inline implementation of cntlzdm
>> ---
>>   target/ppc/insn32.decode                   |  1 +
>>   target/ppc/translate/fixedpoint-impl.c.inc | 36 ++++++++++++++++++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>> index 9cb9fc00b8..221cb00dd6 100644
>> --- a/target/ppc/insn32.decode
>> +++ b/target/ppc/insn32.decode
>> @@ -203,6 +203,7 @@ ADDPCIS         010011 ..... ..... .......... 
>> 00010 .   @DX
>>   ## Fixed-Point Logical Instructions
>>
>>   CFUGED          011111 ..... ..... ..... 0011011100 -   @X
>> +CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
>>
>>   ### Float-Point Load Instructions
>>
>> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc 
>> b/target/ppc/translate/fixedpoint-impl.c.inc
>> index 0d9c6e0996..c9e9ae35df 100644
>> --- a/target/ppc/translate/fixedpoint-impl.c.inc
>> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
>> @@ -413,3 +413,39 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X 
>> *a)
>>   #endif
>>       return true;
>>   }
>> +
>> +#if defined(TARGET_PPC64)
>> +static void do_cntlzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask)
>> +{
>> +    TCGv_i64 tmp;
>> +    TCGLabel *l1;
>> +
>> +    tmp = tcg_temp_local_new_i64();
>> +    l1 = gen_new_label();
>> +
>> +    tcg_gen_and_i64(tmp, src, mask);
>> +    tcg_gen_clzi_i64(tmp, tmp, 64);
>> +
>> +    tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, l1);
>> +
>> +    tcg_gen_subfi_i64(tmp, 64, tmp);
>> +    tcg_gen_shr_i64(tmp, mask, tmp);
>> +    tcg_gen_ctpop_i64(tmp, tmp);
>> +
>> +    gen_set_label(l1);
>> +
>> +    tcg_gen_mov_i64(dst, tmp);
> 
> This works, but a form without brcond would be better (due to how poorly 
> tcg handles basic
> blocks).
> 

I should've tried a little harder to get rid of this branch...

> How about
> 
>      tcg_gen_clzi_i64(tmp, tmp, 0);
> 
>      tcg_gen_xori_i64(tmp, tmp, 63);
>      tcg_gen_shr_i64(tmp, mask, tmp);
>      tcg_gen_shri_i64(tmp, tmp, 1);
> 
>      tcg_gen_ctpop_i64(dst, tmp);
> 
> The middle 3 operations perform a shift between [1-64], such that we are 
> assured of 0 for 64.

When src & mask == 0 we shouldn't shift mask (or shift it zero bits), so 
I guess we can't have this shri. Maybe something like

tcg_gen_and_i64(t0, src, mask);
tcg_gen_clzi_i64(t0, t0, -1);

tcg_gen_setcondi_i64(TCG_COND_NE, t1, t0, -1);
tcg_gen_andi_i64(t0, t0, 63);
tcg_gen_xori_i64(t0, t0, 63);

tcg_gen_shr_i64(t0, mask, t0);
tcg_gen_shr_i64(t0, t0, t1);

tcg_gen_ctpop_i64(dst, t0);

So we still shift 63+1 bits when there are no leading zeros and shift 0 
bits when it's all zeros.

> 
> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

