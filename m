Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9F86F3D69
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 08:27:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptjST-00052I-Ta; Tue, 02 May 2023 02:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptjSE-00051o-UZ; Tue, 02 May 2023 02:25:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptjS9-0003FC-Eg; Tue, 02 May 2023 02:25:38 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3426P6t0021193; Tue, 2 May 2023 06:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+gX9vU70R0RuxmeHgcEKu8gWbAnzRAZGQ5QCZw3dyao=;
 b=futkk0ip0MQc4d+CLIxZHVR8gc+lC5mlttE9qIgG2gyUfCnBvTVKVn84xSXeFU2pg+DZ
 YqLN/w2dgq4Er60W5X1HkFI0nM1eVz9IBwpysyLRsIWHZ0x3PDokywn5pd7utt0b/MEW
 +fTg+7X9o/24xBqzhByc3ISWZzE5Sty0sG1/y53lYHer3RXFey/fj0pFQUBDoDmZkKH+
 WC6issxaUm8Dt7ofwIXuMngeBL5GoO8gK9vN2mSMb4YdoOYTY7L8Av0M0jLNgSAxXPOP
 wR6eibdmwaAp+tpTmE5i5DhrXY/gyCt6ejNnxjTlcyufPHYeBORYB9VsFs1LItMBeqLE CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qauus9s74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 06:25:26 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3426OHJT019123;
 Tue, 2 May 2023 06:25:25 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qauus9s3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 06:25:25 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3426K3NT006800;
 Tue, 2 May 2023 06:25:17 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3q8tv81h0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 06:25:17 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3426PGhb28705116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 May 2023 06:25:16 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5825D58052;
 Tue,  2 May 2023 06:25:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D05258056;
 Tue,  2 May 2023 06:25:11 +0000 (GMT)
Received: from [9.43.49.207] (unknown [9.43.49.207])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  2 May 2023 06:25:11 +0000 (GMT)
Message-ID: <5e99a0c9-c2e4-23dd-705a-bf87de775ea5@linux.ibm.com>
Date: Tue, 2 May 2023 11:55:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] ppc: spapr: cleanup spapr_exit_nested() with
 helper routines.
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, danielhb413@gmail.com,
 Michael Neuling <mikey@neuling.org>
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-4-harshpb@linux.ibm.com>
 <CSBJ4MJFZLA3.HEJL52LKZCF7@wheely>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSBJ4MJFZLA3.HEJL52LKZCF7@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6E7a_K2dOCpHkI_yMquPPMFkqR2eUfvQ
X-Proofpoint-ORIG-GUID: 2FwcuFqqdl7xDlmczl8ZGtYv3PIN-UoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_02,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Hi Nick,

On 5/2/23 10:36, Nicholas Piggin wrote:
> On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
>> Currently, in spapr_exit_nested(), it does a lot of register state
>> restoring from ptregs/hvstate after mapping each of those before
>> restoring the L1 host state. This patch breaks down those set of ops
>> to respective helper routines for better code readability/maintenance.
>>
>> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>> ---
>>   hw/ppc/spapr_hcall.c | 120 ++++++++++++++++++++++++++-----------------
>>   1 file changed, 72 insertions(+), 48 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index f24d4b368e..e69634bc22 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1719,45 +1719,14 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>       return env->gpr[3];
>>   }
>>   
>> -void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>> +static void restore_hvstate_from_env(struct kvmppc_hv_guest_state *hvstate,
>> +                                     CPUPPCState *env, int excp)
>>   {
>> -    CPUState *cs = CPU(cpu);
>> -    CPUPPCState *env = &cpu->env;
>> -    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>> -    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
>> -    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
>> -    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
>> -    struct kvmppc_hv_guest_state *hvstate;
>> -    struct kvmppc_pt_regs *regs;
>> -    hwaddr len;
>> -
>> -    assert(spapr_cpu->in_nested);
>> -
>> -    cpu_ppc_hdecr_exit(env);
>> -
>> -    len = sizeof(*hvstate);
>> -    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
>> -                                MEMTXATTRS_UNSPECIFIED);
>> -    if (len != sizeof(*hvstate)) {
>> -        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
>> -        r3_return = H_PARAMETER;
>> -        goto out_restore_l1;
>> -    }
>> -
>>       hvstate->cfar = env->cfar;
>>       hvstate->lpcr = env->spr[SPR_LPCR];
>>       hvstate->pcr = env->spr[SPR_PCR];
>>       hvstate->dpdes = env->spr[SPR_DPDES];
>>       hvstate->hfscr = env->spr[SPR_HFSCR];
>> -
>> -    if (excp == POWERPC_EXCP_HDSI) {
>> -        hvstate->hdar = env->spr[SPR_HDAR];
>> -        hvstate->hdsisr = env->spr[SPR_HDSISR];
>> -        hvstate->asdr = env->spr[SPR_ASDR];
>> -    } else if (excp == POWERPC_EXCP_HISI) {
>> -        hvstate->asdr = env->spr[SPR_ASDR];
>> -    }
>> -
>>       /* HEIR should be implemented for HV mode and saved here. */
>>       hvstate->srr0 = env->spr[SPR_SRR0];
>>       hvstate->srr1 = env->spr[SPR_SRR1];
>> @@ -1768,27 +1737,43 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>>       hvstate->pidr = env->spr[SPR_BOOKS_PID];
>>       hvstate->ppr = env->spr[SPR_PPR];
>>   
>> -    /* Is it okay to specify write length larger than actual data written? */
>> -    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
>> +    if (excp == POWERPC_EXCP_HDSI) {
>> +        hvstate->hdar = env->spr[SPR_HDAR];
>> +        hvstate->hdsisr = env->spr[SPR_HDSISR];
>> +        hvstate->asdr = env->spr[SPR_ASDR];
>> +    } else if (excp == POWERPC_EXCP_HISI) {
>> +        hvstate->asdr = env->spr[SPR_ASDR];
>> +    }
>> +}
>>   
>> -    len = sizeof(*regs);
>> -    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
>> +static int map_and_restore_l2_hvstate(PowerPCCPU *cpu, int excp, target_ulong *r3)
>> +{
>> +    CPUPPCState *env = &cpu->env;
>> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>> +    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
>> +    struct kvmppc_hv_guest_state *hvstate;
>> +    hwaddr len = sizeof(*hvstate);
>> +
>> +    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
>>                                   MEMTXATTRS_UNSPECIFIED);
>> -    if (!regs || len != sizeof(*regs)) {
>> -        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
>> -        r3_return = H_P2;
>> -        goto out_restore_l1;
>> +    if (len != sizeof(*hvstate)) {
>> +        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
>> +        *r3 = H_PARAMETER;
>> +        return -1;
>>       }
>> +    restore_hvstate_from_env(hvstate, env, excp);
>> +    /* Is it okay to specify write length larger than actual data written? */
>> +    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
>> +    return 0;
>> +}
>>   
>> +static void restore_ptregs_from_env(struct kvmppc_pt_regs *regs,
>> +                                    CPUPPCState *env, int excp)
>> +{
>> +    hwaddr len;
>>       len = sizeof(env->gpr);
>>       assert(len == sizeof(regs->gpr));
>>       memcpy(regs->gpr, env->gpr, len);
>> -
>> -    regs->link = env->lr;
>> -    regs->ctr = env->ctr;
>> -    regs->xer = cpu_read_xer(env);
>> -    regs->ccr = ppc_get_cr(env);
>> -
>>       if (excp == POWERPC_EXCP_MCHECK ||
>>           excp == POWERPC_EXCP_RESET ||
>>           excp == POWERPC_EXCP_SYSCALL) {
>> @@ -1798,11 +1783,50 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>>           regs->nip = env->spr[SPR_HSRR0];
>>           regs->msr = env->spr[SPR_HSRR1] & env->msr_mask;
>>       }
>> +    regs->link = env->lr;
>> +    regs->ctr = env->ctr;
>> +    regs->xer = cpu_read_xer(env);
>> +    regs->ccr = ppc_get_cr(env);
>> +}
>>   
>> +static int map_and_restore_l2_ptregs(PowerPCCPU *cpu, int excp, target_ulong *r3)
>> +{
>> +    CPUPPCState *env = &cpu->env;
>> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>> +    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
>> +    hwaddr len;
>> +    struct kvmppc_pt_regs *regs = NULL;
>> +
>> +    len = sizeof(*regs);
>> +    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
>> +                             MEMTXATTRS_UNSPECIFIED);
>> +    if (!regs || len != sizeof(*regs)) {
>> +        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
>> +        *r3 = H_P2;
>> +        return -1;
>> +    }
>> +    restore_ptregs_from_env(regs, env, excp);
>>       /* Is it okay to specify write length larger than actual data written? */
>>       address_space_unmap(CPU(cpu)->as, regs, len, len, true);
>> +    return 0;
>> +}
>> +
>> +void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>> +{
>> +    CPUState *cs = CPU(cpu);
>> +    CPUPPCState *env = &cpu->env;
>> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>> +    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
>> +
>> +    assert(spapr_cpu->in_nested);
>> +
>> +    cpu_ppc_hdecr_exit(env);
>> +
>> +   if (!map_and_restore_l2_hvstate(cpu, excp, &r3_return)) {
>> +       map_and_restore_l2_ptregs (cpu, excp, &r3_return);
>> +   }
> 
> Same for this one really. Enter/exit nested *is* entirely about
> switching from L1 to L2 environment and back so I'm not seeing
> where the abstraction is. Just seems more clunky to me.
> 
> Abstracting the hcall, error checking, address space mapping and
> copying etc into one function and the state switch itself into
> another I could see, but that's now spread across the new functions.
> 
> So, not sure about this. I think I'd have to see if it was a
> precursor to a larger series.
> 
I have responded on your similar comment on 2/4 patch trying to clarify 
the motivation behind these changes. Hope it gives you a different 
perspective about the motivation behind this change. Let me know if you 
still think otherwise or any further patch improvements if needed.

regards,
Harsh

> Thanks,
> Nick

