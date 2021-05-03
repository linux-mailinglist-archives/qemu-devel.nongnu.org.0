Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE13710FA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:38:25 +0200 (CEST)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQLg-00029a-II
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJR-0007mg-Lm; Mon, 03 May 2021 00:36:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50127 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJN-0002Gp-71; Mon, 03 May 2021 00:36:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXR0qqrz9sW7; Mon,  3 May 2021 14:35:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016551;
 bh=tujwPzdfQXkm0MUjUR2nQjXCS3AQB7Fjsf90VnEWFyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EN93GR6Y3Uuk+9GuMUtDgy8jy+VTD8OtuwNiKOq9ZBr0bs971SXcJG0U35LURVr++
 Km8GkUuEZe2iJCwJkxw4mw3Es2uPOq2A+xWvT64yS67nvLkNTNlXkoERIjtAwx+d11
 ZznW5CC0anhZd/ErJMR4+ixWvxfRFyWDwqXyQGrA=
Date: Mon, 3 May 2021 14:24:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH v2 1/2] target/ppc: Moved functions out of mmu-hash64
Message-ID: <YI97GykbXX5u428t@yekko>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-2-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mf5pHxYdrUEa5CVA"
Content-Disposition: inline
In-Reply-To: <20210430184047.81653-2-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mf5pHxYdrUEa5CVA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 03:40:46PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> The functions ppc_store_lpcr, ppc_hash64_filter_pagesizes and
> ppc_hash64_unmap_hptes have been moved to mmu-misc.h since they are
> not needed in a !TCG context and mmu-hash64 should not be compiled
> in such situation.
>=20
> ppc_store_lpcr and ppc_hash64_filter_pagesizes are used by multiple
> functions, while ppc_hash64_unmap_hptes is used by rehash_hpt (in
> spapr_hcall.c).

Hmm.. looking at it, ppc_store_lpcr() (and helper_store_lpcr()) don't
really belong in this file at all.  The LPCR has some things related
to the hash MMU, but plenty of others that don't.  So, maybe
misc_helper.c?  That might have to be moved again, since misc_helper
itself should probably mostly not be used for !TCG.  But.. one thing
at a time.

AFAICT the only user of ppc_hash64_filter_pagesizes() is in
spapr_caps.c.  For now you can just move it next to the caller, it's
debatable whether it belongs more to PAPR or MMU code.

ppc_hash64_unmap_hptes() is definitely TCG only and should stay where
it is.  The call from rehash_hpt() can be solved because rehash_hpt()
itself is TCG only.  I've already suggested splitting the TCG (well,
softmmu) only things out from spapr_hcall.c, so it might simplify
things to tackle that first.

> Also I've put the functions in mmu-misc as I am unsure in which file
> this functions should go, so I just created a new one for now, any
> suggestion which file to put them (considering it's a file that must be
> compiled in a !TCG situation)?
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
> ---
>  hw/ppc/spapr.c          |  1 +
>  hw/ppc/spapr_caps.c     |  1 +
>  hw/ppc/spapr_cpu_core.c |  1 +
>  hw/ppc/spapr_hcall.c    |  1 +
>  hw/ppc/spapr_rtas.c     |  1 +
>  target/ppc/meson.build  |  1 +
>  target/ppc/mmu-hash64.c | 81 +-------------------------------------
>  target/ppc/mmu-hash64.h |  6 ---
>  target/ppc/mmu-misc.c   | 86 +++++++++++++++++++++++++++++++++++++++++
>  target/ppc/mmu-misc.h   | 22 +++++++++++
>  10 files changed, 115 insertions(+), 86 deletions(-)
>  create mode 100644 target/ppc/mmu-misc.c
>  create mode 100644 target/ppc/mmu-misc.h
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e4be00b732..61f8f150c2 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -53,6 +53,7 @@
>  #include "mmu-book3s-v3.h"
>  #include "cpu-models.h"
>  #include "hw/core/cpu.h"
> +#include "mmu-misc.h"
> =20
>  #include "hw/boards.h"
>  #include "hw/ppc/ppc.h"
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 9ea7ddd1e9..22352ff018 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -34,6 +34,7 @@
>  #include "kvm_ppc.h"
>  #include "migration/vmstate.h"
>  #include "sysemu/tcg.h"
> +#include "mmu-misc.h"
> =20
>  #include "hw/ppc/spapr.h"
> =20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 4f316a6f9d..f4d93999e5 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -24,6 +24,7 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/hw_accel.h"
>  #include "qemu/error-report.h"
> +#include "mmu-misc.h"
> =20
>  static void spapr_reset_vcpu(PowerPCCPU *cpu)
>  {
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c..4b0ba69841 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -13,6 +13,7 @@
>  #include "hw/ppc/spapr.h"
>  #include "hw/ppc/spapr_cpu_core.h"
>  #include "mmu-hash64.h"
> +#include "mmu-misc.h"
>  #include "cpu-models.h"
>  #include "trace.h"
>  #include "kvm_ppc.h"
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8a79f9c628..8935b75d1c 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -35,6 +35,7 @@
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/runstate.h"
>  #include "kvm_ppc.h"
> +#include "mmu-misc.h"
> =20
>  #include "hw/ppc/spapr.h"
>  #include "hw/ppc/spapr_vio.h"
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index bbfef90e08..7a97648803 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -31,6 +31,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
>    'mmu-book3s-v3.c',
>    'mmu-hash64.c',
>    'mmu-radix64.c',
> +  'mmu-misc.c',
>  ))
> =20
>  target_arch +=3D {'ppc': ppc_ss}
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 0fabc10302..919a3e9f51 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -30,6 +30,7 @@
>  #include "exec/log.h"
>  #include "hw/hw.h"
>  #include "mmu-book3s-v3.h"
> +#include "mmu-misc.h"
> =20
>  /* #define DEBUG_SLB */
> =20
> @@ -499,20 +500,6 @@ const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPC=
CPU *cpu,
>      return hptes;
>  }
> =20
> -void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hpt=
es,
> -                            hwaddr ptex, int n)
> -{
> -    if (cpu->vhyp) {
> -        PPCVirtualHypervisorClass *vhc =3D
> -            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> -        vhc->unmap_hptes(cpu->vhyp, hptes, ptex, n);
> -        return;
> -    }
> -
> -    address_space_unmap(CPU(cpu)->as, (void *)hptes, n * HASH_PTE_SIZE_6=
4,
> -                        false, n * HASH_PTE_SIZE_64);
> -}
> -
>  static unsigned hpte_page_shift(const PPCHash64SegmentPageSizes *sps,
>                                  uint64_t pte0, uint64_t pte1)
>  {
> @@ -1119,14 +1106,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, ta=
rget_ulong ptex,
>      cpu->env.tlb_need_flush =3D TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_F=
LUSH;
>  }
> =20
> -void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
> -{
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
> -}
> -
>  void helper_store_lpcr(CPUPPCState *env, target_ulong val)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
> @@ -1197,61 +1176,3 @@ const PPCHash64Options ppc_hash64_opts_POWER7 =3D {
>      }
>  };
> =20
> -void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> -                                 bool (*cb)(void *, uint32_t, uint32_t),
> -                                 void *opaque)
> -{
> -    PPCHash64Options *opts =3D cpu->hash64_opts;
> -    int i;
> -    int n =3D 0;
> -    bool ci_largepage =3D false;
> -
> -    assert(opts);
> -
> -    n =3D 0;
> -    for (i =3D 0; i < ARRAY_SIZE(opts->sps); i++) {
> -        PPCHash64SegmentPageSizes *sps =3D &opts->sps[i];
> -        int j;
> -        int m =3D 0;
> -
> -        assert(n <=3D i);
> -
> -        if (!sps->page_shift) {
> -            break;
> -        }
> -
> -        for (j =3D 0; j < ARRAY_SIZE(sps->enc); j++) {
> -            PPCHash64PageSize *ps =3D &sps->enc[j];
> -
> -            assert(m <=3D j);
> -            if (!ps->page_shift) {
> -                break;
> -            }
> -
> -            if (cb(opaque, sps->page_shift, ps->page_shift)) {
> -                if (ps->page_shift >=3D 16) {
> -                    ci_largepage =3D true;
> -                }
> -                sps->enc[m++] =3D *ps;
> -            }
> -        }
> -
> -        /* Clear rest of the row */
> -        for (j =3D m; j < ARRAY_SIZE(sps->enc); j++) {
> -            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
> -        }
> -
> -        if (m) {
> -            n++;
> -        }
> -    }
> -
> -    /* Clear the rest of the table */
> -    for (i =3D n; i < ARRAY_SIZE(opts->sps); i++) {
> -        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
> -    }
> -
> -    if (!ci_largepage) {
> -        opts->flags &=3D ~PPC_HASH64_CI_LARGEPAGE;
> -    }
> -}
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 87729d48b3..562602b466 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -15,12 +15,8 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
>                                 target_ulong pte0, target_ulong pte1);
>  unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *cpu,
>                                            uint64_t pte0, uint64_t pte1);
> -void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
>  void ppc_hash64_init(PowerPCCPU *cpu);
>  void ppc_hash64_finalize(PowerPCCPU *cpu);
> -void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> -                                 bool (*cb)(void *, uint32_t, uint32_t),
> -                                 void *opaque);
>  #endif
> =20
>  /*
> @@ -112,8 +108,6 @@ struct ppc_hash_pte64 {
> =20
>  const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
>                                               hwaddr ptex, int n);
> -void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hpt=
es,
> -                            hwaddr ptex, int n);
> =20
>  static inline uint64_t ppc_hash64_hpte0(PowerPCCPU *cpu,
>                                          const ppc_hash_pte64_t *hptes, i=
nt i)
> diff --git a/target/ppc/mmu-misc.c b/target/ppc/mmu-misc.c
> new file mode 100644
> index 0000000000..8abda66547
> --- /dev/null
> +++ b/target/ppc/mmu-misc.c
> @@ -0,0 +1,86 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "mmu-hash64.h"
> +#include "fpu/softfloat-helpers.h"
> +#include "mmu-misc.h"
> +
> +void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
> +{
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
> +}
> +
> +void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> +                                 bool (*cb)(void *, uint32_t, uint32_t),
> +                                 void *opaque)
> +{
> +    PPCHash64Options *opts =3D cpu->hash64_opts;
> +    int i;
> +    int n =3D 0;
> +    bool ci_largepage =3D false;
> +
> +    assert(opts);
> +
> +    n =3D 0;
> +    for (i =3D 0; i < ARRAY_SIZE(opts->sps); i++) {
> +        PPCHash64SegmentPageSizes *sps =3D &opts->sps[i];
> +        int j;
> +        int m =3D 0;
> +
> +        assert(n <=3D i);
> +
> +        if (!sps->page_shift) {
> +            break;
> +        }
> +
> +        for (j =3D 0; j < ARRAY_SIZE(sps->enc); j++) {
> +            PPCHash64PageSize *ps =3D &sps->enc[j];
> +
> +            assert(m <=3D j);
> +            if (!ps->page_shift) {
> +                break;
> +            }
> +
> +            if (cb(opaque, sps->page_shift, ps->page_shift)) {
> +                if (ps->page_shift >=3D 16) {
> +                    ci_largepage =3D true;
> +                }
> +                sps->enc[m++] =3D *ps;
> +            }
> +        }
> +
> +        /* Clear rest of the row */
> +        for (j =3D m; j < ARRAY_SIZE(sps->enc); j++) {
> +            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
> +        }
> +
> +        if (m) {
> +            n++;
> +        }
> +    }
> +
> +    /* Clear the rest of the table */
> +    for (i =3D n; i < ARRAY_SIZE(opts->sps); i++) {
> +        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
> +    }
> +
> +    if (!ci_largepage) {
> +        opts->flags &=3D ~PPC_HASH64_CI_LARGEPAGE;
> +    }
> +}
> +
> +void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hpt=
es,
> +                            hwaddr ptex, int n)
> +{
> +    if (cpu->vhyp) {
> +        PPCVirtualHypervisorClass *vhc =3D
> +            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        vhc->unmap_hptes(cpu->vhyp, hptes, ptex, n);
> +        return;
> +    }
> +
> +    address_space_unmap(CPU(cpu)->as, (void *)hptes, n * HASH_PTE_SIZE_6=
4,
> +                        false, n * HASH_PTE_SIZE_64);
> +}
> diff --git a/target/ppc/mmu-misc.h b/target/ppc/mmu-misc.h
> new file mode 100644
> index 0000000000..7be6bf7b44
> --- /dev/null
> +++ b/target/ppc/mmu-misc.h
> @@ -0,0 +1,22 @@
> +#ifndef MMU_MISC_H
> +#define MMU_MISC_H
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +
> +#ifndef CONFIG_USER_ONLY
> +
> +#ifdef TARGET_PPC64
> +
> +void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
> +void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> +                                 bool (*cb)(void *, uint32_t, uint32_t),
> +                                 void *opaque);
> +
> +#endif
> +
> +void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hpt=
es,
> +                            hwaddr ptex, int n);
> +
> +#endif
> +
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mf5pHxYdrUEa5CVA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPexkACgkQbDjKyiDZ
s5ImmA/+NNYgsP+SguCq90EKeNOEtlUnlHMOK8RrQvpYq8N04jwXKBWvUF/c+bmr
GxxwyJ18TMBVaSxOLpNekGbou4ZVjQ+kOrxAOczjPXGLOiwp0tr279GpXpy2U5d0
r1j+UhvRBjs5fI+okZBkOf5CbdRnb6laFKAKj0yddxCWbVV2Wc7qmIW7IS9G/qpE
7mTZ8RtnZmf8RaEIHc0CvvL/lLtsoGmH8+4N3pjHpppxId+4EeIqKFEywSbS2XtG
s2kvU3in3Jo0VMj4R/1TPZYTMPxh84rxC5xsmKRrM7/Xt1y3bu38b9PUpZjzlDP7
JRhdeENmx70sFpzobU6jyOH0WOPRJqCwdShnLQl4phpkUoOHazQe8Heyu/I7NPLm
rEXxrl2VXS3ycZ9eHFJtF5d6CpS/jaIMXWUmmixirEhwabhi2vZ2NZjLTVF6I6dE
ZG5OOnVqu8V44zxWykGUV83lbE6Fxy9Oo0F8kMfJn/VwffPPYy+Sz3g4AKKdbYlY
pBHPJwiG4tcB0AAt6MpE6soIS2YIP/qD4B0/wDUG0+Z9AKzB1ZhQgz/2ZIOdu84C
xeGBonkE2ph2aA/19zkIbK2HBMT49zMIVPgvSlXE/FLVYbgmQK9fIgowWkGsVLZH
bmJoPbOQAO/7kHZNa+kBTBRlC/zgueosKthVT+rUP3Vqx+ipM+Q=
=uqAs
-----END PGP SIGNATURE-----

--mf5pHxYdrUEa5CVA--

