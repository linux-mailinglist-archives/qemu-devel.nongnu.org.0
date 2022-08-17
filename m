Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47359702C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:52:55 +0200 (CEST)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJTY-0007Nt-II
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJK5-000754-Qt; Wed, 17 Aug 2022 09:43:06 -0400
Received: from [200.168.210.66] (port=18745 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJK1-0006Ek-6o; Wed, 17 Aug 2022 09:43:05 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 17 Aug 2022 10:42:59 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 0925B800134;
 Wed, 17 Aug 2022 10:42:59 -0300 (-03)
Message-ID: <32d1a66a-3c6b-b63f-af18-7a2134b6ad8f@eldorado.org.br>
Date: Wed, 17 Aug 2022 10:42:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 04/13] target/ppc: prepare to split
 ppc_interrupt_pending by excp_model
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-5-matheus.ferst@eldorado.org.br>
 <877d396ypr.fsf@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <877d396ypr.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 17 Aug 2022 13:42:59.0433 (UTC)
 FILETIME=[439AC590:01D8B23F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/08/2022 17:25, Fabiano Rosas wrote:
> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
> 
>> Rename the method to ppc_interrupt_pending_legacy and create a new
>> ppc_interrupt_pending that will call the appropriate interrupt masking
>> method based on env->excp_model.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/excp_helper.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 8690017c70..59981efd16 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1678,7 +1678,7 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>>       powerpc_excp(cpu, cs->exception_index);
>>   }
>>
>> -static int ppc_pending_interrupt(CPUPPCState *env)
>> +static int ppc_pending_interrupt_legacy(CPUPPCState *env)
> 
> Won't this code continue to be used for the older CPUs? If so, I don't
> think the term legacy is appropriate. It ends up being dependent on
> context and what people's definitions of "legacy" are.
> 
> (if this function is removed in a later patch, then that's ok).
> 

For this RFC, I created methods for CPUs that change the interrupt 
masking logic when cs->halted is set. If the way we split the 
interruption code in the following patches is acceptable, I'm planning 
to add methods for all CPUs and remove ppc_pending_interrupt_legacy in 
future versions of this patch series.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

