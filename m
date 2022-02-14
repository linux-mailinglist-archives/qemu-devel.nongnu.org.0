Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7204B595A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:08:19 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJflp-00049P-V8
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJfjS-0002VC-Cp
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:05:50 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJfjP-0006qk-Dq
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:05:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E4911DFBC1CA;
 Mon, 14 Feb 2022 19:05:44 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 19:05:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0042fd94cbf-1827-4e11-908f-91ec9800fc8d,
 3F8FAC6032C90551F7B41E5AE7007684BF5B5D24) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9494ba98-1d7c-8641-285b-c7fee3ec38d1@kaod.org>
Date: Mon, 14 Feb 2022 19:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] spapr: prevent hdec timer being set up under virtual
 hypervisor
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220214123116.1546406-1-npiggin@gmail.com>
 <87mtitlgk2.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87mtitlgk2.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b8e07a10-af7d-4d3f-bddd-09f8b6cd294a
X-Ovh-Tracer-Id: 11094617683904203744
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 14:32, Fabiano Rosas wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> 
>> The spapr virtual hypervisor does not require the hdecr timer.
> 
> Why is that? Is this not needed for an emulated powernv running KVM
> guests?

It is now also running in the QEMU pseries machine (L0) when a
nested is running. That's part of the implementation Nick did for
the KVM-on-pseries-in-QEMU-TCG.

But isn't that redundant with the cpu_ppc_hdecr_init() and
cpu_ppc_hdecr_exit() from the RFC ? and shouldn't that be
created only once, when the first nested is started or when
the machine is if cap-nested-hv=on ?

>> Remove it.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   hw/ppc/ppc.c            | 2 +-
>>   hw/ppc/spapr_cpu_core.c | 6 +++---
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index 462c87dba8..a7c262db93 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -1072,7 +1072,7 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>>       }
>>       /* Create new timer */
>>       tb_env->decr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_decr_cb, cpu);
>> -    if (env->has_hv_mode) {
>> +    if (env->has_hv_mode && !cpu->vhyp) {

hmm, Can we have (env->has_hv_mode && cpu->vhyp) ?  this is confusing :/

Thanks,

C.


>>           tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
>>                                                   cpu);
>>       } else {
>> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
>> index a781e97f8d..ed84713960 100644
>> --- a/hw/ppc/spapr_cpu_core.c
>> +++ b/hw/ppc/spapr_cpu_core.c
>> @@ -261,12 +261,12 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>           return false;
>>       }
>>   
>> -    /* Set time-base frequency to 512 MHz */
>> -    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
>> -
>>       cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
>>       kvmppc_set_papr(cpu);
>>   
>> +    /* Set time-base frequency to 512 MHz. vhyp must be set first. */
>> +    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
>> +
>>       if (spapr_irq_cpu_intc_create(spapr, cpu, errp) < 0) {
>>           qdev_unrealize(DEVICE(cpu));
>>           return false;
> 


