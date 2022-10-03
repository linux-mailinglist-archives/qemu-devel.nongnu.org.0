Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8221F5F330E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 18:03:28 +0200 (CEST)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofNug-0001Lh-NV
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 12:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNdj-0007Sv-Og; Mon, 03 Oct 2022 11:45:57 -0400
Received: from [200.168.210.66] (port=42785 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNdf-0003RP-MZ; Mon, 03 Oct 2022 11:45:54 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 3 Oct 2022 12:45:45 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 21A328002C5;
 Mon,  3 Oct 2022 12:45:45 -0300 (-03)
Message-ID: <b891d13a-fcdf-c182-4941-7ccfa4e2335d@eldorado.org.br>
Date: Mon, 3 Oct 2022 12:45:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v2 09/29] target/ppc: remove generic architecture
 checks from p9_deliver_interrupt
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-10-matheus.ferst@eldorado.org.br>
 <87r0zs688j.fsf@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <87r0zs688j.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 03 Oct 2022 15:45:45.0497 (UTC)
 FILETIME=[33893090:01D8D73F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2022 15:13, Fabiano Rosas wrote:
> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
> 
>> No functional change intended.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/excp_helper.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 603c956588..67e73f30ab 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1919,18 +1919,11 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
>>           break;
>>
>>       case PPC_INTERRUPT_DECR: /* Decrementer exception */
>> -        if (ppc_decr_clear_on_delivery(env)) {
>> -            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
>> -        }
> 
> Maybe I'm missing something, but this should continue to clear the bit,
> no? Same comment for P8.
> 

ppc_decr_clear_on_delivery returns true if (env->tb_env->flags & 
(PPC_DECR_UNDERFLOW_TRIGGERED | PPC_DECR_UNDERFLOW_LEVEL)) ==
PPC_DECR_UNDERFLOW_TRIGGERED, i.e., PPC_DECR_UNDERFLOW_TRIGGERED is set 
and PPC_DECR_UNDERFLOW_LEVEL is clear. All Book3S CPU have a level 
triggered interrupt, so the method return false.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

