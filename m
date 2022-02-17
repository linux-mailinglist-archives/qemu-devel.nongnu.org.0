Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442BE4BA6D3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:16:31 +0100 (CET)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkOM-0003j1-Bk
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:16:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKkJi-00084E-F4
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:11:42 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:37627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKkJf-0001nv-Am
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:11:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C48731FEAB;
 Thu, 17 Feb 2022 17:11:36 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 18:11:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029ca04ba0-43bf-42f2-a338-75ebd498d7e7,
 6074F5EAC11FD030A47E229993F36105E76D55A4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ee674ccc-105d-cab3-b30c-267d5d0964c7@kaod.org>
Date: Thu, 17 Feb 2022 18:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 9/9] spapr: implement nested-hv capability for the
 virtual hypervisor
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220216102545.1808018-1-npiggin@gmail.com>
 <20220216102545.1808018-10-npiggin@gmail.com>
 <e8c5834c-22bc-a33d-832e-566284d1daeb@kaod.org>
 <1645011231.6p1nag6ali.astroid@bobo.none>
 <1645014400.s86cqubb0a.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1645014400.s86cqubb0a.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 188b4c85-696e-4d86-b910-71d1b6638d05
X-Ovh-Tracer-Id: 9351724629484538787
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkedvgfduveekfeekledtjeetkedvgeffgeduteegtedtffejfeehkeeflefftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 13:30, Nicholas Piggin wrote:
> Excerpts from Nicholas Piggin's message of February 16, 2022 9:38 pm:
>> Excerpts from Cédric Le Goater's message of February 16, 2022 8:52 pm:
>>> On 2/16/22 11:25, Nicholas Piggin wrote:
>>>> This implements the Nested KVM HV hcall API for spapr under TCG.
>>>>
>>>> The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
>>>> L1 is switched back in returned from the hcall when a HV exception
>>>> is sent to the vhyp. Register state is copied in and out according to
>>>> the nested KVM HV hcall API specification.
>>>>
>>>> The hdecr timer is started when the L2 is switched in, and it provides
>>>> the HDEC / 0x980 return to L1.
>>>>
>>>> The MMU re-uses the bare metal radix 2-level page table walker by
>>>> using the get_pate method to point the MMU to the nested partition
>>>> table entry. MMU faults due to partition scope errors raise HV
>>>> exceptions and accordingly are routed back to the L1.
>>>>
>>>> The MMU does not tag translations for the L1 (direct) vs L2 (nested)
>>>> guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
>>>> and exit).>
>>>> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> Some last comments below,
>>
>> [...]
>>
>>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>>> index edbf3eeed0..852fe61b36 100644
>>>> --- a/include/hw/ppc/spapr.h
>>>> +++ b/include/hw/ppc/spapr.h
>>>> @@ -199,6 +199,9 @@ struct SpaprMachineState {
>>>>        bool has_graphics;
>>>>        uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
>>>>    
>>>> +    /* Nested HV support (TCG only) */
>>>> +    uint64_t nested_ptcr;
>>>> +
>>>
>>> this is new state to migrate.
>>>
>>
>> [...]
>>
>>>> +/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
>>>> +struct kvmppc_pt_regs {
>>>> +    uint64_t gpr[32];
>>>> +    uint64_t nip;
>>>> +    uint64_t msr;
>>>> +    uint64_t orig_gpr3;    /* Used for restarting system calls */
>>>> +    uint64_t ctr;
>>>> +    uint64_t link;
>>>> +    uint64_t xer;
>>>> +    uint64_t ccr;
>>>> +    uint64_t softe;        /* Soft enabled/disabled */
>>>> +    uint64_t trap;         /* Reason for being here */
>>>> +    uint64_t dar;          /* Fault registers */
>>>> +    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
>>>> +    uint64_t result;       /* Result of a system call */
>>>> +};
>>>
>>> I think we need to start moving all the spapr hcall definitions under
>>> spapr_hcall.h. It can come later.
>>
>> Sure.
>>
>> [...]
>>
>>>> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
>>>> index dab3dfc76c..b560514560 100644
>>>> --- a/include/hw/ppc/spapr_cpu_core.h
>>>> +++ b/include/hw/ppc/spapr_cpu_core.h
>>>> @@ -48,6 +48,11 @@ typedef struct SpaprCpuState {
>>>>        bool prod; /* not migrated, only used to improve dispatch latencies */
>>>>        struct ICPState *icp;
>>>>        struct XiveTCTX *tctx;
>>>> +
>>>> +    /* Fields for nested-HV support */
>>>> +    bool in_nested; /* true while the L2 is executing */
>>>> +    CPUPPCState *nested_host_state; /* holds the L1 state while L2 executes */
>>>> +    int64_t nested_tb_offset; /* L1->L2 TB offset */
>>>
>>> This needs a new vmstate.
>>
>> How about instead of the vmstate (we would need all the L1 state in
>> nested_host_state as well), we just add a migration blocker in the
>> L2 entry path. We could limit the max hdecr to say 1 second to
>> ensure it unblocks before long.
>>
>> I know migration blockers are not preferred but in this case it gives
>> us some iterations to debug and optimise first, which might change
>> the data to migrate.
> 
> This should be roughly the incremental patch to do this.

I think we can merge without it.

Adding support shouldn't be too complex and TCG migration of an L1
running L2 is not the most important feature today. It would be
better to have something clean (blocker if incomplete or a decent
support) before the 7.0 is released though

However, there is an issue with TCG migration and it has been there
for a while :

https://lore.kernel.org/qemu-devel/fb2e56cc-15d1-65ee-9d9c-64223483ed01@kaod.org/

Thanks,

C.

