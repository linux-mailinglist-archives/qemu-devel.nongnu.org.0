Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BAF4864F6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:09:49 +0100 (CET)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SWa-0006RD-Dg
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5SSE-0004LR-Ot
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:05:20 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:36979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5SSC-0005kJ-Sn
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:05:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.31])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8BCEED5F5F8C;
 Thu,  6 Jan 2022 14:05:11 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 14:05:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00561356933-d5dd-40aa-8e70-a7b9e862d6a5,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0be0b54a-e9fd-ac35-1c73-b840d8f34093@kaod.org>
Date: Thu, 6 Jan 2022 14:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 4/7] target/ppc: Add HV support to
 ppc_interrupts_little_endian
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-5-farosas@linux.ibm.com> <YdZ+YtvZSUhkFvR/@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YdZ+YtvZSUhkFvR/@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d6b02731-cc80-4559-b6c4-d7ed6b0fd80d
X-Ovh-Tracer-Id: 16791389737060567846
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 06:30, David Gibson wrote:
> On Wed, Jan 05, 2022 at 05:40:26PM -0300, Fabiano Rosas wrote:
>> The ppc_interrupts_little_endian function could be used for interrupts
>> delivered in Hypervisor mode, so add support for powernv8 and powernv9
>> to it.
>>
>> Also drop the comment because it is inaccurate, all CPUs that can run
>> little endian can have interrupts in little endian. The point is
>> whether they can take interrupts in an endianness different from
>> MSR_LE.
>>
>> This change has no functional impact.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> With one nit you might want to look at later:
> 
>> ---
>>   target/ppc/arch_dump.c   |  2 +-
>>   target/ppc/cpu.h         | 23 +++++++++++++++--------
>>   target/ppc/excp_helper.c |  2 +-
>>   3 files changed, 17 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
>> index bb392f6d88..12cde198a3 100644
>> --- a/target/ppc/arch_dump.c
>> +++ b/target/ppc/arch_dump.c
>> @@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>>       info->d_machine = PPC_ELF_MACHINE;
>>       info->d_class = ELFCLASS;
>>   
>> -    if (ppc_interrupts_little_endian(cpu)) {
>> +    if (ppc_interrupts_little_endian(cpu, false)) {
> 
> I'm wondering if using hv==false here is actually correct, and AFAICT
> it probably is for spapr, but not for powernv.  So I'm wondering if we
> should actually test cpu->vhyp here to get the right value for powernv
> as well.

yes. 'cpu->vhyp' or 'env->has_hv_mode' or 'env->msr_mask & MSR_HVB'

The use of 'env->msr_mask & MSR_HVB' would need a cleanup. env->has_hv_mode
is equivalent. May be a helper to rule them both would be better.

Thanks,

C.

> 
>>           info->d_endian = ELFDATA2LSB;
>>       } else {
>>           info->d_endian = ELFDATA2MSB;
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index f20d4ffa6d..a6fc857ad4 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -2728,20 +2728,27 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
>>       return cpu->env.spr_cb[spr].name != NULL;
>>   }
>>   
>> -static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
>> +#if !defined(CONFIG_USER_ONLY)
>> +static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
>>   {
>>       PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>> +    CPUPPCState *env = &cpu->env;
>> +    bool ile = false;
>>   
>> -    /*
>> -     * Only models that have an LPCR and know about LPCR_ILE can do little
>> -     * endian.
>> -     */
>> -    if (pcc->lpcr_mask & LPCR_ILE) {
>> -        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
>> +    if (hv && env->has_hv_mode) {
>> +        if (is_isa300(pcc)) {
>> +            ile = !!(env->spr[SPR_HID0] & HID0_POWER9_HILE);
>> +        } else {
>> +            ile = !!(env->spr[SPR_HID0] & HID0_HILE);
>> +        }
>> +
>> +    } else if (pcc->lpcr_mask & LPCR_ILE) {
>> +        ile = !!(env->spr[SPR_LPCR] & LPCR_ILE);
>>       }
>>   
>> -    return false;
>> +    return ile;
>>   }
>> +#endif
>>   
>>   void dump_mmu(CPUPPCState *env);
>>   
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index fa41f8048d..92953af896 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1071,7 +1071,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
>>        */
>>       msr = (1ULL << MSR_ME);
>>       msr |= env->msr & (1ULL << MSR_SF);
>> -    if (ppc_interrupts_little_endian(cpu)) {
>> +    if (ppc_interrupts_little_endian(cpu, false)) {
>>           msr |= (1ULL << MSR_LE);
>>       }
>>   
> 


