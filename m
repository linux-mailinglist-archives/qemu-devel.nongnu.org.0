Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5EA3BB67C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:47:20 +0200 (CEST)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GVr-0003g1-LX
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0GSF-0001el-5P; Mon, 05 Jul 2021 00:43:35 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33447 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0GSC-0008MB-FS; Mon, 05 Jul 2021 00:43:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJCk02hSbz9sXN; Mon,  5 Jul 2021 14:43:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625460200;
 bh=BxMlP0il/8VQMNIW3sQp4DtanEl8bYzQ9Mqggr8zYlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ChOVL3VF2McYc66cmwtpsud0KsSLdmi2J2+R0ZhLT3LenpbtN/Q//KwCf3EHnNGh7
 3dsaoIkWXtRrq+KOWab8mtq8d0tXBLd8kFKtYasxDNwnIkkMYLQsl/JjYBLhHnjrst
 FjPzQqttwt6/Zidg09bUtW3u+wsnzSjMLa19S2Rw=
Date: Mon, 5 Jul 2021 14:24:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v4 2/3] target/ppc: change ppc_hash32_xlate to use mmu_idx
Message-ID: <YOKJco6ebWubvDwx@yekko>
References: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
 <20210628133610.1143-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uPpUg17Pf0woNnsV"
Content-Disposition: inline
In-Reply-To: <20210628133610.1143-3-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uPpUg17Pf0woNnsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 10:36:09AM -0300, Bruno Larsen (billionai) wrote:
> Changed hash32 address translation to use the supplied mmu_idx, instead
> of using what was stored in the msr, for parity purposes (radix64
> already uses that).

Well.. parity and conceptual correctness.  The translation is supposed
to use mmu_idx, not look at the CPU again to get the right context.
AFAIK there isn't a situation in hash32 where they'll get out of sync,
but nothing guarantees that.

>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/mmu-hash32.c | 40 +++++++++++++++++++---------------------
>  target/ppc/mmu-hash32.h |  2 +-
>  target/ppc/mmu_helper.c |  2 +-
>  3 files changed, 21 insertions(+), 23 deletions(-)
>=20
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index 6a07c345e4..0691d553a3 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -25,6 +25,7 @@
>  #include "kvm_ppc.h"
>  #include "internal.h"
>  #include "mmu-hash32.h"
> +#include "mmu-book3s-v3.h"

So, the mmu_idx values happen to have the same values for hash32 as
for book3sv3, but that's arguably a coincidence, and including a
book3sv3 header in hash32 code looks really dubious.

I think the right approach is to duplicate the helper macros in
mmu-hash32.h for now.  We can unify them later with a more thorough
review (which would probably involve creating a new header for things
common to all BookS family MMUs).


Apart from those nits,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>  #include "exec/log.h"
> =20
>  /* #define DEBUG_BAT */
> @@ -86,25 +87,22 @@ static int ppc_hash32_pp_prot(int key, int pp, int nx)
>      return prot;
>  }
> =20
> -static int ppc_hash32_pte_prot(PowerPCCPU *cpu,
> +static int ppc_hash32_pte_prot(int mmu_idx,
>                                 target_ulong sr, ppc_hash_pte32_t pte)
>  {
> -    CPUPPCState *env =3D &cpu->env;
>      unsigned pp, key;
> =20
> -    key =3D !!(msr_pr ? (sr & SR32_KP) : (sr & SR32_KS));
> +    key =3D !!(mmuidx_pr(mmu_idx) ? (sr & SR32_KP) : (sr & SR32_KS));
>      pp =3D pte.pte1 & HPTE32_R_PP;
> =20
>      return ppc_hash32_pp_prot(key, pp, !!(sr & SR32_NX));
>  }
> =20
> -static target_ulong hash32_bat_size(PowerPCCPU *cpu,
> +static target_ulong hash32_bat_size(int mmu_idx,
>                                      target_ulong batu, target_ulong batl)
>  {
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    if ((msr_pr && !(batu & BATU32_VP))
> -        || (!msr_pr && !(batu & BATU32_VS))) {
> +    if ((mmuidx_pr(mmu_idx) && !(batu & BATU32_VP))
> +        || (!mmuidx_pr(mmu_idx) && !(batu & BATU32_VS))) {
>          return 0;
>      }
> =20
> @@ -137,14 +135,13 @@ static target_ulong hash32_bat_601_size(PowerPCCPU =
*cpu,
>      return BATU32_BEPI & ~((batl & BATL32_601_BL) << 17);
>  }
> =20
> -static int hash32_bat_601_prot(PowerPCCPU *cpu,
> +static int hash32_bat_601_prot(int mmu_idx,
>                                 target_ulong batu, target_ulong batl)
>  {
> -    CPUPPCState *env =3D &cpu->env;
>      int key, pp;
> =20
>      pp =3D batu & BATU32_601_PP;
> -    if (msr_pr =3D=3D 0) {
> +    if (mmuidx_pr(mmu_idx) =3D=3D 0) {
>          key =3D !!(batu & BATU32_601_KS);
>      } else {
>          key =3D !!(batu & BATU32_601_KP);
> @@ -153,7 +150,8 @@ static int hash32_bat_601_prot(PowerPCCPU *cpu,
>  }
> =20
>  static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
> -                                    MMUAccessType access_type, int *prot)
> +                                    MMUAccessType access_type, int *prot,
> +                                    int mmu_idx)
>  {
>      CPUPPCState *env =3D &cpu->env;
>      target_ulong *BATlt, *BATut;
> @@ -177,7 +175,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, =
target_ulong ea,
>          if (unlikely(env->mmu_model =3D=3D POWERPC_MMU_601)) {
>              mask =3D hash32_bat_601_size(cpu, batu, batl);
>          } else {
> -            mask =3D hash32_bat_size(cpu, batu, batl);
> +            mask =3D hash32_bat_size(mmu_idx, batu, batl);
>          }
>          LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
>                   " BATl " TARGET_FMT_lx "\n", __func__,
> @@ -187,7 +185,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, =
target_ulong ea,
>              hwaddr raddr =3D (batl & mask) | (ea & ~mask);
> =20
>              if (unlikely(env->mmu_model =3D=3D POWERPC_MMU_601)) {
> -                *prot =3D hash32_bat_601_prot(cpu, batu, batl);
> +                *prot =3D hash32_bat_601_prot(mmu_idx, batu, batl);
>              } else {
>                  *prot =3D hash32_bat_prot(cpu, batu, batl);
>              }
> @@ -221,12 +219,12 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu=
, target_ulong ea,
>  static bool ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
>                                      target_ulong eaddr,
>                                      MMUAccessType access_type,
> -                                    hwaddr *raddr, int *prot,
> +                                    hwaddr *raddr, int *prot, int mmu_id=
x,
>                                      bool guest_visible)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> -    int key =3D !!(msr_pr ? (sr & SR32_KP) : (sr & SR32_KS));
> +    int key =3D !!(mmuidx_pr(mmu_idx) ? (sr & SR32_KP) : (sr & SR32_KS));
> =20
>      qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
> =20
> @@ -425,7 +423,7 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, p=
pc_hash_pte32_t pte,
>  }
> =20
>  bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access=
_type,
> -                      hwaddr *raddrp, int *psizep, int *protp,
> +                      hwaddr *raddrp, int *psizep, int *protp, int mmu_i=
dx,
>                        bool guest_visible)
>  {
>      CPUState *cs =3D CPU(cpu);
> @@ -441,7 +439,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, M=
MUAccessType access_type,
>      *psizep =3D TARGET_PAGE_BITS;
> =20
>      /* 1. Handle real mode accesses */
> -    if (access_type =3D=3D MMU_INST_FETCH ? !msr_ir : !msr_dr) {
> +    if (mmuidx_real(mmu_idx)) {
>          /* Translation is off */
>          *raddrp =3D eaddr;
>          *protp =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> @@ -452,7 +450,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, M=
MUAccessType access_type,
> =20
>      /* 2. Check Block Address Translation entries (BATs) */
>      if (env->nb_BATs !=3D 0) {
> -        raddr =3D ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp);
> +        raddr =3D ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp, =
mmu_idx);
>          if (raddr !=3D -1) {
>              if (need_prot & ~*protp) {
>                  if (guest_visible) {
> @@ -483,7 +481,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, M=
MUAccessType access_type,
>      /* 4. Handle direct store segments */
>      if (sr & SR32_T) {
>          return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
> -                                       raddrp, protp, guest_visible);
> +                                       raddrp, protp, mmu_idx, guest_vis=
ible);
>      }
> =20
>      /* 5. Check for segment level no-execute violation */
> @@ -520,7 +518,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, M=
MUAccessType access_type,
> =20
>      /* 7. Check access permissions */
> =20
> -    prot =3D ppc_hash32_pte_prot(cpu, sr, pte);
> +    prot =3D ppc_hash32_pte_prot(mmu_idx, sr, pte);
> =20
>      if (need_prot & ~prot) {
>          /* Access right violation */
> diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
> index 8694eccabd..807d9bc6e8 100644
> --- a/target/ppc/mmu-hash32.h
> +++ b/target/ppc/mmu-hash32.h
> @@ -5,7 +5,7 @@
> =20
>  hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
>  bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access=
_type,
> -                      hwaddr *raddrp, int *psizep, int *protp,
> +                      hwaddr *raddrp, int *psizep, int *protp, int mmu_i=
dx,
>                        bool guest_visible);
> =20
>  /*
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 9dcdf88597..a3381e1aa0 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2922,7 +2922,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>      case POWERPC_MMU_32B:
>      case POWERPC_MMU_601:
>          return ppc_hash32_xlate(cpu, eaddr, access_type,
> -                                raddrp, psizep, protp, guest_visible);
> +                                raddrp, psizep, protp, mmu_idx, guest_vi=
sible);
> =20
>      default:
>          return ppc_jumbo_xlate(cpu, eaddr, access_type, raddrp,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uPpUg17Pf0woNnsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDiiXIACgkQbDjKyiDZ
s5IWHQ//Tlm/6AqxMR4ZPciFvzLqkOEvAELBkuzSB7AiJAkcvQDWK4Ynsx7TBL4a
UkUHW2ZiQMifZ4wNERWSNr9dwEpsem2HbgM9jGhJEkm2vHBewF5VjKlYWRGRyJgA
phztdiobMubQKmvPIEBW+nEpzpo1H5W5otzenbY2P2o/lSMJMcSE/0OkVkvF8HlS
jezD8xucZ9AGf7BcsRpPh2nrMFY+zWW1neya8NyQMfejBGT4v0fdit6AjnLbH6BK
62dOLTLshXpQkwiyXqS1xcXrS4zfZN0TmmN1mn1Mm3Yo7nhA9GRwMroGZntXnmwt
KrzR35oFErLxlREP1gHlNdlRQ6/P+BL2aqcAHGwhquYQXPXYro6KcUp4x0PZwEoM
+5C866FeKQDrZ/wPv94klp9QWyfxHbwBLBXWbaZkNyZkSv7M+47eOg/S/ZE7PFSn
oAmcf6nLY641eQobifQCGeO/XCNtT5EY3XoC8KvoIqaai1k39nOs9R9JUJALC0Ju
JVCA/v8hzeel72O3bq3NV+HcijMLgAIZlFBErE/K11nDu/wNDBH6//rfHDv1P+vD
Kybmak6AZITEEBOt+olB4Tr8UAMW4eGFBPXOplezQRgva5erSRErJCAs26bMGyXY
Wtg1/mgaXdyNteV8lH8UfW9HVulcVLFkDX92H1wGlGo5Vp/Yq0Y=
=v7+m
-----END PGP SIGNATURE-----

--uPpUg17Pf0woNnsV--

