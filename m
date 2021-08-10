Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9F3E522B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:26:49 +0200 (CEST)
Received: from localhost ([::1]:57636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJLk-0003qO-EW
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDv-0008IF-6Z; Tue, 10 Aug 2021 00:18:43 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDq-0002Qg-Gv; Tue, 10 Aug 2021 00:18:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR6n6Vz9t9b; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=/1T3DMcuDK9Pm+dgNfn9kZgQ/MLscr5u3lMVjxbf/Tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DfD73CGaXO+OXQOhclZXA6mxQ95+bTVNzcMtbQODEAeklsh/uuoiPenHfXhgZ+yVN
 +iPusvTzm6QQj3d4lFJu4Wdb0VbkgELgVjQBE7Zqp75senoGFxINu/DXQpLIPFX8dL
 UY432SWa3D+HHv7G8hlfXH9tLLxp7WElYuxn+qm8=
Date: Tue, 10 Aug 2021 13:42:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 06/19] target/ppc/pmu_book3s_helper: enable PMC1-PMC4
 events
Message-ID: <YRH1j9vNmgs71/Z6@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZPIpGEhWvVtwtGJP"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-7-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZPIpGEhWvVtwtGJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:44AM -0300, Daniel Henrique Barboza wrote:
> So far the PMU logic was using PMC5 for instruction counting (linux
> kernel PM_INST_CMPL) and PMC6 to count cycles (PM_CYC). We aren't using
> PMCs 1-4.
>=20
> Let's enable all PMCs to count these 2 events we already provide. The
> logic used to calculate PMC5 is now being provided by
> update_PMC_PM_INST_CMPL() and PMC6 logic is now implemented in
> update_PMC_PM_CYC().
>=20
> The enablement of these 2 events for all PMUs are done by using the
> Linux kernel definition of those events: 0x02 for PM_INST_CMPL and 0x1e
> for PM_CYC,

I'm confused by this.  Surely the specific values here should be
defined by the hardware, not by Linux.

> all of those defined by specific bits in MMCR1 for each PMC.
> PMCs 1-4 relies on the correct event to be defined in MMCR1. PMC5 and
> PMC6 will count PM_INST_CMPL and PMC_CYC, respectively, regardless of
> MMCR1 setup.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h               |  8 +++++
>  target/ppc/pmu_book3s_helper.c | 60 ++++++++++++++++++++++++++++++++--
>  2 files changed, 65 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 8cea8f2aca..afd9cd402b 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -350,6 +350,14 @@ typedef struct ppc_v3_pate_t {
>  #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>  #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> =20
> +#define MMCR1_PMC1SEL_SHIFT (63 - 39)
> +#define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> +#define MMCR1_PMC2SEL_SHIFT (63 - 47)
> +#define MMCR1_PMC2SEL PPC_BITMASK(40, 47)
> +#define MMCR1_PMC3SEL_SHIFT (63 - 55)
> +#define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
> +#define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index 0994531f65..99e62bd37b 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -28,6 +28,56 @@ static uint64_t get_cycles(uint64_t insns)
>      return insns * 4;
>  }
> =20
> +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> +                                    uint64_t curr_icount)
> +{
> +    env->spr[sprn] +=3D curr_icount - env->pmu_base_icount;
> +}
> +
> +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> +                              uint64_t curr_icount)
> +{
> +    uint64_t insns =3D curr_icount - env->pmu_base_icount;
> +    env->spr[sprn] +=3D get_cycles(insns);
> +}
> +
> +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> +                                        uint64_t curr_icount)
> +{
> +    int event;
> +
> +    switch (sprn) {
> +    case SPR_POWER_PMC1:
> +        event =3D MMCR1_PMC1SEL & env->spr[SPR_POWER_MMCR1];
> +        event =3D event >> MMCR1_PMC1SEL_SHIFT;
> +        break;
> +    case SPR_POWER_PMC2:
> +        event =3D MMCR1_PMC2SEL & env->spr[SPR_POWER_MMCR1];
> +        event =3D event >> MMCR1_PMC2SEL_SHIFT;
> +        break;
> +    case SPR_POWER_PMC3:
> +        event =3D MMCR1_PMC3SEL & env->spr[SPR_POWER_MMCR1];
> +        event =3D event >> MMCR1_PMC3SEL_SHIFT;
> +        break;
> +    case SPR_POWER_PMC4:
> +        event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
> +        break;
> +    default:
> +        return;
> +    }
> +
> +    switch (event) {
> +    case 0x2:
> +        update_PMC_PM_INST_CMPL(env, sprn, curr_icount);
> +        break;
> +    case 0x1E:
> +        update_PMC_PM_CYC(env, sprn, curr_icount);
> +        break;
> +    default:
> +        return;
> +    }
> +}
> +
>  /*
>   * Set all PMCs values after a PMU freeze via MMCR0_FC.
>   *
> @@ -37,10 +87,14 @@ static uint64_t get_cycles(uint64_t insns)
>  static void update_PMCs_on_freeze(CPUPPCState *env)
>  {
>      uint64_t curr_icount =3D get_insns();
> +    int sprn;
> +
> +    for (sprn =3D SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
> +        update_programmable_PMC_reg(env, sprn, curr_icount);
> +    }
> =20
> -    env->spr[SPR_POWER_PMC5] +=3D curr_icount - env->pmu_base_icount;
> -    env->spr[SPR_POWER_PMC6] +=3D get_cycles(curr_icount -
> -                                           env->pmu_base_icount);
> +    update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, curr_icount);
> +    update_PMC_PM_CYC(env, SPR_POWER_PMC6, curr_icount);
>  }
> =20
>  void helper_store_mmcr0(CPUPPCState *env, target_ulong value)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZPIpGEhWvVtwtGJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER9Y8ACgkQbDjKyiDZ
s5LHohAArdXGNIXxO2TcTZpmuZiGyVBpoQRbPn52Q2rgaM6ONSTZlnv6bPuTicKV
bWaqPezutRwR2tLT3h0FfEsfTIcMa3LxNg27iX/L/srxTJTM4QmzpqQRnas4wCaW
FpJL5nHmU5ObbTAwscBeDMeKRtU4tWkFv5HTYjrv4Xi+aJlgrhJ+D5RPpP3ccE9b
8Pu0Q4XwWpyFu7Nfs66nvtsGm8fmq/UuA0I4hmRPqMyaVJJPL9HPHVW6UdHDFfaK
vL0JazGvtWr9BjBnJLKW3Mtvu6wutCMETvRiDDjBnMyrkm6HeXKqzDMi2sQJYd9N
yNoRWf9Qwrj/fpdOmsZbfg9VoKOJBWAhKsrFmBGc2bw4i/vNPyvEajPQ+LXYBTtW
Y5CVB2TurG5O4w0SbxdFC0MH9obg+q/80sLq6ipnuUfiDARE/zCg87m12zs4yPEt
H8v5QruzAwJAt9MiO0j0b965dCJ9lgTjHhvfOC6ex16xh46yMAaZSuw5hcYW2KZ+
6r9TnsLDKIeVhRXclhHBgM9hGThJMK/SzLdWH8u+nZogVbSzu2Ad8I0tjUbEIPuE
Dgnix3S7WizJd44O/7XjmiKqO8z7AjPDtdNA4+fuFL28YTfJIZti1+beEBLwUU/6
n424AMP8rd8IQ3ScbpJ1aeFpPTi9/bg0QoSmnDg+XZBg8iZRYW8=
=cWBw
-----END PGP SIGNATURE-----

--ZPIpGEhWvVtwtGJP--

