Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786673896BD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:30:40 +0200 (CEST)
Received: from localhost ([::1]:48352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRtv-0003TC-7O
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljRJf-0000Qr-Mj; Wed, 19 May 2021 14:53:11 -0400
Received: from [201.28.113.2] (port=10128 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljRJb-0000vM-EB; Wed, 19 May 2021 14:53:11 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 15:53:04 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 1740C80139F;
 Wed, 19 May 2021 15:53:04 -0300 (-03)
Subject: Re: [PATCH 23/24] target/ppc: Introduce ppc_xlate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-24-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <0b386477-8346-e891-cb90-af3814eae178@eldorado.org.br>
Date: Wed, 19 May 2021 15:53:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-24-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------4889BE1DD99046589844CB02"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 18:53:04.0373 (UTC)
 FILETIME=[330F1250:01D74CE0]
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
--------------4889BE1DD99046589844CB02
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> Create one common dispatch for all of the ppc_*_xlate functions.
> Use ppc64_v3_radix to directly dispatch between ppc_radix64_xlate
> and ppc_hash64_xlate.
>
> Remove the separate *_handle_mmu_fault and *_get_phys_page_debug
> functions, using common code for ppc_cpu_tlb_fill and
> ppc_cpu_get_phys_page_debug.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Ah, this finally makes sense! I agree that this solution looks quite a 
bit better than what was here before, and acceptance tests say 
everything is fine, so fwiw

Reviewed-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/mmu-book3s-v3.h |   5 --
>   target/ppc/mmu-hash32.h    |   6 +--
>   target/ppc/mmu-hash64.h    |   6 +--
>   target/ppc/mmu-radix64.h   |   6 +--
>   target/ppc/mmu-book3s-v3.c |  19 -------
>   target/ppc/mmu-hash32.c    |  38 ++-----------
>   target/ppc/mmu-hash64.c    |  37 ++-----------
>   target/ppc/mmu-radix64.c   |  38 ++-----------
>   target/ppc/mmu_helper.c    | 106 ++++++++++++++-----------------------
>   9 files changed, 58 insertions(+), 203 deletions(-)
>
> diff --git a/target/ppc/mmu-book3s-v3.h b/target/ppc/mmu-book3s-v3.h
> index 7b89be54b8..a1326df969 100644
> --- a/target/ppc/mmu-book3s-v3.h
> +++ b/target/ppc/mmu-book3s-v3.h
> @@ -67,11 +67,6 @@ static inline bool ppc64_v3_radix(PowerPCCPU *cpu)
>       return !!(cpu->env.spr[SPR_LPCR] & LPCR_HR);
>   }
>   
> -hwaddr ppc64_v3_get_phys_page_debug(PowerPCCPU *cpu, vaddr eaddr);
> -
> -int ppc64_v3_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                              int mmu_idx);
> -
>   static inline hwaddr ppc_hash64_hpt_base(PowerPCCPU *cpu)
>   {
>       uint64_t base;
> diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
> index 30e35718a7..8694eccabd 100644
> --- a/target/ppc/mmu-hash32.h
> +++ b/target/ppc/mmu-hash32.h
> @@ -4,9 +4,9 @@
>   #ifndef CONFIG_USER_ONLY
>   
>   hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
> -hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> -                                MMUAccessType access_type, int mmu_idx);
> +bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                      hwaddr *raddrp, int *psizep, int *protp,
> +                      bool guest_visible);
>   
>   /*
>    * Segment register definitions
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 3e8a8eec1f..9f338e1fe9 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -7,9 +7,9 @@
>   void dump_slb(PowerPCCPU *cpu);
>   int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                     target_ulong esid, target_ulong vsid);
> -hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
> -int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> -                                MMUAccessType access_type, int mmu_idx);
> +bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                      hwaddr *raddrp, int *psizep, int *protp,
> +                      bool guest_visible);
>   void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
>                                  target_ulong pte_index,
>                                  target_ulong pte0, target_ulong pte1);
> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
> index 94bd72cb38..6b13b89b64 100644
> --- a/target/ppc/mmu-radix64.h
> +++ b/target/ppc/mmu-radix64.h
> @@ -44,9 +44,9 @@
>   
>   #ifdef TARGET_PPC64
>   
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                 MMUAccessType access_type, int mmu_idx);
> -hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
> +bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                       hwaddr *raddr, int *psizep, int *protp,
> +                       bool guest_visible);
>   
>   static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
>   {
> diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
> index c78fd8dc0e..f4985bae78 100644
> --- a/target/ppc/mmu-book3s-v3.c
> +++ b/target/ppc/mmu-book3s-v3.c
> @@ -23,25 +23,6 @@
>   #include "mmu-book3s-v3.h"
>   #include "mmu-radix64.h"
>   
> -int ppc64_v3_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                              int mmu_idx)
> -{
> -    if (ppc64_v3_radix(cpu)) { /* Guest uses radix */
> -        return ppc_radix64_handle_mmu_fault(cpu, eaddr, rwx, mmu_idx);
> -    } else { /* Guest uses hash */
> -        return ppc_hash64_handle_mmu_fault(cpu, eaddr, rwx, mmu_idx);
> -    }
> -}
> -
> -hwaddr ppc64_v3_get_phys_page_debug(PowerPCCPU *cpu, vaddr eaddr)
> -{
> -    if (ppc64_v3_radix(cpu)) {
> -        return ppc_radix64_get_phys_page_debug(cpu, eaddr);
> -    } else {
> -        return ppc_hash64_get_phys_page_debug(cpu, eaddr);
> -    }
> -}
> -
>   bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
>   {
>       uint64_t patb = cpu->env.spr[SPR_PTCR] & PTCR_PATB;
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index 959dc2ab53..32d1f4a954 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -425,10 +425,9 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
>       return (rpn & ~mask) | (eaddr & mask);
>   }
>   
> -static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
> -                             MMUAccessType access_type,
> -                             hwaddr *raddrp, int *psizep, int *protp,
> -                             bool guest_visible)
> +bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                      hwaddr *raddrp, int *psizep, int *protp,
> +                      bool guest_visible)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> @@ -570,34 +569,3 @@ static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
>       *protp = prot;
>       return true;
>   }
> -
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                MMUAccessType access_type, int mmu_idx)
> -{
> -    CPUState *cs = CPU(cpu);
> -    int page_size, prot;
> -    hwaddr raddr;
> -
> -    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
> -    if (!ppc_hash32_xlate(cpu, eaddr, access_type, &raddr,
> -                           &page_size, &prot, true)) {
> -        return 1;
> -    }
> -
> -    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                 prot, mmu_idx, 1UL << page_size);
> -    return 0;
> -}
> -
> -hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
> -{
> -    int psize, prot;
> -    hwaddr raddr;
> -
> -    if (!ppc_hash32_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> -                           &psize, &prot, false)) {
> -        return -1;
> -    }
> -
> -    return raddr & TARGET_PAGE_MASK;
> -}
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 3024dd1e8c..ce0068590f 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -866,10 +866,9 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
>       return -1;
>   }
>   
> -static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> -                             MMUAccessType access_type,
> -                             hwaddr *raddrp, int *psizep, int *protp,
> -                             bool guest_visible)
> +bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                      hwaddr *raddrp, int *psizep, int *protp,
> +                      bool guest_visible)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> @@ -1087,36 +1086,6 @@ static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>       return true;
>   }
>   
> -int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                MMUAccessType access_type, int mmu_idx)
> -{
> -    CPUState *cs = CPU(cpu);
> -    int page_size, prot;
> -    hwaddr raddr;
> -
> -    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &raddr,
> -                          &page_size, &prot, true)) {
> -        return 1;
> -    }
> -
> -    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                 prot, mmu_idx, 1UL << page_size);
> -    return 0;
> -}
> -
> -hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
> -{
> -    int psize, prot;
> -    hwaddr raddr;
> -
> -    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> -                          &psize, &prot, false)) {
> -        return -1;
> -    }
> -
> -    return raddr & TARGET_PAGE_MASK;
> -}
> -
>   void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
>                                  target_ulong pte0, target_ulong pte1)
>   {
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 7af3e697b2..eabfe4e261 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -464,10 +464,9 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>    *              | = On        | Process Scoped |    Scoped     |
>    *              +-------------+----------------+---------------+
>    */
> -static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> -                              MMUAccessType access_type,
> -                              hwaddr *raddr, int *psizep, int *protp,
> -                              bool guest_visible)
> +bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                       hwaddr *raddr, int *psizep, int *protp,
> +                       bool guest_visible)
>   {
>       CPUPPCState *env = &cpu->env;
>       uint64_t lpid, pid;
> @@ -585,34 +584,3 @@ static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>   
>       return true;
>   }
> -
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                 MMUAccessType access_type, int mmu_idx)
> -{
> -    CPUState *cs = CPU(cpu);
> -    int page_size, prot;
> -    hwaddr raddr;
> -
> -    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
> -    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
> -                           &page_size, &prot, true)) {
> -        return 1;
> -    }
> -
> -    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                 prot, mmu_idx, 1UL << page_size);
> -    return 0;
> -}
> -
> -hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
> -{
> -    int psize, prot;
> -    hwaddr raddr;
> -
> -    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> -                           &psize, &prot, false)) {
> -        return -1;
> -    }
> -
> -    return raddr & TARGET_PAGE_MASK;
> -}
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 68c2e59238..2535ea1836 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2915,98 +2915,72 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
>   
>   /*****************************************************************************/
>   
> -static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                    MMUAccessType access_type, int mmu_idx)
> +static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                      hwaddr *raddrp, int *psizep, int *protp,
> +                      int mmu_idx, bool guest_visible)
>   {
> -    CPUState *cs = CPU(cpu);
> -    int page_size, prot;
> -    hwaddr raddr;
> +    switch (cpu->env.mmu_model) {
> +#if defined(TARGET_PPC64)
> +    case POWERPC_MMU_3_00:
> +        if (ppc64_v3_radix(cpu)) {
> +            return ppc_radix64_xlate(cpu, eaddr, access_type,
> +                                     raddrp, psizep, protp, guest_visible);
> +        }
> +        /* fall through */
> +    case POWERPC_MMU_64B:
> +    case POWERPC_MMU_2_03:
> +    case POWERPC_MMU_2_06:
> +    case POWERPC_MMU_2_07:
> +        return ppc_hash64_xlate(cpu, eaddr, access_type,
> +                                raddrp, psizep, protp, guest_visible);
> +#endif
>   
> -    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &raddr,
> -                         &page_size, &prot, mmu_idx, true)) {
> -        return 1;
> +    case POWERPC_MMU_32B:
> +    case POWERPC_MMU_601:
> +        return ppc_hash32_xlate(cpu, eaddr, access_type,
> +                                raddrp, psizep, protp, guest_visible);
> +
> +    default:
> +        return ppc_jumbo_xlate(cpu, eaddr, access_type, raddrp,
> +                               psizep, protp, mmu_idx, guest_visible);
>       }
> -
> -    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                 prot, mmu_idx, 1UL << page_size);
> -    return 0;
>   }
>   
>   hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>   {
>       PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
>       hwaddr raddr;
>       int s, p;
>   
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
>       /*
>        * Some MMUs have separate TLBs for code and data. If we only
>        * try an MMU_DATA_LOAD, we may not be able to read instructions
>        * mapped by code TLBs, so we also try a MMU_INST_FETCH.
>        */
> -    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
> -        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
> +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
>           return raddr & TARGET_PAGE_MASK;
>       }
>       return -1;
>   }
>   
> -
> -bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
> +bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr)
>   {
>       PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -    int ret;
> +    hwaddr raddr;
> +    int page_size, prot;
>   
> -    switch (env->mmu_model) {
> -#if defined(TARGET_PPC64)
> -    case POWERPC_MMU_64B:
> -    case POWERPC_MMU_2_03:
> -    case POWERPC_MMU_2_06:
> -    case POWERPC_MMU_2_07:
> -        ret = ppc_hash64_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> -        break;
> -    case POWERPC_MMU_3_00:
> -        ret = ppc64_v3_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> -        break;
> -#endif
> -
> -    case POWERPC_MMU_32B:
> -    case POWERPC_MMU_601:
> -        ret = ppc_hash32_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> -        break;
> -
> -    default:
> -        ret = cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> -        break;
> +    if (ppc_xlate(cpu, eaddr, access_type, &raddr,
> +                  &page_size, &prot, mmu_idx, !probe)) {
> +        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> +                     prot, mmu_idx, 1UL << page_size);
> +        return true;
>       }
> -    if (unlikely(ret != 0)) {
> -        if (probe) {
> -            return false;
> -        }
> -        raise_exception_err_ra(env, cs->exception_index, env->error_code,
> -                               retaddr);
> +    if (probe) {
> +        return false;
>       }
> -    return true;
> +    raise_exception_err_ra(&cpu->env, cs->exception_index,
> +                           cpu->env.error_code, retaddr);
>   }
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------4889BE1DD99046589844CB02
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
      cite="mid:20210518201146.794854-24-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">Create one common dispatch for all of the ppc_*_xlate functions.
Use ppc64_v3_radix to directly dispatch between ppc_radix64_xlate
and ppc_hash64_xlate.

Remove the separate *_handle_mmu_fault and *_get_phys_page_debug
functions, using common code for ppc_cpu_tlb_fill and
ppc_cpu_get_phys_page_debug.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    <p>Ah, this finally makes sense! I agree that this solution looks
      quite a bit better than what was here before, and acceptance tests
      say everything is fine, so fwiw<br>
    </p>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-24-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/mmu-book3s-v3.h |   5 --
 target/ppc/mmu-hash32.h    |   6 +--
 target/ppc/mmu-hash64.h    |   6 +--
 target/ppc/mmu-radix64.h   |   6 +--
 target/ppc/mmu-book3s-v3.c |  19 -------
 target/ppc/mmu-hash32.c    |  38 ++-----------
 target/ppc/mmu-hash64.c    |  37 ++-----------
 target/ppc/mmu-radix64.c   |  38 ++-----------
 target/ppc/mmu_helper.c    | 106 ++++++++++++++-----------------------
 9 files changed, 58 insertions(+), 203 deletions(-)

diff --git a/target/ppc/mmu-book3s-v3.h b/target/ppc/mmu-book3s-v3.h
index 7b89be54b8..a1326df969 100644
--- a/target/ppc/mmu-book3s-v3.h
+++ b/target/ppc/mmu-book3s-v3.h
@@ -67,11 +67,6 @@ static inline bool ppc64_v3_radix(PowerPCCPU *cpu)
     return !!(cpu-&gt;env.spr[SPR_LPCR] &amp; LPCR_HR);
 }
 
-hwaddr ppc64_v3_get_phys_page_debug(PowerPCCPU *cpu, vaddr eaddr);
-
-int ppc64_v3_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                              int mmu_idx);
-
 static inline hwaddr ppc_hash64_hpt_base(PowerPCCPU *cpu)
 {
     uint64_t base;
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 30e35718a7..8694eccabd 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -4,9 +4,9 @@
 #ifndef CONFIG_USER_ONLY
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
-hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
-                                MMUAccessType access_type, int mmu_idx);
+bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible);
 
 /*
  * Segment register definitions
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 3e8a8eec1f..9f338e1fe9 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -7,9 +7,9 @@
 void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
-hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
-                                MMUAccessType access_type, int mmu_idx);
+bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible);
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte_index,
                                target_ulong pte0, target_ulong pte1);
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index 94bd72cb38..6b13b89b64 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -44,9 +44,9 @@
 
 #ifdef TARGET_PPC64
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                 MMUAccessType access_type, int mmu_idx);
-hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
+bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                       hwaddr *raddr, int *psizep, int *protp,
+                       bool guest_visible);
 
 static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
 {
diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
index c78fd8dc0e..f4985bae78 100644
--- a/target/ppc/mmu-book3s-v3.c
+++ b/target/ppc/mmu-book3s-v3.c
@@ -23,25 +23,6 @@
 #include "mmu-book3s-v3.h"
 #include "mmu-radix64.h"
 
-int ppc64_v3_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                              int mmu_idx)
-{
-    if (ppc64_v3_radix(cpu)) { /* Guest uses radix */
-        return ppc_radix64_handle_mmu_fault(cpu, eaddr, rwx, mmu_idx);
-    } else { /* Guest uses hash */
-        return ppc_hash64_handle_mmu_fault(cpu, eaddr, rwx, mmu_idx);
-    }
-}
-
-hwaddr ppc64_v3_get_phys_page_debug(PowerPCCPU *cpu, vaddr eaddr)
-{
-    if (ppc64_v3_radix(cpu)) {
-        return ppc_radix64_get_phys_page_debug(cpu, eaddr);
-    } else {
-        return ppc_hash64_get_phys_page_debug(cpu, eaddr);
-    }
-}
-
 bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
 {
     uint64_t patb = cpu-&gt;env.spr[SPR_PTCR] &amp; PTCR_PATB;
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 959dc2ab53..32d1f4a954 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -425,10 +425,9 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn &amp; ~mask) | (eaddr &amp; mask);
 }
 
-static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                             MMUAccessType access_type,
-                             hwaddr *raddrp, int *psizep, int *protp,
-                             bool guest_visible)
+bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -570,34 +569,3 @@ static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
     *protp = prot;
     return true;
 }
-
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
-{
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
-
-    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (!ppc_hash32_xlate(cpu, eaddr, access_type, &amp;raddr,
-                           &amp;page_size, &amp;prot, true)) {
-        return 1;
-    }
-
-    tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL &lt;&lt; page_size);
-    return 0;
-}
-
-hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
-{
-    int psize, prot;
-    hwaddr raddr;
-
-    if (!ppc_hash32_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
-                           &amp;psize, &amp;prot, false)) {
-        return -1;
-    }
-
-    return raddr &amp; TARGET_PAGE_MASK;
-}
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 3024dd1e8c..ce0068590f 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -866,10 +866,9 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
     return -1;
 }
 
-static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                             MMUAccessType access_type,
-                             hwaddr *raddrp, int *psizep, int *protp,
-                             bool guest_visible)
+bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -1087,36 +1086,6 @@ static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     return true;
 }
 
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
-{
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
-
-    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &amp;raddr,
-                          &amp;page_size, &amp;prot, true)) {
-        return 1;
-    }
-
-    tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL &lt;&lt; page_size);
-    return 0;
-}
-
-hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
-{
-    int psize, prot;
-    hwaddr raddr;
-
-    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
-                          &amp;psize, &amp;prot, false)) {
-        return -1;
-    }
-
-    return raddr &amp; TARGET_PAGE_MASK;
-}
-
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
                                target_ulong pte0, target_ulong pte1)
 {
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 7af3e697b2..eabfe4e261 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -464,10 +464,9 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  *              | = On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                              MMUAccessType access_type,
-                              hwaddr *raddr, int *psizep, int *protp,
-                              bool guest_visible)
+bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                       hwaddr *raddr, int *psizep, int *protp,
+                       bool guest_visible)
 {
     CPUPPCState *env = &amp;cpu-&gt;env;
     uint64_t lpid, pid;
@@ -585,34 +584,3 @@ static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
 
     return true;
 }
-
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                 MMUAccessType access_type, int mmu_idx)
-{
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
-
-    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &amp;raddr,
-                           &amp;page_size, &amp;prot, true)) {
-        return 1;
-    }
-
-    tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL &lt;&lt; page_size);
-    return 0;
-}
-
-hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
-{
-    int psize, prot;
-    hwaddr raddr;
-
-    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
-                           &amp;psize, &amp;prot, false)) {
-        return -1;
-    }
-
-    return raddr &amp; TARGET_PAGE_MASK;
-}
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 68c2e59238..2535ea1836 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2915,98 +2915,72 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 
 /*****************************************************************************/
 
-static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                    MMUAccessType access_type, int mmu_idx)
+static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      int mmu_idx, bool guest_visible)
 {
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
+    switch (cpu-&gt;env.mmu_model) {
+#if defined(TARGET_PPC64)
+    case POWERPC_MMU_3_00:
+        if (ppc64_v3_radix(cpu)) {
+            return ppc_radix64_xlate(cpu, eaddr, access_type,
+                                     raddrp, psizep, protp, guest_visible);
+        }
+        /* fall through */
+    case POWERPC_MMU_64B:
+    case POWERPC_MMU_2_03:
+    case POWERPC_MMU_2_06:
+    case POWERPC_MMU_2_07:
+        return ppc_hash64_xlate(cpu, eaddr, access_type,
+                                raddrp, psizep, protp, guest_visible);
+#endif
 
-    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &amp;raddr,
-                         &amp;page_size, &amp;prot, mmu_idx, true)) {
-        return 1;
+    case POWERPC_MMU_32B:
+    case POWERPC_MMU_601:
+        return ppc_hash32_xlate(cpu, eaddr, access_type,
+                                raddrp, psizep, protp, guest_visible);
+
+    default:
+        return ppc_jumbo_xlate(cpu, eaddr, access_type, raddrp,
+                               psizep, protp, mmu_idx, guest_visible);
     }
-
-    tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL &lt;&lt; page_size);
-    return 0;
 }
 
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &amp;cpu-&gt;env;
     hwaddr raddr;
     int s, p;
 
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
     /*
      * Some MMUs have separate TLBs for code and data. If we only
      * try an MMU_DATA_LOAD, we may not be able to read instructions
      * mapped by code TLBs, so we also try a MMU_INST_FETCH.
      */
-    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &amp;raddr, &amp;s, &amp;p, 0, false) ||
-        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &amp;raddr, &amp;s, &amp;p, 0, false)) {
+    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &amp;raddr, &amp;s, &amp;p, 0, false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &amp;raddr, &amp;s, &amp;p, 0, false)) {
         return raddr &amp; TARGET_PAGE_MASK;
     }
     return -1;
 }
 
-
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &amp;cpu-&gt;env;
-    int ret;
+    hwaddr raddr;
+    int page_size, prot;
 
-    switch (env-&gt;mmu_model) {
-#if defined(TARGET_PPC64)
-    case POWERPC_MMU_64B:
-    case POWERPC_MMU_2_03:
-    case POWERPC_MMU_2_06:
-    case POWERPC_MMU_2_07:
-        ret = ppc_hash64_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
-    case POWERPC_MMU_3_00:
-        ret = ppc64_v3_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
-#endif
-
-    case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
-        ret = ppc_hash32_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
-
-    default:
-        ret = cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
+    if (ppc_xlate(cpu, eaddr, access_type, &amp;raddr,
+                  &amp;page_size, &amp;prot, mmu_idx, !probe)) {
+        tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
+                     prot, mmu_idx, 1UL &lt;&lt; page_size);
+        return true;
     }
-    if (unlikely(ret != 0)) {
-        if (probe) {
-            return false;
-        }
-        raise_exception_err_ra(env, cs-&gt;exception_index, env-&gt;error_code,
-                               retaddr);
+    if (probe) {
+        return false;
     }
-    return true;
+    raise_exception_err_ra(&amp;cpu-&gt;env, cs-&gt;exception_index,
+                           cpu-&gt;env.error_code, retaddr);
 }
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

--------------4889BE1DD99046589844CB02--

