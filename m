Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BC3B2803
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:54:26 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJFp-0006Je-9X
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAP-00032K-S0; Thu, 24 Jun 2021 02:48:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:40049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAN-0000gl-5A; Thu, 24 Jun 2021 02:48:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9W1V4ZKPz9sf9; Thu, 24 Jun 2021 16:48:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624517310;
 bh=ZEzKAGLFLJXDliw5zRDV1AB1YdqLpy1/R8dJSRNFbCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GPR9IqL02plbkdxNEm+0xtsIyuPZEoYjq6hfh0nE60eN0QkBrti5FUjsJVx3WxtnC
 eMJij7Ds5iqedkSztc8RCC+1mkNoTLnYhLeaVMeEUPF1xuU7ZQznFyzv7o3dzeRmpG
 SQ/9/NLBmrZ+cRkHvo4hBk7VmK8AnBHyx4TIssmc=
Date: Thu, 24 Jun 2021 16:48:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 10/10] target/ppc: fix address translation bug for
 radix mmus
Message-ID: <YNQqt5ent7PhEKTT@yekko>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-11-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FEaOFIsoBA9Bt48o"
Content-Disposition: inline
In-Reply-To: <20210621125115.67717-11-bruno.larsen@eldorado.org.br>
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
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FEaOFIsoBA9Bt48o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 09:51:15AM -0300, Bruno Larsen (billionai) wrote:
> This commit attempts to fix the first bug mentioned by Richard Henderson =
in
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
>=20
> To sumarize the bug here, when radix-style mmus are translating an
> address, they might need to call a second level of translation, with
> hypervisor privileges. However, the way it was being done up until
> this point meant that the second level translation had the same
> privileges as the first level.=20
>=20
> This patch attempts to correct that by making radix64_*_xlate functions
> receive the mmu_idx, and passing one with the correct permission for the
> second level translation.
>=20
> The mmuidx macros added by this patch are only correct for non-bookE
> mmus, because BookE style set the IS and DS bits inverted and there
> might be other subtle differences. However, there doesn't seem to be
> BookE cpus that have radix-style mmus, so we left a comment there to
> document the issue, in case a machine does have that and was missed.
>=20
> As part of this cleanup, we now need to send the correct mmmu_idx
> when calling get_phys_page_debug, otherwise we might not be able to see t=
he
> memory that the CPU could
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/internal.h    | 13 +++++++++++++
>  target/ppc/mmu-radix64.c | 37 +++++++++++++++++++++----------------
>  target/ppc/mmu-radix64.h |  2 +-
>  target/ppc/mmu_helper.c  |  8 +++++---
>  4 files changed, 40 insertions(+), 20 deletions(-)
>=20
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index f1fd3c8d04..11a0e22cc9 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -245,4 +245,17 @@ static inline int prot_for_access_type(MMUAccessType=
 access_type)
>      g_assert_not_reached();
>  }
> =20
> +/*
> + * These correspond to the mmu_idx values computed in
> + * hreg_compute_hflags_value. See the tables therein
> + */
> +static inline bool mmuidx_pr(int idx) { return !(idx & 1); }
> +/*
> + * This macro is only correct for non Book-E MMUs. We can add an if clau=
se
> + * to check for mmu model, but since those don't have the bug, we decide=
d to

Referring to "the bug" in a comment isn't very helpful.

> + * keep the code clean.
> + */
> +static inline bool mmuidx_real(int idx) { return idx & 2; }
> +static inline bool mmuidx_hv(int idx) { return idx & 4; }

I'd really prefer to have these in mmu-book3s-v3.h.  Yes, I know they
cover more than bookS.  But the trouble here is that "BookE" isn't
clear: does it mean only "true" BookE, or anything that's not BookS
including 40x, 44x, and 8xx.  I don't think these are correct for all
of the 4xx variants, for one.

We can move this out later if and when we actually have users for it
outside the BookS code.

>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index cbd404bfa4..5b0e62e676 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -155,7 +155,7 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MM=
UAccessType access_type,
> =20
>  static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access=
_type,
>                                     uint64_t pte, int *fault_cause, int *=
prot,
> -                                   bool partition_scoped)
> +                                   int mmu_idx, bool partition_scoped)
>  {
>      CPUPPCState *env =3D &cpu->env;
>      int need_prot;
> @@ -173,7 +173,8 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, M=
MUAccessType access_type,
>      /* Determine permissions allowed by Encoded Access Authority */
>      if (!partition_scoped && (pte & R_PTE_EAA_PRIV) && msr_pr) {
>          *prot =3D 0;
> -    } else if (msr_pr || (pte & R_PTE_EAA_PRIV) || partition_scoped) {
> +    } else if (mmuidx_pr(mmu_idx) || (pte & R_PTE_EAA_PRIV) ||
> +               partition_scoped) {

So.. it looks to me like hash64 and hash32 should also be using
mmu_idx instead of direct msr checks.  Would you care to tackle them
as well?

>          *prot =3D ppc_radix64_get_prot_eaa(pte);
>      } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) && !partition_scoped =
*/
>          *prot =3D ppc_radix64_get_prot_eaa(pte);
> @@ -299,7 +300,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPC=
CPU *cpu,
>                                                ppc_v3_pate_t pate,
>                                                hwaddr *h_raddr, int *h_pr=
ot,
>                                                int *h_page_size, bool pde=
_addr,
> -                                              bool guest_visible)
> +                                              int mmu_idx, bool guest_vi=
sible)
>  {
>      int fault_cause =3D 0;
>      hwaddr pte_addr;
> @@ -310,7 +311,8 @@ static int ppc_radix64_partition_scoped_xlate(PowerPC=
CPU *cpu,
>      if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_=
RPDB,
>                                pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_s=
ize,
>                                &pte, &fault_cause, &pte_addr) ||
> -        ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, h_pr=
ot, true)) {
> +        ppc_radix64_check_prot(cpu, access_type, pte,
> +                               &fault_cause, h_prot, mmu_idx, true)) {
>          if (pde_addr) { /* address being translated was that of a guest =
pde */
>              fault_cause |=3D DSISR_PRTABLE_FAULT;
>          }
> @@ -332,7 +334,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>                                              vaddr eaddr, uint64_t pid,
>                                              ppc_v3_pate_t pate, hwaddr *=
g_raddr,
>                                              int *g_prot, int *g_page_siz=
e,
> -                                            bool guest_visible)
> +                                            int mmu_idx, bool guest_visi=
ble)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -367,7 +369,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>          ret =3D ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_=
addr,
>                                                   pate, &h_raddr, &h_prot,
>                                                   &h_page_size, true,
> -                                                 guest_visible);
> +            /* mmu_idx is 5 because we're translating from hypervisor sc=
ope */
> +                                                 5, guest_visible);
>          if (ret) {
>              return ret;
>          }
> @@ -407,7 +410,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>              ret =3D ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, pt=
e_addr,
>                                                       pate, &h_raddr, &h_=
prot,
>                                                       &h_page_size, true,
> -                                                     guest_visible);
> +            /* mmu_idx is 5 because we're translating from hypervisor sc=
ope */
> +                                                     5, guest_visible);
>              if (ret) {
>                  return ret;
>              }
> @@ -431,7 +435,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>          *g_raddr =3D (rpn & ~mask) | (eaddr & mask);
>      }
> =20
> -    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, g_pr=
ot, false)) {
> +    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause,
> +                               g_prot, mmu_idx, false)) {
>          /* Access denied due to protection */
>          if (guest_visible) {
>              ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
> @@ -464,7 +469,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>   *              +-------------+----------------+---------------+
>   */
>  bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType acces=
s_type,
> -                       hwaddr *raddr, int *psizep, int *protp,
> +                       hwaddr *raddr, int *psizep, int *protp, int mmu_i=
dx,
>                         bool guest_visible)
>  {
>      CPUPPCState *env =3D &cpu->env;
> @@ -474,17 +479,17 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr=
, MMUAccessType access_type,
>      hwaddr g_raddr;
>      bool relocation;
> =20
> -    assert(!(msr_hv && cpu->vhyp));
> +    assert(!(mmuidx_hv(mmu_idx) && cpu->vhyp));
> =20
> -    relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr);
> +    relocation =3D !mmuidx_real(mmu_idx);
> =20
>      /* HV or virtual hypervisor Real Mode Access */
> -    if (!relocation && (msr_hv || cpu->vhyp)) {
> +    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
>          /* In real mode top 4 effective addr bits (mostly) ignored */
>          *raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
> =20
>          /* In HV mode, add HRMOR if top EA bit is clear */
> -        if (msr_hv || !env->has_hv_mode) {
> +        if (mmuidx_hv(mmu_idx) || !env->has_hv_mode) {
>              if (!(eaddr >> 63)) {
>                  *raddr |=3D env->spr[SPR_HRMOR];
>             }
> @@ -546,7 +551,7 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, =
MMUAccessType access_type,
>      if (relocation) {
>          int ret =3D ppc_radix64_process_scoped_xlate(cpu, access_type, e=
addr, pid,
>                                                     pate, &g_raddr, &prot,
> -                                                   &psize, guest_visible=
);
> +                                                   &psize, mmu_idx, gues=
t_visible);
>          if (ret) {
>              return false;
>          }
> @@ -564,13 +569,13 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr=
, MMUAccessType access_type,
>           * quadrants 1 or 2. Translates a guest real address to a host
>           * real address.
>           */
> -        if (lpid || !msr_hv) {
> +        if (lpid || !mmuidx_hv(mmu_idx)) {
>              int ret;
> =20
>              ret =3D ppc_radix64_partition_scoped_xlate(cpu, access_type,=
 eaddr,
>                                                       g_raddr, pate, radd=
r,
>                                                       &prot, &psize, fals=
e,
> -                                                     guest_visible);
> +                                                     mmu_idx, guest_visi=
ble);
>              if (ret) {
>                  return false;
>              }
> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
> index 6b13b89b64..b70357cf34 100644
> --- a/target/ppc/mmu-radix64.h
> +++ b/target/ppc/mmu-radix64.h
> @@ -45,7 +45,7 @@
>  #ifdef TARGET_PPC64
> =20
>  bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType acces=
s_type,
> -                       hwaddr *raddr, int *psizep, int *protp,
> +                       hwaddr *raddr, int *psizep, int *protp, int mmu_i=
dx,
>                         bool guest_visible);
> =20
>  static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index ba1952c77d..9dcdf88597 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2908,7 +2908,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>      case POWERPC_MMU_3_00:
>          if (ppc64_v3_radix(cpu)) {
>              return ppc_radix64_xlate(cpu, eaddr, access_type,
> -                                     raddrp, psizep, protp, guest_visibl=
e);
> +                                     raddrp, psizep, protp, mmu_idx, gue=
st_visible);
>          }
>          /* fall through */
>      case POWERPC_MMU_64B:
> @@ -2941,8 +2941,10 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, v=
addr addr)
>       * try an MMU_DATA_LOAD, we may not be able to read instructions
>       * mapped by code TLBs, so we also try a MMU_INST_FETCH.
>       */
> -    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
> -        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
> +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p,
> +                  cpu_mmu_index(&cpu->env, false), false) ||
> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p,
> +                  cpu_mmu_index(&cpu->env, true), false)) {
>          return raddr & TARGET_PAGE_MASK;
>      }
>      return -1;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FEaOFIsoBA9Bt48o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDUKrUACgkQbDjKyiDZ
s5Ij5RAAhefMXhpfF2nqU1VbSMglRA91vTzUbjA3MgJmiXMgDf4TAfVsETQKT8JF
FglD989FfxUwnIEHFk9PcbqDYy3KGwcJ7xpjQo1o6Lf1t+JW3oU26ZuDmhhzwmeI
AGhFN3WA2strge9ZVoQaPv1wU5XCfnVp0tys+dwql4rqrzkiuwthVW1GwAbKU1ll
7NZYZnGufz/zAg/+QbtH5L9M5cUjdfwa7ofN2nbvX/JBPyJq0h1ryrsnpFun1qGy
ZyQt26WEGP9fJwoaepiybtttvYOv8NLD0NajvoFwIqdn4tpoVdY/3OLusTlEZGjO
3R5JI2It+Wvz4ckD3w0Fqfhpu7CFCn+84ks1UCSNvN2hWWXbMxtx7/YvZP8MR0Qa
XngNAN628LkTlPkynZ4piS7VC2sjdPOT95oemeDjxsbxfxUvFmbVAUhLvaJ33N+E
/t4SEODFBAnAZs5g/RWD3VLVcoMmrZ0KlCvRPlyz7B5I1G89YyKMO2IEBsr0P78f
0aOJ9WBXT4NOFs53Sgy0q+cFxHE1rMQMn/LMeVMlOnroExzbbw+WEEyB/50wKn3F
8K7Pjl7OnAdVGgJxqnkmrvFgBWmKnkq3ZPEEdZOeP3zjPyz9Ua42BECrd40mZCOG
flhEyKveoveZi8N6UhxGKlKTgHabUSqyxWCgyesY1zCe9+CRXvc=
=yMlM
-----END PGP SIGNATURE-----

--FEaOFIsoBA9Bt48o--

