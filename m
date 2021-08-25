Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF73F6E36
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:19:05 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkNU-0007hs-Fy
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGa-0000cN-4N; Wed, 25 Aug 2021 00:11:56 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57111 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGW-0007C9-D8; Wed, 25 Aug 2021 00:11:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt56HCz9svs; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=BpUQY5XA4fhiYkpOVuhbT3k8/vJTYlzvuDzFQjj+qi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kiVhMEdfvf4bdbiqmTiuz7v/voFytA40q+XJYv2MzaaytYo3RIYCNhDViXog9llq+
 cMduF9nLnpph9ZJNNaiOrUoR6m+7RTEF7bI6kdhs6PYIEMeVrs5BiiOlxOd+gTkODb
 FCmTD7erX1mR6F0ee+sy+9tupqp/XmueRmBjvkrA=
Date: Wed, 25 Aug 2021 13:12:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH] target/ppc: fix setting of CR flags in bcdcfsq
Message-ID: <YSW1N2hUH9OtnZAR@yekko>
References: <20210823150235.35759-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DrsoHgkfI83BKOvj"
Content-Disposition: inline
In-Reply-To: <20210823150235.35759-1-luis.pires@eldorado.org.br>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DrsoHgkfI83BKOvj
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

CCing Richard Henderson.

In general Richard's probably a better person than me to review actual
ppc TCG mechanics.

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

--DrsoHgkfI83BKOvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEltTYACgkQbDjKyiDZ
s5L+DQ//XItk4LDxkxFxs8AI87xMEz4wcMKWU12arcmRprnUQpSC9HkhQgVoOReb
M9r7sh2TEy+d2UwBFLD/2NZed2iVQvrQ4+XGNbBMdVg0xhXQugzWoFVOtk5Zkvjd
V668aI+d1zB4FkUcjITu9ptSGGyf1mHH6J023OBYOvEuJVYQu+pt5jfi+g7sGHel
uWB9WzHecrlWy9xMj9jHnaxhpJVbDVv+1pDF4JUVJoJY0UXvhxvlDhgwDUUQY2zE
2tyYNGjQVN7my9rMOaU/42hXMaKyLevm1rFJiIbHRt2bxj+px0u/sZQWwEjhtpbF
rHs6kldnlbku7ZxaxX5KGYsWPpFoklPAkNLD2uLQ132WLhNG67CIwmLKvnd0Ucrk
yqlDbx3PW3qh4m0mKWlRYN43QTADDaG5yq82BUtfN7ZIIWNYi24/goHxFDtqOaL3
gGQzGljMnonGcjsCYS6wBGdzzEhF8e1Rtdle10mIyp2NZTJMkguHJuBaraBEGJkK
Qqk8KwNJQY+cDl30RSp6i2DEMW+6eNdQCs2Lo6gBbfFo+1NoEmbnxOjVv/mw6V8h
cz3tcDKvW0I12eJO6RJ1Sj1gZz8Bmzm0A7hXgd13b2DbUog3lviEK9X822ndR/zH
hb120zNzaPDl2FUeJX4eiYj/2J/bIGkV0kf2bTUqH5YMZU9nuk0=
=VJ0h
-----END PGP SIGNATURE-----

--DrsoHgkfI83BKOvj--

