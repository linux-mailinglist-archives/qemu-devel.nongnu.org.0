Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC247B325
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:47:44 +0100 (CET)
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNhH-0007WP-LX
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mzN4t-0001qI-P7; Mon, 20 Dec 2021 13:08:04 -0500
Received: from [201.28.113.2] (port=1927 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mzN4r-0001yl-Cx; Mon, 20 Dec 2021 13:08:03 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 20 Dec 2021 09:18:45 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTPS id 1B1028009F6;
 Mon, 20 Dec 2021 09:18:45 -0300 (-03)
Subject: Re: [PATCH] tests/tcg/ppc64le: remove INT128 requirement to run
 non_signalling_xscv
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211216140951.1183987-1-matheus.ferst@eldorado.org.br>
 <2e386a1a-17cd-1c04-4eab-480ecbae059f@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <493cf62e-2a80-08b4-1d0b-72b222a0bbd8@eldorado.org.br>
Date: Mon, 20 Dec 2021 09:18:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2e386a1a-17cd-1c04-4eab-480ecbae059f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Dec 2021 12:18:45.0442 (UTC)
 FILETIME=[BC0CF220:01D7F59B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 f4bug@amsat.org, clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2021 20:54, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 12/16/21 6:09 AM, matheus.ferst@eldorado.org.br wrote:
>> +        asm("mtvsrd 0, 
>> %3\n\t"                                          \
>> +            "xxswapd 0, 
>> 0\n\t"                                          \
>> +            "mtvsrd 0, 
>> %2\n\t"                                          \
> 
> This doesn't work.  The lower half of vs0 is undefined after mtvsrd.
> You actually want mtvsrdd 0, %2, %3, with "b" as the constraint for bh.
> 
>> +            "mfvsrd %0, 
>> 0\n\t"                                          \
>> +            "xxswapd 0, 
>> 0\n\t"                                          \
>> +            "mfvsrd %1, 
>> 0\n\t"                                          \
> 
> Drop the xxswapd and use mfvsrld.
> 
> Otherwise it looks ok.
> 
> 
> r~

I'd like to avoid mtvsrdd/mfvsrld because they were introduced in 
PowerISA v3.0, and xscvspdpn/xscvdpspn are from v2.07. How about

asm("mtvsrd 0, %2\n\t"
     "mtvsrd 1, %3\n\t"
     "xxmrghd 0, 0, 1\n\t"
     INSN " 0, 0\n\t"
     "mfvsrd %0, 0\n\t"
     "xxswapd 0, 0\n\t"
     "mfvsrd %1, 0\n\t"
     : "=r" (th), "=r" (tl)
     : "r" (bh), "r" (bl)
     : "vs0", "vs1");

?

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

