Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2FE370056
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:17:33 +0200 (CEST)
Received: from localhost ([::1]:59966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXhk-0004jU-Nc
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lcXT2-0006yd-4n; Fri, 30 Apr 2021 14:02:20 -0400
Received: from [201.28.113.2] (port=55913 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lcXT0-0001ms-5W; Fri, 30 Apr 2021 14:02:19 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 15:02:13 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 491AD8013C2;
 Fri, 30 Apr 2021 15:02:13 -0300 (-03)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <0ed61faa-327c-68a9-d449-541a6a9f3224@eldorado.org.br>
 <b1c975ec-d698-e055-3166-68f8bdf4fbee@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <34531538-03a7-1fd7-c80b-439a2822e0be@eldorado.org.br>
Date: Fri, 30 Apr 2021 15:02:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b1c975ec-d698-e055-3166-68f8bdf4fbee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Apr 2021 18:02:13.0769 (UTC)
 FILETIME=[F2E89790:01D73DEA]
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/2021 11:31, Richard Henderson wrote:
> On 4/30/21 7:05 AM, Matheus K. Ferst wrote:
>>> +ADDI            000001 10 0--.-- ..................     \
>>> +                001110 ..... ..... ................     @PLS_D
>>
>> I'm not sure about this. It's a bit surprising to find ADDI here, and 
>> the comment that explains why is likely to be ignored after the big 
>> copyright header.
> 
> You could move the comment closer, and replicate, e.g.
> 
> ADDI .... \
>       .... @PLS_D # PADDI
> 
> 

If we keep this naming, IMHO moving the comment closer looks better.

>> I'd prefer to keep a trans_PADDI like
>>
>>  > static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
>>  > {
>>  >     if(!resolve_PLS_D(ctx, a)) {
>>  >         return false;
>>  >     }
>>  >     return trans_ADDI(ctx, a);
>>  > }
> 
> But in this case ADDI probably doesn't use PLS_D.  You could use
> 
> static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
> {
>      arg_D d;
>      if (!resolve_PLS_D(ctx, &d, a)) {
>          return false;
>      }
>      return trans_ADDI(ctx, &d);
> }
> 
> making sure to use int64_t in the offset for arg_D.
> 

We'd keep trans_ADDI with the same signature to avoid creating an arg_D 
on the stack. Patch 4 added type specification, maybe we can define an 
arg_D within arg_PLD_D? I'll play a bit to see if it works.

>> It's the middle way between v2 and v3. trans_ADDI code is reused, 
>> it'll probably be optimized as a tail call, and resolve_PLS_D is not 
>> called when it's not needed.
> 
> My version won't tail-call, because of the escaping local storage, but I 
> don't see how you can avoid it.
> 
> 
> r~

I haven't been able to test it properly yet, but at least on godbolt it 
seems that the compiler prefers to inline over tail call, so maybe 
that's not a problem.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

