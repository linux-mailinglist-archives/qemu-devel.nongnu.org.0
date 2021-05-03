Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06616371546
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:33:51 +0200 (CEST)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXlm-0003rI-0V
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ldXgG-00028A-Rx; Mon, 03 May 2021 08:28:09 -0400
Received: from [201.28.113.2] (port=6491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ldXgD-0007Qg-PI; Mon, 03 May 2021 08:28:08 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 3 May 2021 09:28:01 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 471B480134C;
 Mon,  3 May 2021 09:28:01 -0300 (-03)
Subject: Re: [PATCH v3 27/30] target/ppc: Move D/DS/X-form integer loads to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-28-richard.henderson@linaro.org>
 <a954c823-55e6-d5e1-f694-3f5b06da6d80@eldorado.org.br>
 <0f3766df-15c1-1ae7-eb40-a9fed6a89165@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <b1407eaf-81e7-7b04-3ecf-e8cdb5a02777@eldorado.org.br>
Date: Mon, 3 May 2021 09:28:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0f3766df-15c1-1ae7-eb40-a9fed6a89165@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2021 12:28:01.0670 (UTC)
 FILETIME=[C22A5A60:01D74017]
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

On 30/04/2021 21:50, Richard Henderson wrote:
> On 4/30/21 4:54 PM, Matheus K. Ferst wrote:
>> The only difference between those two is 
>> tcg_gen_addi_tl/tcg_gen_movi_tl and tcg_gen_add_tl/tcg_gen_mov_tl. We 
>> could do this in a single method if we tcg_const_tl(a->si) in 
>> do_ldst_D. I'm not sure about the costs involved, and we'd need to 
>> tcg_temp_free it. If you want to give it a look, I did some tests on 
>> https://github.com/ppc64/qemu/tree/ferst-tcg-decodetree64 .
> 
> I guess it works, but it feels ugly with the comparison vs cpu_gpr[0].  
> Maybe pass in rt and ra as integers, and only pass in rb/si as TCGv addend?
> 

I tried that first and it looked just as weird, but if you prefer I'll 
change it back. We could also hide the ugliness in a helper e.g. bool 
gpr_is_zero(TCGv).

> The upper-case argument names clash with docs/devel/style.rst.
> 

Good call, I'll fix this before push this branch again;

> You can use tcg_constant_tl() to grab a hashed constant that need not be 
> freed.
>

Then we could

 > return do_ldst(ctx, cpu_gpr[a->rt], 
a->ra?cpu->gpr[a->ra]:tcg_const_tl(0), ...

At the cost of always calling tcg_gen_add_tl and repeating the RA=0 
logic in do_ldst_X and do_ldst_D.

> BTW, I thought I had a comment about PLS being used for both MLS and 
> 8LS.  I guess that must have gotten lost at some point.  If you go with 
> your renaming to MLS, you'll want a different comment about PLD et al.
> 
> 
> r~

Don't mind that, it was a bad idea, I gave up on this change while 
rebasing v3.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

