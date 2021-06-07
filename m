Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D739E6C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:39:59 +0200 (CEST)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKAI-0002Kd-QL
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lqK5y-00089p-HW; Mon, 07 Jun 2021 14:35:30 -0400
Received: from [201.28.113.2] (port=39345 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lqK5n-0001Se-4c; Mon, 07 Jun 2021 14:35:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 7 Jun 2021 15:35:08 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 78E0A8014A3;
 Mon,  7 Jun 2021 15:35:07 -0300 (-03)
Subject: Re: [RFC PATCH 2/4] target/ppc: divided mmu_helper.c in 2 files
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
 <20210602192604.90846-3-lucas.araujo@eldorado.org.br>
 <YL2E91r4YCErNp5H@yekko>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <e0aac42a-21e3-928a-b18c-39f55d132af9@eldorado.org.br>
Date: Mon, 7 Jun 2021 15:35:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YL2E91r4YCErNp5H@yekko>
Content-Type: multipart/alternative;
 boundary="------------317D45EF84CF8C560D5F72D1"
Content-Language: en-US
X-OriginalArrivalTime: 07 Jun 2021 18:35:08.0819 (UTC)
 FILETIME=[D7D3CE30:01D75BCB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------317D45EF84CF8C560D5F72D1
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 06/06/2021 23:31, David Gibson wrote:
> On Wed, Jun 02, 2021 at 04:26:02PM -0300, Lucas Mateus Castro (alqotel) wrote:
>> Moved functions in mmu_helper.c that should be compiled in build to
>> mmu_common.c, moved declaration of functions that both files use to
>> cpu.h and moved struct declarations and inline functions needed by
>> both to target/ppc/internal.h. Updated meson.build to compile the
>> new file.
>>
>> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
>> ---
>> Had to turn a few functions non static as it was used by both
>> mmu_common.c and mmu_helper.c. Added the declaration of mmu_ctx_t to
>> cpu.h so functions there can reference it and added the definition to
>> internal.h so functions in both mmu_* files can access it.
>> And maybe the tlb functions should be declared in internal.h instead of
>> cpu.h.
>> ---
>>   target/ppc/cpu.h        |   35 +
>>   target/ppc/internal.h   |   26 +
>>   target/ppc/meson.build  |    6 +-
>>   target/ppc/mmu_common.c | 1606 ++++++++++++++++++++++++++++++++++
>>   target/ppc/mmu_helper.c | 1814 +++------------------------------------
>>   5 files changed, 1774 insertions(+), 1713 deletions(-)
>>   create mode 100644 target/ppc/mmu_common.c
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index b0934d9be4..cfc35ef83e 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -1329,6 +1329,41 @@ void store_booke_tsr(CPUPPCState *env, target_ulong val);
>>   void ppc_tlb_invalidate_all(CPUPPCState *env);
>>   void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr);
>>   void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHypervisor *vhyp);
>> +
>> +typedef struct mmu_ctx_t mmu_ctx_t;
>> +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
>> +                            hwaddr *raddrp,
>> +                            target_ulong address, uint32_t pid, int ext,
>> +                            int i);
>> +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                                     target_ulong eaddr,
>> +                                     MMUAccessType access_type, int type,
>> +                                     int mmu_idx);
>> +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>> +                                        ppcmas_tlb_t *tlb);
>> +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
>> +                            hwaddr *raddrp, target_ulong address,
>> +                            uint32_t pid);
>> +int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                                target_ulong eaddr, MMUAccessType access_type,
>> +                                int type);
>> +static inline int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
>> +                                    int way, int is_code)
>> +{
>> +    int nr;
>> +
>> +    /* Select TLB num in a way from address */
>> +    nr = (eaddr >> TARGET_PAGE_BITS) & (env->tlb_per_way - 1);
>> +    /* Select TLB way */
>> +    nr += env->tlb_per_way * way;
>> +    /* 6xx have separate TLBs for instructions and data */
>> +    if (is_code && env->id_tlbs == 1) {
>> +        nr += env->nb_tlb;
>> +    }
>> +
>> +    return nr;
>> +}
> This is a rather complex and model specific function to have inline in
> a header.
What is the best way to deal with this function? It's used by both 
mmu_helper.c and mmu_common.c so I put it there as a way to keep it 
being an inline function, so it would be best to put it in 
target/ppc/internal.h or maybe just turn it into a not inline function?
>> +
>>   #endif
>>   #endif
>>   
>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>> index 2b4b06eb76..7d2913ec28 100644
>> --- a/target/ppc/internal.h
>> +++ b/target/ppc/internal.h
>> @@ -247,4 +247,30 @@ static inline int prot_for_access_type(MMUAccessType access_type)
>>       g_assert_not_reached();
>>   }
>>   
>> +/* Context used internally during MMU translations */
>> +
>> +struct mmu_ctx_t {
>> +    hwaddr raddr;      /* Real address              */
>> +    hwaddr eaddr;      /* Effective address         */
>> +    int prot;                      /* Protection bits           */
>> +    hwaddr hash[2];    /* Pagetable hash values     */
>> +    target_ulong ptem;             /* Virtual segment ID | API  */
>> +    int key;                       /* Access key                */
>> +    int nx;                        /* Non-execute area          */
>> +};
>> +
>> +/* Common routines used by software and hardware TLBs emulation */
>> +static inline int pte_is_valid(target_ulong pte0)
>> +{
>> +    return pte0 & 0x80000000 ? 1 : 0;
>> +}
>> +
>> +static inline void pte_invalidate(target_ulong *pte0)
>> +{
>> +    *pte0 &= ~0x80000000;
>> +}
>> +
>> +#define PTE_PTEM_MASK 0x7FFFFFBF
>> +#define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
>> +
>>   #endif /* PPC_INTERNAL_H */
>> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
>> index a6a53a8d5c..a54445d0da 100644
>> --- a/target/ppc/meson.build
>> +++ b/target/ppc/meson.build
>> @@ -28,10 +28,12 @@ ppc_softmmu_ss.add(files(
>>     'arch_dump.c',
>>     'machine.c',
>>     'mmu-hash32.c',
>> -  'mmu_helper.c',
>> +  'mmu_common.c',
>>     'monitor.c',
>>   ))
>> -ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
>> +ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
>> +  'mmu_helper.c',
>> +), if_false: files(
>>     'tcg-stub.c'
>>   ))
>>   
>> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
>> new file mode 100644
>> index 0000000000..d95399d67f
>> --- /dev/null
>> +++ b/target/ppc/mmu_common.c
>> @@ -0,0 +1,1606 @@
>> +/*
>> + *  PowerPC CPU initialization for qemu.
>> + *
>> + *  Copyright (C) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2.1 of the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/units.h"
>> +#include "cpu.h"
>> +#include "sysemu/kvm.h"
>> +#include "kvm_ppc.h"
>> +#include "mmu-hash64.h"
>> +#include "mmu-hash32.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/log.h"
>> +#include "helper_regs.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/main-loop.h"
>> +#include "qemu/qemu-print.h"
>> +#include "internal.h"
>> +#include "mmu-book3s-v3.h"
>> +#include "mmu-radix64.h"
>> +
>> +/* #define DEBUG_MMU */
>> +/* #define DEBUG_BATS */
>> +/* #define DEBUG_SOFTWARE_TLB */
>> +/* #define DUMP_PAGE_TABLES */
>> +/* #define FLUSH_ALL_TLBS */
>> +
>> +#ifdef DEBUG_MMU
>> +#  define LOG_MMU_STATE(cpu) log_cpu_state_mask(CPU_LOG_MMU, (cpu), 0)
>> +#else
>> +#  define LOG_MMU_STATE(cpu) do { } while (0)
>> +#endif
>> +
>> +#ifdef DEBUG_SOFTWARE_TLB
>> +#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
>> +#else
>> +#  define LOG_SWTLB(...) do { } while (0)
>> +#endif
>> +
>> +#ifdef DEBUG_BATS
>> +#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
>> +#else
>> +#  define LOG_BATS(...) do { } while (0)
>> +#endif
>> +
>> +/*****************************************************************************/
>> +/* PowerPC MMU emulation */
>> +
>> +static int pp_check(int key, int pp, int nx)
>> +{
>> +    int access;
>> +
>> +    /* Compute access rights */
>> +    access = 0;
>> +    if (key == 0) {
>> +        switch (pp) {
>> +        case 0x0:
>> +        case 0x1:
>> +        case 0x2:
>> +            access |= PAGE_WRITE;
>> +            /* fall through */
>> +        case 0x3:
>> +            access |= PAGE_READ;
>> +            break;
>> +        }
>> +    } else {
>> +        switch (pp) {
>> +        case 0x0:
>> +            access = 0;
>> +            break;
>> +        case 0x1:
>> +        case 0x3:
>> +            access = PAGE_READ;
>> +            break;
>> +        case 0x2:
>> +            access = PAGE_READ | PAGE_WRITE;
>> +            break;
>> +        }
>> +    }
>> +    if (nx == 0) {
>> +        access |= PAGE_EXEC;
>> +    }
>> +
>> +    return access;
>> +}
>> +
>> +static int check_prot(int prot, MMUAccessType access_type)
>> +{
>> +    return prot & prot_for_access_type(access_type) ? 0 : -2;
>> +}
>> +
>> +static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
>> +                            int ret, MMUAccessType access_type)
>> +{
>> +    int store = 0;
>> +
>> +    /* Update page flags */
>> +    if (!(*pte1p & 0x00000100)) {
>> +        /* Update accessed flag */
>> +        *pte1p |= 0x00000100;
>> +        store = 1;
>> +    }
>> +    if (!(*pte1p & 0x00000080)) {
>> +        if (access_type == MMU_DATA_STORE && ret == 0) {
>> +            /* Update changed flag */
>> +            *pte1p |= 0x00000080;
>> +            store = 1;
>> +        } else {
>> +            /* Force page fault for first write access */
>> +            ctx->prot &= ~PAGE_WRITE;
>> +        }
>> +    }
>> +
>> +    return store;
>> +}
>> +
>> +static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
>> +                                target_ulong pte1, int h,
>> +                                MMUAccessType access_type)
>> +{
>> +    target_ulong ptem, mmask;
>> +    int access, ret, pteh, ptev, pp;
>> +
>> +    ret = -1;
>> +    /* Check validity and table match */
>> +    ptev = pte_is_valid(pte0);
>> +    pteh = (pte0 >> 6) & 1;
>> +    if (ptev && h == pteh) {
>> +        /* Check vsid & api */
>> +        ptem = pte0 & PTE_PTEM_MASK;
>> +        mmask = PTE_CHECK_MASK;
>> +        pp = pte1 & 0x00000003;
>> +        if (ptem == ctx->ptem) {
>> +            if (ctx->raddr != (hwaddr)-1ULL) {
>> +                /* all matches should have equal RPN, WIMG & PP */
>> +                if ((ctx->raddr & mmask) != (pte1 & mmask)) {
>> +                    qemu_log_mask(CPU_LOG_MMU, "Bad RPN/WIMG/PP\n");
>> +                    return -3;
>> +                }
>> +            }
>> +            /* Compute access rights */
>> +            access = pp_check(ctx->key, pp, ctx->nx);
>> +            /* Keep the matching PTE information */
>> +            ctx->raddr = pte1;
>> +            ctx->prot = access;
>> +            ret = check_prot(ctx->prot, access_type);
>> +            if (ret == 0) {
>> +                /* Access granted */
>> +                qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
>> +            } else {
>> +                /* Access right violation */
>> +                qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
>> +            }
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                            target_ulong eaddr, MMUAccessType access_type)
>> +{
>> +    ppc6xx_tlb_t *tlb;
>> +    int nr, best, way;
>> +    int ret;
>> +
>> +    best = -1;
>> +    ret = -1; /* No TLB found */
>> +    for (way = 0; way < env->nb_ways; way++) {
>> +        nr = ppc6xx_tlb_getnum(env, eaddr, way, access_type == MMU_INST_FETCH);
>> +        tlb = &env->tlb.tlb6[nr];
>> +        /* This test "emulates" the PTE index match for hardware TLBs */
>> +        if ((eaddr & TARGET_PAGE_MASK) != tlb->EPN) {
>> +            LOG_SWTLB("TLB %d/%d %s [" TARGET_FMT_lx " " TARGET_FMT_lx
>> +                      "] <> " TARGET_FMT_lx "\n", nr, env->nb_tlb,
>> +                      pte_is_valid(tlb->pte0) ? "valid" : "inval",
>> +                      tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE, eaddr);
>> +            continue;
>> +        }
>> +        LOG_SWTLB("TLB %d/%d %s " TARGET_FMT_lx " <> " TARGET_FMT_lx " "
>> +                  TARGET_FMT_lx " %c %c\n", nr, env->nb_tlb,
>> +                  pte_is_valid(tlb->pte0) ? "valid" : "inval",
>> +                  tlb->EPN, eaddr, tlb->pte1,
>> +                  access_type == MMU_DATA_STORE ? 'S' : 'L',
>> +                  access_type == MMU_INST_FETCH ? 'I' : 'D');
>> +        switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
>> +                                     0, access_type)) {
>> +        case -3:
>> +            /* TLB inconsistency */
>> +            return -1;
>> +        case -2:
>> +            /* Access violation */
>> +            ret = -2;
>> +            best = nr;
>> +            break;
>> +        case -1:
>> +        default:
>> +            /* No match */
>> +            break;
>> +        case 0:
>> +            /* access granted */
>> +            /*
>> +             * XXX: we should go on looping to check all TLBs
>> +             *      consistency but we can speed-up the whole thing as
>> +             *      the result would be undefined if TLBs are not
>> +             *      consistent.
>> +             */
>> +            ret = 0;
>> +            best = nr;
>> +            goto done;
>> +        }
>> +    }
>> +    if (best != -1) {
>> +    done:
>> +        LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=%01x ret=%d\n",
>> +                  ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
>> +        /* Update page flags */
>> +        pte_update_flags(ctx, &env->tlb.tlb6[best].pte1, ret, access_type);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +/* Perform BAT hit & translation */
>> +static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
>> +                                 int *validp, int *protp, target_ulong *BATu,
>> +                                 target_ulong *BATl)
>> +{
>> +    target_ulong bl;
>> +    int pp, valid, prot;
>> +
>> +    bl = (*BATu & 0x00001FFC) << 15;
>> +    valid = 0;
>> +    prot = 0;
>> +    if (((msr_pr == 0) && (*BATu & 0x00000002)) ||
>> +        ((msr_pr != 0) && (*BATu & 0x00000001))) {
>> +        valid = 1;
>> +        pp = *BATl & 0x00000003;
>> +        if (pp != 0) {
>> +            prot = PAGE_READ | PAGE_EXEC;
>> +            if (pp == 0x2) {
>> +                prot |= PAGE_WRITE;
>> +            }
>> +        }
>> +    }
>> +    *blp = bl;
>> +    *validp = valid;
>> +    *protp = prot;
>> +}
>> +
>> +static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                           target_ulong virtual, MMUAccessType access_type)
>> +{
>> +    target_ulong *BATlt, *BATut, *BATu, *BATl;
>> +    target_ulong BEPIl, BEPIu, bl;
>> +    int i, valid, prot;
>> +    int ret = -1;
>> +    bool ifetch = access_type == MMU_INST_FETCH;
>> +
>> +    LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
>> +             ifetch ? 'I' : 'D', virtual);
>> +    if (ifetch) {
>> +        BATlt = env->IBAT[1];
>> +        BATut = env->IBAT[0];
>> +    } else {
>> +        BATlt = env->DBAT[1];
>> +        BATut = env->DBAT[0];
>> +    }
>> +    for (i = 0; i < env->nb_BATs; i++) {
>> +        BATu = &BATut[i];
>> +        BATl = &BATlt[i];
>> +        BEPIu = *BATu & 0xF0000000;
>> +        BEPIl = *BATu & 0x0FFE0000;
>> +        bat_size_prot(env, &bl, &valid, &prot, BATu, BATl);
>> +        LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
>> +                 " BATl " TARGET_FMT_lx "\n", __func__,
>> +                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
>> +        if ((virtual & 0xF0000000) == BEPIu &&
>> +            ((virtual & 0x0FFE0000) & ~bl) == BEPIl) {
>> +            /* BAT matches */
>> +            if (valid != 0) {
>> +                /* Get physical address */
>> +                ctx->raddr = (*BATl & 0xF0000000) |
>> +                    ((virtual & 0x0FFE0000 & bl) | (*BATl & 0x0FFE0000)) |
>> +                    (virtual & 0x0001F000);
>> +                /* Compute access rights */
>> +                ctx->prot = prot;
>> +                ret = check_prot(ctx->prot, access_type);
>> +                if (ret == 0) {
>> +                    LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=%c%c\n",
>> +                             i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' : '-',
>> +                             ctx->prot & PAGE_WRITE ? 'W' : '-');
>> +                }
>> +                break;
>> +            }
>> +        }
>> +    }
>> +    if (ret < 0) {
>> +#if defined(DEBUG_BATS)
>> +        if (qemu_log_enabled()) {
>> +            LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", virtual);
>> +            for (i = 0; i < 4; i++) {
>> +                BATu = &BATut[i];
>> +                BATl = &BATlt[i];
>> +                BEPIu = *BATu & 0xF0000000;
>> +                BEPIl = *BATu & 0x0FFE0000;
>> +                bl = (*BATu & 0x00001FFC) << 15;
>> +                LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
>> +                         " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
>> +                         TARGET_FMT_lx " " TARGET_FMT_lx "\n",
>> +                         __func__, ifetch ? 'I' : 'D', i, virtual,
>> +                         *BATu, *BATl, BEPIu, BEPIl, bl);
>> +            }
>> +        }
>> +#endif
>> +    }
>> +    /* No hit */
>> +    return ret;
>> +}
>> +
>> +/* Perform segment based translation */
>> +static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                               target_ulong eaddr, MMUAccessType access_type,
>> +                               int type)
>> +{
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +    hwaddr hash;
>> +    target_ulong vsid;
>> +    int ds, pr, target_page_bits;
>> +    int ret;
>> +    target_ulong sr, pgidx;
>> +
>> +    pr = msr_pr;
>> +    ctx->eaddr = eaddr;
>> +
>> +    sr = env->sr[eaddr >> 28];
>> +    ctx->key = (((sr & 0x20000000) && (pr != 0)) ||
>> +                ((sr & 0x40000000) && (pr == 0))) ? 1 : 0;
>> +    ds = sr & 0x80000000 ? 1 : 0;
>> +    ctx->nx = sr & 0x10000000 ? 1 : 0;
>> +    vsid = sr & 0x00FFFFFF;
>> +    target_page_bits = TARGET_PAGE_BITS;
>> +    qemu_log_mask(CPU_LOG_MMU,
>> +            "Check segment v=" TARGET_FMT_lx " %d " TARGET_FMT_lx
>> +            " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
>> +            " ir=%d dr=%d pr=%d %d t=%d\n",
>> +            eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int)msr_ir,
>> +            (int)msr_dr, pr != 0 ? 1 : 0, access_type == MMU_DATA_STORE, type);
>> +    pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
>> +    hash = vsid ^ pgidx;
>> +    ctx->ptem = (vsid << 7) | (pgidx >> 10);
>> +
>> +    qemu_log_mask(CPU_LOG_MMU,
>> +            "pte segment: key=%d ds %d nx %d vsid " TARGET_FMT_lx "\n",
>> +            ctx->key, ds, ctx->nx, vsid);
>> +    ret = -1;
>> +    if (!ds) {
>> +        /* Check if instruction fetch is allowed, if needed */
>> +        if (type != ACCESS_CODE || ctx->nx == 0) {
>> +            /* Page address translation */
>> +            qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
>> +                    " htab_mask " TARGET_FMT_plx
>> +                    " hash " TARGET_FMT_plx "\n",
>> +                    ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
>> +            ctx->hash[0] = hash;
>> +            ctx->hash[1] = ~hash;
>> +
>> +            /* Initialize real address with an invalid value */
>> +            ctx->raddr = (hwaddr)-1ULL;
>> +            /* Software TLB search */
>> +            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type);
>> +#if defined(DUMP_PAGE_TABLES)
>> +            if (qemu_loglevel_mask(CPU_LOG_MMU)) {
>> +                CPUState *cs = env_cpu(env);
>> +                hwaddr curaddr;
>> +                uint32_t a0, a1, a2, a3;
>> +
>> +                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
>> +                         "\n", ppc_hash32_hpt_base(cpu),
>> +                         ppc_hash32_hpt_mask(env) + 0x80);
>> +                for (curaddr = ppc_hash32_hpt_base(cpu);
>> +                     curaddr < (ppc_hash32_hpt_base(cpu)
>> +                                + ppc_hash32_hpt_mask(cpu) + 0x80);
>> +                     curaddr += 16) {
>> +                    a0 = ldl_phys(cs->as, curaddr);
>> +                    a1 = ldl_phys(cs->as, curaddr + 4);
>> +                    a2 = ldl_phys(cs->as, curaddr + 8);
>> +                    a3 = ldl_phys(cs->as, curaddr + 12);
>> +                    if (a0 != 0 || a1 != 0 || a2 != 0 || a3 != 0) {
>> +                        qemu_log(TARGET_FMT_plx ": %08x %08x %08x %08x\n",
>> +                                 curaddr, a0, a1, a2, a3);
>> +                    }
>> +                }
>> +            }
>> +#endif
>> +        } else {
>> +            qemu_log_mask(CPU_LOG_MMU, "No access allowed\n");
>> +            ret = -3;
>> +        }
>> +    } else {
>> +        target_ulong sr;
>> +
>> +        qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
>> +        /* Direct-store segment : absolutely *BUGGY* for now */
>> +
>> +        /*
>> +         * Direct-store implies a 32-bit MMU.
>> +         * Check the Segment Register's bus unit ID (BUID).
>> +         */
>> +        sr = env->sr[eaddr >> 28];
>> +        if ((sr & 0x1FF00000) >> 20 == 0x07f) {
>> +            /*
>> +             * Memory-forced I/O controller interface access
>> +             *
>> +             * If T=1 and BUID=x'07F', the 601 performs a memory
>> +             * access to SR[28-31] LA[4-31], bypassing all protection
>> +             * mechanisms.
>> +             */
>> +            ctx->raddr = ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
>> +            ctx->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> +            return 0;
>> +        }
>> +
>> +        switch (type) {
>> +        case ACCESS_INT:
>> +            /* Integer load/store : only access allowed */
>> +            break;
>> +        case ACCESS_CODE:
>> +            /* No code fetch is allowed in direct-store areas */
>> +            return -4;
>> +        case ACCESS_FLOAT:
>> +            /* Floating point load/store */
>> +            return -4;
>> +        case ACCESS_RES:
>> +            /* lwarx, ldarx or srwcx. */
>> +            return -4;
>> +        case ACCESS_CACHE:
>> +            /*
>> +             * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
>> +             *
>> +             * Should make the instruction do no-op.  As it already do
>> +             * no-op, it's quite easy :-)
>> +             */
>> +            ctx->raddr = eaddr;
>> +            return 0;
>> +        case ACCESS_EXT:
>> +            /* eciwx or ecowx */
>> +            return -4;
>> +        default:
>> +            qemu_log_mask(CPU_LOG_MMU, "ERROR: instruction should not need "
>> +                          "address translation\n");
>> +            return -4;
>> +        }
>> +        if ((access_type == MMU_DATA_STORE || ctx->key != 1) &&
>> +            (access_type == MMU_DATA_LOAD || ctx->key != 0)) {
>> +            ctx->raddr = eaddr;
>> +            ret = 2;
>> +        } else {
>> +            ret = -2;
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +/* Generic TLB check function for embedded PowerPC implementations */
>> +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
>> +                            hwaddr *raddrp,
>> +                            target_ulong address, uint32_t pid, int ext,
>> +                            int i)
>> +{
>> +    target_ulong mask;
>> +
>> +    /* Check valid flag */
>> +    if (!(tlb->prot & PAGE_VALID)) {
>> +        return -1;
>> +    }
>> +    mask = ~(tlb->size - 1);
>> +    LOG_SWTLB("%s: TLB %d address " TARGET_FMT_lx " PID %u <=> " TARGET_FMT_lx
>> +              " " TARGET_FMT_lx " %u %x\n", __func__, i, address, pid, tlb->EPN,
>> +              mask, (uint32_t)tlb->PID, tlb->prot);
>> +    /* Check PID */
>> +    if (tlb->PID != 0 && tlb->PID != pid) {
>> +        return -1;
>> +    }
>> +    /* Check effective address */
>> +    if ((address & mask) != tlb->EPN) {
>> +        return -1;
>> +    }
>> +    *raddrp = (tlb->RPN & mask) | (address & ~mask);
>> +    if (ext) {
>> +        /* Extend the physical address to 36 bits */
>> +        *raddrp |= (uint64_t)(tlb->RPN & 0xF) << 32;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                                       target_ulong address,
>> +                                       MMUAccessType access_type)
>> +{
>> +    ppcemb_tlb_t *tlb;
>> +    hwaddr raddr;
>> +    int i, ret, zsel, zpr, pr;
>> +
>> +    ret = -1;
>> +    raddr = (hwaddr)-1ULL;
>> +    pr = msr_pr;
>> +    for (i = 0; i < env->nb_tlb; i++) {
>> +        tlb = &env->tlb.tlbe[i];
>> +        if (ppcemb_tlb_check(env, tlb, &raddr, address,
>> +                             env->spr[SPR_40x_PID], 0, i) < 0) {
>> +            continue;
>> +        }
>> +        zsel = (tlb->attr >> 4) & 0xF;
>> +        zpr = (env->spr[SPR_40x_ZPR] >> (30 - (2 * zsel))) & 0x3;
>> +        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
>> +                    __func__, i, zsel, zpr, access_type, tlb->attr);
>> +        /* Check execute enable bit */
>> +        switch (zpr) {
>> +        case 0x2:
>> +            if (pr != 0) {
>> +                goto check_perms;
>> +            }
>> +            /* fall through */
>> +        case 0x3:
>> +            /* All accesses granted */
>> +            ctx->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> +            ret = 0;
>> +            break;
>> +        case 0x0:
>> +            if (pr != 0) {
>> +                /* Raise Zone protection fault.  */
>> +                env->spr[SPR_40x_ESR] = 1 << 22;
>> +                ctx->prot = 0;
>> +                ret = -2;
>> +                break;
>> +            }
>> +            /* fall through */
>> +        case 0x1:
>> +        check_perms:
>> +            /* Check from TLB entry */
>> +            ctx->prot = tlb->prot;
>> +            ret = check_prot(ctx->prot, access_type);
>> +            if (ret == -2) {
>> +                env->spr[SPR_40x_ESR] = 0;
>> +            }
>> +            break;
>> +        }
>> +        if (ret >= 0) {
>> +            ctx->raddr = raddr;
>> +            LOG_SWTLB("%s: access granted " TARGET_FMT_lx " => " TARGET_FMT_plx
>> +                      " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
>> +                      ret);
>> +            return 0;
>> +        }
>> +    }
>> +    LOG_SWTLB("%s: access refused " TARGET_FMT_lx " => " TARGET_FMT_plx
>> +              " %d %d\n", __func__, address, raddr, ctx->prot, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +void store_40x_sler(CPUPPCState *env, uint32_t val)
>> +{
>> +    /* XXX: TO BE FIXED */
>> +    if (val != 0x00000000) {
>> +        cpu_abort(env_cpu(env),
>> +                  "Little-endian regions are not supported by now\n");
>> +    }
>> +    env->spr[SPR_405_SLER] = val;
>> +}
>> +
>> +static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
>> +                              hwaddr *raddr, int *prot, target_ulong address,
>> +                              MMUAccessType access_type, int i)
>> +{
>> +    int prot2;
>> +
>> +    if (ppcemb_tlb_check(env, tlb, raddr, address,
>> +                         env->spr[SPR_BOOKE_PID],
>> +                         !env->nb_pids, i) >= 0) {
>> +        goto found_tlb;
>> +    }
>> +
>> +    if (env->spr[SPR_BOOKE_PID1] &&
>> +        ppcemb_tlb_check(env, tlb, raddr, address,
>> +                         env->spr[SPR_BOOKE_PID1], 0, i) >= 0) {
>> +        goto found_tlb;
>> +    }
>> +
>> +    if (env->spr[SPR_BOOKE_PID2] &&
>> +        ppcemb_tlb_check(env, tlb, raddr, address,
>> +                         env->spr[SPR_BOOKE_PID2], 0, i) >= 0) {
>> +        goto found_tlb;
>> +    }
>> +
>> +    LOG_SWTLB("%s: TLB entry not found\n", __func__);
>> +    return -1;
>> +
>> +found_tlb:
>> +
>> +    if (msr_pr != 0) {
>> +        prot2 = tlb->prot & 0xF;
>> +    } else {
>> +        prot2 = (tlb->prot >> 4) & 0xF;
>> +    }
>> +
>> +    /* Check the address space */
>> +    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb->attr & 1)) {
>> +        LOG_SWTLB("%s: AS doesn't match\n", __func__);
>> +        return -1;
>> +    }
>> +
>> +    *prot = prot2;
>> +    if (prot2 & prot_for_access_type(access_type)) {
>> +        LOG_SWTLB("%s: good TLB!\n", __func__);
>> +        return 0;
>> +    }
>> +
>> +    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
>> +    return access_type == MMU_INST_FETCH ? -3 : -2;
>> +}
>> +
>> +static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                                         target_ulong address,
>> +                                         MMUAccessType access_type)
>> +{
>> +    ppcemb_tlb_t *tlb;
>> +    hwaddr raddr;
>> +    int i, ret;
>> +
>> +    ret = -1;
>> +    raddr = (hwaddr)-1ULL;
>> +    for (i = 0; i < env->nb_tlb; i++) {
>> +        tlb = &env->tlb.tlbe[i];
>> +        ret = mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address,
>> +                                 access_type, i);
>> +        if (ret != -1) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (ret >= 0) {
>> +        ctx->raddr = raddr;
>> +        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " => " TARGET_FMT_plx
>> +                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
>> +                  ret);
>> +    } else {
>> +        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " => " TARGET_FMT_plx
>> +                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>> +                                        ppcmas_tlb_t *tlb)
>> +{
>> +    int tlbm_size;
>> +
>> +    tlbm_size = (tlb->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
>> +
>> +    return 1024ULL << tlbm_size;
>> +}
>> +
>> +/* TLB check function for MAS based SoftTLBs */
>> +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
>> +                            hwaddr *raddrp, target_ulong address,
>> +                            uint32_t pid)
>> +{
>> +    hwaddr mask;
>> +    uint32_t tlb_pid;
>> +
>> +    if (!msr_cm) {
>> +        /* In 32bit mode we can only address 32bit EAs */
>> +        address = (uint32_t)address;
>> +    }
>> +
>> +    /* Check valid flag */
>> +    if (!(tlb->mas1 & MAS1_VALID)) {
>> +        return -1;
>> +    }
>> +
>> +    mask = ~(booke206_tlb_to_page_size(env, tlb) - 1);
>> +    LOG_SWTLB("%s: TLB ADDR=0x" TARGET_FMT_lx " PID=0x%x MAS1=0x%x MAS2=0x%"
>> +              PRIx64 " mask=0x%" HWADDR_PRIx " MAS7_3=0x%" PRIx64 " MAS8=0x%"
>> +              PRIx32 "\n", __func__, address, pid, tlb->mas1, tlb->mas2, mask,
>> +              tlb->mas7_3, tlb->mas8);
>> +
>> +    /* Check PID */
>> +    tlb_pid = (tlb->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT;
>> +    if (tlb_pid != 0 && tlb_pid != pid) {
>> +        return -1;
>> +    }
>> +
>> +    /* Check effective address */
>> +    if ((address & mask) != (tlb->mas2 & MAS2_EPN_MASK)) {
>> +        return -1;
>> +    }
>> +
>> +    if (raddrp) {
>> +        *raddrp = (tlb->mas7_3 & mask) | (address & ~mask);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static bool is_epid_mmu(int mmu_idx)
>> +{
>> +    return mmu_idx == PPC_TLB_EPID_STORE || mmu_idx == PPC_TLB_EPID_LOAD;
>> +}
>> +
>> +static uint32_t mmubooke206_esr(int mmu_idx, MMUAccessType access_type)
>> +{
>> +    uint32_t esr = 0;
>> +    if (access_type == MMU_DATA_STORE) {
>> +        esr |= ESR_ST;
>> +    }
>> +    if (is_epid_mmu(mmu_idx)) {
>> +        esr |= ESR_EPID;
>> +    }
>> +    return esr;
>> +}
>> +
>> +/*
>> + * Get EPID register given the mmu_idx. If this is regular load,
>> + * construct the EPID access bits from current processor state
>> + *
>> + * Get the effective AS and PR bits and the PID. The PID is returned
>> + * only if EPID load is requested, otherwise the caller must detect
>> + * the correct EPID.  Return true if valid EPID is returned.
>> + */
>> +static bool mmubooke206_get_as(CPUPPCState *env,
>> +                               int mmu_idx, uint32_t *epid_out,
>> +                               bool *as_out, bool *pr_out)
>> +{
>> +    if (is_epid_mmu(mmu_idx)) {
>> +        uint32_t epidr;
>> +        if (mmu_idx == PPC_TLB_EPID_STORE) {
>> +            epidr = env->spr[SPR_BOOKE_EPSC];
>> +        } else {
>> +            epidr = env->spr[SPR_BOOKE_EPLC];
>> +        }
>> +        *epid_out = (epidr & EPID_EPID) >> EPID_EPID_SHIFT;
>> +        *as_out = !!(epidr & EPID_EAS);
>> +        *pr_out = !!(epidr & EPID_EPR);
>> +        return true;
>> +    } else {
>> +        *as_out = msr_ds;
>> +        *pr_out = msr_pr;
>> +        return false;
>> +    }
>> +}
>> +
>> +/* Check if the tlb found by hashing really matches */
>> +static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
>> +                                 hwaddr *raddr, int *prot,
>> +                                 target_ulong address,
>> +                                 MMUAccessType access_type, int mmu_idx)
>> +{
>> +    int prot2 = 0;
>> +    uint32_t epid;
>> +    bool as, pr;
>> +    bool use_epid = mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
>> +
>> +    if (!use_epid) {
>> +        if (ppcmas_tlb_check(env, tlb, raddr, address,
>> +                             env->spr[SPR_BOOKE_PID]) >= 0) {
>> +            goto found_tlb;
>> +        }
>> +
>> +        if (env->spr[SPR_BOOKE_PID1] &&
>> +            ppcmas_tlb_check(env, tlb, raddr, address,
>> +                             env->spr[SPR_BOOKE_PID1]) >= 0) {
>> +            goto found_tlb;
>> +        }
>> +
>> +        if (env->spr[SPR_BOOKE_PID2] &&
>> +            ppcmas_tlb_check(env, tlb, raddr, address,
>> +                             env->spr[SPR_BOOKE_PID2]) >= 0) {
>> +            goto found_tlb;
>> +        }
>> +    } else {
>> +        if (ppcmas_tlb_check(env, tlb, raddr, address, epid) >= 0) {
>> +            goto found_tlb;
>> +        }
>> +    }
>> +
>> +    LOG_SWTLB("%s: TLB entry not found\n", __func__);
>> +    return -1;
>> +
>> +found_tlb:
>> +
>> +    if (pr) {
>> +        if (tlb->mas7_3 & MAS3_UR) {
>> +            prot2 |= PAGE_READ;
>> +        }
>> +        if (tlb->mas7_3 & MAS3_UW) {
>> +            prot2 |= PAGE_WRITE;
>> +        }
>> +        if (tlb->mas7_3 & MAS3_UX) {
>> +            prot2 |= PAGE_EXEC;
>> +        }
>> +    } else {
>> +        if (tlb->mas7_3 & MAS3_SR) {
>> +            prot2 |= PAGE_READ;
>> +        }
>> +        if (tlb->mas7_3 & MAS3_SW) {
>> +            prot2 |= PAGE_WRITE;
>> +        }
>> +        if (tlb->mas7_3 & MAS3_SX) {
>> +            prot2 |= PAGE_EXEC;
>> +        }
>> +    }
>> +
>> +    /* Check the address space and permissions */
>> +    if (access_type == MMU_INST_FETCH) {
>> +        /* There is no way to fetch code using epid load */
>> +        assert(!use_epid);
>> +        as = msr_ir;
>> +    }
>> +
>> +    if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
>> +        LOG_SWTLB("%s: AS doesn't match\n", __func__);
>> +        return -1;
>> +    }
>> +
>> +    *prot = prot2;
>> +    if (prot2 & prot_for_access_type(access_type)) {
>> +        LOG_SWTLB("%s: good TLB!\n", __func__);
>> +        return 0;
>> +    }
>> +
>> +    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
>> +    return access_type == MMU_INST_FETCH ? -3 : -2;
>> +}
>> +
>> +static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                                            target_ulong address,
>> +                                            MMUAccessType access_type,
>> +                                            int mmu_idx)
>> +{
>> +    ppcmas_tlb_t *tlb;
>> +    hwaddr raddr;
>> +    int i, j, ret;
>> +
>> +    ret = -1;
>> +    raddr = (hwaddr)-1ULL;
>> +
>> +    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>> +        int ways = booke206_tlb_ways(env, i);
>> +
>> +        for (j = 0; j < ways; j++) {
>> +            tlb = booke206_get_tlbm(env, i, address, j);
>> +            if (!tlb) {
>> +                continue;
>> +            }
>> +            ret = mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, address,
>> +                                        access_type, mmu_idx);
>> +            if (ret != -1) {
>> +                goto found_tlb;
>> +            }
>> +        }
>> +    }
>> +
>> +found_tlb:
>> +
>> +    if (ret >= 0) {
>> +        ctx->raddr = raddr;
>> +        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " => " TARGET_FMT_plx
>> +                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
>> +                  ret);
>> +    } else {
>> +        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " => " TARGET_FMT_plx
>> +                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static const char *book3e_tsize_to_str[32] = {
>> +    "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K",
>> +    "1M", "2M", "4M", "8M", "16M", "32M", "64M", "128M", "256M", "512M",
>> +    "1G", "2G", "4G", "8G", "16G", "32G", "64G", "128G", "256G", "512G",
>> +    "1T", "2T"
>> +};
>> +
>> +static void mmubooke_dump_mmu(CPUPPCState *env)
>> +{
>> +    ppcemb_tlb_t *entry;
>> +    int i;
>> +
>> +    if (kvm_enabled() && !env->kvm_sw_tlb) {
>> +        qemu_printf("Cannot access KVM TLB\n");
>> +        return;
>> +    }
>> +
>> +    qemu_printf("\nTLB:\n");
>> +    qemu_printf("Effective          Physical           Size PID   Prot     "
>> +                "Attr\n");
>> +
>> +    entry = &env->tlb.tlbe[0];
>> +    for (i = 0; i < env->nb_tlb; i++, entry++) {
>> +        hwaddr ea, pa;
>> +        target_ulong mask;
>> +        uint64_t size = (uint64_t)entry->size;
>> +        char size_buf[20];
>> +
>> +        /* Check valid flag */
>> +        if (!(entry->prot & PAGE_VALID)) {
>> +            continue;
>> +        }
>> +
>> +        mask = ~(entry->size - 1);
>> +        ea = entry->EPN & mask;
>> +        pa = entry->RPN & mask;
>> +        /* Extend the physical address to 36 bits */
>> +        pa |= (hwaddr)(entry->RPN & 0xF) << 32;
>> +        if (size >= 1 * MiB) {
>> +            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size / MiB);
>> +        } else {
>> +            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size / KiB);
>> +        }
>> +        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x\n",
>> +                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entry->PID,
>> +                    entry->prot, entry->attr);
>> +    }
>> +
>> +}
>> +
>> +static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int offset,
>> +                                     int tlbsize)
>> +{
>> +    ppcmas_tlb_t *entry;
>> +    int i;
>> +
>> +    qemu_printf("\nTLB%d:\n", tlbn);
>> +    qemu_printf("Effective          Physical           Size TID   TS SRWX"
>> +                " URWX WIMGE U0123\n");
>> +
>> +    entry = &env->tlb.tlbm[offset];
>> +    for (i = 0; i < tlbsize; i++, entry++) {
>> +        hwaddr ea, pa, size;
>> +        int tsize;
>> +
>> +        if (!(entry->mas1 & MAS1_VALID)) {
>> +            continue;
>> +        }
>> +
>> +        tsize = (entry->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
>> +        size = 1024ULL << tsize;
>> +        ea = entry->mas2 & ~(size - 1);
>> +        pa = entry->mas7_3 & ~(size - 1);
>> +
>> +        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c%c%c"
>> +                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
>> +                    (uint64_t)ea, (uint64_t)pa,
>> +                    book3e_tsize_to_str[tsize],
>> +                    (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
>> +                    (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
>> +                    entry->mas7_3 & MAS3_SR ? 'R' : '-',
>> +                    entry->mas7_3 & MAS3_SW ? 'W' : '-',
>> +                    entry->mas7_3 & MAS3_SX ? 'X' : '-',
>> +                    entry->mas7_3 & MAS3_UR ? 'R' : '-',
>> +                    entry->mas7_3 & MAS3_UW ? 'W' : '-',
>> +                    entry->mas7_3 & MAS3_UX ? 'X' : '-',
>> +                    entry->mas2 & MAS2_W ? 'W' : '-',
>> +                    entry->mas2 & MAS2_I ? 'I' : '-',
>> +                    entry->mas2 & MAS2_M ? 'M' : '-',
>> +                    entry->mas2 & MAS2_G ? 'G' : '-',
>> +                    entry->mas2 & MAS2_E ? 'E' : '-',
>> +                    entry->mas7_3 & MAS3_U0 ? '0' : '-',
>> +                    entry->mas7_3 & MAS3_U1 ? '1' : '-',
>> +                    entry->mas7_3 & MAS3_U2 ? '2' : '-',
>> +                    entry->mas7_3 & MAS3_U3 ? '3' : '-');
>> +    }
>> +}
>> +
>> +static void mmubooke206_dump_mmu(CPUPPCState *env)
>> +{
>> +    int offset = 0;
>> +    int i;
>> +
>> +    if (kvm_enabled() && !env->kvm_sw_tlb) {
>> +        qemu_printf("Cannot access KVM TLB\n");
>> +        return;
>> +    }
>> +
>> +    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>> +        int size = booke206_tlb_size(env, i);
>> +
>> +        if (size == 0) {
>> +            continue;
>> +        }
>> +
>> +        mmubooke206_dump_one_tlb(env, i, offset, size);
>> +        offset += size;
>> +    }
>> +}
>> +
>> +static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
>> +{
>> +    target_ulong *BATlt, *BATut, *BATu, *BATl;
>> +    target_ulong BEPIl, BEPIu, bl;
>> +    int i;
>> +
>> +    switch (type) {
>> +    case ACCESS_CODE:
>> +        BATlt = env->IBAT[1];
>> +        BATut = env->IBAT[0];
>> +        break;
>> +    default:
>> +        BATlt = env->DBAT[1];
>> +        BATut = env->DBAT[0];
>> +        break;
>> +    }
>> +
>> +    for (i = 0; i < env->nb_BATs; i++) {
>> +        BATu = &BATut[i];
>> +        BATl = &BATlt[i];
>> +        BEPIu = *BATu & 0xF0000000;
>> +        BEPIl = *BATu & 0x0FFE0000;
>> +        bl = (*BATu & 0x00001FFC) << 15;
>> +        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
>> +                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
>> +                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
>> +                    type == ACCESS_CODE ? "code" : "data", i,
>> +                    *BATu, *BATl, BEPIu, BEPIl, bl);
>> +    }
>> +}
>> +
>> +static void mmu6xx_dump_mmu(CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +    ppc6xx_tlb_t *tlb;
>> +    target_ulong sr;
>> +    int type, way, entry, i;
>> +
>> +    qemu_printf("HTAB base = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(cpu));
>> +    qemu_printf("HTAB mask = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(cpu));
>> +
>> +    qemu_printf("\nSegment registers:\n");
>> +    for (i = 0; i < 32; i++) {
>> +        sr = env->sr[i];
>> +        if (sr & 0x80000000) {
>> +            qemu_printf("%02d T=%d Ks=%d Kp=%d BUID=0x%03x "
>> +                        "CNTLR_SPEC=0x%05x\n", i,
>> +                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
>> +                        sr & 0x20000000 ? 1 : 0, (uint32_t)((sr >> 20) & 0x1FF),
>> +                        (uint32_t)(sr & 0xFFFFF));
>> +        } else {
>> +            qemu_printf("%02d T=%d Ks=%d Kp=%d N=%d VSID=0x%06x\n", i,
>> +                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
>> +                        sr & 0x20000000 ? 1 : 0, sr & 0x10000000 ? 1 : 0,
>> +                        (uint32_t)(sr & 0x00FFFFFF));
>> +        }
>> +    }
>> +
>> +    qemu_printf("\nBATs:\n");
>> +    mmu6xx_dump_BATs(env, ACCESS_INT);
>> +    mmu6xx_dump_BATs(env, ACCESS_CODE);
>> +
>> +    if (env->id_tlbs != 1) {
>> +        qemu_printf("ERROR: 6xx MMU should have separated TLB"
>> +                    " for code and data\n");
>> +    }
>> +
>> +    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
>> +
>> +    for (type = 0; type < 2; type++) {
>> +        for (way = 0; way < env->nb_ways; way++) {
>> +            for (entry = env->nb_tlb * type + env->tlb_per_way * way;
>> +                 entry < (env->nb_tlb * type + env->tlb_per_way * (way + 1));
>> +                 entry++) {
>> +
>> +                tlb = &env->tlb.tlb6[entry];
>> +                qemu_printf("%s TLB %02d/%02d way:%d %s ["
>> +                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
>> +                            type ? "code" : "data", entry % env->nb_tlb,
>> +                            env->nb_tlb, way,
>> +                            pte_is_valid(tlb->pte0) ? "valid" : "inval",
>> +                            tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>> +void dump_mmu(CPUPPCState *env)
>> +{
>> +    switch (env->mmu_model) {
>> +    case POWERPC_MMU_BOOKE:
>> +        mmubooke_dump_mmu(env);
>> +        break;
>> +    case POWERPC_MMU_BOOKE206:
>> +        mmubooke206_dump_mmu(env);
>> +        break;
>> +    case POWERPC_MMU_SOFT_6xx:
>> +    case POWERPC_MMU_SOFT_74xx:
>> +        mmu6xx_dump_mmu(env);
>> +        break;
>> +#if defined(TARGET_PPC64)
>> +    case POWERPC_MMU_64B:
>> +    case POWERPC_MMU_2_03:
>> +    case POWERPC_MMU_2_06:
>> +    case POWERPC_MMU_2_07:
>> +        dump_slb(env_archcpu(env));
>> +        break;
>> +    case POWERPC_MMU_3_00:
>> +        if (ppc64_v3_radix(env_archcpu(env))) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n",
>> +                          __func__);
>> +        } else {
>> +            dump_slb(env_archcpu(env));
>> +        }
>> +        break;
>> +#endif
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
>> +    }
>> +}
>> +
>> +static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
>> +                          MMUAccessType access_type)
>> +{
>> +    int in_plb, ret;
>> +
>> +    ctx->raddr = eaddr;
>> +    ctx->prot = PAGE_READ | PAGE_EXEC;
>> +    ret = 0;
>> +    switch (env->mmu_model) {
>> +    case POWERPC_MMU_SOFT_6xx:
>> +    case POWERPC_MMU_SOFT_74xx:
>> +    case POWERPC_MMU_SOFT_4xx:
>> +    case POWERPC_MMU_REAL:
>> +    case POWERPC_MMU_BOOKE:
>> +        ctx->prot |= PAGE_WRITE;
>> +        break;
>> +
>> +    case POWERPC_MMU_SOFT_4xx_Z:
>> +        if (unlikely(msr_pe != 0)) {
>> +            /*
>> +             * 403 family add some particular protections, using
>> +             * PBL/PBU registers for accesses with no translation.
>> +             */
>> +            in_plb =
>> +                /* Check PLB validity */
>> +                (env->pb[0] < env->pb[1] &&
>> +                 /* and address in plb area */
>> +                 eaddr >= env->pb[0] && eaddr < env->pb[1]) ||
>> +                (env->pb[2] < env->pb[3] &&
>> +                 eaddr >= env->pb[2] && eaddr < env->pb[3]) ? 1 : 0;
>> +            if (in_plb ^ msr_px) {
>> +                /* Access in protected area */
>> +                if (access_type == MMU_DATA_STORE) {
>> +                    /* Access is not allowed */
>> +                    ret = -2;
>> +                }
>> +            } else {
>> +                /* Read-write access is allowed */
>> +                ctx->prot |= PAGE_WRITE;
>> +            }
>> +        }
>> +        break;
>> +
>> +    default:
>> +        /* Caller's checks mean we should never get here for other models */
>> +        abort();
>> +        return -1;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                                     target_ulong eaddr,
>> +                                     MMUAccessType access_type, int type,
>> +                                     int mmu_idx)
>> +{
>> +    int ret = -1;
>> +    bool real_mode = (type == ACCESS_CODE && msr_ir == 0)
>> +        || (type != ACCESS_CODE && msr_dr == 0);
>> +
>> +    switch (env->mmu_model) {
>> +    case POWERPC_MMU_SOFT_6xx:
>> +    case POWERPC_MMU_SOFT_74xx:
>> +        if (real_mode) {
>> +            ret = check_physical(env, ctx, eaddr, access_type);
>> +        } else {
>> +            /* Try to find a BAT */
>> +            if (env->nb_BATs != 0) {
>> +                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type);
>> +            }
>> +            if (ret < 0) {
>> +                /* We didn't match any BAT entry or don't have BATs */
>> +                ret = get_segment_6xx_tlb(env, ctx, eaddr, access_type, type);
>> +            }
>> +        }
>> +        break;
>> +
>> +    case POWERPC_MMU_SOFT_4xx:
>> +    case POWERPC_MMU_SOFT_4xx_Z:
>> +        if (real_mode) {
>> +            ret = check_physical(env, ctx, eaddr, access_type);
>> +        } else {
>> +            ret = mmu40x_get_physical_address(env, ctx, eaddr, access_type);
>> +        }
>> +        break;
>> +    case POWERPC_MMU_BOOKE:
>> +        ret = mmubooke_get_physical_address(env, ctx, eaddr, access_type);
>> +        break;
>> +    case POWERPC_MMU_BOOKE206:
>> +        ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
>> +                                               mmu_idx);
>> +        break;
>> +    case POWERPC_MMU_MPC8xx:
>> +        /* XXX: TODO */
>> +        cpu_abort(env_cpu(env), "MPC8xx MMU model is not implemented\n");
>> +        break;
>> +    case POWERPC_MMU_REAL:
>> +        if (real_mode) {
>> +            ret = check_physical(env, ctx, eaddr, access_type);
>> +        } else {
>> +            cpu_abort(env_cpu(env),
>> +                      "PowerPC in real mode do not do any translation\n");
>> +        }
>> +        return -1;
>> +    default:
>> +        cpu_abort(env_cpu(env), "Unknown or invalid MMU model\n");
>> +        return -1;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> +                                target_ulong eaddr, MMUAccessType access_type,
>> +                                int type)
>> +{
>> +    return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
>> +}
>> +
>> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>> +{
>> +    PowerPCCPU *cpu = POWERPC_CPU(cs);
>> +    CPUPPCState *env = &cpu->env;
>> +    mmu_ctx_t ctx;
>> +
>> +    switch (env->mmu_model) {
>> +#if defined(TARGET_PPC64)
>> +    case POWERPC_MMU_64B:
>> +    case POWERPC_MMU_2_03:
>> +    case POWERPC_MMU_2_06:
>> +    case POWERPC_MMU_2_07:
>> +        return ppc_hash64_get_phys_page_debug(cpu, addr);
>> +    case POWERPC_MMU_3_00:
>> +        return ppc64_v3_get_phys_page_debug(cpu, addr);
>> +#endif
>> +
>> +    case POWERPC_MMU_32B:
>> +    case POWERPC_MMU_601:
>> +        return ppc_hash32_get_phys_page_debug(cpu, addr);
>> +
>> +    default:
>> +        ;
>> +    }
>> +
>> +    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
>> +                                      ACCESS_INT) != 0)) {
>> +
>> +        /*
>> +         * Some MMUs have separate TLBs for code and data. If we only
>> +         * try an ACCESS_INT, we may not be able to read instructions
>> +         * mapped by code TLBs, so we also try a ACCESS_CODE.
>> +         */
>> +        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETCH,
>> +                                          ACCESS_CODE) != 0)) {
>> +            return -1;
>> +        }
>> +    }
>> +
>> +    return ctx.raddr & TARGET_PAGE_MASK;
>> +}
>> +
>> +static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
>> +                                         MMUAccessType access_type, int mmu_idx)
>> +{
>> +    uint32_t epid;
>> +    bool as, pr;
>> +    uint32_t missed_tid = 0;
>> +    bool use_epid = mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
>> +
>> +    if (access_type == MMU_INST_FETCH) {
>> +        as = msr_ir;
>> +    }
>> +    env->spr[SPR_BOOKE_MAS0] = env->spr[SPR_BOOKE_MAS4] & MAS4_TLBSELD_MASK;
>> +    env->spr[SPR_BOOKE_MAS1] = env->spr[SPR_BOOKE_MAS4] & MAS4_TSIZED_MASK;
>> +    env->spr[SPR_BOOKE_MAS2] = env->spr[SPR_BOOKE_MAS4] & MAS4_WIMGED_MASK;
>> +    env->spr[SPR_BOOKE_MAS3] = 0;
>> +    env->spr[SPR_BOOKE_MAS6] = 0;
>> +    env->spr[SPR_BOOKE_MAS7] = 0;
>> +
>> +    /* AS */
>> +    if (as) {
>> +        env->spr[SPR_BOOKE_MAS1] |= MAS1_TS;
>> +        env->spr[SPR_BOOKE_MAS6] |= MAS6_SAS;
>> +    }
>> +
>> +    env->spr[SPR_BOOKE_MAS1] |= MAS1_VALID;
>> +    env->spr[SPR_BOOKE_MAS2] |= address & MAS2_EPN_MASK;
>> +
>> +    if (!use_epid) {
>> +        switch (env->spr[SPR_BOOKE_MAS4] & MAS4_TIDSELD_PIDZ) {
>> +        case MAS4_TIDSELD_PID0:
>> +            missed_tid = env->spr[SPR_BOOKE_PID];
>> +            break;
>> +        case MAS4_TIDSELD_PID1:
>> +            missed_tid = env->spr[SPR_BOOKE_PID1];
>> +            break;
>> +        case MAS4_TIDSELD_PID2:
>> +            missed_tid = env->spr[SPR_BOOKE_PID2];
>> +            break;
>> +        }
>> +        env->spr[SPR_BOOKE_MAS6] |= env->spr[SPR_BOOKE_PID] << 16;
>> +    } else {
>> +        missed_tid = epid;
>> +        env->spr[SPR_BOOKE_MAS6] |= missed_tid << 16;
>> +    }
>> +    env->spr[SPR_BOOKE_MAS1] |= (missed_tid << MAS1_TID_SHIFT);
>> +
>> +
>> +    /* next victim logic */
>> +    env->spr[SPR_BOOKE_MAS0] |= env->last_way << MAS0_ESEL_SHIFT;
>> +    env->last_way++;
>> +    env->last_way &= booke206_tlb_ways(env, 0) - 1;
>> +    env->spr[SPR_BOOKE_MAS0] |= env->last_way << MAS0_NV_SHIFT;
>> +}
>> +
>> +/* Perform address translation */
>> +static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>> +                                    MMUAccessType access_type, int mmu_idx)
>> +{
>> +    CPUState *cs = env_cpu(env);
>> +    PowerPCCPU *cpu = POWERPC_CPU(cs);
>> +    mmu_ctx_t ctx;
>> +    int type;
>> +    int ret = 0;
>> +
>> +    if (access_type == MMU_INST_FETCH) {
>> +        /* code access */
>> +        type = ACCESS_CODE;
>> +    } else {
>> +        /* data access */
>> +        type = env->access_type;
>> +    }
>> +    ret = get_physical_address_wtlb(env, &ctx, address, access_type,
>> +                                    type, mmu_idx);
>> +    if (ret == 0) {
>> +        tlb_set_page(cs, address & TARGET_PAGE_MASK,
>> +                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
>> +                     mmu_idx, TARGET_PAGE_SIZE);
>> +        ret = 0;
>> +    } else if (ret < 0) {
>> +        LOG_MMU_STATE(cs);
>> +        if (type == ACCESS_CODE) {
>> +            switch (ret) {
>> +            case -1:
>> +                /* No matches in page tables or TLB */
>> +                switch (env->mmu_model) {
>> +                case POWERPC_MMU_SOFT_6xx:
>> +                    cs->exception_index = POWERPC_EXCP_IFTLB;
>> +                    env->error_code = 1 << 18;
>> +                    env->spr[SPR_IMISS] = address;
>> +                    env->spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
>> +                    goto tlb_miss;
>> +                case POWERPC_MMU_SOFT_74xx:
>> +                    cs->exception_index = POWERPC_EXCP_IFTLB;
>> +                    goto tlb_miss_74xx;
>> +                case POWERPC_MMU_SOFT_4xx:
>> +                case POWERPC_MMU_SOFT_4xx_Z:
>> +                    cs->exception_index = POWERPC_EXCP_ITLB;
>> +                    env->error_code = 0;
>> +                    env->spr[SPR_40x_DEAR] = address;
>> +                    env->spr[SPR_40x_ESR] = 0x00000000;
>> +                    break;
>> +                case POWERPC_MMU_BOOKE206:
>> +                    booke206_update_mas_tlb_miss(env, address, 2, mmu_idx);
>> +                    /* fall through */
>> +                case POWERPC_MMU_BOOKE:
>> +                    cs->exception_index = POWERPC_EXCP_ITLB;
>> +                    env->error_code = 0;
>> +                    env->spr[SPR_BOOKE_DEAR] = address;
>> +                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
>> +                    return -1;
>> +                case POWERPC_MMU_MPC8xx:
>> +                    /* XXX: TODO */
>> +                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
>> +                    break;
>> +                case POWERPC_MMU_REAL:
>> +                    cpu_abort(cs, "PowerPC in real mode should never raise "
>> +                              "any MMU exceptions\n");
>> +                    return -1;
>> +                default:
>> +                    cpu_abort(cs, "Unknown or invalid MMU model\n");
>> +                    return -1;
>> +                }
>> +                break;
>> +            case -2:
>> +                /* Access rights violation */
>> +                cs->exception_index = POWERPC_EXCP_ISI;
>> +                env->error_code = 0x08000000;
>> +                break;
>> +            case -3:
>> +                /* No execute protection violation */
>> +                if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
>> +                    (env->mmu_model == POWERPC_MMU_BOOKE206)) {
>> +                    env->spr[SPR_BOOKE_ESR] = 0x00000000;
>> +                }
>> +                cs->exception_index = POWERPC_EXCP_ISI;
>> +                env->error_code = 0x10000000;
>> +                break;
>> +            case -4:
>> +                /* Direct store exception */
>> +                /* No code fetch is allowed in direct-store areas */
>> +                cs->exception_index = POWERPC_EXCP_ISI;
>> +                env->error_code = 0x10000000;
>> +                break;
>> +            }
>> +        } else {
>> +            switch (ret) {
>> +            case -1:
>> +                /* No matches in page tables or TLB */
>> +                switch (env->mmu_model) {
>> +                case POWERPC_MMU_SOFT_6xx:
>> +                    if (access_type == MMU_DATA_STORE) {
>> +                        cs->exception_index = POWERPC_EXCP_DSTLB;
>> +                        env->error_code = 1 << 16;
>> +                    } else {
>> +                        cs->exception_index = POWERPC_EXCP_DLTLB;
>> +                        env->error_code = 0;
>> +                    }
>> +                    env->spr[SPR_DMISS] = address;
>> +                    env->spr[SPR_DCMP] = 0x80000000 | ctx.ptem;
>> +                tlb_miss:
>> +                    env->error_code |= ctx.key << 19;
>> +                    env->spr[SPR_HASH1] = ppc_hash32_hpt_base(cpu) +
>> +                        get_pteg_offset32(cpu, ctx.hash[0]);
>> +                    env->spr[SPR_HASH2] = ppc_hash32_hpt_base(cpu) +
>> +                        get_pteg_offset32(cpu, ctx.hash[1]);
>> +                    break;
>> +                case POWERPC_MMU_SOFT_74xx:
>> +                    if (access_type == MMU_DATA_STORE) {
>> +                        cs->exception_index = POWERPC_EXCP_DSTLB;
>> +                    } else {
>> +                        cs->exception_index = POWERPC_EXCP_DLTLB;
>> +                    }
>> +                tlb_miss_74xx:
>> +                    /* Implement LRU algorithm */
>> +                    env->error_code = ctx.key << 19;
>> +                    env->spr[SPR_TLBMISS] = (address & ~((target_ulong)0x3)) |
>> +                        ((env->last_way + 1) & (env->nb_ways - 1));
>> +                    env->spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
>> +                    break;
>> +                case POWERPC_MMU_SOFT_4xx:
>> +                case POWERPC_MMU_SOFT_4xx_Z:
>> +                    cs->exception_index = POWERPC_EXCP_DTLB;
>> +                    env->error_code = 0;
>> +                    env->spr[SPR_40x_DEAR] = address;
>> +                    if (access_type == MMU_DATA_STORE) {
>> +                        env->spr[SPR_40x_ESR] = 0x00800000;
>> +                    } else {
>> +                        env->spr[SPR_40x_ESR] = 0x00000000;
>> +                    }
>> +                    break;
>> +                case POWERPC_MMU_MPC8xx:
>> +                    /* XXX: TODO */
>> +                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
>> +                    break;
>> +                case POWERPC_MMU_BOOKE206:
>> +                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
>> +                    /* fall through */
>> +                case POWERPC_MMU_BOOKE:
>> +                    cs->exception_index = POWERPC_EXCP_DTLB;
>> +                    env->error_code = 0;
>> +                    env->spr[SPR_BOOKE_DEAR] = address;
>> +                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
>> +                    return -1;
>> +                case POWERPC_MMU_REAL:
>> +                    cpu_abort(cs, "PowerPC in real mode should never raise "
>> +                              "any MMU exceptions\n");
>> +                    return -1;
>> +                default:
>> +                    cpu_abort(cs, "Unknown or invalid MMU model\n");
>> +                    return -1;
>> +                }
>> +                break;
>> +            case -2:
>> +                /* Access rights violation */
>> +                cs->exception_index = POWERPC_EXCP_DSI;
>> +                env->error_code = 0;
>> +                if (env->mmu_model == POWERPC_MMU_SOFT_4xx
>> +                    || env->mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
>> +                    env->spr[SPR_40x_DEAR] = address;
>> +                    if (access_type == MMU_DATA_STORE) {
>> +                        env->spr[SPR_40x_ESR] |= 0x00800000;
>> +                    }
>> +                } else if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
>> +                           (env->mmu_model == POWERPC_MMU_BOOKE206)) {
>> +                    env->spr[SPR_BOOKE_DEAR] = address;
>> +                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
>> +                } else {
>> +                    env->spr[SPR_DAR] = address;
>> +                    if (access_type == MMU_DATA_STORE) {
>> +                        env->spr[SPR_DSISR] = 0x0A000000;
>> +                    } else {
>> +                        env->spr[SPR_DSISR] = 0x08000000;
>> +                    }
>> +                }
>> +                break;
>> +            case -4:
>> +                /* Direct store exception */
>> +                switch (type) {
>> +                case ACCESS_FLOAT:
>> +                    /* Floating point load/store */
>> +                    cs->exception_index = POWERPC_EXCP_ALIGN;
>> +                    env->error_code = POWERPC_EXCP_ALIGN_FP;
>> +                    env->spr[SPR_DAR] = address;
>> +                    break;
>> +                case ACCESS_RES:
>> +                    /* lwarx, ldarx or stwcx. */
>> +                    cs->exception_index = POWERPC_EXCP_DSI;
>> +                    env->error_code = 0;
>> +                    env->spr[SPR_DAR] = address;
>> +                    if (access_type == MMU_DATA_STORE) {
>> +                        env->spr[SPR_DSISR] = 0x06000000;
>> +                    } else {
>> +                        env->spr[SPR_DSISR] = 0x04000000;
>> +                    }
>> +                    break;
>> +                case ACCESS_EXT:
>> +                    /* eciwx or ecowx */
>> +                    cs->exception_index = POWERPC_EXCP_DSI;
>> +                    env->error_code = 0;
>> +                    env->spr[SPR_DAR] = address;
>> +                    if (access_type == MMU_DATA_STORE) {
>> +                        env->spr[SPR_DSISR] = 0x06100000;
>> +                    } else {
>> +                        env->spr[SPR_DSISR] = 0x04100000;
>> +                    }
>> +                    break;
>> +                default:
>> +                    printf("DSI: invalid exception (%d)\n", ret);
>> +                    cs->exception_index = POWERPC_EXCP_PROGRAM;
>> +                    env->error_code =
>> +                        POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
>> +                    env->spr[SPR_DAR] = address;
>> +                    break;
>> +                }
>> +                break;
>> +            }
>> +        }
>> +        ret = 1;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>> +                      MMUAccessType access_type, int mmu_idx,
>> +                      bool probe, uintptr_t retaddr)
>> +{
>> +    PowerPCCPU *cpu = POWERPC_CPU(cs);
>> +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
>> +    CPUPPCState *env = &cpu->env;
>> +    int ret;
>> +
>> +    if (pcc->handle_mmu_fault) {
>> +        ret = pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
>> +    } else {
>> +        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
>> +    }
>> +    if (unlikely(ret != 0)) {
>> +        if (probe) {
>> +            return false;
>> +        }
>> +        raise_exception_err_ra(env, cs->exception_index, env->error_code,
>> +                               retaddr);
>> +    }
>> +    return true;
>> +}
>> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
>> index 803b66f2b0..dbf7b398cd 100644
>> --- a/target/ppc/mmu_helper.c
>> +++ b/target/ppc/mmu_helper.c
>> @@ -33,1736 +33,156 @@
>>   #include "internal.h"
>>   #include "mmu-book3s-v3.h"
>>   #include "mmu-radix64.h"
>> +#include "exec/helper-proto.h"
>> +#include "exec/cpu_ldst.h"
>>   
>> -#ifdef CONFIG_TCG
>> -#include "exec/helper-proto.h"
>> -#include "exec/cpu_ldst.h"
>> -#endif
>> -/* #define DEBUG_MMU */
>> -/* #define DEBUG_BATS */
>> -/* #define DEBUG_SOFTWARE_TLB */
>> -/* #define DUMP_PAGE_TABLES */
>> -/* #define FLUSH_ALL_TLBS */
>> -
>> -#ifdef DEBUG_MMU
>> -#  define LOG_MMU_STATE(cpu) log_cpu_state_mask(CPU_LOG_MMU, (cpu), 0)
>> -#else
>> -#  define LOG_MMU_STATE(cpu) do { } while (0)
>> -#endif
>> -
>> -#ifdef DEBUG_SOFTWARE_TLB
>> -#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
>> -#else
>> -#  define LOG_SWTLB(...) do { } while (0)
>> -#endif
>> -
>> -#ifdef DEBUG_BATS
>> -#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
>> -#else
>> -#  define LOG_BATS(...) do { } while (0)
>> -#endif
>> -
>> -/*****************************************************************************/
>> -/* PowerPC MMU emulation */
>> -
>> -/* Context used internally during MMU translations */
>> -typedef struct mmu_ctx_t mmu_ctx_t;
>> -struct mmu_ctx_t {
>> -    hwaddr raddr;      /* Real address              */
>> -    hwaddr eaddr;      /* Effective address         */
>> -    int prot;                      /* Protection bits           */
>> -    hwaddr hash[2];    /* Pagetable hash values     */
>> -    target_ulong ptem;             /* Virtual segment ID | API  */
>> -    int key;                       /* Access key                */
>> -    int nx;                        /* Non-execute area          */
>> -};
>> -
>> -/* Common routines used by software and hardware TLBs emulation */
>> -static inline int pte_is_valid(target_ulong pte0)
>> -{
>> -    return pte0 & 0x80000000 ? 1 : 0;
>> -}
>> -
>> -static inline void pte_invalidate(target_ulong *pte0)
>> -{
>> -    *pte0 &= ~0x80000000;
>> -}
>> -
>> -#define PTE_PTEM_MASK 0x7FFFFFBF
>> -#define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
>> -
>> -static int pp_check(int key, int pp, int nx)
>> -{
>> -    int access;
>> -
>> -    /* Compute access rights */
>> -    access = 0;
>> -    if (key == 0) {
>> -        switch (pp) {
>> -        case 0x0:
>> -        case 0x1:
>> -        case 0x2:
>> -            access |= PAGE_WRITE;
>> -            /* fall through */
>> -        case 0x3:
>> -            access |= PAGE_READ;
>> -            break;
>> -        }
>> -    } else {
>> -        switch (pp) {
>> -        case 0x0:
>> -            access = 0;
>> -            break;
>> -        case 0x1:
>> -        case 0x3:
>> -            access = PAGE_READ;
>> -            break;
>> -        case 0x2:
>> -            access = PAGE_READ | PAGE_WRITE;
>> -            break;
>> -        }
>> -    }
>> -    if (nx == 0) {
>> -        access |= PAGE_EXEC;
>> -    }
>> -
>> -    return access;
>> -}
>> -
>> -static int check_prot(int prot, MMUAccessType access_type)
>> -{
>> -    return prot & prot_for_access_type(access_type) ? 0 : -2;
>> -}
>> -
>> -static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
>> -                                target_ulong pte1, int h,
>> -                                MMUAccessType access_type)
>> -{
>> -    target_ulong ptem, mmask;
>> -    int access, ret, pteh, ptev, pp;
>> -
>> -    ret = -1;
>> -    /* Check validity and table match */
>> -    ptev = pte_is_valid(pte0);
>> -    pteh = (pte0 >> 6) & 1;
>> -    if (ptev && h == pteh) {
>> -        /* Check vsid & api */
>> -        ptem = pte0 & PTE_PTEM_MASK;
>> -        mmask = PTE_CHECK_MASK;
>> -        pp = pte1 & 0x00000003;
>> -        if (ptem == ctx->ptem) {
>> -            if (ctx->raddr != (hwaddr)-1ULL) {
>> -                /* all matches should have equal RPN, WIMG & PP */
>> -                if ((ctx->raddr & mmask) != (pte1 & mmask)) {
>> -                    qemu_log_mask(CPU_LOG_MMU, "Bad RPN/WIMG/PP\n");
>> -                    return -3;
>> -                }
>> -            }
>> -            /* Compute access rights */
>> -            access = pp_check(ctx->key, pp, ctx->nx);
>> -            /* Keep the matching PTE information */
>> -            ctx->raddr = pte1;
>> -            ctx->prot = access;
>> -            ret = check_prot(ctx->prot, access_type);
>> -            if (ret == 0) {
>> -                /* Access granted */
>> -                qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
>> -            } else {
>> -                /* Access right violation */
>> -                qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
>> -            }
>> -        }
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
>> -                            int ret, MMUAccessType access_type)
>> -{
>> -    int store = 0;
>> -
>> -    /* Update page flags */
>> -    if (!(*pte1p & 0x00000100)) {
>> -        /* Update accessed flag */
>> -        *pte1p |= 0x00000100;
>> -        store = 1;
>> -    }
>> -    if (!(*pte1p & 0x00000080)) {
>> -        if (access_type == MMU_DATA_STORE && ret == 0) {
>> -            /* Update changed flag */
>> -            *pte1p |= 0x00000080;
>> -            store = 1;
>> -        } else {
>> -            /* Force page fault for first write access */
>> -            ctx->prot &= ~PAGE_WRITE;
>> -        }
>> -    }
>> -
>> -    return store;
>> -}
>> -
>> -/* Software driven TLB helpers */
>> -static inline int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
>> -                                    int way, int is_code)
>> -{
>> -    int nr;
>> -
>> -    /* Select TLB num in a way from address */
>> -    nr = (eaddr >> TARGET_PAGE_BITS) & (env->tlb_per_way - 1);
>> -    /* Select TLB way */
>> -    nr += env->tlb_per_way * way;
>> -    /* 6xx have separate TLBs for instructions and data */
>> -    if (is_code && env->id_tlbs == 1) {
>> -        nr += env->nb_tlb;
>> -    }
>> -
>> -    return nr;
>> -}
>> -
>> -static inline void ppc6xx_tlb_invalidate_all(CPUPPCState *env)
>> -{
>> -    ppc6xx_tlb_t *tlb;
>> -    int nr, max;
>> -
>> -    /* LOG_SWTLB("Invalidate all TLBs\n"); */
>> -    /* Invalidate all defined software TLB */
>> -    max = env->nb_tlb;
>> -    if (env->id_tlbs == 1) {
>> -        max *= 2;
>> -    }
>> -    for (nr = 0; nr < max; nr++) {
>> -        tlb = &env->tlb.tlb6[nr];
>> -        pte_invalidate(&tlb->pte0);
>> -    }
>> -    tlb_flush(env_cpu(env));
>> -}
>> -
>> -static inline void ppc6xx_tlb_invalidate_virt2(CPUPPCState *env,
>> -                                               target_ulong eaddr,
>> -                                               int is_code, int match_epn)
>> -{
>> -#if !defined(FLUSH_ALL_TLBS)
>> -    CPUState *cs = env_cpu(env);
>> -    ppc6xx_tlb_t *tlb;
>> -    int way, nr;
>> -
>> -    /* Invalidate ITLB + DTLB, all ways */
>> -    for (way = 0; way < env->nb_ways; way++) {
>> -        nr = ppc6xx_tlb_getnum(env, eaddr, way, is_code);
>> -        tlb = &env->tlb.tlb6[nr];
>> -        if (pte_is_valid(tlb->pte0) && (match_epn == 0 || eaddr == tlb->EPN)) {
>> -            LOG_SWTLB("TLB invalidate %d/%d " TARGET_FMT_lx "\n", nr,
>> -                      env->nb_tlb, eaddr);
>> -            pte_invalidate(&tlb->pte0);
>> -            tlb_flush_page(cs, tlb->EPN);
>> -        }
>> -    }
>> -#else
>> -    /* XXX: PowerPC specification say this is valid as well */
>> -    ppc6xx_tlb_invalidate_all(env);
>> -#endif
>> -}
>> -
>> -static inline void ppc6xx_tlb_invalidate_virt(CPUPPCState *env,
>> -                                              target_ulong eaddr, int is_code)
>> -{
>> -    ppc6xx_tlb_invalidate_virt2(env, eaddr, is_code, 0);
>> -}
>> -
>> -#ifdef CONFIG_TCG
>> -static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
>> -                             int is_code, target_ulong pte0, target_ulong pte1)
>> -{
>> -    ppc6xx_tlb_t *tlb;
>> -    int nr;
>> -
>> -    nr = ppc6xx_tlb_getnum(env, EPN, way, is_code);
>> -    tlb = &env->tlb.tlb6[nr];
>> -    LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
>> -              " PTE1 " TARGET_FMT_lx "\n", nr, env->nb_tlb, EPN, pte0, pte1);
>> -    /* Invalidate any pending reference in QEMU for this virtual address */
>> -    ppc6xx_tlb_invalidate_virt2(env, EPN, is_code, 1);
>> -    tlb->pte0 = pte0;
>> -    tlb->pte1 = pte1;
>> -    tlb->EPN = EPN;
>> -    /* Store last way for LRU mechanism */
>> -    env->last_way = way;
>> -}
>> -#endif
>> -
>> -static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                            target_ulong eaddr, MMUAccessType access_type)
>> -{
>> -    ppc6xx_tlb_t *tlb;
>> -    int nr, best, way;
>> -    int ret;
>> -
>> -    best = -1;
>> -    ret = -1; /* No TLB found */
>> -    for (way = 0; way < env->nb_ways; way++) {
>> -        nr = ppc6xx_tlb_getnum(env, eaddr, way, access_type == MMU_INST_FETCH);
>> -        tlb = &env->tlb.tlb6[nr];
>> -        /* This test "emulates" the PTE index match for hardware TLBs */
>> -        if ((eaddr & TARGET_PAGE_MASK) != tlb->EPN) {
>> -            LOG_SWTLB("TLB %d/%d %s [" TARGET_FMT_lx " " TARGET_FMT_lx
>> -                      "] <> " TARGET_FMT_lx "\n", nr, env->nb_tlb,
>> -                      pte_is_valid(tlb->pte0) ? "valid" : "inval",
>> -                      tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE, eaddr);
>> -            continue;
>> -        }
>> -        LOG_SWTLB("TLB %d/%d %s " TARGET_FMT_lx " <> " TARGET_FMT_lx " "
>> -                  TARGET_FMT_lx " %c %c\n", nr, env->nb_tlb,
>> -                  pte_is_valid(tlb->pte0) ? "valid" : "inval",
>> -                  tlb->EPN, eaddr, tlb->pte1,
>> -                  access_type == MMU_DATA_STORE ? 'S' : 'L',
>> -                  access_type == MMU_INST_FETCH ? 'I' : 'D');
>> -        switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
>> -                                     0, access_type)) {
>> -        case -3:
>> -            /* TLB inconsistency */
>> -            return -1;
>> -        case -2:
>> -            /* Access violation */
>> -            ret = -2;
>> -            best = nr;
>> -            break;
>> -        case -1:
>> -        default:
>> -            /* No match */
>> -            break;
>> -        case 0:
>> -            /* access granted */
>> -            /*
>> -             * XXX: we should go on looping to check all TLBs
>> -             *      consistency but we can speed-up the whole thing as
>> -             *      the result would be undefined if TLBs are not
>> -             *      consistent.
>> -             */
>> -            ret = 0;
>> -            best = nr;
>> -            goto done;
>> -        }
>> -    }
>> -    if (best != -1) {
>> -    done:
>> -        LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=%01x ret=%d\n",
>> -                  ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
>> -        /* Update page flags */
>> -        pte_update_flags(ctx, &env->tlb.tlb6[best].pte1, ret, access_type);
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -/* Perform BAT hit & translation */
>> -static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
>> -                                 int *validp, int *protp, target_ulong *BATu,
>> -                                 target_ulong *BATl)
>> -{
>> -    target_ulong bl;
>> -    int pp, valid, prot;
>> -
>> -    bl = (*BATu & 0x00001FFC) << 15;
>> -    valid = 0;
>> -    prot = 0;
>> -    if (((msr_pr == 0) && (*BATu & 0x00000002)) ||
>> -        ((msr_pr != 0) && (*BATu & 0x00000001))) {
>> -        valid = 1;
>> -        pp = *BATl & 0x00000003;
>> -        if (pp != 0) {
>> -            prot = PAGE_READ | PAGE_EXEC;
>> -            if (pp == 0x2) {
>> -                prot |= PAGE_WRITE;
>> -            }
>> -        }
>> -    }
>> -    *blp = bl;
>> -    *validp = valid;
>> -    *protp = prot;
>> -}
>> -
>> -static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                           target_ulong virtual, MMUAccessType access_type)
>> -{
>> -    target_ulong *BATlt, *BATut, *BATu, *BATl;
>> -    target_ulong BEPIl, BEPIu, bl;
>> -    int i, valid, prot;
>> -    int ret = -1;
>> -    bool ifetch = access_type == MMU_INST_FETCH;
>> -
>> -    LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
>> -             ifetch ? 'I' : 'D', virtual);
>> -    if (ifetch) {
>> -        BATlt = env->IBAT[1];
>> -        BATut = env->IBAT[0];
>> -    } else {
>> -        BATlt = env->DBAT[1];
>> -        BATut = env->DBAT[0];
>> -    }
>> -    for (i = 0; i < env->nb_BATs; i++) {
>> -        BATu = &BATut[i];
>> -        BATl = &BATlt[i];
>> -        BEPIu = *BATu & 0xF0000000;
>> -        BEPIl = *BATu & 0x0FFE0000;
>> -        bat_size_prot(env, &bl, &valid, &prot, BATu, BATl);
>> -        LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
>> -                 " BATl " TARGET_FMT_lx "\n", __func__,
>> -                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
>> -        if ((virtual & 0xF0000000) == BEPIu &&
>> -            ((virtual & 0x0FFE0000) & ~bl) == BEPIl) {
>> -            /* BAT matches */
>> -            if (valid != 0) {
>> -                /* Get physical address */
>> -                ctx->raddr = (*BATl & 0xF0000000) |
>> -                    ((virtual & 0x0FFE0000 & bl) | (*BATl & 0x0FFE0000)) |
>> -                    (virtual & 0x0001F000);
>> -                /* Compute access rights */
>> -                ctx->prot = prot;
>> -                ret = check_prot(ctx->prot, access_type);
>> -                if (ret == 0) {
>> -                    LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=%c%c\n",
>> -                             i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' : '-',
>> -                             ctx->prot & PAGE_WRITE ? 'W' : '-');
>> -                }
>> -                break;
>> -            }
>> -        }
>> -    }
>> -    if (ret < 0) {
>> -#if defined(DEBUG_BATS)
>> -        if (qemu_log_enabled()) {
>> -            LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", virtual);
>> -            for (i = 0; i < 4; i++) {
>> -                BATu = &BATut[i];
>> -                BATl = &BATlt[i];
>> -                BEPIu = *BATu & 0xF0000000;
>> -                BEPIl = *BATu & 0x0FFE0000;
>> -                bl = (*BATu & 0x00001FFC) << 15;
>> -                LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
>> -                         " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
>> -                         TARGET_FMT_lx " " TARGET_FMT_lx "\n",
>> -                         __func__, ifetch ? 'I' : 'D', i, virtual,
>> -                         *BATu, *BATl, BEPIu, BEPIl, bl);
>> -            }
>> -        }
>> -#endif
>> -    }
>> -    /* No hit */
>> -    return ret;
>> -}
>> -
>> -/* Perform segment based translation */
>> -static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                               target_ulong eaddr, MMUAccessType access_type,
>> -                               int type)
>> -{
>> -    PowerPCCPU *cpu = env_archcpu(env);
>> -    hwaddr hash;
>> -    target_ulong vsid;
>> -    int ds, pr, target_page_bits;
>> -    int ret;
>> -    target_ulong sr, pgidx;
>> -
>> -    pr = msr_pr;
>> -    ctx->eaddr = eaddr;
>> -
>> -    sr = env->sr[eaddr >> 28];
>> -    ctx->key = (((sr & 0x20000000) && (pr != 0)) ||
>> -                ((sr & 0x40000000) && (pr == 0))) ? 1 : 0;
>> -    ds = sr & 0x80000000 ? 1 : 0;
>> -    ctx->nx = sr & 0x10000000 ? 1 : 0;
>> -    vsid = sr & 0x00FFFFFF;
>> -    target_page_bits = TARGET_PAGE_BITS;
>> -    qemu_log_mask(CPU_LOG_MMU,
>> -            "Check segment v=" TARGET_FMT_lx " %d " TARGET_FMT_lx
>> -            " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
>> -            " ir=%d dr=%d pr=%d %d t=%d\n",
>> -            eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int)msr_ir,
>> -            (int)msr_dr, pr != 0 ? 1 : 0, access_type == MMU_DATA_STORE, type);
>> -    pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
>> -    hash = vsid ^ pgidx;
>> -    ctx->ptem = (vsid << 7) | (pgidx >> 10);
>> -
>> -    qemu_log_mask(CPU_LOG_MMU,
>> -            "pte segment: key=%d ds %d nx %d vsid " TARGET_FMT_lx "\n",
>> -            ctx->key, ds, ctx->nx, vsid);
>> -    ret = -1;
>> -    if (!ds) {
>> -        /* Check if instruction fetch is allowed, if needed */
>> -        if (type != ACCESS_CODE || ctx->nx == 0) {
>> -            /* Page address translation */
>> -            qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
>> -                    " htab_mask " TARGET_FMT_plx
>> -                    " hash " TARGET_FMT_plx "\n",
>> -                    ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
>> -            ctx->hash[0] = hash;
>> -            ctx->hash[1] = ~hash;
>> -
>> -            /* Initialize real address with an invalid value */
>> -            ctx->raddr = (hwaddr)-1ULL;
>> -            /* Software TLB search */
>> -            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type);
>> -#if defined(DUMP_PAGE_TABLES)
>> -            if (qemu_loglevel_mask(CPU_LOG_MMU)) {
>> -                CPUState *cs = env_cpu(env);
>> -                hwaddr curaddr;
>> -                uint32_t a0, a1, a2, a3;
>> -
>> -                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
>> -                         "\n", ppc_hash32_hpt_base(cpu),
>> -                         ppc_hash32_hpt_mask(env) + 0x80);
>> -                for (curaddr = ppc_hash32_hpt_base(cpu);
>> -                     curaddr < (ppc_hash32_hpt_base(cpu)
>> -                                + ppc_hash32_hpt_mask(cpu) + 0x80);
>> -                     curaddr += 16) {
>> -                    a0 = ldl_phys(cs->as, curaddr);
>> -                    a1 = ldl_phys(cs->as, curaddr + 4);
>> -                    a2 = ldl_phys(cs->as, curaddr + 8);
>> -                    a3 = ldl_phys(cs->as, curaddr + 12);
>> -                    if (a0 != 0 || a1 != 0 || a2 != 0 || a3 != 0) {
>> -                        qemu_log(TARGET_FMT_plx ": %08x %08x %08x %08x\n",
>> -                                 curaddr, a0, a1, a2, a3);
>> -                    }
>> -                }
>> -            }
>> -#endif
>> -        } else {
>> -            qemu_log_mask(CPU_LOG_MMU, "No access allowed\n");
>> -            ret = -3;
>> -        }
>> -    } else {
>> -        target_ulong sr;
>> -
>> -        qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
>> -        /* Direct-store segment : absolutely *BUGGY* for now */
>> -
>> -        /*
>> -         * Direct-store implies a 32-bit MMU.
>> -         * Check the Segment Register's bus unit ID (BUID).
>> -         */
>> -        sr = env->sr[eaddr >> 28];
>> -        if ((sr & 0x1FF00000) >> 20 == 0x07f) {
>> -            /*
>> -             * Memory-forced I/O controller interface access
>> -             *
>> -             * If T=1 and BUID=x'07F', the 601 performs a memory
>> -             * access to SR[28-31] LA[4-31], bypassing all protection
>> -             * mechanisms.
>> -             */
>> -            ctx->raddr = ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
>> -            ctx->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> -            return 0;
>> -        }
>> -
>> -        switch (type) {
>> -        case ACCESS_INT:
>> -            /* Integer load/store : only access allowed */
>> -            break;
>> -        case ACCESS_CODE:
>> -            /* No code fetch is allowed in direct-store areas */
>> -            return -4;
>> -        case ACCESS_FLOAT:
>> -            /* Floating point load/store */
>> -            return -4;
>> -        case ACCESS_RES:
>> -            /* lwarx, ldarx or srwcx. */
>> -            return -4;
>> -        case ACCESS_CACHE:
>> -            /*
>> -             * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
>> -             *
>> -             * Should make the instruction do no-op.  As it already do
>> -             * no-op, it's quite easy :-)
>> -             */
>> -            ctx->raddr = eaddr;
>> -            return 0;
>> -        case ACCESS_EXT:
>> -            /* eciwx or ecowx */
>> -            return -4;
>> -        default:
>> -            qemu_log_mask(CPU_LOG_MMU, "ERROR: instruction should not need "
>> -                          "address translation\n");
>> -            return -4;
>> -        }
>> -        if ((access_type == MMU_DATA_STORE || ctx->key != 1) &&
>> -            (access_type == MMU_DATA_LOAD || ctx->key != 0)) {
>> -            ctx->raddr = eaddr;
>> -            ret = 2;
>> -        } else {
>> -            ret = -2;
>> -        }
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -/* Generic TLB check function for embedded PowerPC implementations */
>> -static int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
>> -                            hwaddr *raddrp,
>> -                            target_ulong address, uint32_t pid, int ext,
>> -                            int i)
>> -{
>> -    target_ulong mask;
>> -
>> -    /* Check valid flag */
>> -    if (!(tlb->prot & PAGE_VALID)) {
>> -        return -1;
>> -    }
>> -    mask = ~(tlb->size - 1);
>> -    LOG_SWTLB("%s: TLB %d address " TARGET_FMT_lx " PID %u <=> " TARGET_FMT_lx
>> -              " " TARGET_FMT_lx " %u %x\n", __func__, i, address, pid, tlb->EPN,
>> -              mask, (uint32_t)tlb->PID, tlb->prot);
>> -    /* Check PID */
>> -    if (tlb->PID != 0 && tlb->PID != pid) {
>> -        return -1;
>> -    }
>> -    /* Check effective address */
>> -    if ((address & mask) != tlb->EPN) {
>> -        return -1;
>> -    }
>> -    *raddrp = (tlb->RPN & mask) | (address & ~mask);
>> -    if (ext) {
>> -        /* Extend the physical address to 36 bits */
>> -        *raddrp |= (uint64_t)(tlb->RPN & 0xF) << 32;
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -#ifdef CONFIG_TCG
>> -/* Generic TLB search function for PowerPC embedded implementations */
>> -static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
>> -                             uint32_t pid)
>> -{
>> -    ppcemb_tlb_t *tlb;
>> -    hwaddr raddr;
>> -    int i, ret;
>> -
>> -    /* Default return value is no match */
>> -    ret = -1;
>> -    for (i = 0; i < env->nb_tlb; i++) {
>> -        tlb = &env->tlb.tlbe[i];
>> -        if (ppcemb_tlb_check(env, tlb, &raddr, address, pid, 0, i) == 0) {
>> -            ret = i;
>> -            break;
>> -        }
>> -    }
>> -
>> -    return ret;
>> -}
>> -#endif
>> -
>> -/* Helpers specific to PowerPC 40x implementations */
>> -static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
>> -{
>> -    ppcemb_tlb_t *tlb;
>> -    int i;
>> -
>> -    for (i = 0; i < env->nb_tlb; i++) {
>> -        tlb = &env->tlb.tlbe[i];
>> -        tlb->prot &= ~PAGE_VALID;
>> -    }
>> -    tlb_flush(env_cpu(env));
>> -}
>> -
>> -static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                                       target_ulong address,
>> -                                       MMUAccessType access_type)
>> -{
>> -    ppcemb_tlb_t *tlb;
>> -    hwaddr raddr;
>> -    int i, ret, zsel, zpr, pr;
>> -
>> -    ret = -1;
>> -    raddr = (hwaddr)-1ULL;
>> -    pr = msr_pr;
>> -    for (i = 0; i < env->nb_tlb; i++) {
>> -        tlb = &env->tlb.tlbe[i];
>> -        if (ppcemb_tlb_check(env, tlb, &raddr, address,
>> -                             env->spr[SPR_40x_PID], 0, i) < 0) {
>> -            continue;
>> -        }
>> -        zsel = (tlb->attr >> 4) & 0xF;
>> -        zpr = (env->spr[SPR_40x_ZPR] >> (30 - (2 * zsel))) & 0x3;
>> -        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
>> -                    __func__, i, zsel, zpr, access_type, tlb->attr);
>> -        /* Check execute enable bit */
>> -        switch (zpr) {
>> -        case 0x2:
>> -            if (pr != 0) {
>> -                goto check_perms;
>> -            }
>> -            /* fall through */
>> -        case 0x3:
>> -            /* All accesses granted */
>> -            ctx->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> -            ret = 0;
>> -            break;
>> -        case 0x0:
>> -            if (pr != 0) {
>> -                /* Raise Zone protection fault.  */
>> -                env->spr[SPR_40x_ESR] = 1 << 22;
>> -                ctx->prot = 0;
>> -                ret = -2;
>> -                break;
>> -            }
>> -            /* fall through */
>> -        case 0x1:
>> -        check_perms:
>> -            /* Check from TLB entry */
>> -            ctx->prot = tlb->prot;
>> -            ret = check_prot(ctx->prot, access_type);
>> -            if (ret == -2) {
>> -                env->spr[SPR_40x_ESR] = 0;
>> -            }
>> -            break;
>> -        }
>> -        if (ret >= 0) {
>> -            ctx->raddr = raddr;
>> -            LOG_SWTLB("%s: access granted " TARGET_FMT_lx " => " TARGET_FMT_plx
>> -                      " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
>> -                      ret);
>> -            return 0;
>> -        }
>> -    }
>> -    LOG_SWTLB("%s: access refused " TARGET_FMT_lx " => " TARGET_FMT_plx
>> -              " %d %d\n", __func__, address, raddr, ctx->prot, ret);
>> -
>> -    return ret;
>> -}
>> -
>> -void store_40x_sler(CPUPPCState *env, uint32_t val)
>> -{
>> -    /* XXX: TO BE FIXED */
>> -    if (val != 0x00000000) {
>> -        cpu_abort(env_cpu(env),
>> -                  "Little-endian regions are not supported by now\n");
>> -    }
>> -    env->spr[SPR_405_SLER] = val;
>> -}
>> -
>> -static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
>> -                              hwaddr *raddr, int *prot, target_ulong address,
>> -                              MMUAccessType access_type, int i)
>> -{
>> -    int prot2;
>> -
>> -    if (ppcemb_tlb_check(env, tlb, raddr, address,
>> -                         env->spr[SPR_BOOKE_PID],
>> -                         !env->nb_pids, i) >= 0) {
>> -        goto found_tlb;
>> -    }
>> -
>> -    if (env->spr[SPR_BOOKE_PID1] &&
>> -        ppcemb_tlb_check(env, tlb, raddr, address,
>> -                         env->spr[SPR_BOOKE_PID1], 0, i) >= 0) {
>> -        goto found_tlb;
>> -    }
>> -
>> -    if (env->spr[SPR_BOOKE_PID2] &&
>> -        ppcemb_tlb_check(env, tlb, raddr, address,
>> -                         env->spr[SPR_BOOKE_PID2], 0, i) >= 0) {
>> -        goto found_tlb;
>> -    }
>> -
>> -    LOG_SWTLB("%s: TLB entry not found\n", __func__);
>> -    return -1;
>> -
>> -found_tlb:
>> -
>> -    if (msr_pr != 0) {
>> -        prot2 = tlb->prot & 0xF;
>> -    } else {
>> -        prot2 = (tlb->prot >> 4) & 0xF;
>> -    }
>> -
>> -    /* Check the address space */
>> -    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb->attr & 1)) {
>> -        LOG_SWTLB("%s: AS doesn't match\n", __func__);
>> -        return -1;
>> -    }
>> -
>> -    *prot = prot2;
>> -    if (prot2 & prot_for_access_type(access_type)) {
>> -        LOG_SWTLB("%s: good TLB!\n", __func__);
>> -        return 0;
>> -    }
>> -
>> -    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
>> -    return access_type == MMU_INST_FETCH ? -3 : -2;
>> -}
>> -
>> -static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                                         target_ulong address,
>> -                                         MMUAccessType access_type)
>> -{
>> -    ppcemb_tlb_t *tlb;
>> -    hwaddr raddr;
>> -    int i, ret;
>> -
>> -    ret = -1;
>> -    raddr = (hwaddr)-1ULL;
>> -    for (i = 0; i < env->nb_tlb; i++) {
>> -        tlb = &env->tlb.tlbe[i];
>> -        ret = mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address,
>> -                                 access_type, i);
>> -        if (ret != -1) {
>> -            break;
>> -        }
>> -    }
>> -
>> -    if (ret >= 0) {
>> -        ctx->raddr = raddr;
>> -        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " => " TARGET_FMT_plx
>> -                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
>> -                  ret);
>> -    } else {
>> -        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " => " TARGET_FMT_plx
>> -                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -#ifdef CONFIG_TCG
>> -static void booke206_flush_tlb(CPUPPCState *env, int flags,
>> -                               const int check_iprot)
>> -{
>> -    int tlb_size;
>> -    int i, j;
>> -    ppcmas_tlb_t *tlb = env->tlb.tlbm;
>> -
>> -    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>> -        if (flags & (1 << i)) {
>> -            tlb_size = booke206_tlb_size(env, i);
>> -            for (j = 0; j < tlb_size; j++) {
>> -                if (!check_iprot || !(tlb[j].mas1 & MAS1_IPROT)) {
>> -                    tlb[j].mas1 &= ~MAS1_VALID;
>> -                }
>> -            }
>> -        }
>> -        tlb += booke206_tlb_size(env, i);
>> -    }
>> -
>> -    tlb_flush(env_cpu(env));
>> -}
>> -#endif
>> -
>> -static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>> -                                        ppcmas_tlb_t *tlb)
>> -{
>> -    int tlbm_size;
>> -
>> -    tlbm_size = (tlb->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
>> -
>> -    return 1024ULL << tlbm_size;
>> -}
>> -
>> -/* TLB check function for MAS based SoftTLBs */
>> -static int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
>> -                            hwaddr *raddrp, target_ulong address,
>> -                            uint32_t pid)
>> -{
>> -    hwaddr mask;
>> -    uint32_t tlb_pid;
>> -
>> -    if (!msr_cm) {
>> -        /* In 32bit mode we can only address 32bit EAs */
>> -        address = (uint32_t)address;
>> -    }
>> -
>> -    /* Check valid flag */
>> -    if (!(tlb->mas1 & MAS1_VALID)) {
>> -        return -1;
>> -    }
>> -
>> -    mask = ~(booke206_tlb_to_page_size(env, tlb) - 1);
>> -    LOG_SWTLB("%s: TLB ADDR=0x" TARGET_FMT_lx " PID=0x%x MAS1=0x%x MAS2=0x%"
>> -              PRIx64 " mask=0x%" HWADDR_PRIx " MAS7_3=0x%" PRIx64 " MAS8=0x%"
>> -              PRIx32 "\n", __func__, address, pid, tlb->mas1, tlb->mas2, mask,
>> -              tlb->mas7_3, tlb->mas8);
>> -
>> -    /* Check PID */
>> -    tlb_pid = (tlb->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT;
>> -    if (tlb_pid != 0 && tlb_pid != pid) {
>> -        return -1;
>> -    }
>> -
>> -    /* Check effective address */
>> -    if ((address & mask) != (tlb->mas2 & MAS2_EPN_MASK)) {
>> -        return -1;
>> -    }
>> -
>> -    if (raddrp) {
>> -        *raddrp = (tlb->mas7_3 & mask) | (address & ~mask);
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -static bool is_epid_mmu(int mmu_idx)
>> -{
>> -    return mmu_idx == PPC_TLB_EPID_STORE || mmu_idx == PPC_TLB_EPID_LOAD;
>> -}
>> -
>> -static uint32_t mmubooke206_esr(int mmu_idx, MMUAccessType access_type)
>> -{
>> -    uint32_t esr = 0;
>> -    if (access_type == MMU_DATA_STORE) {
>> -        esr |= ESR_ST;
>> -    }
>> -    if (is_epid_mmu(mmu_idx)) {
>> -        esr |= ESR_EPID;
>> -    }
>> -    return esr;
>> -}
>> -
>> -/*
>> - * Get EPID register given the mmu_idx. If this is regular load,
>> - * construct the EPID access bits from current processor state
>> - *
>> - * Get the effective AS and PR bits and the PID. The PID is returned
>> - * only if EPID load is requested, otherwise the caller must detect
>> - * the correct EPID.  Return true if valid EPID is returned.
>> - */
>> -static bool mmubooke206_get_as(CPUPPCState *env,
>> -                               int mmu_idx, uint32_t *epid_out,
>> -                               bool *as_out, bool *pr_out)
>> -{
>> -    if (is_epid_mmu(mmu_idx)) {
>> -        uint32_t epidr;
>> -        if (mmu_idx == PPC_TLB_EPID_STORE) {
>> -            epidr = env->spr[SPR_BOOKE_EPSC];
>> -        } else {
>> -            epidr = env->spr[SPR_BOOKE_EPLC];
>> -        }
>> -        *epid_out = (epidr & EPID_EPID) >> EPID_EPID_SHIFT;
>> -        *as_out = !!(epidr & EPID_EAS);
>> -        *pr_out = !!(epidr & EPID_EPR);
>> -        return true;
>> -    } else {
>> -        *as_out = msr_ds;
>> -        *pr_out = msr_pr;
>> -        return false;
>> -    }
>> -}
>> -
>> -/* Check if the tlb found by hashing really matches */
>> -static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
>> -                                 hwaddr *raddr, int *prot,
>> -                                 target_ulong address,
>> -                                 MMUAccessType access_type, int mmu_idx)
>> -{
>> -    int prot2 = 0;
>> -    uint32_t epid;
>> -    bool as, pr;
>> -    bool use_epid = mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
>> -
>> -    if (!use_epid) {
>> -        if (ppcmas_tlb_check(env, tlb, raddr, address,
>> -                             env->spr[SPR_BOOKE_PID]) >= 0) {
>> -            goto found_tlb;
>> -        }
>> -
>> -        if (env->spr[SPR_BOOKE_PID1] &&
>> -            ppcmas_tlb_check(env, tlb, raddr, address,
>> -                             env->spr[SPR_BOOKE_PID1]) >= 0) {
>> -            goto found_tlb;
>> -        }
>> -
>> -        if (env->spr[SPR_BOOKE_PID2] &&
>> -            ppcmas_tlb_check(env, tlb, raddr, address,
>> -                             env->spr[SPR_BOOKE_PID2]) >= 0) {
>> -            goto found_tlb;
>> -        }
>> -    } else {
>> -        if (ppcmas_tlb_check(env, tlb, raddr, address, epid) >= 0) {
>> -            goto found_tlb;
>> -        }
>> -    }
>> -
>> -    LOG_SWTLB("%s: TLB entry not found\n", __func__);
>> -    return -1;
>> -
>> -found_tlb:
>> -
>> -    if (pr) {
>> -        if (tlb->mas7_3 & MAS3_UR) {
>> -            prot2 |= PAGE_READ;
>> -        }
>> -        if (tlb->mas7_3 & MAS3_UW) {
>> -            prot2 |= PAGE_WRITE;
>> -        }
>> -        if (tlb->mas7_3 & MAS3_UX) {
>> -            prot2 |= PAGE_EXEC;
>> -        }
>> -    } else {
>> -        if (tlb->mas7_3 & MAS3_SR) {
>> -            prot2 |= PAGE_READ;
>> -        }
>> -        if (tlb->mas7_3 & MAS3_SW) {
>> -            prot2 |= PAGE_WRITE;
>> -        }
>> -        if (tlb->mas7_3 & MAS3_SX) {
>> -            prot2 |= PAGE_EXEC;
>> -        }
>> -    }
>> -
>> -    /* Check the address space and permissions */
>> -    if (access_type == MMU_INST_FETCH) {
>> -        /* There is no way to fetch code using epid load */
>> -        assert(!use_epid);
>> -        as = msr_ir;
>> -    }
>> -
>> -    if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
>> -        LOG_SWTLB("%s: AS doesn't match\n", __func__);
>> -        return -1;
>> -    }
>> -
>> -    *prot = prot2;
>> -    if (prot2 & prot_for_access_type(access_type)) {
>> -        LOG_SWTLB("%s: good TLB!\n", __func__);
>> -        return 0;
>> -    }
>> -
>> -    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
>> -    return access_type == MMU_INST_FETCH ? -3 : -2;
>> -}
>> -
>> -static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                                            target_ulong address,
>> -                                            MMUAccessType access_type,
>> -                                            int mmu_idx)
>> -{
>> -    ppcmas_tlb_t *tlb;
>> -    hwaddr raddr;
>> -    int i, j, ret;
>> -
>> -    ret = -1;
>> -    raddr = (hwaddr)-1ULL;
>> -
>> -    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>> -        int ways = booke206_tlb_ways(env, i);
>> -
>> -        for (j = 0; j < ways; j++) {
>> -            tlb = booke206_get_tlbm(env, i, address, j);
>> -            if (!tlb) {
>> -                continue;
>> -            }
>> -            ret = mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, address,
>> -                                        access_type, mmu_idx);
>> -            if (ret != -1) {
>> -                goto found_tlb;
>> -            }
>> -        }
>> -    }
>> -
>> -found_tlb:
>> -
>> -    if (ret >= 0) {
>> -        ctx->raddr = raddr;
>> -        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " => " TARGET_FMT_plx
>> -                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
>> -                  ret);
>> -    } else {
>> -        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " => " TARGET_FMT_plx
>> -                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -static const char *book3e_tsize_to_str[32] = {
>> -    "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K",
>> -    "1M", "2M", "4M", "8M", "16M", "32M", "64M", "128M", "256M", "512M",
>> -    "1G", "2G", "4G", "8G", "16G", "32G", "64G", "128G", "256G", "512G",
>> -    "1T", "2T"
>> -};
>> -
>> -static void mmubooke_dump_mmu(CPUPPCState *env)
>> -{
>> -    ppcemb_tlb_t *entry;
>> -    int i;
>> -
>> -    if (kvm_enabled() && !env->kvm_sw_tlb) {
>> -        qemu_printf("Cannot access KVM TLB\n");
>> -        return;
>> -    }
>> -
>> -    qemu_printf("\nTLB:\n");
>> -    qemu_printf("Effective          Physical           Size PID   Prot     "
>> -                "Attr\n");
>> -
>> -    entry = &env->tlb.tlbe[0];
>> -    for (i = 0; i < env->nb_tlb; i++, entry++) {
>> -        hwaddr ea, pa;
>> -        target_ulong mask;
>> -        uint64_t size = (uint64_t)entry->size;
>> -        char size_buf[20];
>> -
>> -        /* Check valid flag */
>> -        if (!(entry->prot & PAGE_VALID)) {
>> -            continue;
>> -        }
>> -
>> -        mask = ~(entry->size - 1);
>> -        ea = entry->EPN & mask;
>> -        pa = entry->RPN & mask;
>> -        /* Extend the physical address to 36 bits */
>> -        pa |= (hwaddr)(entry->RPN & 0xF) << 32;
>> -        if (size >= 1 * MiB) {
>> -            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size / MiB);
>> -        } else {
>> -            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size / KiB);
>> -        }
>> -        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x\n",
>> -                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entry->PID,
>> -                    entry->prot, entry->attr);
>> -    }
>> -
>> -}
>> -
>> -static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int offset,
>> -                                     int tlbsize)
>> -{
>> -    ppcmas_tlb_t *entry;
>> -    int i;
>> -
>> -    qemu_printf("\nTLB%d:\n", tlbn);
>> -    qemu_printf("Effective          Physical           Size TID   TS SRWX"
>> -                " URWX WIMGE U0123\n");
>> -
>> -    entry = &env->tlb.tlbm[offset];
>> -    for (i = 0; i < tlbsize; i++, entry++) {
>> -        hwaddr ea, pa, size;
>> -        int tsize;
>> -
>> -        if (!(entry->mas1 & MAS1_VALID)) {
>> -            continue;
>> -        }
>> -
>> -        tsize = (entry->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
>> -        size = 1024ULL << tsize;
>> -        ea = entry->mas2 & ~(size - 1);
>> -        pa = entry->mas7_3 & ~(size - 1);
>> -
>> -        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c%c%c"
>> -                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
>> -                    (uint64_t)ea, (uint64_t)pa,
>> -                    book3e_tsize_to_str[tsize],
>> -                    (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
>> -                    (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
>> -                    entry->mas7_3 & MAS3_SR ? 'R' : '-',
>> -                    entry->mas7_3 & MAS3_SW ? 'W' : '-',
>> -                    entry->mas7_3 & MAS3_SX ? 'X' : '-',
>> -                    entry->mas7_3 & MAS3_UR ? 'R' : '-',
>> -                    entry->mas7_3 & MAS3_UW ? 'W' : '-',
>> -                    entry->mas7_3 & MAS3_UX ? 'X' : '-',
>> -                    entry->mas2 & MAS2_W ? 'W' : '-',
>> -                    entry->mas2 & MAS2_I ? 'I' : '-',
>> -                    entry->mas2 & MAS2_M ? 'M' : '-',
>> -                    entry->mas2 & MAS2_G ? 'G' : '-',
>> -                    entry->mas2 & MAS2_E ? 'E' : '-',
>> -                    entry->mas7_3 & MAS3_U0 ? '0' : '-',
>> -                    entry->mas7_3 & MAS3_U1 ? '1' : '-',
>> -                    entry->mas7_3 & MAS3_U2 ? '2' : '-',
>> -                    entry->mas7_3 & MAS3_U3 ? '3' : '-');
>> -    }
>> -}
>> -
>> -static void mmubooke206_dump_mmu(CPUPPCState *env)
>> -{
>> -    int offset = 0;
>> -    int i;
>> -
>> -    if (kvm_enabled() && !env->kvm_sw_tlb) {
>> -        qemu_printf("Cannot access KVM TLB\n");
>> -        return;
>> -    }
>> +/* #define DEBUG_BATS */
>> +/* #define DEBUG_SOFTWARE_TLB */
>> +/* #define DUMP_PAGE_TABLES */
>> +/* #define FLUSH_ALL_TLBS */
>>   
>> -    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>> -        int size = booke206_tlb_size(env, i);
>> +#ifdef DEBUG_SOFTWARE_TLB
>> +#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
>> +#else
>> +#  define LOG_SWTLB(...) do { } while (0)
>> +#endif
>>   
>> -        if (size == 0) {
>> -            continue;
>> -        }
>> +#ifdef DEBUG_BATS
>> +#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
>> +#else
>> +#  define LOG_BATS(...) do { } while (0)
>> +#endif
>>   
>> -        mmubooke206_dump_one_tlb(env, i, offset, size);
>> -        offset += size;
>> -    }
>> -}
>> +/*****************************************************************************/
>> +/* PowerPC MMU emulation */
>>   
>> -static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
>> +/* Software driven TLB helpers */
>> +static inline void ppc6xx_tlb_invalidate_all(CPUPPCState *env)
>>   {
>> -    target_ulong *BATlt, *BATut, *BATu, *BATl;
>> -    target_ulong BEPIl, BEPIu, bl;
>> -    int i;
>> +    ppc6xx_tlb_t *tlb;
>> +    int nr, max;
>>   
>> -    switch (type) {
>> -    case ACCESS_CODE:
>> -        BATlt = env->IBAT[1];
>> -        BATut = env->IBAT[0];
>> -        break;
>> -    default:
>> -        BATlt = env->DBAT[1];
>> -        BATut = env->DBAT[0];
>> -        break;
>> +    /* LOG_SWTLB("Invalidate all TLBs\n"); */
>> +    /* Invalidate all defined software TLB */
>> +    max = env->nb_tlb;
>> +    if (env->id_tlbs == 1) {
>> +        max *= 2;
>>       }
>> -
>> -    for (i = 0; i < env->nb_BATs; i++) {
>> -        BATu = &BATut[i];
>> -        BATl = &BATlt[i];
>> -        BEPIu = *BATu & 0xF0000000;
>> -        BEPIl = *BATu & 0x0FFE0000;
>> -        bl = (*BATu & 0x00001FFC) << 15;
>> -        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
>> -                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
>> -                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
>> -                    type == ACCESS_CODE ? "code" : "data", i,
>> -                    *BATu, *BATl, BEPIu, BEPIl, bl);
>> +    for (nr = 0; nr < max; nr++) {
>> +        tlb = &env->tlb.tlb6[nr];
>> +        pte_invalidate(&tlb->pte0);
>>       }
>> +    tlb_flush(env_cpu(env));
>>   }
>>   
>> -static void mmu6xx_dump_mmu(CPUPPCState *env)
>> +static inline void ppc6xx_tlb_invalidate_virt2(CPUPPCState *env,
>> +                                               target_ulong eaddr,
>> +                                               int is_code, int match_epn)
>>   {
>> -    PowerPCCPU *cpu = env_archcpu(env);
>> +#if !defined(FLUSH_ALL_TLBS)
>> +    CPUState *cs = env_cpu(env);
>>       ppc6xx_tlb_t *tlb;
>> -    target_ulong sr;
>> -    int type, way, entry, i;
>> -
>> -    qemu_printf("HTAB base = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(cpu));
>> -    qemu_printf("HTAB mask = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(cpu));
>> -
>> -    qemu_printf("\nSegment registers:\n");
>> -    for (i = 0; i < 32; i++) {
>> -        sr = env->sr[i];
>> -        if (sr & 0x80000000) {
>> -            qemu_printf("%02d T=%d Ks=%d Kp=%d BUID=0x%03x "
>> -                        "CNTLR_SPEC=0x%05x\n", i,
>> -                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
>> -                        sr & 0x20000000 ? 1 : 0, (uint32_t)((sr >> 20) & 0x1FF),
>> -                        (uint32_t)(sr & 0xFFFFF));
>> -        } else {
>> -            qemu_printf("%02d T=%d Ks=%d Kp=%d N=%d VSID=0x%06x\n", i,
>> -                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
>> -                        sr & 0x20000000 ? 1 : 0, sr & 0x10000000 ? 1 : 0,
>> -                        (uint32_t)(sr & 0x00FFFFFF));
>> -        }
>> -    }
>> -
>> -    qemu_printf("\nBATs:\n");
>> -    mmu6xx_dump_BATs(env, ACCESS_INT);
>> -    mmu6xx_dump_BATs(env, ACCESS_CODE);
>> -
>> -    if (env->id_tlbs != 1) {
>> -        qemu_printf("ERROR: 6xx MMU should have separated TLB"
>> -                    " for code and data\n");
>> -    }
>> +    int way, nr;
>>   
>> -    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
>> -
>> -    for (type = 0; type < 2; type++) {
>> -        for (way = 0; way < env->nb_ways; way++) {
>> -            for (entry = env->nb_tlb * type + env->tlb_per_way * way;
>> -                 entry < (env->nb_tlb * type + env->tlb_per_way * (way + 1));
>> -                 entry++) {
>> -
>> -                tlb = &env->tlb.tlb6[entry];
>> -                qemu_printf("%s TLB %02d/%02d way:%d %s ["
>> -                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
>> -                            type ? "code" : "data", entry % env->nb_tlb,
>> -                            env->nb_tlb, way,
>> -                            pte_is_valid(tlb->pte0) ? "valid" : "inval",
>> -                            tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE);
>> -            }
>> +    /* Invalidate ITLB + DTLB, all ways */
>> +    for (way = 0; way < env->nb_ways; way++) {
>> +        nr = ppc6xx_tlb_getnum(env, eaddr, way, is_code);
>> +        tlb = &env->tlb.tlb6[nr];
>> +        if (pte_is_valid(tlb->pte0) && (match_epn == 0 || eaddr == tlb->EPN)) {
>> +            LOG_SWTLB("TLB invalidate %d/%d " TARGET_FMT_lx "\n", nr,
>> +                      env->nb_tlb, eaddr);
>> +            pte_invalidate(&tlb->pte0);
>> +            tlb_flush_page(cs, tlb->EPN);
>>           }
>>       }
>> -}
>> -
>> -void dump_mmu(CPUPPCState *env)
>> -{
>> -    switch (env->mmu_model) {
>> -    case POWERPC_MMU_BOOKE:
>> -        mmubooke_dump_mmu(env);
>> -        break;
>> -    case POWERPC_MMU_BOOKE206:
>> -        mmubooke206_dump_mmu(env);
>> -        break;
>> -    case POWERPC_MMU_SOFT_6xx:
>> -    case POWERPC_MMU_SOFT_74xx:
>> -        mmu6xx_dump_mmu(env);
>> -        break;
>> -#if defined(TARGET_PPC64)
>> -    case POWERPC_MMU_64B:
>> -    case POWERPC_MMU_2_03:
>> -    case POWERPC_MMU_2_06:
>> -    case POWERPC_MMU_2_07:
>> -        dump_slb(env_archcpu(env));
>> -        break;
>> -    case POWERPC_MMU_3_00:
>> -        if (ppc64_v3_radix(env_archcpu(env))) {
>> -            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n",
>> -                          __func__);
>> -        } else {
>> -            dump_slb(env_archcpu(env));
>> -        }
>> -        break;
>> +#else
>> +    /* XXX: PowerPC specification say this is valid as well */
>> +    ppc6xx_tlb_invalidate_all(env);
>>   #endif
>> -    default:
>> -        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
>> -    }
>>   }
>>   
>> -static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
>> -                          MMUAccessType access_type)
>> +static inline void ppc6xx_tlb_invalidate_virt(CPUPPCState *env,
>> +                                              target_ulong eaddr, int is_code)
>>   {
>> -    int in_plb, ret;
>> -
>> -    ctx->raddr = eaddr;
>> -    ctx->prot = PAGE_READ | PAGE_EXEC;
>> -    ret = 0;
>> -    switch (env->mmu_model) {
>> -    case POWERPC_MMU_SOFT_6xx:
>> -    case POWERPC_MMU_SOFT_74xx:
>> -    case POWERPC_MMU_SOFT_4xx:
>> -    case POWERPC_MMU_REAL:
>> -    case POWERPC_MMU_BOOKE:
>> -        ctx->prot |= PAGE_WRITE;
>> -        break;
>> -
>> -    case POWERPC_MMU_SOFT_4xx_Z:
>> -        if (unlikely(msr_pe != 0)) {
>> -            /*
>> -             * 403 family add some particular protections, using
>> -             * PBL/PBU registers for accesses with no translation.
>> -             */
>> -            in_plb =
>> -                /* Check PLB validity */
>> -                (env->pb[0] < env->pb[1] &&
>> -                 /* and address in plb area */
>> -                 eaddr >= env->pb[0] && eaddr < env->pb[1]) ||
>> -                (env->pb[2] < env->pb[3] &&
>> -                 eaddr >= env->pb[2] && eaddr < env->pb[3]) ? 1 : 0;
>> -            if (in_plb ^ msr_px) {
>> -                /* Access in protected area */
>> -                if (access_type == MMU_DATA_STORE) {
>> -                    /* Access is not allowed */
>> -                    ret = -2;
>> -                }
>> -            } else {
>> -                /* Read-write access is allowed */
>> -                ctx->prot |= PAGE_WRITE;
>> -            }
>> -        }
>> -        break;
>> -
>> -    default:
>> -        /* Caller's checks mean we should never get here for other models */
>> -        abort();
>> -        return -1;
>> -    }
>> -
>> -    return ret;
>> +    ppc6xx_tlb_invalidate_virt2(env, eaddr, is_code, 0);
>>   }
>>   
>> -static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                                     target_ulong eaddr,
>> -                                     MMUAccessType access_type, int type,
>> -                                     int mmu_idx)
>> +static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
>> +                             int is_code, target_ulong pte0, target_ulong pte1)
>>   {
>> -    int ret = -1;
>> -    bool real_mode = (type == ACCESS_CODE && msr_ir == 0)
>> -        || (type != ACCESS_CODE && msr_dr == 0);
>> -
>> -    switch (env->mmu_model) {
>> -    case POWERPC_MMU_SOFT_6xx:
>> -    case POWERPC_MMU_SOFT_74xx:
>> -        if (real_mode) {
>> -            ret = check_physical(env, ctx, eaddr, access_type);
>> -        } else {
>> -            /* Try to find a BAT */
>> -            if (env->nb_BATs != 0) {
>> -                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type);
>> -            }
>> -            if (ret < 0) {
>> -                /* We didn't match any BAT entry or don't have BATs */
>> -                ret = get_segment_6xx_tlb(env, ctx, eaddr, access_type, type);
>> -            }
>> -        }
>> -        break;
>> -
>> -    case POWERPC_MMU_SOFT_4xx:
>> -    case POWERPC_MMU_SOFT_4xx_Z:
>> -        if (real_mode) {
>> -            ret = check_physical(env, ctx, eaddr, access_type);
>> -        } else {
>> -            ret = mmu40x_get_physical_address(env, ctx, eaddr, access_type);
>> -        }
>> -        break;
>> -    case POWERPC_MMU_BOOKE:
>> -        ret = mmubooke_get_physical_address(env, ctx, eaddr, access_type);
>> -        break;
>> -    case POWERPC_MMU_BOOKE206:
>> -        ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
>> -                                               mmu_idx);
>> -        break;
>> -    case POWERPC_MMU_MPC8xx:
>> -        /* XXX: TODO */
>> -        cpu_abort(env_cpu(env), "MPC8xx MMU model is not implemented\n");
>> -        break;
>> -    case POWERPC_MMU_REAL:
>> -        if (real_mode) {
>> -            ret = check_physical(env, ctx, eaddr, access_type);
>> -        } else {
>> -            cpu_abort(env_cpu(env),
>> -                      "PowerPC in real mode do not do any translation\n");
>> -        }
>> -        return -1;
>> -    default:
>> -        cpu_abort(env_cpu(env), "Unknown or invalid MMU model\n");
>> -        return -1;
>> -    }
>> -
>> -    return ret;
>> -}
>> +    ppc6xx_tlb_t *tlb;
>> +    int nr;
>>   
>> -#ifdef CONFIG_TCG
>> -static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>> -                                target_ulong eaddr, MMUAccessType access_type,
>> -                                int type)
>> -{
>> -    return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
>> +    nr = ppc6xx_tlb_getnum(env, EPN, way, is_code);
>> +    tlb = &env->tlb.tlb6[nr];
>> +    LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
>> +              " PTE1 " TARGET_FMT_lx "\n", nr, env->nb_tlb, EPN, pte0, pte1);
>> +    /* Invalidate any pending reference in QEMU for this virtual address */
>> +    ppc6xx_tlb_invalidate_virt2(env, EPN, is_code, 1);
>> +    tlb->pte0 = pte0;
>> +    tlb->pte1 = pte1;
>> +    tlb->EPN = EPN;
>> +    /* Store last way for LRU mechanism */
>> +    env->last_way = way;
>>   }
>> -#endif
>>   
>> -hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>> +/* Generic TLB search function for PowerPC embedded implementations */
>> +static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
>> +                             uint32_t pid)
>>   {
>> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
>> -    CPUPPCState *env = &cpu->env;
>> -    mmu_ctx_t ctx;
>> -
>> -    switch (env->mmu_model) {
>> -#if defined(TARGET_PPC64)
>> -    case POWERPC_MMU_64B:
>> -    case POWERPC_MMU_2_03:
>> -    case POWERPC_MMU_2_06:
>> -    case POWERPC_MMU_2_07:
>> -        return ppc_hash64_get_phys_page_debug(cpu, addr);
>> -    case POWERPC_MMU_3_00:
>> -        return ppc64_v3_get_phys_page_debug(cpu, addr);
>> -#endif
>> -
>> -    case POWERPC_MMU_32B:
>> -    case POWERPC_MMU_601:
>> -        return ppc_hash32_get_phys_page_debug(cpu, addr);
>> -
>> -    default:
>> -        ;
>> -    }
>> -
>> -    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
>> -                                      ACCESS_INT) != 0)) {
>> +    ppcemb_tlb_t *tlb;
>> +    hwaddr raddr;
>> +    int i, ret;
>>   
>> -        /*
>> -         * Some MMUs have separate TLBs for code and data. If we only
>> -         * try an ACCESS_INT, we may not be able to read instructions
>> -         * mapped by code TLBs, so we also try a ACCESS_CODE.
>> -         */
>> -        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETCH,
>> -                                          ACCESS_CODE) != 0)) {
>> -            return -1;
>> +    /* Default return value is no match */
>> +    ret = -1;
>> +    for (i = 0; i < env->nb_tlb; i++) {
>> +        tlb = &env->tlb.tlbe[i];
>> +        if (ppcemb_tlb_check(env, tlb, &raddr, address, pid, 0, i) == 0) {
>> +            ret = i;
>> +            break;
>>           }
>>       }
>>   
>> -    return ctx.raddr & TARGET_PAGE_MASK;
>> +    return ret;
>>   }
>>   
>> -static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
>> -                                         MMUAccessType access_type, int mmu_idx)
>> +/* Helpers specific to PowerPC 40x implementations */
>> +static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
>>   {
>> -    uint32_t epid;
>> -    bool as, pr;
>> -    uint32_t missed_tid = 0;
>> -    bool use_epid = mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
>> -
>> -    if (access_type == MMU_INST_FETCH) {
>> -        as = msr_ir;
>> -    }
>> -    env->spr[SPR_BOOKE_MAS0] = env->spr[SPR_BOOKE_MAS4] & MAS4_TLBSELD_MASK;
>> -    env->spr[SPR_BOOKE_MAS1] = env->spr[SPR_BOOKE_MAS4] & MAS4_TSIZED_MASK;
>> -    env->spr[SPR_BOOKE_MAS2] = env->spr[SPR_BOOKE_MAS4] & MAS4_WIMGED_MASK;
>> -    env->spr[SPR_BOOKE_MAS3] = 0;
>> -    env->spr[SPR_BOOKE_MAS6] = 0;
>> -    env->spr[SPR_BOOKE_MAS7] = 0;
>> -
>> -    /* AS */
>> -    if (as) {
>> -        env->spr[SPR_BOOKE_MAS1] |= MAS1_TS;
>> -        env->spr[SPR_BOOKE_MAS6] |= MAS6_SAS;
>> -    }
>> -
>> -    env->spr[SPR_BOOKE_MAS1] |= MAS1_VALID;
>> -    env->spr[SPR_BOOKE_MAS2] |= address & MAS2_EPN_MASK;
>> +    ppcemb_tlb_t *tlb;
>> +    int i;
>>   
>> -    if (!use_epid) {
>> -        switch (env->spr[SPR_BOOKE_MAS4] & MAS4_TIDSELD_PIDZ) {
>> -        case MAS4_TIDSELD_PID0:
>> -            missed_tid = env->spr[SPR_BOOKE_PID];
>> -            break;
>> -        case MAS4_TIDSELD_PID1:
>> -            missed_tid = env->spr[SPR_BOOKE_PID1];
>> -            break;
>> -        case MAS4_TIDSELD_PID2:
>> -            missed_tid = env->spr[SPR_BOOKE_PID2];
>> -            break;
>> -        }
>> -        env->spr[SPR_BOOKE_MAS6] |= env->spr[SPR_BOOKE_PID] << 16;
>> -    } else {
>> -        missed_tid = epid;
>> -        env->spr[SPR_BOOKE_MAS6] |= missed_tid << 16;
>> +    for (i = 0; i < env->nb_tlb; i++) {
>> +        tlb = &env->tlb.tlbe[i];
>> +        tlb->prot &= ~PAGE_VALID;
>>       }
>> -    env->spr[SPR_BOOKE_MAS1] |= (missed_tid << MAS1_TID_SHIFT);
>> -
>> -
>> -    /* next victim logic */
>> -    env->spr[SPR_BOOKE_MAS0] |= env->last_way << MAS0_ESEL_SHIFT;
>> -    env->last_way++;
>> -    env->last_way &= booke206_tlb_ways(env, 0) - 1;
>> -    env->spr[SPR_BOOKE_MAS0] |= env->last_way << MAS0_NV_SHIFT;
>> +    tlb_flush(env_cpu(env));
>>   }
>>   
>> -/* Perform address translation */
>> -static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
>> -                                    MMUAccessType access_type, int mmu_idx)
>> +static void booke206_flush_tlb(CPUPPCState *env, int flags,
>> +                               const int check_iprot)
>>   {
>> -    CPUState *cs = env_cpu(env);
>> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
>> -    mmu_ctx_t ctx;
>> -    int type;
>> -    int ret = 0;
>> +    int tlb_size;
>> +    int i, j;
>> +    ppcmas_tlb_t *tlb = env->tlb.tlbm;
>>   
>> -    if (access_type == MMU_INST_FETCH) {
>> -        /* code access */
>> -        type = ACCESS_CODE;
>> -    } else {
>> -        /* data access */
>> -        type = env->access_type;
>> -    }
>> -    ret = get_physical_address_wtlb(env, &ctx, address, access_type,
>> -                                    type, mmu_idx);
>> -    if (ret == 0) {
>> -        tlb_set_page(cs, address & TARGET_PAGE_MASK,
>> -                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
>> -                     mmu_idx, TARGET_PAGE_SIZE);
>> -        ret = 0;
>> -    } else if (ret < 0) {
>> -        LOG_MMU_STATE(cs);
>> -        if (type == ACCESS_CODE) {
>> -            switch (ret) {
>> -            case -1:
>> -                /* No matches in page tables or TLB */
>> -                switch (env->mmu_model) {
>> -                case POWERPC_MMU_SOFT_6xx:
>> -                    cs->exception_index = POWERPC_EXCP_IFTLB;
>> -                    env->error_code = 1 << 18;
>> -                    env->spr[SPR_IMISS] = address;
>> -                    env->spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
>> -                    goto tlb_miss;
>> -                case POWERPC_MMU_SOFT_74xx:
>> -                    cs->exception_index = POWERPC_EXCP_IFTLB;
>> -                    goto tlb_miss_74xx;
>> -                case POWERPC_MMU_SOFT_4xx:
>> -                case POWERPC_MMU_SOFT_4xx_Z:
>> -                    cs->exception_index = POWERPC_EXCP_ITLB;
>> -                    env->error_code = 0;
>> -                    env->spr[SPR_40x_DEAR] = address;
>> -                    env->spr[SPR_40x_ESR] = 0x00000000;
>> -                    break;
>> -                case POWERPC_MMU_BOOKE206:
>> -                    booke206_update_mas_tlb_miss(env, address, 2, mmu_idx);
>> -                    /* fall through */
>> -                case POWERPC_MMU_BOOKE:
>> -                    cs->exception_index = POWERPC_EXCP_ITLB;
>> -                    env->error_code = 0;
>> -                    env->spr[SPR_BOOKE_DEAR] = address;
>> -                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
>> -                    return -1;
>> -                case POWERPC_MMU_MPC8xx:
>> -                    /* XXX: TODO */
>> -                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
>> -                    break;
>> -                case POWERPC_MMU_REAL:
>> -                    cpu_abort(cs, "PowerPC in real mode should never raise "
>> -                              "any MMU exceptions\n");
>> -                    return -1;
>> -                default:
>> -                    cpu_abort(cs, "Unknown or invalid MMU model\n");
>> -                    return -1;
>> -                }
>> -                break;
>> -            case -2:
>> -                /* Access rights violation */
>> -                cs->exception_index = POWERPC_EXCP_ISI;
>> -                env->error_code = 0x08000000;
>> -                break;
>> -            case -3:
>> -                /* No execute protection violation */
>> -                if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
>> -                    (env->mmu_model == POWERPC_MMU_BOOKE206)) {
>> -                    env->spr[SPR_BOOKE_ESR] = 0x00000000;
>> -                }
>> -                cs->exception_index = POWERPC_EXCP_ISI;
>> -                env->error_code = 0x10000000;
>> -                break;
>> -            case -4:
>> -                /* Direct store exception */
>> -                /* No code fetch is allowed in direct-store areas */
>> -                cs->exception_index = POWERPC_EXCP_ISI;
>> -                env->error_code = 0x10000000;
>> -                break;
>> -            }
>> -        } else {
>> -            switch (ret) {
>> -            case -1:
>> -                /* No matches in page tables or TLB */
>> -                switch (env->mmu_model) {
>> -                case POWERPC_MMU_SOFT_6xx:
>> -                    if (access_type == MMU_DATA_STORE) {
>> -                        cs->exception_index = POWERPC_EXCP_DSTLB;
>> -                        env->error_code = 1 << 16;
>> -                    } else {
>> -                        cs->exception_index = POWERPC_EXCP_DLTLB;
>> -                        env->error_code = 0;
>> -                    }
>> -                    env->spr[SPR_DMISS] = address;
>> -                    env->spr[SPR_DCMP] = 0x80000000 | ctx.ptem;
>> -                tlb_miss:
>> -                    env->error_code |= ctx.key << 19;
>> -                    env->spr[SPR_HASH1] = ppc_hash32_hpt_base(cpu) +
>> -                        get_pteg_offset32(cpu, ctx.hash[0]);
>> -                    env->spr[SPR_HASH2] = ppc_hash32_hpt_base(cpu) +
>> -                        get_pteg_offset32(cpu, ctx.hash[1]);
>> -                    break;
>> -                case POWERPC_MMU_SOFT_74xx:
>> -                    if (access_type == MMU_DATA_STORE) {
>> -                        cs->exception_index = POWERPC_EXCP_DSTLB;
>> -                    } else {
>> -                        cs->exception_index = POWERPC_EXCP_DLTLB;
>> -                    }
>> -                tlb_miss_74xx:
>> -                    /* Implement LRU algorithm */
>> -                    env->error_code = ctx.key << 19;
>> -                    env->spr[SPR_TLBMISS] = (address & ~((target_ulong)0x3)) |
>> -                        ((env->last_way + 1) & (env->nb_ways - 1));
>> -                    env->spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
>> -                    break;
>> -                case POWERPC_MMU_SOFT_4xx:
>> -                case POWERPC_MMU_SOFT_4xx_Z:
>> -                    cs->exception_index = POWERPC_EXCP_DTLB;
>> -                    env->error_code = 0;
>> -                    env->spr[SPR_40x_DEAR] = address;
>> -                    if (access_type == MMU_DATA_STORE) {
>> -                        env->spr[SPR_40x_ESR] = 0x00800000;
>> -                    } else {
>> -                        env->spr[SPR_40x_ESR] = 0x00000000;
>> -                    }
>> -                    break;
>> -                case POWERPC_MMU_MPC8xx:
>> -                    /* XXX: TODO */
>> -                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
>> -                    break;
>> -                case POWERPC_MMU_BOOKE206:
>> -                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
>> -                    /* fall through */
>> -                case POWERPC_MMU_BOOKE:
>> -                    cs->exception_index = POWERPC_EXCP_DTLB;
>> -                    env->error_code = 0;
>> -                    env->spr[SPR_BOOKE_DEAR] = address;
>> -                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
>> -                    return -1;
>> -                case POWERPC_MMU_REAL:
>> -                    cpu_abort(cs, "PowerPC in real mode should never raise "
>> -                              "any MMU exceptions\n");
>> -                    return -1;
>> -                default:
>> -                    cpu_abort(cs, "Unknown or invalid MMU model\n");
>> -                    return -1;
>> -                }
>> -                break;
>> -            case -2:
>> -                /* Access rights violation */
>> -                cs->exception_index = POWERPC_EXCP_DSI;
>> -                env->error_code = 0;
>> -                if (env->mmu_model == POWERPC_MMU_SOFT_4xx
>> -                    || env->mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
>> -                    env->spr[SPR_40x_DEAR] = address;
>> -                    if (access_type == MMU_DATA_STORE) {
>> -                        env->spr[SPR_40x_ESR] |= 0x00800000;
>> -                    }
>> -                } else if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
>> -                           (env->mmu_model == POWERPC_MMU_BOOKE206)) {
>> -                    env->spr[SPR_BOOKE_DEAR] = address;
>> -                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
>> -                } else {
>> -                    env->spr[SPR_DAR] = address;
>> -                    if (access_type == MMU_DATA_STORE) {
>> -                        env->spr[SPR_DSISR] = 0x0A000000;
>> -                    } else {
>> -                        env->spr[SPR_DSISR] = 0x08000000;
>> -                    }
>> -                }
>> -                break;
>> -            case -4:
>> -                /* Direct store exception */
>> -                switch (type) {
>> -                case ACCESS_FLOAT:
>> -                    /* Floating point load/store */
>> -                    cs->exception_index = POWERPC_EXCP_ALIGN;
>> -                    env->error_code = POWERPC_EXCP_ALIGN_FP;
>> -                    env->spr[SPR_DAR] = address;
>> -                    break;
>> -                case ACCESS_RES:
>> -                    /* lwarx, ldarx or stwcx. */
>> -                    cs->exception_index = POWERPC_EXCP_DSI;
>> -                    env->error_code = 0;
>> -                    env->spr[SPR_DAR] = address;
>> -                    if (access_type == MMU_DATA_STORE) {
>> -                        env->spr[SPR_DSISR] = 0x06000000;
>> -                    } else {
>> -                        env->spr[SPR_DSISR] = 0x04000000;
>> -                    }
>> -                    break;
>> -                case ACCESS_EXT:
>> -                    /* eciwx or ecowx */
>> -                    cs->exception_index = POWERPC_EXCP_DSI;
>> -                    env->error_code = 0;
>> -                    env->spr[SPR_DAR] = address;
>> -                    if (access_type == MMU_DATA_STORE) {
>> -                        env->spr[SPR_DSISR] = 0x06100000;
>> -                    } else {
>> -                        env->spr[SPR_DSISR] = 0x04100000;
>> -                    }
>> -                    break;
>> -                default:
>> -                    printf("DSI: invalid exception (%d)\n", ret);
>> -                    cs->exception_index = POWERPC_EXCP_PROGRAM;
>> -                    env->error_code =
>> -                        POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
>> -                    env->spr[SPR_DAR] = address;
>> -                    break;
>> +    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>> +        if (flags & (1 << i)) {
>> +            tlb_size = booke206_tlb_size(env, i);
>> +            for (j = 0; j < tlb_size; j++) {
>> +                if (!check_iprot || !(tlb[j].mas1 & MAS1_IPROT)) {
>> +                    tlb[j].mas1 &= ~MAS1_VALID;
>>                   }
>> -                break;
>>               }
>>           }
>> -        ret = 1;
>> +        tlb += booke206_tlb_size(env, i);
>>       }
>>   
>> -    return ret;
>> +    tlb_flush(env_cpu(env));
>>   }
>>   
>> -#ifdef CONFIG_TCG
>> +
>>   /*****************************************************************************/
>>   /* BATs management */
>>   #if !defined(FLUSH_ALL_TLBS)
>> @@ -1952,9 +372,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
>>   #endif
>>       }
>>   }
>> -#endif
>>   
>> -#ifdef CONFIG_TCG
>>   /*****************************************************************************/
>>   /* TLB management */
>>   void ppc_tlb_invalidate_all(CPUPPCState *env)
>> @@ -1998,9 +416,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>>           break;
>>       }
>>   }
>> -#endif
>>   
>> -#ifdef CONFIG_TCG
>>   void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
>>   {
>>   #if !defined(FLUSH_ALL_TLBS)
>> @@ -2942,30 +1358,6 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
>>   {
>>       check_tlb_flush(env, true);
>>   }
>> -#endif /* CONFIG_TCG */
>>   
>>   /*****************************************************************************/
>>   
>> -bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>> -                      MMUAccessType access_type, int mmu_idx,
>> -                      bool probe, uintptr_t retaddr)
>> -{
>> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
>> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
>> -    CPUPPCState *env = &cpu->env;
>> -    int ret;
>> -
>> -    if (pcc->handle_mmu_fault) {
>> -        ret = pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
>> -    } else {
>> -        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
>> -    }
>> -    if (unlikely(ret != 0)) {
>> -        if (probe) {
>> -            return false;
>> -        }
>> -        raise_exception_err_ra(env, cs->exception_index, env->error_code,
>> -                               retaddr);
>> -    }
>> -    return true;
>> -}
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------317D45EF84CF8C560D5F72D1
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06/06/2021 23:31, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YL2E91r4YCErNp5H@yekko">
      <pre class="moz-quote-pre" wrap="">On Wed, Jun 02, 2021 at 04:26:02PM -0300, Lucas Mateus Castro (alqotel) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Moved functions in mmu_helper.c that should be compiled in build to
mmu_common.c, moved declaration of functions that both files use to
cpu.h and moved struct declarations and inline functions needed by
both to target/ppc/internal.h. Updated meson.build to compile the
new file.

Signed-off-by: Lucas Mateus Castro (alqotel) <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
---
Had to turn a few functions non static as it was used by both
mmu_common.c and mmu_helper.c. Added the declaration of mmu_ctx_t to
cpu.h so functions there can reference it and added the definition to
internal.h so functions in both mmu_* files can access it.
And maybe the tlb functions should be declared in internal.h instead of
cpu.h.
---
 target/ppc/cpu.h        |   35 +
 target/ppc/internal.h   |   26 +
 target/ppc/meson.build  |    6 +-
 target/ppc/mmu_common.c | 1606 ++++++++++++++++++++++++++++++++++
 target/ppc/mmu_helper.c | 1814 +++------------------------------------
 5 files changed, 1774 insertions(+), 1713 deletions(-)
 create mode 100644 target/ppc/mmu_common.c

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b0934d9be4..cfc35ef83e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1329,6 +1329,41 @@ void store_booke_tsr(CPUPPCState *env, target_ulong val);
 void ppc_tlb_invalidate_all(CPUPPCState *env);
 void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr);
 void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHypervisor *vhyp);
+
+typedef struct mmu_ctx_t mmu_ctx_t;
+int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
+                            hwaddr *raddrp,
+                            target_ulong address, uint32_t pid, int ext,
+                            int i);
+int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
+                                     target_ulong eaddr,
+                                     MMUAccessType access_type, int type,
+                                     int mmu_idx);
+hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
+                                        ppcmas_tlb_t *tlb);
+int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
+                            hwaddr *raddrp, target_ulong address,
+                            uint32_t pid);
+int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
+                                target_ulong eaddr, MMUAccessType access_type,
+                                int type);
+static inline int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
+                                    int way, int is_code)
+{
+    int nr;
+
+    /* Select TLB num in a way from address */
+    nr = (eaddr &gt;&gt; TARGET_PAGE_BITS) &amp; (env-&gt;tlb_per_way - 1);
+    /* Select TLB way */
+    nr += env-&gt;tlb_per_way * way;
+    /* 6xx have separate TLBs for instructions and data */
+    if (is_code &amp;&amp; env-&gt;id_tlbs == 1) {
+        nr += env-&gt;nb_tlb;
+    }
+
+    return nr;
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is a rather complex and model specific function to have inline in
a header.
</pre>
    </blockquote>
    What is the best way to deal with this function? It's used by both
    mmu_helper.c and mmu_common.c so I put it there as a way to keep it
    being an inline function, so it would be best to put it in
    target/ppc/internal.h or maybe just turn it into a not inline
    function?<br>
    <blockquote type="cite" cite="mid:YL2E91r4YCErNp5H@yekko">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 #endif
 #endif
 
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 2b4b06eb76..7d2913ec28 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -247,4 +247,30 @@ static inline int prot_for_access_type(MMUAccessType access_type)
     g_assert_not_reached();
 }
 
+/* Context used internally during MMU translations */
+
+struct mmu_ctx_t {
+    hwaddr raddr;      /* Real address              */
+    hwaddr eaddr;      /* Effective address         */
+    int prot;                      /* Protection bits           */
+    hwaddr hash[2];    /* Pagetable hash values     */
+    target_ulong ptem;             /* Virtual segment ID | API  */
+    int key;                       /* Access key                */
+    int nx;                        /* Non-execute area          */
+};
+
+/* Common routines used by software and hardware TLBs emulation */
+static inline int pte_is_valid(target_ulong pte0)
+{
+    return pte0 &amp; 0x80000000 ? 1 : 0;
+}
+
+static inline void pte_invalidate(target_ulong *pte0)
+{
+    *pte0 &amp;= ~0x80000000;
+}
+
+#define PTE_PTEM_MASK 0x7FFFFFBF
+#define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index a6a53a8d5c..a54445d0da 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -28,10 +28,12 @@ ppc_softmmu_ss.add(files(
   'arch_dump.c',
   'machine.c',
   'mmu-hash32.c',
-  'mmu_helper.c',
+  'mmu_common.c',
   'monitor.c',
 ))
-ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
+ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'mmu_helper.c',
+), if_false: files(
   'tcg-stub.c'
 ))
 
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
new file mode 100644
index 0000000000..d95399d67f
--- /dev/null
+++ b/target/ppc/mmu_common.c
@@ -0,0 +1,1606 @@
+/*
+ *  PowerPC CPU initialization for qemu.
+ *
+ *  Copyright (C) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "cpu.h"
+#include "sysemu/kvm.h"
+#include "kvm_ppc.h"
+#include "mmu-hash64.h"
+#include "mmu-hash32.h"
+#include "exec/exec-all.h"
+#include "exec/log.h"
+#include "helper_regs.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "qemu/qemu-print.h"
+#include "internal.h"
+#include "mmu-book3s-v3.h"
+#include "mmu-radix64.h"
+
+/* #define DEBUG_MMU */
+/* #define DEBUG_BATS */
+/* #define DEBUG_SOFTWARE_TLB */
+/* #define DUMP_PAGE_TABLES */
+/* #define FLUSH_ALL_TLBS */
+
+#ifdef DEBUG_MMU
+#  define LOG_MMU_STATE(cpu) log_cpu_state_mask(CPU_LOG_MMU, (cpu), 0)
+#else
+#  define LOG_MMU_STATE(cpu) do { } while (0)
+#endif
+
+#ifdef DEBUG_SOFTWARE_TLB
+#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
+#else
+#  define LOG_SWTLB(...) do { } while (0)
+#endif
+
+#ifdef DEBUG_BATS
+#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
+#else
+#  define LOG_BATS(...) do { } while (0)
+#endif
+
+/*****************************************************************************/
+/* PowerPC MMU emulation */
+
+static int pp_check(int key, int pp, int nx)
+{
+    int access;
+
+    /* Compute access rights */
+    access = 0;
+    if (key == 0) {
+        switch (pp) {
+        case 0x0:
+        case 0x1:
+        case 0x2:
+            access |= PAGE_WRITE;
+            /* fall through */
+        case 0x3:
+            access |= PAGE_READ;
+            break;
+        }
+    } else {
+        switch (pp) {
+        case 0x0:
+            access = 0;
+            break;
+        case 0x1:
+        case 0x3:
+            access = PAGE_READ;
+            break;
+        case 0x2:
+            access = PAGE_READ | PAGE_WRITE;
+            break;
+        }
+    }
+    if (nx == 0) {
+        access |= PAGE_EXEC;
+    }
+
+    return access;
+}
+
+static int check_prot(int prot, MMUAccessType access_type)
+{
+    return prot &amp; prot_for_access_type(access_type) ? 0 : -2;
+}
+
+static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
+                            int ret, MMUAccessType access_type)
+{
+    int store = 0;
+
+    /* Update page flags */
+    if (!(*pte1p &amp; 0x00000100)) {
+        /* Update accessed flag */
+        *pte1p |= 0x00000100;
+        store = 1;
+    }
+    if (!(*pte1p &amp; 0x00000080)) {
+        if (access_type == MMU_DATA_STORE &amp;&amp; ret == 0) {
+            /* Update changed flag */
+            *pte1p |= 0x00000080;
+            store = 1;
+        } else {
+            /* Force page fault for first write access */
+            ctx-&gt;prot &amp;= ~PAGE_WRITE;
+        }
+    }
+
+    return store;
+}
+
+static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
+                                target_ulong pte1, int h,
+                                MMUAccessType access_type)
+{
+    target_ulong ptem, mmask;
+    int access, ret, pteh, ptev, pp;
+
+    ret = -1;
+    /* Check validity and table match */
+    ptev = pte_is_valid(pte0);
+    pteh = (pte0 &gt;&gt; 6) &amp; 1;
+    if (ptev &amp;&amp; h == pteh) {
+        /* Check vsid &amp; api */
+        ptem = pte0 &amp; PTE_PTEM_MASK;
+        mmask = PTE_CHECK_MASK;
+        pp = pte1 &amp; 0x00000003;
+        if (ptem == ctx-&gt;ptem) {
+            if (ctx-&gt;raddr != (hwaddr)-1ULL) {
+                /* all matches should have equal RPN, WIMG &amp; PP */
+                if ((ctx-&gt;raddr &amp; mmask) != (pte1 &amp; mmask)) {
+                    qemu_log_mask(CPU_LOG_MMU, "Bad RPN/WIMG/PP\n");
+                    return -3;
+                }
+            }
+            /* Compute access rights */
+            access = pp_check(ctx-&gt;key, pp, ctx-&gt;nx);
+            /* Keep the matching PTE information */
+            ctx-&gt;raddr = pte1;
+            ctx-&gt;prot = access;
+            ret = check_prot(ctx-&gt;prot, access_type);
+            if (ret == 0) {
+                /* Access granted */
+                qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
+            } else {
+                /* Access right violation */
+                qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
+            }
+        }
+    }
+
+    return ret;
+}
+
+static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
+                            target_ulong eaddr, MMUAccessType access_type)
+{
+    ppc6xx_tlb_t *tlb;
+    int nr, best, way;
+    int ret;
+
+    best = -1;
+    ret = -1; /* No TLB found */
+    for (way = 0; way &lt; env-&gt;nb_ways; way++) {
+        nr = ppc6xx_tlb_getnum(env, eaddr, way, access_type == MMU_INST_FETCH);
+        tlb = &amp;env-&gt;tlb.tlb6[nr];
+        /* This test "emulates" the PTE index match for hardware TLBs */
+        if ((eaddr &amp; TARGET_PAGE_MASK) != tlb-&gt;EPN) {
+            LOG_SWTLB("TLB %d/%d %s [" TARGET_FMT_lx " " TARGET_FMT_lx
+                      "] &lt;&gt; " TARGET_FMT_lx "\n", nr, env-&gt;nb_tlb,
+                      pte_is_valid(tlb-&gt;pte0) ? "valid" : "inval",
+                      tlb-&gt;EPN, tlb-&gt;EPN + TARGET_PAGE_SIZE, eaddr);
+            continue;
+        }
+        LOG_SWTLB("TLB %d/%d %s " TARGET_FMT_lx " &lt;&gt; " TARGET_FMT_lx " "
+                  TARGET_FMT_lx " %c %c\n", nr, env-&gt;nb_tlb,
+                  pte_is_valid(tlb-&gt;pte0) ? "valid" : "inval",
+                  tlb-&gt;EPN, eaddr, tlb-&gt;pte1,
+                  access_type == MMU_DATA_STORE ? 'S' : 'L',
+                  access_type == MMU_INST_FETCH ? 'I' : 'D');
+        switch (ppc6xx_tlb_pte_check(ctx, tlb-&gt;pte0, tlb-&gt;pte1,
+                                     0, access_type)) {
+        case -3:
+            /* TLB inconsistency */
+            return -1;
+        case -2:
+            /* Access violation */
+            ret = -2;
+            best = nr;
+            break;
+        case -1:
+        default:
+            /* No match */
+            break;
+        case 0:
+            /* access granted */
+            /*
+             * XXX: we should go on looping to check all TLBs
+             *      consistency but we can speed-up the whole thing as
+             *      the result would be undefined if TLBs are not
+             *      consistent.
+             */
+            ret = 0;
+            best = nr;
+            goto done;
+        }
+    }
+    if (best != -1) {
+    done:
+        LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=%01x ret=%d\n",
+                  ctx-&gt;raddr &amp; TARGET_PAGE_MASK, ctx-&gt;prot, ret);
+        /* Update page flags */
+        pte_update_flags(ctx, &amp;env-&gt;tlb.tlb6[best].pte1, ret, access_type);
+    }
+
+    return ret;
+}
+
+/* Perform BAT hit &amp; translation */
+static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
+                                 int *validp, int *protp, target_ulong *BATu,
+                                 target_ulong *BATl)
+{
+    target_ulong bl;
+    int pp, valid, prot;
+
+    bl = (*BATu &amp; 0x00001FFC) &lt;&lt; 15;
+    valid = 0;
+    prot = 0;
+    if (((msr_pr == 0) &amp;&amp; (*BATu &amp; 0x00000002)) ||
+        ((msr_pr != 0) &amp;&amp; (*BATu &amp; 0x00000001))) {
+        valid = 1;
+        pp = *BATl &amp; 0x00000003;
+        if (pp != 0) {
+            prot = PAGE_READ | PAGE_EXEC;
+            if (pp == 0x2) {
+                prot |= PAGE_WRITE;
+            }
+        }
+    }
+    *blp = bl;
+    *validp = valid;
+    *protp = prot;
+}
+
+static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
+                           target_ulong virtual, MMUAccessType access_type)
+{
+    target_ulong *BATlt, *BATut, *BATu, *BATl;
+    target_ulong BEPIl, BEPIu, bl;
+    int i, valid, prot;
+    int ret = -1;
+    bool ifetch = access_type == MMU_INST_FETCH;
+
+    LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
+             ifetch ? 'I' : 'D', virtual);
+    if (ifetch) {
+        BATlt = env-&gt;IBAT[1];
+        BATut = env-&gt;IBAT[0];
+    } else {
+        BATlt = env-&gt;DBAT[1];
+        BATut = env-&gt;DBAT[0];
+    }
+    for (i = 0; i &lt; env-&gt;nb_BATs; i++) {
+        BATu = &amp;BATut[i];
+        BATl = &amp;BATlt[i];
+        BEPIu = *BATu &amp; 0xF0000000;
+        BEPIl = *BATu &amp; 0x0FFE0000;
+        bat_size_prot(env, &amp;bl, &amp;valid, &amp;prot, BATu, BATl);
+        LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
+                 " BATl " TARGET_FMT_lx "\n", __func__,
+                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
+        if ((virtual &amp; 0xF0000000) == BEPIu &amp;&amp;
+            ((virtual &amp; 0x0FFE0000) &amp; ~bl) == BEPIl) {
+            /* BAT matches */
+            if (valid != 0) {
+                /* Get physical address */
+                ctx-&gt;raddr = (*BATl &amp; 0xF0000000) |
+                    ((virtual &amp; 0x0FFE0000 &amp; bl) | (*BATl &amp; 0x0FFE0000)) |
+                    (virtual &amp; 0x0001F000);
+                /* Compute access rights */
+                ctx-&gt;prot = prot;
+                ret = check_prot(ctx-&gt;prot, access_type);
+                if (ret == 0) {
+                    LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=%c%c\n",
+                             i, ctx-&gt;raddr, ctx-&gt;prot &amp; PAGE_READ ? 'R' : '-',
+                             ctx-&gt;prot &amp; PAGE_WRITE ? 'W' : '-');
+                }
+                break;
+            }
+        }
+    }
+    if (ret &lt; 0) {
+#if defined(DEBUG_BATS)
+        if (qemu_log_enabled()) {
+            LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", virtual);
+            for (i = 0; i &lt; 4; i++) {
+                BATu = &amp;BATut[i];
+                BATl = &amp;BATlt[i];
+                BEPIu = *BATu &amp; 0xF0000000;
+                BEPIl = *BATu &amp; 0x0FFE0000;
+                bl = (*BATu &amp; 0x00001FFC) &lt;&lt; 15;
+                LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
+                         " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
+                         TARGET_FMT_lx " " TARGET_FMT_lx "\n",
+                         __func__, ifetch ? 'I' : 'D', i, virtual,
+                         *BATu, *BATl, BEPIu, BEPIl, bl);
+            }
+        }
+#endif
+    }
+    /* No hit */
+    return ret;
+}
+
+/* Perform segment based translation */
+static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
+                               target_ulong eaddr, MMUAccessType access_type,
+                               int type)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    hwaddr hash;
+    target_ulong vsid;
+    int ds, pr, target_page_bits;
+    int ret;
+    target_ulong sr, pgidx;
+
+    pr = msr_pr;
+    ctx-&gt;eaddr = eaddr;
+
+    sr = env-&gt;sr[eaddr &gt;&gt; 28];
+    ctx-&gt;key = (((sr &amp; 0x20000000) &amp;&amp; (pr != 0)) ||
+                ((sr &amp; 0x40000000) &amp;&amp; (pr == 0))) ? 1 : 0;
+    ds = sr &amp; 0x80000000 ? 1 : 0;
+    ctx-&gt;nx = sr &amp; 0x10000000 ? 1 : 0;
+    vsid = sr &amp; 0x00FFFFFF;
+    target_page_bits = TARGET_PAGE_BITS;
+    qemu_log_mask(CPU_LOG_MMU,
+            "Check segment v=" TARGET_FMT_lx " %d " TARGET_FMT_lx
+            " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
+            " ir=%d dr=%d pr=%d %d t=%d\n",
+            eaddr, (int)(eaddr &gt;&gt; 28), sr, env-&gt;nip, env-&gt;lr, (int)msr_ir,
+            (int)msr_dr, pr != 0 ? 1 : 0, access_type == MMU_DATA_STORE, type);
+    pgidx = (eaddr &amp; ~SEGMENT_MASK_256M) &gt;&gt; target_page_bits;
+    hash = vsid ^ pgidx;
+    ctx-&gt;ptem = (vsid &lt;&lt; 7) | (pgidx &gt;&gt; 10);
+
+    qemu_log_mask(CPU_LOG_MMU,
+            "pte segment: key=%d ds %d nx %d vsid " TARGET_FMT_lx "\n",
+            ctx-&gt;key, ds, ctx-&gt;nx, vsid);
+    ret = -1;
+    if (!ds) {
+        /* Check if instruction fetch is allowed, if needed */
+        if (type != ACCESS_CODE || ctx-&gt;nx == 0) {
+            /* Page address translation */
+            qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
+                    " htab_mask " TARGET_FMT_plx
+                    " hash " TARGET_FMT_plx "\n",
+                    ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
+            ctx-&gt;hash[0] = hash;
+            ctx-&gt;hash[1] = ~hash;
+
+            /* Initialize real address with an invalid value */
+            ctx-&gt;raddr = (hwaddr)-1ULL;
+            /* Software TLB search */
+            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type);
+#if defined(DUMP_PAGE_TABLES)
+            if (qemu_loglevel_mask(CPU_LOG_MMU)) {
+                CPUState *cs = env_cpu(env);
+                hwaddr curaddr;
+                uint32_t a0, a1, a2, a3;
+
+                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
+                         "\n", ppc_hash32_hpt_base(cpu),
+                         ppc_hash32_hpt_mask(env) + 0x80);
+                for (curaddr = ppc_hash32_hpt_base(cpu);
+                     curaddr &lt; (ppc_hash32_hpt_base(cpu)
+                                + ppc_hash32_hpt_mask(cpu) + 0x80);
+                     curaddr += 16) {
+                    a0 = ldl_phys(cs-&gt;as, curaddr);
+                    a1 = ldl_phys(cs-&gt;as, curaddr + 4);
+                    a2 = ldl_phys(cs-&gt;as, curaddr + 8);
+                    a3 = ldl_phys(cs-&gt;as, curaddr + 12);
+                    if (a0 != 0 || a1 != 0 || a2 != 0 || a3 != 0) {
+                        qemu_log(TARGET_FMT_plx ": %08x %08x %08x %08x\n",
+                                 curaddr, a0, a1, a2, a3);
+                    }
+                }
+            }
+#endif
+        } else {
+            qemu_log_mask(CPU_LOG_MMU, "No access allowed\n");
+            ret = -3;
+        }
+    } else {
+        target_ulong sr;
+
+        qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
+        /* Direct-store segment : absolutely *BUGGY* for now */
+
+        /*
+         * Direct-store implies a 32-bit MMU.
+         * Check the Segment Register's bus unit ID (BUID).
+         */
+        sr = env-&gt;sr[eaddr &gt;&gt; 28];
+        if ((sr &amp; 0x1FF00000) &gt;&gt; 20 == 0x07f) {
+            /*
+             * Memory-forced I/O controller interface access
+             *
+             * If T=1 and BUID=x'07F', the 601 performs a memory
+             * access to SR[28-31] LA[4-31], bypassing all protection
+             * mechanisms.
+             */
+            ctx-&gt;raddr = ((sr &amp; 0xF) &lt;&lt; 28) | (eaddr &amp; 0x0FFFFFFF);
+            ctx-&gt;prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+            return 0;
+        }
+
+        switch (type) {
+        case ACCESS_INT:
+            /* Integer load/store : only access allowed */
+            break;
+        case ACCESS_CODE:
+            /* No code fetch is allowed in direct-store areas */
+            return -4;
+        case ACCESS_FLOAT:
+            /* Floating point load/store */
+            return -4;
+        case ACCESS_RES:
+            /* lwarx, ldarx or srwcx. */
+            return -4;
+        case ACCESS_CACHE:
+            /*
+             * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
+             *
+             * Should make the instruction do no-op.  As it already do
+             * no-op, it's quite easy :-)
+             */
+            ctx-&gt;raddr = eaddr;
+            return 0;
+        case ACCESS_EXT:
+            /* eciwx or ecowx */
+            return -4;
+        default:
+            qemu_log_mask(CPU_LOG_MMU, "ERROR: instruction should not need "
+                          "address translation\n");
+            return -4;
+        }
+        if ((access_type == MMU_DATA_STORE || ctx-&gt;key != 1) &amp;&amp;
+            (access_type == MMU_DATA_LOAD || ctx-&gt;key != 0)) {
+            ctx-&gt;raddr = eaddr;
+            ret = 2;
+        } else {
+            ret = -2;
+        }
+    }
+
+    return ret;
+}
+
+/* Generic TLB check function for embedded PowerPC implementations */
+int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
+                            hwaddr *raddrp,
+                            target_ulong address, uint32_t pid, int ext,
+                            int i)
+{
+    target_ulong mask;
+
+    /* Check valid flag */
+    if (!(tlb-&gt;prot &amp; PAGE_VALID)) {
+        return -1;
+    }
+    mask = ~(tlb-&gt;size - 1);
+    LOG_SWTLB("%s: TLB %d address " TARGET_FMT_lx " PID %u &lt;=&gt; " TARGET_FMT_lx
+              " " TARGET_FMT_lx " %u %x\n", __func__, i, address, pid, tlb-&gt;EPN,
+              mask, (uint32_t)tlb-&gt;PID, tlb-&gt;prot);
+    /* Check PID */
+    if (tlb-&gt;PID != 0 &amp;&amp; tlb-&gt;PID != pid) {
+        return -1;
+    }
+    /* Check effective address */
+    if ((address &amp; mask) != tlb-&gt;EPN) {
+        return -1;
+    }
+    *raddrp = (tlb-&gt;RPN &amp; mask) | (address &amp; ~mask);
+    if (ext) {
+        /* Extend the physical address to 36 bits */
+        *raddrp |= (uint64_t)(tlb-&gt;RPN &amp; 0xF) &lt;&lt; 32;
+    }
+
+    return 0;
+}
+
+static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
+                                       target_ulong address,
+                                       MMUAccessType access_type)
+{
+    ppcemb_tlb_t *tlb;
+    hwaddr raddr;
+    int i, ret, zsel, zpr, pr;
+
+    ret = -1;
+    raddr = (hwaddr)-1ULL;
+    pr = msr_pr;
+    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
+        tlb = &amp;env-&gt;tlb.tlbe[i];
+        if (ppcemb_tlb_check(env, tlb, &amp;raddr, address,
+                             env-&gt;spr[SPR_40x_PID], 0, i) &lt; 0) {
+            continue;
+        }
+        zsel = (tlb-&gt;attr &gt;&gt; 4) &amp; 0xF;
+        zpr = (env-&gt;spr[SPR_40x_ZPR] &gt;&gt; (30 - (2 * zsel))) &amp; 0x3;
+        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
+                    __func__, i, zsel, zpr, access_type, tlb-&gt;attr);
+        /* Check execute enable bit */
+        switch (zpr) {
+        case 0x2:
+            if (pr != 0) {
+                goto check_perms;
+            }
+            /* fall through */
+        case 0x3:
+            /* All accesses granted */
+            ctx-&gt;prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+            ret = 0;
+            break;
+        case 0x0:
+            if (pr != 0) {
+                /* Raise Zone protection fault.  */
+                env-&gt;spr[SPR_40x_ESR] = 1 &lt;&lt; 22;
+                ctx-&gt;prot = 0;
+                ret = -2;
+                break;
+            }
+            /* fall through */
+        case 0x1:
+        check_perms:
+            /* Check from TLB entry */
+            ctx-&gt;prot = tlb-&gt;prot;
+            ret = check_prot(ctx-&gt;prot, access_type);
+            if (ret == -2) {
+                env-&gt;spr[SPR_40x_ESR] = 0;
+            }
+            break;
+        }
+        if (ret &gt;= 0) {
+            ctx-&gt;raddr = raddr;
+            LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
+                      " %d %d\n", __func__, address, ctx-&gt;raddr, ctx-&gt;prot,
+                      ret);
+            return 0;
+        }
+    }
+    LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
+              " %d %d\n", __func__, address, raddr, ctx-&gt;prot, ret);
+
+    return ret;
+}
+
+void store_40x_sler(CPUPPCState *env, uint32_t val)
+{
+    /* XXX: TO BE FIXED */
+    if (val != 0x00000000) {
+        cpu_abort(env_cpu(env),
+                  "Little-endian regions are not supported by now\n");
+    }
+    env-&gt;spr[SPR_405_SLER] = val;
+}
+
+static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
+                              hwaddr *raddr, int *prot, target_ulong address,
+                              MMUAccessType access_type, int i)
+{
+    int prot2;
+
+    if (ppcemb_tlb_check(env, tlb, raddr, address,
+                         env-&gt;spr[SPR_BOOKE_PID],
+                         !env-&gt;nb_pids, i) &gt;= 0) {
+        goto found_tlb;
+    }
+
+    if (env-&gt;spr[SPR_BOOKE_PID1] &amp;&amp;
+        ppcemb_tlb_check(env, tlb, raddr, address,
+                         env-&gt;spr[SPR_BOOKE_PID1], 0, i) &gt;= 0) {
+        goto found_tlb;
+    }
+
+    if (env-&gt;spr[SPR_BOOKE_PID2] &amp;&amp;
+        ppcemb_tlb_check(env, tlb, raddr, address,
+                         env-&gt;spr[SPR_BOOKE_PID2], 0, i) &gt;= 0) {
+        goto found_tlb;
+    }
+
+    LOG_SWTLB("%s: TLB entry not found\n", __func__);
+    return -1;
+
+found_tlb:
+
+    if (msr_pr != 0) {
+        prot2 = tlb-&gt;prot &amp; 0xF;
+    } else {
+        prot2 = (tlb-&gt;prot &gt;&gt; 4) &amp; 0xF;
+    }
+
+    /* Check the address space */
+    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb-&gt;attr &amp; 1)) {
+        LOG_SWTLB("%s: AS doesn't match\n", __func__);
+        return -1;
+    }
+
+    *prot = prot2;
+    if (prot2 &amp; prot_for_access_type(access_type)) {
+        LOG_SWTLB("%s: good TLB!\n", __func__);
+        return 0;
+    }
+
+    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
+    return access_type == MMU_INST_FETCH ? -3 : -2;
+}
+
+static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
+                                         target_ulong address,
+                                         MMUAccessType access_type)
+{
+    ppcemb_tlb_t *tlb;
+    hwaddr raddr;
+    int i, ret;
+
+    ret = -1;
+    raddr = (hwaddr)-1ULL;
+    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
+        tlb = &amp;env-&gt;tlb.tlbe[i];
+        ret = mmubooke_check_tlb(env, tlb, &amp;raddr, &amp;ctx-&gt;prot, address,
+                                 access_type, i);
+        if (ret != -1) {
+            break;
+        }
+    }
+
+    if (ret &gt;= 0) {
+        ctx-&gt;raddr = raddr;
+        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
+                  " %d %d\n", __func__, address, ctx-&gt;raddr, ctx-&gt;prot,
+                  ret);
+    } else {
+        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
+                  " %d %d\n", __func__, address, raddr, ctx-&gt;prot, ret);
+    }
+
+    return ret;
+}
+
+hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
+                                        ppcmas_tlb_t *tlb)
+{
+    int tlbm_size;
+
+    tlbm_size = (tlb-&gt;mas1 &amp; MAS1_TSIZE_MASK) &gt;&gt; MAS1_TSIZE_SHIFT;
+
+    return 1024ULL &lt;&lt; tlbm_size;
+}
+
+/* TLB check function for MAS based SoftTLBs */
+int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
+                            hwaddr *raddrp, target_ulong address,
+                            uint32_t pid)
+{
+    hwaddr mask;
+    uint32_t tlb_pid;
+
+    if (!msr_cm) {
+        /* In 32bit mode we can only address 32bit EAs */
+        address = (uint32_t)address;
+    }
+
+    /* Check valid flag */
+    if (!(tlb-&gt;mas1 &amp; MAS1_VALID)) {
+        return -1;
+    }
+
+    mask = ~(booke206_tlb_to_page_size(env, tlb) - 1);
+    LOG_SWTLB("%s: TLB ADDR=0x" TARGET_FMT_lx " PID=0x%x MAS1=0x%x MAS2=0x%"
+              PRIx64 " mask=0x%" HWADDR_PRIx " MAS7_3=0x%" PRIx64 " MAS8=0x%"
+              PRIx32 "\n", __func__, address, pid, tlb-&gt;mas1, tlb-&gt;mas2, mask,
+              tlb-&gt;mas7_3, tlb-&gt;mas8);
+
+    /* Check PID */
+    tlb_pid = (tlb-&gt;mas1 &amp; MAS1_TID_MASK) &gt;&gt; MAS1_TID_SHIFT;
+    if (tlb_pid != 0 &amp;&amp; tlb_pid != pid) {
+        return -1;
+    }
+
+    /* Check effective address */
+    if ((address &amp; mask) != (tlb-&gt;mas2 &amp; MAS2_EPN_MASK)) {
+        return -1;
+    }
+
+    if (raddrp) {
+        *raddrp = (tlb-&gt;mas7_3 &amp; mask) | (address &amp; ~mask);
+    }
+
+    return 0;
+}
+
+static bool is_epid_mmu(int mmu_idx)
+{
+    return mmu_idx == PPC_TLB_EPID_STORE || mmu_idx == PPC_TLB_EPID_LOAD;
+}
+
+static uint32_t mmubooke206_esr(int mmu_idx, MMUAccessType access_type)
+{
+    uint32_t esr = 0;
+    if (access_type == MMU_DATA_STORE) {
+        esr |= ESR_ST;
+    }
+    if (is_epid_mmu(mmu_idx)) {
+        esr |= ESR_EPID;
+    }
+    return esr;
+}
+
+/*
+ * Get EPID register given the mmu_idx. If this is regular load,
+ * construct the EPID access bits from current processor state
+ *
+ * Get the effective AS and PR bits and the PID. The PID is returned
+ * only if EPID load is requested, otherwise the caller must detect
+ * the correct EPID.  Return true if valid EPID is returned.
+ */
+static bool mmubooke206_get_as(CPUPPCState *env,
+                               int mmu_idx, uint32_t *epid_out,
+                               bool *as_out, bool *pr_out)
+{
+    if (is_epid_mmu(mmu_idx)) {
+        uint32_t epidr;
+        if (mmu_idx == PPC_TLB_EPID_STORE) {
+            epidr = env-&gt;spr[SPR_BOOKE_EPSC];
+        } else {
+            epidr = env-&gt;spr[SPR_BOOKE_EPLC];
+        }
+        *epid_out = (epidr &amp; EPID_EPID) &gt;&gt; EPID_EPID_SHIFT;
+        *as_out = !!(epidr &amp; EPID_EAS);
+        *pr_out = !!(epidr &amp; EPID_EPR);
+        return true;
+    } else {
+        *as_out = msr_ds;
+        *pr_out = msr_pr;
+        return false;
+    }
+}
+
+/* Check if the tlb found by hashing really matches */
+static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
+                                 hwaddr *raddr, int *prot,
+                                 target_ulong address,
+                                 MMUAccessType access_type, int mmu_idx)
+{
+    int prot2 = 0;
+    uint32_t epid;
+    bool as, pr;
+    bool use_epid = mmubooke206_get_as(env, mmu_idx, &amp;epid, &amp;as, &amp;pr);
+
+    if (!use_epid) {
+        if (ppcmas_tlb_check(env, tlb, raddr, address,
+                             env-&gt;spr[SPR_BOOKE_PID]) &gt;= 0) {
+            goto found_tlb;
+        }
+
+        if (env-&gt;spr[SPR_BOOKE_PID1] &amp;&amp;
+            ppcmas_tlb_check(env, tlb, raddr, address,
+                             env-&gt;spr[SPR_BOOKE_PID1]) &gt;= 0) {
+            goto found_tlb;
+        }
+
+        if (env-&gt;spr[SPR_BOOKE_PID2] &amp;&amp;
+            ppcmas_tlb_check(env, tlb, raddr, address,
+                             env-&gt;spr[SPR_BOOKE_PID2]) &gt;= 0) {
+            goto found_tlb;
+        }
+    } else {
+        if (ppcmas_tlb_check(env, tlb, raddr, address, epid) &gt;= 0) {
+            goto found_tlb;
+        }
+    }
+
+    LOG_SWTLB("%s: TLB entry not found\n", __func__);
+    return -1;
+
+found_tlb:
+
+    if (pr) {
+        if (tlb-&gt;mas7_3 &amp; MAS3_UR) {
+            prot2 |= PAGE_READ;
+        }
+        if (tlb-&gt;mas7_3 &amp; MAS3_UW) {
+            prot2 |= PAGE_WRITE;
+        }
+        if (tlb-&gt;mas7_3 &amp; MAS3_UX) {
+            prot2 |= PAGE_EXEC;
+        }
+    } else {
+        if (tlb-&gt;mas7_3 &amp; MAS3_SR) {
+            prot2 |= PAGE_READ;
+        }
+        if (tlb-&gt;mas7_3 &amp; MAS3_SW) {
+            prot2 |= PAGE_WRITE;
+        }
+        if (tlb-&gt;mas7_3 &amp; MAS3_SX) {
+            prot2 |= PAGE_EXEC;
+        }
+    }
+
+    /* Check the address space and permissions */
+    if (access_type == MMU_INST_FETCH) {
+        /* There is no way to fetch code using epid load */
+        assert(!use_epid);
+        as = msr_ir;
+    }
+
+    if (as != ((tlb-&gt;mas1 &amp; MAS1_TS) &gt;&gt; MAS1_TS_SHIFT)) {
+        LOG_SWTLB("%s: AS doesn't match\n", __func__);
+        return -1;
+    }
+
+    *prot = prot2;
+    if (prot2 &amp; prot_for_access_type(access_type)) {
+        LOG_SWTLB("%s: good TLB!\n", __func__);
+        return 0;
+    }
+
+    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
+    return access_type == MMU_INST_FETCH ? -3 : -2;
+}
+
+static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
+                                            target_ulong address,
+                                            MMUAccessType access_type,
+                                            int mmu_idx)
+{
+    ppcmas_tlb_t *tlb;
+    hwaddr raddr;
+    int i, j, ret;
+
+    ret = -1;
+    raddr = (hwaddr)-1ULL;
+
+    for (i = 0; i &lt; BOOKE206_MAX_TLBN; i++) {
+        int ways = booke206_tlb_ways(env, i);
+
+        for (j = 0; j &lt; ways; j++) {
+            tlb = booke206_get_tlbm(env, i, address, j);
+            if (!tlb) {
+                continue;
+            }
+            ret = mmubooke206_check_tlb(env, tlb, &amp;raddr, &amp;ctx-&gt;prot, address,
+                                        access_type, mmu_idx);
+            if (ret != -1) {
+                goto found_tlb;
+            }
+        }
+    }
+
+found_tlb:
+
+    if (ret &gt;= 0) {
+        ctx-&gt;raddr = raddr;
+        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
+                  " %d %d\n", __func__, address, ctx-&gt;raddr, ctx-&gt;prot,
+                  ret);
+    } else {
+        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
+                  " %d %d\n", __func__, address, raddr, ctx-&gt;prot, ret);
+    }
+
+    return ret;
+}
+
+static const char *book3e_tsize_to_str[32] = {
+    "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K",
+    "1M", "2M", "4M", "8M", "16M", "32M", "64M", "128M", "256M", "512M",
+    "1G", "2G", "4G", "8G", "16G", "32G", "64G", "128G", "256G", "512G",
+    "1T", "2T"
+};
+
+static void mmubooke_dump_mmu(CPUPPCState *env)
+{
+    ppcemb_tlb_t *entry;
+    int i;
+
+    if (kvm_enabled() &amp;&amp; !env-&gt;kvm_sw_tlb) {
+        qemu_printf("Cannot access KVM TLB\n");
+        return;
+    }
+
+    qemu_printf("\nTLB:\n");
+    qemu_printf("Effective          Physical           Size PID   Prot     "
+                "Attr\n");
+
+    entry = &amp;env-&gt;tlb.tlbe[0];
+    for (i = 0; i &lt; env-&gt;nb_tlb; i++, entry++) {
+        hwaddr ea, pa;
+        target_ulong mask;
+        uint64_t size = (uint64_t)entry-&gt;size;
+        char size_buf[20];
+
+        /* Check valid flag */
+        if (!(entry-&gt;prot &amp; PAGE_VALID)) {
+            continue;
+        }
+
+        mask = ~(entry-&gt;size - 1);
+        ea = entry-&gt;EPN &amp; mask;
+        pa = entry-&gt;RPN &amp; mask;
+        /* Extend the physical address to 36 bits */
+        pa |= (hwaddr)(entry-&gt;RPN &amp; 0xF) &lt;&lt; 32;
+        if (size &gt;= 1 * MiB) {
+            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size / MiB);
+        } else {
+            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size / KiB);
+        }
+        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x\n",
+                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entry-&gt;PID,
+                    entry-&gt;prot, entry-&gt;attr);
+    }
+
+}
+
+static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int offset,
+                                     int tlbsize)
+{
+    ppcmas_tlb_t *entry;
+    int i;
+
+    qemu_printf("\nTLB%d:\n", tlbn);
+    qemu_printf("Effective          Physical           Size TID   TS SRWX"
+                " URWX WIMGE U0123\n");
+
+    entry = &amp;env-&gt;tlb.tlbm[offset];
+    for (i = 0; i &lt; tlbsize; i++, entry++) {
+        hwaddr ea, pa, size;
+        int tsize;
+
+        if (!(entry-&gt;mas1 &amp; MAS1_VALID)) {
+            continue;
+        }
+
+        tsize = (entry-&gt;mas1 &amp; MAS1_TSIZE_MASK) &gt;&gt; MAS1_TSIZE_SHIFT;
+        size = 1024ULL &lt;&lt; tsize;
+        ea = entry-&gt;mas2 &amp; ~(size - 1);
+        pa = entry-&gt;mas7_3 &amp; ~(size - 1);
+
+        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c%c%c"
+                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
+                    (uint64_t)ea, (uint64_t)pa,
+                    book3e_tsize_to_str[tsize],
+                    (entry-&gt;mas1 &amp; MAS1_TID_MASK) &gt;&gt; MAS1_TID_SHIFT,
+                    (entry-&gt;mas1 &amp; MAS1_TS) &gt;&gt; MAS1_TS_SHIFT,
+                    entry-&gt;mas7_3 &amp; MAS3_SR ? 'R' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_SW ? 'W' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_SX ? 'X' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_UR ? 'R' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_UW ? 'W' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_UX ? 'X' : '-',
+                    entry-&gt;mas2 &amp; MAS2_W ? 'W' : '-',
+                    entry-&gt;mas2 &amp; MAS2_I ? 'I' : '-',
+                    entry-&gt;mas2 &amp; MAS2_M ? 'M' : '-',
+                    entry-&gt;mas2 &amp; MAS2_G ? 'G' : '-',
+                    entry-&gt;mas2 &amp; MAS2_E ? 'E' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_U0 ? '0' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_U1 ? '1' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_U2 ? '2' : '-',
+                    entry-&gt;mas7_3 &amp; MAS3_U3 ? '3' : '-');
+    }
+}
+
+static void mmubooke206_dump_mmu(CPUPPCState *env)
+{
+    int offset = 0;
+    int i;
+
+    if (kvm_enabled() &amp;&amp; !env-&gt;kvm_sw_tlb) {
+        qemu_printf("Cannot access KVM TLB\n");
+        return;
+    }
+
+    for (i = 0; i &lt; BOOKE206_MAX_TLBN; i++) {
+        int size = booke206_tlb_size(env, i);
+
+        if (size == 0) {
+            continue;
+        }
+
+        mmubooke206_dump_one_tlb(env, i, offset, size);
+        offset += size;
+    }
+}
+
+static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
+{
+    target_ulong *BATlt, *BATut, *BATu, *BATl;
+    target_ulong BEPIl, BEPIu, bl;
+    int i;
+
+    switch (type) {
+    case ACCESS_CODE:
+        BATlt = env-&gt;IBAT[1];
+        BATut = env-&gt;IBAT[0];
+        break;
+    default:
+        BATlt = env-&gt;DBAT[1];
+        BATut = env-&gt;DBAT[0];
+        break;
+    }
+
+    for (i = 0; i &lt; env-&gt;nb_BATs; i++) {
+        BATu = &amp;BATut[i];
+        BATl = &amp;BATlt[i];
+        BEPIu = *BATu &amp; 0xF0000000;
+        BEPIl = *BATu &amp; 0x0FFE0000;
+        bl = (*BATu &amp; 0x00001FFC) &lt;&lt; 15;
+        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
+                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
+                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
+                    type == ACCESS_CODE ? "code" : "data", i,
+                    *BATu, *BATl, BEPIu, BEPIl, bl);
+    }
+}
+
+static void mmu6xx_dump_mmu(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    ppc6xx_tlb_t *tlb;
+    target_ulong sr;
+    int type, way, entry, i;
+
+    qemu_printf("HTAB base = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(cpu));
+    qemu_printf("HTAB mask = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(cpu));
+
+    qemu_printf("\nSegment registers:\n");
+    for (i = 0; i &lt; 32; i++) {
+        sr = env-&gt;sr[i];
+        if (sr &amp; 0x80000000) {
+            qemu_printf("%02d T=%d Ks=%d Kp=%d BUID=0x%03x "
+                        "CNTLR_SPEC=0x%05x\n", i,
+                        sr &amp; 0x80000000 ? 1 : 0, sr &amp; 0x40000000 ? 1 : 0,
+                        sr &amp; 0x20000000 ? 1 : 0, (uint32_t)((sr &gt;&gt; 20) &amp; 0x1FF),
+                        (uint32_t)(sr &amp; 0xFFFFF));
+        } else {
+            qemu_printf("%02d T=%d Ks=%d Kp=%d N=%d VSID=0x%06x\n", i,
+                        sr &amp; 0x80000000 ? 1 : 0, sr &amp; 0x40000000 ? 1 : 0,
+                        sr &amp; 0x20000000 ? 1 : 0, sr &amp; 0x10000000 ? 1 : 0,
+                        (uint32_t)(sr &amp; 0x00FFFFFF));
+        }
+    }
+
+    qemu_printf("\nBATs:\n");
+    mmu6xx_dump_BATs(env, ACCESS_INT);
+    mmu6xx_dump_BATs(env, ACCESS_CODE);
+
+    if (env-&gt;id_tlbs != 1) {
+        qemu_printf("ERROR: 6xx MMU should have separated TLB"
+                    " for code and data\n");
+    }
+
+    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
+
+    for (type = 0; type &lt; 2; type++) {
+        for (way = 0; way &lt; env-&gt;nb_ways; way++) {
+            for (entry = env-&gt;nb_tlb * type + env-&gt;tlb_per_way * way;
+                 entry &lt; (env-&gt;nb_tlb * type + env-&gt;tlb_per_way * (way + 1));
+                 entry++) {
+
+                tlb = &amp;env-&gt;tlb.tlb6[entry];
+                qemu_printf("%s TLB %02d/%02d way:%d %s ["
+                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
+                            type ? "code" : "data", entry % env-&gt;nb_tlb,
+                            env-&gt;nb_tlb, way,
+                            pte_is_valid(tlb-&gt;pte0) ? "valid" : "inval",
+                            tlb-&gt;EPN, tlb-&gt;EPN + TARGET_PAGE_SIZE);
+            }
+        }
+    }
+}
+
+void dump_mmu(CPUPPCState *env)
+{
+    switch (env-&gt;mmu_model) {
+    case POWERPC_MMU_BOOKE:
+        mmubooke_dump_mmu(env);
+        break;
+    case POWERPC_MMU_BOOKE206:
+        mmubooke206_dump_mmu(env);
+        break;
+    case POWERPC_MMU_SOFT_6xx:
+    case POWERPC_MMU_SOFT_74xx:
+        mmu6xx_dump_mmu(env);
+        break;
+#if defined(TARGET_PPC64)
+    case POWERPC_MMU_64B:
+    case POWERPC_MMU_2_03:
+    case POWERPC_MMU_2_06:
+    case POWERPC_MMU_2_07:
+        dump_slb(env_archcpu(env));
+        break;
+    case POWERPC_MMU_3_00:
+        if (ppc64_v3_radix(env_archcpu(env))) {
+            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n",
+                          __func__);
+        } else {
+            dump_slb(env_archcpu(env));
+        }
+        break;
+#endif
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
+    }
+}
+
+static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
+                          MMUAccessType access_type)
+{
+    int in_plb, ret;
+
+    ctx-&gt;raddr = eaddr;
+    ctx-&gt;prot = PAGE_READ | PAGE_EXEC;
+    ret = 0;
+    switch (env-&gt;mmu_model) {
+    case POWERPC_MMU_SOFT_6xx:
+    case POWERPC_MMU_SOFT_74xx:
+    case POWERPC_MMU_SOFT_4xx:
+    case POWERPC_MMU_REAL:
+    case POWERPC_MMU_BOOKE:
+        ctx-&gt;prot |= PAGE_WRITE;
+        break;
+
+    case POWERPC_MMU_SOFT_4xx_Z:
+        if (unlikely(msr_pe != 0)) {
+            /*
+             * 403 family add some particular protections, using
+             * PBL/PBU registers for accesses with no translation.
+             */
+            in_plb =
+                /* Check PLB validity */
+                (env-&gt;pb[0] &lt; env-&gt;pb[1] &amp;&amp;
+                 /* and address in plb area */
+                 eaddr &gt;= env-&gt;pb[0] &amp;&amp; eaddr &lt; env-&gt;pb[1]) ||
+                (env-&gt;pb[2] &lt; env-&gt;pb[3] &amp;&amp;
+                 eaddr &gt;= env-&gt;pb[2] &amp;&amp; eaddr &lt; env-&gt;pb[3]) ? 1 : 0;
+            if (in_plb ^ msr_px) {
+                /* Access in protected area */
+                if (access_type == MMU_DATA_STORE) {
+                    /* Access is not allowed */
+                    ret = -2;
+                }
+            } else {
+                /* Read-write access is allowed */
+                ctx-&gt;prot |= PAGE_WRITE;
+            }
+        }
+        break;
+
+    default:
+        /* Caller's checks mean we should never get here for other models */
+        abort();
+        return -1;
+    }
+
+    return ret;
+}
+
+int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
+                                     target_ulong eaddr,
+                                     MMUAccessType access_type, int type,
+                                     int mmu_idx)
+{
+    int ret = -1;
+    bool real_mode = (type == ACCESS_CODE &amp;&amp; msr_ir == 0)
+        || (type != ACCESS_CODE &amp;&amp; msr_dr == 0);
+
+    switch (env-&gt;mmu_model) {
+    case POWERPC_MMU_SOFT_6xx:
+    case POWERPC_MMU_SOFT_74xx:
+        if (real_mode) {
+            ret = check_physical(env, ctx, eaddr, access_type);
+        } else {
+            /* Try to find a BAT */
+            if (env-&gt;nb_BATs != 0) {
+                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type);
+            }
+            if (ret &lt; 0) {
+                /* We didn't match any BAT entry or don't have BATs */
+                ret = get_segment_6xx_tlb(env, ctx, eaddr, access_type, type);
+            }
+        }
+        break;
+
+    case POWERPC_MMU_SOFT_4xx:
+    case POWERPC_MMU_SOFT_4xx_Z:
+        if (real_mode) {
+            ret = check_physical(env, ctx, eaddr, access_type);
+        } else {
+            ret = mmu40x_get_physical_address(env, ctx, eaddr, access_type);
+        }
+        break;
+    case POWERPC_MMU_BOOKE:
+        ret = mmubooke_get_physical_address(env, ctx, eaddr, access_type);
+        break;
+    case POWERPC_MMU_BOOKE206:
+        ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
+                                               mmu_idx);
+        break;
+    case POWERPC_MMU_MPC8xx:
+        /* XXX: TODO */
+        cpu_abort(env_cpu(env), "MPC8xx MMU model is not implemented\n");
+        break;
+    case POWERPC_MMU_REAL:
+        if (real_mode) {
+            ret = check_physical(env, ctx, eaddr, access_type);
+        } else {
+            cpu_abort(env_cpu(env),
+                      "PowerPC in real mode do not do any translation\n");
+        }
+        return -1;
+    default:
+        cpu_abort(env_cpu(env), "Unknown or invalid MMU model\n");
+        return -1;
+    }
+
+    return ret;
+}
+
+int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
+                                target_ulong eaddr, MMUAccessType access_type,
+                                int type)
+{
+    return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
+}
+
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &amp;cpu-&gt;env;
+    mmu_ctx_t ctx;
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
+    if (unlikely(get_physical_address(env, &amp;ctx, addr, MMU_DATA_LOAD,
+                                      ACCESS_INT) != 0)) {
+
+        /*
+         * Some MMUs have separate TLBs for code and data. If we only
+         * try an ACCESS_INT, we may not be able to read instructions
+         * mapped by code TLBs, so we also try a ACCESS_CODE.
+         */
+        if (unlikely(get_physical_address(env, &amp;ctx, addr, MMU_INST_FETCH,
+                                          ACCESS_CODE) != 0)) {
+            return -1;
+        }
+    }
+
+    return ctx.raddr &amp; TARGET_PAGE_MASK;
+}
+
+static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
+                                         MMUAccessType access_type, int mmu_idx)
+{
+    uint32_t epid;
+    bool as, pr;
+    uint32_t missed_tid = 0;
+    bool use_epid = mmubooke206_get_as(env, mmu_idx, &amp;epid, &amp;as, &amp;pr);
+
+    if (access_type == MMU_INST_FETCH) {
+        as = msr_ir;
+    }
+    env-&gt;spr[SPR_BOOKE_MAS0] = env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_TLBSELD_MASK;
+    env-&gt;spr[SPR_BOOKE_MAS1] = env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_TSIZED_MASK;
+    env-&gt;spr[SPR_BOOKE_MAS2] = env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_WIMGED_MASK;
+    env-&gt;spr[SPR_BOOKE_MAS3] = 0;
+    env-&gt;spr[SPR_BOOKE_MAS6] = 0;
+    env-&gt;spr[SPR_BOOKE_MAS7] = 0;
+
+    /* AS */
+    if (as) {
+        env-&gt;spr[SPR_BOOKE_MAS1] |= MAS1_TS;
+        env-&gt;spr[SPR_BOOKE_MAS6] |= MAS6_SAS;
+    }
+
+    env-&gt;spr[SPR_BOOKE_MAS1] |= MAS1_VALID;
+    env-&gt;spr[SPR_BOOKE_MAS2] |= address &amp; MAS2_EPN_MASK;
+
+    if (!use_epid) {
+        switch (env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_TIDSELD_PIDZ) {
+        case MAS4_TIDSELD_PID0:
+            missed_tid = env-&gt;spr[SPR_BOOKE_PID];
+            break;
+        case MAS4_TIDSELD_PID1:
+            missed_tid = env-&gt;spr[SPR_BOOKE_PID1];
+            break;
+        case MAS4_TIDSELD_PID2:
+            missed_tid = env-&gt;spr[SPR_BOOKE_PID2];
+            break;
+        }
+        env-&gt;spr[SPR_BOOKE_MAS6] |= env-&gt;spr[SPR_BOOKE_PID] &lt;&lt; 16;
+    } else {
+        missed_tid = epid;
+        env-&gt;spr[SPR_BOOKE_MAS6] |= missed_tid &lt;&lt; 16;
+    }
+    env-&gt;spr[SPR_BOOKE_MAS1] |= (missed_tid &lt;&lt; MAS1_TID_SHIFT);
+
+
+    /* next victim logic */
+    env-&gt;spr[SPR_BOOKE_MAS0] |= env-&gt;last_way &lt;&lt; MAS0_ESEL_SHIFT;
+    env-&gt;last_way++;
+    env-&gt;last_way &amp;= booke206_tlb_ways(env, 0) - 1;
+    env-&gt;spr[SPR_BOOKE_MAS0] |= env-&gt;last_way &lt;&lt; MAS0_NV_SHIFT;
+}
+
+/* Perform address translation */
+static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
+                                    MMUAccessType access_type, int mmu_idx)
+{
+    CPUState *cs = env_cpu(env);
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    mmu_ctx_t ctx;
+    int type;
+    int ret = 0;
+
+    if (access_type == MMU_INST_FETCH) {
+        /* code access */
+        type = ACCESS_CODE;
+    } else {
+        /* data access */
+        type = env-&gt;access_type;
+    }
+    ret = get_physical_address_wtlb(env, &amp;ctx, address, access_type,
+                                    type, mmu_idx);
+    if (ret == 0) {
+        tlb_set_page(cs, address &amp; TARGET_PAGE_MASK,
+                     ctx.raddr &amp; TARGET_PAGE_MASK, ctx.prot,
+                     mmu_idx, TARGET_PAGE_SIZE);
+        ret = 0;
+    } else if (ret &lt; 0) {
+        LOG_MMU_STATE(cs);
+        if (type == ACCESS_CODE) {
+            switch (ret) {
+            case -1:
+                /* No matches in page tables or TLB */
+                switch (env-&gt;mmu_model) {
+                case POWERPC_MMU_SOFT_6xx:
+                    cs-&gt;exception_index = POWERPC_EXCP_IFTLB;
+                    env-&gt;error_code = 1 &lt;&lt; 18;
+                    env-&gt;spr[SPR_IMISS] = address;
+                    env-&gt;spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
+                    goto tlb_miss;
+                case POWERPC_MMU_SOFT_74xx:
+                    cs-&gt;exception_index = POWERPC_EXCP_IFTLB;
+                    goto tlb_miss_74xx;
+                case POWERPC_MMU_SOFT_4xx:
+                case POWERPC_MMU_SOFT_4xx_Z:
+                    cs-&gt;exception_index = POWERPC_EXCP_ITLB;
+                    env-&gt;error_code = 0;
+                    env-&gt;spr[SPR_40x_DEAR] = address;
+                    env-&gt;spr[SPR_40x_ESR] = 0x00000000;
+                    break;
+                case POWERPC_MMU_BOOKE206:
+                    booke206_update_mas_tlb_miss(env, address, 2, mmu_idx);
+                    /* fall through */
+                case POWERPC_MMU_BOOKE:
+                    cs-&gt;exception_index = POWERPC_EXCP_ITLB;
+                    env-&gt;error_code = 0;
+                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
+                    env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
+                    return -1;
+                case POWERPC_MMU_MPC8xx:
+                    /* XXX: TODO */
+                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
+                    break;
+                case POWERPC_MMU_REAL:
+                    cpu_abort(cs, "PowerPC in real mode should never raise "
+                              "any MMU exceptions\n");
+                    return -1;
+                default:
+                    cpu_abort(cs, "Unknown or invalid MMU model\n");
+                    return -1;
+                }
+                break;
+            case -2:
+                /* Access rights violation */
+                cs-&gt;exception_index = POWERPC_EXCP_ISI;
+                env-&gt;error_code = 0x08000000;
+                break;
+            case -3:
+                /* No execute protection violation */
+                if ((env-&gt;mmu_model == POWERPC_MMU_BOOKE) ||
+                    (env-&gt;mmu_model == POWERPC_MMU_BOOKE206)) {
+                    env-&gt;spr[SPR_BOOKE_ESR] = 0x00000000;
+                }
+                cs-&gt;exception_index = POWERPC_EXCP_ISI;
+                env-&gt;error_code = 0x10000000;
+                break;
+            case -4:
+                /* Direct store exception */
+                /* No code fetch is allowed in direct-store areas */
+                cs-&gt;exception_index = POWERPC_EXCP_ISI;
+                env-&gt;error_code = 0x10000000;
+                break;
+            }
+        } else {
+            switch (ret) {
+            case -1:
+                /* No matches in page tables or TLB */
+                switch (env-&gt;mmu_model) {
+                case POWERPC_MMU_SOFT_6xx:
+                    if (access_type == MMU_DATA_STORE) {
+                        cs-&gt;exception_index = POWERPC_EXCP_DSTLB;
+                        env-&gt;error_code = 1 &lt;&lt; 16;
+                    } else {
+                        cs-&gt;exception_index = POWERPC_EXCP_DLTLB;
+                        env-&gt;error_code = 0;
+                    }
+                    env-&gt;spr[SPR_DMISS] = address;
+                    env-&gt;spr[SPR_DCMP] = 0x80000000 | ctx.ptem;
+                tlb_miss:
+                    env-&gt;error_code |= ctx.key &lt;&lt; 19;
+                    env-&gt;spr[SPR_HASH1] = ppc_hash32_hpt_base(cpu) +
+                        get_pteg_offset32(cpu, ctx.hash[0]);
+                    env-&gt;spr[SPR_HASH2] = ppc_hash32_hpt_base(cpu) +
+                        get_pteg_offset32(cpu, ctx.hash[1]);
+                    break;
+                case POWERPC_MMU_SOFT_74xx:
+                    if (access_type == MMU_DATA_STORE) {
+                        cs-&gt;exception_index = POWERPC_EXCP_DSTLB;
+                    } else {
+                        cs-&gt;exception_index = POWERPC_EXCP_DLTLB;
+                    }
+                tlb_miss_74xx:
+                    /* Implement LRU algorithm */
+                    env-&gt;error_code = ctx.key &lt;&lt; 19;
+                    env-&gt;spr[SPR_TLBMISS] = (address &amp; ~((target_ulong)0x3)) |
+                        ((env-&gt;last_way + 1) &amp; (env-&gt;nb_ways - 1));
+                    env-&gt;spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
+                    break;
+                case POWERPC_MMU_SOFT_4xx:
+                case POWERPC_MMU_SOFT_4xx_Z:
+                    cs-&gt;exception_index = POWERPC_EXCP_DTLB;
+                    env-&gt;error_code = 0;
+                    env-&gt;spr[SPR_40x_DEAR] = address;
+                    if (access_type == MMU_DATA_STORE) {
+                        env-&gt;spr[SPR_40x_ESR] = 0x00800000;
+                    } else {
+                        env-&gt;spr[SPR_40x_ESR] = 0x00000000;
+                    }
+                    break;
+                case POWERPC_MMU_MPC8xx:
+                    /* XXX: TODO */
+                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
+                    break;
+                case POWERPC_MMU_BOOKE206:
+                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
+                    /* fall through */
+                case POWERPC_MMU_BOOKE:
+                    cs-&gt;exception_index = POWERPC_EXCP_DTLB;
+                    env-&gt;error_code = 0;
+                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
+                    env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
+                    return -1;
+                case POWERPC_MMU_REAL:
+                    cpu_abort(cs, "PowerPC in real mode should never raise "
+                              "any MMU exceptions\n");
+                    return -1;
+                default:
+                    cpu_abort(cs, "Unknown or invalid MMU model\n");
+                    return -1;
+                }
+                break;
+            case -2:
+                /* Access rights violation */
+                cs-&gt;exception_index = POWERPC_EXCP_DSI;
+                env-&gt;error_code = 0;
+                if (env-&gt;mmu_model == POWERPC_MMU_SOFT_4xx
+                    || env-&gt;mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
+                    env-&gt;spr[SPR_40x_DEAR] = address;
+                    if (access_type == MMU_DATA_STORE) {
+                        env-&gt;spr[SPR_40x_ESR] |= 0x00800000;
+                    }
+                } else if ((env-&gt;mmu_model == POWERPC_MMU_BOOKE) ||
+                           (env-&gt;mmu_model == POWERPC_MMU_BOOKE206)) {
+                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
+                    env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
+                } else {
+                    env-&gt;spr[SPR_DAR] = address;
+                    if (access_type == MMU_DATA_STORE) {
+                        env-&gt;spr[SPR_DSISR] = 0x0A000000;
+                    } else {
+                        env-&gt;spr[SPR_DSISR] = 0x08000000;
+                    }
+                }
+                break;
+            case -4:
+                /* Direct store exception */
+                switch (type) {
+                case ACCESS_FLOAT:
+                    /* Floating point load/store */
+                    cs-&gt;exception_index = POWERPC_EXCP_ALIGN;
+                    env-&gt;error_code = POWERPC_EXCP_ALIGN_FP;
+                    env-&gt;spr[SPR_DAR] = address;
+                    break;
+                case ACCESS_RES:
+                    /* lwarx, ldarx or stwcx. */
+                    cs-&gt;exception_index = POWERPC_EXCP_DSI;
+                    env-&gt;error_code = 0;
+                    env-&gt;spr[SPR_DAR] = address;
+                    if (access_type == MMU_DATA_STORE) {
+                        env-&gt;spr[SPR_DSISR] = 0x06000000;
+                    } else {
+                        env-&gt;spr[SPR_DSISR] = 0x04000000;
+                    }
+                    break;
+                case ACCESS_EXT:
+                    /* eciwx or ecowx */
+                    cs-&gt;exception_index = POWERPC_EXCP_DSI;
+                    env-&gt;error_code = 0;
+                    env-&gt;spr[SPR_DAR] = address;
+                    if (access_type == MMU_DATA_STORE) {
+                        env-&gt;spr[SPR_DSISR] = 0x06100000;
+                    } else {
+                        env-&gt;spr[SPR_DSISR] = 0x04100000;
+                    }
+                    break;
+                default:
+                    printf("DSI: invalid exception (%d)\n", ret);
+                    cs-&gt;exception_index = POWERPC_EXCP_PROGRAM;
+                    env-&gt;error_code =
+                        POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
+                    env-&gt;spr[SPR_DAR] = address;
+                    break;
+                }
+                break;
+            }
+        }
+        ret = 1;
+    }
+
+    return ret;
+}
+
+bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
+    CPUPPCState *env = &amp;cpu-&gt;env;
+    int ret;
+
+    if (pcc-&gt;handle_mmu_fault) {
+        ret = pcc-&gt;handle_mmu_fault(cpu, addr, access_type, mmu_idx);
+    } else {
+        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
+    }
+    if (unlikely(ret != 0)) {
+        if (probe) {
+            return false;
+        }
+        raise_exception_err_ra(env, cs-&gt;exception_index, env-&gt;error_code,
+                               retaddr);
+    }
+    return true;
+}
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 803b66f2b0..dbf7b398cd 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -33,1736 +33,156 @@
 #include "internal.h"
 #include "mmu-book3s-v3.h"
 #include "mmu-radix64.h"
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
 
-#ifdef CONFIG_TCG
-#include "exec/helper-proto.h"
-#include "exec/cpu_ldst.h"
-#endif
-/* #define DEBUG_MMU */
-/* #define DEBUG_BATS */
-/* #define DEBUG_SOFTWARE_TLB */
-/* #define DUMP_PAGE_TABLES */
-/* #define FLUSH_ALL_TLBS */
-
-#ifdef DEBUG_MMU
-#  define LOG_MMU_STATE(cpu) log_cpu_state_mask(CPU_LOG_MMU, (cpu), 0)
-#else
-#  define LOG_MMU_STATE(cpu) do { } while (0)
-#endif
-
-#ifdef DEBUG_SOFTWARE_TLB
-#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
-#else
-#  define LOG_SWTLB(...) do { } while (0)
-#endif
-
-#ifdef DEBUG_BATS
-#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
-#else
-#  define LOG_BATS(...) do { } while (0)
-#endif
-
-/*****************************************************************************/
-/* PowerPC MMU emulation */
-
-/* Context used internally during MMU translations */
-typedef struct mmu_ctx_t mmu_ctx_t;
-struct mmu_ctx_t {
-    hwaddr raddr;      /* Real address              */
-    hwaddr eaddr;      /* Effective address         */
-    int prot;                      /* Protection bits           */
-    hwaddr hash[2];    /* Pagetable hash values     */
-    target_ulong ptem;             /* Virtual segment ID | API  */
-    int key;                       /* Access key                */
-    int nx;                        /* Non-execute area          */
-};
-
-/* Common routines used by software and hardware TLBs emulation */
-static inline int pte_is_valid(target_ulong pte0)
-{
-    return pte0 &amp; 0x80000000 ? 1 : 0;
-}
-
-static inline void pte_invalidate(target_ulong *pte0)
-{
-    *pte0 &amp;= ~0x80000000;
-}
-
-#define PTE_PTEM_MASK 0x7FFFFFBF
-#define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
-
-static int pp_check(int key, int pp, int nx)
-{
-    int access;
-
-    /* Compute access rights */
-    access = 0;
-    if (key == 0) {
-        switch (pp) {
-        case 0x0:
-        case 0x1:
-        case 0x2:
-            access |= PAGE_WRITE;
-            /* fall through */
-        case 0x3:
-            access |= PAGE_READ;
-            break;
-        }
-    } else {
-        switch (pp) {
-        case 0x0:
-            access = 0;
-            break;
-        case 0x1:
-        case 0x3:
-            access = PAGE_READ;
-            break;
-        case 0x2:
-            access = PAGE_READ | PAGE_WRITE;
-            break;
-        }
-    }
-    if (nx == 0) {
-        access |= PAGE_EXEC;
-    }
-
-    return access;
-}
-
-static int check_prot(int prot, MMUAccessType access_type)
-{
-    return prot &amp; prot_for_access_type(access_type) ? 0 : -2;
-}
-
-static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
-                                target_ulong pte1, int h,
-                                MMUAccessType access_type)
-{
-    target_ulong ptem, mmask;
-    int access, ret, pteh, ptev, pp;
-
-    ret = -1;
-    /* Check validity and table match */
-    ptev = pte_is_valid(pte0);
-    pteh = (pte0 &gt;&gt; 6) &amp; 1;
-    if (ptev &amp;&amp; h == pteh) {
-        /* Check vsid &amp; api */
-        ptem = pte0 &amp; PTE_PTEM_MASK;
-        mmask = PTE_CHECK_MASK;
-        pp = pte1 &amp; 0x00000003;
-        if (ptem == ctx-&gt;ptem) {
-            if (ctx-&gt;raddr != (hwaddr)-1ULL) {
-                /* all matches should have equal RPN, WIMG &amp; PP */
-                if ((ctx-&gt;raddr &amp; mmask) != (pte1 &amp; mmask)) {
-                    qemu_log_mask(CPU_LOG_MMU, "Bad RPN/WIMG/PP\n");
-                    return -3;
-                }
-            }
-            /* Compute access rights */
-            access = pp_check(ctx-&gt;key, pp, ctx-&gt;nx);
-            /* Keep the matching PTE information */
-            ctx-&gt;raddr = pte1;
-            ctx-&gt;prot = access;
-            ret = check_prot(ctx-&gt;prot, access_type);
-            if (ret == 0) {
-                /* Access granted */
-                qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
-            } else {
-                /* Access right violation */
-                qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
-            }
-        }
-    }
-
-    return ret;
-}
-
-static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
-                            int ret, MMUAccessType access_type)
-{
-    int store = 0;
-
-    /* Update page flags */
-    if (!(*pte1p &amp; 0x00000100)) {
-        /* Update accessed flag */
-        *pte1p |= 0x00000100;
-        store = 1;
-    }
-    if (!(*pte1p &amp; 0x00000080)) {
-        if (access_type == MMU_DATA_STORE &amp;&amp; ret == 0) {
-            /* Update changed flag */
-            *pte1p |= 0x00000080;
-            store = 1;
-        } else {
-            /* Force page fault for first write access */
-            ctx-&gt;prot &amp;= ~PAGE_WRITE;
-        }
-    }
-
-    return store;
-}
-
-/* Software driven TLB helpers */
-static inline int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
-                                    int way, int is_code)
-{
-    int nr;
-
-    /* Select TLB num in a way from address */
-    nr = (eaddr &gt;&gt; TARGET_PAGE_BITS) &amp; (env-&gt;tlb_per_way - 1);
-    /* Select TLB way */
-    nr += env-&gt;tlb_per_way * way;
-    /* 6xx have separate TLBs for instructions and data */
-    if (is_code &amp;&amp; env-&gt;id_tlbs == 1) {
-        nr += env-&gt;nb_tlb;
-    }
-
-    return nr;
-}
-
-static inline void ppc6xx_tlb_invalidate_all(CPUPPCState *env)
-{
-    ppc6xx_tlb_t *tlb;
-    int nr, max;
-
-    /* LOG_SWTLB("Invalidate all TLBs\n"); */
-    /* Invalidate all defined software TLB */
-    max = env-&gt;nb_tlb;
-    if (env-&gt;id_tlbs == 1) {
-        max *= 2;
-    }
-    for (nr = 0; nr &lt; max; nr++) {
-        tlb = &amp;env-&gt;tlb.tlb6[nr];
-        pte_invalidate(&amp;tlb-&gt;pte0);
-    }
-    tlb_flush(env_cpu(env));
-}
-
-static inline void ppc6xx_tlb_invalidate_virt2(CPUPPCState *env,
-                                               target_ulong eaddr,
-                                               int is_code, int match_epn)
-{
-#if !defined(FLUSH_ALL_TLBS)
-    CPUState *cs = env_cpu(env);
-    ppc6xx_tlb_t *tlb;
-    int way, nr;
-
-    /* Invalidate ITLB + DTLB, all ways */
-    for (way = 0; way &lt; env-&gt;nb_ways; way++) {
-        nr = ppc6xx_tlb_getnum(env, eaddr, way, is_code);
-        tlb = &amp;env-&gt;tlb.tlb6[nr];
-        if (pte_is_valid(tlb-&gt;pte0) &amp;&amp; (match_epn == 0 || eaddr == tlb-&gt;EPN)) {
-            LOG_SWTLB("TLB invalidate %d/%d " TARGET_FMT_lx "\n", nr,
-                      env-&gt;nb_tlb, eaddr);
-            pte_invalidate(&amp;tlb-&gt;pte0);
-            tlb_flush_page(cs, tlb-&gt;EPN);
-        }
-    }
-#else
-    /* XXX: PowerPC specification say this is valid as well */
-    ppc6xx_tlb_invalidate_all(env);
-#endif
-}
-
-static inline void ppc6xx_tlb_invalidate_virt(CPUPPCState *env,
-                                              target_ulong eaddr, int is_code)
-{
-    ppc6xx_tlb_invalidate_virt2(env, eaddr, is_code, 0);
-}
-
-#ifdef CONFIG_TCG
-static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
-                             int is_code, target_ulong pte0, target_ulong pte1)
-{
-    ppc6xx_tlb_t *tlb;
-    int nr;
-
-    nr = ppc6xx_tlb_getnum(env, EPN, way, is_code);
-    tlb = &amp;env-&gt;tlb.tlb6[nr];
-    LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
-              " PTE1 " TARGET_FMT_lx "\n", nr, env-&gt;nb_tlb, EPN, pte0, pte1);
-    /* Invalidate any pending reference in QEMU for this virtual address */
-    ppc6xx_tlb_invalidate_virt2(env, EPN, is_code, 1);
-    tlb-&gt;pte0 = pte0;
-    tlb-&gt;pte1 = pte1;
-    tlb-&gt;EPN = EPN;
-    /* Store last way for LRU mechanism */
-    env-&gt;last_way = way;
-}
-#endif
-
-static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
-                            target_ulong eaddr, MMUAccessType access_type)
-{
-    ppc6xx_tlb_t *tlb;
-    int nr, best, way;
-    int ret;
-
-    best = -1;
-    ret = -1; /* No TLB found */
-    for (way = 0; way &lt; env-&gt;nb_ways; way++) {
-        nr = ppc6xx_tlb_getnum(env, eaddr, way, access_type == MMU_INST_FETCH);
-        tlb = &amp;env-&gt;tlb.tlb6[nr];
-        /* This test "emulates" the PTE index match for hardware TLBs */
-        if ((eaddr &amp; TARGET_PAGE_MASK) != tlb-&gt;EPN) {
-            LOG_SWTLB("TLB %d/%d %s [" TARGET_FMT_lx " " TARGET_FMT_lx
-                      "] &lt;&gt; " TARGET_FMT_lx "\n", nr, env-&gt;nb_tlb,
-                      pte_is_valid(tlb-&gt;pte0) ? "valid" : "inval",
-                      tlb-&gt;EPN, tlb-&gt;EPN + TARGET_PAGE_SIZE, eaddr);
-            continue;
-        }
-        LOG_SWTLB("TLB %d/%d %s " TARGET_FMT_lx " &lt;&gt; " TARGET_FMT_lx " "
-                  TARGET_FMT_lx " %c %c\n", nr, env-&gt;nb_tlb,
-                  pte_is_valid(tlb-&gt;pte0) ? "valid" : "inval",
-                  tlb-&gt;EPN, eaddr, tlb-&gt;pte1,
-                  access_type == MMU_DATA_STORE ? 'S' : 'L',
-                  access_type == MMU_INST_FETCH ? 'I' : 'D');
-        switch (ppc6xx_tlb_pte_check(ctx, tlb-&gt;pte0, tlb-&gt;pte1,
-                                     0, access_type)) {
-        case -3:
-            /* TLB inconsistency */
-            return -1;
-        case -2:
-            /* Access violation */
-            ret = -2;
-            best = nr;
-            break;
-        case -1:
-        default:
-            /* No match */
-            break;
-        case 0:
-            /* access granted */
-            /*
-             * XXX: we should go on looping to check all TLBs
-             *      consistency but we can speed-up the whole thing as
-             *      the result would be undefined if TLBs are not
-             *      consistent.
-             */
-            ret = 0;
-            best = nr;
-            goto done;
-        }
-    }
-    if (best != -1) {
-    done:
-        LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=%01x ret=%d\n",
-                  ctx-&gt;raddr &amp; TARGET_PAGE_MASK, ctx-&gt;prot, ret);
-        /* Update page flags */
-        pte_update_flags(ctx, &amp;env-&gt;tlb.tlb6[best].pte1, ret, access_type);
-    }
-
-    return ret;
-}
-
-/* Perform BAT hit &amp; translation */
-static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
-                                 int *validp, int *protp, target_ulong *BATu,
-                                 target_ulong *BATl)
-{
-    target_ulong bl;
-    int pp, valid, prot;
-
-    bl = (*BATu &amp; 0x00001FFC) &lt;&lt; 15;
-    valid = 0;
-    prot = 0;
-    if (((msr_pr == 0) &amp;&amp; (*BATu &amp; 0x00000002)) ||
-        ((msr_pr != 0) &amp;&amp; (*BATu &amp; 0x00000001))) {
-        valid = 1;
-        pp = *BATl &amp; 0x00000003;
-        if (pp != 0) {
-            prot = PAGE_READ | PAGE_EXEC;
-            if (pp == 0x2) {
-                prot |= PAGE_WRITE;
-            }
-        }
-    }
-    *blp = bl;
-    *validp = valid;
-    *protp = prot;
-}
-
-static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
-                           target_ulong virtual, MMUAccessType access_type)
-{
-    target_ulong *BATlt, *BATut, *BATu, *BATl;
-    target_ulong BEPIl, BEPIu, bl;
-    int i, valid, prot;
-    int ret = -1;
-    bool ifetch = access_type == MMU_INST_FETCH;
-
-    LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
-             ifetch ? 'I' : 'D', virtual);
-    if (ifetch) {
-        BATlt = env-&gt;IBAT[1];
-        BATut = env-&gt;IBAT[0];
-    } else {
-        BATlt = env-&gt;DBAT[1];
-        BATut = env-&gt;DBAT[0];
-    }
-    for (i = 0; i &lt; env-&gt;nb_BATs; i++) {
-        BATu = &amp;BATut[i];
-        BATl = &amp;BATlt[i];
-        BEPIu = *BATu &amp; 0xF0000000;
-        BEPIl = *BATu &amp; 0x0FFE0000;
-        bat_size_prot(env, &amp;bl, &amp;valid, &amp;prot, BATu, BATl);
-        LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
-                 " BATl " TARGET_FMT_lx "\n", __func__,
-                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
-        if ((virtual &amp; 0xF0000000) == BEPIu &amp;&amp;
-            ((virtual &amp; 0x0FFE0000) &amp; ~bl) == BEPIl) {
-            /* BAT matches */
-            if (valid != 0) {
-                /* Get physical address */
-                ctx-&gt;raddr = (*BATl &amp; 0xF0000000) |
-                    ((virtual &amp; 0x0FFE0000 &amp; bl) | (*BATl &amp; 0x0FFE0000)) |
-                    (virtual &amp; 0x0001F000);
-                /* Compute access rights */
-                ctx-&gt;prot = prot;
-                ret = check_prot(ctx-&gt;prot, access_type);
-                if (ret == 0) {
-                    LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=%c%c\n",
-                             i, ctx-&gt;raddr, ctx-&gt;prot &amp; PAGE_READ ? 'R' : '-',
-                             ctx-&gt;prot &amp; PAGE_WRITE ? 'W' : '-');
-                }
-                break;
-            }
-        }
-    }
-    if (ret &lt; 0) {
-#if defined(DEBUG_BATS)
-        if (qemu_log_enabled()) {
-            LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", virtual);
-            for (i = 0; i &lt; 4; i++) {
-                BATu = &amp;BATut[i];
-                BATl = &amp;BATlt[i];
-                BEPIu = *BATu &amp; 0xF0000000;
-                BEPIl = *BATu &amp; 0x0FFE0000;
-                bl = (*BATu &amp; 0x00001FFC) &lt;&lt; 15;
-                LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
-                         " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
-                         TARGET_FMT_lx " " TARGET_FMT_lx "\n",
-                         __func__, ifetch ? 'I' : 'D', i, virtual,
-                         *BATu, *BATl, BEPIu, BEPIl, bl);
-            }
-        }
-#endif
-    }
-    /* No hit */
-    return ret;
-}
-
-/* Perform segment based translation */
-static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
-                               target_ulong eaddr, MMUAccessType access_type,
-                               int type)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    hwaddr hash;
-    target_ulong vsid;
-    int ds, pr, target_page_bits;
-    int ret;
-    target_ulong sr, pgidx;
-
-    pr = msr_pr;
-    ctx-&gt;eaddr = eaddr;
-
-    sr = env-&gt;sr[eaddr &gt;&gt; 28];
-    ctx-&gt;key = (((sr &amp; 0x20000000) &amp;&amp; (pr != 0)) ||
-                ((sr &amp; 0x40000000) &amp;&amp; (pr == 0))) ? 1 : 0;
-    ds = sr &amp; 0x80000000 ? 1 : 0;
-    ctx-&gt;nx = sr &amp; 0x10000000 ? 1 : 0;
-    vsid = sr &amp; 0x00FFFFFF;
-    target_page_bits = TARGET_PAGE_BITS;
-    qemu_log_mask(CPU_LOG_MMU,
-            "Check segment v=" TARGET_FMT_lx " %d " TARGET_FMT_lx
-            " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
-            " ir=%d dr=%d pr=%d %d t=%d\n",
-            eaddr, (int)(eaddr &gt;&gt; 28), sr, env-&gt;nip, env-&gt;lr, (int)msr_ir,
-            (int)msr_dr, pr != 0 ? 1 : 0, access_type == MMU_DATA_STORE, type);
-    pgidx = (eaddr &amp; ~SEGMENT_MASK_256M) &gt;&gt; target_page_bits;
-    hash = vsid ^ pgidx;
-    ctx-&gt;ptem = (vsid &lt;&lt; 7) | (pgidx &gt;&gt; 10);
-
-    qemu_log_mask(CPU_LOG_MMU,
-            "pte segment: key=%d ds %d nx %d vsid " TARGET_FMT_lx "\n",
-            ctx-&gt;key, ds, ctx-&gt;nx, vsid);
-    ret = -1;
-    if (!ds) {
-        /* Check if instruction fetch is allowed, if needed */
-        if (type != ACCESS_CODE || ctx-&gt;nx == 0) {
-            /* Page address translation */
-            qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
-                    " htab_mask " TARGET_FMT_plx
-                    " hash " TARGET_FMT_plx "\n",
-                    ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
-            ctx-&gt;hash[0] = hash;
-            ctx-&gt;hash[1] = ~hash;
-
-            /* Initialize real address with an invalid value */
-            ctx-&gt;raddr = (hwaddr)-1ULL;
-            /* Software TLB search */
-            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type);
-#if defined(DUMP_PAGE_TABLES)
-            if (qemu_loglevel_mask(CPU_LOG_MMU)) {
-                CPUState *cs = env_cpu(env);
-                hwaddr curaddr;
-                uint32_t a0, a1, a2, a3;
-
-                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
-                         "\n", ppc_hash32_hpt_base(cpu),
-                         ppc_hash32_hpt_mask(env) + 0x80);
-                for (curaddr = ppc_hash32_hpt_base(cpu);
-                     curaddr &lt; (ppc_hash32_hpt_base(cpu)
-                                + ppc_hash32_hpt_mask(cpu) + 0x80);
-                     curaddr += 16) {
-                    a0 = ldl_phys(cs-&gt;as, curaddr);
-                    a1 = ldl_phys(cs-&gt;as, curaddr + 4);
-                    a2 = ldl_phys(cs-&gt;as, curaddr + 8);
-                    a3 = ldl_phys(cs-&gt;as, curaddr + 12);
-                    if (a0 != 0 || a1 != 0 || a2 != 0 || a3 != 0) {
-                        qemu_log(TARGET_FMT_plx ": %08x %08x %08x %08x\n",
-                                 curaddr, a0, a1, a2, a3);
-                    }
-                }
-            }
-#endif
-        } else {
-            qemu_log_mask(CPU_LOG_MMU, "No access allowed\n");
-            ret = -3;
-        }
-    } else {
-        target_ulong sr;
-
-        qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
-        /* Direct-store segment : absolutely *BUGGY* for now */
-
-        /*
-         * Direct-store implies a 32-bit MMU.
-         * Check the Segment Register's bus unit ID (BUID).
-         */
-        sr = env-&gt;sr[eaddr &gt;&gt; 28];
-        if ((sr &amp; 0x1FF00000) &gt;&gt; 20 == 0x07f) {
-            /*
-             * Memory-forced I/O controller interface access
-             *
-             * If T=1 and BUID=x'07F', the 601 performs a memory
-             * access to SR[28-31] LA[4-31], bypassing all protection
-             * mechanisms.
-             */
-            ctx-&gt;raddr = ((sr &amp; 0xF) &lt;&lt; 28) | (eaddr &amp; 0x0FFFFFFF);
-            ctx-&gt;prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-            return 0;
-        }
-
-        switch (type) {
-        case ACCESS_INT:
-            /* Integer load/store : only access allowed */
-            break;
-        case ACCESS_CODE:
-            /* No code fetch is allowed in direct-store areas */
-            return -4;
-        case ACCESS_FLOAT:
-            /* Floating point load/store */
-            return -4;
-        case ACCESS_RES:
-            /* lwarx, ldarx or srwcx. */
-            return -4;
-        case ACCESS_CACHE:
-            /*
-             * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
-             *
-             * Should make the instruction do no-op.  As it already do
-             * no-op, it's quite easy :-)
-             */
-            ctx-&gt;raddr = eaddr;
-            return 0;
-        case ACCESS_EXT:
-            /* eciwx or ecowx */
-            return -4;
-        default:
-            qemu_log_mask(CPU_LOG_MMU, "ERROR: instruction should not need "
-                          "address translation\n");
-            return -4;
-        }
-        if ((access_type == MMU_DATA_STORE || ctx-&gt;key != 1) &amp;&amp;
-            (access_type == MMU_DATA_LOAD || ctx-&gt;key != 0)) {
-            ctx-&gt;raddr = eaddr;
-            ret = 2;
-        } else {
-            ret = -2;
-        }
-    }
-
-    return ret;
-}
-
-/* Generic TLB check function for embedded PowerPC implementations */
-static int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
-                            hwaddr *raddrp,
-                            target_ulong address, uint32_t pid, int ext,
-                            int i)
-{
-    target_ulong mask;
-
-    /* Check valid flag */
-    if (!(tlb-&gt;prot &amp; PAGE_VALID)) {
-        return -1;
-    }
-    mask = ~(tlb-&gt;size - 1);
-    LOG_SWTLB("%s: TLB %d address " TARGET_FMT_lx " PID %u &lt;=&gt; " TARGET_FMT_lx
-              " " TARGET_FMT_lx " %u %x\n", __func__, i, address, pid, tlb-&gt;EPN,
-              mask, (uint32_t)tlb-&gt;PID, tlb-&gt;prot);
-    /* Check PID */
-    if (tlb-&gt;PID != 0 &amp;&amp; tlb-&gt;PID != pid) {
-        return -1;
-    }
-    /* Check effective address */
-    if ((address &amp; mask) != tlb-&gt;EPN) {
-        return -1;
-    }
-    *raddrp = (tlb-&gt;RPN &amp; mask) | (address &amp; ~mask);
-    if (ext) {
-        /* Extend the physical address to 36 bits */
-        *raddrp |= (uint64_t)(tlb-&gt;RPN &amp; 0xF) &lt;&lt; 32;
-    }
-
-    return 0;
-}
-
-#ifdef CONFIG_TCG
-/* Generic TLB search function for PowerPC embedded implementations */
-static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
-                             uint32_t pid)
-{
-    ppcemb_tlb_t *tlb;
-    hwaddr raddr;
-    int i, ret;
-
-    /* Default return value is no match */
-    ret = -1;
-    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
-        tlb = &amp;env-&gt;tlb.tlbe[i];
-        if (ppcemb_tlb_check(env, tlb, &amp;raddr, address, pid, 0, i) == 0) {
-            ret = i;
-            break;
-        }
-    }
-
-    return ret;
-}
-#endif
-
-/* Helpers specific to PowerPC 40x implementations */
-static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
-{
-    ppcemb_tlb_t *tlb;
-    int i;
-
-    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
-        tlb = &amp;env-&gt;tlb.tlbe[i];
-        tlb-&gt;prot &amp;= ~PAGE_VALID;
-    }
-    tlb_flush(env_cpu(env));
-}
-
-static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
-                                       target_ulong address,
-                                       MMUAccessType access_type)
-{
-    ppcemb_tlb_t *tlb;
-    hwaddr raddr;
-    int i, ret, zsel, zpr, pr;
-
-    ret = -1;
-    raddr = (hwaddr)-1ULL;
-    pr = msr_pr;
-    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
-        tlb = &amp;env-&gt;tlb.tlbe[i];
-        if (ppcemb_tlb_check(env, tlb, &amp;raddr, address,
-                             env-&gt;spr[SPR_40x_PID], 0, i) &lt; 0) {
-            continue;
-        }
-        zsel = (tlb-&gt;attr &gt;&gt; 4) &amp; 0xF;
-        zpr = (env-&gt;spr[SPR_40x_ZPR] &gt;&gt; (30 - (2 * zsel))) &amp; 0x3;
-        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
-                    __func__, i, zsel, zpr, access_type, tlb-&gt;attr);
-        /* Check execute enable bit */
-        switch (zpr) {
-        case 0x2:
-            if (pr != 0) {
-                goto check_perms;
-            }
-            /* fall through */
-        case 0x3:
-            /* All accesses granted */
-            ctx-&gt;prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-            ret = 0;
-            break;
-        case 0x0:
-            if (pr != 0) {
-                /* Raise Zone protection fault.  */
-                env-&gt;spr[SPR_40x_ESR] = 1 &lt;&lt; 22;
-                ctx-&gt;prot = 0;
-                ret = -2;
-                break;
-            }
-            /* fall through */
-        case 0x1:
-        check_perms:
-            /* Check from TLB entry */
-            ctx-&gt;prot = tlb-&gt;prot;
-            ret = check_prot(ctx-&gt;prot, access_type);
-            if (ret == -2) {
-                env-&gt;spr[SPR_40x_ESR] = 0;
-            }
-            break;
-        }
-        if (ret &gt;= 0) {
-            ctx-&gt;raddr = raddr;
-            LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
-                      " %d %d\n", __func__, address, ctx-&gt;raddr, ctx-&gt;prot,
-                      ret);
-            return 0;
-        }
-    }
-    LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
-              " %d %d\n", __func__, address, raddr, ctx-&gt;prot, ret);
-
-    return ret;
-}
-
-void store_40x_sler(CPUPPCState *env, uint32_t val)
-{
-    /* XXX: TO BE FIXED */
-    if (val != 0x00000000) {
-        cpu_abort(env_cpu(env),
-                  "Little-endian regions are not supported by now\n");
-    }
-    env-&gt;spr[SPR_405_SLER] = val;
-}
-
-static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
-                              hwaddr *raddr, int *prot, target_ulong address,
-                              MMUAccessType access_type, int i)
-{
-    int prot2;
-
-    if (ppcemb_tlb_check(env, tlb, raddr, address,
-                         env-&gt;spr[SPR_BOOKE_PID],
-                         !env-&gt;nb_pids, i) &gt;= 0) {
-        goto found_tlb;
-    }
-
-    if (env-&gt;spr[SPR_BOOKE_PID1] &amp;&amp;
-        ppcemb_tlb_check(env, tlb, raddr, address,
-                         env-&gt;spr[SPR_BOOKE_PID1], 0, i) &gt;= 0) {
-        goto found_tlb;
-    }
-
-    if (env-&gt;spr[SPR_BOOKE_PID2] &amp;&amp;
-        ppcemb_tlb_check(env, tlb, raddr, address,
-                         env-&gt;spr[SPR_BOOKE_PID2], 0, i) &gt;= 0) {
-        goto found_tlb;
-    }
-
-    LOG_SWTLB("%s: TLB entry not found\n", __func__);
-    return -1;
-
-found_tlb:
-
-    if (msr_pr != 0) {
-        prot2 = tlb-&gt;prot &amp; 0xF;
-    } else {
-        prot2 = (tlb-&gt;prot &gt;&gt; 4) &amp; 0xF;
-    }
-
-    /* Check the address space */
-    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb-&gt;attr &amp; 1)) {
-        LOG_SWTLB("%s: AS doesn't match\n", __func__);
-        return -1;
-    }
-
-    *prot = prot2;
-    if (prot2 &amp; prot_for_access_type(access_type)) {
-        LOG_SWTLB("%s: good TLB!\n", __func__);
-        return 0;
-    }
-
-    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
-    return access_type == MMU_INST_FETCH ? -3 : -2;
-}
-
-static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
-                                         target_ulong address,
-                                         MMUAccessType access_type)
-{
-    ppcemb_tlb_t *tlb;
-    hwaddr raddr;
-    int i, ret;
-
-    ret = -1;
-    raddr = (hwaddr)-1ULL;
-    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
-        tlb = &amp;env-&gt;tlb.tlbe[i];
-        ret = mmubooke_check_tlb(env, tlb, &amp;raddr, &amp;ctx-&gt;prot, address,
-                                 access_type, i);
-        if (ret != -1) {
-            break;
-        }
-    }
-
-    if (ret &gt;= 0) {
-        ctx-&gt;raddr = raddr;
-        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
-                  " %d %d\n", __func__, address, ctx-&gt;raddr, ctx-&gt;prot,
-                  ret);
-    } else {
-        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
-                  " %d %d\n", __func__, address, raddr, ctx-&gt;prot, ret);
-    }
-
-    return ret;
-}
-
-#ifdef CONFIG_TCG
-static void booke206_flush_tlb(CPUPPCState *env, int flags,
-                               const int check_iprot)
-{
-    int tlb_size;
-    int i, j;
-    ppcmas_tlb_t *tlb = env-&gt;tlb.tlbm;
-
-    for (i = 0; i &lt; BOOKE206_MAX_TLBN; i++) {
-        if (flags &amp; (1 &lt;&lt; i)) {
-            tlb_size = booke206_tlb_size(env, i);
-            for (j = 0; j &lt; tlb_size; j++) {
-                if (!check_iprot || !(tlb[j].mas1 &amp; MAS1_IPROT)) {
-                    tlb[j].mas1 &amp;= ~MAS1_VALID;
-                }
-            }
-        }
-        tlb += booke206_tlb_size(env, i);
-    }
-
-    tlb_flush(env_cpu(env));
-}
-#endif
-
-static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
-                                        ppcmas_tlb_t *tlb)
-{
-    int tlbm_size;
-
-    tlbm_size = (tlb-&gt;mas1 &amp; MAS1_TSIZE_MASK) &gt;&gt; MAS1_TSIZE_SHIFT;
-
-    return 1024ULL &lt;&lt; tlbm_size;
-}
-
-/* TLB check function for MAS based SoftTLBs */
-static int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
-                            hwaddr *raddrp, target_ulong address,
-                            uint32_t pid)
-{
-    hwaddr mask;
-    uint32_t tlb_pid;
-
-    if (!msr_cm) {
-        /* In 32bit mode we can only address 32bit EAs */
-        address = (uint32_t)address;
-    }
-
-    /* Check valid flag */
-    if (!(tlb-&gt;mas1 &amp; MAS1_VALID)) {
-        return -1;
-    }
-
-    mask = ~(booke206_tlb_to_page_size(env, tlb) - 1);
-    LOG_SWTLB("%s: TLB ADDR=0x" TARGET_FMT_lx " PID=0x%x MAS1=0x%x MAS2=0x%"
-              PRIx64 " mask=0x%" HWADDR_PRIx " MAS7_3=0x%" PRIx64 " MAS8=0x%"
-              PRIx32 "\n", __func__, address, pid, tlb-&gt;mas1, tlb-&gt;mas2, mask,
-              tlb-&gt;mas7_3, tlb-&gt;mas8);
-
-    /* Check PID */
-    tlb_pid = (tlb-&gt;mas1 &amp; MAS1_TID_MASK) &gt;&gt; MAS1_TID_SHIFT;
-    if (tlb_pid != 0 &amp;&amp; tlb_pid != pid) {
-        return -1;
-    }
-
-    /* Check effective address */
-    if ((address &amp; mask) != (tlb-&gt;mas2 &amp; MAS2_EPN_MASK)) {
-        return -1;
-    }
-
-    if (raddrp) {
-        *raddrp = (tlb-&gt;mas7_3 &amp; mask) | (address &amp; ~mask);
-    }
-
-    return 0;
-}
-
-static bool is_epid_mmu(int mmu_idx)
-{
-    return mmu_idx == PPC_TLB_EPID_STORE || mmu_idx == PPC_TLB_EPID_LOAD;
-}
-
-static uint32_t mmubooke206_esr(int mmu_idx, MMUAccessType access_type)
-{
-    uint32_t esr = 0;
-    if (access_type == MMU_DATA_STORE) {
-        esr |= ESR_ST;
-    }
-    if (is_epid_mmu(mmu_idx)) {
-        esr |= ESR_EPID;
-    }
-    return esr;
-}
-
-/*
- * Get EPID register given the mmu_idx. If this is regular load,
- * construct the EPID access bits from current processor state
- *
- * Get the effective AS and PR bits and the PID. The PID is returned
- * only if EPID load is requested, otherwise the caller must detect
- * the correct EPID.  Return true if valid EPID is returned.
- */
-static bool mmubooke206_get_as(CPUPPCState *env,
-                               int mmu_idx, uint32_t *epid_out,
-                               bool *as_out, bool *pr_out)
-{
-    if (is_epid_mmu(mmu_idx)) {
-        uint32_t epidr;
-        if (mmu_idx == PPC_TLB_EPID_STORE) {
-            epidr = env-&gt;spr[SPR_BOOKE_EPSC];
-        } else {
-            epidr = env-&gt;spr[SPR_BOOKE_EPLC];
-        }
-        *epid_out = (epidr &amp; EPID_EPID) &gt;&gt; EPID_EPID_SHIFT;
-        *as_out = !!(epidr &amp; EPID_EAS);
-        *pr_out = !!(epidr &amp; EPID_EPR);
-        return true;
-    } else {
-        *as_out = msr_ds;
-        *pr_out = msr_pr;
-        return false;
-    }
-}
-
-/* Check if the tlb found by hashing really matches */
-static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
-                                 hwaddr *raddr, int *prot,
-                                 target_ulong address,
-                                 MMUAccessType access_type, int mmu_idx)
-{
-    int prot2 = 0;
-    uint32_t epid;
-    bool as, pr;
-    bool use_epid = mmubooke206_get_as(env, mmu_idx, &amp;epid, &amp;as, &amp;pr);
-
-    if (!use_epid) {
-        if (ppcmas_tlb_check(env, tlb, raddr, address,
-                             env-&gt;spr[SPR_BOOKE_PID]) &gt;= 0) {
-            goto found_tlb;
-        }
-
-        if (env-&gt;spr[SPR_BOOKE_PID1] &amp;&amp;
-            ppcmas_tlb_check(env, tlb, raddr, address,
-                             env-&gt;spr[SPR_BOOKE_PID1]) &gt;= 0) {
-            goto found_tlb;
-        }
-
-        if (env-&gt;spr[SPR_BOOKE_PID2] &amp;&amp;
-            ppcmas_tlb_check(env, tlb, raddr, address,
-                             env-&gt;spr[SPR_BOOKE_PID2]) &gt;= 0) {
-            goto found_tlb;
-        }
-    } else {
-        if (ppcmas_tlb_check(env, tlb, raddr, address, epid) &gt;= 0) {
-            goto found_tlb;
-        }
-    }
-
-    LOG_SWTLB("%s: TLB entry not found\n", __func__);
-    return -1;
-
-found_tlb:
-
-    if (pr) {
-        if (tlb-&gt;mas7_3 &amp; MAS3_UR) {
-            prot2 |= PAGE_READ;
-        }
-        if (tlb-&gt;mas7_3 &amp; MAS3_UW) {
-            prot2 |= PAGE_WRITE;
-        }
-        if (tlb-&gt;mas7_3 &amp; MAS3_UX) {
-            prot2 |= PAGE_EXEC;
-        }
-    } else {
-        if (tlb-&gt;mas7_3 &amp; MAS3_SR) {
-            prot2 |= PAGE_READ;
-        }
-        if (tlb-&gt;mas7_3 &amp; MAS3_SW) {
-            prot2 |= PAGE_WRITE;
-        }
-        if (tlb-&gt;mas7_3 &amp; MAS3_SX) {
-            prot2 |= PAGE_EXEC;
-        }
-    }
-
-    /* Check the address space and permissions */
-    if (access_type == MMU_INST_FETCH) {
-        /* There is no way to fetch code using epid load */
-        assert(!use_epid);
-        as = msr_ir;
-    }
-
-    if (as != ((tlb-&gt;mas1 &amp; MAS1_TS) &gt;&gt; MAS1_TS_SHIFT)) {
-        LOG_SWTLB("%s: AS doesn't match\n", __func__);
-        return -1;
-    }
-
-    *prot = prot2;
-    if (prot2 &amp; prot_for_access_type(access_type)) {
-        LOG_SWTLB("%s: good TLB!\n", __func__);
-        return 0;
-    }
-
-    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
-    return access_type == MMU_INST_FETCH ? -3 : -2;
-}
-
-static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
-                                            target_ulong address,
-                                            MMUAccessType access_type,
-                                            int mmu_idx)
-{
-    ppcmas_tlb_t *tlb;
-    hwaddr raddr;
-    int i, j, ret;
-
-    ret = -1;
-    raddr = (hwaddr)-1ULL;
-
-    for (i = 0; i &lt; BOOKE206_MAX_TLBN; i++) {
-        int ways = booke206_tlb_ways(env, i);
-
-        for (j = 0; j &lt; ways; j++) {
-            tlb = booke206_get_tlbm(env, i, address, j);
-            if (!tlb) {
-                continue;
-            }
-            ret = mmubooke206_check_tlb(env, tlb, &amp;raddr, &amp;ctx-&gt;prot, address,
-                                        access_type, mmu_idx);
-            if (ret != -1) {
-                goto found_tlb;
-            }
-        }
-    }
-
-found_tlb:
-
-    if (ret &gt;= 0) {
-        ctx-&gt;raddr = raddr;
-        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
-                  " %d %d\n", __func__, address, ctx-&gt;raddr, ctx-&gt;prot,
-                  ret);
-    } else {
-        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =&gt; " TARGET_FMT_plx
-                  " %d %d\n", __func__, address, raddr, ctx-&gt;prot, ret);
-    }
-
-    return ret;
-}
-
-static const char *book3e_tsize_to_str[32] = {
-    "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K",
-    "1M", "2M", "4M", "8M", "16M", "32M", "64M", "128M", "256M", "512M",
-    "1G", "2G", "4G", "8G", "16G", "32G", "64G", "128G", "256G", "512G",
-    "1T", "2T"
-};
-
-static void mmubooke_dump_mmu(CPUPPCState *env)
-{
-    ppcemb_tlb_t *entry;
-    int i;
-
-    if (kvm_enabled() &amp;&amp; !env-&gt;kvm_sw_tlb) {
-        qemu_printf("Cannot access KVM TLB\n");
-        return;
-    }
-
-    qemu_printf("\nTLB:\n");
-    qemu_printf("Effective          Physical           Size PID   Prot     "
-                "Attr\n");
-
-    entry = &amp;env-&gt;tlb.tlbe[0];
-    for (i = 0; i &lt; env-&gt;nb_tlb; i++, entry++) {
-        hwaddr ea, pa;
-        target_ulong mask;
-        uint64_t size = (uint64_t)entry-&gt;size;
-        char size_buf[20];
-
-        /* Check valid flag */
-        if (!(entry-&gt;prot &amp; PAGE_VALID)) {
-            continue;
-        }
-
-        mask = ~(entry-&gt;size - 1);
-        ea = entry-&gt;EPN &amp; mask;
-        pa = entry-&gt;RPN &amp; mask;
-        /* Extend the physical address to 36 bits */
-        pa |= (hwaddr)(entry-&gt;RPN &amp; 0xF) &lt;&lt; 32;
-        if (size &gt;= 1 * MiB) {
-            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size / MiB);
-        } else {
-            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size / KiB);
-        }
-        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x\n",
-                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entry-&gt;PID,
-                    entry-&gt;prot, entry-&gt;attr);
-    }
-
-}
-
-static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int offset,
-                                     int tlbsize)
-{
-    ppcmas_tlb_t *entry;
-    int i;
-
-    qemu_printf("\nTLB%d:\n", tlbn);
-    qemu_printf("Effective          Physical           Size TID   TS SRWX"
-                " URWX WIMGE U0123\n");
-
-    entry = &amp;env-&gt;tlb.tlbm[offset];
-    for (i = 0; i &lt; tlbsize; i++, entry++) {
-        hwaddr ea, pa, size;
-        int tsize;
-
-        if (!(entry-&gt;mas1 &amp; MAS1_VALID)) {
-            continue;
-        }
-
-        tsize = (entry-&gt;mas1 &amp; MAS1_TSIZE_MASK) &gt;&gt; MAS1_TSIZE_SHIFT;
-        size = 1024ULL &lt;&lt; tsize;
-        ea = entry-&gt;mas2 &amp; ~(size - 1);
-        pa = entry-&gt;mas7_3 &amp; ~(size - 1);
-
-        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c%c%c"
-                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
-                    (uint64_t)ea, (uint64_t)pa,
-                    book3e_tsize_to_str[tsize],
-                    (entry-&gt;mas1 &amp; MAS1_TID_MASK) &gt;&gt; MAS1_TID_SHIFT,
-                    (entry-&gt;mas1 &amp; MAS1_TS) &gt;&gt; MAS1_TS_SHIFT,
-                    entry-&gt;mas7_3 &amp; MAS3_SR ? 'R' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_SW ? 'W' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_SX ? 'X' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_UR ? 'R' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_UW ? 'W' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_UX ? 'X' : '-',
-                    entry-&gt;mas2 &amp; MAS2_W ? 'W' : '-',
-                    entry-&gt;mas2 &amp; MAS2_I ? 'I' : '-',
-                    entry-&gt;mas2 &amp; MAS2_M ? 'M' : '-',
-                    entry-&gt;mas2 &amp; MAS2_G ? 'G' : '-',
-                    entry-&gt;mas2 &amp; MAS2_E ? 'E' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_U0 ? '0' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_U1 ? '1' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_U2 ? '2' : '-',
-                    entry-&gt;mas7_3 &amp; MAS3_U3 ? '3' : '-');
-    }
-}
-
-static void mmubooke206_dump_mmu(CPUPPCState *env)
-{
-    int offset = 0;
-    int i;
-
-    if (kvm_enabled() &amp;&amp; !env-&gt;kvm_sw_tlb) {
-        qemu_printf("Cannot access KVM TLB\n");
-        return;
-    }
+/* #define DEBUG_BATS */
+/* #define DEBUG_SOFTWARE_TLB */
+/* #define DUMP_PAGE_TABLES */
+/* #define FLUSH_ALL_TLBS */
 
-    for (i = 0; i &lt; BOOKE206_MAX_TLBN; i++) {
-        int size = booke206_tlb_size(env, i);
+#ifdef DEBUG_SOFTWARE_TLB
+#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
+#else
+#  define LOG_SWTLB(...) do { } while (0)
+#endif
 
-        if (size == 0) {
-            continue;
-        }
+#ifdef DEBUG_BATS
+#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
+#else
+#  define LOG_BATS(...) do { } while (0)
+#endif
 
-        mmubooke206_dump_one_tlb(env, i, offset, size);
-        offset += size;
-    }
-}
+/*****************************************************************************/
+/* PowerPC MMU emulation */
 
-static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
+/* Software driven TLB helpers */
+static inline void ppc6xx_tlb_invalidate_all(CPUPPCState *env)
 {
-    target_ulong *BATlt, *BATut, *BATu, *BATl;
-    target_ulong BEPIl, BEPIu, bl;
-    int i;
+    ppc6xx_tlb_t *tlb;
+    int nr, max;
 
-    switch (type) {
-    case ACCESS_CODE:
-        BATlt = env-&gt;IBAT[1];
-        BATut = env-&gt;IBAT[0];
-        break;
-    default:
-        BATlt = env-&gt;DBAT[1];
-        BATut = env-&gt;DBAT[0];
-        break;
+    /* LOG_SWTLB("Invalidate all TLBs\n"); */
+    /* Invalidate all defined software TLB */
+    max = env-&gt;nb_tlb;
+    if (env-&gt;id_tlbs == 1) {
+        max *= 2;
     }
-
-    for (i = 0; i &lt; env-&gt;nb_BATs; i++) {
-        BATu = &amp;BATut[i];
-        BATl = &amp;BATlt[i];
-        BEPIu = *BATu &amp; 0xF0000000;
-        BEPIl = *BATu &amp; 0x0FFE0000;
-        bl = (*BATu &amp; 0x00001FFC) &lt;&lt; 15;
-        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
-                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
-                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
-                    type == ACCESS_CODE ? "code" : "data", i,
-                    *BATu, *BATl, BEPIu, BEPIl, bl);
+    for (nr = 0; nr &lt; max; nr++) {
+        tlb = &amp;env-&gt;tlb.tlb6[nr];
+        pte_invalidate(&amp;tlb-&gt;pte0);
     }
+    tlb_flush(env_cpu(env));
 }
 
-static void mmu6xx_dump_mmu(CPUPPCState *env)
+static inline void ppc6xx_tlb_invalidate_virt2(CPUPPCState *env,
+                                               target_ulong eaddr,
+                                               int is_code, int match_epn)
 {
-    PowerPCCPU *cpu = env_archcpu(env);
+#if !defined(FLUSH_ALL_TLBS)
+    CPUState *cs = env_cpu(env);
     ppc6xx_tlb_t *tlb;
-    target_ulong sr;
-    int type, way, entry, i;
-
-    qemu_printf("HTAB base = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(cpu));
-    qemu_printf("HTAB mask = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(cpu));
-
-    qemu_printf("\nSegment registers:\n");
-    for (i = 0; i &lt; 32; i++) {
-        sr = env-&gt;sr[i];
-        if (sr &amp; 0x80000000) {
-            qemu_printf("%02d T=%d Ks=%d Kp=%d BUID=0x%03x "
-                        "CNTLR_SPEC=0x%05x\n", i,
-                        sr &amp; 0x80000000 ? 1 : 0, sr &amp; 0x40000000 ? 1 : 0,
-                        sr &amp; 0x20000000 ? 1 : 0, (uint32_t)((sr &gt;&gt; 20) &amp; 0x1FF),
-                        (uint32_t)(sr &amp; 0xFFFFF));
-        } else {
-            qemu_printf("%02d T=%d Ks=%d Kp=%d N=%d VSID=0x%06x\n", i,
-                        sr &amp; 0x80000000 ? 1 : 0, sr &amp; 0x40000000 ? 1 : 0,
-                        sr &amp; 0x20000000 ? 1 : 0, sr &amp; 0x10000000 ? 1 : 0,
-                        (uint32_t)(sr &amp; 0x00FFFFFF));
-        }
-    }
-
-    qemu_printf("\nBATs:\n");
-    mmu6xx_dump_BATs(env, ACCESS_INT);
-    mmu6xx_dump_BATs(env, ACCESS_CODE);
-
-    if (env-&gt;id_tlbs != 1) {
-        qemu_printf("ERROR: 6xx MMU should have separated TLB"
-                    " for code and data\n");
-    }
+    int way, nr;
 
-    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
-
-    for (type = 0; type &lt; 2; type++) {
-        for (way = 0; way &lt; env-&gt;nb_ways; way++) {
-            for (entry = env-&gt;nb_tlb * type + env-&gt;tlb_per_way * way;
-                 entry &lt; (env-&gt;nb_tlb * type + env-&gt;tlb_per_way * (way + 1));
-                 entry++) {
-
-                tlb = &amp;env-&gt;tlb.tlb6[entry];
-                qemu_printf("%s TLB %02d/%02d way:%d %s ["
-                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
-                            type ? "code" : "data", entry % env-&gt;nb_tlb,
-                            env-&gt;nb_tlb, way,
-                            pte_is_valid(tlb-&gt;pte0) ? "valid" : "inval",
-                            tlb-&gt;EPN, tlb-&gt;EPN + TARGET_PAGE_SIZE);
-            }
+    /* Invalidate ITLB + DTLB, all ways */
+    for (way = 0; way &lt; env-&gt;nb_ways; way++) {
+        nr = ppc6xx_tlb_getnum(env, eaddr, way, is_code);
+        tlb = &amp;env-&gt;tlb.tlb6[nr];
+        if (pte_is_valid(tlb-&gt;pte0) &amp;&amp; (match_epn == 0 || eaddr == tlb-&gt;EPN)) {
+            LOG_SWTLB("TLB invalidate %d/%d " TARGET_FMT_lx "\n", nr,
+                      env-&gt;nb_tlb, eaddr);
+            pte_invalidate(&amp;tlb-&gt;pte0);
+            tlb_flush_page(cs, tlb-&gt;EPN);
         }
     }
-}
-
-void dump_mmu(CPUPPCState *env)
-{
-    switch (env-&gt;mmu_model) {
-    case POWERPC_MMU_BOOKE:
-        mmubooke_dump_mmu(env);
-        break;
-    case POWERPC_MMU_BOOKE206:
-        mmubooke206_dump_mmu(env);
-        break;
-    case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
-        mmu6xx_dump_mmu(env);
-        break;
-#if defined(TARGET_PPC64)
-    case POWERPC_MMU_64B:
-    case POWERPC_MMU_2_03:
-    case POWERPC_MMU_2_06:
-    case POWERPC_MMU_2_07:
-        dump_slb(env_archcpu(env));
-        break;
-    case POWERPC_MMU_3_00:
-        if (ppc64_v3_radix(env_archcpu(env))) {
-            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n",
-                          __func__);
-        } else {
-            dump_slb(env_archcpu(env));
-        }
-        break;
+#else
+    /* XXX: PowerPC specification say this is valid as well */
+    ppc6xx_tlb_invalidate_all(env);
 #endif
-    default:
-        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
-    }
 }
 
-static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
-                          MMUAccessType access_type)
+static inline void ppc6xx_tlb_invalidate_virt(CPUPPCState *env,
+                                              target_ulong eaddr, int is_code)
 {
-    int in_plb, ret;
-
-    ctx-&gt;raddr = eaddr;
-    ctx-&gt;prot = PAGE_READ | PAGE_EXEC;
-    ret = 0;
-    switch (env-&gt;mmu_model) {
-    case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
-    case POWERPC_MMU_SOFT_4xx:
-    case POWERPC_MMU_REAL:
-    case POWERPC_MMU_BOOKE:
-        ctx-&gt;prot |= PAGE_WRITE;
-        break;
-
-    case POWERPC_MMU_SOFT_4xx_Z:
-        if (unlikely(msr_pe != 0)) {
-            /*
-             * 403 family add some particular protections, using
-             * PBL/PBU registers for accesses with no translation.
-             */
-            in_plb =
-                /* Check PLB validity */
-                (env-&gt;pb[0] &lt; env-&gt;pb[1] &amp;&amp;
-                 /* and address in plb area */
-                 eaddr &gt;= env-&gt;pb[0] &amp;&amp; eaddr &lt; env-&gt;pb[1]) ||
-                (env-&gt;pb[2] &lt; env-&gt;pb[3] &amp;&amp;
-                 eaddr &gt;= env-&gt;pb[2] &amp;&amp; eaddr &lt; env-&gt;pb[3]) ? 1 : 0;
-            if (in_plb ^ msr_px) {
-                /* Access in protected area */
-                if (access_type == MMU_DATA_STORE) {
-                    /* Access is not allowed */
-                    ret = -2;
-                }
-            } else {
-                /* Read-write access is allowed */
-                ctx-&gt;prot |= PAGE_WRITE;
-            }
-        }
-        break;
-
-    default:
-        /* Caller's checks mean we should never get here for other models */
-        abort();
-        return -1;
-    }
-
-    return ret;
+    ppc6xx_tlb_invalidate_virt2(env, eaddr, is_code, 0);
 }
 
-static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
-                                     target_ulong eaddr,
-                                     MMUAccessType access_type, int type,
-                                     int mmu_idx)
+static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
+                             int is_code, target_ulong pte0, target_ulong pte1)
 {
-    int ret = -1;
-    bool real_mode = (type == ACCESS_CODE &amp;&amp; msr_ir == 0)
-        || (type != ACCESS_CODE &amp;&amp; msr_dr == 0);
-
-    switch (env-&gt;mmu_model) {
-    case POWERPC_MMU_SOFT_6xx:
-    case POWERPC_MMU_SOFT_74xx:
-        if (real_mode) {
-            ret = check_physical(env, ctx, eaddr, access_type);
-        } else {
-            /* Try to find a BAT */
-            if (env-&gt;nb_BATs != 0) {
-                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type);
-            }
-            if (ret &lt; 0) {
-                /* We didn't match any BAT entry or don't have BATs */
-                ret = get_segment_6xx_tlb(env, ctx, eaddr, access_type, type);
-            }
-        }
-        break;
-
-    case POWERPC_MMU_SOFT_4xx:
-    case POWERPC_MMU_SOFT_4xx_Z:
-        if (real_mode) {
-            ret = check_physical(env, ctx, eaddr, access_type);
-        } else {
-            ret = mmu40x_get_physical_address(env, ctx, eaddr, access_type);
-        }
-        break;
-    case POWERPC_MMU_BOOKE:
-        ret = mmubooke_get_physical_address(env, ctx, eaddr, access_type);
-        break;
-    case POWERPC_MMU_BOOKE206:
-        ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
-                                               mmu_idx);
-        break;
-    case POWERPC_MMU_MPC8xx:
-        /* XXX: TODO */
-        cpu_abort(env_cpu(env), "MPC8xx MMU model is not implemented\n");
-        break;
-    case POWERPC_MMU_REAL:
-        if (real_mode) {
-            ret = check_physical(env, ctx, eaddr, access_type);
-        } else {
-            cpu_abort(env_cpu(env),
-                      "PowerPC in real mode do not do any translation\n");
-        }
-        return -1;
-    default:
-        cpu_abort(env_cpu(env), "Unknown or invalid MMU model\n");
-        return -1;
-    }
-
-    return ret;
-}
+    ppc6xx_tlb_t *tlb;
+    int nr;
 
-#ifdef CONFIG_TCG
-static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
-                                target_ulong eaddr, MMUAccessType access_type,
-                                int type)
-{
-    return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
+    nr = ppc6xx_tlb_getnum(env, EPN, way, is_code);
+    tlb = &amp;env-&gt;tlb.tlb6[nr];
+    LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
+              " PTE1 " TARGET_FMT_lx "\n", nr, env-&gt;nb_tlb, EPN, pte0, pte1);
+    /* Invalidate any pending reference in QEMU for this virtual address */
+    ppc6xx_tlb_invalidate_virt2(env, EPN, is_code, 1);
+    tlb-&gt;pte0 = pte0;
+    tlb-&gt;pte1 = pte1;
+    tlb-&gt;EPN = EPN;
+    /* Store last way for LRU mechanism */
+    env-&gt;last_way = way;
 }
-#endif
 
-hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+/* Generic TLB search function for PowerPC embedded implementations */
+static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
+                             uint32_t pid)
 {
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
+    ppcemb_tlb_t *tlb;
+    hwaddr raddr;
+    int i, ret;
 
-        /*
-         * Some MMUs have separate TLBs for code and data. If we only
-         * try an ACCESS_INT, we may not be able to read instructions
-         * mapped by code TLBs, so we also try a ACCESS_CODE.
-         */
-        if (unlikely(get_physical_address(env, &amp;ctx, addr, MMU_INST_FETCH,
-                                          ACCESS_CODE) != 0)) {
-            return -1;
+    /* Default return value is no match */
+    ret = -1;
+    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
+        tlb = &amp;env-&gt;tlb.tlbe[i];
+        if (ppcemb_tlb_check(env, tlb, &amp;raddr, address, pid, 0, i) == 0) {
+            ret = i;
+            break;
         }
     }
 
-    return ctx.raddr &amp; TARGET_PAGE_MASK;
+    return ret;
 }
 
-static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
-                                         MMUAccessType access_type, int mmu_idx)
+/* Helpers specific to PowerPC 40x implementations */
+static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
 {
-    uint32_t epid;
-    bool as, pr;
-    uint32_t missed_tid = 0;
-    bool use_epid = mmubooke206_get_as(env, mmu_idx, &amp;epid, &amp;as, &amp;pr);
-
-    if (access_type == MMU_INST_FETCH) {
-        as = msr_ir;
-    }
-    env-&gt;spr[SPR_BOOKE_MAS0] = env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_TLBSELD_MASK;
-    env-&gt;spr[SPR_BOOKE_MAS1] = env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_TSIZED_MASK;
-    env-&gt;spr[SPR_BOOKE_MAS2] = env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_WIMGED_MASK;
-    env-&gt;spr[SPR_BOOKE_MAS3] = 0;
-    env-&gt;spr[SPR_BOOKE_MAS6] = 0;
-    env-&gt;spr[SPR_BOOKE_MAS7] = 0;
-
-    /* AS */
-    if (as) {
-        env-&gt;spr[SPR_BOOKE_MAS1] |= MAS1_TS;
-        env-&gt;spr[SPR_BOOKE_MAS6] |= MAS6_SAS;
-    }
-
-    env-&gt;spr[SPR_BOOKE_MAS1] |= MAS1_VALID;
-    env-&gt;spr[SPR_BOOKE_MAS2] |= address &amp; MAS2_EPN_MASK;
+    ppcemb_tlb_t *tlb;
+    int i;
 
-    if (!use_epid) {
-        switch (env-&gt;spr[SPR_BOOKE_MAS4] &amp; MAS4_TIDSELD_PIDZ) {
-        case MAS4_TIDSELD_PID0:
-            missed_tid = env-&gt;spr[SPR_BOOKE_PID];
-            break;
-        case MAS4_TIDSELD_PID1:
-            missed_tid = env-&gt;spr[SPR_BOOKE_PID1];
-            break;
-        case MAS4_TIDSELD_PID2:
-            missed_tid = env-&gt;spr[SPR_BOOKE_PID2];
-            break;
-        }
-        env-&gt;spr[SPR_BOOKE_MAS6] |= env-&gt;spr[SPR_BOOKE_PID] &lt;&lt; 16;
-    } else {
-        missed_tid = epid;
-        env-&gt;spr[SPR_BOOKE_MAS6] |= missed_tid &lt;&lt; 16;
+    for (i = 0; i &lt; env-&gt;nb_tlb; i++) {
+        tlb = &amp;env-&gt;tlb.tlbe[i];
+        tlb-&gt;prot &amp;= ~PAGE_VALID;
     }
-    env-&gt;spr[SPR_BOOKE_MAS1] |= (missed_tid &lt;&lt; MAS1_TID_SHIFT);
-
-
-    /* next victim logic */
-    env-&gt;spr[SPR_BOOKE_MAS0] |= env-&gt;last_way &lt;&lt; MAS0_ESEL_SHIFT;
-    env-&gt;last_way++;
-    env-&gt;last_way &amp;= booke206_tlb_ways(env, 0) - 1;
-    env-&gt;spr[SPR_BOOKE_MAS0] |= env-&gt;last_way &lt;&lt; MAS0_NV_SHIFT;
+    tlb_flush(env_cpu(env));
 }
 
-/* Perform address translation */
-static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
-                                    MMUAccessType access_type, int mmu_idx)
+static void booke206_flush_tlb(CPUPPCState *env, int flags,
+                               const int check_iprot)
 {
-    CPUState *cs = env_cpu(env);
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    mmu_ctx_t ctx;
-    int type;
-    int ret = 0;
+    int tlb_size;
+    int i, j;
+    ppcmas_tlb_t *tlb = env-&gt;tlb.tlbm;
 
-    if (access_type == MMU_INST_FETCH) {
-        /* code access */
-        type = ACCESS_CODE;
-    } else {
-        /* data access */
-        type = env-&gt;access_type;
-    }
-    ret = get_physical_address_wtlb(env, &amp;ctx, address, access_type,
-                                    type, mmu_idx);
-    if (ret == 0) {
-        tlb_set_page(cs, address &amp; TARGET_PAGE_MASK,
-                     ctx.raddr &amp; TARGET_PAGE_MASK, ctx.prot,
-                     mmu_idx, TARGET_PAGE_SIZE);
-        ret = 0;
-    } else if (ret &lt; 0) {
-        LOG_MMU_STATE(cs);
-        if (type == ACCESS_CODE) {
-            switch (ret) {
-            case -1:
-                /* No matches in page tables or TLB */
-                switch (env-&gt;mmu_model) {
-                case POWERPC_MMU_SOFT_6xx:
-                    cs-&gt;exception_index = POWERPC_EXCP_IFTLB;
-                    env-&gt;error_code = 1 &lt;&lt; 18;
-                    env-&gt;spr[SPR_IMISS] = address;
-                    env-&gt;spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
-                    goto tlb_miss;
-                case POWERPC_MMU_SOFT_74xx:
-                    cs-&gt;exception_index = POWERPC_EXCP_IFTLB;
-                    goto tlb_miss_74xx;
-                case POWERPC_MMU_SOFT_4xx:
-                case POWERPC_MMU_SOFT_4xx_Z:
-                    cs-&gt;exception_index = POWERPC_EXCP_ITLB;
-                    env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_40x_DEAR] = address;
-                    env-&gt;spr[SPR_40x_ESR] = 0x00000000;
-                    break;
-                case POWERPC_MMU_BOOKE206:
-                    booke206_update_mas_tlb_miss(env, address, 2, mmu_idx);
-                    /* fall through */
-                case POWERPC_MMU_BOOKE:
-                    cs-&gt;exception_index = POWERPC_EXCP_ITLB;
-                    env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
-                    env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
-                    return -1;
-                case POWERPC_MMU_MPC8xx:
-                    /* XXX: TODO */
-                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
-                    break;
-                case POWERPC_MMU_REAL:
-                    cpu_abort(cs, "PowerPC in real mode should never raise "
-                              "any MMU exceptions\n");
-                    return -1;
-                default:
-                    cpu_abort(cs, "Unknown or invalid MMU model\n");
-                    return -1;
-                }
-                break;
-            case -2:
-                /* Access rights violation */
-                cs-&gt;exception_index = POWERPC_EXCP_ISI;
-                env-&gt;error_code = 0x08000000;
-                break;
-            case -3:
-                /* No execute protection violation */
-                if ((env-&gt;mmu_model == POWERPC_MMU_BOOKE) ||
-                    (env-&gt;mmu_model == POWERPC_MMU_BOOKE206)) {
-                    env-&gt;spr[SPR_BOOKE_ESR] = 0x00000000;
-                }
-                cs-&gt;exception_index = POWERPC_EXCP_ISI;
-                env-&gt;error_code = 0x10000000;
-                break;
-            case -4:
-                /* Direct store exception */
-                /* No code fetch is allowed in direct-store areas */
-                cs-&gt;exception_index = POWERPC_EXCP_ISI;
-                env-&gt;error_code = 0x10000000;
-                break;
-            }
-        } else {
-            switch (ret) {
-            case -1:
-                /* No matches in page tables or TLB */
-                switch (env-&gt;mmu_model) {
-                case POWERPC_MMU_SOFT_6xx:
-                    if (access_type == MMU_DATA_STORE) {
-                        cs-&gt;exception_index = POWERPC_EXCP_DSTLB;
-                        env-&gt;error_code = 1 &lt;&lt; 16;
-                    } else {
-                        cs-&gt;exception_index = POWERPC_EXCP_DLTLB;
-                        env-&gt;error_code = 0;
-                    }
-                    env-&gt;spr[SPR_DMISS] = address;
-                    env-&gt;spr[SPR_DCMP] = 0x80000000 | ctx.ptem;
-                tlb_miss:
-                    env-&gt;error_code |= ctx.key &lt;&lt; 19;
-                    env-&gt;spr[SPR_HASH1] = ppc_hash32_hpt_base(cpu) +
-                        get_pteg_offset32(cpu, ctx.hash[0]);
-                    env-&gt;spr[SPR_HASH2] = ppc_hash32_hpt_base(cpu) +
-                        get_pteg_offset32(cpu, ctx.hash[1]);
-                    break;
-                case POWERPC_MMU_SOFT_74xx:
-                    if (access_type == MMU_DATA_STORE) {
-                        cs-&gt;exception_index = POWERPC_EXCP_DSTLB;
-                    } else {
-                        cs-&gt;exception_index = POWERPC_EXCP_DLTLB;
-                    }
-                tlb_miss_74xx:
-                    /* Implement LRU algorithm */
-                    env-&gt;error_code = ctx.key &lt;&lt; 19;
-                    env-&gt;spr[SPR_TLBMISS] = (address &amp; ~((target_ulong)0x3)) |
-                        ((env-&gt;last_way + 1) &amp; (env-&gt;nb_ways - 1));
-                    env-&gt;spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
-                    break;
-                case POWERPC_MMU_SOFT_4xx:
-                case POWERPC_MMU_SOFT_4xx_Z:
-                    cs-&gt;exception_index = POWERPC_EXCP_DTLB;
-                    env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_40x_DEAR] = address;
-                    if (access_type == MMU_DATA_STORE) {
-                        env-&gt;spr[SPR_40x_ESR] = 0x00800000;
-                    } else {
-                        env-&gt;spr[SPR_40x_ESR] = 0x00000000;
-                    }
-                    break;
-                case POWERPC_MMU_MPC8xx:
-                    /* XXX: TODO */
-                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
-                    break;
-                case POWERPC_MMU_BOOKE206:
-                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
-                    /* fall through */
-                case POWERPC_MMU_BOOKE:
-                    cs-&gt;exception_index = POWERPC_EXCP_DTLB;
-                    env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
-                    env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
-                    return -1;
-                case POWERPC_MMU_REAL:
-                    cpu_abort(cs, "PowerPC in real mode should never raise "
-                              "any MMU exceptions\n");
-                    return -1;
-                default:
-                    cpu_abort(cs, "Unknown or invalid MMU model\n");
-                    return -1;
-                }
-                break;
-            case -2:
-                /* Access rights violation */
-                cs-&gt;exception_index = POWERPC_EXCP_DSI;
-                env-&gt;error_code = 0;
-                if (env-&gt;mmu_model == POWERPC_MMU_SOFT_4xx
-                    || env-&gt;mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
-                    env-&gt;spr[SPR_40x_DEAR] = address;
-                    if (access_type == MMU_DATA_STORE) {
-                        env-&gt;spr[SPR_40x_ESR] |= 0x00800000;
-                    }
-                } else if ((env-&gt;mmu_model == POWERPC_MMU_BOOKE) ||
-                           (env-&gt;mmu_model == POWERPC_MMU_BOOKE206)) {
-                    env-&gt;spr[SPR_BOOKE_DEAR] = address;
-                    env-&gt;spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
-                } else {
-                    env-&gt;spr[SPR_DAR] = address;
-                    if (access_type == MMU_DATA_STORE) {
-                        env-&gt;spr[SPR_DSISR] = 0x0A000000;
-                    } else {
-                        env-&gt;spr[SPR_DSISR] = 0x08000000;
-                    }
-                }
-                break;
-            case -4:
-                /* Direct store exception */
-                switch (type) {
-                case ACCESS_FLOAT:
-                    /* Floating point load/store */
-                    cs-&gt;exception_index = POWERPC_EXCP_ALIGN;
-                    env-&gt;error_code = POWERPC_EXCP_ALIGN_FP;
-                    env-&gt;spr[SPR_DAR] = address;
-                    break;
-                case ACCESS_RES:
-                    /* lwarx, ldarx or stwcx. */
-                    cs-&gt;exception_index = POWERPC_EXCP_DSI;
-                    env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_DAR] = address;
-                    if (access_type == MMU_DATA_STORE) {
-                        env-&gt;spr[SPR_DSISR] = 0x06000000;
-                    } else {
-                        env-&gt;spr[SPR_DSISR] = 0x04000000;
-                    }
-                    break;
-                case ACCESS_EXT:
-                    /* eciwx or ecowx */
-                    cs-&gt;exception_index = POWERPC_EXCP_DSI;
-                    env-&gt;error_code = 0;
-                    env-&gt;spr[SPR_DAR] = address;
-                    if (access_type == MMU_DATA_STORE) {
-                        env-&gt;spr[SPR_DSISR] = 0x06100000;
-                    } else {
-                        env-&gt;spr[SPR_DSISR] = 0x04100000;
-                    }
-                    break;
-                default:
-                    printf("DSI: invalid exception (%d)\n", ret);
-                    cs-&gt;exception_index = POWERPC_EXCP_PROGRAM;
-                    env-&gt;error_code =
-                        POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
-                    env-&gt;spr[SPR_DAR] = address;
-                    break;
+    for (i = 0; i &lt; BOOKE206_MAX_TLBN; i++) {
+        if (flags &amp; (1 &lt;&lt; i)) {
+            tlb_size = booke206_tlb_size(env, i);
+            for (j = 0; j &lt; tlb_size; j++) {
+                if (!check_iprot || !(tlb[j].mas1 &amp; MAS1_IPROT)) {
+                    tlb[j].mas1 &amp;= ~MAS1_VALID;
                 }
-                break;
             }
         }
-        ret = 1;
+        tlb += booke206_tlb_size(env, i);
     }
 
-    return ret;
+    tlb_flush(env_cpu(env));
 }
 
-#ifdef CONFIG_TCG
+
 /*****************************************************************************/
 /* BATs management */
 #if !defined(FLUSH_ALL_TLBS)
@@ -1952,9 +372,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 #endif
     }
 }
-#endif
 
-#ifdef CONFIG_TCG
 /*****************************************************************************/
 /* TLB management */
 void ppc_tlb_invalidate_all(CPUPPCState *env)
@@ -1998,9 +416,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
         break;
     }
 }
-#endif
 
-#ifdef CONFIG_TCG
 void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 {
 #if !defined(FLUSH_ALL_TLBS)
@@ -2942,30 +1358,6 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 {
     check_tlb_flush(env, true);
 }
-#endif /* CONFIG_TCG */
 
 /*****************************************************************************/
 
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
-    CPUPPCState *env = &amp;cpu-&gt;env;
-    int ret;
-
-    if (pcc-&gt;handle_mmu_fault) {
-        ret = pcc-&gt;handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-    } else {
-        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
-    }
-    if (unlikely(ret != 0)) {
-        if (probe) {
-            return false;
-        }
-        raise_exception_err_ra(env, cs-&gt;exception_index, env-&gt;error_code,
-                               retaddr);
-    }
-    return true;
-}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Estagiario<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------317D45EF84CF8C560D5F72D1--

