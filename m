Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443B49EE2A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 23:40:54 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDRk-0000jF-Ba
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 17:40:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDDO6-0007Jn-9u; Thu, 27 Jan 2022 17:37:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:12703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDDO4-0002wT-0S; Thu, 27 Jan 2022 17:37:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8E925746397;
 Thu, 27 Jan 2022 23:37:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6EBBB746396; Thu, 27 Jan 2022 23:37:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6DDC8746369;
 Thu, 27 Jan 2022 23:37:00 +0100 (CET)
Date: Thu, 27 Jan 2022 23:37:00 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 8/8] target/ppc: 74xx: Set SRRs directly in exception
 code
In-Reply-To: <f93bbb9-82d4-6437-ca29-6413fe4a7375@eik.bme.hu>
Message-ID: <4439c3c-ec5-a021-c3ea-94385241fdd@eik.bme.hu>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
 <20220127201116.1154733-9-farosas@linux.ibm.com>
 <f93bbb9-82d4-6437-ca29-6413fe4a7375@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022, BALATON Zoltan wrote:
> On Thu, 27 Jan 2022, Fabiano Rosas wrote:
>> The 74xx does not have alternate/hypervisor Save and Restore
>> Registers, so we can set SRR0 and SRR1 directly.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>> target/ppc/excp_helper.c | 13 ++-----------
>> 1 file changed, 2 insertions(+), 11 deletions(-)
>> 
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index b7921c0956..4e6bb87b70 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -556,7 +556,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int 
>> excp)
>>     CPUState *cs = CPU(cpu);
>>     CPUPPCState *env = &cpu->env;
>>     target_ulong msr, new_msr, vector;
>> -    int srr0, srr1;
>>
>>     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
>>         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>> @@ -575,10 +574,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int 
>> excp)
>>      */
>>     new_msr = env->msr & ((target_ulong)1 << MSR_ME);
>> 
>> -    /* target registers */
>> -    srr0 = SPR_SRR0;
>> -    srr1 = SPR_SRR1;
>> -
>>     /*
>>      * Hypervisor emulation assistance interrupt only exists on server
>>      * arch 2.05 server or later.
>> @@ -731,10 +726,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int 
>> excp)
>>             cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
>>                       "no HV support\n", excp);
>>         }
>
> If we have ho MSR_HVB why is this still here? Shouldn't it have been gone in 
> patch 2? Or is this still reachable?

Additionally if it's still needed then the two ifs could be collapsed into 
one with && now that the other branch below is removed.

Regards,
BALATON Zoltan
>
>> -        if (srr0 == SPR_HSRR0) {
>> -            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
>> -                      "no HV support\n", excp);
>> -        }
>>     }
>>
>>     /*
>> @@ -746,10 +737,10 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int 
>> excp)
>>     }
>>
>>     /* Save PC */
>> -    env->spr[srr0] = env->nip;
>> +    env->spr[SPR_SRR0] = env->nip;
>>
>>     /* Save MSR */
>> -    env->spr[srr1] = msr;
>> +    env->spr[SPR_SRR1] = msr;
>>
>>     powerpc_set_excp_state(cpu, vector, new_msr);
>> }
>> 
>
>

