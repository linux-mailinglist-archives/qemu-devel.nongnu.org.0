Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CE6F3D3C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 08:15:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptjH7-0000ZR-48; Tue, 02 May 2023 02:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptjGy-0000Xf-Ow; Tue, 02 May 2023 02:14:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptjGu-0007Kv-Hd; Tue, 02 May 2023 02:14:00 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34268LUr031222; Tue, 2 May 2023 06:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ITTIhoK7C6GiTnrDw/rJ/ku1BHLuiMccb+2dIbkZOdY=;
 b=VzbuTrNiqmg5d0UNT1gfRhdh3OWLILuvB+OKOj1hjbOHAuyJGjsLtaSoFqJgCS59Ipm3
 Fz3lpR/tq08W1sZYMnd1uU8dMbAok+dz0La5kw4RZjt8adLH8FH3y4vKciYneNcmA9YB
 F9Kr4XL/FogVLB1Ms3mYqwJllgPA1TPWykRgqKS0d7Jq8Yh0UzGf4nhS3slm88l75N61
 /v0lAQiv0vIdFVBm/cgSHEMe5pY1LXiD/N3qF8I/PPPkKXwtgGRn4xFeLeihQiC6cdZm
 qtGymz9yLAM9PmR6t21JTWpV4HTQI4rj+CzhpKeXbl/xZRlH1l1/DyhgRV4bWDF6kpiu Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qat7db7pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 06:13:50 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34268ntA000494;
 Tue, 2 May 2023 06:13:50 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qat7db7p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 06:13:50 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3422D1Zg002605;
 Tue, 2 May 2023 06:13:49 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv860kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 06:13:49 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3426Dmoc34668986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 May 2023 06:13:48 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D39458056;
 Tue,  2 May 2023 06:13:48 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C317D58067;
 Tue,  2 May 2023 06:13:43 +0000 (GMT)
Received: from [9.43.49.207] (unknown [9.43.49.207])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  2 May 2023 06:13:43 +0000 (GMT)
Message-ID: <a00bf0ea-94ce-e20b-f199-4ec3c776f458@linux.ibm.com>
Date: Tue, 2 May 2023 11:43:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] ppc: spapr: cleanup h_enter_nested() with helper
 routines.
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, danielhb413@gmail.com,
 Michael Neuling <mikey@neuling.org>
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-3-harshpb@linux.ibm.com>
 <CSBIRIKYBL78.3GGM8KZ1ERZUC@wheely>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSBIRIKYBL78.3GGM8KZ1ERZUC@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HZHiBeT2xNaGZOCFFWmo9x51TPxLWb2Y
X-Proofpoint-GUID: KrAX03MQbCemiPRYR5h-x-WSYjpo8R_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_02,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020052
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/2/23 10:19, Nicholas Piggin wrote:
> On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
>> h_enter_nested() currently does a lot of register specific operations
>> which should be abstracted logically to simplify the code for better
>> readability. This patch breaks down relevant blocks into respective
>> helper routines to make use of them for better readability/maintenance.
>>
>> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>> ---
>>   hw/ppc/spapr_hcall.c | 117 ++++++++++++++++++++++++++++---------------
>>   1 file changed, 78 insertions(+), 39 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 124cee5e53..f24d4b368e 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1544,6 +1544,81 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
>>       return H_FUNCTION;
>>   }
>>   
>> +static void restore_hdec_from_hvstate(CPUPPCState *dst,
>> +                                      struct kvmppc_hv_guest_state *hv_state,
>> +                                      target_ulong now)
>> +{
>> +    target_ulong hdec;
>> +
>> +    assert(hv_state);
>> +    hdec = hv_state->hdec_expiry - now;
>> +    cpu_ppc_hdecr_init(dst);
>> +    cpu_ppc_store_hdecr(dst, hdec);
>> +}
>> +
>> +static void restore_lpcr_from_hvstate(PowerPCCPU *cpu,
>> +                                      struct kvmppc_hv_guest_state *hv_state)
>> +{
>> +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>> +    CPUPPCState *dst = &cpu->env;
>> +    target_ulong lpcr, lpcr_mask;
>> +
>> +    assert(hv_state);
>> +    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
>> +    lpcr = (dst->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state->lpcr & lpcr_mask);
>> +    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
>> +    lpcr &= ~LPCR_LPES0;
>> +    dst->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
>> +}
>> +
>> +static void restore_env_from_ptregs(CPUPPCState *env,
>> +                                    struct kvmppc_pt_regs *regs)
>> +{
>> +    assert(env);
>> +    assert(regs);
>> +    assert(sizeof(env->gpr) == sizeof(regs->gpr));
>> +    memcpy(env->gpr, regs->gpr, sizeof(env->gpr));
>> +    env->nip = regs->nip;
>> +    env->msr = regs->msr;
>> +    env->lr = regs->link;
>> +    env->ctr = regs->ctr;
>> +    cpu_write_xer(env, regs->xer);
>> +    ppc_store_cr(env, regs->ccr);
>> +}
>> +
>> +static void restore_env_from_hvstate(CPUPPCState *env,
>> +                                     struct kvmppc_hv_guest_state *hv_state)
>> +{
>> +    assert(env);
>> +    assert(hv_state);
>> +    env->spr[SPR_HFSCR] = hv_state->hfscr;
>> +    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
>> +    env->cfar = hv_state->cfar;
>> +    env->spr[SPR_PCR] = hv_state->pcr;
>> +    env->spr[SPR_DPDES] = hv_state->dpdes;
>> +    env->spr[SPR_SRR0] = hv_state->srr0;
>> +    env->spr[SPR_SRR1] = hv_state->srr1;
>> +    env->spr[SPR_SPRG0] = hv_state->sprg[0];
>> +    env->spr[SPR_SPRG1] = hv_state->sprg[1];
>> +    env->spr[SPR_SPRG2] = hv_state->sprg[2];
>> +    env->spr[SPR_SPRG3] = hv_state->sprg[3];
>> +    env->spr[SPR_BOOKS_PID] = hv_state->pidr;
>> +    env->spr[SPR_PPR] = hv_state->ppr;
>> +}
>> +
>> +static inline void restore_l2_env(PowerPCCPU *cpu,
>> +		                  struct kvmppc_hv_guest_state *hv_state,
>> +				  struct kvmppc_pt_regs *regs,
>> +				  target_ulong now)
>> +{
>> +    CPUPPCState *env = &cpu->env;
>> +
>> +    restore_env_from_ptregs(env, regs);
>> +    restore_env_from_hvstate(env, hv_state);
>> +    restore_lpcr_from_hvstate(cpu, hv_state);
>> +    restore_hdec_from_hvstate(env, hv_state, now);
>> +}
>> +
>>   /*
>>    * When this handler returns, the environment is switched to the L2 guest
>>    * and TCG begins running that. spapr_exit_nested() performs the switch from
>> @@ -1554,14 +1629,12 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>                                      target_ulong opcode,
>>                                      target_ulong *args)
>>   {
>> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>>       CPUState *cs = CPU(cpu);
>>       CPUPPCState *env = &cpu->env;
>>       SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>>       target_ulong hv_ptr = args[0];
>>       target_ulong regs_ptr = args[1];
>> -    target_ulong hdec, now = cpu_ppc_load_tbl(env);
>> -    target_ulong lpcr, lpcr_mask;
>> +    target_ulong now = cpu_ppc_load_tbl(env);
>>       struct kvmppc_hv_guest_state *hvstate;
>>       struct kvmppc_hv_guest_state hv_state;
>>       struct kvmppc_pt_regs *regs;
>> @@ -1607,49 +1680,15 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>           return H_P2;
>>       }
>>   
>> -    len = sizeof(env->gpr);
>> -    assert(len == sizeof(regs->gpr));
>> -    memcpy(env->gpr, regs->gpr, len);
>> -
>> -    env->lr = regs->link;
>> -    env->ctr = regs->ctr;
>> -    cpu_write_xer(env, regs->xer);
>> -    ppc_store_cr(env, regs->ccr);
>> -
>> -    env->msr = regs->msr;
>> -    env->nip = regs->nip;
>> +    /* restore L2 env from hv_state and ptregs */
>> +    restore_l2_env(cpu, &hv_state, regs, now);
>>   
>>       address_space_unmap(CPU(cpu)->as, regs, len, len, false);
> 
> I don't agree this improves readability. It also does more with the
> guest address space mapped, which may not be a big deal is strictly
> not an improvement.
> 
> The comment needn't just repeat what the function says, and it does
> not actually restore the l2 environment. It sets some registers to
> L2 values, but it also leaves other state.
> 
> I would like to see this in a larger series if it's going somewhere,
> but at the moment I'd rather leave it as is.
> 
While I agree the routine could be named restore_l2_hvstate_ptregs() as 
more appropriate, I think it still makes sense to have the body of 
enter/exit routines with as minimum LOC as possible, with the help of 
minimum helper routines possible. Giving semantics to the set of 
operations related to ptregs/hvstate register load/store is the first 
step towards it.

As you have guessed, this is certainly a precursor to another API 
version that we have been working on (still a WIP), and helps isolating 
the code flows for backward compatibiility. Having such changes early 
upstream helps stablising changes which are not a really a API/design 
change.

regards,
Harsh

> Thanks,
> Nick

