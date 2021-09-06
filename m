Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D14401527
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 05:05:57 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN4xH-00075X-AI
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 23:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mN4rm-0004EJ-1m; Sun, 05 Sep 2021 23:00:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52505 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mN4rh-0007sr-IE; Sun, 05 Sep 2021 23:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630897197;
 bh=OQJX+z4Jv/1hgaNV0mmDmYOQdA3Up+iLHgsmVWE530s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPSiXEnlXQSyXknVxNUjHkI9d6UGDiLMafegyLVA/8eSBbiEhhETYWOJIgr9FxCP/
 w7qkJSB1XpdOCleerER2cYwYCHLOlHYoKVf0bE5Q1hzzIssZ6s2k3okJIU23Igsv/Q
 e2n7dWqRvVSwGqxSWcwnejkrgdEGOj/fXM9tCY8k=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H2tRd6994z9sW5; Mon,  6 Sep 2021 12:59:57 +1000 (AEST)
Date: Mon, 6 Sep 2021 12:55:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH] target/ppc: fix setting of CR flags in bcdcfsq
Message-ID: <YTWDLKGEksAULDRl@yekko>
References: <20210823150235.35759-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X3ZwSKhVJUvdD1bE"
Content-Disposition: inline
In-Reply-To: <20210823150235.35759-1-luis.pires@eldorado.org.br>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--X3ZwSKhVJUvdD1bE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 12:02:35PM -0300, Luis Pires wrote:
> According to the ISA, CR should be set based on the source value, and
> not on the packed decimal result.
> The way this was implemented would cause GT, LT and EQ to be set
> incorrectly when the source value was too large and the 31 least
> significant digits of the packed decimal result ended up being all zero.
> This would happen for source values of +/-10^31, +/-10^32, etc.
>=20
> The new implementation fixes this and also skips the result calculation
> altogether in case of src overflow.
>=20
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Applied to ppc-for-6.2, thanks.

> ---
>  target/ppc/int_helper.c | 61 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index efa833ef64..de56056429 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2498,10 +2498,26 @@ uint32_t helper_bcdctz(ppc_avr_t *r, ppc_avr_t *b=
, uint32_t ps)
>      return cr;
>  }
> =20
> +/**
> + * Compare 2 128-bit unsigned integers, passed in as unsigned 64-bit pai=
rs
> + *
> + * Returns:
> + * > 0 if ahi|alo > bhi|blo,
> + * 0 if ahi|alo =3D=3D bhi|blo,
> + * < 0 if ahi|alo < bhi|blo
> + */
> +static inline int ucmp128(uint64_t alo, uint64_t ahi,
> +                          uint64_t blo, uint64_t bhi)
> +{
> +    return (ahi =3D=3D bhi) ?
> +        (alo > blo ? 1 : (alo =3D=3D blo ? 0 : -1)) :
> +        (ahi > bhi ? 1 : -1);
> +}
> +
>  uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
>  {
>      int i;
> -    int cr =3D 0;
> +    int cr;
>      uint64_t lo_value;
>      uint64_t hi_value;
>      ppc_avr_t ret =3D { .u64 =3D { 0, 0 } };
> @@ -2510,28 +2526,47 @@ uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *=
b, uint32_t ps)
>          lo_value =3D -b->VsrSD(1);
>          hi_value =3D ~b->VsrD(0) + !lo_value;
>          bcd_put_digit(&ret, 0xD, 0);
> +
> +        cr =3D CRF_LT;
>      } else {
>          lo_value =3D b->VsrD(1);
>          hi_value =3D b->VsrD(0);
>          bcd_put_digit(&ret, bcd_preferred_sgn(0, ps), 0);
> -    }
> =20
> -    if (divu128(&lo_value, &hi_value, 1000000000000000ULL) ||
> -            lo_value > 9999999999999999ULL) {
> -        cr =3D CRF_SO;
> +        if (hi_value =3D=3D 0 && lo_value =3D=3D 0) {
> +            cr =3D CRF_EQ;
> +        } else {
> +            cr =3D CRF_GT;
> +        }
>      }
> =20
> -    for (i =3D 1; i < 16; hi_value /=3D 10, i++) {
> -        bcd_put_digit(&ret, hi_value % 10, i);
> -    }
> +    /*
> +     * Check src limits: abs(src) <=3D 10^31 - 1
> +     *
> +     * 10^31 - 1 =3D 0x0000007e37be2022 c0914b267fffffff
> +     */
> +    if (ucmp128(lo_value, hi_value,
> +                0xc0914b267fffffffULL, 0x7e37be2022ULL) > 0) {
> +        cr |=3D CRF_SO;
> =20
> -    for (; i < 32; lo_value /=3D 10, i++) {
> -        bcd_put_digit(&ret, lo_value % 10, i);
> -    }
> +        /*
> +         * According to the ISA, if src wouldn't fit in the destination
> +         * register, the result is undefined.
> +         * In that case, we leave r unchanged.
> +         */
> +    } else {
> +        divu128(&lo_value, &hi_value, 1000000000000000ULL);
> =20
> -    cr |=3D bcd_cmp_zero(&ret);
> +        for (i =3D 1; i < 16; hi_value /=3D 10, i++) {
> +            bcd_put_digit(&ret, hi_value % 10, i);
> +        }
> =20
> -    *r =3D ret;
> +        for (; i < 32; lo_value /=3D 10, i++) {
> +            bcd_put_digit(&ret, lo_value % 10, i);
> +        }
> +
> +        *r =3D ret;
> +    }
> =20
>      return cr;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X3ZwSKhVJUvdD1bE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE1gyoACgkQbDjKyiDZ
s5KBgBAArI+It/VHyYBTgih9JcCL85dqL2B3HVmZb7lXCFS6xEot28Gd98/fk9RP
oYVl9XVlBFpy7dp0N/Q0KDu/pcET8ojdXuq6Fy9+GKnK9Z6+5HwXBzg4bTNxmBTp
SAhf8yWpz/WbjQcYrLeuMOqHVXJD7ZiG9llZQHe/HLFqvmph59md3qiqsxgM/GGg
q1XC36aZlgAOSoFah4bpKCGRu4OUZXjhC6ZBbfYGZi/lzpKxoKcbGc4vCUqv20E1
khZeScOjKbHK48mgp7Ekg3znuJRhnyb39ehcdcaZsDvvJjmRHx0P3BjCZwIs3sHx
EVPIr+52/r0cSnwsUNYJ5DNRiXJ8jUp+edp5wbLT+9uu2tUdz7gGHpW7Dx+wUuNN
SUU59J6C3Cn+QUYG6UC9s3FXKYb0uXo3O9w60kTvX/mmtrz8mP42zktymsnt2ifS
FIp4vHQnisaWN12QiLFGFiFh7KVsiOM1BakvFUCDTt0q3+3BbeU9dad84/m0CdNv
Av2XkNx8Vn4fpcN0bduPYMnSd/AxTe21PXnGjn53qB8qC2o7R07puQjds/FNNYWC
d9KRccc/FLcdZ9bnGSo2EkyCUv+HQsWYQhkuCPd6eBRo87wlswmj6t1ys5KEUieg
RW6lhCDeKHaL8q5phHlyg7/8dVps182Vip+USHgLEH88H33W0Q8=
=EoP5
-----END PGP SIGNATURE-----

--X3ZwSKhVJUvdD1bE--

