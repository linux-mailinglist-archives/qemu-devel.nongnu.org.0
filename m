Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAA3E5241
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:36:34 +0200 (CEST)
Received: from localhost ([::1]:53374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJVB-00038P-Tf
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDx-0008PZ-Ng; Tue, 10 Aug 2021 00:18:45 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51079 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDv-0002V7-Fr; Tue, 10 Aug 2021 00:18:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKST3SLbz9tD5; Tue, 10 Aug 2021 14:18:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569097;
 bh=3sCV0/Y+Py0MdUnGy3t5OyBHOjuM8AbJAudnz9yUv70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovpaF+PvRrBqj6fazbi1l1W7BAftu8eIM5Sf6sT+VY/AY8q/XM5gISl3VYlH4UUvD
 dDTxHpC3II7ou9K4Y6Eo/msSjey9m/iTe1dQ1iTmu1Q2QC2OD9Ud/qsmoDW1FAEbG+
 1ZBeNjxdHNMpzWzmGBpYTI3ub3UJIcIiq4ktdCjM=
Date: Tue, 10 Aug 2021 14:09:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 14/19] target/ppc/pmu_book3s_helper.c: add generic
 timeout helpers
Message-ID: <YRH74ymx/3425Twx@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-15-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k1tvgk9oMICkl7vX"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-15-danielhb413@gmail.com>
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


--k1tvgk9oMICkl7vX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:52AM -0300, Daniel Henrique Barboza wrote:
> Before adding counter negative condition support for the other 5
> counters, create generic helpers that retrieves the elapsed timeout to
> counter negative based on the event being sampled.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/pmu_book3s_helper.c | 41 +++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index e7af273cb6..7126e9b3d5 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -111,23 +111,52 @@ static void update_PMCs(CPUPPCState *env, uint64_t =
icount_delta)
>      update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
>  }
> =20
> +static int64_t get_INST_CMPL_timeout(CPUPPCState *env, int sprn)
> +{
> +    int64_t remaining_insns;
> +
> +    if (env->spr[sprn] =3D=3D 0) {

Why do you need to special case the PMC being 0?

> +        return icount_to_ns(COUNTER_NEGATIVE_VAL);
> +    }
> +
> +    if (env->spr[sprn] >=3D COUNTER_NEGATIVE_VAL) {
> +        return 0;
> +    }
> +
> +    remaining_insns =3D COUNTER_NEGATIVE_VAL - env->spr[sprn];
> +    return icount_to_ns(remaining_insns);
> +}
> +
> +static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
> +{
> +    int64_t remaining_cyc;
> +
> +    if (env->spr[sprn] =3D=3D 0) {
> +        return icount_to_ns(COUNTER_NEGATIVE_VAL);

Why is icount involved in the CYC timeout logic?  AFAICT it wasn't
before this change.

> +    }
> +
> +    if (env->spr[sprn] >=3D COUNTER_NEGATIVE_VAL) {
> +        return 0;
> +    }
> +
> +    remaining_cyc =3D COUNTER_NEGATIVE_VAL - env->spr[sprn];
> +    return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
> +}
> +
>  static void set_PMU_excp_timer(CPUPPCState *env)
>  {
> -    uint64_t timeout, now, remaining_val;
> +    uint64_t timeout, now;
> =20
>      if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
>          return;
>      }
> =20
> -    remaining_val =3D COUNTER_NEGATIVE_VAL - env->spr[SPR_POWER_PMC1];
> -
>      switch (get_PMC_event(env, SPR_POWER_PMC1)) {
>      case 0x2:
> -        timeout =3D icount_to_ns(remaining_val);
> +        timeout =3D get_INST_CMPL_timeout(env, SPR_POWER_PMC1);
>          break;
>      case 0x1e:
> -        timeout =3D muldiv64(remaining_val, NANOSECONDS_PER_SECOND,
> -                           PPC_CPU_FREQ);
> +        timeout =3D get_CYC_timeout(env, SPR_POWER_PMC1);
>          break;
>      default:
>          return;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k1tvgk9oMICkl7vX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER++MACgkQbDjKyiDZ
s5KhSQ//fwITcaoSZbhxWOMXOuF7XInXu/uECd4YI81vx0qyYflxUj6MAVgofN6c
iVcFwWmUYlQeoh30txaPanx6uJJ1PgLmKiFeaRtNy5LBCmU2RIgGqT/eH/VG7INU
49GzL1SuPY5rlGrQGTKKwm/NX/k/Y/liaAn94HwbI4CV1GwzcbZ9iuwcSecfpW9U
o+4sxhoguZkMV35AYsUfsXk9Y3HJaMTrBaPWOm2N/mh85imrsA8JVSg+bC1R0ZF7
DbDMy2RmtHgWzOQqhImObLn3cpZ459NvvBQlXCPphco8HNe/PJ4e4fcT5vyRxyVm
Nd8Ma6UZPbUpA3Dc2kqWk6Zkycir6byzzwKdAjemeIV0Npq8cCMmjAyZCWVPbjZ2
RJ+BF4LDstCppf+oMMQ6C7bw5VIWLQiZpuBjsO3tlyP4tASMJtnvEmVSLubmNbGI
0R0DmtEW9bhH3RgdbzYuu5Nr45nz4dr3EedbGZSPs838uaYVyQTepiuDbWGU1aDw
aj1QsW/U6TpJfyFFKQw2BkfKnpzs8CjFiQ08sUvPIx1DBSQICJw78OC2fUj8Mm5B
T1iLv3KQwvWjN8qvPWVasNJxrmpZ9X7eprdyKxjxi6U+GSJcunnFpD06NNUdpxUE
KaxHSMSfKIUKAi0liou8KWHDIwyWZCbECBLfWcSW3nJxocX0qF8=
=LwXd
-----END PGP SIGNATURE-----

--k1tvgk9oMICkl7vX--

