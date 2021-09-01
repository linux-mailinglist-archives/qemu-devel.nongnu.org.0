Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059373FD9D1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:46:49 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPdf-0003e5-Pf
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mLPVM-0002PV-MT; Wed, 01 Sep 2021 08:38:13 -0400
Received: from [201.28.113.2] (port=39134 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mLPVK-0000cx-R4; Wed, 01 Sep 2021 08:38:12 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 1 Sep 2021 09:38:06 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1A40980131E;
 Wed,  1 Sep 2021 09:38:06 -0300 (-03)
Subject: Re: [PATCH v2 09/19] target/ppc: Implement DCFFIXQQ
To: Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-10-luis.pires@eldorado.org.br>
 <a8950469-9db5-b110-f1ef-1cb0b23a5ed6@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <59e621b7-1ad8-c6fe-31f2-c93f525dc9cf@eldorado.org.br>
Date: Wed, 1 Sep 2021 09:38:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a8950469-9db5-b110-f1ef-1cb0b23a5ed6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Sep 2021 12:38:06.0437 (UTC)
 FILETIME=[369E3950:01D79F2E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, NICE_REPLY_A=-1.029,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/08/2021 15:18, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você
>  possa confirmar o remetente e saber que o conteúdo é seguro. Em caso
> de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 8/31/21 9:39 AM, Luis Pires wrote:
>> +DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)
> 
> Shouldn't be upcase.  None of the others are.
> 

The reason for this change is on patch 13 and onwards. Matching the case 
of the instruction name in the trans_<INSN> method and the helper makes 
it easier to create macros, e.g. TRANS_DFP_BF_A_DCM on patch 13. The 
idea was to change the helpers as we moved instructions to decodetree.

Alternatively, the macro could receive the instruction name and the 
gen_helper_<INSN>, or we could drop this kind of macro usage in favor of 
something else. The former is a bit repetitive, while the latter would 
require more changes in the current code structure.

>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c index
>> 5489b4b6e0..c3739f7370 100644 --- a/target/ppc/translate.c +++
>> b/target/ppc/translate.c @@ -7422,7 +7422,12 @@ static inline void
>> set_avr64(int regno, TCGv_i64 src, bool high) /* * Helpers for
>> decodetree used by !function for decoding arguments. */ -static int
>> times_4(DisasContext *ctx, int x) +static inline int
>> times_2(DisasContext *ctx, int x) +{ +    return x * 2; +} + 
>> +static inline int times_4(DisasContext *ctx, int x)
> 
> Don't add the inlines. The compiler will decide for itself, and this
> hides unused function errors under gcc that are diagnosed by clang.
> 
> 
> r~
> 


-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

