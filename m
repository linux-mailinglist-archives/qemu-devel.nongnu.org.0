Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49635752A6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:22:00 +0200 (CEST)
Received: from localhost ([::1]:46184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1bD-0005xX-JE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oC1X5-00011q-NE; Thu, 14 Jul 2022 12:17:44 -0400
Received: from [200.168.210.66] (port=45564 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oC1X3-0007oE-9B; Thu, 14 Jul 2022 12:17:43 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 14 Jul 2022 13:17:33 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 2FFA7800186;
 Thu, 14 Jul 2022 13:17:33 -0300 (-03)
Message-ID: <03b9bcde-4bde-a7e0-b86a-e1bdb366db12@eldorado.org.br>
Date: Thu, 14 Jul 2022 13:17:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] target/ppc: check tb_env != 0 before printing
 TBU/TBL/DECR
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20220713183847.41797-1-matheus.ferst@eldorado.org.br>
 <07a90f40-6ece-57aa-cbe7-15b9e8c37203@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <07a90f40-6ece-57aa-cbe7-15b9e8c37203@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Jul 2022 16:17:33.0444 (UTC)
 FILETIME=[394D0C40:01D8979D]
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

On 14/07/2022 10:35, Daniel Henrique Barboza wrote:
> On 7/13/22 15:38, Matheus Ferst wrote:
>> When using "-machine none", env->tb_env is not allocated, causing the
>> segmentation fault reported in issue #85 (launchpad bug #811683). To
>> avoid this problem, check if the pointer != NULL before calling the
>> methods to print TBU/TBL/DECR.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>> v2:
>>   - Added checks in monitor_get_decr, monitor_get_tbu, and 
>> monitor_get_tbl.
>>   - Link to v1: 
>> https://lists.gnu.org/archive/html/qemu-ppc/2022-07/msg00173.html
>> ---
>>   target/ppc/cpu_init.c | 16 ++++++++--------
>>   target/ppc/monitor.c  |  9 +++++++++
>>   2 files changed, 17 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 86ad28466a..7e96baac9f 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -7476,18 +7476,18 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, 
>> int flags)
>>                    "%08x iidx %d didx %d\n",
>>                    env->msr, env->spr[SPR_HID0], env->hflags,
>>                    cpu_mmu_index(env, true), cpu_mmu_index(env, false));
>> -#if !defined(NO_TIMER_DUMP)
> 
> Why did you remove the NO_TIMER_DUMP check? Is it redundant with the 
> env->tb_env
> check?
> 

This is the only reference to this macro since it was added in 
d9bce9d99f46. I suppose it was manually defined, but the only 
discussion[1] I could find around this patch doesn't mention it. I don't 
see any other reason to define it other than avoiding segfaults in 
machines that don't allocate env_tb, but we can keep it if you prefer.

>> -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>> +    if (env->tb_env) {
>> +        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>>   #if !defined(CONFIG_USER_ONLY)
>> -                 " DECR " TARGET_FMT_lu
>> +                     " DECR " TARGET_FMT_lu
>>   #endif
>> -                 "\n",
>> -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>> +                     "\n",
>> +                     cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>>   #if !defined(CONFIG_USER_ONLY)
>> -                 , cpu_ppc_load_decr(env)
>> -#endif
>> -        );
>> +                     , cpu_ppc_load_decr(env)
>>   #endif
>> +            );
>> +    }
> 
> Not really a problem with your patch, but since you're changing this 
> code, can
> you please cleanse it from evil? I mean, look at this:
> 
> 
>      if (env->tb_env) {
>          qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> #if !defined(CONFIG_USER_ONLY)
>                       " DECR " TARGET_FMT_lu
> #endif
>                       "\n",
>                       cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> #if !defined(CONFIG_USER_ONLY)
>                       , cpu_ppc_load_decr(env)
> #endif
>              );
>      }
> 
> 
> 2 ifdef macros in the middle of qemu_fprintf() params? With one line 
> starting
> with a ', '?  Why are we trading sanity for 3 lines of code repetition?
> 
> We can --at least-- do something like this:
> 
>      if (env->tb_env) {
> #if !defined(CONFIG_USER_ONLY)
>          qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>                       " DECR " TARGET_FMT_lu
>                       "\n",
>                       cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env),
>                       cpu_ppc_load_decr(env));
> #else
>          qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>                       "\n",
>                       cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env));
> #endif
>      }
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 

Sure, I'll change that in v3.

[1] https://lists.gnu.org/archive/html/qemu-devel/2007-03/msg00239.html

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

