Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128E54836AB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:16:47 +0100 (CET)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Rt0-0005Ay-2k
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n4RpM-0002ZD-9U; Mon, 03 Jan 2022 13:13:01 -0500
Received: from [201.28.113.2] (port=17134 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n4RpK-0007zs-KP; Mon, 03 Jan 2022 13:13:00 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 3 Jan 2022 15:12:55 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 30A218006BD;
 Mon,  3 Jan 2022 15:12:55 -0300 (-03)
Subject: Re: [PATCH 1/2] linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220103165625.307309-1-matheus.ferst@eldorado.org.br>
 <20220103165625.307309-2-matheus.ferst@eldorado.org.br>
 <8c606234-2939-e64e-d2d6-ae351e13fede@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <9fb0237b-d960-348f-f875-261f331d0cbc@eldorado.org.br>
Date: Mon, 3 Jan 2022 15:12:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8c606234-2939-e64e-d2d6-ae351e13fede@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jan 2022 18:12:55.0567 (UTC)
 FILETIME=[87E531F0:01D800CD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) NICE_REPLY_A=-3.354, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: laurent@vivier.eu, groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/01/2022 14:50, Richard Henderson wrote:
> On 1/3/22 8:56 AM, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
>> The si_code comes from do_program_check in the kernel source file
>> arch/powerpc/kernel/traps.c
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   linux-user/ppc/cpu_loop.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
>> index 30c82f2354..8fbaa772dc 100644
>> --- a/linux-user/ppc/cpu_loop.c
>> +++ b/linux-user/ppc/cpu_loop.c
>> @@ -242,7 +242,9 @@ void cpu_loop(CPUPPCState *env)
>>                   }
>>                   break;
>>               case POWERPC_EXCP_TRAP:
>> -                cpu_abort(cs, "Tried to call a TRAP\n");
>> +                info.si_signo = TARGET_SIGTRAP;
>> +                info.si_errno = 0;
>> +                info.si_code = TARGET_TRAP_BRKPT;
> 
> You're missing the address, which should be nip.
> 
> https://github.com/torvalds/linux/blob/master/arch/powerpc/kernel/traps.c#L1503 
> 

After this switch-case, there is a

info._sifields._sigfault._addr = env->nip;

Is there anything else to be set?

> 
> Please use force_sig_fault.  (I have a pending patch set to convert all 
> other instances;
> hopefully that can be merged soon...)
> 

I'll send v2 with a Based-on

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

