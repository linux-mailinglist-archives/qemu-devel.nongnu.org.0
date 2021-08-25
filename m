Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE33F6EF7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:48:34 +0200 (CEST)
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIlm0-0006Nk-OR
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIleB-0008PD-IP; Wed, 25 Aug 2021 01:40:23 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42287 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIldz-0006DF-F8; Wed, 25 Aug 2021 01:40:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvZYx2Zqxz9sWc; Wed, 25 Aug 2021 15:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629870005;
 bh=q2H3Q6wpRCWLtDsNPbFhW6RmniporWwrUk9eKyrvrkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f8oyttfsasiuyMNRVJGrrUmOVs5ypzh4RATuK88W+bAHPXBim4naGEIfnjY1nNmny
 CT82zzWrdeY4bAeQti6RXYcHN4fOcb1t1SwgRTef+Q/wBRJXw2eLNMJ3IiwESyTfXy
 D2deHABUGfKPbYkWN2oRZoGDotQE8AG+B9Cm3rKo=
Date: Wed, 25 Aug 2021 15:23:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 05/16] target/ppc/power8_pmu.c: enable PMC1-PMC4 events
Message-ID: <YSXT6magQr4WNfF3@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EuyKKbNl9GvtBS67"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-6-danielhb413@gmail.com>
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
Cc: gustavo.romero@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EuyKKbNl9GvtBS67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:21PM -0300, Daniel Henrique Barboza wrote:
> This patch enable all PMCs but PMC5 to count cycles. To do that we
> need to implement MMCR1 bits where the event are stored, retrieve
> them, see if the PMC was configured with a PM_CYC event, and
> calculate cycles if that's the case.
>=20
> PowerISA v3.1 defines the following conditions to count cycles:
>=20
> - PMC1 set with the event 0xF0;
> - PMC6, which always count cycles
>=20
> However, the PowerISA also defines a range of 'implementation dependent'
> events that the chip can use in the 0x01-0xBF range. Turns out that IBM
> POWER chips implements some non-ISA events, and the Linux kernel makes us=
es
> of them. For instance, 0x1E is an implementation specific event that
> counts cycles in PMCs 1-4 that the kernel uses. Let's also support 0x1E
> to count cycles to allow for existing kernels to behave properly with the
> PMU.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h        |  8 +++++++
>  target/ppc/power8_pmu.c | 53 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6878d950de..e5df644a3c 100644
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

Defining macros to actually pull out the event values based on
extract64() is probably a bit more qemu-idiomatic.

>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
> index 47de38a99e..007007824d 100644
> --- a/target/ppc/power8_pmu.c
> +++ b/target/ppc/power8_pmu.c
> @@ -31,10 +31,63 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int s=
prn,
>      env->spr[sprn] +=3D time_delta;
>  }
> =20
> +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> +                                        uint64_t time_delta)
> +{
> +    uint8_t event;
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
> +    /*
> +     * MMCR0_PMC1SEL =3D 0xF0 is the architected PowerISA v3.1 event
> +     * that counts cycles using PMC1.
> +     *
> +     * IBM POWER chips also has support for an implementation dependent
> +     * event, 0x1E, that enables cycle counting on PMCs 1-4. The
> +     * Linux kernel makes extensive use of 0x1E, so let's also support
> +     * it.
> +     */
> +    switch (event) {
> +    case 0xF0:
> +        if (sprn =3D=3D SPR_POWER_PMC1) {
> +            update_PMC_PM_CYC(env, sprn, time_delta);
> +        }
> +        break;
> +    case 0x1E:
> +        update_PMC_PM_CYC(env, sprn, time_delta);
> +        break;
> +    default:
> +        return;
> +    }
> +}
> +
>  static void update_cycles_PMCs(CPUPPCState *env)
>  {
>      uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      uint64_t time_delta =3D now - env->pmu_base_time;
> +    int sprn;
> +
> +    for (sprn =3D SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
> +        update_programmable_PMC_reg(env, sprn, time_delta);
> +    }
> =20
>      update_PMC_PM_CYC(env, SPR_POWER_PMC6, time_delta);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EuyKKbNl9GvtBS67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl0+oACgkQbDjKyiDZ
s5I0QhAAorQ5JVFGDNadBr4mw5MvP+eL1WyFcQDqzLEvLpBTXwFHikFg9jSrEtfg
Y4MnvsjpyRZtwhN7BxtoaWU05BCuYxfPurwpXFkS1qBeuzOGLWoByuE96LY3hq8v
LeTVw7QYQMIq/B2o77bSYyf4HINXBjdJE00WwjQ6FBOvNrZy+JkvBTY+AOtNS22Z
Fx4X5vQMUUDq0R8LHM9ygcQSh0PaMeGGmLXDQ8DmnXwqolA0I+iTcvW9qPGZmZWj
p4fnjgtozU2/+gmGwf6bGDfcOq0V08AT0VklJbBbwrk5lPFMJSr9lStBfcQn6B4b
QaIVP/cZ7qAOZ6n9S7/CxucNPUlcLrQ6omjc6vG2+gxeUN0PGgUJvGPS7WSWYrLD
5yjPn1N5ieVihNfVW/US/lGrqKFiI86T781xaqKTivCLUU6hcytX/LZIEjhCiPev
Tm6SkH8LzFj/q8Tlf3dxUXUqD3Rf3lPdg6fOkG7Ccq26SpgCLhl8R4FcBEp5N5iO
Aj7z+XrAl/enej8CfrojTks7f0EWWf0i+/ReOvTp6wxEpj3JB89UZtwksf/nOsIW
oj2x21Smzoxcnwno7X+i7PgMrFz+sFvj9Fg2unkKfREay3eKjria4yfw2KwtXC/k
dMKxcH5Tux1z3n+pOmxEdT0bTd5GVmW6VtGaSAwQvnirdC9mjRs=
=+zBl
-----END PGP SIGNATURE-----

--EuyKKbNl9GvtBS67--

