Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6DC4375E1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 13:16:27 +0200 (CEST)
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdsXC-00045q-1V
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 07:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mdsUH-0003FE-W8; Fri, 22 Oct 2021 07:13:27 -0400
Received: from [201.28.113.2] (port=54414 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mdsUE-0003FP-Pk; Fri, 22 Oct 2021 07:13:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 22 Oct 2021 08:13:16 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1CF8780045D;
 Fri, 22 Oct 2021 08:13:16 -0300 (-03)
Subject: Re: [PATCH 00/33] PowerISA v3.1 instruction batch
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <61bdf46b-438a-cc6f-322b-6ed746267df6@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <63da1767-430f-583d-0808-b7b3256ef768@eldorado.org.br>
Date: Fri, 22 Oct 2021 08:13:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <61bdf46b-438a-cc6f-322b-6ed746267df6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Oct 2021 11:13:16.0614 (UTC)
 FILETIME=[CFEA1E60:01D7C735]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_40=-0.001, NICE_REPLY_A=-1.742,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/2021 23:06, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
>>
>> This patch series implements 56 new instructions for POWER10, moving 28
>> "old" instructions to decodetree along the way. The series is divided by
>> facility as follows:
>>
>> - From patch 1 to 4: Floating-Point
>> - From patch 5 to 10: Fixed-Point
>> - From patch 11 to 19: Vector
>> - From patch 20 to 33: Vector-Scalar Extensions
>>
>> Based-on:<20210910112624.72748-1-luis.pires@eldorado.org.br>
>> because of patch 10 ("target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
>> translate.c") and patch 11 ("target/ppc: Introduce REQUIRE_FPU").
> 
> The prereqs no longer apply cleanly.  Do you have a branch you can 
> publish in the meantime?
> 
> 
> r~

I forgot to mention that it's also based on Gibson's ppc-for-6.2. The 
branch is available on
https://github.com/PPC64/qemu/tree/ppc-isa31-review

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

