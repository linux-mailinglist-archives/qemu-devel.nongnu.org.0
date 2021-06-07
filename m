Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDA39D3A9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:53:01 +0200 (CEST)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6Jw-0006q3-CG
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hr-0003bo-D2; Sun, 06 Jun 2021 23:50:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47187 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hk-0002cc-5K; Sun, 06 Jun 2021 23:50:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt22KhNz9sWX; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=FWN8iD+ctidFo1/pMY7MuLtKwYR1oOScZqnsz0OdW+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cfI6pbVOKhf7ilJlPiGTXSn3LkRnfy4wMA3Qnv+dKV7DcvKC/P9B9Io+ppiTKOsvF
 6ZdklC2ZxVAUxEfaGWvFBhXPJcPS+pBw+2PQdGpO0huoZl/d981RpYN6mGZY8590QV
 tnMS1mEBJzFzCa+72ZGwxPyPHzX11Lg+LLvOHN8Y=
Date: Mon, 7 Jun 2021 12:31:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH 2/4] target/ppc: divided mmu_helper.c in 2 files
Message-ID: <YL2E91r4YCErNp5H@yekko>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
 <20210602192604.90846-3-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MeoJVkn/1B9jFTjI"
Content-Disposition: inline
In-Reply-To: <20210602192604.90846-3-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--MeoJVkn/1B9jFTjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 04:26:02PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> Moved functions in mmu_helper.c that should be compiled in build to
> mmu_common.c, moved declaration of functions that both files use to
> cpu.h and moved struct declarations and inline functions needed by
> both to target/ppc/internal.h. Updated meson.build to compile the
> new file.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
> ---
> Had to turn a few functions non static as it was used by both
> mmu_common.c and mmu_helper.c. Added the declaration of mmu_ctx_t to
> cpu.h so functions there can reference it and added the definition to
> internal.h so functions in both mmu_* files can access it.
> And maybe the tlb functions should be declared in internal.h instead of
> cpu.h.
> ---
>  target/ppc/cpu.h        |   35 +
>  target/ppc/internal.h   |   26 +
>  target/ppc/meson.build  |    6 +-
>  target/ppc/mmu_common.c | 1606 ++++++++++++++++++++++++++++++++++
>  target/ppc/mmu_helper.c | 1814 +++------------------------------------
>  5 files changed, 1774 insertions(+), 1713 deletions(-)
>  create mode 100644 target/ppc/mmu_common.c
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index b0934d9be4..cfc35ef83e 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1329,6 +1329,41 @@ void store_booke_tsr(CPUPPCState *env, target_ulon=
g val);
>  void ppc_tlb_invalidate_all(CPUPPCState *env);
>  void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr);
>  void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHypervisor *vhyp);
> +
> +typedef struct mmu_ctx_t mmu_ctx_t;
> +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
> +                            hwaddr *raddrp,
> +                            target_ulong address, uint32_t pid, int ext,
> +                            int i);
> +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
> +                                     target_ulong eaddr,
> +                                     MMUAccessType access_type, int type,
> +                                     int mmu_idx);
> +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
> +                                        ppcmas_tlb_t *tlb);
> +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
> +                            hwaddr *raddrp, target_ulong address,
> +                            uint32_t pid);
> +int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
> +                                target_ulong eaddr, MMUAccessType access=
_type,
> +                                int type);
> +static inline int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
> +                                    int way, int is_code)
> +{
> +    int nr;
> +
> +    /* Select TLB num in a way from address */
> +    nr =3D (eaddr >> TARGET_PAGE_BITS) & (env->tlb_per_way - 1);
> +    /* Select TLB way */
> +    nr +=3D env->tlb_per_way * way;
> +    /* 6xx have separate TLBs for instructions and data */
> +    if (is_code && env->id_tlbs =3D=3D 1) {
> +        nr +=3D env->nb_tlb;
> +    }
> +
> +    return nr;
> +}

This is a rather complex and model specific function to have inline in
a header.

> +
>  #endif
>  #endif
> =20
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 2b4b06eb76..7d2913ec28 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -247,4 +247,30 @@ static inline int prot_for_access_type(MMUAccessType=
 access_type)
>      g_assert_not_reached();
>  }
> =20
> +/* Context used internally during MMU translations */
> +
> +struct mmu_ctx_t {
> +    hwaddr raddr;      /* Real address              */
> +    hwaddr eaddr;      /* Effective address         */
> +    int prot;                      /* Protection bits           */
> +    hwaddr hash[2];    /* Pagetable hash values     */
> +    target_ulong ptem;             /* Virtual segment ID | API  */
> +    int key;                       /* Access key                */
> +    int nx;                        /* Non-execute area          */
> +};
> +
> +/* Common routines used by software and hardware TLBs emulation */
> +static inline int pte_is_valid(target_ulong pte0)
> +{
> +    return pte0 & 0x80000000 ? 1 : 0;
> +}
> +
> +static inline void pte_invalidate(target_ulong *pte0)
> +{
> +    *pte0 &=3D ~0x80000000;
> +}
> +
> +#define PTE_PTEM_MASK 0x7FFFFFBF
> +#define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
> +
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index a6a53a8d5c..a54445d0da 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -28,10 +28,12 @@ ppc_softmmu_ss.add(files(
>    'arch_dump.c',
>    'machine.c',
>    'mmu-hash32.c',
> -  'mmu_helper.c',
> +  'mmu_common.c',
>    'monitor.c',
>  ))
> -ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
> +ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'mmu_helper.c',
> +), if_false: files(
>    'tcg-stub.c'
>  ))
> =20
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> new file mode 100644
> index 0000000000..d95399d67f
> --- /dev/null
> +++ b/target/ppc/mmu_common.c
> @@ -0,0 +1,1606 @@
> +/*
> + *  PowerPC CPU initialization for qemu.
> + *
> + *  Copyright (C) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "cpu.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_ppc.h"
> +#include "mmu-hash64.h"
> +#include "mmu-hash32.h"
> +#include "exec/exec-all.h"
> +#include "exec/log.h"
> +#include "helper_regs.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/qemu-print.h"
> +#include "internal.h"
> +#include "mmu-book3s-v3.h"
> +#include "mmu-radix64.h"
> +
> +/* #define DEBUG_MMU */
> +/* #define DEBUG_BATS */
> +/* #define DEBUG_SOFTWARE_TLB */
> +/* #define DUMP_PAGE_TABLES */
> +/* #define FLUSH_ALL_TLBS */
> +
> +#ifdef DEBUG_MMU
> +#  define LOG_MMU_STATE(cpu) log_cpu_state_mask(CPU_LOG_MMU, (cpu), 0)
> +#else
> +#  define LOG_MMU_STATE(cpu) do { } while (0)
> +#endif
> +
> +#ifdef DEBUG_SOFTWARE_TLB
> +#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
> +#else
> +#  define LOG_SWTLB(...) do { } while (0)
> +#endif
> +
> +#ifdef DEBUG_BATS
> +#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
> +#else
> +#  define LOG_BATS(...) do { } while (0)
> +#endif
> +
> +/***********************************************************************=
******/
> +/* PowerPC MMU emulation */
> +
> +static int pp_check(int key, int pp, int nx)
> +{
> +    int access;
> +
> +    /* Compute access rights */
> +    access =3D 0;
> +    if (key =3D=3D 0) {
> +        switch (pp) {
> +        case 0x0:
> +        case 0x1:
> +        case 0x2:
> +            access |=3D PAGE_WRITE;
> +            /* fall through */
> +        case 0x3:
> +            access |=3D PAGE_READ;
> +            break;
> +        }
> +    } else {
> +        switch (pp) {
> +        case 0x0:
> +            access =3D 0;
> +            break;
> +        case 0x1:
> +        case 0x3:
> +            access =3D PAGE_READ;
> +            break;
> +        case 0x2:
> +            access =3D PAGE_READ | PAGE_WRITE;
> +            break;
> +        }
> +    }
> +    if (nx =3D=3D 0) {
> +        access |=3D PAGE_EXEC;
> +    }
> +
> +    return access;
> +}
> +
> +static int check_prot(int prot, MMUAccessType access_type)
> +{
> +    return prot & prot_for_access_type(access_type) ? 0 : -2;
> +}
> +
> +static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
> +                            int ret, MMUAccessType access_type)
> +{
> +    int store =3D 0;
> +
> +    /* Update page flags */
> +    if (!(*pte1p & 0x00000100)) {
> +        /* Update accessed flag */
> +        *pte1p |=3D 0x00000100;
> +        store =3D 1;
> +    }
> +    if (!(*pte1p & 0x00000080)) {
> +        if (access_type =3D=3D MMU_DATA_STORE && ret =3D=3D 0) {
> +            /* Update changed flag */
> +            *pte1p |=3D 0x00000080;
> +            store =3D 1;
> +        } else {
> +            /* Force page fault for first write access */
> +            ctx->prot &=3D ~PAGE_WRITE;
> +        }
> +    }
> +
> +    return store;
> +}
> +
> +static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
> +                                target_ulong pte1, int h,
> +                                MMUAccessType access_type)
> +{
> +    target_ulong ptem, mmask;
> +    int access, ret, pteh, ptev, pp;
> +
> +    ret =3D -1;
> +    /* Check validity and table match */
> +    ptev =3D pte_is_valid(pte0);
> +    pteh =3D (pte0 >> 6) & 1;
> +    if (ptev && h =3D=3D pteh) {
> +        /* Check vsid & api */
> +        ptem =3D pte0 & PTE_PTEM_MASK;
> +        mmask =3D PTE_CHECK_MASK;
> +        pp =3D pte1 & 0x00000003;
> +        if (ptem =3D=3D ctx->ptem) {
> +            if (ctx->raddr !=3D (hwaddr)-1ULL) {
> +                /* all matches should have equal RPN, WIMG & PP */
> +                if ((ctx->raddr & mmask) !=3D (pte1 & mmask)) {
> +                    qemu_log_mask(CPU_LOG_MMU, "Bad RPN/WIMG/PP\n");
> +                    return -3;
> +                }
> +            }
> +            /* Compute access rights */
> +            access =3D pp_check(ctx->key, pp, ctx->nx);
> +            /* Keep the matching PTE information */
> +            ctx->raddr =3D pte1;
> +            ctx->prot =3D access;
> +            ret =3D check_prot(ctx->prot, access_type);
> +            if (ret =3D=3D 0) {
> +                /* Access granted */
> +                qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
> +            } else {
> +                /* Access right violation */
> +                qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
> +            }
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
> +                            target_ulong eaddr, MMUAccessType access_typ=
e)
> +{
> +    ppc6xx_tlb_t *tlb;
> +    int nr, best, way;
> +    int ret;
> +
> +    best =3D -1;
> +    ret =3D -1; /* No TLB found */
> +    for (way =3D 0; way < env->nb_ways; way++) {
> +        nr =3D ppc6xx_tlb_getnum(env, eaddr, way, access_type =3D=3D MMU=
_INST_FETCH);
> +        tlb =3D &env->tlb.tlb6[nr];
> +        /* This test "emulates" the PTE index match for hardware TLBs */
> +        if ((eaddr & TARGET_PAGE_MASK) !=3D tlb->EPN) {
> +            LOG_SWTLB("TLB %d/%d %s [" TARGET_FMT_lx " " TARGET_FMT_lx
> +                      "] <> " TARGET_FMT_lx "\n", nr, env->nb_tlb,
> +                      pte_is_valid(tlb->pte0) ? "valid" : "inval",
> +                      tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE, eaddr);
> +            continue;
> +        }
> +        LOG_SWTLB("TLB %d/%d %s " TARGET_FMT_lx " <> " TARGET_FMT_lx " "
> +                  TARGET_FMT_lx " %c %c\n", nr, env->nb_tlb,
> +                  pte_is_valid(tlb->pte0) ? "valid" : "inval",
> +                  tlb->EPN, eaddr, tlb->pte1,
> +                  access_type =3D=3D MMU_DATA_STORE ? 'S' : 'L',
> +                  access_type =3D=3D MMU_INST_FETCH ? 'I' : 'D');
> +        switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
> +                                     0, access_type)) {
> +        case -3:
> +            /* TLB inconsistency */
> +            return -1;
> +        case -2:
> +            /* Access violation */
> +            ret =3D -2;
> +            best =3D nr;
> +            break;
> +        case -1:
> +        default:
> +            /* No match */
> +            break;
> +        case 0:
> +            /* access granted */
> +            /*
> +             * XXX: we should go on looping to check all TLBs
> +             *      consistency but we can speed-up the whole thing as
> +             *      the result would be undefined if TLBs are not
> +             *      consistent.
> +             */
> +            ret =3D 0;
> +            best =3D nr;
> +            goto done;
> +        }
> +    }
> +    if (best !=3D -1) {
> +    done:
> +        LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=3D%01x ret=
=3D%d\n",
> +                  ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
> +        /* Update page flags */
> +        pte_update_flags(ctx, &env->tlb.tlb6[best].pte1, ret, access_typ=
e);
> +    }
> +
> +    return ret;
> +}
> +
> +/* Perform BAT hit & translation */
> +static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
> +                                 int *validp, int *protp, target_ulong *=
BATu,
> +                                 target_ulong *BATl)
> +{
> +    target_ulong bl;
> +    int pp, valid, prot;
> +
> +    bl =3D (*BATu & 0x00001FFC) << 15;
> +    valid =3D 0;
> +    prot =3D 0;
> +    if (((msr_pr =3D=3D 0) && (*BATu & 0x00000002)) ||
> +        ((msr_pr !=3D 0) && (*BATu & 0x00000001))) {
> +        valid =3D 1;
> +        pp =3D *BATl & 0x00000003;
> +        if (pp !=3D 0) {
> +            prot =3D PAGE_READ | PAGE_EXEC;
> +            if (pp =3D=3D 0x2) {
> +                prot |=3D PAGE_WRITE;
> +            }
> +        }
> +    }
> +    *blp =3D bl;
> +    *validp =3D valid;
> +    *protp =3D prot;
> +}
> +
> +static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
> +                           target_ulong virtual, MMUAccessType access_ty=
pe)
> +{
> +    target_ulong *BATlt, *BATut, *BATu, *BATl;
> +    target_ulong BEPIl, BEPIu, bl;
> +    int i, valid, prot;
> +    int ret =3D -1;
> +    bool ifetch =3D access_type =3D=3D MMU_INST_FETCH;
> +
> +    LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
> +             ifetch ? 'I' : 'D', virtual);
> +    if (ifetch) {
> +        BATlt =3D env->IBAT[1];
> +        BATut =3D env->IBAT[0];
> +    } else {
> +        BATlt =3D env->DBAT[1];
> +        BATut =3D env->DBAT[0];
> +    }
> +    for (i =3D 0; i < env->nb_BATs; i++) {
> +        BATu =3D &BATut[i];
> +        BATl =3D &BATlt[i];
> +        BEPIu =3D *BATu & 0xF0000000;
> +        BEPIl =3D *BATu & 0x0FFE0000;
> +        bat_size_prot(env, &bl, &valid, &prot, BATu, BATl);
> +        LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
> +                 " BATl " TARGET_FMT_lx "\n", __func__,
> +                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
> +        if ((virtual & 0xF0000000) =3D=3D BEPIu &&
> +            ((virtual & 0x0FFE0000) & ~bl) =3D=3D BEPIl) {
> +            /* BAT matches */
> +            if (valid !=3D 0) {
> +                /* Get physical address */
> +                ctx->raddr =3D (*BATl & 0xF0000000) |
> +                    ((virtual & 0x0FFE0000 & bl) | (*BATl & 0x0FFE0000))=
 |
> +                    (virtual & 0x0001F000);
> +                /* Compute access rights */
> +                ctx->prot =3D prot;
> +                ret =3D check_prot(ctx->prot, access_type);
> +                if (ret =3D=3D 0) {
> +                    LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=3D=
%c%c\n",
> +                             i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' =
: '-',
> +                             ctx->prot & PAGE_WRITE ? 'W' : '-');
> +                }
> +                break;
> +            }
> +        }
> +    }
> +    if (ret < 0) {
> +#if defined(DEBUG_BATS)
> +        if (qemu_log_enabled()) {
> +            LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", virtual);
> +            for (i =3D 0; i < 4; i++) {
> +                BATu =3D &BATut[i];
> +                BATl =3D &BATlt[i];
> +                BEPIu =3D *BATu & 0xF0000000;
> +                BEPIl =3D *BATu & 0x0FFE0000;
> +                bl =3D (*BATu & 0x00001FFC) << 15;
> +                LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_=
FMT_lx
> +                         " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
> +                         TARGET_FMT_lx " " TARGET_FMT_lx "\n",
> +                         __func__, ifetch ? 'I' : 'D', i, virtual,
> +                         *BATu, *BATl, BEPIu, BEPIl, bl);
> +            }
> +        }
> +#endif
> +    }
> +    /* No hit */
> +    return ret;
> +}
> +
> +/* Perform segment based translation */
> +static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
> +                               target_ulong eaddr, MMUAccessType access_=
type,
> +                               int type)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    hwaddr hash;
> +    target_ulong vsid;
> +    int ds, pr, target_page_bits;
> +    int ret;
> +    target_ulong sr, pgidx;
> +
> +    pr =3D msr_pr;
> +    ctx->eaddr =3D eaddr;
> +
> +    sr =3D env->sr[eaddr >> 28];
> +    ctx->key =3D (((sr & 0x20000000) && (pr !=3D 0)) ||
> +                ((sr & 0x40000000) && (pr =3D=3D 0))) ? 1 : 0;
> +    ds =3D sr & 0x80000000 ? 1 : 0;
> +    ctx->nx =3D sr & 0x10000000 ? 1 : 0;
> +    vsid =3D sr & 0x00FFFFFF;
> +    target_page_bits =3D TARGET_PAGE_BITS;
> +    qemu_log_mask(CPU_LOG_MMU,
> +            "Check segment v=3D" TARGET_FMT_lx " %d " TARGET_FMT_lx
> +            " nip=3D" TARGET_FMT_lx " lr=3D" TARGET_FMT_lx
> +            " ir=3D%d dr=3D%d pr=3D%d %d t=3D%d\n",
> +            eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int)msr_i=
r,
> +            (int)msr_dr, pr !=3D 0 ? 1 : 0, access_type =3D=3D MMU_DATA_=
STORE, type);
> +    pgidx =3D (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
> +    hash =3D vsid ^ pgidx;
> +    ctx->ptem =3D (vsid << 7) | (pgidx >> 10);
> +
> +    qemu_log_mask(CPU_LOG_MMU,
> +            "pte segment: key=3D%d ds %d nx %d vsid " TARGET_FMT_lx "\n",
> +            ctx->key, ds, ctx->nx, vsid);
> +    ret =3D -1;
> +    if (!ds) {
> +        /* Check if instruction fetch is allowed, if needed */
> +        if (type !=3D ACCESS_CODE || ctx->nx =3D=3D 0) {
> +            /* Page address translation */
> +            qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
> +                    " htab_mask " TARGET_FMT_plx
> +                    " hash " TARGET_FMT_plx "\n",
> +                    ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), =
hash);
> +            ctx->hash[0] =3D hash;
> +            ctx->hash[1] =3D ~hash;
> +
> +            /* Initialize real address with an invalid value */
> +            ctx->raddr =3D (hwaddr)-1ULL;
> +            /* Software TLB search */
> +            ret =3D ppc6xx_tlb_check(env, ctx, eaddr, access_type);
> +#if defined(DUMP_PAGE_TABLES)
> +            if (qemu_loglevel_mask(CPU_LOG_MMU)) {
> +                CPUState *cs =3D env_cpu(env);
> +                hwaddr curaddr;
> +                uint32_t a0, a1, a2, a3;
> +
> +                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FM=
T_plx
> +                         "\n", ppc_hash32_hpt_base(cpu),
> +                         ppc_hash32_hpt_mask(env) + 0x80);
> +                for (curaddr =3D ppc_hash32_hpt_base(cpu);
> +                     curaddr < (ppc_hash32_hpt_base(cpu)
> +                                + ppc_hash32_hpt_mask(cpu) + 0x80);
> +                     curaddr +=3D 16) {
> +                    a0 =3D ldl_phys(cs->as, curaddr);
> +                    a1 =3D ldl_phys(cs->as, curaddr + 4);
> +                    a2 =3D ldl_phys(cs->as, curaddr + 8);
> +                    a3 =3D ldl_phys(cs->as, curaddr + 12);
> +                    if (a0 !=3D 0 || a1 !=3D 0 || a2 !=3D 0 || a3 !=3D 0=
) {
> +                        qemu_log(TARGET_FMT_plx ": %08x %08x %08x %08x\n=
",
> +                                 curaddr, a0, a1, a2, a3);
> +                    }
> +                }
> +            }
> +#endif
> +        } else {
> +            qemu_log_mask(CPU_LOG_MMU, "No access allowed\n");
> +            ret =3D -3;
> +        }
> +    } else {
> +        target_ulong sr;
> +
> +        qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
> +        /* Direct-store segment : absolutely *BUGGY* for now */
> +
> +        /*
> +         * Direct-store implies a 32-bit MMU.
> +         * Check the Segment Register's bus unit ID (BUID).
> +         */
> +        sr =3D env->sr[eaddr >> 28];
> +        if ((sr & 0x1FF00000) >> 20 =3D=3D 0x07f) {
> +            /*
> +             * Memory-forced I/O controller interface access
> +             *
> +             * If T=3D1 and BUID=3Dx'07F', the 601 performs a memory
> +             * access to SR[28-31] LA[4-31], bypassing all protection
> +             * mechanisms.
> +             */
> +            ctx->raddr =3D ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
> +            ctx->prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +            return 0;
> +        }
> +
> +        switch (type) {
> +        case ACCESS_INT:
> +            /* Integer load/store : only access allowed */
> +            break;
> +        case ACCESS_CODE:
> +            /* No code fetch is allowed in direct-store areas */
> +            return -4;
> +        case ACCESS_FLOAT:
> +            /* Floating point load/store */
> +            return -4;
> +        case ACCESS_RES:
> +            /* lwarx, ldarx or srwcx. */
> +            return -4;
> +        case ACCESS_CACHE:
> +            /*
> +             * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
> +             *
> +             * Should make the instruction do no-op.  As it already do
> +             * no-op, it's quite easy :-)
> +             */
> +            ctx->raddr =3D eaddr;
> +            return 0;
> +        case ACCESS_EXT:
> +            /* eciwx or ecowx */
> +            return -4;
> +        default:
> +            qemu_log_mask(CPU_LOG_MMU, "ERROR: instruction should not ne=
ed "
> +                          "address translation\n");
> +            return -4;
> +        }
> +        if ((access_type =3D=3D MMU_DATA_STORE || ctx->key !=3D 1) &&
> +            (access_type =3D=3D MMU_DATA_LOAD || ctx->key !=3D 0)) {
> +            ctx->raddr =3D eaddr;
> +            ret =3D 2;
> +        } else {
> +            ret =3D -2;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +/* Generic TLB check function for embedded PowerPC implementations */
> +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
> +                            hwaddr *raddrp,
> +                            target_ulong address, uint32_t pid, int ext,
> +                            int i)
> +{
> +    target_ulong mask;
> +
> +    /* Check valid flag */
> +    if (!(tlb->prot & PAGE_VALID)) {
> +        return -1;
> +    }
> +    mask =3D ~(tlb->size - 1);
> +    LOG_SWTLB("%s: TLB %d address " TARGET_FMT_lx " PID %u <=3D> " TARGE=
T_FMT_lx
> +              " " TARGET_FMT_lx " %u %x\n", __func__, i, address, pid, t=
lb->EPN,
> +              mask, (uint32_t)tlb->PID, tlb->prot);
> +    /* Check PID */
> +    if (tlb->PID !=3D 0 && tlb->PID !=3D pid) {
> +        return -1;
> +    }
> +    /* Check effective address */
> +    if ((address & mask) !=3D tlb->EPN) {
> +        return -1;
> +    }
> +    *raddrp =3D (tlb->RPN & mask) | (address & ~mask);
> +    if (ext) {
> +        /* Extend the physical address to 36 bits */
> +        *raddrp |=3D (uint64_t)(tlb->RPN & 0xF) << 32;
> +    }
> +
> +    return 0;
> +}
> +
> +static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
> +                                       target_ulong address,
> +                                       MMUAccessType access_type)
> +{
> +    ppcemb_tlb_t *tlb;
> +    hwaddr raddr;
> +    int i, ret, zsel, zpr, pr;
> +
> +    ret =3D -1;
> +    raddr =3D (hwaddr)-1ULL;
> +    pr =3D msr_pr;
> +    for (i =3D 0; i < env->nb_tlb; i++) {
> +        tlb =3D &env->tlb.tlbe[i];
> +        if (ppcemb_tlb_check(env, tlb, &raddr, address,
> +                             env->spr[SPR_40x_PID], 0, i) < 0) {
> +            continue;
> +        }
> +        zsel =3D (tlb->attr >> 4) & 0xF;
> +        zpr =3D (env->spr[SPR_40x_ZPR] >> (30 - (2 * zsel))) & 0x3;
> +        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
> +                    __func__, i, zsel, zpr, access_type, tlb->attr);
> +        /* Check execute enable bit */
> +        switch (zpr) {
> +        case 0x2:
> +            if (pr !=3D 0) {
> +                goto check_perms;
> +            }
> +            /* fall through */
> +        case 0x3:
> +            /* All accesses granted */
> +            ctx->prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +            ret =3D 0;
> +            break;
> +        case 0x0:
> +            if (pr !=3D 0) {
> +                /* Raise Zone protection fault.  */
> +                env->spr[SPR_40x_ESR] =3D 1 << 22;
> +                ctx->prot =3D 0;
> +                ret =3D -2;
> +                break;
> +            }
> +            /* fall through */
> +        case 0x1:
> +        check_perms:
> +            /* Check from TLB entry */
> +            ctx->prot =3D tlb->prot;
> +            ret =3D check_prot(ctx->prot, access_type);
> +            if (ret =3D=3D -2) {
> +                env->spr[SPR_40x_ESR] =3D 0;
> +            }
> +            break;
> +        }
> +        if (ret >=3D 0) {
> +            ctx->raddr =3D raddr;
> +            LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGE=
T_FMT_plx
> +                      " %d %d\n", __func__, address, ctx->raddr, ctx->pr=
ot,
> +                      ret);
> +            return 0;
> +        }
> +    }
> +    LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FMT_plx
> +              " %d %d\n", __func__, address, raddr, ctx->prot, ret);
> +
> +    return ret;
> +}
> +
> +void store_40x_sler(CPUPPCState *env, uint32_t val)
> +{
> +    /* XXX: TO BE FIXED */
> +    if (val !=3D 0x00000000) {
> +        cpu_abort(env_cpu(env),
> +                  "Little-endian regions are not supported by now\n");
> +    }
> +    env->spr[SPR_405_SLER] =3D val;
> +}
> +
> +static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
> +                              hwaddr *raddr, int *prot, target_ulong add=
ress,
> +                              MMUAccessType access_type, int i)
> +{
> +    int prot2;
> +
> +    if (ppcemb_tlb_check(env, tlb, raddr, address,
> +                         env->spr[SPR_BOOKE_PID],
> +                         !env->nb_pids, i) >=3D 0) {
> +        goto found_tlb;
> +    }
> +
> +    if (env->spr[SPR_BOOKE_PID1] &&
> +        ppcemb_tlb_check(env, tlb, raddr, address,
> +                         env->spr[SPR_BOOKE_PID1], 0, i) >=3D 0) {
> +        goto found_tlb;
> +    }
> +
> +    if (env->spr[SPR_BOOKE_PID2] &&
> +        ppcemb_tlb_check(env, tlb, raddr, address,
> +                         env->spr[SPR_BOOKE_PID2], 0, i) >=3D 0) {
> +        goto found_tlb;
> +    }
> +
> +    LOG_SWTLB("%s: TLB entry not found\n", __func__);
> +    return -1;
> +
> +found_tlb:
> +
> +    if (msr_pr !=3D 0) {
> +        prot2 =3D tlb->prot & 0xF;
> +    } else {
> +        prot2 =3D (tlb->prot >> 4) & 0xF;
> +    }
> +
> +    /* Check the address space */
> +    if ((access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr) !=3D (tlb-=
>attr & 1)) {
> +        LOG_SWTLB("%s: AS doesn't match\n", __func__);
> +        return -1;
> +    }
> +
> +    *prot =3D prot2;
> +    if (prot2 & prot_for_access_type(access_type)) {
> +        LOG_SWTLB("%s: good TLB!\n", __func__);
> +        return 0;
> +    }
> +
> +    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
> +    return access_type =3D=3D MMU_INST_FETCH ? -3 : -2;
> +}
> +
> +static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ct=
x,
> +                                         target_ulong address,
> +                                         MMUAccessType access_type)
> +{
> +    ppcemb_tlb_t *tlb;
> +    hwaddr raddr;
> +    int i, ret;
> +
> +    ret =3D -1;
> +    raddr =3D (hwaddr)-1ULL;
> +    for (i =3D 0; i < env->nb_tlb; i++) {
> +        tlb =3D &env->tlb.tlbe[i];
> +        ret =3D mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address,
> +                                 access_type, i);
> +        if (ret !=3D -1) {
> +            break;
> +        }
> +    }
> +
> +    if (ret >=3D 0) {
> +        ctx->raddr =3D raddr;
> +        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> +                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
> +                  ret);
> +    } else {
> +        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> +                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
> +                                        ppcmas_tlb_t *tlb)
> +{
> +    int tlbm_size;
> +
> +    tlbm_size =3D (tlb->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
> +
> +    return 1024ULL << tlbm_size;
> +}
> +
> +/* TLB check function for MAS based SoftTLBs */
> +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
> +                            hwaddr *raddrp, target_ulong address,
> +                            uint32_t pid)
> +{
> +    hwaddr mask;
> +    uint32_t tlb_pid;
> +
> +    if (!msr_cm) {
> +        /* In 32bit mode we can only address 32bit EAs */
> +        address =3D (uint32_t)address;
> +    }
> +
> +    /* Check valid flag */
> +    if (!(tlb->mas1 & MAS1_VALID)) {
> +        return -1;
> +    }
> +
> +    mask =3D ~(booke206_tlb_to_page_size(env, tlb) - 1);
> +    LOG_SWTLB("%s: TLB ADDR=3D0x" TARGET_FMT_lx " PID=3D0x%x MAS1=3D0x%x=
 MAS2=3D0x%"
> +              PRIx64 " mask=3D0x%" HWADDR_PRIx " MAS7_3=3D0x%" PRIx64 " =
MAS8=3D0x%"
> +              PRIx32 "\n", __func__, address, pid, tlb->mas1, tlb->mas2,=
 mask,
> +              tlb->mas7_3, tlb->mas8);
> +
> +    /* Check PID */
> +    tlb_pid =3D (tlb->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT;
> +    if (tlb_pid !=3D 0 && tlb_pid !=3D pid) {
> +        return -1;
> +    }
> +
> +    /* Check effective address */
> +    if ((address & mask) !=3D (tlb->mas2 & MAS2_EPN_MASK)) {
> +        return -1;
> +    }
> +
> +    if (raddrp) {
> +        *raddrp =3D (tlb->mas7_3 & mask) | (address & ~mask);
> +    }
> +
> +    return 0;
> +}
> +
> +static bool is_epid_mmu(int mmu_idx)
> +{
> +    return mmu_idx =3D=3D PPC_TLB_EPID_STORE || mmu_idx =3D=3D PPC_TLB_E=
PID_LOAD;
> +}
> +
> +static uint32_t mmubooke206_esr(int mmu_idx, MMUAccessType access_type)
> +{
> +    uint32_t esr =3D 0;
> +    if (access_type =3D=3D MMU_DATA_STORE) {
> +        esr |=3D ESR_ST;
> +    }
> +    if (is_epid_mmu(mmu_idx)) {
> +        esr |=3D ESR_EPID;
> +    }
> +    return esr;
> +}
> +
> +/*
> + * Get EPID register given the mmu_idx. If this is regular load,
> + * construct the EPID access bits from current processor state
> + *
> + * Get the effective AS and PR bits and the PID. The PID is returned
> + * only if EPID load is requested, otherwise the caller must detect
> + * the correct EPID.  Return true if valid EPID is returned.
> + */
> +static bool mmubooke206_get_as(CPUPPCState *env,
> +                               int mmu_idx, uint32_t *epid_out,
> +                               bool *as_out, bool *pr_out)
> +{
> +    if (is_epid_mmu(mmu_idx)) {
> +        uint32_t epidr;
> +        if (mmu_idx =3D=3D PPC_TLB_EPID_STORE) {
> +            epidr =3D env->spr[SPR_BOOKE_EPSC];
> +        } else {
> +            epidr =3D env->spr[SPR_BOOKE_EPLC];
> +        }
> +        *epid_out =3D (epidr & EPID_EPID) >> EPID_EPID_SHIFT;
> +        *as_out =3D !!(epidr & EPID_EAS);
> +        *pr_out =3D !!(epidr & EPID_EPR);
> +        return true;
> +    } else {
> +        *as_out =3D msr_ds;
> +        *pr_out =3D msr_pr;
> +        return false;
> +    }
> +}
> +
> +/* Check if the tlb found by hashing really matches */
> +static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
> +                                 hwaddr *raddr, int *prot,
> +                                 target_ulong address,
> +                                 MMUAccessType access_type, int mmu_idx)
> +{
> +    int prot2 =3D 0;
> +    uint32_t epid;
> +    bool as, pr;
> +    bool use_epid =3D mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
> +
> +    if (!use_epid) {
> +        if (ppcmas_tlb_check(env, tlb, raddr, address,
> +                             env->spr[SPR_BOOKE_PID]) >=3D 0) {
> +            goto found_tlb;
> +        }
> +
> +        if (env->spr[SPR_BOOKE_PID1] &&
> +            ppcmas_tlb_check(env, tlb, raddr, address,
> +                             env->spr[SPR_BOOKE_PID1]) >=3D 0) {
> +            goto found_tlb;
> +        }
> +
> +        if (env->spr[SPR_BOOKE_PID2] &&
> +            ppcmas_tlb_check(env, tlb, raddr, address,
> +                             env->spr[SPR_BOOKE_PID2]) >=3D 0) {
> +            goto found_tlb;
> +        }
> +    } else {
> +        if (ppcmas_tlb_check(env, tlb, raddr, address, epid) >=3D 0) {
> +            goto found_tlb;
> +        }
> +    }
> +
> +    LOG_SWTLB("%s: TLB entry not found\n", __func__);
> +    return -1;
> +
> +found_tlb:
> +
> +    if (pr) {
> +        if (tlb->mas7_3 & MAS3_UR) {
> +            prot2 |=3D PAGE_READ;
> +        }
> +        if (tlb->mas7_3 & MAS3_UW) {
> +            prot2 |=3D PAGE_WRITE;
> +        }
> +        if (tlb->mas7_3 & MAS3_UX) {
> +            prot2 |=3D PAGE_EXEC;
> +        }
> +    } else {
> +        if (tlb->mas7_3 & MAS3_SR) {
> +            prot2 |=3D PAGE_READ;
> +        }
> +        if (tlb->mas7_3 & MAS3_SW) {
> +            prot2 |=3D PAGE_WRITE;
> +        }
> +        if (tlb->mas7_3 & MAS3_SX) {
> +            prot2 |=3D PAGE_EXEC;
> +        }
> +    }
> +
> +    /* Check the address space and permissions */
> +    if (access_type =3D=3D MMU_INST_FETCH) {
> +        /* There is no way to fetch code using epid load */
> +        assert(!use_epid);
> +        as =3D msr_ir;
> +    }
> +
> +    if (as !=3D ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
> +        LOG_SWTLB("%s: AS doesn't match\n", __func__);
> +        return -1;
> +    }
> +
> +    *prot =3D prot2;
> +    if (prot2 & prot_for_access_type(access_type)) {
> +        LOG_SWTLB("%s: good TLB!\n", __func__);
> +        return 0;
> +    }
> +
> +    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
> +    return access_type =3D=3D MMU_INST_FETCH ? -3 : -2;
> +}
> +
> +static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t =
*ctx,
> +                                            target_ulong address,
> +                                            MMUAccessType access_type,
> +                                            int mmu_idx)
> +{
> +    ppcmas_tlb_t *tlb;
> +    hwaddr raddr;
> +    int i, j, ret;
> +
> +    ret =3D -1;
> +    raddr =3D (hwaddr)-1ULL;
> +
> +    for (i =3D 0; i < BOOKE206_MAX_TLBN; i++) {
> +        int ways =3D booke206_tlb_ways(env, i);
> +
> +        for (j =3D 0; j < ways; j++) {
> +            tlb =3D booke206_get_tlbm(env, i, address, j);
> +            if (!tlb) {
> +                continue;
> +            }
> +            ret =3D mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, =
address,
> +                                        access_type, mmu_idx);
> +            if (ret !=3D -1) {
> +                goto found_tlb;
> +            }
> +        }
> +    }
> +
> +found_tlb:
> +
> +    if (ret >=3D 0) {
> +        ctx->raddr =3D raddr;
> +        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> +                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
> +                  ret);
> +    } else {
> +        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> +                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static const char *book3e_tsize_to_str[32] =3D {
> +    "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K",
> +    "1M", "2M", "4M", "8M", "16M", "32M", "64M", "128M", "256M", "512M",
> +    "1G", "2G", "4G", "8G", "16G", "32G", "64G", "128G", "256G", "512G",
> +    "1T", "2T"
> +};
> +
> +static void mmubooke_dump_mmu(CPUPPCState *env)
> +{
> +    ppcemb_tlb_t *entry;
> +    int i;
> +
> +    if (kvm_enabled() && !env->kvm_sw_tlb) {
> +        qemu_printf("Cannot access KVM TLB\n");
> +        return;
> +    }
> +
> +    qemu_printf("\nTLB:\n");
> +    qemu_printf("Effective          Physical           Size PID   Prot  =
   "
> +                "Attr\n");
> +
> +    entry =3D &env->tlb.tlbe[0];
> +    for (i =3D 0; i < env->nb_tlb; i++, entry++) {
> +        hwaddr ea, pa;
> +        target_ulong mask;
> +        uint64_t size =3D (uint64_t)entry->size;
> +        char size_buf[20];
> +
> +        /* Check valid flag */
> +        if (!(entry->prot & PAGE_VALID)) {
> +            continue;
> +        }
> +
> +        mask =3D ~(entry->size - 1);
> +        ea =3D entry->EPN & mask;
> +        pa =3D entry->RPN & mask;
> +        /* Extend the physical address to 36 bits */
> +        pa |=3D (hwaddr)(entry->RPN & 0xF) << 32;
> +        if (size >=3D 1 * MiB) {
> +            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size /=
 MiB);
> +        } else {
> +            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size /=
 KiB);
> +        }
> +        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x=
\n",
> +                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entr=
y->PID,
> +                    entry->prot, entry->attr);
> +    }
> +
> +}
> +
> +static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int off=
set,
> +                                     int tlbsize)
> +{
> +    ppcmas_tlb_t *entry;
> +    int i;
> +
> +    qemu_printf("\nTLB%d:\n", tlbn);
> +    qemu_printf("Effective          Physical           Size TID   TS SRW=
X"
> +                " URWX WIMGE U0123\n");
> +
> +    entry =3D &env->tlb.tlbm[offset];
> +    for (i =3D 0; i < tlbsize; i++, entry++) {
> +        hwaddr ea, pa, size;
> +        int tsize;
> +
> +        if (!(entry->mas1 & MAS1_VALID)) {
> +            continue;
> +        }
> +
> +        tsize =3D (entry->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
> +        size =3D 1024ULL << tsize;
> +        ea =3D entry->mas2 & ~(size - 1);
> +        pa =3D entry->mas7_3 & ~(size - 1);
> +
> +        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c=
%c%c"
> +                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
> +                    (uint64_t)ea, (uint64_t)pa,
> +                    book3e_tsize_to_str[tsize],
> +                    (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
> +                    (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
> +                    entry->mas7_3 & MAS3_SR ? 'R' : '-',
> +                    entry->mas7_3 & MAS3_SW ? 'W' : '-',
> +                    entry->mas7_3 & MAS3_SX ? 'X' : '-',
> +                    entry->mas7_3 & MAS3_UR ? 'R' : '-',
> +                    entry->mas7_3 & MAS3_UW ? 'W' : '-',
> +                    entry->mas7_3 & MAS3_UX ? 'X' : '-',
> +                    entry->mas2 & MAS2_W ? 'W' : '-',
> +                    entry->mas2 & MAS2_I ? 'I' : '-',
> +                    entry->mas2 & MAS2_M ? 'M' : '-',
> +                    entry->mas2 & MAS2_G ? 'G' : '-',
> +                    entry->mas2 & MAS2_E ? 'E' : '-',
> +                    entry->mas7_3 & MAS3_U0 ? '0' : '-',
> +                    entry->mas7_3 & MAS3_U1 ? '1' : '-',
> +                    entry->mas7_3 & MAS3_U2 ? '2' : '-',
> +                    entry->mas7_3 & MAS3_U3 ? '3' : '-');
> +    }
> +}
> +
> +static void mmubooke206_dump_mmu(CPUPPCState *env)
> +{
> +    int offset =3D 0;
> +    int i;
> +
> +    if (kvm_enabled() && !env->kvm_sw_tlb) {
> +        qemu_printf("Cannot access KVM TLB\n");
> +        return;
> +    }
> +
> +    for (i =3D 0; i < BOOKE206_MAX_TLBN; i++) {
> +        int size =3D booke206_tlb_size(env, i);
> +
> +        if (size =3D=3D 0) {
> +            continue;
> +        }
> +
> +        mmubooke206_dump_one_tlb(env, i, offset, size);
> +        offset +=3D size;
> +    }
> +}
> +
> +static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
> +{
> +    target_ulong *BATlt, *BATut, *BATu, *BATl;
> +    target_ulong BEPIl, BEPIu, bl;
> +    int i;
> +
> +    switch (type) {
> +    case ACCESS_CODE:
> +        BATlt =3D env->IBAT[1];
> +        BATut =3D env->IBAT[0];
> +        break;
> +    default:
> +        BATlt =3D env->DBAT[1];
> +        BATut =3D env->DBAT[0];
> +        break;
> +    }
> +
> +    for (i =3D 0; i < env->nb_BATs; i++) {
> +        BATu =3D &BATut[i];
> +        BATl =3D &BATlt[i];
> +        BEPIu =3D *BATu & 0xF0000000;
> +        BEPIl =3D *BATu & 0x0FFE0000;
> +        bl =3D (*BATu & 0x00001FFC) << 15;
> +        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
> +                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
> +                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
> +                    type =3D=3D ACCESS_CODE ? "code" : "data", i,
> +                    *BATu, *BATl, BEPIu, BEPIl, bl);
> +    }
> +}
> +
> +static void mmu6xx_dump_mmu(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    ppc6xx_tlb_t *tlb;
> +    target_ulong sr;
> +    int type, way, entry, i;
> +
> +    qemu_printf("HTAB base =3D 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(=
cpu));
> +    qemu_printf("HTAB mask =3D 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(=
cpu));
> +
> +    qemu_printf("\nSegment registers:\n");
> +    for (i =3D 0; i < 32; i++) {
> +        sr =3D env->sr[i];
> +        if (sr & 0x80000000) {
> +            qemu_printf("%02d T=3D%d Ks=3D%d Kp=3D%d BUID=3D0x%03x "
> +                        "CNTLR_SPEC=3D0x%05x\n", i,
> +                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
> +                        sr & 0x20000000 ? 1 : 0, (uint32_t)((sr >> 20) &=
 0x1FF),
> +                        (uint32_t)(sr & 0xFFFFF));
> +        } else {
> +            qemu_printf("%02d T=3D%d Ks=3D%d Kp=3D%d N=3D%d VSID=3D0x%06=
x\n", i,
> +                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
> +                        sr & 0x20000000 ? 1 : 0, sr & 0x10000000 ? 1 : 0,
> +                        (uint32_t)(sr & 0x00FFFFFF));
> +        }
> +    }
> +
> +    qemu_printf("\nBATs:\n");
> +    mmu6xx_dump_BATs(env, ACCESS_INT);
> +    mmu6xx_dump_BATs(env, ACCESS_CODE);
> +
> +    if (env->id_tlbs !=3D 1) {
> +        qemu_printf("ERROR: 6xx MMU should have separated TLB"
> +                    " for code and data\n");
> +    }
> +
> +    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
> +
> +    for (type =3D 0; type < 2; type++) {
> +        for (way =3D 0; way < env->nb_ways; way++) {
> +            for (entry =3D env->nb_tlb * type + env->tlb_per_way * way;
> +                 entry < (env->nb_tlb * type + env->tlb_per_way * (way +=
 1));
> +                 entry++) {
> +
> +                tlb =3D &env->tlb.tlb6[entry];
> +                qemu_printf("%s TLB %02d/%02d way:%d %s ["
> +                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
> +                            type ? "code" : "data", entry % env->nb_tlb,
> +                            env->nb_tlb, way,
> +                            pte_is_valid(tlb->pte0) ? "valid" : "inval",
> +                            tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE);
> +            }
> +        }
> +    }
> +}
> +
> +void dump_mmu(CPUPPCState *env)
> +{
> +    switch (env->mmu_model) {
> +    case POWERPC_MMU_BOOKE:
> +        mmubooke_dump_mmu(env);
> +        break;
> +    case POWERPC_MMU_BOOKE206:
> +        mmubooke206_dump_mmu(env);
> +        break;
> +    case POWERPC_MMU_SOFT_6xx:
> +    case POWERPC_MMU_SOFT_74xx:
> +        mmu6xx_dump_mmu(env);
> +        break;
> +#if defined(TARGET_PPC64)
> +    case POWERPC_MMU_64B:
> +    case POWERPC_MMU_2_03:
> +    case POWERPC_MMU_2_06:
> +    case POWERPC_MMU_2_07:
> +        dump_slb(env_archcpu(env));
> +        break;
> +    case POWERPC_MMU_3_00:
> +        if (ppc64_v3_radix(env_archcpu(env))) {
> +            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n=
",
> +                          __func__);
> +        } else {
> +            dump_slb(env_archcpu(env));
> +        }
> +        break;
> +#endif
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
> +    }
> +}
> +
> +static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong=
 eaddr,
> +                          MMUAccessType access_type)
> +{
> +    int in_plb, ret;
> +
> +    ctx->raddr =3D eaddr;
> +    ctx->prot =3D PAGE_READ | PAGE_EXEC;
> +    ret =3D 0;
> +    switch (env->mmu_model) {
> +    case POWERPC_MMU_SOFT_6xx:
> +    case POWERPC_MMU_SOFT_74xx:
> +    case POWERPC_MMU_SOFT_4xx:
> +    case POWERPC_MMU_REAL:
> +    case POWERPC_MMU_BOOKE:
> +        ctx->prot |=3D PAGE_WRITE;
> +        break;
> +
> +    case POWERPC_MMU_SOFT_4xx_Z:
> +        if (unlikely(msr_pe !=3D 0)) {
> +            /*
> +             * 403 family add some particular protections, using
> +             * PBL/PBU registers for accesses with no translation.
> +             */
> +            in_plb =3D
> +                /* Check PLB validity */
> +                (env->pb[0] < env->pb[1] &&
> +                 /* and address in plb area */
> +                 eaddr >=3D env->pb[0] && eaddr < env->pb[1]) ||
> +                (env->pb[2] < env->pb[3] &&
> +                 eaddr >=3D env->pb[2] && eaddr < env->pb[3]) ? 1 : 0;
> +            if (in_plb ^ msr_px) {
> +                /* Access in protected area */
> +                if (access_type =3D=3D MMU_DATA_STORE) {
> +                    /* Access is not allowed */
> +                    ret =3D -2;
> +                }
> +            } else {
> +                /* Read-write access is allowed */
> +                ctx->prot |=3D PAGE_WRITE;
> +            }
> +        }
> +        break;
> +
> +    default:
> +        /* Caller's checks mean we should never get here for other model=
s */
> +        abort();
> +        return -1;
> +    }
> +
> +    return ret;
> +}
> +
> +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
> +                                     target_ulong eaddr,
> +                                     MMUAccessType access_type, int type,
> +                                     int mmu_idx)
> +{
> +    int ret =3D -1;
> +    bool real_mode =3D (type =3D=3D ACCESS_CODE && msr_ir =3D=3D 0)
> +        || (type !=3D ACCESS_CODE && msr_dr =3D=3D 0);
> +
> +    switch (env->mmu_model) {
> +    case POWERPC_MMU_SOFT_6xx:
> +    case POWERPC_MMU_SOFT_74xx:
> +        if (real_mode) {
> +            ret =3D check_physical(env, ctx, eaddr, access_type);
> +        } else {
> +            /* Try to find a BAT */
> +            if (env->nb_BATs !=3D 0) {
> +                ret =3D get_bat_6xx_tlb(env, ctx, eaddr, access_type);
> +            }
> +            if (ret < 0) {
> +                /* We didn't match any BAT entry or don't have BATs */
> +                ret =3D get_segment_6xx_tlb(env, ctx, eaddr, access_type=
, type);
> +            }
> +        }
> +        break;
> +
> +    case POWERPC_MMU_SOFT_4xx:
> +    case POWERPC_MMU_SOFT_4xx_Z:
> +        if (real_mode) {
> +            ret =3D check_physical(env, ctx, eaddr, access_type);
> +        } else {
> +            ret =3D mmu40x_get_physical_address(env, ctx, eaddr, access_=
type);
> +        }
> +        break;
> +    case POWERPC_MMU_BOOKE:
> +        ret =3D mmubooke_get_physical_address(env, ctx, eaddr, access_ty=
pe);
> +        break;
> +    case POWERPC_MMU_BOOKE206:
> +        ret =3D mmubooke206_get_physical_address(env, ctx, eaddr, access=
_type,
> +                                               mmu_idx);
> +        break;
> +    case POWERPC_MMU_MPC8xx:
> +        /* XXX: TODO */
> +        cpu_abort(env_cpu(env), "MPC8xx MMU model is not implemented\n");
> +        break;
> +    case POWERPC_MMU_REAL:
> +        if (real_mode) {
> +            ret =3D check_physical(env, ctx, eaddr, access_type);
> +        } else {
> +            cpu_abort(env_cpu(env),
> +                      "PowerPC in real mode do not do any translation\n"=
);
> +        }
> +        return -1;
> +    default:
> +        cpu_abort(env_cpu(env), "Unknown or invalid MMU model\n");
> +        return -1;
> +    }
> +
> +    return ret;
> +}
> +
> +int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
> +                                target_ulong eaddr, MMUAccessType access=
_type,
> +                                int type)
> +{
> +    return get_physical_address_wtlb(env, ctx, eaddr, access_type, type,=
 0);
> +}
> +
> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +{
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +    mmu_ctx_t ctx;
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
> +    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
> +                                      ACCESS_INT) !=3D 0)) {
> +
> +        /*
> +         * Some MMUs have separate TLBs for code and data. If we only
> +         * try an ACCESS_INT, we may not be able to read instructions
> +         * mapped by code TLBs, so we also try a ACCESS_CODE.
> +         */
> +        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETC=
H,
> +                                          ACCESS_CODE) !=3D 0)) {
> +            return -1;
> +        }
> +    }
> +
> +    return ctx.raddr & TARGET_PAGE_MASK;
> +}
> +
> +static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong =
address,
> +                                         MMUAccessType access_type, int =
mmu_idx)
> +{
> +    uint32_t epid;
> +    bool as, pr;
> +    uint32_t missed_tid =3D 0;
> +    bool use_epid =3D mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
> +
> +    if (access_type =3D=3D MMU_INST_FETCH) {
> +        as =3D msr_ir;
> +    }
> +    env->spr[SPR_BOOKE_MAS0] =3D env->spr[SPR_BOOKE_MAS4] & MAS4_TLBSELD=
_MASK;
> +    env->spr[SPR_BOOKE_MAS1] =3D env->spr[SPR_BOOKE_MAS4] & MAS4_TSIZED_=
MASK;
> +    env->spr[SPR_BOOKE_MAS2] =3D env->spr[SPR_BOOKE_MAS4] & MAS4_WIMGED_=
MASK;
> +    env->spr[SPR_BOOKE_MAS3] =3D 0;
> +    env->spr[SPR_BOOKE_MAS6] =3D 0;
> +    env->spr[SPR_BOOKE_MAS7] =3D 0;
> +
> +    /* AS */
> +    if (as) {
> +        env->spr[SPR_BOOKE_MAS1] |=3D MAS1_TS;
> +        env->spr[SPR_BOOKE_MAS6] |=3D MAS6_SAS;
> +    }
> +
> +    env->spr[SPR_BOOKE_MAS1] |=3D MAS1_VALID;
> +    env->spr[SPR_BOOKE_MAS2] |=3D address & MAS2_EPN_MASK;
> +
> +    if (!use_epid) {
> +        switch (env->spr[SPR_BOOKE_MAS4] & MAS4_TIDSELD_PIDZ) {
> +        case MAS4_TIDSELD_PID0:
> +            missed_tid =3D env->spr[SPR_BOOKE_PID];
> +            break;
> +        case MAS4_TIDSELD_PID1:
> +            missed_tid =3D env->spr[SPR_BOOKE_PID1];
> +            break;
> +        case MAS4_TIDSELD_PID2:
> +            missed_tid =3D env->spr[SPR_BOOKE_PID2];
> +            break;
> +        }
> +        env->spr[SPR_BOOKE_MAS6] |=3D env->spr[SPR_BOOKE_PID] << 16;
> +    } else {
> +        missed_tid =3D epid;
> +        env->spr[SPR_BOOKE_MAS6] |=3D missed_tid << 16;
> +    }
> +    env->spr[SPR_BOOKE_MAS1] |=3D (missed_tid << MAS1_TID_SHIFT);
> +
> +
> +    /* next victim logic */
> +    env->spr[SPR_BOOKE_MAS0] |=3D env->last_way << MAS0_ESEL_SHIFT;
> +    env->last_way++;
> +    env->last_way &=3D booke206_tlb_ways(env, 0) - 1;
> +    env->spr[SPR_BOOKE_MAS0] |=3D env->last_way << MAS0_NV_SHIFT;
> +}
> +
> +/* Perform address translation */
> +static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong addre=
ss,
> +                                    MMUAccessType access_type, int mmu_i=
dx)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    mmu_ctx_t ctx;
> +    int type;
> +    int ret =3D 0;
> +
> +    if (access_type =3D=3D MMU_INST_FETCH) {
> +        /* code access */
> +        type =3D ACCESS_CODE;
> +    } else {
> +        /* data access */
> +        type =3D env->access_type;
> +    }
> +    ret =3D get_physical_address_wtlb(env, &ctx, address, access_type,
> +                                    type, mmu_idx);
> +    if (ret =3D=3D 0) {
> +        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> +                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
> +                     mmu_idx, TARGET_PAGE_SIZE);
> +        ret =3D 0;
> +    } else if (ret < 0) {
> +        LOG_MMU_STATE(cs);
> +        if (type =3D=3D ACCESS_CODE) {
> +            switch (ret) {
> +            case -1:
> +                /* No matches in page tables or TLB */
> +                switch (env->mmu_model) {
> +                case POWERPC_MMU_SOFT_6xx:
> +                    cs->exception_index =3D POWERPC_EXCP_IFTLB;
> +                    env->error_code =3D 1 << 18;
> +                    env->spr[SPR_IMISS] =3D address;
> +                    env->spr[SPR_ICMP] =3D 0x80000000 | ctx.ptem;
> +                    goto tlb_miss;
> +                case POWERPC_MMU_SOFT_74xx:
> +                    cs->exception_index =3D POWERPC_EXCP_IFTLB;
> +                    goto tlb_miss_74xx;
> +                case POWERPC_MMU_SOFT_4xx:
> +                case POWERPC_MMU_SOFT_4xx_Z:
> +                    cs->exception_index =3D POWERPC_EXCP_ITLB;
> +                    env->error_code =3D 0;
> +                    env->spr[SPR_40x_DEAR] =3D address;
> +                    env->spr[SPR_40x_ESR] =3D 0x00000000;
> +                    break;
> +                case POWERPC_MMU_BOOKE206:
> +                    booke206_update_mas_tlb_miss(env, address, 2, mmu_id=
x);
> +                    /* fall through */
> +                case POWERPC_MMU_BOOKE:
> +                    cs->exception_index =3D POWERPC_EXCP_ITLB;
> +                    env->error_code =3D 0;
> +                    env->spr[SPR_BOOKE_DEAR] =3D address;
> +                    env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 MMU_DATA_LOAD);
> +                    return -1;
> +                case POWERPC_MMU_MPC8xx:
> +                    /* XXX: TODO */
> +                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n=
");
> +                    break;
> +                case POWERPC_MMU_REAL:
> +                    cpu_abort(cs, "PowerPC in real mode should never rai=
se "
> +                              "any MMU exceptions\n");
> +                    return -1;
> +                default:
> +                    cpu_abort(cs, "Unknown or invalid MMU model\n");
> +                    return -1;
> +                }
> +                break;
> +            case -2:
> +                /* Access rights violation */
> +                cs->exception_index =3D POWERPC_EXCP_ISI;
> +                env->error_code =3D 0x08000000;
> +                break;
> +            case -3:
> +                /* No execute protection violation */
> +                if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
> +                    (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206)) {
> +                    env->spr[SPR_BOOKE_ESR] =3D 0x00000000;
> +                }
> +                cs->exception_index =3D POWERPC_EXCP_ISI;
> +                env->error_code =3D 0x10000000;
> +                break;
> +            case -4:
> +                /* Direct store exception */
> +                /* No code fetch is allowed in direct-store areas */
> +                cs->exception_index =3D POWERPC_EXCP_ISI;
> +                env->error_code =3D 0x10000000;
> +                break;
> +            }
> +        } else {
> +            switch (ret) {
> +            case -1:
> +                /* No matches in page tables or TLB */
> +                switch (env->mmu_model) {
> +                case POWERPC_MMU_SOFT_6xx:
> +                    if (access_type =3D=3D MMU_DATA_STORE) {
> +                        cs->exception_index =3D POWERPC_EXCP_DSTLB;
> +                        env->error_code =3D 1 << 16;
> +                    } else {
> +                        cs->exception_index =3D POWERPC_EXCP_DLTLB;
> +                        env->error_code =3D 0;
> +                    }
> +                    env->spr[SPR_DMISS] =3D address;
> +                    env->spr[SPR_DCMP] =3D 0x80000000 | ctx.ptem;
> +                tlb_miss:
> +                    env->error_code |=3D ctx.key << 19;
> +                    env->spr[SPR_HASH1] =3D ppc_hash32_hpt_base(cpu) +
> +                        get_pteg_offset32(cpu, ctx.hash[0]);
> +                    env->spr[SPR_HASH2] =3D ppc_hash32_hpt_base(cpu) +
> +                        get_pteg_offset32(cpu, ctx.hash[1]);
> +                    break;
> +                case POWERPC_MMU_SOFT_74xx:
> +                    if (access_type =3D=3D MMU_DATA_STORE) {
> +                        cs->exception_index =3D POWERPC_EXCP_DSTLB;
> +                    } else {
> +                        cs->exception_index =3D POWERPC_EXCP_DLTLB;
> +                    }
> +                tlb_miss_74xx:
> +                    /* Implement LRU algorithm */
> +                    env->error_code =3D ctx.key << 19;
> +                    env->spr[SPR_TLBMISS] =3D (address & ~((target_ulong=
)0x3)) |
> +                        ((env->last_way + 1) & (env->nb_ways - 1));
> +                    env->spr[SPR_PTEHI] =3D 0x80000000 | ctx.ptem;
> +                    break;
> +                case POWERPC_MMU_SOFT_4xx:
> +                case POWERPC_MMU_SOFT_4xx_Z:
> +                    cs->exception_index =3D POWERPC_EXCP_DTLB;
> +                    env->error_code =3D 0;
> +                    env->spr[SPR_40x_DEAR] =3D address;
> +                    if (access_type =3D=3D MMU_DATA_STORE) {
> +                        env->spr[SPR_40x_ESR] =3D 0x00800000;
> +                    } else {
> +                        env->spr[SPR_40x_ESR] =3D 0x00000000;
> +                    }
> +                    break;
> +                case POWERPC_MMU_MPC8xx:
> +                    /* XXX: TODO */
> +                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n=
");
> +                    break;
> +                case POWERPC_MMU_BOOKE206:
> +                    booke206_update_mas_tlb_miss(env, address, access_ty=
pe, mmu_idx);
> +                    /* fall through */
> +                case POWERPC_MMU_BOOKE:
> +                    cs->exception_index =3D POWERPC_EXCP_DTLB;
> +                    env->error_code =3D 0;
> +                    env->spr[SPR_BOOKE_DEAR] =3D address;
> +                    env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 access_type);
> +                    return -1;
> +                case POWERPC_MMU_REAL:
> +                    cpu_abort(cs, "PowerPC in real mode should never rai=
se "
> +                              "any MMU exceptions\n");
> +                    return -1;
> +                default:
> +                    cpu_abort(cs, "Unknown or invalid MMU model\n");
> +                    return -1;
> +                }
> +                break;
> +            case -2:
> +                /* Access rights violation */
> +                cs->exception_index =3D POWERPC_EXCP_DSI;
> +                env->error_code =3D 0;
> +                if (env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx
> +                    || env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx_Z) {
> +                    env->spr[SPR_40x_DEAR] =3D address;
> +                    if (access_type =3D=3D MMU_DATA_STORE) {
> +                        env->spr[SPR_40x_ESR] |=3D 0x00800000;
> +                    }
> +                } else if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
> +                           (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206))=
 {
> +                    env->spr[SPR_BOOKE_DEAR] =3D address;
> +                    env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 access_type);
> +                } else {
> +                    env->spr[SPR_DAR] =3D address;
> +                    if (access_type =3D=3D MMU_DATA_STORE) {
> +                        env->spr[SPR_DSISR] =3D 0x0A000000;
> +                    } else {
> +                        env->spr[SPR_DSISR] =3D 0x08000000;
> +                    }
> +                }
> +                break;
> +            case -4:
> +                /* Direct store exception */
> +                switch (type) {
> +                case ACCESS_FLOAT:
> +                    /* Floating point load/store */
> +                    cs->exception_index =3D POWERPC_EXCP_ALIGN;
> +                    env->error_code =3D POWERPC_EXCP_ALIGN_FP;
> +                    env->spr[SPR_DAR] =3D address;
> +                    break;
> +                case ACCESS_RES:
> +                    /* lwarx, ldarx or stwcx. */
> +                    cs->exception_index =3D POWERPC_EXCP_DSI;
> +                    env->error_code =3D 0;
> +                    env->spr[SPR_DAR] =3D address;
> +                    if (access_type =3D=3D MMU_DATA_STORE) {
> +                        env->spr[SPR_DSISR] =3D 0x06000000;
> +                    } else {
> +                        env->spr[SPR_DSISR] =3D 0x04000000;
> +                    }
> +                    break;
> +                case ACCESS_EXT:
> +                    /* eciwx or ecowx */
> +                    cs->exception_index =3D POWERPC_EXCP_DSI;
> +                    env->error_code =3D 0;
> +                    env->spr[SPR_DAR] =3D address;
> +                    if (access_type =3D=3D MMU_DATA_STORE) {
> +                        env->spr[SPR_DSISR] =3D 0x06100000;
> +                    } else {
> +                        env->spr[SPR_DSISR] =3D 0x04100000;
> +                    }
> +                    break;
> +                default:
> +                    printf("DSI: invalid exception (%d)\n", ret);
> +                    cs->exception_index =3D POWERPC_EXCP_PROGRAM;
> +                    env->error_code =3D
> +                        POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
> +                    env->spr[SPR_DAR] =3D address;
> +                    break;
> +                }
> +                break;
> +            }
> +        }
> +        ret =3D 1;
> +    }
> +
> +    return ret;
> +}
> +
> +bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
> +                      MMUAccessType access_type, int mmu_idx,
> +                      bool probe, uintptr_t retaddr)
> +{
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +    int ret;
> +
> +    if (pcc->handle_mmu_fault) {
> +        ret =3D pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> +    } else {
> +        ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx=
);
> +    }
> +    if (unlikely(ret !=3D 0)) {
> +        if (probe) {
> +            return false;
> +        }
> +        raise_exception_err_ra(env, cs->exception_index, env->error_code,
> +                               retaddr);
> +    }
> +    return true;
> +}
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 803b66f2b0..dbf7b398cd 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -33,1736 +33,156 @@
>  #include "internal.h"
>  #include "mmu-book3s-v3.h"
>  #include "mmu-radix64.h"
> +#include "exec/helper-proto.h"
> +#include "exec/cpu_ldst.h"
> =20
> -#ifdef CONFIG_TCG
> -#include "exec/helper-proto.h"
> -#include "exec/cpu_ldst.h"
> -#endif
> -/* #define DEBUG_MMU */
> -/* #define DEBUG_BATS */
> -/* #define DEBUG_SOFTWARE_TLB */
> -/* #define DUMP_PAGE_TABLES */
> -/* #define FLUSH_ALL_TLBS */
> -
> -#ifdef DEBUG_MMU
> -#  define LOG_MMU_STATE(cpu) log_cpu_state_mask(CPU_LOG_MMU, (cpu), 0)
> -#else
> -#  define LOG_MMU_STATE(cpu) do { } while (0)
> -#endif
> -
> -#ifdef DEBUG_SOFTWARE_TLB
> -#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
> -#else
> -#  define LOG_SWTLB(...) do { } while (0)
> -#endif
> -
> -#ifdef DEBUG_BATS
> -#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
> -#else
> -#  define LOG_BATS(...) do { } while (0)
> -#endif
> -
> -/***********************************************************************=
******/
> -/* PowerPC MMU emulation */
> -
> -/* Context used internally during MMU translations */
> -typedef struct mmu_ctx_t mmu_ctx_t;
> -struct mmu_ctx_t {
> -    hwaddr raddr;      /* Real address              */
> -    hwaddr eaddr;      /* Effective address         */
> -    int prot;                      /* Protection bits           */
> -    hwaddr hash[2];    /* Pagetable hash values     */
> -    target_ulong ptem;             /* Virtual segment ID | API  */
> -    int key;                       /* Access key                */
> -    int nx;                        /* Non-execute area          */
> -};
> -
> -/* Common routines used by software and hardware TLBs emulation */
> -static inline int pte_is_valid(target_ulong pte0)
> -{
> -    return pte0 & 0x80000000 ? 1 : 0;
> -}
> -
> -static inline void pte_invalidate(target_ulong *pte0)
> -{
> -    *pte0 &=3D ~0x80000000;
> -}
> -
> -#define PTE_PTEM_MASK 0x7FFFFFBF
> -#define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
> -
> -static int pp_check(int key, int pp, int nx)
> -{
> -    int access;
> -
> -    /* Compute access rights */
> -    access =3D 0;
> -    if (key =3D=3D 0) {
> -        switch (pp) {
> -        case 0x0:
> -        case 0x1:
> -        case 0x2:
> -            access |=3D PAGE_WRITE;
> -            /* fall through */
> -        case 0x3:
> -            access |=3D PAGE_READ;
> -            break;
> -        }
> -    } else {
> -        switch (pp) {
> -        case 0x0:
> -            access =3D 0;
> -            break;
> -        case 0x1:
> -        case 0x3:
> -            access =3D PAGE_READ;
> -            break;
> -        case 0x2:
> -            access =3D PAGE_READ | PAGE_WRITE;
> -            break;
> -        }
> -    }
> -    if (nx =3D=3D 0) {
> -        access |=3D PAGE_EXEC;
> -    }
> -
> -    return access;
> -}
> -
> -static int check_prot(int prot, MMUAccessType access_type)
> -{
> -    return prot & prot_for_access_type(access_type) ? 0 : -2;
> -}
> -
> -static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
> -                                target_ulong pte1, int h,
> -                                MMUAccessType access_type)
> -{
> -    target_ulong ptem, mmask;
> -    int access, ret, pteh, ptev, pp;
> -
> -    ret =3D -1;
> -    /* Check validity and table match */
> -    ptev =3D pte_is_valid(pte0);
> -    pteh =3D (pte0 >> 6) & 1;
> -    if (ptev && h =3D=3D pteh) {
> -        /* Check vsid & api */
> -        ptem =3D pte0 & PTE_PTEM_MASK;
> -        mmask =3D PTE_CHECK_MASK;
> -        pp =3D pte1 & 0x00000003;
> -        if (ptem =3D=3D ctx->ptem) {
> -            if (ctx->raddr !=3D (hwaddr)-1ULL) {
> -                /* all matches should have equal RPN, WIMG & PP */
> -                if ((ctx->raddr & mmask) !=3D (pte1 & mmask)) {
> -                    qemu_log_mask(CPU_LOG_MMU, "Bad RPN/WIMG/PP\n");
> -                    return -3;
> -                }
> -            }
> -            /* Compute access rights */
> -            access =3D pp_check(ctx->key, pp, ctx->nx);
> -            /* Keep the matching PTE information */
> -            ctx->raddr =3D pte1;
> -            ctx->prot =3D access;
> -            ret =3D check_prot(ctx->prot, access_type);
> -            if (ret =3D=3D 0) {
> -                /* Access granted */
> -                qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
> -            } else {
> -                /* Access right violation */
> -                qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
> -            }
> -        }
> -    }
> -
> -    return ret;
> -}
> -
> -static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
> -                            int ret, MMUAccessType access_type)
> -{
> -    int store =3D 0;
> -
> -    /* Update page flags */
> -    if (!(*pte1p & 0x00000100)) {
> -        /* Update accessed flag */
> -        *pte1p |=3D 0x00000100;
> -        store =3D 1;
> -    }
> -    if (!(*pte1p & 0x00000080)) {
> -        if (access_type =3D=3D MMU_DATA_STORE && ret =3D=3D 0) {
> -            /* Update changed flag */
> -            *pte1p |=3D 0x00000080;
> -            store =3D 1;
> -        } else {
> -            /* Force page fault for first write access */
> -            ctx->prot &=3D ~PAGE_WRITE;
> -        }
> -    }
> -
> -    return store;
> -}
> -
> -/* Software driven TLB helpers */
> -static inline int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
> -                                    int way, int is_code)
> -{
> -    int nr;
> -
> -    /* Select TLB num in a way from address */
> -    nr =3D (eaddr >> TARGET_PAGE_BITS) & (env->tlb_per_way - 1);
> -    /* Select TLB way */
> -    nr +=3D env->tlb_per_way * way;
> -    /* 6xx have separate TLBs for instructions and data */
> -    if (is_code && env->id_tlbs =3D=3D 1) {
> -        nr +=3D env->nb_tlb;
> -    }
> -
> -    return nr;
> -}
> -
> -static inline void ppc6xx_tlb_invalidate_all(CPUPPCState *env)
> -{
> -    ppc6xx_tlb_t *tlb;
> -    int nr, max;
> -
> -    /* LOG_SWTLB("Invalidate all TLBs\n"); */
> -    /* Invalidate all defined software TLB */
> -    max =3D env->nb_tlb;
> -    if (env->id_tlbs =3D=3D 1) {
> -        max *=3D 2;
> -    }
> -    for (nr =3D 0; nr < max; nr++) {
> -        tlb =3D &env->tlb.tlb6[nr];
> -        pte_invalidate(&tlb->pte0);
> -    }
> -    tlb_flush(env_cpu(env));
> -}
> -
> -static inline void ppc6xx_tlb_invalidate_virt2(CPUPPCState *env,
> -                                               target_ulong eaddr,
> -                                               int is_code, int match_ep=
n)
> -{
> -#if !defined(FLUSH_ALL_TLBS)
> -    CPUState *cs =3D env_cpu(env);
> -    ppc6xx_tlb_t *tlb;
> -    int way, nr;
> -
> -    /* Invalidate ITLB + DTLB, all ways */
> -    for (way =3D 0; way < env->nb_ways; way++) {
> -        nr =3D ppc6xx_tlb_getnum(env, eaddr, way, is_code);
> -        tlb =3D &env->tlb.tlb6[nr];
> -        if (pte_is_valid(tlb->pte0) && (match_epn =3D=3D 0 || eaddr =3D=
=3D tlb->EPN)) {
> -            LOG_SWTLB("TLB invalidate %d/%d " TARGET_FMT_lx "\n", nr,
> -                      env->nb_tlb, eaddr);
> -            pte_invalidate(&tlb->pte0);
> -            tlb_flush_page(cs, tlb->EPN);
> -        }
> -    }
> -#else
> -    /* XXX: PowerPC specification say this is valid as well */
> -    ppc6xx_tlb_invalidate_all(env);
> -#endif
> -}
> -
> -static inline void ppc6xx_tlb_invalidate_virt(CPUPPCState *env,
> -                                              target_ulong eaddr, int is=
_code)
> -{
> -    ppc6xx_tlb_invalidate_virt2(env, eaddr, is_code, 0);
> -}
> -
> -#ifdef CONFIG_TCG
> -static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
> -                             int is_code, target_ulong pte0, target_ulon=
g pte1)
> -{
> -    ppc6xx_tlb_t *tlb;
> -    int nr;
> -
> -    nr =3D ppc6xx_tlb_getnum(env, EPN, way, is_code);
> -    tlb =3D &env->tlb.tlb6[nr];
> -    LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
> -              " PTE1 " TARGET_FMT_lx "\n", nr, env->nb_tlb, EPN, pte0, p=
te1);
> -    /* Invalidate any pending reference in QEMU for this virtual address=
 */
> -    ppc6xx_tlb_invalidate_virt2(env, EPN, is_code, 1);
> -    tlb->pte0 =3D pte0;
> -    tlb->pte1 =3D pte1;
> -    tlb->EPN =3D EPN;
> -    /* Store last way for LRU mechanism */
> -    env->last_way =3D way;
> -}
> -#endif
> -
> -static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
> -                            target_ulong eaddr, MMUAccessType access_typ=
e)
> -{
> -    ppc6xx_tlb_t *tlb;
> -    int nr, best, way;
> -    int ret;
> -
> -    best =3D -1;
> -    ret =3D -1; /* No TLB found */
> -    for (way =3D 0; way < env->nb_ways; way++) {
> -        nr =3D ppc6xx_tlb_getnum(env, eaddr, way, access_type =3D=3D MMU=
_INST_FETCH);
> -        tlb =3D &env->tlb.tlb6[nr];
> -        /* This test "emulates" the PTE index match for hardware TLBs */
> -        if ((eaddr & TARGET_PAGE_MASK) !=3D tlb->EPN) {
> -            LOG_SWTLB("TLB %d/%d %s [" TARGET_FMT_lx " " TARGET_FMT_lx
> -                      "] <> " TARGET_FMT_lx "\n", nr, env->nb_tlb,
> -                      pte_is_valid(tlb->pte0) ? "valid" : "inval",
> -                      tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE, eaddr);
> -            continue;
> -        }
> -        LOG_SWTLB("TLB %d/%d %s " TARGET_FMT_lx " <> " TARGET_FMT_lx " "
> -                  TARGET_FMT_lx " %c %c\n", nr, env->nb_tlb,
> -                  pte_is_valid(tlb->pte0) ? "valid" : "inval",
> -                  tlb->EPN, eaddr, tlb->pte1,
> -                  access_type =3D=3D MMU_DATA_STORE ? 'S' : 'L',
> -                  access_type =3D=3D MMU_INST_FETCH ? 'I' : 'D');
> -        switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
> -                                     0, access_type)) {
> -        case -3:
> -            /* TLB inconsistency */
> -            return -1;
> -        case -2:
> -            /* Access violation */
> -            ret =3D -2;
> -            best =3D nr;
> -            break;
> -        case -1:
> -        default:
> -            /* No match */
> -            break;
> -        case 0:
> -            /* access granted */
> -            /*
> -             * XXX: we should go on looping to check all TLBs
> -             *      consistency but we can speed-up the whole thing as
> -             *      the result would be undefined if TLBs are not
> -             *      consistent.
> -             */
> -            ret =3D 0;
> -            best =3D nr;
> -            goto done;
> -        }
> -    }
> -    if (best !=3D -1) {
> -    done:
> -        LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=3D%01x ret=
=3D%d\n",
> -                  ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
> -        /* Update page flags */
> -        pte_update_flags(ctx, &env->tlb.tlb6[best].pte1, ret, access_typ=
e);
> -    }
> -
> -    return ret;
> -}
> -
> -/* Perform BAT hit & translation */
> -static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
> -                                 int *validp, int *protp, target_ulong *=
BATu,
> -                                 target_ulong *BATl)
> -{
> -    target_ulong bl;
> -    int pp, valid, prot;
> -
> -    bl =3D (*BATu & 0x00001FFC) << 15;
> -    valid =3D 0;
> -    prot =3D 0;
> -    if (((msr_pr =3D=3D 0) && (*BATu & 0x00000002)) ||
> -        ((msr_pr !=3D 0) && (*BATu & 0x00000001))) {
> -        valid =3D 1;
> -        pp =3D *BATl & 0x00000003;
> -        if (pp !=3D 0) {
> -            prot =3D PAGE_READ | PAGE_EXEC;
> -            if (pp =3D=3D 0x2) {
> -                prot |=3D PAGE_WRITE;
> -            }
> -        }
> -    }
> -    *blp =3D bl;
> -    *validp =3D valid;
> -    *protp =3D prot;
> -}
> -
> -static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
> -                           target_ulong virtual, MMUAccessType access_ty=
pe)
> -{
> -    target_ulong *BATlt, *BATut, *BATu, *BATl;
> -    target_ulong BEPIl, BEPIu, bl;
> -    int i, valid, prot;
> -    int ret =3D -1;
> -    bool ifetch =3D access_type =3D=3D MMU_INST_FETCH;
> -
> -    LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
> -             ifetch ? 'I' : 'D', virtual);
> -    if (ifetch) {
> -        BATlt =3D env->IBAT[1];
> -        BATut =3D env->IBAT[0];
> -    } else {
> -        BATlt =3D env->DBAT[1];
> -        BATut =3D env->DBAT[0];
> -    }
> -    for (i =3D 0; i < env->nb_BATs; i++) {
> -        BATu =3D &BATut[i];
> -        BATl =3D &BATlt[i];
> -        BEPIu =3D *BATu & 0xF0000000;
> -        BEPIl =3D *BATu & 0x0FFE0000;
> -        bat_size_prot(env, &bl, &valid, &prot, BATu, BATl);
> -        LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
> -                 " BATl " TARGET_FMT_lx "\n", __func__,
> -                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
> -        if ((virtual & 0xF0000000) =3D=3D BEPIu &&
> -            ((virtual & 0x0FFE0000) & ~bl) =3D=3D BEPIl) {
> -            /* BAT matches */
> -            if (valid !=3D 0) {
> -                /* Get physical address */
> -                ctx->raddr =3D (*BATl & 0xF0000000) |
> -                    ((virtual & 0x0FFE0000 & bl) | (*BATl & 0x0FFE0000))=
 |
> -                    (virtual & 0x0001F000);
> -                /* Compute access rights */
> -                ctx->prot =3D prot;
> -                ret =3D check_prot(ctx->prot, access_type);
> -                if (ret =3D=3D 0) {
> -                    LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=3D=
%c%c\n",
> -                             i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' =
: '-',
> -                             ctx->prot & PAGE_WRITE ? 'W' : '-');
> -                }
> -                break;
> -            }
> -        }
> -    }
> -    if (ret < 0) {
> -#if defined(DEBUG_BATS)
> -        if (qemu_log_enabled()) {
> -            LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", virtual);
> -            for (i =3D 0; i < 4; i++) {
> -                BATu =3D &BATut[i];
> -                BATl =3D &BATlt[i];
> -                BEPIu =3D *BATu & 0xF0000000;
> -                BEPIl =3D *BATu & 0x0FFE0000;
> -                bl =3D (*BATu & 0x00001FFC) << 15;
> -                LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_=
FMT_lx
> -                         " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
> -                         TARGET_FMT_lx " " TARGET_FMT_lx "\n",
> -                         __func__, ifetch ? 'I' : 'D', i, virtual,
> -                         *BATu, *BATl, BEPIu, BEPIl, bl);
> -            }
> -        }
> -#endif
> -    }
> -    /* No hit */
> -    return ret;
> -}
> -
> -/* Perform segment based translation */
> -static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
> -                               target_ulong eaddr, MMUAccessType access_=
type,
> -                               int type)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    hwaddr hash;
> -    target_ulong vsid;
> -    int ds, pr, target_page_bits;
> -    int ret;
> -    target_ulong sr, pgidx;
> -
> -    pr =3D msr_pr;
> -    ctx->eaddr =3D eaddr;
> -
> -    sr =3D env->sr[eaddr >> 28];
> -    ctx->key =3D (((sr & 0x20000000) && (pr !=3D 0)) ||
> -                ((sr & 0x40000000) && (pr =3D=3D 0))) ? 1 : 0;
> -    ds =3D sr & 0x80000000 ? 1 : 0;
> -    ctx->nx =3D sr & 0x10000000 ? 1 : 0;
> -    vsid =3D sr & 0x00FFFFFF;
> -    target_page_bits =3D TARGET_PAGE_BITS;
> -    qemu_log_mask(CPU_LOG_MMU,
> -            "Check segment v=3D" TARGET_FMT_lx " %d " TARGET_FMT_lx
> -            " nip=3D" TARGET_FMT_lx " lr=3D" TARGET_FMT_lx
> -            " ir=3D%d dr=3D%d pr=3D%d %d t=3D%d\n",
> -            eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int)msr_i=
r,
> -            (int)msr_dr, pr !=3D 0 ? 1 : 0, access_type =3D=3D MMU_DATA_=
STORE, type);
> -    pgidx =3D (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
> -    hash =3D vsid ^ pgidx;
> -    ctx->ptem =3D (vsid << 7) | (pgidx >> 10);
> -
> -    qemu_log_mask(CPU_LOG_MMU,
> -            "pte segment: key=3D%d ds %d nx %d vsid " TARGET_FMT_lx "\n",
> -            ctx->key, ds, ctx->nx, vsid);
> -    ret =3D -1;
> -    if (!ds) {
> -        /* Check if instruction fetch is allowed, if needed */
> -        if (type !=3D ACCESS_CODE || ctx->nx =3D=3D 0) {
> -            /* Page address translation */
> -            qemu_log_mask(CPU_LOG_MMU, "htab_base " TARGET_FMT_plx
> -                    " htab_mask " TARGET_FMT_plx
> -                    " hash " TARGET_FMT_plx "\n",
> -                    ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), =
hash);
> -            ctx->hash[0] =3D hash;
> -            ctx->hash[1] =3D ~hash;
> -
> -            /* Initialize real address with an invalid value */
> -            ctx->raddr =3D (hwaddr)-1ULL;
> -            /* Software TLB search */
> -            ret =3D ppc6xx_tlb_check(env, ctx, eaddr, access_type);
> -#if defined(DUMP_PAGE_TABLES)
> -            if (qemu_loglevel_mask(CPU_LOG_MMU)) {
> -                CPUState *cs =3D env_cpu(env);
> -                hwaddr curaddr;
> -                uint32_t a0, a1, a2, a3;
> -
> -                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FM=
T_plx
> -                         "\n", ppc_hash32_hpt_base(cpu),
> -                         ppc_hash32_hpt_mask(env) + 0x80);
> -                for (curaddr =3D ppc_hash32_hpt_base(cpu);
> -                     curaddr < (ppc_hash32_hpt_base(cpu)
> -                                + ppc_hash32_hpt_mask(cpu) + 0x80);
> -                     curaddr +=3D 16) {
> -                    a0 =3D ldl_phys(cs->as, curaddr);
> -                    a1 =3D ldl_phys(cs->as, curaddr + 4);
> -                    a2 =3D ldl_phys(cs->as, curaddr + 8);
> -                    a3 =3D ldl_phys(cs->as, curaddr + 12);
> -                    if (a0 !=3D 0 || a1 !=3D 0 || a2 !=3D 0 || a3 !=3D 0=
) {
> -                        qemu_log(TARGET_FMT_plx ": %08x %08x %08x %08x\n=
",
> -                                 curaddr, a0, a1, a2, a3);
> -                    }
> -                }
> -            }
> -#endif
> -        } else {
> -            qemu_log_mask(CPU_LOG_MMU, "No access allowed\n");
> -            ret =3D -3;
> -        }
> -    } else {
> -        target_ulong sr;
> -
> -        qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
> -        /* Direct-store segment : absolutely *BUGGY* for now */
> -
> -        /*
> -         * Direct-store implies a 32-bit MMU.
> -         * Check the Segment Register's bus unit ID (BUID).
> -         */
> -        sr =3D env->sr[eaddr >> 28];
> -        if ((sr & 0x1FF00000) >> 20 =3D=3D 0x07f) {
> -            /*
> -             * Memory-forced I/O controller interface access
> -             *
> -             * If T=3D1 and BUID=3Dx'07F', the 601 performs a memory
> -             * access to SR[28-31] LA[4-31], bypassing all protection
> -             * mechanisms.
> -             */
> -            ctx->raddr =3D ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
> -            ctx->prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> -            return 0;
> -        }
> -
> -        switch (type) {
> -        case ACCESS_INT:
> -            /* Integer load/store : only access allowed */
> -            break;
> -        case ACCESS_CODE:
> -            /* No code fetch is allowed in direct-store areas */
> -            return -4;
> -        case ACCESS_FLOAT:
> -            /* Floating point load/store */
> -            return -4;
> -        case ACCESS_RES:
> -            /* lwarx, ldarx or srwcx. */
> -            return -4;
> -        case ACCESS_CACHE:
> -            /*
> -             * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
> -             *
> -             * Should make the instruction do no-op.  As it already do
> -             * no-op, it's quite easy :-)
> -             */
> -            ctx->raddr =3D eaddr;
> -            return 0;
> -        case ACCESS_EXT:
> -            /* eciwx or ecowx */
> -            return -4;
> -        default:
> -            qemu_log_mask(CPU_LOG_MMU, "ERROR: instruction should not ne=
ed "
> -                          "address translation\n");
> -            return -4;
> -        }
> -        if ((access_type =3D=3D MMU_DATA_STORE || ctx->key !=3D 1) &&
> -            (access_type =3D=3D MMU_DATA_LOAD || ctx->key !=3D 0)) {
> -            ctx->raddr =3D eaddr;
> -            ret =3D 2;
> -        } else {
> -            ret =3D -2;
> -        }
> -    }
> -
> -    return ret;
> -}
> -
> -/* Generic TLB check function for embedded PowerPC implementations */
> -static int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
> -                            hwaddr *raddrp,
> -                            target_ulong address, uint32_t pid, int ext,
> -                            int i)
> -{
> -    target_ulong mask;
> -
> -    /* Check valid flag */
> -    if (!(tlb->prot & PAGE_VALID)) {
> -        return -1;
> -    }
> -    mask =3D ~(tlb->size - 1);
> -    LOG_SWTLB("%s: TLB %d address " TARGET_FMT_lx " PID %u <=3D> " TARGE=
T_FMT_lx
> -              " " TARGET_FMT_lx " %u %x\n", __func__, i, address, pid, t=
lb->EPN,
> -              mask, (uint32_t)tlb->PID, tlb->prot);
> -    /* Check PID */
> -    if (tlb->PID !=3D 0 && tlb->PID !=3D pid) {
> -        return -1;
> -    }
> -    /* Check effective address */
> -    if ((address & mask) !=3D tlb->EPN) {
> -        return -1;
> -    }
> -    *raddrp =3D (tlb->RPN & mask) | (address & ~mask);
> -    if (ext) {
> -        /* Extend the physical address to 36 bits */
> -        *raddrp |=3D (uint64_t)(tlb->RPN & 0xF) << 32;
> -    }
> -
> -    return 0;
> -}
> -
> -#ifdef CONFIG_TCG
> -/* Generic TLB search function for PowerPC embedded implementations */
> -static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
> -                             uint32_t pid)
> -{
> -    ppcemb_tlb_t *tlb;
> -    hwaddr raddr;
> -    int i, ret;
> -
> -    /* Default return value is no match */
> -    ret =3D -1;
> -    for (i =3D 0; i < env->nb_tlb; i++) {
> -        tlb =3D &env->tlb.tlbe[i];
> -        if (ppcemb_tlb_check(env, tlb, &raddr, address, pid, 0, i) =3D=
=3D 0) {
> -            ret =3D i;
> -            break;
> -        }
> -    }
> -
> -    return ret;
> -}
> -#endif
> -
> -/* Helpers specific to PowerPC 40x implementations */
> -static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
> -{
> -    ppcemb_tlb_t *tlb;
> -    int i;
> -
> -    for (i =3D 0; i < env->nb_tlb; i++) {
> -        tlb =3D &env->tlb.tlbe[i];
> -        tlb->prot &=3D ~PAGE_VALID;
> -    }
> -    tlb_flush(env_cpu(env));
> -}
> -
> -static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
> -                                       target_ulong address,
> -                                       MMUAccessType access_type)
> -{
> -    ppcemb_tlb_t *tlb;
> -    hwaddr raddr;
> -    int i, ret, zsel, zpr, pr;
> -
> -    ret =3D -1;
> -    raddr =3D (hwaddr)-1ULL;
> -    pr =3D msr_pr;
> -    for (i =3D 0; i < env->nb_tlb; i++) {
> -        tlb =3D &env->tlb.tlbe[i];
> -        if (ppcemb_tlb_check(env, tlb, &raddr, address,
> -                             env->spr[SPR_40x_PID], 0, i) < 0) {
> -            continue;
> -        }
> -        zsel =3D (tlb->attr >> 4) & 0xF;
> -        zpr =3D (env->spr[SPR_40x_ZPR] >> (30 - (2 * zsel))) & 0x3;
> -        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
> -                    __func__, i, zsel, zpr, access_type, tlb->attr);
> -        /* Check execute enable bit */
> -        switch (zpr) {
> -        case 0x2:
> -            if (pr !=3D 0) {
> -                goto check_perms;
> -            }
> -            /* fall through */
> -        case 0x3:
> -            /* All accesses granted */
> -            ctx->prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> -            ret =3D 0;
> -            break;
> -        case 0x0:
> -            if (pr !=3D 0) {
> -                /* Raise Zone protection fault.  */
> -                env->spr[SPR_40x_ESR] =3D 1 << 22;
> -                ctx->prot =3D 0;
> -                ret =3D -2;
> -                break;
> -            }
> -            /* fall through */
> -        case 0x1:
> -        check_perms:
> -            /* Check from TLB entry */
> -            ctx->prot =3D tlb->prot;
> -            ret =3D check_prot(ctx->prot, access_type);
> -            if (ret =3D=3D -2) {
> -                env->spr[SPR_40x_ESR] =3D 0;
> -            }
> -            break;
> -        }
> -        if (ret >=3D 0) {
> -            ctx->raddr =3D raddr;
> -            LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGE=
T_FMT_plx
> -                      " %d %d\n", __func__, address, ctx->raddr, ctx->pr=
ot,
> -                      ret);
> -            return 0;
> -        }
> -    }
> -    LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FMT_plx
> -              " %d %d\n", __func__, address, raddr, ctx->prot, ret);
> -
> -    return ret;
> -}
> -
> -void store_40x_sler(CPUPPCState *env, uint32_t val)
> -{
> -    /* XXX: TO BE FIXED */
> -    if (val !=3D 0x00000000) {
> -        cpu_abort(env_cpu(env),
> -                  "Little-endian regions are not supported by now\n");
> -    }
> -    env->spr[SPR_405_SLER] =3D val;
> -}
> -
> -static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
> -                              hwaddr *raddr, int *prot, target_ulong add=
ress,
> -                              MMUAccessType access_type, int i)
> -{
> -    int prot2;
> -
> -    if (ppcemb_tlb_check(env, tlb, raddr, address,
> -                         env->spr[SPR_BOOKE_PID],
> -                         !env->nb_pids, i) >=3D 0) {
> -        goto found_tlb;
> -    }
> -
> -    if (env->spr[SPR_BOOKE_PID1] &&
> -        ppcemb_tlb_check(env, tlb, raddr, address,
> -                         env->spr[SPR_BOOKE_PID1], 0, i) >=3D 0) {
> -        goto found_tlb;
> -    }
> -
> -    if (env->spr[SPR_BOOKE_PID2] &&
> -        ppcemb_tlb_check(env, tlb, raddr, address,
> -                         env->spr[SPR_BOOKE_PID2], 0, i) >=3D 0) {
> -        goto found_tlb;
> -    }
> -
> -    LOG_SWTLB("%s: TLB entry not found\n", __func__);
> -    return -1;
> -
> -found_tlb:
> -
> -    if (msr_pr !=3D 0) {
> -        prot2 =3D tlb->prot & 0xF;
> -    } else {
> -        prot2 =3D (tlb->prot >> 4) & 0xF;
> -    }
> -
> -    /* Check the address space */
> -    if ((access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr) !=3D (tlb-=
>attr & 1)) {
> -        LOG_SWTLB("%s: AS doesn't match\n", __func__);
> -        return -1;
> -    }
> -
> -    *prot =3D prot2;
> -    if (prot2 & prot_for_access_type(access_type)) {
> -        LOG_SWTLB("%s: good TLB!\n", __func__);
> -        return 0;
> -    }
> -
> -    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
> -    return access_type =3D=3D MMU_INST_FETCH ? -3 : -2;
> -}
> -
> -static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ct=
x,
> -                                         target_ulong address,
> -                                         MMUAccessType access_type)
> -{
> -    ppcemb_tlb_t *tlb;
> -    hwaddr raddr;
> -    int i, ret;
> -
> -    ret =3D -1;
> -    raddr =3D (hwaddr)-1ULL;
> -    for (i =3D 0; i < env->nb_tlb; i++) {
> -        tlb =3D &env->tlb.tlbe[i];
> -        ret =3D mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address,
> -                                 access_type, i);
> -        if (ret !=3D -1) {
> -            break;
> -        }
> -    }
> -
> -    if (ret >=3D 0) {
> -        ctx->raddr =3D raddr;
> -        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> -                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
> -                  ret);
> -    } else {
> -        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> -                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
> -    }
> -
> -    return ret;
> -}
> -
> -#ifdef CONFIG_TCG
> -static void booke206_flush_tlb(CPUPPCState *env, int flags,
> -                               const int check_iprot)
> -{
> -    int tlb_size;
> -    int i, j;
> -    ppcmas_tlb_t *tlb =3D env->tlb.tlbm;
> -
> -    for (i =3D 0; i < BOOKE206_MAX_TLBN; i++) {
> -        if (flags & (1 << i)) {
> -            tlb_size =3D booke206_tlb_size(env, i);
> -            for (j =3D 0; j < tlb_size; j++) {
> -                if (!check_iprot || !(tlb[j].mas1 & MAS1_IPROT)) {
> -                    tlb[j].mas1 &=3D ~MAS1_VALID;
> -                }
> -            }
> -        }
> -        tlb +=3D booke206_tlb_size(env, i);
> -    }
> -
> -    tlb_flush(env_cpu(env));
> -}
> -#endif
> -
> -static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
> -                                        ppcmas_tlb_t *tlb)
> -{
> -    int tlbm_size;
> -
> -    tlbm_size =3D (tlb->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
> -
> -    return 1024ULL << tlbm_size;
> -}
> -
> -/* TLB check function for MAS based SoftTLBs */
> -static int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
> -                            hwaddr *raddrp, target_ulong address,
> -                            uint32_t pid)
> -{
> -    hwaddr mask;
> -    uint32_t tlb_pid;
> -
> -    if (!msr_cm) {
> -        /* In 32bit mode we can only address 32bit EAs */
> -        address =3D (uint32_t)address;
> -    }
> -
> -    /* Check valid flag */
> -    if (!(tlb->mas1 & MAS1_VALID)) {
> -        return -1;
> -    }
> -
> -    mask =3D ~(booke206_tlb_to_page_size(env, tlb) - 1);
> -    LOG_SWTLB("%s: TLB ADDR=3D0x" TARGET_FMT_lx " PID=3D0x%x MAS1=3D0x%x=
 MAS2=3D0x%"
> -              PRIx64 " mask=3D0x%" HWADDR_PRIx " MAS7_3=3D0x%" PRIx64 " =
MAS8=3D0x%"
> -              PRIx32 "\n", __func__, address, pid, tlb->mas1, tlb->mas2,=
 mask,
> -              tlb->mas7_3, tlb->mas8);
> -
> -    /* Check PID */
> -    tlb_pid =3D (tlb->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT;
> -    if (tlb_pid !=3D 0 && tlb_pid !=3D pid) {
> -        return -1;
> -    }
> -
> -    /* Check effective address */
> -    if ((address & mask) !=3D (tlb->mas2 & MAS2_EPN_MASK)) {
> -        return -1;
> -    }
> -
> -    if (raddrp) {
> -        *raddrp =3D (tlb->mas7_3 & mask) | (address & ~mask);
> -    }
> -
> -    return 0;
> -}
> -
> -static bool is_epid_mmu(int mmu_idx)
> -{
> -    return mmu_idx =3D=3D PPC_TLB_EPID_STORE || mmu_idx =3D=3D PPC_TLB_E=
PID_LOAD;
> -}
> -
> -static uint32_t mmubooke206_esr(int mmu_idx, MMUAccessType access_type)
> -{
> -    uint32_t esr =3D 0;
> -    if (access_type =3D=3D MMU_DATA_STORE) {
> -        esr |=3D ESR_ST;
> -    }
> -    if (is_epid_mmu(mmu_idx)) {
> -        esr |=3D ESR_EPID;
> -    }
> -    return esr;
> -}
> -
> -/*
> - * Get EPID register given the mmu_idx. If this is regular load,
> - * construct the EPID access bits from current processor state
> - *
> - * Get the effective AS and PR bits and the PID. The PID is returned
> - * only if EPID load is requested, otherwise the caller must detect
> - * the correct EPID.  Return true if valid EPID is returned.
> - */
> -static bool mmubooke206_get_as(CPUPPCState *env,
> -                               int mmu_idx, uint32_t *epid_out,
> -                               bool *as_out, bool *pr_out)
> -{
> -    if (is_epid_mmu(mmu_idx)) {
> -        uint32_t epidr;
> -        if (mmu_idx =3D=3D PPC_TLB_EPID_STORE) {
> -            epidr =3D env->spr[SPR_BOOKE_EPSC];
> -        } else {
> -            epidr =3D env->spr[SPR_BOOKE_EPLC];
> -        }
> -        *epid_out =3D (epidr & EPID_EPID) >> EPID_EPID_SHIFT;
> -        *as_out =3D !!(epidr & EPID_EAS);
> -        *pr_out =3D !!(epidr & EPID_EPR);
> -        return true;
> -    } else {
> -        *as_out =3D msr_ds;
> -        *pr_out =3D msr_pr;
> -        return false;
> -    }
> -}
> -
> -/* Check if the tlb found by hashing really matches */
> -static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
> -                                 hwaddr *raddr, int *prot,
> -                                 target_ulong address,
> -                                 MMUAccessType access_type, int mmu_idx)
> -{
> -    int prot2 =3D 0;
> -    uint32_t epid;
> -    bool as, pr;
> -    bool use_epid =3D mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
> -
> -    if (!use_epid) {
> -        if (ppcmas_tlb_check(env, tlb, raddr, address,
> -                             env->spr[SPR_BOOKE_PID]) >=3D 0) {
> -            goto found_tlb;
> -        }
> -
> -        if (env->spr[SPR_BOOKE_PID1] &&
> -            ppcmas_tlb_check(env, tlb, raddr, address,
> -                             env->spr[SPR_BOOKE_PID1]) >=3D 0) {
> -            goto found_tlb;
> -        }
> -
> -        if (env->spr[SPR_BOOKE_PID2] &&
> -            ppcmas_tlb_check(env, tlb, raddr, address,
> -                             env->spr[SPR_BOOKE_PID2]) >=3D 0) {
> -            goto found_tlb;
> -        }
> -    } else {
> -        if (ppcmas_tlb_check(env, tlb, raddr, address, epid) >=3D 0) {
> -            goto found_tlb;
> -        }
> -    }
> -
> -    LOG_SWTLB("%s: TLB entry not found\n", __func__);
> -    return -1;
> -
> -found_tlb:
> -
> -    if (pr) {
> -        if (tlb->mas7_3 & MAS3_UR) {
> -            prot2 |=3D PAGE_READ;
> -        }
> -        if (tlb->mas7_3 & MAS3_UW) {
> -            prot2 |=3D PAGE_WRITE;
> -        }
> -        if (tlb->mas7_3 & MAS3_UX) {
> -            prot2 |=3D PAGE_EXEC;
> -        }
> -    } else {
> -        if (tlb->mas7_3 & MAS3_SR) {
> -            prot2 |=3D PAGE_READ;
> -        }
> -        if (tlb->mas7_3 & MAS3_SW) {
> -            prot2 |=3D PAGE_WRITE;
> -        }
> -        if (tlb->mas7_3 & MAS3_SX) {
> -            prot2 |=3D PAGE_EXEC;
> -        }
> -    }
> -
> -    /* Check the address space and permissions */
> -    if (access_type =3D=3D MMU_INST_FETCH) {
> -        /* There is no way to fetch code using epid load */
> -        assert(!use_epid);
> -        as =3D msr_ir;
> -    }
> -
> -    if (as !=3D ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
> -        LOG_SWTLB("%s: AS doesn't match\n", __func__);
> -        return -1;
> -    }
> -
> -    *prot =3D prot2;
> -    if (prot2 & prot_for_access_type(access_type)) {
> -        LOG_SWTLB("%s: good TLB!\n", __func__);
> -        return 0;
> -    }
> -
> -    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
> -    return access_type =3D=3D MMU_INST_FETCH ? -3 : -2;
> -}
> -
> -static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t =
*ctx,
> -                                            target_ulong address,
> -                                            MMUAccessType access_type,
> -                                            int mmu_idx)
> -{
> -    ppcmas_tlb_t *tlb;
> -    hwaddr raddr;
> -    int i, j, ret;
> -
> -    ret =3D -1;
> -    raddr =3D (hwaddr)-1ULL;
> -
> -    for (i =3D 0; i < BOOKE206_MAX_TLBN; i++) {
> -        int ways =3D booke206_tlb_ways(env, i);
> -
> -        for (j =3D 0; j < ways; j++) {
> -            tlb =3D booke206_get_tlbm(env, i, address, j);
> -            if (!tlb) {
> -                continue;
> -            }
> -            ret =3D mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, =
address,
> -                                        access_type, mmu_idx);
> -            if (ret !=3D -1) {
> -                goto found_tlb;
> -            }
> -        }
> -    }
> -
> -found_tlb:
> -
> -    if (ret >=3D 0) {
> -        ctx->raddr =3D raddr;
> -        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> -                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
> -                  ret);
> -    } else {
> -        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
> -                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
> -    }
> -
> -    return ret;
> -}
> -
> -static const char *book3e_tsize_to_str[32] =3D {
> -    "1K", "2K", "4K", "8K", "16K", "32K", "64K", "128K", "256K", "512K",
> -    "1M", "2M", "4M", "8M", "16M", "32M", "64M", "128M", "256M", "512M",
> -    "1G", "2G", "4G", "8G", "16G", "32G", "64G", "128G", "256G", "512G",
> -    "1T", "2T"
> -};
> -
> -static void mmubooke_dump_mmu(CPUPPCState *env)
> -{
> -    ppcemb_tlb_t *entry;
> -    int i;
> -
> -    if (kvm_enabled() && !env->kvm_sw_tlb) {
> -        qemu_printf("Cannot access KVM TLB\n");
> -        return;
> -    }
> -
> -    qemu_printf("\nTLB:\n");
> -    qemu_printf("Effective          Physical           Size PID   Prot  =
   "
> -                "Attr\n");
> -
> -    entry =3D &env->tlb.tlbe[0];
> -    for (i =3D 0; i < env->nb_tlb; i++, entry++) {
> -        hwaddr ea, pa;
> -        target_ulong mask;
> -        uint64_t size =3D (uint64_t)entry->size;
> -        char size_buf[20];
> -
> -        /* Check valid flag */
> -        if (!(entry->prot & PAGE_VALID)) {
> -            continue;
> -        }
> -
> -        mask =3D ~(entry->size - 1);
> -        ea =3D entry->EPN & mask;
> -        pa =3D entry->RPN & mask;
> -        /* Extend the physical address to 36 bits */
> -        pa |=3D (hwaddr)(entry->RPN & 0xF) << 32;
> -        if (size >=3D 1 * MiB) {
> -            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size /=
 MiB);
> -        } else {
> -            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size /=
 KiB);
> -        }
> -        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x=
\n",
> -                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entr=
y->PID,
> -                    entry->prot, entry->attr);
> -    }
> -
> -}
> -
> -static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int off=
set,
> -                                     int tlbsize)
> -{
> -    ppcmas_tlb_t *entry;
> -    int i;
> -
> -    qemu_printf("\nTLB%d:\n", tlbn);
> -    qemu_printf("Effective          Physical           Size TID   TS SRW=
X"
> -                " URWX WIMGE U0123\n");
> -
> -    entry =3D &env->tlb.tlbm[offset];
> -    for (i =3D 0; i < tlbsize; i++, entry++) {
> -        hwaddr ea, pa, size;
> -        int tsize;
> -
> -        if (!(entry->mas1 & MAS1_VALID)) {
> -            continue;
> -        }
> -
> -        tsize =3D (entry->mas1 & MAS1_TSIZE_MASK) >> MAS1_TSIZE_SHIFT;
> -        size =3D 1024ULL << tsize;
> -        ea =3D entry->mas2 & ~(size - 1);
> -        pa =3D entry->mas7_3 & ~(size - 1);
> -
> -        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c=
%c%c"
> -                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
> -                    (uint64_t)ea, (uint64_t)pa,
> -                    book3e_tsize_to_str[tsize],
> -                    (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
> -                    (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
> -                    entry->mas7_3 & MAS3_SR ? 'R' : '-',
> -                    entry->mas7_3 & MAS3_SW ? 'W' : '-',
> -                    entry->mas7_3 & MAS3_SX ? 'X' : '-',
> -                    entry->mas7_3 & MAS3_UR ? 'R' : '-',
> -                    entry->mas7_3 & MAS3_UW ? 'W' : '-',
> -                    entry->mas7_3 & MAS3_UX ? 'X' : '-',
> -                    entry->mas2 & MAS2_W ? 'W' : '-',
> -                    entry->mas2 & MAS2_I ? 'I' : '-',
> -                    entry->mas2 & MAS2_M ? 'M' : '-',
> -                    entry->mas2 & MAS2_G ? 'G' : '-',
> -                    entry->mas2 & MAS2_E ? 'E' : '-',
> -                    entry->mas7_3 & MAS3_U0 ? '0' : '-',
> -                    entry->mas7_3 & MAS3_U1 ? '1' : '-',
> -                    entry->mas7_3 & MAS3_U2 ? '2' : '-',
> -                    entry->mas7_3 & MAS3_U3 ? '3' : '-');
> -    }
> -}
> -
> -static void mmubooke206_dump_mmu(CPUPPCState *env)
> -{
> -    int offset =3D 0;
> -    int i;
> -
> -    if (kvm_enabled() && !env->kvm_sw_tlb) {
> -        qemu_printf("Cannot access KVM TLB\n");
> -        return;
> -    }
> +/* #define DEBUG_BATS */
> +/* #define DEBUG_SOFTWARE_TLB */
> +/* #define DUMP_PAGE_TABLES */
> +/* #define FLUSH_ALL_TLBS */
> =20
> -    for (i =3D 0; i < BOOKE206_MAX_TLBN; i++) {
> -        int size =3D booke206_tlb_size(env, i);
> +#ifdef DEBUG_SOFTWARE_TLB
> +#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
> +#else
> +#  define LOG_SWTLB(...) do { } while (0)
> +#endif
> =20
> -        if (size =3D=3D 0) {
> -            continue;
> -        }
> +#ifdef DEBUG_BATS
> +#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
> +#else
> +#  define LOG_BATS(...) do { } while (0)
> +#endif
> =20
> -        mmubooke206_dump_one_tlb(env, i, offset, size);
> -        offset +=3D size;
> -    }
> -}
> +/***********************************************************************=
******/
> +/* PowerPC MMU emulation */
> =20
> -static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
> +/* Software driven TLB helpers */
> +static inline void ppc6xx_tlb_invalidate_all(CPUPPCState *env)
>  {
> -    target_ulong *BATlt, *BATut, *BATu, *BATl;
> -    target_ulong BEPIl, BEPIu, bl;
> -    int i;
> +    ppc6xx_tlb_t *tlb;
> +    int nr, max;
> =20
> -    switch (type) {
> -    case ACCESS_CODE:
> -        BATlt =3D env->IBAT[1];
> -        BATut =3D env->IBAT[0];
> -        break;
> -    default:
> -        BATlt =3D env->DBAT[1];
> -        BATut =3D env->DBAT[0];
> -        break;
> +    /* LOG_SWTLB("Invalidate all TLBs\n"); */
> +    /* Invalidate all defined software TLB */
> +    max =3D env->nb_tlb;
> +    if (env->id_tlbs =3D=3D 1) {
> +        max *=3D 2;
>      }
> -
> -    for (i =3D 0; i < env->nb_BATs; i++) {
> -        BATu =3D &BATut[i];
> -        BATl =3D &BATlt[i];
> -        BEPIu =3D *BATu & 0xF0000000;
> -        BEPIl =3D *BATu & 0x0FFE0000;
> -        bl =3D (*BATu & 0x00001FFC) << 15;
> -        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
> -                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
> -                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
> -                    type =3D=3D ACCESS_CODE ? "code" : "data", i,
> -                    *BATu, *BATl, BEPIu, BEPIl, bl);
> +    for (nr =3D 0; nr < max; nr++) {
> +        tlb =3D &env->tlb.tlb6[nr];
> +        pte_invalidate(&tlb->pte0);
>      }
> +    tlb_flush(env_cpu(env));
>  }
> =20
> -static void mmu6xx_dump_mmu(CPUPPCState *env)
> +static inline void ppc6xx_tlb_invalidate_virt2(CPUPPCState *env,
> +                                               target_ulong eaddr,
> +                                               int is_code, int match_ep=
n)
>  {
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> +#if !defined(FLUSH_ALL_TLBS)
> +    CPUState *cs =3D env_cpu(env);
>      ppc6xx_tlb_t *tlb;
> -    target_ulong sr;
> -    int type, way, entry, i;
> -
> -    qemu_printf("HTAB base =3D 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(=
cpu));
> -    qemu_printf("HTAB mask =3D 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(=
cpu));
> -
> -    qemu_printf("\nSegment registers:\n");
> -    for (i =3D 0; i < 32; i++) {
> -        sr =3D env->sr[i];
> -        if (sr & 0x80000000) {
> -            qemu_printf("%02d T=3D%d Ks=3D%d Kp=3D%d BUID=3D0x%03x "
> -                        "CNTLR_SPEC=3D0x%05x\n", i,
> -                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
> -                        sr & 0x20000000 ? 1 : 0, (uint32_t)((sr >> 20) &=
 0x1FF),
> -                        (uint32_t)(sr & 0xFFFFF));
> -        } else {
> -            qemu_printf("%02d T=3D%d Ks=3D%d Kp=3D%d N=3D%d VSID=3D0x%06=
x\n", i,
> -                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
> -                        sr & 0x20000000 ? 1 : 0, sr & 0x10000000 ? 1 : 0,
> -                        (uint32_t)(sr & 0x00FFFFFF));
> -        }
> -    }
> -
> -    qemu_printf("\nBATs:\n");
> -    mmu6xx_dump_BATs(env, ACCESS_INT);
> -    mmu6xx_dump_BATs(env, ACCESS_CODE);
> -
> -    if (env->id_tlbs !=3D 1) {
> -        qemu_printf("ERROR: 6xx MMU should have separated TLB"
> -                    " for code and data\n");
> -    }
> +    int way, nr;
> =20
> -    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
> -
> -    for (type =3D 0; type < 2; type++) {
> -        for (way =3D 0; way < env->nb_ways; way++) {
> -            for (entry =3D env->nb_tlb * type + env->tlb_per_way * way;
> -                 entry < (env->nb_tlb * type + env->tlb_per_way * (way +=
 1));
> -                 entry++) {
> -
> -                tlb =3D &env->tlb.tlb6[entry];
> -                qemu_printf("%s TLB %02d/%02d way:%d %s ["
> -                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
> -                            type ? "code" : "data", entry % env->nb_tlb,
> -                            env->nb_tlb, way,
> -                            pte_is_valid(tlb->pte0) ? "valid" : "inval",
> -                            tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE);
> -            }
> +    /* Invalidate ITLB + DTLB, all ways */
> +    for (way =3D 0; way < env->nb_ways; way++) {
> +        nr =3D ppc6xx_tlb_getnum(env, eaddr, way, is_code);
> +        tlb =3D &env->tlb.tlb6[nr];
> +        if (pte_is_valid(tlb->pte0) && (match_epn =3D=3D 0 || eaddr =3D=
=3D tlb->EPN)) {
> +            LOG_SWTLB("TLB invalidate %d/%d " TARGET_FMT_lx "\n", nr,
> +                      env->nb_tlb, eaddr);
> +            pte_invalidate(&tlb->pte0);
> +            tlb_flush_page(cs, tlb->EPN);
>          }
>      }
> -}
> -
> -void dump_mmu(CPUPPCState *env)
> -{
> -    switch (env->mmu_model) {
> -    case POWERPC_MMU_BOOKE:
> -        mmubooke_dump_mmu(env);
> -        break;
> -    case POWERPC_MMU_BOOKE206:
> -        mmubooke206_dump_mmu(env);
> -        break;
> -    case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
> -        mmu6xx_dump_mmu(env);
> -        break;
> -#if defined(TARGET_PPC64)
> -    case POWERPC_MMU_64B:
> -    case POWERPC_MMU_2_03:
> -    case POWERPC_MMU_2_06:
> -    case POWERPC_MMU_2_07:
> -        dump_slb(env_archcpu(env));
> -        break;
> -    case POWERPC_MMU_3_00:
> -        if (ppc64_v3_radix(env_archcpu(env))) {
> -            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n=
",
> -                          __func__);
> -        } else {
> -            dump_slb(env_archcpu(env));
> -        }
> -        break;
> +#else
> +    /* XXX: PowerPC specification say this is valid as well */
> +    ppc6xx_tlb_invalidate_all(env);
>  #endif
> -    default:
> -        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
> -    }
>  }
> =20
> -static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong=
 eaddr,
> -                          MMUAccessType access_type)
> +static inline void ppc6xx_tlb_invalidate_virt(CPUPPCState *env,
> +                                              target_ulong eaddr, int is=
_code)
>  {
> -    int in_plb, ret;
> -
> -    ctx->raddr =3D eaddr;
> -    ctx->prot =3D PAGE_READ | PAGE_EXEC;
> -    ret =3D 0;
> -    switch (env->mmu_model) {
> -    case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
> -    case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_REAL:
> -    case POWERPC_MMU_BOOKE:
> -        ctx->prot |=3D PAGE_WRITE;
> -        break;
> -
> -    case POWERPC_MMU_SOFT_4xx_Z:
> -        if (unlikely(msr_pe !=3D 0)) {
> -            /*
> -             * 403 family add some particular protections, using
> -             * PBL/PBU registers for accesses with no translation.
> -             */
> -            in_plb =3D
> -                /* Check PLB validity */
> -                (env->pb[0] < env->pb[1] &&
> -                 /* and address in plb area */
> -                 eaddr >=3D env->pb[0] && eaddr < env->pb[1]) ||
> -                (env->pb[2] < env->pb[3] &&
> -                 eaddr >=3D env->pb[2] && eaddr < env->pb[3]) ? 1 : 0;
> -            if (in_plb ^ msr_px) {
> -                /* Access in protected area */
> -                if (access_type =3D=3D MMU_DATA_STORE) {
> -                    /* Access is not allowed */
> -                    ret =3D -2;
> -                }
> -            } else {
> -                /* Read-write access is allowed */
> -                ctx->prot |=3D PAGE_WRITE;
> -            }
> -        }
> -        break;
> -
> -    default:
> -        /* Caller's checks mean we should never get here for other model=
s */
> -        abort();
> -        return -1;
> -    }
> -
> -    return ret;
> +    ppc6xx_tlb_invalidate_virt2(env, eaddr, is_code, 0);
>  }
> =20
> -static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
> -                                     target_ulong eaddr,
> -                                     MMUAccessType access_type, int type,
> -                                     int mmu_idx)
> +static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
> +                             int is_code, target_ulong pte0, target_ulon=
g pte1)
>  {
> -    int ret =3D -1;
> -    bool real_mode =3D (type =3D=3D ACCESS_CODE && msr_ir =3D=3D 0)
> -        || (type !=3D ACCESS_CODE && msr_dr =3D=3D 0);
> -
> -    switch (env->mmu_model) {
> -    case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
> -        if (real_mode) {
> -            ret =3D check_physical(env, ctx, eaddr, access_type);
> -        } else {
> -            /* Try to find a BAT */
> -            if (env->nb_BATs !=3D 0) {
> -                ret =3D get_bat_6xx_tlb(env, ctx, eaddr, access_type);
> -            }
> -            if (ret < 0) {
> -                /* We didn't match any BAT entry or don't have BATs */
> -                ret =3D get_segment_6xx_tlb(env, ctx, eaddr, access_type=
, type);
> -            }
> -        }
> -        break;
> -
> -    case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_SOFT_4xx_Z:
> -        if (real_mode) {
> -            ret =3D check_physical(env, ctx, eaddr, access_type);
> -        } else {
> -            ret =3D mmu40x_get_physical_address(env, ctx, eaddr, access_=
type);
> -        }
> -        break;
> -    case POWERPC_MMU_BOOKE:
> -        ret =3D mmubooke_get_physical_address(env, ctx, eaddr, access_ty=
pe);
> -        break;
> -    case POWERPC_MMU_BOOKE206:
> -        ret =3D mmubooke206_get_physical_address(env, ctx, eaddr, access=
_type,
> -                                               mmu_idx);
> -        break;
> -    case POWERPC_MMU_MPC8xx:
> -        /* XXX: TODO */
> -        cpu_abort(env_cpu(env), "MPC8xx MMU model is not implemented\n");
> -        break;
> -    case POWERPC_MMU_REAL:
> -        if (real_mode) {
> -            ret =3D check_physical(env, ctx, eaddr, access_type);
> -        } else {
> -            cpu_abort(env_cpu(env),
> -                      "PowerPC in real mode do not do any translation\n"=
);
> -        }
> -        return -1;
> -    default:
> -        cpu_abort(env_cpu(env), "Unknown or invalid MMU model\n");
> -        return -1;
> -    }
> -
> -    return ret;
> -}
> +    ppc6xx_tlb_t *tlb;
> +    int nr;
> =20
> -#ifdef CONFIG_TCG
> -static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
> -                                target_ulong eaddr, MMUAccessType access=
_type,
> -                                int type)
> -{
> -    return get_physical_address_wtlb(env, ctx, eaddr, access_type, type,=
 0);
> +    nr =3D ppc6xx_tlb_getnum(env, EPN, way, is_code);
> +    tlb =3D &env->tlb.tlb6[nr];
> +    LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
> +              " PTE1 " TARGET_FMT_lx "\n", nr, env->nb_tlb, EPN, pte0, p=
te1);
> +    /* Invalidate any pending reference in QEMU for this virtual address=
 */
> +    ppc6xx_tlb_invalidate_virt2(env, EPN, is_code, 1);
> +    tlb->pte0 =3D pte0;
> +    tlb->pte1 =3D pte1;
> +    tlb->EPN =3D EPN;
> +    /* Store last way for LRU mechanism */
> +    env->last_way =3D way;
>  }
> -#endif
> =20
> -hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +/* Generic TLB search function for PowerPC embedded implementations */
> +static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
> +                             uint32_t pid)
>  {
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
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
> -                                      ACCESS_INT) !=3D 0)) {
> +    ppcemb_tlb_t *tlb;
> +    hwaddr raddr;
> +    int i, ret;
> =20
> -        /*
> -         * Some MMUs have separate TLBs for code and data. If we only
> -         * try an ACCESS_INT, we may not be able to read instructions
> -         * mapped by code TLBs, so we also try a ACCESS_CODE.
> -         */
> -        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETC=
H,
> -                                          ACCESS_CODE) !=3D 0)) {
> -            return -1;
> +    /* Default return value is no match */
> +    ret =3D -1;
> +    for (i =3D 0; i < env->nb_tlb; i++) {
> +        tlb =3D &env->tlb.tlbe[i];
> +        if (ppcemb_tlb_check(env, tlb, &raddr, address, pid, 0, i) =3D=
=3D 0) {
> +            ret =3D i;
> +            break;
>          }
>      }
> =20
> -    return ctx.raddr & TARGET_PAGE_MASK;
> +    return ret;
>  }
> =20
> -static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong =
address,
> -                                         MMUAccessType access_type, int =
mmu_idx)
> +/* Helpers specific to PowerPC 40x implementations */
> +static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
>  {
> -    uint32_t epid;
> -    bool as, pr;
> -    uint32_t missed_tid =3D 0;
> -    bool use_epid =3D mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
> -
> -    if (access_type =3D=3D MMU_INST_FETCH) {
> -        as =3D msr_ir;
> -    }
> -    env->spr[SPR_BOOKE_MAS0] =3D env->spr[SPR_BOOKE_MAS4] & MAS4_TLBSELD=
_MASK;
> -    env->spr[SPR_BOOKE_MAS1] =3D env->spr[SPR_BOOKE_MAS4] & MAS4_TSIZED_=
MASK;
> -    env->spr[SPR_BOOKE_MAS2] =3D env->spr[SPR_BOOKE_MAS4] & MAS4_WIMGED_=
MASK;
> -    env->spr[SPR_BOOKE_MAS3] =3D 0;
> -    env->spr[SPR_BOOKE_MAS6] =3D 0;
> -    env->spr[SPR_BOOKE_MAS7] =3D 0;
> -
> -    /* AS */
> -    if (as) {
> -        env->spr[SPR_BOOKE_MAS1] |=3D MAS1_TS;
> -        env->spr[SPR_BOOKE_MAS6] |=3D MAS6_SAS;
> -    }
> -
> -    env->spr[SPR_BOOKE_MAS1] |=3D MAS1_VALID;
> -    env->spr[SPR_BOOKE_MAS2] |=3D address & MAS2_EPN_MASK;
> +    ppcemb_tlb_t *tlb;
> +    int i;
> =20
> -    if (!use_epid) {
> -        switch (env->spr[SPR_BOOKE_MAS4] & MAS4_TIDSELD_PIDZ) {
> -        case MAS4_TIDSELD_PID0:
> -            missed_tid =3D env->spr[SPR_BOOKE_PID];
> -            break;
> -        case MAS4_TIDSELD_PID1:
> -            missed_tid =3D env->spr[SPR_BOOKE_PID1];
> -            break;
> -        case MAS4_TIDSELD_PID2:
> -            missed_tid =3D env->spr[SPR_BOOKE_PID2];
> -            break;
> -        }
> -        env->spr[SPR_BOOKE_MAS6] |=3D env->spr[SPR_BOOKE_PID] << 16;
> -    } else {
> -        missed_tid =3D epid;
> -        env->spr[SPR_BOOKE_MAS6] |=3D missed_tid << 16;
> +    for (i =3D 0; i < env->nb_tlb; i++) {
> +        tlb =3D &env->tlb.tlbe[i];
> +        tlb->prot &=3D ~PAGE_VALID;
>      }
> -    env->spr[SPR_BOOKE_MAS1] |=3D (missed_tid << MAS1_TID_SHIFT);
> -
> -
> -    /* next victim logic */
> -    env->spr[SPR_BOOKE_MAS0] |=3D env->last_way << MAS0_ESEL_SHIFT;
> -    env->last_way++;
> -    env->last_way &=3D booke206_tlb_ways(env, 0) - 1;
> -    env->spr[SPR_BOOKE_MAS0] |=3D env->last_way << MAS0_NV_SHIFT;
> +    tlb_flush(env_cpu(env));
>  }
> =20
> -/* Perform address translation */
> -static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong addre=
ss,
> -                                    MMUAccessType access_type, int mmu_i=
dx)
> +static void booke206_flush_tlb(CPUPPCState *env, int flags,
> +                               const int check_iprot)
>  {
> -    CPUState *cs =3D env_cpu(env);
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    mmu_ctx_t ctx;
> -    int type;
> -    int ret =3D 0;
> +    int tlb_size;
> +    int i, j;
> +    ppcmas_tlb_t *tlb =3D env->tlb.tlbm;
> =20
> -    if (access_type =3D=3D MMU_INST_FETCH) {
> -        /* code access */
> -        type =3D ACCESS_CODE;
> -    } else {
> -        /* data access */
> -        type =3D env->access_type;
> -    }
> -    ret =3D get_physical_address_wtlb(env, &ctx, address, access_type,
> -                                    type, mmu_idx);
> -    if (ret =3D=3D 0) {
> -        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> -                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
> -                     mmu_idx, TARGET_PAGE_SIZE);
> -        ret =3D 0;
> -    } else if (ret < 0) {
> -        LOG_MMU_STATE(cs);
> -        if (type =3D=3D ACCESS_CODE) {
> -            switch (ret) {
> -            case -1:
> -                /* No matches in page tables or TLB */
> -                switch (env->mmu_model) {
> -                case POWERPC_MMU_SOFT_6xx:
> -                    cs->exception_index =3D POWERPC_EXCP_IFTLB;
> -                    env->error_code =3D 1 << 18;
> -                    env->spr[SPR_IMISS] =3D address;
> -                    env->spr[SPR_ICMP] =3D 0x80000000 | ctx.ptem;
> -                    goto tlb_miss;
> -                case POWERPC_MMU_SOFT_74xx:
> -                    cs->exception_index =3D POWERPC_EXCP_IFTLB;
> -                    goto tlb_miss_74xx;
> -                case POWERPC_MMU_SOFT_4xx:
> -                case POWERPC_MMU_SOFT_4xx_Z:
> -                    cs->exception_index =3D POWERPC_EXCP_ITLB;
> -                    env->error_code =3D 0;
> -                    env->spr[SPR_40x_DEAR] =3D address;
> -                    env->spr[SPR_40x_ESR] =3D 0x00000000;
> -                    break;
> -                case POWERPC_MMU_BOOKE206:
> -                    booke206_update_mas_tlb_miss(env, address, 2, mmu_id=
x);
> -                    /* fall through */
> -                case POWERPC_MMU_BOOKE:
> -                    cs->exception_index =3D POWERPC_EXCP_ITLB;
> -                    env->error_code =3D 0;
> -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> -                    env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 MMU_DATA_LOAD);
> -                    return -1;
> -                case POWERPC_MMU_MPC8xx:
> -                    /* XXX: TODO */
> -                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n=
");
> -                    break;
> -                case POWERPC_MMU_REAL:
> -                    cpu_abort(cs, "PowerPC in real mode should never rai=
se "
> -                              "any MMU exceptions\n");
> -                    return -1;
> -                default:
> -                    cpu_abort(cs, "Unknown or invalid MMU model\n");
> -                    return -1;
> -                }
> -                break;
> -            case -2:
> -                /* Access rights violation */
> -                cs->exception_index =3D POWERPC_EXCP_ISI;
> -                env->error_code =3D 0x08000000;
> -                break;
> -            case -3:
> -                /* No execute protection violation */
> -                if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
> -                    (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206)) {
> -                    env->spr[SPR_BOOKE_ESR] =3D 0x00000000;
> -                }
> -                cs->exception_index =3D POWERPC_EXCP_ISI;
> -                env->error_code =3D 0x10000000;
> -                break;
> -            case -4:
> -                /* Direct store exception */
> -                /* No code fetch is allowed in direct-store areas */
> -                cs->exception_index =3D POWERPC_EXCP_ISI;
> -                env->error_code =3D 0x10000000;
> -                break;
> -            }
> -        } else {
> -            switch (ret) {
> -            case -1:
> -                /* No matches in page tables or TLB */
> -                switch (env->mmu_model) {
> -                case POWERPC_MMU_SOFT_6xx:
> -                    if (access_type =3D=3D MMU_DATA_STORE) {
> -                        cs->exception_index =3D POWERPC_EXCP_DSTLB;
> -                        env->error_code =3D 1 << 16;
> -                    } else {
> -                        cs->exception_index =3D POWERPC_EXCP_DLTLB;
> -                        env->error_code =3D 0;
> -                    }
> -                    env->spr[SPR_DMISS] =3D address;
> -                    env->spr[SPR_DCMP] =3D 0x80000000 | ctx.ptem;
> -                tlb_miss:
> -                    env->error_code |=3D ctx.key << 19;
> -                    env->spr[SPR_HASH1] =3D ppc_hash32_hpt_base(cpu) +
> -                        get_pteg_offset32(cpu, ctx.hash[0]);
> -                    env->spr[SPR_HASH2] =3D ppc_hash32_hpt_base(cpu) +
> -                        get_pteg_offset32(cpu, ctx.hash[1]);
> -                    break;
> -                case POWERPC_MMU_SOFT_74xx:
> -                    if (access_type =3D=3D MMU_DATA_STORE) {
> -                        cs->exception_index =3D POWERPC_EXCP_DSTLB;
> -                    } else {
> -                        cs->exception_index =3D POWERPC_EXCP_DLTLB;
> -                    }
> -                tlb_miss_74xx:
> -                    /* Implement LRU algorithm */
> -                    env->error_code =3D ctx.key << 19;
> -                    env->spr[SPR_TLBMISS] =3D (address & ~((target_ulong=
)0x3)) |
> -                        ((env->last_way + 1) & (env->nb_ways - 1));
> -                    env->spr[SPR_PTEHI] =3D 0x80000000 | ctx.ptem;
> -                    break;
> -                case POWERPC_MMU_SOFT_4xx:
> -                case POWERPC_MMU_SOFT_4xx_Z:
> -                    cs->exception_index =3D POWERPC_EXCP_DTLB;
> -                    env->error_code =3D 0;
> -                    env->spr[SPR_40x_DEAR] =3D address;
> -                    if (access_type =3D=3D MMU_DATA_STORE) {
> -                        env->spr[SPR_40x_ESR] =3D 0x00800000;
> -                    } else {
> -                        env->spr[SPR_40x_ESR] =3D 0x00000000;
> -                    }
> -                    break;
> -                case POWERPC_MMU_MPC8xx:
> -                    /* XXX: TODO */
> -                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n=
");
> -                    break;
> -                case POWERPC_MMU_BOOKE206:
> -                    booke206_update_mas_tlb_miss(env, address, access_ty=
pe, mmu_idx);
> -                    /* fall through */
> -                case POWERPC_MMU_BOOKE:
> -                    cs->exception_index =3D POWERPC_EXCP_DTLB;
> -                    env->error_code =3D 0;
> -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> -                    env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 access_type);
> -                    return -1;
> -                case POWERPC_MMU_REAL:
> -                    cpu_abort(cs, "PowerPC in real mode should never rai=
se "
> -                              "any MMU exceptions\n");
> -                    return -1;
> -                default:
> -                    cpu_abort(cs, "Unknown or invalid MMU model\n");
> -                    return -1;
> -                }
> -                break;
> -            case -2:
> -                /* Access rights violation */
> -                cs->exception_index =3D POWERPC_EXCP_DSI;
> -                env->error_code =3D 0;
> -                if (env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx
> -                    || env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx_Z) {
> -                    env->spr[SPR_40x_DEAR] =3D address;
> -                    if (access_type =3D=3D MMU_DATA_STORE) {
> -                        env->spr[SPR_40x_ESR] |=3D 0x00800000;
> -                    }
> -                } else if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
> -                           (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206))=
 {
> -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> -                    env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 access_type);
> -                } else {
> -                    env->spr[SPR_DAR] =3D address;
> -                    if (access_type =3D=3D MMU_DATA_STORE) {
> -                        env->spr[SPR_DSISR] =3D 0x0A000000;
> -                    } else {
> -                        env->spr[SPR_DSISR] =3D 0x08000000;
> -                    }
> -                }
> -                break;
> -            case -4:
> -                /* Direct store exception */
> -                switch (type) {
> -                case ACCESS_FLOAT:
> -                    /* Floating point load/store */
> -                    cs->exception_index =3D POWERPC_EXCP_ALIGN;
> -                    env->error_code =3D POWERPC_EXCP_ALIGN_FP;
> -                    env->spr[SPR_DAR] =3D address;
> -                    break;
> -                case ACCESS_RES:
> -                    /* lwarx, ldarx or stwcx. */
> -                    cs->exception_index =3D POWERPC_EXCP_DSI;
> -                    env->error_code =3D 0;
> -                    env->spr[SPR_DAR] =3D address;
> -                    if (access_type =3D=3D MMU_DATA_STORE) {
> -                        env->spr[SPR_DSISR] =3D 0x06000000;
> -                    } else {
> -                        env->spr[SPR_DSISR] =3D 0x04000000;
> -                    }
> -                    break;
> -                case ACCESS_EXT:
> -                    /* eciwx or ecowx */
> -                    cs->exception_index =3D POWERPC_EXCP_DSI;
> -                    env->error_code =3D 0;
> -                    env->spr[SPR_DAR] =3D address;
> -                    if (access_type =3D=3D MMU_DATA_STORE) {
> -                        env->spr[SPR_DSISR] =3D 0x06100000;
> -                    } else {
> -                        env->spr[SPR_DSISR] =3D 0x04100000;
> -                    }
> -                    break;
> -                default:
> -                    printf("DSI: invalid exception (%d)\n", ret);
> -                    cs->exception_index =3D POWERPC_EXCP_PROGRAM;
> -                    env->error_code =3D
> -                        POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
> -                    env->spr[SPR_DAR] =3D address;
> -                    break;
> +    for (i =3D 0; i < BOOKE206_MAX_TLBN; i++) {
> +        if (flags & (1 << i)) {
> +            tlb_size =3D booke206_tlb_size(env, i);
> +            for (j =3D 0; j < tlb_size; j++) {
> +                if (!check_iprot || !(tlb[j].mas1 & MAS1_IPROT)) {
> +                    tlb[j].mas1 &=3D ~MAS1_VALID;
>                  }
> -                break;
>              }
>          }
> -        ret =3D 1;
> +        tlb +=3D booke206_tlb_size(env, i);
>      }
> =20
> -    return ret;
> +    tlb_flush(env_cpu(env));
>  }
> =20
> -#ifdef CONFIG_TCG
> +
>  /***********************************************************************=
******/
>  /* BATs management */
>  #if !defined(FLUSH_ALL_TLBS)
> @@ -1952,9 +372,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_=
t nr, target_ulong value)
>  #endif
>      }
>  }
> -#endif
> =20
> -#ifdef CONFIG_TCG
>  /***********************************************************************=
******/
>  /* TLB management */
>  void ppc_tlb_invalidate_all(CPUPPCState *env)
> @@ -1998,9 +416,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>          break;
>      }
>  }
> -#endif
> =20
> -#ifdef CONFIG_TCG
>  void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
>  {
>  #if !defined(FLUSH_ALL_TLBS)
> @@ -2942,30 +1358,6 @@ void helper_check_tlb_flush_global(CPUPPCState *en=
v)
>  {
>      check_tlb_flush(env, true);
>  }
> -#endif /* CONFIG_TCG */
> =20
>  /***********************************************************************=
******/
> =20
> -bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
> -                      MMUAccessType access_type, int mmu_idx,
> -                      bool probe, uintptr_t retaddr)
> -{
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cs);
> -    CPUPPCState *env =3D &cpu->env;
> -    int ret;
> -
> -    if (pcc->handle_mmu_fault) {
> -        ret =3D pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> -    } else {
> -        ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx=
);
> -    }
> -    if (unlikely(ret !=3D 0)) {
> -        if (probe) {
> -            return false;
> -        }
> -        raise_exception_err_ra(env, cs->exception_index, env->error_code,
> -                               retaddr);
> -    }
> -    return true;
> -}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MeoJVkn/1B9jFTjI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9hPcACgkQbDjKyiDZ
s5InUA/7BqsillZ7jFuDTx3mW/TtnS3y/5V7PgyG6KYamo/oCdV6FpHoAqwHt+rU
3qohn+oSS5WsXD9ACrlbNTvftVG1/2CiWigd+MngSg9cAXQu7i06EMvwmCd5WcDa
Cwqr8MXzFOAanTaGTI7/uZZXb/yve//9KTjC/Gs3UwZeVrLMI6xHg/6sL85XQ6bg
1qLPZIbc2J+p0baW57FlfO+j25WmnqnBGC5A1atqLNSlP9jwABcexq6VNHkhIjUl
+WBVpZditsiGhnhayMYRPNgNAdVwRGuudyHfxOgKTWcpX6xDw/Y/AiIjxqBZaOCl
CUDj+hYxMjt5gGQpihDT2WKbeTe1pPi2dN3keQgfvZgwqZ6+B++DtqlsDxNpXg4X
7htudpuXF1r87pljhyRTdGKEgLAhv6sltJzJ+LfxCPe1Wrw6kJtLRQvr15xZE4qY
51r9xUQtbrk3X8bSQ5dmTIIjMIni1NgLBT1WmO50qw7COs7tP1LmurzArbSJsaY2
9GhBSynwYkUDWKy4DE08QETYwlOwA7g0BWUAUzBXTL/2HdBHI/jATa3MvV8MnmKk
yXrhfLK0siTXtclJfYAKClBwa9JSUaHB8PpzEzbL2ji+tcY6MOGpM0tAyYx/Skm1
g54KB5n14N++T8L0n0SayBSH3LwFFOWSNhpJu8LIs4gcj0RrhLY=
=azuv
-----END PGP SIGNATURE-----

--MeoJVkn/1B9jFTjI--

