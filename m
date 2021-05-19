Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551C8389545
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:26:44 +0200 (CEST)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQu1-0000nP-Kn
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQoW-00044A-G5; Wed, 19 May 2021 14:21:00 -0400
Received: from [201.28.113.2] (port=65057 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQoS-00005U-J6; Wed, 19 May 2021 14:20:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 15:20:51 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 2F1868013F7;
 Wed, 19 May 2021 15:20:51 -0300 (-03)
Subject: Re: [PATCH 21/24] target/ppc: Split out ppc_hash32_xlate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-22-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <f8892275-5d5a-c261-9475-b445bc17eb6b@eldorado.org.br>
Date: Wed, 19 May 2021 15:20:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-22-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------6530EA2F3E65D2D209E6AC37"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 18:20:51.0484 (UTC)
 FILETIME=[B2F79DC0:01D74CDB]
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
--------------6530EA2F3E65D2D209E6AC37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/05/2021 17:11, Richard Henderson wrote:
> Mirror the interface of ppc_radix64_xlate, putting all of
> the logic for hash32 translation into a single entry point.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
I'm a bit out of my depth with the logic here, but I tried some 
acceptance tests, everything worked, and the logic sounds reasonable, so

Acked-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/mmu-hash32.c | 224 ++++++++++++++++++++--------------------
>   1 file changed, 113 insertions(+), 111 deletions(-)
>
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index d51be59f95..959dc2ab53 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -219,10 +219,11 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
>       return -1;
>   }
>   
> -static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
> -                                   target_ulong eaddr,
> -                                   MMUAccessType access_type,
> -                                   hwaddr *raddr, int *prot)
> +static bool ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
> +                                    target_ulong eaddr,
> +                                    MMUAccessType access_type,
> +                                    hwaddr *raddr, int *prot,
> +                                    bool guest_visible)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> @@ -239,17 +240,23 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
>            */
>           *raddr = ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
>           *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> -        return 0;
> +        return true;
>       }
>   
>       if (access_type == MMU_INST_FETCH) {
>           /* No code fetch is allowed in direct-store areas */
> -        cs->exception_index = POWERPC_EXCP_ISI;
> -        env->error_code = 0x10000000;
> -        return 1;
> +        if (guest_visible) {
> +            cs->exception_index = POWERPC_EXCP_ISI;
> +            env->error_code = 0x10000000;
> +        }
> +        return false;
>       }
>   
> -    switch (env->access_type) {
> +    /*
> +     * From ppc_cpu_get_phys_page_debug, env->access_type is not set.
> +     * Assume ACCESS_INT for that case.
> +     */
> +    switch (guest_visible ? env->access_type : ACCESS_INT) {
>       case ACCESS_INT:
>           /* Integer load/store : only access allowed */
>           break;
> @@ -258,7 +265,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
>           cs->exception_index = POWERPC_EXCP_ALIGN;
>           env->error_code = POWERPC_EXCP_ALIGN_FP;
>           env->spr[SPR_DAR] = eaddr;
> -        return 1;
> +        return false;
>       case ACCESS_RES:
>           /* lwarx, ldarx or srwcx. */
>           env->error_code = 0;
> @@ -268,7 +275,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
>           } else {
>               env->spr[SPR_DSISR] = 0x04000000;
>           }
> -        return 1;
> +        return false;
>       case ACCESS_CACHE:
>           /*
>            * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
> @@ -277,7 +284,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
>            * no-op, it's quite easy :-)
>            */
>           *raddr = eaddr;
> -        return 0;
> +        return true;
>       case ACCESS_EXT:
>           /* eciwx or ecowx */
>           cs->exception_index = POWERPC_EXCP_DSI;
> @@ -288,16 +295,18 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
>           } else {
>               env->spr[SPR_DSISR] = 0x04100000;
>           }
> -        return 1;
> +        return false;
>       default:
> -        cpu_abort(cs, "ERROR: instruction should not need "
> -                 "address translation\n");
> +        cpu_abort(cs, "ERROR: insn should not need address translation\n");
>       }
> -    if ((access_type == MMU_DATA_STORE || key != 1) &&
> -        (access_type == MMU_DATA_LOAD || key != 0)) {
> +
> +    *prot = key ? PAGE_READ | PAGE_WRITE : PAGE_READ;
> +    if (*prot & prot_for_access_type(access_type)) {
>           *raddr = eaddr;
> -        return 0;
> -    } else {
> +        return true;
> +    }
> +
> +    if (guest_visible) {
>           cs->exception_index = POWERPC_EXCP_DSI;
>           env->error_code = 0;
>           env->spr[SPR_DAR] = eaddr;
> @@ -306,8 +315,8 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
>           } else {
>               env->spr[SPR_DSISR] = 0x08000000;
>           }
> -        return 1;
>       }
> +    return false;
>   }
>   
>   hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash)
> @@ -416,8 +425,10 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
>       return (rpn & ~mask) | (eaddr & mask);
>   }
>   
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                MMUAccessType access_type, int mmu_idx)
> +static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
> +                             MMUAccessType access_type,
> +                             hwaddr *raddrp, int *psizep, int *protp,
> +                             bool guest_visible)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> @@ -428,43 +439,43 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>       int need_prot;
>       hwaddr raddr;
>   
> -    need_prot = prot_for_access_type(access_type);
> +    /* There are no hash32 large pages. */
> +    *psizep = TARGET_PAGE_BITS;
>   
>       /* 1. Handle real mode accesses */
>       if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
>           /* Translation is off */
> -        raddr = eaddr;
> -        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
> -                     TARGET_PAGE_SIZE);
> -        return 0;
> +        *raddrp = eaddr;
> +        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return true;
>       }
>   
> +    need_prot = prot_for_access_type(access_type);
> +
>       /* 2. Check Block Address Translation entries (BATs) */
>       if (env->nb_BATs != 0) {
> -        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, &prot);
> +        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp);
>           if (raddr != -1) {
> -            if (need_prot & ~prot) {
> -                if (access_type == MMU_INST_FETCH) {
> -                    cs->exception_index = POWERPC_EXCP_ISI;
> -                    env->error_code = 0x08000000;
> -                } else {
> -                    cs->exception_index = POWERPC_EXCP_DSI;
> -                    env->error_code = 0;
> -                    env->spr[SPR_DAR] = eaddr;
> -                    if (access_type == MMU_DATA_STORE) {
> -                        env->spr[SPR_DSISR] = 0x0a000000;
> +            if (need_prot & ~*protp) {
> +                if (guest_visible) {
> +                    if (access_type == MMU_INST_FETCH) {
> +                        cs->exception_index = POWERPC_EXCP_ISI;
> +                        env->error_code = 0x08000000;
>                       } else {
> -                        env->spr[SPR_DSISR] = 0x08000000;
> +                        cs->exception_index = POWERPC_EXCP_DSI;
> +                        env->error_code = 0;
> +                        env->spr[SPR_DAR] = eaddr;
> +                        if (access_type == MMU_DATA_STORE) {
> +                            env->spr[SPR_DSISR] = 0x0a000000;
> +                        } else {
> +                            env->spr[SPR_DSISR] = 0x08000000;
> +                        }
>                       }
>                   }
> -                return 1;
> +                return false;
>               }
> -
> -            tlb_set_page(cs, eaddr & TARGET_PAGE_MASK,
> -                         raddr & TARGET_PAGE_MASK, prot, mmu_idx,
> -                         TARGET_PAGE_SIZE);
> -            return 0;
> +            *raddrp = raddr;
> +            return true;
>           }
>       }
>   
> @@ -473,42 +484,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>   
>       /* 4. Handle direct store segments */
>       if (sr & SR32_T) {
> -        if (ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
> -                                    &raddr, &prot) == 0) {
> -            tlb_set_page(cs, eaddr & TARGET_PAGE_MASK,
> -                         raddr & TARGET_PAGE_MASK, prot, mmu_idx,
> -                         TARGET_PAGE_SIZE);
> -            return 0;
> -        } else {
> -            return 1;
> -        }
> +        return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
> +                                       raddrp, protp, guest_visible);
>       }
>   
>       /* 5. Check for segment level no-execute violation */
>       if (access_type == MMU_INST_FETCH && (sr & SR32_NX)) {
> -        cs->exception_index = POWERPC_EXCP_ISI;
> -        env->error_code = 0x10000000;
> -        return 1;
> +        if (guest_visible) {
> +            cs->exception_index = POWERPC_EXCP_ISI;
> +            env->error_code = 0x10000000;
> +        }
> +        return false;
>       }
>   
>       /* 6. Locate the PTE in the hash table */
>       pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &pte);
>       if (pte_offset == -1) {
> -        if (access_type == MMU_INST_FETCH) {
> -            cs->exception_index = POWERPC_EXCP_ISI;
> -            env->error_code = 0x40000000;
> -        } else {
> -            cs->exception_index = POWERPC_EXCP_DSI;
> -            env->error_code = 0;
> -            env->spr[SPR_DAR] = eaddr;
> -            if (access_type == MMU_DATA_STORE) {
> -                env->spr[SPR_DSISR] = 0x42000000;
> +        if (guest_visible) {
> +            if (access_type == MMU_INST_FETCH) {
> +                cs->exception_index = POWERPC_EXCP_ISI;
> +                env->error_code = 0x40000000;
>               } else {
> -                env->spr[SPR_DSISR] = 0x40000000;
> +                cs->exception_index = POWERPC_EXCP_DSI;
> +                env->error_code = 0;
> +                env->spr[SPR_DAR] = eaddr;
> +                if (access_type == MMU_DATA_STORE) {
> +                    env->spr[SPR_DSISR] = 0x42000000;
> +                } else {
> +                    env->spr[SPR_DSISR] = 0x40000000;
> +                }
>               }
>           }
> -
> -        return 1;
> +        return false;
>       }
>       qemu_log_mask(CPU_LOG_MMU,
>                   "found PTE at offset %08" HWADDR_PRIx "\n", pte_offset);
> @@ -520,20 +527,22 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>       if (need_prot & ~prot) {
>           /* Access right violation */
>           qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
> -        if (access_type == MMU_INST_FETCH) {
> -            cs->exception_index = POWERPC_EXCP_ISI;
> -            env->error_code = 0x08000000;
> -        } else {
> -            cs->exception_index = POWERPC_EXCP_DSI;
> -            env->error_code = 0;
> -            env->spr[SPR_DAR] = eaddr;
> -            if (access_type == MMU_DATA_STORE) {
> -                env->spr[SPR_DSISR] = 0x0a000000;
> +        if (guest_visible) {
> +            if (access_type == MMU_INST_FETCH) {
> +                cs->exception_index = POWERPC_EXCP_ISI;
> +                env->error_code = 0x08000000;
>               } else {
> -                env->spr[SPR_DSISR] = 0x08000000;
> +                cs->exception_index = POWERPC_EXCP_DSI;
> +                env->error_code = 0;
> +                env->spr[SPR_DAR] = eaddr;
> +                if (access_type == MMU_DATA_STORE) {
> +                    env->spr[SPR_DSISR] = 0x0a000000;
> +                } else {
> +                    env->spr[SPR_DSISR] = 0x08000000;
> +                }
>               }
>           }
> -        return 1;
> +        return false;
>       }
>   
>       qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
> @@ -557,45 +566,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>   
>       /* 9. Determine the real address from the PTE */
>   
> -    raddr = ppc_hash32_pte_raddr(sr, pte, eaddr);
> +    *raddrp = ppc_hash32_pte_raddr(sr, pte, eaddr);
> +    *protp = prot;
> +    return true;
> +}
> +
> +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                MMUAccessType access_type, int mmu_idx)
> +{
> +    CPUState *cs = CPU(cpu);
> +    int page_size, prot;
> +    hwaddr raddr;
> +
> +    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
> +    if (!ppc_hash32_xlate(cpu, eaddr, access_type, &raddr,
> +                           &page_size, &prot, true)) {
> +        return 1;
> +    }
>   
>       tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                 prot, mmu_idx, TARGET_PAGE_SIZE);
> -
> +                 prot, mmu_idx, 1UL << page_size);
>       return 0;
>   }
>   
>   hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
>   {
> -    CPUPPCState *env = &cpu->env;
> -    target_ulong sr;
> -    hwaddr pte_offset;
> -    ppc_hash_pte32_t pte;
> -    int prot;
> +    int psize, prot;
> +    hwaddr raddr;
>   
> -    if (msr_dr == 0) {
> -        /* Translation is off */
> -        return eaddr;
> -    }
> -
> -    if (env->nb_BATs != 0) {
> -        hwaddr raddr = ppc_hash32_bat_lookup(cpu, eaddr, 0, &prot);
> -        if (raddr != -1) {
> -            return raddr;
> -        }
> -    }
> -
> -    sr = env->sr[eaddr >> 28];
> -
> -    if (sr & SR32_T) {
> -        /* FIXME: Add suitable debug support for Direct Store segments */
> +    if (!ppc_hash32_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> +                           &psize, &prot, false)) {
>           return -1;
>       }
>   
> -    pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &pte);
> -    if (pte_offset == -1) {
> -        return -1;
> -    }
> -
> -    return ppc_hash32_pte_raddr(sr, pte, eaddr) & TARGET_PAGE_MASK;
> +    return raddr & TARGET_PAGE_MASK;
>   }
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------6530EA2F3E65D2D209E6AC37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 18/05/2021 17:11, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-22-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">Mirror the interface of ppc_radix64_xlate, putting all of
the logic for hash32 translation into a single entry point.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    I'm a bit out of my depth with the logic here, but I tried some
    acceptance tests, everything worked, and the logic sounds
    reasonable, so<br>
    <pre class="moz-quote-pre" wrap="">Acked-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-22-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/mmu-hash32.c | 224 ++++++++++++++++++++--------------------
 1 file changed, 113 insertions(+), 111 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index d51be59f95..959dc2ab53 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -219,10 +219,11 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
     return -1;
 }
 
-static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
-                                   target_ulong eaddr,
-                                   MMUAccessType access_type,
-                                   hwaddr *raddr, int *prot)
+static bool ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
+                                    target_ulong eaddr,
+                                    MMUAccessType access_type,
+                                    hwaddr *raddr, int *prot,
+                                    bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -239,17 +240,23 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
          */
         *raddr = ((sr &amp; 0xF) &lt;&lt; 28) | (eaddr &amp; 0x0FFFFFFF);
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        return 0;
+        return true;
     }
 
     if (access_type == MMU_INST_FETCH) {
         /* No code fetch is allowed in direct-store areas */
-        cs-&gt;exception_index = POWERPC_EXCP_ISI;
-        env-&gt;error_code = 0x10000000;
-        return 1;
+        if (guest_visible) {
+            cs-&gt;exception_index = POWERPC_EXCP_ISI;
+            env-&gt;error_code = 0x10000000;
+        }
+        return false;
     }
 
-    switch (env-&gt;access_type) {
+    /*
+     * From ppc_cpu_get_phys_page_debug, env-&gt;access_type is not set.
+     * Assume ACCESS_INT for that case.
+     */
+    switch (guest_visible ? env-&gt;access_type : ACCESS_INT) {
     case ACCESS_INT:
         /* Integer load/store : only access allowed */
         break;
@@ -258,7 +265,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         cs-&gt;exception_index = POWERPC_EXCP_ALIGN;
         env-&gt;error_code = POWERPC_EXCP_ALIGN_FP;
         env-&gt;spr[SPR_DAR] = eaddr;
-        return 1;
+        return false;
     case ACCESS_RES:
         /* lwarx, ldarx or srwcx. */
         env-&gt;error_code = 0;
@@ -268,7 +275,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env-&gt;spr[SPR_DSISR] = 0x04000000;
         }
-        return 1;
+        return false;
     case ACCESS_CACHE:
         /*
          * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
@@ -277,7 +284,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
          * no-op, it's quite easy :-)
          */
         *raddr = eaddr;
-        return 0;
+        return true;
     case ACCESS_EXT:
         /* eciwx or ecowx */
         cs-&gt;exception_index = POWERPC_EXCP_DSI;
@@ -288,16 +295,18 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env-&gt;spr[SPR_DSISR] = 0x04100000;
         }
-        return 1;
+        return false;
     default:
-        cpu_abort(cs, "ERROR: instruction should not need "
-                 "address translation\n");
+        cpu_abort(cs, "ERROR: insn should not need address translation\n");
     }
-    if ((access_type == MMU_DATA_STORE || key != 1) &amp;&amp;
-        (access_type == MMU_DATA_LOAD || key != 0)) {
+
+    *prot = key ? PAGE_READ | PAGE_WRITE : PAGE_READ;
+    if (*prot &amp; prot_for_access_type(access_type)) {
         *raddr = eaddr;
-        return 0;
-    } else {
+        return true;
+    }
+
+    if (guest_visible) {
         cs-&gt;exception_index = POWERPC_EXCP_DSI;
         env-&gt;error_code = 0;
         env-&gt;spr[SPR_DAR] = eaddr;
@@ -306,8 +315,8 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env-&gt;spr[SPR_DSISR] = 0x08000000;
         }
-        return 1;
     }
+    return false;
 }
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash)
@@ -416,8 +425,10 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn &amp; ~mask) | (eaddr &amp; mask);
 }
 
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
+static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
+                             hwaddr *raddrp, int *psizep, int *protp,
+                             bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -428,43 +439,43 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     int need_prot;
     hwaddr raddr;
 
-    need_prot = prot_for_access_type(access_type);
+    /* There are no hash32 large pages. */
+    *psizep = TARGET_PAGE_BITS;
 
     /* 1. Handle real mode accesses */
     if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
         /* Translation is off */
-        raddr = eaddr;
-        tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
+        *raddrp = eaddr;
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return true;
     }
 
+    need_prot = prot_for_access_type(access_type);
+
     /* 2. Check Block Address Translation entries (BATs) */
     if (env-&gt;nb_BATs != 0) {
-        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, &amp;prot);
+        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp);
         if (raddr != -1) {
-            if (need_prot &amp; ~prot) {
-                if (access_type == MMU_INST_FETCH) {
-                    cs-&gt;exception_index = POWERPC_EXCP_ISI;
-                    env-&gt;error_code = 0x08000000;
-                } else {
-                    cs-&gt;exception_index = POWERPC_EXCP_DSI;
-                    env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_DAR] = eaddr;
-                    if (access_type == MMU_DATA_STORE) {
-                        env-&gt;spr[SPR_DSISR] = 0x0a000000;
+            if (need_prot &amp; ~*protp) {
+                if (guest_visible) {
+                    if (access_type == MMU_INST_FETCH) {
+                        cs-&gt;exception_index = POWERPC_EXCP_ISI;
+                        env-&gt;error_code = 0x08000000;
                     } else {
-                        env-&gt;spr[SPR_DSISR] = 0x08000000;
+                        cs-&gt;exception_index = POWERPC_EXCP_DSI;
+                        env-&gt;error_code = 0;
+                        env-&gt;spr[SPR_DAR] = eaddr;
+                        if (access_type == MMU_DATA_STORE) {
+                            env-&gt;spr[SPR_DSISR] = 0x0a000000;
+                        } else {
+                            env-&gt;spr[SPR_DSISR] = 0x08000000;
+                        }
                     }
                 }
-                return 1;
+                return false;
             }
-
-            tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK,
-                         raddr &amp; TARGET_PAGE_MASK, prot, mmu_idx,
-                         TARGET_PAGE_SIZE);
-            return 0;
+            *raddrp = raddr;
+            return true;
         }
     }
 
@@ -473,42 +484,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
     /* 4. Handle direct store segments */
     if (sr &amp; SR32_T) {
-        if (ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
-                                    &amp;raddr, &amp;prot) == 0) {
-            tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK,
-                         raddr &amp; TARGET_PAGE_MASK, prot, mmu_idx,
-                         TARGET_PAGE_SIZE);
-            return 0;
-        } else {
-            return 1;
-        }
+        return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
+                                       raddrp, protp, guest_visible);
     }
 
     /* 5. Check for segment level no-execute violation */
     if (access_type == MMU_INST_FETCH &amp;&amp; (sr &amp; SR32_NX)) {
-        cs-&gt;exception_index = POWERPC_EXCP_ISI;
-        env-&gt;error_code = 0x10000000;
-        return 1;
+        if (guest_visible) {
+            cs-&gt;exception_index = POWERPC_EXCP_ISI;
+            env-&gt;error_code = 0x10000000;
+        }
+        return false;
     }
 
     /* 6. Locate the PTE in the hash table */
     pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &amp;pte);
     if (pte_offset == -1) {
-        if (access_type == MMU_INST_FETCH) {
-            cs-&gt;exception_index = POWERPC_EXCP_ISI;
-            env-&gt;error_code = 0x40000000;
-        } else {
-            cs-&gt;exception_index = POWERPC_EXCP_DSI;
-            env-&gt;error_code = 0;
-            env-&gt;spr[SPR_DAR] = eaddr;
-            if (access_type == MMU_DATA_STORE) {
-                env-&gt;spr[SPR_DSISR] = 0x42000000;
+        if (guest_visible) {
+            if (access_type == MMU_INST_FETCH) {
+                cs-&gt;exception_index = POWERPC_EXCP_ISI;
+                env-&gt;error_code = 0x40000000;
             } else {
-                env-&gt;spr[SPR_DSISR] = 0x40000000;
+                cs-&gt;exception_index = POWERPC_EXCP_DSI;
+                env-&gt;error_code = 0;
+                env-&gt;spr[SPR_DAR] = eaddr;
+                if (access_type == MMU_DATA_STORE) {
+                    env-&gt;spr[SPR_DSISR] = 0x42000000;
+                } else {
+                    env-&gt;spr[SPR_DSISR] = 0x40000000;
+                }
             }
         }
-
-        return 1;
+        return false;
     }
     qemu_log_mask(CPU_LOG_MMU,
                 "found PTE at offset %08" HWADDR_PRIx "\n", pte_offset);
@@ -520,20 +527,22 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     if (need_prot &amp; ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
-        if (access_type == MMU_INST_FETCH) {
-            cs-&gt;exception_index = POWERPC_EXCP_ISI;
-            env-&gt;error_code = 0x08000000;
-        } else {
-            cs-&gt;exception_index = POWERPC_EXCP_DSI;
-            env-&gt;error_code = 0;
-            env-&gt;spr[SPR_DAR] = eaddr;
-            if (access_type == MMU_DATA_STORE) {
-                env-&gt;spr[SPR_DSISR] = 0x0a000000;
+        if (guest_visible) {
+            if (access_type == MMU_INST_FETCH) {
+                cs-&gt;exception_index = POWERPC_EXCP_ISI;
+                env-&gt;error_code = 0x08000000;
             } else {
-                env-&gt;spr[SPR_DSISR] = 0x08000000;
+                cs-&gt;exception_index = POWERPC_EXCP_DSI;
+                env-&gt;error_code = 0;
+                env-&gt;spr[SPR_DAR] = eaddr;
+                if (access_type == MMU_DATA_STORE) {
+                    env-&gt;spr[SPR_DSISR] = 0x0a000000;
+                } else {
+                    env-&gt;spr[SPR_DSISR] = 0x08000000;
+                }
             }
         }
-        return 1;
+        return false;
     }
 
     qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -557,45 +566,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
     /* 9. Determine the real address from the PTE */
 
-    raddr = ppc_hash32_pte_raddr(sr, pte, eaddr);
+    *raddrp = ppc_hash32_pte_raddr(sr, pte, eaddr);
+    *protp = prot;
+    return true;
+}
+
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
+{
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
+
+    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
+    if (!ppc_hash32_xlate(cpu, eaddr, access_type, &amp;raddr,
+                           &amp;page_size, &amp;prot, true)) {
+        return 1;
+    }
 
     tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                 prot, mmu_idx, TARGET_PAGE_SIZE);
-
+                 prot, mmu_idx, 1UL &lt;&lt; page_size);
     return 0;
 }
 
 hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
 {
-    CPUPPCState *env = &amp;cpu-&gt;env;
-    target_ulong sr;
-    hwaddr pte_offset;
-    ppc_hash_pte32_t pte;
-    int prot;
+    int psize, prot;
+    hwaddr raddr;
 
-    if (msr_dr == 0) {
-        /* Translation is off */
-        return eaddr;
-    }
-
-    if (env-&gt;nb_BATs != 0) {
-        hwaddr raddr = ppc_hash32_bat_lookup(cpu, eaddr, 0, &amp;prot);
-        if (raddr != -1) {
-            return raddr;
-        }
-    }
-
-    sr = env-&gt;sr[eaddr &gt;&gt; 28];
-
-    if (sr &amp; SR32_T) {
-        /* FIXME: Add suitable debug support for Direct Store segments */
+    if (!ppc_hash32_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
+                           &amp;psize, &amp;prot, false)) {
         return -1;
     }
 
-    pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &amp;pte);
-    if (pte_offset == -1) {
-        return -1;
-    }
-
-    return ppc_hash32_pte_raddr(sr, pte, eaddr) &amp; TARGET_PAGE_MASK;
+    return raddr &amp; TARGET_PAGE_MASK;
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

--------------6530EA2F3E65D2D209E6AC37--

