Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C563F6EE9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:45:12 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIlip-0002JF-0L
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIle7-0008K2-DE; Wed, 25 Aug 2021 01:40:19 -0400
Received: from ozlabs.org ([203.11.71.1]:40159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIldz-0006DC-FK; Wed, 25 Aug 2021 01:40:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvZYx3Nv5z9sXN; Wed, 25 Aug 2021 15:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629870005;
 bh=fTIV6O/E8oOGB3DFoJvFDohZhXBbyS42SGBT3XM9Fgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxAdymxrYFaMr6A1JpAHzhchigMWOhpH0R/mnerH3FLL691KtWpMPG/S75mKQnr3y
 AzHx2ImfzxcI8r7ALHhFav6DyYF6P4v+Cn8o7pNbPfki/B6clFnYzRDz6PPxuUsw8+
 fh/jkBuvGMB1m9L6hKAiWdlyP/CNiFAV1/Pr24SI=
Date: Wed, 25 Aug 2021 15:32:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 07/16] target/ppc/power8_pmu.c: add PM_RUN_INST_CMPL
 (0xFA) event
Message-ID: <YSXV6QcYyMwGYSoN@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-8-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AJP5abc6/0KC6yP0"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-8-danielhb413@gmail.com>
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
Cc: gustavo.romero@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AJP5abc6/0KC6yP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:23PM -0300, Daniel Henrique Barboza wrote:
> PM_RUN_INST_CMPL, instructions completed with the run latch set, is
> the architected PowerISA v3.1 event defined with PMC4SEL =3D 0xFA.
>=20
> Implement it by checking for the CTRL RUN bit before incrementing the
> counter.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h        |  3 +++
>  target/ppc/power8_pmu.c | 25 ++++++++++++++++++++-----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e5df644a3c..60e5e1159a 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -358,6 +358,9 @@ typedef struct ppc_v3_pate_t {
>  #define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
>  #define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
> =20
> +/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
> +#define CTRL_RUN PPC_BIT(63)
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
> index 311eaa358f..9154fca5fd 100644
> --- a/target/ppc/power8_pmu.c
> +++ b/target/ppc/power8_pmu.c
> @@ -131,10 +131,10 @@ void helper_store_mmcr0(CPUPPCState *env, target_ul=
ong value)
>      }
>  }
> =20
> -static bool pmc_counting_insns(CPUPPCState *env, int sprn)
> +static bool pmc_counting_insns(CPUPPCState *env, int sprn,
> +                               uint8_t event)
>  {
>      bool ret =3D false;
> -    uint8_t event;
> =20
>      if (sprn =3D=3D SPR_POWER_PMC5) {
>          return true;
> @@ -156,8 +156,15 @@ static bool pmc_counting_insns(CPUPPCState *env, int=
 sprn)
>          return event =3D=3D 0x2 || event =3D=3D 0xFE;
>      case SPR_POWER_PMC2:
>      case SPR_POWER_PMC3:
> -    case SPR_POWER_PMC4:
>          return event =3D=3D 0x2;
> +    case SPR_POWER_PMC4:
> +        /*
> +         * Event 0xFA is the "instructions completed with run latch
> +         * set" event. Consider it as instruction counting event.
> +         * The caller is responsible for handling it separately
> +         * from PM_INST_CMPL.
> +         */
> +        return event =3D=3D 0x2 || event =3D=3D 0xFA;
>      default:
>          break;
>      }
> @@ -171,8 +178,16 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num=
_insns)
>      int sprn;
> =20
>      for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
> -        if (pmc_counting_insns(env, sprn)) {
> -            env->spr[sprn] +=3D num_insns;
> +        uint8_t event =3D get_PMC_event(env, sprn);
> +
> +        if (pmc_counting_insns(env, sprn, event)) {
> +            if (sprn =3D=3D SPR_POWER_PMC4 && event =3D=3D 0xFA) {
> +                if (env->spr[SPR_CTRL] & CTRL_RUN) {
> +                    env->spr[SPR_POWER_PMC4] +=3D num_insns;

This is only correct if changes to CTRL force a new translation
block.  Is that true at the moment?

> +                }
> +            } else {
> +                env->spr[sprn] +=3D num_insns;
> +            }
>          }
>      }
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AJP5abc6/0KC6yP0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl1ekACgkQbDjKyiDZ
s5I1/BAAwrjqQfjaEmdQKWZCmHYqw39ivDKl/hT80uawFGnWOTE3JNqzgyMu9tlE
hbwCORGMQdIsAFA50z8jnmPjmxYzcKEI3Q9DfebKr5s2kPJopddkEWYACIWgA1k7
5PyIFkA/lTRokGT9jYaQxJWRNu1PAykjTPW6lF+nfT+vbR4MYTjski76X03pd1VT
IGq1p0NkPIeEkR8RVeg8p+Eynn0XQyY/cAUOBkC0CPG8DWKGyT9H/Niviw/AAWfl
ntzaNr1hRkF62V6Ya/uXVC8Qb9PvJaj3Yy13ZWPnC4Aa4Sn7mPGO4yHzUIZ1U55o
8efOQRK8V+5zqSyi3TNxcBGDDmRmLhoblEWhfpAUDD63JEOQbj+RVdjlUvgNkprg
I6sqDH5XyZQD51AVay9DyBGbSYQyTql9Wr2cCdprlqQ+7gdS67AKeEtVYwYz2Afr
LcibWaWhRmtknHZvMSPX7aL/wVFcCpSdGyhLzqux653/h4VeQ3cBDBGeRp/XV9MP
0zy59BWv2BbEfzcQ+mX8bEcb8Ef8Rlll0YEKj6kXWHlvM0D9vgUcFolUtTB0qYs9
crRYmnhgtfwgEw6jJm3yTSyv0puH88NGywg0Ag0U/U1Bg2ZhonHQbifTrGLe3eYb
03VKSYUlOEU1LKG3RQ1xdtY7ScyWtMS517kfZL6Qqky3G5NOjOA=
=0mhG
-----END PGP SIGNATURE-----

--AJP5abc6/0KC6yP0--

