Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27639D3B7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:58:13 +0200 (CEST)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6Oy-0004CJ-Ly
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6I8-0003zK-87; Sun, 06 Jun 2021 23:51:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57991 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hu-0002mR-TX; Sun, 06 Jun 2021 23:51:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt2397Bz9sWl; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=FI+ARJLX+EFyVkwN7tkb7U4aLasPv3hUD7Wiw3bVrQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oR/C+uatm50/WzIeUX9isSvwxqLDNgPCVCDBkZIaI6B75p1w+go4M6iJQRKE9i9/h
 liOSEIotiSO/uf1/i7fEKYPc+5kHwBiJFZJ/cH1kTp3TUGR2kX6zny+vwYOHVrqjU4
 uRWs6X2l6ESenAPu4oYruiHYwGV6GjO5Dbo+vC5Q=
Date: Mon, 7 Jun 2021 12:34:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH 4/4] target/ppc: Moved helpers to mmu_helper.c
Message-ID: <YL2FxOENTj82ycZC@yekko>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
 <20210602192604.90846-5-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sZ82dSBOQe6lxAU/"
Content-Disposition: inline
In-Reply-To: <20210602192604.90846-5-lucas.araujo@eldorado.org.br>
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


--sZ82dSBOQe6lxAU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 04:26:04PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> Moved helpers from target/ppc/mmu-hash64.c to target/ppc/mmu_helpers.c
> and removed #ifdef CONFIG_TCG and #include exec/helper-proto.h from
> mmu-hash64.c
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

I'd prefer not to do this.  These helpers used to be in
mmu_helper.c, along with most of the stuff in mmu-*.[ch].  I think the
division by MMU model is more important than the TCG/!TCG distinction,
so I'd prefer to keep these here, even if it means ifdefs.  Eventually
we could consider splitting each of the individual MMU files into
TCG/!TCG parts, but I don't want to go back to having all the helpers
for umpteen very different MMU models all lumped into one giant file.

> ---
> I had to turn slb_lookup in a non static function as it had calls from
> the code that was moved to mmu_helper.c and from the code that wasn't
> moved.
>=20
> Also perhaps it would be best to create a new file to move the mmu-hash
> functions that are not compiled in !TCG, personally I thought that
> moving the helpers in mmu-hash64 to mmu_helpers the better choice.
> ---
>  target/ppc/mmu-hash64.c | 219 +---------------------------------------
>  target/ppc/mmu-hash64.h |   1 +
>  target/ppc/mmu_helper.c | 209 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 211 insertions(+), 218 deletions(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 708dffc31b..d2ded71107 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -32,10 +32,6 @@
>  #include "mmu-book3s-v3.h"
>  #include "helper_regs.h"
> =20
> -#ifdef CONFIG_TCG
> -#include "exec/helper-proto.h"
> -#endif
> -
>  /* #define DEBUG_SLB */
> =20
>  #ifdef DEBUG_SLB
> @@ -48,7 +44,7 @@
>   * SLB handling
>   */
> =20
> -static ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ulong eaddr)
> +ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ulong eaddr)
>  {
>      CPUPPCState *env =3D &cpu->env;
>      uint64_t esid_256M, esid_1T;
> @@ -100,114 +96,6 @@ void dump_slb(PowerPCCPU *cpu)
>      }
>  }
> =20
> -#ifdef CONFIG_TCG
> -void helper_slbia(CPUPPCState *env, uint32_t ih)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    int starting_entry;
> -    int n;
> -
> -    /*
> -     * slbia must always flush all TLB (which is equivalent to ERAT in p=
pc
> -     * architecture). Matching on SLB_ESID_V is not good enough, because=
 slbmte
> -     * can overwrite a valid SLB without flushing its lookaside informat=
ion.
> -     *
> -     * It would be possible to keep the TLB in synch with the SLB by flu=
shing
> -     * when a valid entry is overwritten by slbmte, and therefore slbia =
would
> -     * not have to flush unless it evicts a valid SLB entry. However it =
is
> -     * expected that slbmte is more common than slbia, and slbia is usua=
lly
> -     * going to evict valid SLB entries, so that tradeoff is unlikely to=
 be a
> -     * good one.
> -     *
> -     * ISA v2.05 introduced IH field with values 0,1,2,6. These all inva=
lidate
> -     * the same SLB entries (everything but entry 0), but differ in what
> -     * "lookaside information" is invalidated. TCG can ignore this and f=
lush
> -     * everything.
> -     *
> -     * ISA v3.0 introduced additional values 3,4,7, which change what SL=
Bs are
> -     * invalidated.
> -     */
> -
> -    env->tlb_need_flush |=3D TLB_NEED_LOCAL_FLUSH;
> -
> -    starting_entry =3D 1; /* default for IH=3D0,1,2,6 */
> -
> -    if (env->mmu_model =3D=3D POWERPC_MMU_3_00) {
> -        switch (ih) {
> -        case 0x7:
> -            /* invalidate no SLBs, but all lookaside information */
> -            return;
> -
> -        case 0x3:
> -        case 0x4:
> -            /* also considers SLB entry 0 */
> -            starting_entry =3D 0;
> -            break;
> -
> -        case 0x5:
> -            /* treat undefined values as ih=3D=3D0, and warn */
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "slbia undefined IH field %u.\n", ih);
> -            break;
> -
> -        default:
> -            /* 0,1,2,6 */
> -            break;
> -        }
> -    }
> -
> -    for (n =3D starting_entry; n < cpu->hash64_opts->slb_size; n++) {
> -        ppc_slb_t *slb =3D &env->slb[n];
> -
> -        if (!(slb->esid & SLB_ESID_V)) {
> -            continue;
> -        }
> -        if (env->mmu_model =3D=3D POWERPC_MMU_3_00) {
> -            if (ih =3D=3D 0x3 && (slb->vsid & SLB_VSID_C) =3D=3D 0) {
> -                /* preserves entries with a class value of 0 */
> -                continue;
> -            }
> -        }
> -
> -        slb->esid &=3D ~SLB_ESID_V;
> -    }
> -}
> -
> -static void __helper_slbie(CPUPPCState *env, target_ulong addr,
> -                           target_ulong global)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    ppc_slb_t *slb;
> -
> -    slb =3D slb_lookup(cpu, addr);
> -    if (!slb) {
> -        return;
> -    }
> -
> -    if (slb->esid & SLB_ESID_V) {
> -        slb->esid &=3D ~SLB_ESID_V;
> -
> -        /*
> -         * XXX: given the fact that segment size is 256 MB or 1TB,
> -         *      and we still don't have a tlb_flush_mask(env, n, mask)
> -         *      in QEMU, we just invalidate all TLBs
> -         */
> -        env->tlb_need_flush |=3D
> -            (global =3D=3D false ? TLB_NEED_LOCAL_FLUSH : TLB_NEED_GLOBA=
L_FLUSH);
> -    }
> -}
> -
> -void helper_slbie(CPUPPCState *env, target_ulong addr)
> -{
> -    __helper_slbie(env, addr, false);
> -}
> -
> -void helper_slbieg(CPUPPCState *env, target_ulong addr)
> -{
> -    __helper_slbie(env, addr, true);
> -}
> -#endif
> -
>  int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                    target_ulong esid, target_ulong vsid)
>  {
> @@ -260,102 +148,6 @@ int ppc_store_slb(PowerPCCPU *cpu, target_ulong slo=
t,
>      return 0;
>  }
> =20
> -#ifdef CONFIG_TCG
> -static int ppc_load_slb_esid(PowerPCCPU *cpu, target_ulong rb,
> -                             target_ulong *rt)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    int slot =3D rb & 0xfff;
> -    ppc_slb_t *slb =3D &env->slb[slot];
> -
> -    if (slot >=3D cpu->hash64_opts->slb_size) {
> -        return -1;
> -    }
> -
> -    *rt =3D slb->esid;
> -    return 0;
> -}
> -
> -static int ppc_load_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
> -                             target_ulong *rt)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    int slot =3D rb & 0xfff;
> -    ppc_slb_t *slb =3D &env->slb[slot];
> -
> -    if (slot >=3D cpu->hash64_opts->slb_size) {
> -        return -1;
> -    }
> -
> -    *rt =3D slb->vsid;
> -    return 0;
> -}
> -
> -static int ppc_find_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
> -                             target_ulong *rt)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    ppc_slb_t *slb;
> -
> -    if (!msr_is_64bit(env, env->msr)) {
> -        rb &=3D 0xffffffff;
> -    }
> -    slb =3D slb_lookup(cpu, rb);
> -    if (slb =3D=3D NULL) {
> -        *rt =3D (target_ulong)-1ul;
> -    } else {
> -        *rt =3D slb->vsid;
> -    }
> -    return 0;
> -}
> -
> -void helper_store_slb(CPUPPCState *env, target_ulong rb, target_ulong rs)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -
> -    if (ppc_store_slb(cpu, rb & 0xfff, rb & ~0xfffULL, rs) < 0) {
> -        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> -                               POWERPC_EXCP_INVAL, GETPC());
> -    }
> -}
> -
> -target_ulong helper_load_slb_esid(CPUPPCState *env, target_ulong rb)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    target_ulong rt =3D 0;
> -
> -    if (ppc_load_slb_esid(cpu, rb, &rt) < 0) {
> -        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> -                               POWERPC_EXCP_INVAL, GETPC());
> -    }
> -    return rt;
> -}
> -
> -target_ulong helper_find_slb_vsid(CPUPPCState *env, target_ulong rb)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    target_ulong rt =3D 0;
> -
> -    if (ppc_find_slb_vsid(cpu, rb, &rt) < 0) {
> -        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> -                               POWERPC_EXCP_INVAL, GETPC());
> -    }
> -    return rt;
> -}
> -
> -target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    target_ulong rt =3D 0;
> -
> -    if (ppc_load_slb_vsid(cpu, rb, &rt) < 0) {
> -        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> -                               POWERPC_EXCP_INVAL, GETPC());
> -    }
> -    return rt;
> -}
> -#endif
> -
>  /* Check No-Execute or Guarded Storage */
>  static inline int ppc_hash64_pte_noexec_guard(PowerPCCPU *cpu,
>                                                ppc_hash_pte64_t pte)
> @@ -1146,15 +938,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, tar=
get_ulong ptex,
>      cpu->env.tlb_need_flush =3D TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_F=
LUSH;
>  }
> =20
> -#ifdef CONFIG_TCG
> -void helper_store_lpcr(CPUPPCState *env, target_ulong val)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -
> -    ppc_store_lpcr(cpu, val);
> -}
> -#endif
> -
>  void ppc_hash64_init(PowerPCCPU *cpu)
>  {
>      CPUPPCState *env =3D &cpu->env;
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 4b8b8e7950..44fd7c9d35 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -7,6 +7,7 @@
>  void dump_slb(PowerPCCPU *cpu);
>  int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                    target_ulong esid, target_ulong vsid);
> +ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ulong eaddr);
>  hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr=
);
>  int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
>                                  int mmu_idx);
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index dbf7b398cd..6db2678a89 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1361,3 +1361,211 @@ void helper_check_tlb_flush_global(CPUPPCState *e=
nv)
> =20
>  /***********************************************************************=
******/
> =20
> +#if defined(TARGET_PPC64)
> +void helper_slbia(CPUPPCState *env, uint32_t ih)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    int starting_entry;
> +    int n;
> +
> +    /*
> +     * slbia must always flush all TLB (which is equivalent to ERAT in p=
pc
> +     * architecture). Matching on SLB_ESID_V is not good enough, because=
 slbmte
> +     * can overwrite a valid SLB without flushing its lookaside informat=
ion.
> +     *
> +     * It would be possible to keep the TLB in synch with the SLB by flu=
shing
> +     * when a valid entry is overwritten by slbmte, and therefore slbia =
would
> +     * not have to flush unless it evicts a valid SLB entry. However it =
is
> +     * expected that slbmte is more common than slbia, and slbia is usua=
lly
> +     * going to evict valid SLB entries, so that tradeoff is unlikely to=
 be a
> +     * good one.
> +     *
> +     * ISA v2.05 introduced IH field with values 0,1,2,6. These all inva=
lidate
> +     * the same SLB entries (everything but entry 0), but differ in what
> +     * "lookaside information" is invalidated. TCG can ignore this and f=
lush
> +     * everything.
> +     *
> +     * ISA v3.0 introduced additional values 3,4,7, which change what SL=
Bs are
> +     * invalidated.
> +     */
> +
> +    env->tlb_need_flush |=3D TLB_NEED_LOCAL_FLUSH;
> +
> +    starting_entry =3D 1; /* default for IH=3D0,1,2,6 */
> +
> +    if (env->mmu_model =3D=3D POWERPC_MMU_3_00) {
> +        switch (ih) {
> +        case 0x7:
> +            /* invalidate no SLBs, but all lookaside information */
> +            return;
> +
> +        case 0x3:
> +        case 0x4:
> +            /* also considers SLB entry 0 */
> +            starting_entry =3D 0;
> +            break;
> +
> +        case 0x5:
> +            /* treat undefined values as ih=3D=3D0, and warn */
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "slbia undefined IH field %u.\n", ih);
> +            break;
> +
> +        default:
> +            /* 0,1,2,6 */
> +            break;
> +        }
> +    }
> +
> +    for (n =3D starting_entry; n < cpu->hash64_opts->slb_size; n++) {
> +        ppc_slb_t *slb =3D &env->slb[n];
> +
> +        if (!(slb->esid & SLB_ESID_V)) {
> +            continue;
> +        }
> +        if (env->mmu_model =3D=3D POWERPC_MMU_3_00) {
> +            if (ih =3D=3D 0x3 && (slb->vsid & SLB_VSID_C) =3D=3D 0) {
> +                /* preserves entries with a class value of 0 */
> +                continue;
> +            }
> +        }
> +
> +        slb->esid &=3D ~SLB_ESID_V;
> +    }
> +}
> +
> +static void __helper_slbie(CPUPPCState *env, target_ulong addr,
> +                           target_ulong global)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    ppc_slb_t *slb;
> +
> +    slb =3D slb_lookup(cpu, addr);
> +    if (!slb) {
> +        return;
> +    }
> +
> +    if (slb->esid & SLB_ESID_V) {
> +        slb->esid &=3D ~SLB_ESID_V;
> +
> +        /*
> +         * XXX: given the fact that segment size is 256 MB or 1TB,
> +         *      and we still don't have a tlb_flush_mask(env, n, mask)
> +         *      in QEMU, we just invalidate all TLBs
> +         */
> +        env->tlb_need_flush |=3D
> +            (global =3D=3D false ? TLB_NEED_LOCAL_FLUSH : TLB_NEED_GLOBA=
L_FLUSH);
> +    }
> +}
> +
> +void helper_slbie(CPUPPCState *env, target_ulong addr)
> +{
> +    __helper_slbie(env, addr, false);
> +}
> +
> +void helper_slbieg(CPUPPCState *env, target_ulong addr)
> +{
> +    __helper_slbie(env, addr, true);
> +}
> +
> +static int ppc_load_slb_esid(PowerPCCPU *cpu, target_ulong rb,
> +                             target_ulong *rt)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    int slot =3D rb & 0xfff;
> +    ppc_slb_t *slb =3D &env->slb[slot];
> +
> +    if (slot >=3D cpu->hash64_opts->slb_size) {
> +        return -1;
> +    }
> +
> +    *rt =3D slb->esid;
> +    return 0;
> +}
> +
> +static int ppc_load_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
> +                             target_ulong *rt)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    int slot =3D rb & 0xfff;
> +    ppc_slb_t *slb =3D &env->slb[slot];
> +
> +    if (slot >=3D cpu->hash64_opts->slb_size) {
> +        return -1;
> +    }
> +
> +    *rt =3D slb->vsid;
> +    return 0;
> +}
> +
> +static int ppc_find_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
> +                             target_ulong *rt)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    ppc_slb_t *slb;
> +
> +    if (!msr_is_64bit(env, env->msr)) {
> +        rb &=3D 0xffffffff;
> +    }
> +    slb =3D slb_lookup(cpu, rb);
> +    if (slb =3D=3D NULL) {
> +        *rt =3D (target_ulong)-1ul;
> +    } else {
> +        *rt =3D slb->vsid;
> +    }
> +    return 0;
> +}
> +
> +void helper_store_slb(CPUPPCState *env, target_ulong rb, target_ulong rs)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +
> +    if (ppc_store_slb(cpu, rb & 0xfff, rb & ~0xfffULL, rs) < 0) {
> +        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                               POWERPC_EXCP_INVAL, GETPC());
> +    }
> +}
> +
> +target_ulong helper_load_slb_esid(CPUPPCState *env, target_ulong rb)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    target_ulong rt =3D 0;
> +
> +    if (ppc_load_slb_esid(cpu, rb, &rt) < 0) {
> +        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                               POWERPC_EXCP_INVAL, GETPC());
> +    }
> +    return rt;
> +}
> +
> +target_ulong helper_find_slb_vsid(CPUPPCState *env, target_ulong rb)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    target_ulong rt =3D 0;
> +
> +    if (ppc_find_slb_vsid(cpu, rb, &rt) < 0) {
> +        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                               POWERPC_EXCP_INVAL, GETPC());
> +    }
> +    return rt;
> +}
> +
> +target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    target_ulong rt =3D 0;
> +
> +    if (ppc_load_slb_vsid(cpu, rb, &rt) < 0) {
> +        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                               POWERPC_EXCP_INVAL, GETPC());
> +    }
> +    return rt;
> +}
> +
> +void helper_store_lpcr(CPUPPCState *env, target_ulong val)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +
> +    ppc_store_lpcr(cpu, val);
> +}
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sZ82dSBOQe6lxAU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9hcMACgkQbDjKyiDZ
s5LIghAA05I5/8PhrpwJ9zh333IkkUrsfMrJN3qKemPPZY7l1nkAJlo5sNSBRiVZ
WFduRcl55huISEPq6Sqlb5yAH4ZB/k87IJFJX6WrJth+M4Sm7xq7NOUMAJfDXaFX
7oJftZFHfSdEFaLszVmW1T/AhSKuz72DZyt+cBnLy0DJuVjwIsl8ItH/nzAEdBeh
Cl7AlDXhOfM4uyMwE+I6wdsqX2BLksea7DFXm4pHkwlPbrxemmbNkYDm2VvmqjFf
dtQknIH3wed7lMLn2AQPjlU60ZnsnmmuTUZIdlaDjD0SaXEpglz7Iy8obHeEAbTD
z31tm99o9AErVdVd8ACWAM+CVhU9Q44VoXm89pSGYnrqDxDlScnc1b8ifp5rK4gk
g7Bog6BD2i1O5VYPsdnzyNQR1gVTnX9fZKw2HP4xkyn4+2dv4eOpdkRLkDk+qYc0
IL3eIp94I1OG/aU0w8o2v5fMZXjNm6M6xpoYqWT3OW6o14gisR/uSJMZEjYdT1Jk
gyJkzUFxpj/X3uaybui9dit6HkzkTJWzYihNFBBWRf7YY6QCTvCDNft7twfL6x4K
s3QSv5LYDKJ14n8e2AvpP95gt/S/FaVeWjS4txa1TsljfWxBT9xvJAw4nnhEJTOS
XJZ27s9tjEKe+xed5hWZbbYFL/EZn8eqO5lD/yFl0ZgibwND2o4=
=mlDu
-----END PGP SIGNATURE-----

--sZ82dSBOQe6lxAU/--

