Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6BA38962D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:07:54 +0200 (CEST)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRXs-0001dS-NX
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljR7O-0006C4-7v; Wed, 19 May 2021 14:40:31 -0400
Received: from [201.28.113.2] (port=55669 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljR7H-00026N-Q8; Wed, 19 May 2021 14:40:28 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 15:40:15 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 654E680139F;
 Wed, 19 May 2021 15:40:15 -0300 (-03)
Subject: Re: [PATCH 22/24] target/ppc: Split out ppc_jumbo_xlate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-23-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <18cfdfb1-a14e-c880-43ac-479fdaf6395d@eldorado.org.br>
Date: Wed, 19 May 2021 15:40:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-23-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------FB14A7E0F21C89A70C8BFF9E"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 18:40:15.0620 (UTC)
 FILETIME=[68D8AC40:01D74CDE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------FB14A7E0F21C89A70C8BFF9E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> Mirror the interface of ppc_radix64_xlate (mostly), putting all
> of the logic for older mmu translation into a single entry point.
> For booke, we need to add mmu_idx to the xlate-style interface.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Out of my depth again, but testing seems fine, so

Acked-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/mmu_helper.c | 181 +++++++++++++++++++++-------------------
>   1 file changed, 97 insertions(+), 84 deletions(-)
>
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 863e556a22..68c2e59238 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1427,48 +1427,6 @@ static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>       return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
>   }
>   
> -hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> -{
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -    mmu_ctx_t ctx;
> -
> -    switch (env->mmu_model) {
> -#if defined(TARGET_PPC64)
> -    case POWERPC_MMU_64B:
> -    case POWERPC_MMU_2_03:
> -    case POWERPC_MMU_2_06:
> -    case POWERPC_MMU_2_07:
> -        return ppc_hash64_get_phys_page_debug(cpu, addr);
> -    case POWERPC_MMU_3_00:
> -        return ppc64_v3_get_phys_page_debug(cpu, addr);
> -#endif
> -
> -    case POWERPC_MMU_32B:
> -    case POWERPC_MMU_601:
> -        return ppc_hash32_get_phys_page_debug(cpu, addr);
> -
> -    default:
> -        ;
> -    }
> -
> -    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
> -                                      ACCESS_INT) != 0)) {
> -
> -        /*
> -         * Some MMUs have separate TLBs for code and data. If we only
> -         * try an ACCESS_INT, we may not be able to read instructions
> -         * mapped by code TLBs, so we also try a ACCESS_CODE.
> -         */
> -        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETCH,
> -                                          ACCESS_CODE) != 0)) {
> -            return -1;
> -        }
> -    }
> -
> -    return ctx.raddr & TARGET_PAGE_MASK;
> -}
> -
>   static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
>                                            MMUAccessType access_type, int mmu_idx)
>   {
> @@ -1524,30 +1482,38 @@ static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
>   }
>   
>   /* Perform address translation */
> -static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
> -                                    MMUAccessType access_type, int mmu_idx)
> +/* TODO: Split this by mmu_model. */
> +static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
> +                            MMUAccessType access_type,
> +                            hwaddr *raddrp, int *psizep, int *protp,
> +                            int mmu_idx, bool guest_visible)
>   {
> -    CPUState *cs = env_cpu(env);
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> +    CPUState *cs = CPU(cpu);
> +    CPUPPCState *env = &cpu->env;
>       mmu_ctx_t ctx;
>       int type;
> -    int ret = 0;
> +    int ret;
>   
>       if (access_type == MMU_INST_FETCH) {
>           /* code access */
>           type = ACCESS_CODE;
> -    } else {
> +    } else if (guest_visible) {
>           /* data access */
>           type = env->access_type;
> +    } else {
> +        type = ACCESS_INT;
>       }
> -    ret = get_physical_address_wtlb(env, &ctx, address, access_type,
> +
> +    ret = get_physical_address_wtlb(env, &ctx, eaddr, access_type,
>                                       type, mmu_idx);
>       if (ret == 0) {
> -        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> -                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
> -                     mmu_idx, TARGET_PAGE_SIZE);
> -        ret = 0;
> -    } else if (ret < 0) {
> +        *raddrp = ctx.raddr;
> +        *protp = ctx.prot;
> +        *psizep = TARGET_PAGE_BITS;
> +        return true;
> +    }
> +
> +    if (guest_visible) {
>           LOG_MMU_STATE(cs);
>           if (type == ACCESS_CODE) {
>               switch (ret) {
> @@ -1557,7 +1523,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                   case POWERPC_MMU_SOFT_6xx:
>                       cs->exception_index = POWERPC_EXCP_IFTLB;
>                       env->error_code = 1 << 18;
> -                    env->spr[SPR_IMISS] = address;
> +                    env->spr[SPR_IMISS] = eaddr;
>                       env->spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
>                       goto tlb_miss;
>                   case POWERPC_MMU_SOFT_74xx:
> @@ -1567,29 +1533,25 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                   case POWERPC_MMU_SOFT_4xx_Z:
>                       cs->exception_index = POWERPC_EXCP_ITLB;
>                       env->error_code = 0;
> -                    env->spr[SPR_40x_DEAR] = address;
> +                    env->spr[SPR_40x_DEAR] = eaddr;
>                       env->spr[SPR_40x_ESR] = 0x00000000;
>                       break;
>                   case POWERPC_MMU_BOOKE206:
> -                    booke206_update_mas_tlb_miss(env, address, 2, mmu_idx);
> +                    booke206_update_mas_tlb_miss(env, eaddr, 2, mmu_idx);
>                       /* fall through */
>                   case POWERPC_MMU_BOOKE:
>                       cs->exception_index = POWERPC_EXCP_ITLB;
>                       env->error_code = 0;
> -                    env->spr[SPR_BOOKE_DEAR] = address;
> +                    env->spr[SPR_BOOKE_DEAR] = eaddr;
>                       env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
> -                    return -1;
> -                case POWERPC_MMU_MPC8xx:
> -                    /* XXX: TODO */
> -                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
>                       break;
> +                case POWERPC_MMU_MPC8xx:
> +                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
>                   case POWERPC_MMU_REAL:
>                       cpu_abort(cs, "PowerPC in real mode should never raise "
>                                 "any MMU exceptions\n");
> -                    return -1;
>                   default:
>                       cpu_abort(cs, "Unknown or invalid MMU model\n");
> -                    return -1;
>                   }
>                   break;
>               case -2:
> @@ -1626,7 +1588,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                           cs->exception_index = POWERPC_EXCP_DLTLB;
>                           env->error_code = 0;
>                       }
> -                    env->spr[SPR_DMISS] = address;
> +                    env->spr[SPR_DMISS] = eaddr;
>                       env->spr[SPR_DCMP] = 0x80000000 | ctx.ptem;
>                   tlb_miss:
>                       env->error_code |= ctx.key << 19;
> @@ -1644,7 +1606,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                   tlb_miss_74xx:
>                       /* Implement LRU algorithm */
>                       env->error_code = ctx.key << 19;
> -                    env->spr[SPR_TLBMISS] = (address & ~((target_ulong)0x3)) |
> +                    env->spr[SPR_TLBMISS] = (eaddr & ~((target_ulong)0x3)) |
>                           ((env->last_way + 1) & (env->nb_ways - 1));
>                       env->spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
>                       break;
> @@ -1652,7 +1614,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                   case POWERPC_MMU_SOFT_4xx_Z:
>                       cs->exception_index = POWERPC_EXCP_DTLB;
>                       env->error_code = 0;
> -                    env->spr[SPR_40x_DEAR] = address;
> +                    env->spr[SPR_40x_DEAR] = eaddr;
>                       if (access_type == MMU_DATA_STORE) {
>                           env->spr[SPR_40x_ESR] = 0x00800000;
>                       } else {
> @@ -1662,23 +1624,20 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                   case POWERPC_MMU_MPC8xx:
>                       /* XXX: TODO */
>                       cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
> -                    break;
>                   case POWERPC_MMU_BOOKE206:
> -                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
> +                    booke206_update_mas_tlb_miss(env, eaddr, access_type, mmu_idx);
>                       /* fall through */
>                   case POWERPC_MMU_BOOKE:
>                       cs->exception_index = POWERPC_EXCP_DTLB;
>                       env->error_code = 0;
> -                    env->spr[SPR_BOOKE_DEAR] = address;
> +                    env->spr[SPR_BOOKE_DEAR] = eaddr;
>                       env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
> -                    return -1;
> +                    break;
>                   case POWERPC_MMU_REAL:
>                       cpu_abort(cs, "PowerPC in real mode should never raise "
>                                 "any MMU exceptions\n");
> -                    return -1;
>                   default:
>                       cpu_abort(cs, "Unknown or invalid MMU model\n");
> -                    return -1;
>                   }
>                   break;
>               case -2:
> @@ -1687,16 +1646,16 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                   env->error_code = 0;
>                   if (env->mmu_model == POWERPC_MMU_SOFT_4xx
>                       || env->mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
> -                    env->spr[SPR_40x_DEAR] = address;
> +                    env->spr[SPR_40x_DEAR] = eaddr;
>                       if (access_type == MMU_DATA_STORE) {
>                           env->spr[SPR_40x_ESR] |= 0x00800000;
>                       }
>                   } else if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
>                              (env->mmu_model == POWERPC_MMU_BOOKE206)) {
> -                    env->spr[SPR_BOOKE_DEAR] = address;
> +                    env->spr[SPR_BOOKE_DEAR] = eaddr;
>                       env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
>                   } else {
> -                    env->spr[SPR_DAR] = address;
> +                    env->spr[SPR_DAR] = eaddr;
>                       if (access_type == MMU_DATA_STORE) {
>                           env->spr[SPR_DSISR] = 0x0A000000;
>                       } else {
> @@ -1711,13 +1670,13 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                       /* Floating point load/store */
>                       cs->exception_index = POWERPC_EXCP_ALIGN;
>                       env->error_code = POWERPC_EXCP_ALIGN_FP;
> -                    env->spr[SPR_DAR] = address;
> +                    env->spr[SPR_DAR] = eaddr;
>                       break;
>                   case ACCESS_RES:
>                       /* lwarx, ldarx or stwcx. */
>                       cs->exception_index = POWERPC_EXCP_DSI;
>                       env->error_code = 0;
> -                    env->spr[SPR_DAR] = address;
> +                    env->spr[SPR_DAR] = eaddr;
>                       if (access_type == MMU_DATA_STORE) {
>                           env->spr[SPR_DSISR] = 0x06000000;
>                       } else {
> @@ -1728,7 +1687,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                       /* eciwx or ecowx */
>                       cs->exception_index = POWERPC_EXCP_DSI;
>                       env->error_code = 0;
> -                    env->spr[SPR_DAR] = address;
> +                    env->spr[SPR_DAR] = eaddr;
>                       if (access_type == MMU_DATA_STORE) {
>                           env->spr[SPR_DSISR] = 0x06100000;
>                       } else {
> @@ -1740,16 +1699,14 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>                       cs->exception_index = POWERPC_EXCP_PROGRAM;
>                       env->error_code =
>                           POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
> -                    env->spr[SPR_DAR] = address;
> +                    env->spr[SPR_DAR] = eaddr;
>                       break;
>                   }
>                   break;
>               }
>           }
> -        ret = 1;
>       }
> -
> -    return ret;
> +    return false;
>   }
>   
>   /*****************************************************************************/
> @@ -2958,6 +2915,62 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
>   
>   /*****************************************************************************/
>   
> +static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                    MMUAccessType access_type, int mmu_idx)
> +{
> +    CPUState *cs = CPU(cpu);
> +    int page_size, prot;
> +    hwaddr raddr;
> +
> +    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &raddr,
> +                         &page_size, &prot, mmu_idx, true)) {
> +        return 1;
> +    }
> +
> +    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> +                 prot, mmu_idx, 1UL << page_size);
> +    return 0;
> +}
> +
> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +{
> +    PowerPCCPU *cpu = POWERPC_CPU(cs);
> +    CPUPPCState *env = &cpu->env;
> +    hwaddr raddr;
> +    int s, p;
> +
> +    switch (env->mmu_model) {
> +#if defined(TARGET_PPC64)
> +    case POWERPC_MMU_64B:
> +    case POWERPC_MMU_2_03:
> +    case POWERPC_MMU_2_06:
> +    case POWERPC_MMU_2_07:
> +        return ppc_hash64_get_phys_page_debug(cpu, addr);
> +    case POWERPC_MMU_3_00:
> +        return ppc64_v3_get_phys_page_debug(cpu, addr);
> +#endif
> +
> +    case POWERPC_MMU_32B:
> +    case POWERPC_MMU_601:
> +        return ppc_hash32_get_phys_page_debug(cpu, addr);
> +
> +    default:
> +        ;
> +    }
> +
> +    /*
> +     * Some MMUs have separate TLBs for code and data. If we only
> +     * try an MMU_DATA_LOAD, we may not be able to read instructions
> +     * mapped by code TLBs, so we also try a MMU_INST_FETCH.
> +     */
> +    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
> +        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
> +        return raddr & TARGET_PAGE_MASK;
> +    }
> +    return -1;
> +}
> +
> +
>   bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr)
> @@ -2985,7 +2998,7 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>           break;
>   
>       default:
> -        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
> +        ret = cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
>           break;
>       }
>       if (unlikely(ret != 0)) {
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------FB14A7E0F21C89A70C8BFF9E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18/05/2021 17:11, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-23-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">Mirror the interface of ppc_radix64_xlate (mostly), putting all
of the logic for older mmu translation into a single entry point.
For booke, we need to add mmu_idx to the xlate-style interface.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    Out of my depth again, but testing seems fine, so <br>
    <pre class="moz-quote-pre" wrap="">Acked-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-23-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/mmu_helper.c | 181 +++++++++++++++++++++-------------------
 1 file changed, 97 insertions(+), 84 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 863e556a22..68c2e59238 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1427,48 +1427,6 @@ static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
 }
 
-hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &amp;cpu-&gt;env;
-    mmu_ctx_t ctx;
-
-    switch (env-&gt;mmu_model) {
-#if defined(TARGET_PPC64)
-    case POWERPC_MMU_64B:
-    case POWERPC_MMU_2_03:
-    case POWERPC_MMU_2_06:
-    case POWERPC_MMU_2_07:
-        return ppc_hash64_get_phys_page_debug(cpu, addr);
-    case POWERPC_MMU_3_00:
-        return ppc64_v3_get_phys_page_debug(cpu, addr);
-#endif
-
-    case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
-        return ppc_hash32_get_phys_page_debug(cpu, addr);
-
-    default:
-        ;
-    }
-
-    if (unlikely(get_physical_address(env, &amp;ctx, addr, MMU_DATA_LOAD,
-                                      ACCESS_INT) != 0)) {
-
-        /*
-         * Some MMUs have separate TLBs for code and data. If we only
-         * try an ACCESS_INT, we may not be able to read instructions
-         * mapped by code TLBs, so we also try a ACCESS_CODE.
-         */
-        if (unlikely(get_physical_address(env, &amp;ctx, addr, MMU_INST_FETCH,
-                                          ACCESS_CODE) != 0)) {
-            return -1;
-        }
-    }
-
-    return ctx.raddr &amp; TARGET_PAGE_MASK;
-}
-
 static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
                                          MMUAccessType access_type, int mmu_idx)
 {
@@ -1524,30 +1482,38 @@ static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
 }
 
 /* Perform address translation */
-static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
-                                    MMUAccessType access_type, int mmu_idx)
+/* TODO: Split this by mmu_model. */
+static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                            MMUAccessType access_type,
+                            hwaddr *raddrp, int *psizep, int *protp,
+                            int mmu_idx, bool guest_visible)
 {
-    CPUState *cs = env_cpu(env);
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &amp;cpu-&gt;env;
     mmu_ctx_t ctx;
     int type;
-    int ret = 0;
+    int ret;
 
     if (access_type == MMU_INST_FETCH) {
         /* code access */
         type = ACCESS_CODE;
-    } else {
+    } else if (guest_visible) {
         /* data access */
         type = env-&gt;access_type;
+    } else {
+        type = ACCESS_INT;
     }
-    ret = get_physical_address_wtlb(env, &amp;ctx, address, access_type,
+
+    ret = get_physical_address_wtlb(env, &amp;ctx, eaddr, access_type,
                                     type, mmu_idx);
     if (ret == 0) {
-        tlb_set_page(cs, address &amp; TARGET_PAGE_MASK,
-                     ctx.raddr &amp; TARGET_PAGE_MASK, ctx.prot,
-                     mmu_idx, TARGET_PAGE_SIZE);
-        ret = 0;
-    } else if (ret &lt; 0) {
+        *raddrp = ctx.raddr;
+        *protp = ctx.prot;
+        *psizep = TARGET_PAGE_BITS;
+        return true;
+    }
+
+    if (guest_visible) {
         LOG_MMU_STATE(cs);
         if (type == ACCESS_CODE) {
             switch (ret) {
@@ -1557,7 +1523,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_SOFT_6xx:
                     cs-&gt;exception_index = POWERPC_EXCP_IFTLB;
                     env-&gt;error_code = 1 &lt;&lt; 18;
-                    env-&gt;spr[SPR_IMISS] = address;
+                    env-&gt;spr[SPR_IMISS] = eaddr;
                     env-&gt;spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
                     goto tlb_miss;
                 case POWERPC_MMU_SOFT_74xx:
@@ -1567,29 +1533,25 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs-&gt;exception_index = POWERPC_EXCP_ITLB;
                     env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_40x_DEAR] = address;
+                    env-&gt;spr[SPR_40x_DEAR] = eaddr;
                     env-&gt;spr[SPR_40x_ESR] = 0x00000000;
                     break;
                 case POWERPC_MMU_BOOKE206:
-                    booke206_update_mas_tlb_miss(env, address, 2, mmu_idx);
+                    booke206_update_mas_tlb_miss(env, eaddr, 2, mmu_idx);
                     /* fall through */
                 case POWERPC_MMU_BOOKE:
                     cs-&gt;exception_index = POWERPC_EXCP_ITLB;
                     env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
+                    env-&gt;spr[SPR_BOOKE_DEAR] = eaddr;
                     env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
-                    return -1;
-                case POWERPC_MMU_MPC8xx:
-                    /* XXX: TODO */
-                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
                     break;
+                case POWERPC_MMU_MPC8xx:
+                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
                 case POWERPC_MMU_REAL:
                     cpu_abort(cs, "PowerPC in real mode should never raise "
                               "any MMU exceptions\n");
-                    return -1;
                 default:
                     cpu_abort(cs, "Unknown or invalid MMU model\n");
-                    return -1;
                 }
                 break;
             case -2:
@@ -1626,7 +1588,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                         cs-&gt;exception_index = POWERPC_EXCP_DLTLB;
                         env-&gt;error_code = 0;
                     }
-                    env-&gt;spr[SPR_DMISS] = address;
+                    env-&gt;spr[SPR_DMISS] = eaddr;
                     env-&gt;spr[SPR_DCMP] = 0x80000000 | ctx.ptem;
                 tlb_miss:
                     env-&gt;error_code |= ctx.key &lt;&lt; 19;
@@ -1644,7 +1606,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 tlb_miss_74xx:
                     /* Implement LRU algorithm */
                     env-&gt;error_code = ctx.key &lt;&lt; 19;
-                    env-&gt;spr[SPR_TLBMISS] = (address &amp; ~((target_ulong)0x3)) |
+                    env-&gt;spr[SPR_TLBMISS] = (eaddr &amp; ~((target_ulong)0x3)) |
                         ((env-&gt;last_way + 1) &amp; (env-&gt;nb_ways - 1));
                     env-&gt;spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
                     break;
@@ -1652,7 +1614,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs-&gt;exception_index = POWERPC_EXCP_DTLB;
                     env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_40x_DEAR] = address;
+                    env-&gt;spr[SPR_40x_DEAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env-&gt;spr[SPR_40x_ESR] = 0x00800000;
                     } else {
@@ -1662,23 +1624,20 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_MPC8xx:
                     /* XXX: TODO */
                     cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
-                    break;
                 case POWERPC_MMU_BOOKE206:
-                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
+                    booke206_update_mas_tlb_miss(env, eaddr, access_type, mmu_idx);
                     /* fall through */
                 case POWERPC_MMU_BOOKE:
                     cs-&gt;exception_index = POWERPC_EXCP_DTLB;
                     env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
+                    env-&gt;spr[SPR_BOOKE_DEAR] = eaddr;
                     env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
-                    return -1;
+                    break;
                 case POWERPC_MMU_REAL:
                     cpu_abort(cs, "PowerPC in real mode should never raise "
                               "any MMU exceptions\n");
-                    return -1;
                 default:
                     cpu_abort(cs, "Unknown or invalid MMU model\n");
-                    return -1;
                 }
                 break;
             case -2:
@@ -1687,16 +1646,16 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 env-&gt;error_code = 0;
                 if (env-&gt;mmu_model == POWERPC_MMU_SOFT_4xx
                     || env-&gt;mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
-                    env-&gt;spr[SPR_40x_DEAR] = address;
+                    env-&gt;spr[SPR_40x_DEAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env-&gt;spr[SPR_40x_ESR] |= 0x00800000;
                     }
                 } else if ((env-&gt;mmu_model == POWERPC_MMU_BOOKE) ||
                            (env-&gt;mmu_model == POWERPC_MMU_BOOKE206)) {
-                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
+                    env-&gt;spr[SPR_BOOKE_DEAR] = eaddr;
                     env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
                 } else {
-                    env-&gt;spr[SPR_DAR] = address;
+                    env-&gt;spr[SPR_DAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env-&gt;spr[SPR_DSISR] = 0x0A000000;
                     } else {
@@ -1711,13 +1670,13 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     /* Floating point load/store */
                     cs-&gt;exception_index = POWERPC_EXCP_ALIGN;
                     env-&gt;error_code = POWERPC_EXCP_ALIGN_FP;
-                    env-&gt;spr[SPR_DAR] = address;
+                    env-&gt;spr[SPR_DAR] = eaddr;
                     break;
                 case ACCESS_RES:
                     /* lwarx, ldarx or stwcx. */
                     cs-&gt;exception_index = POWERPC_EXCP_DSI;
                     env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_DAR] = address;
+                    env-&gt;spr[SPR_DAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env-&gt;spr[SPR_DSISR] = 0x06000000;
                     } else {
@@ -1728,7 +1687,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     /* eciwx or ecowx */
                     cs-&gt;exception_index = POWERPC_EXCP_DSI;
                     env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_DAR] = address;
+                    env-&gt;spr[SPR_DAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env-&gt;spr[SPR_DSISR] = 0x06100000;
                     } else {
@@ -1740,16 +1699,14 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     cs-&gt;exception_index = POWERPC_EXCP_PROGRAM;
                     env-&gt;error_code =
                         POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
-                    env-&gt;spr[SPR_DAR] = address;
+                    env-&gt;spr[SPR_DAR] = eaddr;
                     break;
                 }
                 break;
             }
         }
-        ret = 1;
     }
-
-    return ret;
+    return false;
 }
 
 /*****************************************************************************/
@@ -2958,6 +2915,62 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 
 /*****************************************************************************/
 
+static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                    MMUAccessType access_type, int mmu_idx)
+{
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
+
+    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &amp;raddr,
+                         &amp;page_size, &amp;prot, mmu_idx, true)) {
+        return 1;
+    }
+
+    tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
+                 prot, mmu_idx, 1UL &lt;&lt; page_size);
+    return 0;
+}
+
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &amp;cpu-&gt;env;
+    hwaddr raddr;
+    int s, p;
+
+    switch (env-&gt;mmu_model) {
+#if defined(TARGET_PPC64)
+    case POWERPC_MMU_64B:
+    case POWERPC_MMU_2_03:
+    case POWERPC_MMU_2_06:
+    case POWERPC_MMU_2_07:
+        return ppc_hash64_get_phys_page_debug(cpu, addr);
+    case POWERPC_MMU_3_00:
+        return ppc64_v3_get_phys_page_debug(cpu, addr);
+#endif
+
+    case POWERPC_MMU_32B:
+    case POWERPC_MMU_601:
+        return ppc_hash32_get_phys_page_debug(cpu, addr);
+
+    default:
+        ;
+    }
+
+    /*
+     * Some MMUs have separate TLBs for code and data. If we only
+     * try an MMU_DATA_LOAD, we may not be able to read instructions
+     * mapped by code TLBs, so we also try a MMU_INST_FETCH.
+     */
+    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &amp;raddr, &amp;s, &amp;p, 0, false) ||
+        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &amp;raddr, &amp;s, &amp;p, 0, false)) {
+        return raddr &amp; TARGET_PAGE_MASK;
+    }
+    return -1;
+}
+
+
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
@@ -2985,7 +2998,7 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
 
     default:
-        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
+        ret = cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
         break;
     }
     if (unlikely(ret != 0)) {
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------FB14A7E0F21C89A70C8BFF9E--

