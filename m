Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B06F8114
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:55:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1put4z-00072b-WA; Fri, 05 May 2023 06:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1put4w-00072P-SB; Fri, 05 May 2023 06:54:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1put4u-0003E6-As; Fri, 05 May 2023 06:54:22 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345ApKEV004327; Fri, 5 May 2023 10:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rzI1lCgeBwzIefNAIQ1QFGMD8ior0BcwYBsgCE3Ek5E=;
 b=GPYe5fdkP6gCKO+Qbh8IrD5u13xQhk2rHnbNNC4S81wHOaQLGxn7s5HroAXczGANnym5
 upU7eh2rA7das10Cr5RJJdp+TKkr8BINn9uA4qOYRUAwEH3oxdnacdsUkoiaBmzxYx3N
 Vqu/HRWir6oQLSwC4ajK3sDbDvI8PEg11/QBQc4y5FZZzoppjK9TcAm271nyG6VWOUdc
 mjpUwT4gmy2n6dKtHk4nd72BKdN1+20PPbEkqgWINjrHHB9g+gVcmBgjHz0YiZ2oOQ3I
 8/XUSBZ7gxEgj6GpSKd96PqtuecdlkXh55p1HMD8LuzawSqNHRjWX3YvkysFMc01MRMK kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qcxyfjb27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 10:54:18 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 345As72p014281;
 Fri, 5 May 2023 10:54:17 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qcxyfjb1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 10:54:17 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34580wDp002647;
 Fri, 5 May 2023 10:54:16 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv8pb40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 10:54:16 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 345AsFds65864002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 May 2023 10:54:15 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AACA058056;
 Fri,  5 May 2023 10:54:15 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 147F858052;
 Fri,  5 May 2023 10:54:12 +0000 (GMT)
Received: from [9.43.126.158] (unknown [9.43.126.158])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  5 May 2023 10:54:11 +0000 (GMT)
Message-ID: <516d30a6-a329-d361-feea-e616e936dd41@linux.ibm.com>
Date: Fri, 5 May 2023 16:24:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 2/4] spapr: Add a nested state struct
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20230503003954.128188-1-npiggin@gmail.com>
 <20230503003954.128188-3-npiggin@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230503003954.128188-3-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M99zBgLyIvC8RvxZsm-X9zKPfra0xhR3
X-Proofpoint-ORIG-GUID: Mi1e9RhZNUzOSMDlWsWJlgAmP02qI84I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=931 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050087
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
> Rather than use a copy of CPUPPCState to store the host state while
> the environment has been switched to the L2, use a new struct for
> this purpose.
> 
> Have helper functions to save and load this host state.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   hw/ppc/spapr_hcall.c            | 164 ++++++++++++++++++++++++--------
>   include/hw/ppc/spapr_cpu_core.h |   5 +-
>   2 files changed, 129 insertions(+), 40 deletions(-)
> 
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index be225adaf6..6679150ac7 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1544,6 +1544,126 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
>       return H_FUNCTION;
>   }
>   
> +struct nested_ppc_state {
> +    uint64_t gpr[32];
> +    uint64_t lr;
> +    uint64_t ctr;
> +    uint64_t cfar;
> +    uint64_t msr;
> +    uint64_t nip;
> +    uint32_t cr;
> +
> +    uint64_t xer;
> +
> +    uint64_t lpcr;
> +    uint64_t lpidr;
> +    uint64_t pidr;
> +    uint64_t pcr;
> +    uint64_t dpdes;
> +    uint64_t hfscr;
> +    uint64_t srr0;
> +    uint64_t srr1;
> +    uint64_t sprg0;
> +    uint64_t sprg1;
> +    uint64_t sprg2;
> +    uint64_t sprg3;
> +    uint64_t ppr;
> +
> +    int64_t tb_offset;
> +};
> +
> +static void nested_save_state(struct nested_ppc_state *save, PowerPCCPU *cpu)
> +{
> +    CPUPPCState *env = &cpu->env;
> +    uint32_t cr;
> +    int i;
> +
> +    memcpy(save->gpr, env->gpr, sizeof(save->gpr));
> +
> +    save->lr = env->lr;
> +    save->ctr = env->ctr;
> +    save->cfar = env->cfar;
> +    save->msr = env->msr;
> +    save->nip = env->nip;
> +
> +    cr = 0;
> +    for (i = 0; i < 8; i++) {
> +        cr |= (env->crf[i] & 15) << (4 * (7 - i));
> +    }
> +    save->cr = cr;
> +
> +    save->xer = cpu_read_xer(env);
> +
> +    save->lpcr = env->spr[SPR_LPCR];
> +    save->lpidr = env->spr[SPR_LPIDR];
> +    save->pcr = env->spr[SPR_PCR];
> +    save->dpdes = env->spr[SPR_DPDES];
> +    save->hfscr = env->spr[SPR_HFSCR];
> +    save->srr0 = env->spr[SPR_SRR0];
> +    save->srr1 = env->spr[SPR_SRR1];
> +    save->sprg0 = env->spr[SPR_SPRG0];
> +    save->sprg1 = env->spr[SPR_SPRG1];
> +    save->sprg2 = env->spr[SPR_SPRG2];
> +    save->sprg3 = env->spr[SPR_SPRG3];
> +    save->pidr = env->spr[SPR_BOOKS_PID];
> +    save->ppr = env->spr[SPR_PPR];
> +
> +    save->tb_offset = env->tb_env->tb_offset;
> +}
> +
> +static void nested_load_state(PowerPCCPU *cpu, struct nested_ppc_state *load)
> +{
> +    CPUState *cs = CPU(cpu);
> +    CPUPPCState *env = &cpu->env;
> +    uint32_t cr;
> +    int i;
> +
> +    memcpy(env->gpr, load->gpr, sizeof(env->gpr));
> +
> +    env->lr = load->lr;
> +    env->ctr = load->ctr;
> +    env->cfar = load->cfar;
> +    env->msr = load->msr;
> +    env->nip = load->nip;
> +
> +    cr = load->cr;
> +    for (i = 7; i >= 0; i--) {
> +        env->crf[i] = cr & 15;
> +        cr >>= 4;
> +    }
> +
> +    cpu_write_xer(env, load->xer);
> +
> +    env->spr[SPR_LPCR] = load->lpcr;
> +    env->spr[SPR_LPIDR] = load->lpidr;
> +    env->spr[SPR_PCR] = load->pcr;
> +    env->spr[SPR_DPDES] = load->dpdes;
> +    env->spr[SPR_HFSCR] = load->hfscr;
> +    env->spr[SPR_SRR0] = load->srr0;
> +    env->spr[SPR_SRR1] = load->srr1;
> +    env->spr[SPR_SPRG0] = load->sprg0;
> +    env->spr[SPR_SPRG1] = load->sprg1;
> +    env->spr[SPR_SPRG2] = load->sprg2;
> +    env->spr[SPR_SPRG3] = load->sprg3;
> +    env->spr[SPR_BOOKS_PID] = load->pidr;
> +    env->spr[SPR_PPR] = load->ppr;
> +
> +    env->tb_env->tb_offset = load->tb_offset;
> +
> +    /*
> +     * MSR updated, compute hflags and possible interrupts.
> +     */
> +    hreg_compute_hflags(env);
> +    ppc_maybe_interrupt(env);
> +
> +    /*
> +     * Nested HV does not tag TLB entries between L1 and L2, so must
> +     * flush on transition.
> +     */
> +    tlb_flush(cs);
> +    env->reserve_addr = -1; /* Reset the reservation */
> +}
> +
>   /*
>    * When this handler returns, the environment is switched to the L2 guest
>    * and TCG begins running that. spapr_exit_nested() performs the switch from
> @@ -1593,12 +1713,14 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>           return H_PARAMETER;
>       }
>   
> -    spapr_cpu->nested_host_state = g_try_new(CPUPPCState, 1);
> +    spapr_cpu->nested_host_state = g_try_new(struct nested_ppc_state, 1);
>       if (!spapr_cpu->nested_host_state) {
>           return H_NO_MEM;
>       }
>   
> -    memcpy(spapr_cpu->nested_host_state, env, sizeof(CPUPPCState));
> +    assert(env->spr[SPR_LPIDR] == 0);
> +    assert(env->spr[SPR_DPDES] == 0);
> +    nested_save_state(spapr_cpu->nested_host_state, cpu);
>   
Ideally, we may want to save entire env for L1 host, while switching to 
L2 rather than keeping a subset of it for 2 reasons:
  - keeping enitre L1 env ensures it remains untouched by L2 during L2 
execution (shouldnt allow L2 to modify remaining L1 env bits unexpectedly)
  - I see some of the registers are retained only for L1 (so, ca, ov32, 
ca32, etc) but not for L2 (got missed in nested_load_state helper in 
this patch), are they not really needed anymore? Previous patch 
introduced one of them though.

regards,
Harsh
>       len = sizeof(*regs);
>       regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, false,
> @@ -1644,7 +1766,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>       env->spr[SPR_DPDES] = hv_state.dpdes;
>       env->spr[SPR_HFSCR] = hv_state.hfscr;
>       hdec = hv_state.hdec_expiry - now;
> -    spapr_cpu->nested_tb_offset = hv_state.tb_offset;
>       /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
>       env->spr[SPR_SRR0] = hv_state.srr0;
>       env->spr[SPR_SRR1] = hv_state.srr1;
> @@ -1670,7 +1791,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>        * and it's not obviously worth a new data structure to do it.
>        */
>   
> -    env->tb_env->tb_offset += spapr_cpu->nested_tb_offset;
> +    env->tb_env->tb_offset += hv_state.tb_offset;
>       spapr_cpu->in_nested = true;
>   
>       hreg_compute_hflags(env);
> @@ -1689,7 +1810,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>   
>   void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>   {
> -    CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
>       SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>       target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
> @@ -1778,34 +1898,8 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>       address_space_unmap(CPU(cpu)->as, regs, len, len, true);
>   
>   out_restore_l1:
> -    memcpy(env->gpr, spapr_cpu->nested_host_state->gpr, sizeof(env->gpr));
> -    env->lr = spapr_cpu->nested_host_state->lr;
> -    env->ctr = spapr_cpu->nested_host_state->ctr;
> -    memcpy(env->crf, spapr_cpu->nested_host_state->crf, sizeof(env->crf));
> -    env->cfar = spapr_cpu->nested_host_state->cfar;
> -    env->xer = spapr_cpu->nested_host_state->xer;
> -    env->so = spapr_cpu->nested_host_state->so;
> -    env->ca = spapr_cpu->nested_host_state->ca;
> -    env->ov = spapr_cpu->nested_host_state->ov;
> -    env->ov32 = spapr_cpu->nested_host_state->ov32;
> -    env->ca32 = spapr_cpu->nested_host_state->ca32;
> -    env->msr = spapr_cpu->nested_host_state->msr;
> -    env->nip = spapr_cpu->nested_host_state->nip;
> -
>       assert(env->spr[SPR_LPIDR] != 0);
> -    env->spr[SPR_LPCR] = spapr_cpu->nested_host_state->spr[SPR_LPCR];
> -    env->spr[SPR_LPIDR] = spapr_cpu->nested_host_state->spr[SPR_LPIDR];
> -    env->spr[SPR_PCR] = spapr_cpu->nested_host_state->spr[SPR_PCR];
> -    env->spr[SPR_DPDES] = 0;
> -    env->spr[SPR_HFSCR] = spapr_cpu->nested_host_state->spr[SPR_HFSCR];
> -    env->spr[SPR_SRR0] = spapr_cpu->nested_host_state->spr[SPR_SRR0];
> -    env->spr[SPR_SRR1] = spapr_cpu->nested_host_state->spr[SPR_SRR1];
> -    env->spr[SPR_SPRG0] = spapr_cpu->nested_host_state->spr[SPR_SPRG0];
> -    env->spr[SPR_SPRG1] = spapr_cpu->nested_host_state->spr[SPR_SPRG1];
> -    env->spr[SPR_SPRG2] = spapr_cpu->nested_host_state->spr[SPR_SPRG2];
> -    env->spr[SPR_SPRG3] = spapr_cpu->nested_host_state->spr[SPR_SPRG3];
> -    env->spr[SPR_BOOKS_PID] = spapr_cpu->nested_host_state->spr[SPR_BOOKS_PID];
> -    env->spr[SPR_PPR] = spapr_cpu->nested_host_state->spr[SPR_PPR];
> +    nested_load_state(cpu, spapr_cpu->nested_host_state);
>   
>       /*
>        * Return the interrupt vector address from H_ENTER_NESTED to the L1
> @@ -1813,14 +1907,8 @@ out_restore_l1:
>        */
>       env->gpr[3] = r3_return;
>   
> -    env->tb_env->tb_offset -= spapr_cpu->nested_tb_offset;
>       spapr_cpu->in_nested = false;
>   
> -    hreg_compute_hflags(env);
> -    ppc_maybe_interrupt(env);
> -    tlb_flush(cs);
> -    env->reserve_addr = -1; /* Reset the reservation */
> -
>       g_free(spapr_cpu->nested_host_state);
>       spapr_cpu->nested_host_state = NULL;
>   }
> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
> index b560514560..69a52e39b8 100644
> --- a/include/hw/ppc/spapr_cpu_core.h
> +++ b/include/hw/ppc/spapr_cpu_core.h
> @@ -41,6 +41,8 @@ void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
>                                  target_ulong r1, target_ulong r3,
>                                  target_ulong r4);
>   
> +struct nested_ppc_state;
> +
>   typedef struct SpaprCpuState {
>       uint64_t vpa_addr;
>       uint64_t slb_shadow_addr, slb_shadow_size;
> @@ -51,8 +53,7 @@ typedef struct SpaprCpuState {
>   
>       /* Fields for nested-HV support */
>       bool in_nested; /* true while the L2 is executing */
> -    CPUPPCState *nested_host_state; /* holds the L1 state while L2 executes */
> -    int64_t nested_tb_offset; /* L1->L2 TB offset */
> +    struct nested_ppc_state *nested_host_state; /* holds the L1 state while L2 executes */
>   } SpaprCpuState;
>   
>   static inline SpaprCpuState *spapr_cpu_state(PowerPCCPU *cpu)

