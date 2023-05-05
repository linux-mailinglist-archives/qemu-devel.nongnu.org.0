Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900F6F8134
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 13:05:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1putEa-0002va-Jd; Fri, 05 May 2023 07:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1putEX-0002nE-UG; Fri, 05 May 2023 07:04:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1putEV-00078n-Dk; Fri, 05 May 2023 07:04:17 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345Axctg018869; Fri, 5 May 2023 11:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rV8KeYcsS1aaXSLFK66+Lxh67qAPm4+Zi0ph+V2guHE=;
 b=COH1NLV7l9VeZVRt3F0ZDeOe8IFSPmGUyqNWoYjxb6xJzQ1gEtLHaO0PmERi2lMlDH+f
 gWL3Eo0Dhk9GOV/myE2Ik+ScadSDJ9Zouj6N9gf99ep2BXtRic/KILeNZdjiSIl7oZIQ
 4rCcvjN/o4Ex4XmM8I1KJ+mCNY5gDrVjMx9GhNE8HrUCH/VdWMG6+mQPNV2D90pN0CRF
 lWOkeNiUilNBURmPOd99MaDKXhMs2eWckVoXEDAgEy7BvJKwJyoHNEN3SZE+OdZ23oGC
 H+90K8U+NuX1jPjAbn/pEO73r3nZJEQi41bbi7PdnhCY7OqEMU+ecs207TqryG/uaFPt ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd0hd862d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 11:04:11 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 345B0J8n020685;
 Fri, 5 May 2023 11:04:05 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd0hd85my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 11:04:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34581b4W011839;
 Fri, 5 May 2023 11:03:57 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3q8tv8dsh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 11:03:57 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 345B3uIX57213224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 May 2023 11:03:56 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 114F958079;
 Fri,  5 May 2023 11:03:56 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9AFF5806C;
 Fri,  5 May 2023 11:03:51 +0000 (GMT)
Received: from [9.43.126.158] (unknown [9.43.126.158])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  5 May 2023 11:03:51 +0000 (GMT)
Message-ID: <1d0ce917-7ea0-35dd-b79f-5054ac81412b@linux.ibm.com>
Date: Fri, 5 May 2023 16:33:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 3/4] spapr: load and store l2 state with helper
 functions
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20230503003954.128188-1-npiggin@gmail.com>
 <20230503003954.128188-4-npiggin@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230503003954.128188-4-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v7Bb1mLXvI2R2J3EIXkhVnT__ai3ZLlG
X-Proofpoint-ORIG-GUID: QU1rWN9paizQ2wmM7Fp2tqefIJt4znse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050090
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

<correcting my email in CC>

On 5/3/23 06:09, Nicholas Piggin wrote:
> Arguably this is just shuffling around register accesses, but one nice
> thing it does is allow the exit to save away the L2 state then switch
> the environment to the L1 before copying L2 data back to the L1, which
> logically flows more naturally and simplifies the error paths.
> 
The supposed advantage you have mentioned is coming at the cost of 
double copy (env -> l2_state, switch to L1, l2_state -> hvstate/ptregs), 
but previously we were just doing a single copy that directly conveyed 
it to L1 before switching to L1. Additional copy means additional delay 
in transition of L1/L2. Not sure if it's worth it?

regards,
Harsh

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   hw/ppc/spapr_hcall.c | 178 +++++++++++++++++++++----------------------
>   1 file changed, 85 insertions(+), 93 deletions(-)
> 
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 6679150ac7..783a06ba98 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1675,9 +1675,9 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>                                      target_ulong *args)
>   {
>       PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> -    CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
>       SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> +    struct nested_ppc_state l2_state;
>       target_ulong hv_ptr = args[0];
>       target_ulong regs_ptr = args[1];
>       target_ulong hdec, now = cpu_ppc_load_tbl(env);
> @@ -1686,8 +1686,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>       struct kvmppc_hv_guest_state hv_state;
>       struct kvmppc_pt_regs *regs;
>       hwaddr len;
> -    uint64_t cr;
> -    int i;
>   
>       if (spapr->nested_ptcr == 0) {
>           return H_NOT_AVAILABLE;
> @@ -1713,6 +1711,10 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>           return H_PARAMETER;
>       }
>   
> +    if (hv_state.lpid == 0) {
> +        return H_PARAMETER;
> +    }
> +
>       spapr_cpu->nested_host_state = g_try_new(struct nested_ppc_state, 1);
>       if (!spapr_cpu->nested_host_state) {
>           return H_NO_MEM;
> @@ -1731,51 +1733,49 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>           return H_P2;
>       }
>   
> -    len = sizeof(env->gpr);
> +    len = sizeof(l2_state.gpr);
>       assert(len == sizeof(regs->gpr));
> -    memcpy(env->gpr, regs->gpr, len);
> +    memcpy(l2_state.gpr, regs->gpr, len);
>   
> -    env->lr = regs->link;
> -    env->ctr = regs->ctr;
> -    cpu_write_xer(env, regs->xer);
> -
> -    cr = regs->ccr;
> -    for (i = 7; i >= 0; i--) {
> -        env->crf[i] = cr & 15;
> -        cr >>= 4;
> -    }
> -
> -    env->msr = regs->msr;
> -    env->nip = regs->nip;
> +    l2_state.lr = regs->link;
> +    l2_state.ctr = regs->ctr;
> +    l2_state.xer = regs->xer;
> +    l2_state.cr = regs->ccr;
> +    l2_state.msr = regs->msr;
> +    l2_state.nip = regs->nip;
>   
>       address_space_unmap(CPU(cpu)->as, regs, len, len, false);
>   
> -    env->cfar = hv_state.cfar;
> -
> -    assert(env->spr[SPR_LPIDR] == 0);
> -    env->spr[SPR_LPIDR] = hv_state.lpid;
> +    l2_state.cfar = hv_state.cfar;
> +    l2_state.lpidr = hv_state.lpid;
>   
>       lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
>       lpcr = (env->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state.lpcr & lpcr_mask);
>       lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
>       lpcr &= ~LPCR_LPES0;
> -    env->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
> +    l2_state.lpcr = lpcr & pcc->lpcr_mask;
>   
> -    env->spr[SPR_PCR] = hv_state.pcr;
> +    l2_state.pcr = hv_state.pcr;
>       /* hv_state.amor is not used */
> -    env->spr[SPR_DPDES] = hv_state.dpdes;
> -    env->spr[SPR_HFSCR] = hv_state.hfscr;
> -    hdec = hv_state.hdec_expiry - now;
> +    l2_state.dpdes = hv_state.dpdes;
> +    l2_state.hfscr = hv_state.hfscr;
>       /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
> -    env->spr[SPR_SRR0] = hv_state.srr0;
> -    env->spr[SPR_SRR1] = hv_state.srr1;
> -    env->spr[SPR_SPRG0] = hv_state.sprg[0];
> -    env->spr[SPR_SPRG1] = hv_state.sprg[1];
> -    env->spr[SPR_SPRG2] = hv_state.sprg[2];
> -    env->spr[SPR_SPRG3] = hv_state.sprg[3];
> -    env->spr[SPR_BOOKS_PID] = hv_state.pidr;
> -    env->spr[SPR_PPR] = hv_state.ppr;
> +    l2_state.srr0 = hv_state.srr0;
> +    l2_state.srr1 = hv_state.srr1;
> +    l2_state.sprg0 = hv_state.sprg[0];
> +    l2_state.sprg1 = hv_state.sprg[1];
> +    l2_state.sprg2 = hv_state.sprg[2];
> +    l2_state.sprg3 = hv_state.sprg[3];
> +    l2_state.pidr = hv_state.pidr;
> +    l2_state.ppr = hv_state.ppr;
> +    l2_state.tb_offset = env->tb_env->tb_offset + hv_state.tb_offset;
>   
> +    /*
> +     * Switch to the nested guest environment and start the "hdec" timer.
> +     */
> +    nested_load_state(cpu, &l2_state);
> +
> +    hdec = hv_state.hdec_expiry - now;
>       cpu_ppc_hdecr_init(env);
>       cpu_ppc_store_hdecr(env, hdec);
>   
> @@ -1791,14 +1791,8 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>        * and it's not obviously worth a new data structure to do it.
>        */
>   
> -    env->tb_env->tb_offset += hv_state.tb_offset;
>       spapr_cpu->in_nested = true;
>   
> -    hreg_compute_hflags(env);
> -    ppc_maybe_interrupt(env);
> -    tlb_flush(cs);
> -    env->reserve_addr = -1; /* Reset the reservation */
> -
>       /*
>        * The spapr hcall helper sets env->gpr[3] to the return value, but at
>        * this point the L1 is not returning from the hcall but rather we
> @@ -1812,51 +1806,69 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>   {
>       CPUPPCState *env = &cpu->env;
>       SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> -    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
> +    struct nested_ppc_state l2_state;
>       target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
>       target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
> +    target_ulong hsrr0, hsrr1, hdar, asdr, hdsisr;
>       struct kvmppc_hv_guest_state *hvstate;
>       struct kvmppc_pt_regs *regs;
>       hwaddr len;
> -    uint64_t cr;
> -    int i;
>   
>       assert(spapr_cpu->in_nested);
>   
> +    nested_save_state(&l2_state, cpu);
> +    hsrr0 = env->spr[SPR_HSRR0];
> +    hsrr1 = env->spr[SPR_HSRR1];
> +    hdar = env->spr[SPR_HDAR];
> +    hdsisr = env->spr[SPR_HDSISR];
> +    asdr = env->spr[SPR_ASDR];
> +
> +    /*
> +     * Switch back to the host environment (including for any error).
> +     */
> +    assert(env->spr[SPR_LPIDR] != 0);
> +    nested_load_state(cpu, spapr_cpu->nested_host_state);
> +    env->gpr[3] = env->excp_vectors[excp]; /* hcall return value */
> +
>       cpu_ppc_hdecr_exit(env);
>   
> +    spapr_cpu->in_nested = false;
> +
> +    g_free(spapr_cpu->nested_host_state);
> +    spapr_cpu->nested_host_state = NULL;
> +
>       len = sizeof(*hvstate);
>       hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
>                                   MEMTXATTRS_UNSPECIFIED);
>       if (len != sizeof(*hvstate)) {
>           address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
> -        r3_return = H_PARAMETER;
> -        goto out_restore_l1;
> +        env->gpr[3] = H_PARAMETER;
> +	return;
>       }
>   
> -    hvstate->cfar = env->cfar;
> -    hvstate->lpcr = env->spr[SPR_LPCR];
> -    hvstate->pcr = env->spr[SPR_PCR];
> -    hvstate->dpdes = env->spr[SPR_DPDES];
> -    hvstate->hfscr = env->spr[SPR_HFSCR];
> +    hvstate->cfar = l2_state.cfar;
> +    hvstate->lpcr = l2_state.lpcr;
> +    hvstate->pcr = l2_state.pcr;
> +    hvstate->dpdes = l2_state.dpdes;
> +    hvstate->hfscr = l2_state.hfscr;
>   
>       if (excp == POWERPC_EXCP_HDSI) {
> -        hvstate->hdar = env->spr[SPR_HDAR];
> -        hvstate->hdsisr = env->spr[SPR_HDSISR];
> -        hvstate->asdr = env->spr[SPR_ASDR];
> +        hvstate->hdar = hdar;
> +        hvstate->hdsisr = hdsisr;
> +        hvstate->asdr = asdr;
>       } else if (excp == POWERPC_EXCP_HISI) {
> -        hvstate->asdr = env->spr[SPR_ASDR];
> +        hvstate->asdr = asdr;
>       }
>   
>       /* HEIR should be implemented for HV mode and saved here. */
> -    hvstate->srr0 = env->spr[SPR_SRR0];
> -    hvstate->srr1 = env->spr[SPR_SRR1];
> -    hvstate->sprg[0] = env->spr[SPR_SPRG0];
> -    hvstate->sprg[1] = env->spr[SPR_SPRG1];
> -    hvstate->sprg[2] = env->spr[SPR_SPRG2];
> -    hvstate->sprg[3] = env->spr[SPR_SPRG3];
> -    hvstate->pidr = env->spr[SPR_BOOKS_PID];
> -    hvstate->ppr = env->spr[SPR_PPR];
> +    hvstate->srr0 = l2_state.srr0;
> +    hvstate->srr1 = l2_state.srr1;
> +    hvstate->sprg[0] = l2_state.sprg0;
> +    hvstate->sprg[1] = l2_state.sprg1;
> +    hvstate->sprg[2] = l2_state.sprg2;
> +    hvstate->sprg[3] = l2_state.sprg3;
> +    hvstate->pidr = l2_state.pidr;
> +    hvstate->ppr = l2_state.ppr;
>   
>       /* Is it okay to specify write length larger than actual data written? */
>       address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
> @@ -1866,51 +1878,31 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>                                   MEMTXATTRS_UNSPECIFIED);
>       if (!regs || len != sizeof(*regs)) {
>           address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
> -        r3_return = H_P2;
> -        goto out_restore_l1;
> +        env->gpr[3] = H_P2;
> +	return;
>       }
>   
>       len = sizeof(env->gpr);
>       assert(len == sizeof(regs->gpr));
> -    memcpy(regs->gpr, env->gpr, len);
> +    memcpy(regs->gpr, l2_state.gpr, len);
>   
> -    regs->link = env->lr;
> -    regs->ctr = env->ctr;
> -    regs->xer = cpu_read_xer(env);
> -
> -    cr = 0;
> -    for (i = 0; i < 8; i++) {
> -        cr |= (env->crf[i] & 15) << (4 * (7 - i));
> -    }
> -    regs->ccr = cr;
> +    regs->link = l2_state.lr;
> +    regs->ctr = l2_state.ctr;
> +    regs->xer = l2_state.xer;
> +    regs->ccr = l2_state.cr;
>   
>       if (excp == POWERPC_EXCP_MCHECK ||
>           excp == POWERPC_EXCP_RESET ||
>           excp == POWERPC_EXCP_SYSCALL) {
> -        regs->nip = env->spr[SPR_SRR0];
> -        regs->msr = env->spr[SPR_SRR1] & env->msr_mask;
> +        regs->nip = l2_state.srr0;
> +        regs->msr = l2_state.srr1 & env->msr_mask;
>       } else {
> -        regs->nip = env->spr[SPR_HSRR0];
> -        regs->msr = env->spr[SPR_HSRR1] & env->msr_mask;
> +        regs->nip = hsrr0;
> +        regs->msr = hsrr1 & env->msr_mask;
>       }
>   
>       /* Is it okay to specify write length larger than actual data written? */
>       address_space_unmap(CPU(cpu)->as, regs, len, len, true);
> -
> -out_restore_l1:
> -    assert(env->spr[SPR_LPIDR] != 0);
> -    nested_load_state(cpu, spapr_cpu->nested_host_state);
> -
> -    /*
> -     * Return the interrupt vector address from H_ENTER_NESTED to the L1
> -     * (or error code).
> -     */
> -    env->gpr[3] = r3_return;
> -
> -    spapr_cpu->in_nested = false;
> -
> -    g_free(spapr_cpu->nested_host_state);
> -    spapr_cpu->nested_host_state = NULL;
>   }
>   
>   static void hypercall_register_nested(void)

