Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82C37F728
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:49:33 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9qO-0008Jp-Qi
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lh9l4-000682-6W; Thu, 13 May 2021 07:44:02 -0400
Received: from [201.28.113.2] (port=33430 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lh9l2-0004YS-Bd; Thu, 13 May 2021 07:44:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 13 May 2021 08:43:56 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D73A280139F;
 Thu, 13 May 2021 08:43:55 -0300 (-03)
Subject: Re: [PATCH v4 28/31] target/ppc: Implement setbc/setbcr/stnbc/setnbcr
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-29-matheus.ferst@eldorado.org.br>
 <cdee71b3-12fc-cdc2-f9ac-a132789b698a@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <271e1e13-478a-2a9c-958a-793ea6f2b3a5@eldorado.org.br>
Date: Thu, 13 May 2021 08:43:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cdee71b3-12fc-cdc2-f9ac-a132789b698a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 May 2021 11:43:56.0274 (UTC)
 FILETIME=[41847520:01D747ED]
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

On 13/05/2021 08:01, Richard Henderson wrote:
> On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
>> +static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool 
>> neg, bool rev)
>> +{
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>> +    uint32_t mask = 0x08 >> (a->bi & 0x03);
>> +    TCGv temp = tcg_temp_new();
>> +
>> +    tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
>> +    tcg_gen_andi_tl(temp, temp, mask);
>> +    tcg_gen_movcond_tl(a->r?TCG_COND_EQ:TCG_COND_NE, cpu_gpr[a->rt], 
>> temp,
>> +                       tcg_constant_tl(0), tcg_constant_tl(a->n?-1:1),
>> +                       tcg_constant_tl(0));
> 
> Mind the spacing around ?:.
> 

Fixed.

> Did you forget to update a->r and a->n to "neg" and "rev"?
> It sure looks like this doesn't compile...
> 

I messed up when rebasing, the change is in the next patch. I'll fix 
that too.

> I guess this is fine with movcond, but perhaps slightly better with
> 
>    tcg_gen_setcondi_tl(cond, rt, temp, 0);
>    if (neg) {
>      tcg_gen_neg_tl(rt, rt);
>    }
> 
> TCG isn't the most optimizing of compilers...
> 
> 
> r~

And also looks cleaner, I'll apply that too.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

