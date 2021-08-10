Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1F3E5233
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:31:01 +0200 (CEST)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJPo-0003vC-3J
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDu-0008F2-AM; Tue, 10 Aug 2021 00:18:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDq-0002Qh-Hi; Tue, 10 Aug 2021 00:18:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR63Kwz9t8j; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=uYKXe9lXZqn16dMFkXMr2wZz1sYR2UA9ilUjdQG9wqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KB6mLTzl5NM+LgwCe9jLlMpi+HgqoHY1Obzp4pRhoRbbakbrX819m9tdxVmhZpMew
 hdeg0uzymVMS8RrKeq5rspOMiU8jjSX2vuGrONkudZVY4KwmwlCeziedgoEdF4DwE1
 2iLPwt3VwcyDBltN5i89eAGmvdNDCkUGrTUj940U=
Date: Tue, 10 Aug 2021 13:40:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 05/19] target/ppc/pmu_book3s_helper.c: eliminate code
 repetition
Message-ID: <YRH1GEgp/Uuy0o6P@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pC6SR2sHYO+phcX8"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-6-danielhb413@gmail.com>
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


--pC6SR2sHYO+phcX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:43AM -0300, Daniel Henrique Barboza wrote:
> We don't need a base_icount value in CPUPPCState for each PMC. All the
> calculation done after freeze will use the same base start value. Use a
> single 'pmu_base_icount' attribute that can be use to all PMCs.
>=20
> Likewise, the freeze count operations are going to be done for all
> available PMCs, so eliminate both freeze_PMC5_value() and
> freeze_PMC6_value() and use the new update_PMCs_on_freeze() that will
> update all PMCs.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Please fold this simplification into the initial patch.

> ---
>  target/ppc/cpu.h               |  8 +++++---
>  target/ppc/pmu_book3s_helper.c | 33 +++++++++++++--------------------
>  2 files changed, 18 insertions(+), 23 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 229abfe7ee..8cea8f2aca 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1176,9 +1176,11 @@ struct CPUPPCState {
>      uint64_t tm_dscr;
>      uint64_t tm_tar;
> =20
> -    /* PMU registers icount state */
> -    uint64_t pmc5_base_icount;
> -    uint64_t pmc6_base_icount;
> +    /*
> +     * PMU icount base value used by the PMU to calculate
> +     * instructions and cycles.
> +     */
> +    uint64_t pmu_base_icount;
>  };
> =20
>  #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index fe16fcfce0..0994531f65 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -28,22 +28,19 @@ static uint64_t get_cycles(uint64_t insns)
>      return insns * 4;
>  }
> =20
> -/* PMC5 always count instructions */
> -static void freeze_PMC5_value(CPUPPCState *env)
> -{
> -    uint64_t insns =3D get_insns() - env->pmc5_base_icount;
> -
> -    env->spr[SPR_POWER_PMC5] +=3D insns;
> -    env->pmc5_base_icount +=3D insns;
> -}
> -
> -/* PMC6 always count cycles */
> -static void freeze_PMC6_value(CPUPPCState *env)
> +/*
> + * Set all PMCs values after a PMU freeze via MMCR0_FC.
> + *
> + * There is no need to update the base icount of each PMC since
> + * the PMU is not running.
> + */
> +static void update_PMCs_on_freeze(CPUPPCState *env)
>  {
> -    uint64_t insns =3D get_insns() - env->pmc6_base_icount;
> +    uint64_t curr_icount =3D get_insns();
> =20
> -    env->spr[SPR_POWER_PMC6] +=3D get_cycles(insns);
> -    env->pmc6_base_icount +=3D insns;
> +    env->spr[SPR_POWER_PMC5] +=3D curr_icount - env->pmu_base_icount;
> +    env->spr[SPR_POWER_PMC6] +=3D get_cycles(curr_icount -
> +                                           env->pmu_base_icount);
>  }
> =20
>  void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> @@ -64,13 +61,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong=
 value)
>       */
>      if (curr_FC !=3D new_FC) {
>          if (!curr_FC) {
> -            freeze_PMC5_value(env);
> -            freeze_PMC6_value(env);
> +            update_PMCs_on_freeze(env);
>          } else {
> -            uint64_t curr_icount =3D get_insns();
> -
> -            env->pmc5_base_icount =3D curr_icount;
> -            env->pmc6_base_icount =3D curr_icount;
> +            env->pmu_base_icount =3D get_insns();
>          }
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pC6SR2sHYO+phcX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER9RgACgkQbDjKyiDZ
s5I+iQ/8DHYCiL2a+EoBiV5iIjiWzOgvLMnnP7toqaFi4Gw/miXZhFZV5iTlDHRp
jjp7TOCNznJMhhkuTT6YCNqiyP9fXpdEqLMS6vCcDcwoEjBq3U/PkfhXiQep4c8Y
rSLaQSRbaYAOtl5Jo/DWL60ygmOhk/DlbVzAbiZiNaizEZetTEFzg+hD6iN3+vsC
Y666cKTGTE1C98Ul5LH7CE973FH9pGTSWHQF6YWhn5XRldkV3wnV3UqkQsh/dy/Y
wJbG/nJkK0Uf0D4ZcJl8UK9VZhP95Lfvzjor1esY3FRTWY88zdDyFtJz3JRPo5cS
zJZO52XITDSeY8AoftSalu/EO48fhW81bW+kfkh9Td+tnAmGZYvmNV98Bv0ESK5f
dz+EOe4bD7JAOgeNp2kMHjFMCFqWWE21mq5sDIghE/7BdZY84M/u5w0Sg5LV4/ra
S+s+iZPTOqzdtVP9VWc1Y7nxXjLCP3ZAm65aueE2O0U/GXVhK2F5c+jSo4EeebpJ
piekurl+NsLlYUl8RKNF5t6xwKkveCEPSjcPaPJ+mmTJs1xUtD5+gIZFWaovahF2
KYXtRgUrg2iEAmkVsrYiF50bs79i0atF7sCJ0wuDrLCO7m+iFyH+cjZmd4JGJiS5
lwmjaBSE7G/e2aR/W+v07VbkfAKZm4Drojj7BoM+zsZtlp5Z8nw=
=d8lj
-----END PGP SIGNATURE-----

--pC6SR2sHYO+phcX8--

