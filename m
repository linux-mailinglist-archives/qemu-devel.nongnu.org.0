Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A16A7164
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:39:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPSx-0008NN-6o; Wed, 01 Mar 2023 11:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXPSv-0008Ih-1C; Wed, 01 Mar 2023 11:38:05 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXPSs-0003Ru-Vh; Wed, 01 Mar 2023 11:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6GM6f65FcIcoAv3QJ7AHeEUXyr/zk7arns/ksKx7rUQ=; b=vvxmW0XgNO1IeBqUtXiaRlz1g0
 de/rrZ4Y6gxNaUejAXB0rQILFiJ4HhU1aCj0Io4ZImh+GIqPQPyYwWnXZVS9aeEFuvHPJeYLzT0QZ
 ovPDcLGPeUXdavdATbw2MJFt4MQs57ubXlSVy8XUa3foFFkNxYduPgqipdoJ4olRjxkgDl3P6XB0Z
 CEZNK/aAhd9s9kaOPMByuMXp4yaspyYtNM3vT87sWgXFhifP1aiOq7jox0x8G/gayN80WLHcrT5XW
 qMhGqyUlZvWg/Iw+vcbVSMPpZafUQ/Y0z3ejjXxKZBUzEJeMTo56yukXDm1DNolaKPbOModPB6cjC
 zwlJhwmQZAj+p3x4/B+FLxXV5PV36jKFX0UWYPYPnU1wKCdR0yXZBQVBQa275uodppwTcaFfsDlJ4
 Ya/KFFKXF90M6HC1oK+poRsIDj738phMgS4oVkwmIbTZtBo55BNCGZ9/qtg5cvmp7gcrz9IlzTXN8
 XagWWz6Tgk8NZWMN0SnHBPwXVMefy3eDTlbiDjI402ZccEbYppPqZpfHFfv9sqTAdcH0WUvD6FDx4
 zu86GUelWNIGpS8BeR4a3qTI3+bis5tlvWuqZ5zQr6N41YinpGWkmxttxmnf13CG8lhmagc7sZxtA
 1sXcZjR4hC545J/rugNYS99lSDOqNfHzvPJoGX6Ho=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXPSC-0002IQ-HY; Wed, 01 Mar 2023 16:37:24 +0000
Message-ID: <b4695b14-661e-6cef-bbd9-abc912b64cc0@ilande.co.uk>
Date: Wed, 1 Mar 2023 16:37:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-2-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230223204342.1093632-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 01/13] target/sparc: Use tlb_set_page_full
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23/02/2023 20:43, Richard Henderson wrote:

> Pass CPUTLBEntryFull to get_physical_address instead
> of a collection of pointers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> ---
>   target/sparc/mmu_helper.c | 121 +++++++++++++++++---------------------
>   1 file changed, 54 insertions(+), 67 deletions(-)
> 
> diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
> index 158ec2ae8f..a98dd0abd4 100644
> --- a/target/sparc/mmu_helper.c
> +++ b/target/sparc/mmu_helper.c
> @@ -64,10 +64,9 @@ static const int perm_table[2][8] = {
>       }
>   };
>   
> -static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
> -                                int *prot, int *access_index, MemTxAttrs *attrs,
> -                                target_ulong address, int rw, int mmu_idx,
> -                                target_ulong *page_size)
> +static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
> +                                int *access_index, target_ulong address,
> +                                int rw, int mmu_idx)
>   {
>       int access_perms = 0;
>       hwaddr pde_ptr;
> @@ -80,20 +79,20 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
>       is_user = mmu_idx == MMU_USER_IDX;
>   
>       if (mmu_idx == MMU_PHYS_IDX) {
> -        *page_size = TARGET_PAGE_SIZE;
> +        full->lg_page_size = TARGET_PAGE_BITS;
>           /* Boot mode: instruction fetches are taken from PROM */
>           if (rw == 2 && (env->mmuregs[0] & env->def.mmu_bm)) {
> -            *physical = env->prom_addr | (address & 0x7ffffULL);
> -            *prot = PAGE_READ | PAGE_EXEC;
> +            full->phys_addr = env->prom_addr | (address & 0x7ffffULL);
> +            full->prot = PAGE_READ | PAGE_EXEC;
>               return 0;
>           }
> -        *physical = address;
> -        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        full->phys_addr = address;
> +        full->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return 0;
>       }
>   
>       *access_index = ((rw & 1) << 2) | (rw & 2) | (is_user ? 0 : 1);
> -    *physical = 0xffffffffffff0000ULL;
> +    full->phys_addr = 0xffffffffffff0000ULL;
>   
>       /* SPARC reference MMU table walk: Context table->L1->L2->PTE */
>       /* Context base + context number */
> @@ -157,16 +156,17 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
>                   case 2: /* L3 PTE */
>                       page_offset = 0;
>                   }
> -                *page_size = TARGET_PAGE_SIZE;
> +                full->lg_page_size = TARGET_PAGE_BITS;
>                   break;
>               case 2: /* L2 PTE */
>                   page_offset = address & 0x3f000;
> -                *page_size = 0x40000;
> +                full->lg_page_size = 18;
>               }
>               break;
>           case 2: /* L1 PTE */
>               page_offset = address & 0xfff000;
> -            *page_size = 0x1000000;
> +            full->lg_page_size = 24;
> +            break;
>           }
>       }
>   
> @@ -188,16 +188,16 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
>       }
>   
>       /* the page can be put in the TLB */
> -    *prot = perm_table[is_user][access_perms];
> +    full->prot = perm_table[is_user][access_perms];
>       if (!(pde & PG_MODIFIED_MASK)) {
>           /* only set write access if already dirty... otherwise wait
>              for dirty access */
> -        *prot &= ~PAGE_WRITE;
> +        full->prot &= ~PAGE_WRITE;
>       }
>   
>       /* Even if large ptes, we map only one 4KB page in the cache to
>          avoid filling it too fast */
> -    *physical = ((hwaddr)(pde & PTE_ADDR_MASK) << 4) + page_offset;
> +    full->phys_addr = ((hwaddr)(pde & PTE_ADDR_MASK) << 4) + page_offset;
>       return error_code;
>   }
>   
> @@ -208,11 +208,9 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   {
>       SPARCCPU *cpu = SPARC_CPU(cs);
>       CPUSPARCState *env = &cpu->env;
> -    hwaddr paddr;
> +    CPUTLBEntryFull full = {};
>       target_ulong vaddr;
> -    target_ulong page_size;
> -    int error_code = 0, prot, access_index;
> -    MemTxAttrs attrs = {};
> +    int error_code = 0, access_index;
>   
>       /*
>        * TODO: If we ever need tlb_vaddr_to_host for this target,
> @@ -223,16 +221,15 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       assert(!probe);
>   
>       address &= TARGET_PAGE_MASK;
> -    error_code = get_physical_address(env, &paddr, &prot, &access_index, &attrs,
> -                                      address, access_type,
> -                                      mmu_idx, &page_size);
> +    error_code = get_physical_address(env, &full, &access_index,
> +                                      address, access_type, mmu_idx);
>       vaddr = address;
>       if (likely(error_code == 0)) {
>           qemu_log_mask(CPU_LOG_MMU,
>                         "Translate at %" VADDR_PRIx " -> "
>                         HWADDR_FMT_plx ", vaddr " TARGET_FMT_lx "\n",
> -                      address, paddr, vaddr);
> -        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
> +                      address, full.phys_addr, vaddr);
> +        tlb_set_page_full(cs, mmu_idx, vaddr, &full);
>           return true;
>       }
>   
> @@ -247,8 +244,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              permissions. If no mapping is available, redirect accesses to
>              neverland. Fake/overridden mappings will be flushed when
>              switching to normal mode. */
> -        prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> -        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, TARGET_PAGE_SIZE);
> +        full.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        tlb_set_page_full(cs, mmu_idx, vaddr, &full);
>           return true;
>       } else {
>           if (access_type == MMU_INST_FETCH) {
> @@ -545,8 +542,7 @@ static uint64_t build_sfsr(CPUSPARCState *env, int mmu_idx, int rw)
>       return sfsr;
>   }
>   
> -static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
> -                                     int *prot, MemTxAttrs *attrs,
> +static int get_physical_address_data(CPUSPARCState *env, CPUTLBEntryFull *full,
>                                        target_ulong address, int rw, int mmu_idx)
>   {
>       CPUState *cs = env_cpu(env);
> @@ -579,11 +575,12 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
>   
>       for (i = 0; i < 64; i++) {
>           /* ctx match, vaddr match, valid? */
> -        if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical)) {
> +        if (ultrasparc_tag_match(&env->dtlb[i], address, context,
> +                                 &full->phys_addr)) {
>               int do_fault = 0;
>   
>               if (TTE_IS_IE(env->dtlb[i].tte)) {
> -                attrs->byte_swap = true;
> +                full->attrs.byte_swap = true;
>               }
>   
>               /* access ok? */
> @@ -616,9 +613,9 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
>               }
>   
>               if (!do_fault) {
> -                *prot = PAGE_READ;
> +                full->prot = PAGE_READ;
>                   if (TTE_IS_W_OK(env->dtlb[i].tte)) {
> -                    *prot |= PAGE_WRITE;
> +                    full->prot |= PAGE_WRITE;
>                   }
>   
>                   TTE_SET_USED(env->dtlb[i].tte);
> @@ -645,8 +642,7 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
>       return 1;
>   }
>   
> -static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
> -                                     int *prot, MemTxAttrs *attrs,
> +static int get_physical_address_code(CPUSPARCState *env, CPUTLBEntryFull *full,
>                                        target_ulong address, int mmu_idx)
>   {
>       CPUState *cs = env_cpu(env);
> @@ -681,7 +677,7 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
>       for (i = 0; i < 64; i++) {
>           /* ctx match, vaddr match, valid? */
>           if (ultrasparc_tag_match(&env->itlb[i],
> -                                 address, context, physical)) {
> +                                 address, context, &full->phys_addr)) {
>               /* access ok? */
>               if (TTE_IS_PRIV(env->itlb[i].tte) && is_user) {
>                   /* Fault status register */
> @@ -708,7 +704,7 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
>   
>                   return 1;
>               }
> -            *prot = PAGE_EXEC;
> +            full->prot = PAGE_EXEC;
>               TTE_SET_USED(env->itlb[i].tte);
>               return 0;
>           }
> @@ -722,14 +718,13 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
>       return 1;
>   }
>   
> -static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
> -                                int *prot, int *access_index, MemTxAttrs *attrs,
> -                                target_ulong address, int rw, int mmu_idx,
> -                                target_ulong *page_size)
> +static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
> +                                int *access_index, target_ulong address,
> +                                int rw, int mmu_idx)
>   {
>       /* ??? We treat everything as a small page, then explicitly flush
>          everything when an entry is evicted.  */
> -    *page_size = TARGET_PAGE_SIZE;
> +    full->lg_page_size = TARGET_PAGE_BITS;
>   
>       /* safety net to catch wrong softmmu index use from dynamic code */
>       if (env->tl > 0 && mmu_idx != MMU_NUCLEUS_IDX) {
> @@ -747,17 +742,15 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
>       }
>   
>       if (mmu_idx == MMU_PHYS_IDX) {
> -        *physical = ultrasparc_truncate_physical(address);
> -        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        full->phys_addr = ultrasparc_truncate_physical(address);
> +        full->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return 0;
>       }
>   
>       if (rw == 2) {
> -        return get_physical_address_code(env, physical, prot, attrs, address,
> -                                         mmu_idx);
> +        return get_physical_address_code(env, full, address, mmu_idx);
>       } else {
> -        return get_physical_address_data(env, physical, prot, attrs, address,
> -                                         rw, mmu_idx);
> +        return get_physical_address_data(env, full, address, rw, mmu_idx);
>       }
>   }
>   
> @@ -768,25 +761,17 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   {
>       SPARCCPU *cpu = SPARC_CPU(cs);
>       CPUSPARCState *env = &cpu->env;
> -    target_ulong vaddr;
> -    hwaddr paddr;
> -    target_ulong page_size;
> -    MemTxAttrs attrs = {};
> -    int error_code = 0, prot, access_index;
> +    CPUTLBEntryFull full = {};
> +    int error_code = 0, access_index;
>   
>       address &= TARGET_PAGE_MASK;
> -    error_code = get_physical_address(env, &paddr, &prot, &access_index, &attrs,
> -                                      address, access_type,
> -                                      mmu_idx, &page_size);
> +    error_code = get_physical_address(env, &full, &access_index,
> +                                      address, access_type, mmu_idx);
>       if (likely(error_code == 0)) {
> -        vaddr = address;
> -
> -        trace_mmu_helper_mmu_fault(address, paddr, mmu_idx, env->tl,
> +        trace_mmu_helper_mmu_fault(address, full.phys_addr, mmu_idx, env->tl,
>                                      env->dmmu.mmu_primary_context,
>                                      env->dmmu.mmu_secondary_context);
> -
> -        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, prot, mmu_idx,
> -                                page_size);
> +        tlb_set_page_full(cs, mmu_idx, address, &full);
>           return true;
>       }
>       if (probe) {
> @@ -888,12 +873,14 @@ void dump_mmu(CPUSPARCState *env)
>   static int cpu_sparc_get_phys_page(CPUSPARCState *env, hwaddr *phys,
>                                      target_ulong addr, int rw, int mmu_idx)
>   {
> -    target_ulong page_size;
> -    int prot, access_index;
> -    MemTxAttrs attrs = {};
> +    CPUTLBEntryFull full = {};
> +    int access_index, ret;
>   
> -    return get_physical_address(env, phys, &prot, &access_index, &attrs, addr,
> -                                rw, mmu_idx, &page_size);
> +    ret = get_physical_address(env, &full, &access_index, addr, rw, mmu_idx);
> +    if (ret == 0) {
> +        *phys = full.phys_addr;
> +    }
> +    return ret;
>   }
>   
>   #if defined(TARGET_SPARC64)

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

