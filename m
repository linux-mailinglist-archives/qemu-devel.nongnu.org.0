Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE24021E8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:23:12 +0200 (CEST)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQlT-0005Pg-9w
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQat-0002s7-6c; Mon, 06 Sep 2021 22:12:15 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQap-0000uu-0A; Mon, 06 Sep 2021 22:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630980726;
 bh=9LtyYiW/6NJTRAmLJsVuJo0BibC57YMTWpJ4ys8RZfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X5tlDOQHC0JgHHidfL03NBwn2w+2NoOqSL2xRcoZSOZGD2cte5fQcsiwg/nl1n6HB
 B95LSvnGDxnZbdcHFkLqHqrEFihxIdA5yT5ybq8SkPTcFjPHq7CmT67knukXAtBZ4N
 80mdgMTk+VZH2edHf4PWfCHLK306vTzCZNPFYKuI=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3TKy2p8mz9sf8; Tue,  7 Sep 2021 12:12:06 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:50:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 04/15] target/ppc/power8_pmu.c: enable PMC1-PMC4 events
Message-ID: <YTbFZ37lECeg1zeY@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ixjS8YyKfmZzQW1K"
Content-Disposition: inline
In-Reply-To: <20210903203116.80628-5-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ixjS8YyKfmZzQW1K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 05:31:05PM -0300, Daniel Henrique Barboza wrote:
65;6402;1c> This patch enable all PMCs but PMC5 to count cycles. To do that=
 we
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h        | 11 +++++++++
>  target/ppc/power8_pmu.c | 52 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index a9b31736af..74698a3600 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -352,6 +352,17 @@ typedef struct ppc_v3_pate_t {
>  /* MMCR0 userspace r/w mask */
>  #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
> =20
> +#define MMCR1_EVT_SIZE 8
> +/* extract64() does a right shift before extracting */
> +#define MMCR1_PMC1SEL_START 32
> +#define MMCR1_PMC1EVT_EXTR (64 - MMCR1_PMC1SEL_START - MMCR1_EVT_SIZE)
> +#define MMCR1_PMC2SEL_START 40
> +#define MMCR1_PMC2EVT_EXTR (64 - MMCR1_PMC2SEL_START - MMCR1_EVT_SIZE)
> +#define MMCR1_PMC3SEL_START 48
> +#define MMCR1_PMC3EVT_EXTR (64 - MMCR1_PMC3SEL_START - MMCR1_EVT_SIZE)
> +#define MMCR1_PMC4SEL_START 56
> +#define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
> index 47de38a99e..3f7b305f4f 100644
> --- a/target/ppc/power8_pmu.c
> +++ b/target/ppc/power8_pmu.c
> @@ -31,10 +31,62 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int s=
prn,
>      env->spr[sprn] +=3D time_delta;
>  }
> =20
> +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> +                                        uint64_t time_delta)
> +{
> +    uint8_t event, evt_extr;
> +
> +    switch (sprn) {
> +    case SPR_POWER_PMC1:
> +        evt_extr =3D MMCR1_PMC1EVT_EXTR;
> +        break;
> +    case SPR_POWER_PMC2:
> +        evt_extr =3D MMCR1_PMC2EVT_EXTR;
> +        break;
> +    case SPR_POWER_PMC3:
> +        evt_extr =3D MMCR1_PMC3EVT_EXTR;
> +        break;
> +    case SPR_POWER_PMC4:
> +        evt_extr =3D MMCR1_PMC4EVT_EXTR;
> +        break;
> +    default:
> +        return;
> +    }
> +
> +    event =3D extract64(env->spr[SPR_POWER_MMCR1], evt_extr, MMCR1_EVT_S=
IZE);
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

--ixjS8YyKfmZzQW1K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2xWcACgkQbDjKyiDZ
s5JlQBAAx8q8d6Dv+6UvaWVRAa3BLGd/hMF/T8nb7UHJvAaPiGkb7j4Ol868jCej
Qs0ZRnYccpdE59MvgpowMmHSdikWh662OlN0MmY79/UZO8CysG6+W8wg2x4XyRMo
+1hiTXpj6MrvUlK6tl/dp0SJMK8e4pjk/Tc5HLxelv7rxnI8rWzQbqg7J9s5MTyr
s4RUe79BiTkRRpnDYNvY0qnqVi9ILTdLIn+TjXYEoEEn512IJEWpGA39IcXB8XU3
rReVPLThnRfYd5QAbBMvuA0+ZbCGdpl/hTmzh93mZ7oRn9QgKhtnsbQeZ1Ylxqv5
gKtn5I5r2OuaLKT2t44GnNCsE0TOoKTyV4lkgRv2iURY94k/gaqZbBJWbw5Wx5m8
lfESIOicW1Q0UBm80S/cFrjqwMdAE4AAUFXeq8aiYPZN7QNhWxVUJ3jJgTOfeIiJ
gcQd3BdJhLlkJGlSKb9h6rV47i2GS4bd9EG6sXPFLIoc4o4nLcu0hvLj85sZpccc
2hpSZk8pMCrNEKbz7EclelcKWuuvbMWJKWVLRUhiforYppy2UVB/6jY57gDOPXTF
y6H/JC9fMrcgETSgQ+9OG5XOh541XVscz+myK+69cSfzWlydinKuWyAhkqoi0CuN
n/r2261IUIhfwr+Dsnk4ySudZ7eFAYd6qD3D0lm88o1Zdls8Zvs=
=GN7l
-----END PGP SIGNATURE-----

--ixjS8YyKfmZzQW1K--

