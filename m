Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BBD46E0D5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 03:22:45 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv952-0003li-LJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 21:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mv90z-0001PZ-Bw; Wed, 08 Dec 2021 21:18:34 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=48123
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mv90K-0006uP-Dw; Wed, 08 Dec 2021 21:18:33 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J8d3Z72pMz4xhl; Thu,  9 Dec 2021 13:17:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1639016266;
 bh=S1FNJ7I2a/RyXgBW2QXjYkhpCvuiiyVlQ4hTodFUTZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nb1Bw2bk3ebXKqTrmUseJSCCk+q2EHJRW3+wVkqTiHZWQgyF6rlKg2p+JVnaH+Rr6
 auFECLxGDWZdiPgdaGOR0Ctzf4gm1u23TEGACbwkWyfxyW7H+i4MNxv1P6PLeqNCVF
 CZaYo2IUhE/TyFNKbEph11XvfFWIALnqYEHAlkiI=
Date: Thu, 9 Dec 2021 12:52:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v9 10/10] target/ppc/excp_helper.c: EBB handling
 adjustments
Message-ID: <YbFhb1OMBZSCxV1V@yekko>
References: <20211201151734.654994-1-danielhb413@gmail.com>
 <20211201151734.654994-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e83HFUJw3nJZpvoz"
Content-Disposition: inline
In-Reply-To: <20211201151734.654994-11-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--e83HFUJw3nJZpvoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 12:17:34PM -0300, Daniel Henrique Barboza wrote:
> The current logic is only considering event-based exceptions triggered
> by the performance monitor. This is true now, but we might want to add
> support for external event-based exceptions in the future.
>=20
> Let's make it a bit easier to do so by adding the bit logic that would
> happen in case we were dealing with an external event-based exception.
>=20
> While we're at it, add a few comments explaining why we're setting and
> clearing BESCR bits.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Still looks fine, but I'm not seeing a particularly strong reason to
keep this split from the previous patch.

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/excp_helper.c | 45 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a26d266fe6..42e2fee9c8 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -801,14 +801,47 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>          break;
>      case POWERPC_EXCP_EBB:       /* Event-based branch exception        =
     */
>          if ((env->spr[SPR_FSCR] & (1ull << FSCR_EBB)) &&
> -            (env->spr[SPR_BESCR] & BESCR_GE) &&
> -            (env->spr[SPR_BESCR] & BESCR_PME)) {
> +            (env->spr[SPR_BESCR] & BESCR_GE)) {
>              target_ulong nip;
> =20
> -            env->spr[SPR_BESCR] &=3D ~BESCR_GE;   /* Clear GE */
> -            env->spr[SPR_BESCR] |=3D BESCR_PMEO;  /* Set PMEO */
> -            env->spr[SPR_EBBRR] =3D env->nip;     /* Save NIP for rfebb =
insn */
> -            nip =3D env->spr[SPR_EBBHR];          /* EBB handler */
> +            /*
> +             * If we have Performance Monitor Event-Based exception
> +             * enabled (BESCR_PME) and a Performance Monitor alert
> +             * occurred (MMCR0_PMAO), clear BESCR_PME and set BESCR_PMEO
> +             * (Performance Monitor Event-Based Exception Occurred).
> +             *
> +             * Software is responsible for clearing both BESCR_PMEO and
> +             * MMCR0_PMAO after the event has been handled.
> +             */
> +            if ((env->spr[SPR_BESCR] & BESCR_PME) &&
> +                (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAO)) {
> +                env->spr[SPR_BESCR] &=3D ~BESCR_PME;
> +                env->spr[SPR_BESCR] |=3D BESCR_PMEO;
> +            }
> +
> +            /*
> +             * In the case of External Event-Based exceptions, do a
> +             * similar logic with BESCR_EE and BESCR_EEO. BESCR_EEO must
> +             * also be cleared by software.
> +             *
> +             * PowerISA 3.1 considers that we'll not have BESCR_PMEO and
> +             * BESCR_EEO set at the same time. We can check for BESCR_PM=
EO
> +             * being not set in step above to see if this exception was
> +             * trigged by an external event.
> +             */
> +            if (env->spr[SPR_BESCR] & BESCR_EE &&
> +                !(env->spr[SPR_BESCR] & BESCR_PMEO)) {
> +                env->spr[SPR_BESCR] &=3D ~BESCR_EE;
> +                env->spr[SPR_BESCR] |=3D BESCR_EEO;
> +            }
> +
> +            /*
> +             * Clear BESCR_GE, save NIP for 'rfebb' and point the
> +             * execution to the event handler (SPR_EBBHR) address.
> +             */
> +            env->spr[SPR_BESCR] &=3D ~BESCR_GE;
> +            env->spr[SPR_EBBRR] =3D env->nip;
> +            nip =3D env->spr[SPR_EBBHR];
>              powerpc_set_excp_state(cpu, nip, env->msr);
>          }
>          /*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--e83HFUJw3nJZpvoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGxYW8ACgkQbDjKyiDZ
s5LTVhAAkeG24RKidcG7EFjHGSEjyk7431LRLBgX7P3E58WIEf+Kc+saE6WUhSqI
U+j7fTQITn6bjYJNrGvJGngmo0En4ZuMgsyoiIywKL2Twe5/10bTCm+n0FJGTvbr
B+J0gB/BRCLglZVW4BwnvAjMXnKD8UJmvzNwjdAngmB9TGqvZbh7hydiSaoXfjaj
k9zYwQYK/tDv1/2kaM81LpUias2c1mBYu1HAt57dbGxIUn/eBW2104uPxoxY3uGR
D40TaFXVrJQELpMRWXRPejU0iS99Fv8ECBp2Z4pqwHfCzld+HUfr2zYMb/7A8hmZ
bmDueDt5yjgcYHWFkBQ/K/P2ljZHmyEFwMp5GlhBeRTMw9vWLwG/ptzl0j5Z2J9d
b7h3f7j6prm5brpCMautjI3B8lspH1uuTOKRAzeP8/AIohDSueqG7pSZdm4AaLgR
mhfff4JDkYW6V8O0TXB1xhKIjTc1s4FpwjOMnzmhthKMGkJzvqt+r6kJDFA2xG0W
HJMLGbih4cUkJqHHJgz3m0cgCoO2MPuE43MgPDlhAKF1XUqznO6lDTiWet2R6/xm
uzrmmLutK4J75LzZZ/Wqlq8CKRlhnKy7UEcD8nXYwwi0JmhnfiG7/y2PnWI7AtJP
rMlKVfR5sSwDX+twAgovYpE5lsRSrPbtCQo6VtrNXxJ3IQSiwJQ=
=zcHC
-----END PGP SIGNATURE-----

--e83HFUJw3nJZpvoz--

