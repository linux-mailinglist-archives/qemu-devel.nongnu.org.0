Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AA7398397
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:50:56 +0200 (CEST)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLeR-00071k-TX
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loLYR-0004Lv-AR; Wed, 02 Jun 2021 03:44:45 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loLYM-0000Ah-21; Wed, 02 Jun 2021 03:44:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw1JB47Frz9sVb; Wed,  2 Jun 2021 17:44:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622619866;
 bh=TnXFW4m7cFoNScl1t3iGFVDZ6xT3k3/8EWozP1ubLyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LeLhxmRMMNc7X2ci6Z+vgD8M5SyIRAtnkdLZS/YeaEirvt82BpPuPWXk8YwZJ92T7
 c1lnP6unGTm7O4HKDLPPc6vHfFwluwl86UPq+abqznZAWuEOGgZMKGk6iBk9GHy0MC
 gfjyYsI7hPtRTI0AKGeAjRuHmGGC3B3Wiha8gAco=
Date: Wed, 2 Jun 2021 17:37:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 1/5] target/ppc: powerpc_excp: Move lpes code to
 where it is used
Message-ID: <YLc1Im3IuZNW3Ykf@yekko>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XKLdptHGuMBToFQ9"
Content-Disposition: inline
In-Reply-To: <20210601214649.785647-2-farosas@linux.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XKLdptHGuMBToFQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 06:46:45PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1.

> ---
>  target/ppc/excp_helper.c | 47 +++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 04418054f5..5ea8503b46 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -333,7 +333,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>      CPUPPCState *env =3D &cpu->env;
>      target_ulong msr, new_msr, vector;
>      int srr0, srr1, asrr0, asrr1, lev =3D -1;
> -    bool lpes0;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                    " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
> @@ -365,27 +364,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>          excp =3D powerpc_reset_wakeup(cs, env, excp, &msr);
>      }
> =20
> -    /*
> -     * Exception targeting modifiers
> -     *
> -     * LPES0 is supported on POWER7/8/9
> -     * LPES1 is not supported (old iSeries mode)
> -     *
> -     * On anything else, we behave as if LPES0 is 1
> -     * (externals don't alter MSR:HV)
> -     */
> -#if defined(TARGET_PPC64)
> -    if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> -        excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> -        excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> -        excp_model =3D=3D POWERPC_EXCP_POWER10) {
> -        lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -    } else
> -#endif /* defined(TARGET_PPC64) */
> -    {
> -        lpes0 =3D true;
> -    }
> -
>      /*
>       * Hypervisor emulation assistance interrupt only exists on server
>       * arch 2.05 server or later. We also don't want to generate it if
> @@ -473,8 +451,32 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>          msr |=3D env->error_code;
>          break;
>      case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
> +    {
> +        bool lpes0;
> +
>          cs =3D CPU(cpu);
> =20
> +        /*
> +         * Exception targeting modifiers
> +         *
> +         * LPES0 is supported on POWER7/8/9
> +         * LPES1 is not supported (old iSeries mode)
> +         *
> +         * On anything else, we behave as if LPES0 is 1
> +         * (externals don't alter MSR:HV)
> +         */
> +#if defined(TARGET_PPC64)
> +        if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> +            excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> +            excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> +            excp_model =3D=3D POWERPC_EXCP_POWER10) {
> +            lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> +        } else
> +#endif /* defined(TARGET_PPC64) */
> +        {
> +            lpes0 =3D true;
> +        }
> +
>          if (!lpes0) {
>              new_msr |=3D (target_ulong)MSR_HVB;
>              new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> @@ -486,6 +488,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>              env->spr[SPR_BOOKE_EPR] =3D ldl_phys(cs->as, env->mpic_iack);
>          }
>          break;
> +    }
>      case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
>          /* Get rS/rD and rA from faulting opcode */
>          /*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XKLdptHGuMBToFQ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3NR8ACgkQbDjKyiDZ
s5I45RAA0tlnSg2KrIRAPULQ9oSJ21gB1MJeTRQfDAOn5y8VHCHZFXepbV0XVjLO
7ZsxKvgaUYv4UEK3cttYyZMbGb8A0DhK4Mo2ZGWOqktIT5mGj9wNlKa1PzCp9EGB
zxqQyYnlcNxZcnVd51GymkK7JezGc3TFRWwl3Qf4bnA/QUg9kTe7mYXfcecfRV4E
NEPJY3OxW3MIaHCs8k94hynIaEweUnBiBYmDPk+6PMtgViR/b83t92N+MVKmk73W
ks/kizqGSTKKrF0i2BesYA9D9oBK0RwhWTTkkjRitHzR7FFih4maGxYVl1KNj0o/
OA80BcUH8UgynrsvXpyfy4YwZ7Edu77taMTdiUw0/AZP0CaQrxduItElUZ7luGH/
20p6fHXW+slf26eiZ5OqbdQQ3ZxdUzeVBpKcC9NxoShXQcm/yKKgGswr6KLl6Lr3
ex1Z80WtmDX19yd4e8eUlIVVWqYDU/CjlVvRegY8lLrrCARClQSLV40iHq1XCY6w
lIOQjpJBLWPAj66m8k/+c1DXVC/ZwmlSSoHiq+9yAtrPckdknXxV+/A+Ew94SrI9
ewSpcrup6QQ+2Wpx4Lc5RVFx9Fkfv925402y1HiqdMjVvr/vGMggKBves+IHVGf/
QYH3m1rAy69ocBAWFZ7rIZ8gRAFtQ/Bh0VSWq9hpDp5l/rffyQI=
=7oNY
-----END PGP SIGNATURE-----

--XKLdptHGuMBToFQ9--

