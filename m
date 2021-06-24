Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593E3B269D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 06:54:05 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwHNL-0004f9-Re
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 00:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwHLq-0002It-2A; Thu, 24 Jun 2021 00:52:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44793 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwHLn-0003Q5-8b; Thu, 24 Jun 2021 00:52:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9SRT0gTrz9sXG; Thu, 24 Jun 2021 14:52:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624510341;
 bh=fF/9K6+8B4SSAPFkJug2nMbZsXqy0BiZy3OwdskxGlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXStcxFcptDPR9bevciu5PcLfcA6ncVf/ofjx8oceuhkbo0e7XK8dQkoG1PpB6O5L
 0dW5tcZVw3bPOQ+WmQGV0hK7zatrCPlajR4z2ZJfqxx0zMGqipymRQWBCLGxZJj6og
 eErdc+8RANWl6cLso63Bp7zsJk7XHt/Pjh/C5A/M=
Date: Thu, 24 Jun 2021 13:29:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 03/10] target/ppc: Push real-mode handling into
 ppc_radix64_xlate
Message-ID: <YNP8HPVUgSlFkyAm@yekko>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-4-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HSTFdomFd0jwoA8Q"
Content-Disposition: inline
In-Reply-To: <20210621125115.67717-4-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HSTFdomFd0jwoA8Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 09:51:08AM -0300, Bruno Larsen (billionai) wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> This removes some incomplete duplication between
> ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.
> The former was correct wrt SPR_HRMOR and the latter was not.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu-radix64.c | 77 ++++++++++++++++++----------------------
>  1 file changed, 34 insertions(+), 43 deletions(-)
>=20
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 1c707d387d..dd5ae69052 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -465,7 +465,6 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>   */
>  static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                               MMUAccessType access_type,
> -                             bool relocation,
>                               hwaddr *raddr, int *psizep, int *protp,
>                               bool guest_visible)
>  {
> @@ -474,6 +473,37 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr =
eaddr,
>      ppc_v3_pate_t pate;
>      int psize, prot;
>      hwaddr g_raddr;
> +    bool relocation;
> +
> +    assert(!(msr_hv && cpu->vhyp));
> +
> +    relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr);
> +
> +    /* HV or virtual hypervisor Real Mode Access */
> +    if (!relocation && (msr_hv || cpu->vhyp)) {
> +        /* In real mode top 4 effective addr bits (mostly) ignored */
> +        *raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
> +
> +        /* In HV mode, add HRMOR if top EA bit is clear */
> +        if (msr_hv || !env->has_hv_mode) {

Not in scope, because this is a code motion, but that test looks
bogus.  If we don't have an HV mode, we won't have an HRMOR either.

> +            if (!(eaddr >> 63)) {
> +                *raddr |=3D env->spr[SPR_HRMOR];
> +           }
> +        }
> +        *protp =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        *psizep =3D TARGET_PAGE_BITS;
> +        return 0;
> +    }
> +
> +    /*
> +     * Check UPRT (we avoid the check in real mode to deal with
> +     * transitional states during kexec.
> +     */
> +    if (guest_visible && !ppc64_use_proc_tbl(cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "LPCR:UPRT not set in radix mode ! LPCR=3D"
> +                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> +    }
> =20
>      /* Virtual Mode Access - get the fully qualified address */
>      if (!ppc_radix64_get_fully_qualified_addr(&cpu->env, eaddr, &lpid, &=
pid)) {
> @@ -559,43 +589,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, v=
addr eaddr,
>                                   MMUAccessType access_type, int mmu_idx)
>  {
>      CPUState *cs =3D CPU(cpu);
> -    CPUPPCState *env =3D &cpu->env;
>      int page_size, prot;
> -    bool relocation;
>      hwaddr raddr;
> =20
> -    assert(!(msr_hv && cpu->vhyp));
> -
> -    relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr);
> -    /* HV or virtual hypervisor Real Mode Access */
> -    if (!relocation && (msr_hv || cpu->vhyp)) {
> -        /* In real mode top 4 effective addr bits (mostly) ignored */
> -        raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
> -
> -        /* In HV mode, add HRMOR if top EA bit is clear */
> -        if (msr_hv || !env->has_hv_mode) {
> -            if (!(eaddr >> 63)) {
> -                raddr |=3D env->spr[SPR_HRMOR];
> -           }
> -        }
> -        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_M=
ASK,
> -                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
> -                     TARGET_PAGE_SIZE);
> -        return 0;
> -    }
> -
> -    /*
> -     * Check UPRT (we avoid the check in real mode to deal with
> -     * transitional states during kexec.
> -     */
> -    if (!ppc64_use_proc_tbl(cpu)) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "LPCR:UPRT not set in radix mode ! LPCR=3D"
> -                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> -    }
> -
>      /* Translate eaddr to raddr (where raddr is addr qemu needs for acce=
ss) */
> -    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &raddr,
> +    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
>                            &page_size, &prot, true)) {
>          return 1;
>      }
> @@ -607,18 +605,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, v=
addr eaddr,
> =20
>  hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong ead=
dr)
>  {
> -    CPUPPCState *env =3D &cpu->env;
>      int psize, prot;
>      hwaddr raddr;
> =20
> -    /* Handle Real Mode */
> -    if ((msr_dr =3D=3D 0) && (msr_hv || cpu->vhyp)) {
> -        /* In real mode top 4 effective addr bits (mostly) ignored */
> -        return eaddr & 0x0FFFFFFFFFFFFFFFULL;
> -    }
> -
> -    if (ppc_radix64_xlate(cpu, eaddr, 0, msr_dr, &raddr, &psize,
> -                          &prot, false)) {
> +    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> +                          &psize, &prot, false)) {
>          return -1;
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HSTFdomFd0jwoA8Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT/BoACgkQbDjKyiDZ
s5IUCw/+LppV1NCJdWH2kaa4E/8fSDdyxYtUbUNFWWn8hUBcu6DkHQZBiiJFcM7c
Qd2wJms4839OX5Dt7zGJsueO1B1/kqeeq89NBw5FfS+DVz3N7Ix8Ip8UoIXOY13i
I/MZ/Tm6EQ754KonoAwd83yE0YzcrSdGXIOPoPfribQPORTFpglJqwEFXlPcg275
gTXkUjhSgWMxV/LAsmq+HbMPUts1jbVW6TGSqVjlRKU1fzkqkHWFNYwRSL3J3D65
WMH/CJUyOK7U+GS3Mp1idBYQfOA9LKKkaz1LuJo1deFttY7pJU0smNYsnN595OTQ
y1bwsfo9SCtXUIt1i9hPgEXTtosFEIdhI4EUXHsQmuPgApMZ0wwRkU1tVy5paqJV
eU5tXWYoqJsHVwJ4217j8o9UMHLaZaZ1t3b4nuD/etyFBEf7gZmCF7aUcc7Z0kMp
ya2sFNgZ7Jo4Ngc2+RNzoC22rCU3Dzg3tbGDpQBXTgaGaI/tsGr+oP7sBvUElsLO
K9/zyxRO2Q/uEgdcilDi9Z9NUcv9GhIr3PGLmeRsoicC+zCHTP63uNr2l2gaPo4+
8ylMvLV0OT1/ZI1yJcHXJJhq2xiwVVZQnBoetvSFILz3uwYtSdtHMybuMk94x5FC
zRu5V+FMxKCc2D13Q2DrAL54vOBEC1oVcyvmJwJLRwCDxpptegk=
=DGfm
-----END PGP SIGNATURE-----

--HSTFdomFd0jwoA8Q--

