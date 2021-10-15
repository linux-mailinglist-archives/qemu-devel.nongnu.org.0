Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0D042F671
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 17:00:00 +0200 (CEST)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOgh-0000my-7k
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mbObu-0004qm-75; Fri, 15 Oct 2021 10:55:02 -0400
Received: from [201.28.113.2] (port=46667 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mbObs-0006h6-5m; Fri, 15 Oct 2021 10:55:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 15 Oct 2021 11:54:56 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id DEB0C8014D6;
 Fri, 15 Oct 2021 11:54:55 -0300 (-03)
Subject: Re: [PATCH 1/4] linux-user/ppc: Fix XER access in
 save/restore_user_regs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
 <08fb20b9-4784-4dfe-2bdd-7abeae8d6a4c@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <7925af5a-e8c4-0574-c131-4e86e8a0252c@eldorado.org.br>
Date: Fri, 15 Oct 2021 11:54:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <08fb20b9-4784-4dfe-2bdd-7abeae8d6a4c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Oct 2021 14:54:56.0355 (UTC)
 FILETIME=[9E494B30:01D7C1D4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: laurent@vivier.eu, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/2021 20:43, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 10/14/21 3:32 PM, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> We should use cpu_read_xer/cpu_write_xer to save/restore the complete
>> register since some of its bits are in other fields of CPUPPCState. A
>> test is added to prevent future regressions.
>>
>> Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   linux-user/ppc/signal.c                     |  9 +++--
>>   tests/tcg/ppc64/Makefile.target             |  2 +
>>   tests/tcg/ppc64le/Makefile.target           |  2 +
>>   tests/tcg/ppc64le/signal_save_restore_xer.c | 42 +++++++++++++++++++++
>>   4 files changed, 52 insertions(+), 3 deletions(-)
>>   create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c
> 
> The code is good so,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +    sigaction(SIGILL, &sa, NULL);
>> +
>> +    asm("mtspr 1, %1\n\t"
>> +        ".long 0x0\n\t"
> 
> While Appendix B does guarantee that "0" is and always will be an 
> invalid instruction, I
> wonder if the test itself would be clearer (i.e. self-documenting the 
> intent) using
> SIGTRAP and "trap".
> 
> 
> r~

It would be better, but cpu_loop is currently calling cpu_abort for 
POWERPC_EXCP_TRAP, so the test would fail. I'll see if I can fix that in 
another patch, and then we can change the test to use trap.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

