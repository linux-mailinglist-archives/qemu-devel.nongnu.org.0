Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58694A9D0F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:38:21 +0100 (CET)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1bI-0007LC-HE
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:38:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nG1ZJ-0005Ew-JT; Fri, 04 Feb 2022 11:36:19 -0500
Received: from [2001:738:2001:2001::2001] (port=46691 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nG1ZA-0007ua-TC; Fri, 04 Feb 2022 11:36:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 48A0C745708;
 Fri,  4 Feb 2022 17:36:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 278AB745706; Fri,  4 Feb 2022 17:36:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 25BFE7456E3;
 Fri,  4 Feb 2022 17:36:03 +0100 (CET)
Date: Fri, 4 Feb 2022 17:36:03 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 10/11] target/ppc: 6xx: Software TLB exceptions cleanup
In-Reply-To: <87tude8wio.fsf@linux.ibm.com>
Message-ID: <6a2ee4e9-54d3-2ace-1a28-8f59ecaf761@eik.bme.hu>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
 <20220203200957.1434641-11-farosas@linux.ibm.com>
 <4bb49bac-12a7-b3ae-e719-e257366d15d5@eik.bme.hu>
 <87tude8wio.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022, Fabiano Rosas wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
>> On Thu, 3 Feb 2022, Fabiano Rosas wrote:
>>> This code applies only to the 6xx CPUs, so we can remove the switch
>>> statement.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>> ---
>>> target/ppc/excp_helper.c | 31 +++++++++++--------------------
>>> 1 file changed, 11 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index 538905c4dd..80168355bd 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -553,7 +553,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>>> {
>>>     CPUState *cs = CPU(cpu);
>>>     CPUPPCState *env = &cpu->env;
>>> -    int excp_model = env->excp_model;
>>>     target_ulong msr, new_msr, vector;
>>>     int srr0, srr1;
>>>
>>> @@ -695,26 +694,18 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>>>     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
>>>     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
>>>     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
>>> -        switch (excp_model) {
>>> -        case POWERPC_EXCP_6xx:
>>> -            /* Swap temporary saved registers with GPRs */
>>> -            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
>>> -                new_msr |= (target_ulong)1 << MSR_TGPR;
>>> -                hreg_swap_gpr_tgpr(env);
>>> -            }
>>> -            /* fall through */
>>> -        case POWERPC_EXCP_7x5:
>>> -            ppc_excp_debug_sw_tlb(env, excp);
>>> -
>>> -            msr |= env->crf[0] << 28;
>>> -            msr |= env->error_code; /* key, D/I, S/L bits */
>>> -            /* Set way using a LRU mechanism */
>>> -            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
>>> -            break;
>>> -        default:
>>> -            cpu_abort(cs, "Invalid TLB miss exception\n");
>>> -            break;
>>> +        /* Swap temporary saved registers with GPRs */
>>> +        if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
>>> +            new_msr |= (target_ulong)1 << MSR_TGPR;
>>> +            hreg_swap_gpr_tgpr(env);
>>
>> I get this one...
>>
>>>         }
>>> +
>>> +        ppc_excp_debug_sw_tlb(env, excp);
>>> +
>>> +        msr |= env->crf[0] << 28;
>>> +        msr |= env->error_code; /* key, D/I, S/L bits */
>>> +        /* Set way using a LRU mechanism */
>>> +        msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
>>
>> ...but not why this can be moved out from case or if. Is POWERPC_EXCP_7x5
>> the same as POWERPC_EXCP_6xx now?
>
> There is a fallthrough in the original code after the first block. So
> POWERPC_EXCP_6xx does the TGPR work and then falls through to the debug
> print and SRR1 setting.

Indeed, I've missed that.

Regards,
BALATON Zoltan

