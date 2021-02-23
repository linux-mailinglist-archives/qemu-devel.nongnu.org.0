Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D24322489
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:11:57 +0100 (CET)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEO7A-0002dH-P3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO3B-0006Ku-LK; Mon, 22 Feb 2021 22:07:49 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36265 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO39-0003Ij-7W; Mon, 22 Feb 2021 22:07:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rT5Wdcz9sWD; Tue, 23 Feb 2021 14:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049657;
 bh=ZUF1ni2UzgQ+MDqOAkmf2lb1wpMMdfBJtxhyk1tFWjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jb0vMHd3hpQY2Hb/zx9k2JLpE6V64Fw72/EWhGUWVmyvb6dmBwtu0/yZIW/Gj17Nq
 YbZTO7+Rt1AXuf4eYxjUb7MKZNYR0GeR7htNruvz4j4QKoznMGzo45ZJt456Fe7A5h
 6ZaUStkfAnTtL3f8hfYsGMSscz8wCdANOg6L8YJE=
Date: Tue, 23 Feb 2021 11:29:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] target/ppc: Fix bcdsub. emulation when result overflows
Message-ID: <YDRMUMpoQiCCqK7A@yekko.fritz.box>
References: <20210222194035.2723056-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uXK2SKfOGP0VjSSM"
Content-Disposition: inline
In-Reply-To: <20210222194035.2723056-1-farosas@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: pc@us.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uXK2SKfOGP0VjSSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:40:35PM -0300, Fabiano Rosas wrote:
65;6203;1c> The commit d03b174a83 (target/ppc: simplify bcdadd/sub function=
s)
> meant to simplify some of the code but it inadvertently altered the
> way the CR6 field is set after the operation has overflowed.
>=20
> The CR6 bits are set based on the *unbounded* result of the operation,
> so we need to look at the result before returning from bcd_add_mag,
> otherwise we will look at 0 when it overflows.
>=20
> Consider the following subtraction:
>=20
> v0 =3D 0x9999999999999999999999999999999c (maximum positive BCD value)
> v1 =3D 0x0000000000000000000000000000001d (negative one BCD value)
> bcdsub. v0,v0,v1,0
>=20
> The Power ISA 2.07B says:
> If the unbounded result is greater than zero, do the following.
>   If PS=3D0, the sign code of the result is set to 0b1100.
>   If PS=3D1, the sign code of the result is set to 0b1111.
>   If the operation overflows, CR field 6 is set to 0b0101. Otherwise,
>   CR field 6 is set to 0b0100.
>=20
> POWER9 hardware:
> vr0 =3D 0x0000000000000000000000000000000c (positive zero BCD value)
> cr6 =3D 0b0101 (0x5) (positive, overflow)
>=20
> QEMU:
> vr0 =3D 0x0000000000000000000000000000000c (positive zero BCD value)
> cr6 =3D 0b0011 (0x3) (zero, overflow) <--- wrong
>=20
> This patch reverts the part of d03b174a83 that introduced the
> problem and adds a test-case to avoid further regressions:
>=20
> before:
> $ make run-tcg-tests-ppc64le-linux-user
> (...)
>   TEST    bcdsub on ppc64le
> bcdsub: qemu/tests/tcg/ppc64le/bcdsub.c:58: test_bcdsub_gt:
> Assertion `(cr >> 4) =3D=3D ((1 << 2) | (1 << 0))' failed.
>=20
> Fixes: d03b174a83 (target/ppc: simplify bcdadd/sub functions)
> Reported-by: Paul Clarke <pc@us.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/int_helper.c           |  13 ++-
>  tests/tcg/configure.sh            |   6 ++
>  tests/tcg/ppc64/Makefile.target   |  13 +++
>  tests/tcg/ppc64le/Makefile.target |  12 +++
>  tests/tcg/ppc64le/bcdsub.c        | 130 ++++++++++++++++++++++++++++++
>  5 files changed, 171 insertions(+), 3 deletions(-)
>  create mode 100644 tests/tcg/ppc64/Makefile.target
>  create mode 100644 tests/tcg/ppc64le/Makefile.target
>  create mode 100644 tests/tcg/ppc64le/bcdsub.c
>=20
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 0b682a1f94..429de28494 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2175,14 +2175,17 @@ static int bcd_cmp_mag(ppc_avr_t *a, ppc_avr_t *b)
>      return 0;
>  }
> =20
> -static void bcd_add_mag(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, int *i=
nvalid,
> +static int bcd_add_mag(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, int *in=
valid,
>                         int *overflow)
>  {
>      int carry =3D 0;
>      int i;
> +    int is_zero =3D 1;
> +
>      for (i =3D 1; i <=3D 31; i++) {
>          uint8_t digit =3D bcd_get_digit(a, i, invalid) +
>                          bcd_get_digit(b, i, invalid) + carry;
> +        is_zero &=3D (digit =3D=3D 0);
>          if (digit > 9) {
>              carry =3D 1;
>              digit -=3D 10;
> @@ -2194,6 +2197,7 @@ static void bcd_add_mag(ppc_avr_t *t, ppc_avr_t *a,=
 ppc_avr_t *b, int *invalid,
>      }
> =20
>      *overflow =3D carry;
> +    return is_zero;
>  }
> =20
>  static void bcd_sub_mag(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, int *i=
nvalid,
> @@ -2225,14 +2229,15 @@ uint32_t helper_bcdadd(ppc_avr_t *r,  ppc_avr_t *=
a, ppc_avr_t *b, uint32_t ps)
>      int sgnb =3D bcd_get_sgn(b);
>      int invalid =3D (sgna =3D=3D 0) || (sgnb =3D=3D 0);
>      int overflow =3D 0;
> +    int zero =3D 0;
>      uint32_t cr =3D 0;
>      ppc_avr_t result =3D { .u64 =3D { 0, 0 } };
> =20
>      if (!invalid) {
>          if (sgna =3D=3D sgnb) {
>              result.VsrB(BCD_DIG_BYTE(0)) =3D bcd_preferred_sgn(sgna, ps);
> -            bcd_add_mag(&result, a, b, &invalid, &overflow);
> -            cr =3D bcd_cmp_zero(&result);
> +            zero =3D bcd_add_mag(&result, a, b, &invalid, &overflow);
> +            cr =3D (sgna > 0) ? CRF_GT : CRF_LT;
>          } else {
>              int magnitude =3D bcd_cmp_mag(a, b);
>              if (magnitude > 0) {
> @@ -2255,6 +2260,8 @@ uint32_t helper_bcdadd(ppc_avr_t *r,  ppc_avr_t *a,=
 ppc_avr_t *b, uint32_t ps)
>          cr =3D CRF_SO;
>      } else if (overflow) {
>          cr |=3D CRF_SO;
> +    } else if (zero) {
> +        cr |=3D CRF_EQ;
>      }
> =20
>      *r =3D result;
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 551c02f469..a0b709948c 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -251,6 +251,12 @@ for target in $target_list; do
>                  echo "CROSS_CC_HAS_ARMV8_MTE=3Dy" >> $config_target_mak
>              fi
>          ;;
> +        ppc*)
> +            if do_compiler "$target_compiler" $target_compiler_cflags \
> +               -mpower8-vector -o $TMPE $TMPC; then
> +                echo "CROSS_CC_HAS_POWER8_VECTOR=3Dy" >> $config_target_=
mak
> +            fi
> +        ;;
>      esac
> =20
>      enabled_cross_compilers=3D"$enabled_cross_compilers $target_compiler"
> diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.t=
arget
> new file mode 100644
> index 0000000000..0c6a4585fc
> --- /dev/null
> +++ b/tests/tcg/ppc64/Makefile.target
> @@ -0,0 +1,13 @@
> +# -*- Mode: makefile -*-
> +#
> +# ppc64 specific tweaks
> +
> +VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64
> +VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64le
> +
> +ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
> +PPC64_TESTS=3Dbcdsub
> +endif
> +bcdsub: CFLAGS +=3D -mpower8-vector
> +
> +TESTS +=3D $(PPC64_TESTS)
> diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefi=
le.target
> new file mode 100644
> index 0000000000..1acfcff94a
> --- /dev/null
> +++ b/tests/tcg/ppc64le/Makefile.target
> @@ -0,0 +1,12 @@
> +# -*- Mode: makefile -*-
> +#
> +# ppc64le specific tweaks
> +
> +VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64le
> +
> +ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
> +PPC64LE_TESTS=3Dbcdsub
> +endif
> +bcdsub: CFLAGS +=3D -mpower8-vector
> +
> +TESTS +=3D $(PPC64LE_TESTS)
> diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
> new file mode 100644
> index 0000000000..8c188cae6d
> --- /dev/null
> +++ b/tests/tcg/ppc64le/bcdsub.c
> @@ -0,0 +1,130 @@
> +#include <assert.h>
> +#include <unistd.h>
> +#include <signal.h>
> +
> +#define CRF_LT  (1 << 3)
> +#define CRF_GT  (1 << 2)
> +#define CRF_EQ  (1 << 1)
> +#define CRF_SO  (1 << 0)
> +#define UNDEF   0
> +
> +#define BCDSUB(vra, vrb, ps)                    \
> +    asm ("bcdsub. %1,%2,%3,%4;"                 \
> +         "mfocrf %0,0b10;"                      \
> +         : "=3Dr" (cr), "=3Dv" (vrt)                \
> +         : "v" (vra), "v" (vrb), "i" (ps)       \
> +         : );
> +
> +#define TEST(vra, vrb, ps, exp_res, exp_cr6)    \
> +    do {                                        \
> +        __int128 vrt =3D 0;                       \
> +        int cr =3D 0;                             \
> +        BCDSUB(vra, vrb, ps);                   \
> +        if (exp_res)                            \
> +            assert(vrt =3D=3D exp_res);             \
> +        assert((cr >> 4) =3D=3D exp_cr6);           \
> +    } while (0)
> +
> +
> +/*
> + * Unbounded result is equal to zero:
> + *   sign =3D (PS) ? 0b1111 : 0b1100
> + *   CR6 =3D 0b0010
> + */
> +void test_bcdsub_eq(void)
> +{
> +    __int128 a, b;
> +
> +    /* maximum positive BCD value */
> +    a =3D b =3D (((__int128) 0x9999999999999999) << 64 | 0x9999999999999=
99c);
> +
> +    TEST(a, b, 0, 0xc, CRF_EQ);
> +    TEST(a, b, 1, 0xf, CRF_EQ);
> +}
> +
> +/*
> + * Unbounded result is greater than zero:
> + *   sign =3D (PS) ? 0b1111 : 0b1100
> + *   CR6 =3D (overflow) ? 0b0101 : 0b0100
> + */
> +void test_bcdsub_gt(void)
> +{
> +    __int128 a, b, c;
> +
> +    /* maximum positive BCD value */
> +    a =3D (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
> +
> +    /* negative one BCD value */
> +    b =3D (__int128) 0x1d;
> +
> +    TEST(a, b, 0, 0xc, (CRF_GT | CRF_SO));
> +    TEST(a, b, 1, 0xf, (CRF_GT | CRF_SO));
> +
> +    c =3D (((__int128) 0x9999999999999999) << 64 | 0x999999999999998c);
> +
> +    TEST(c, b, 0, a, CRF_GT);
> +    TEST(c, b, 1, (a | 0x3), CRF_GT);
> +}
> +
> +/*
> + * Unbounded result is less than zero:
> + *   sign =3D 0b1101
> + *   CR6 =3D (overflow) ? 0b1001 : 0b1000
> + */
> +void test_bcdsub_lt(void)
> +{
> +    __int128 a, b;
> +
> +    /* positive zero BCD value */
> +    a =3D (__int128) 0xc;
> +
> +    /* positive one BCD value */
> +    b =3D (__int128) 0x1c;
> +
> +    TEST(a, b, 0, 0x1d, CRF_LT);
> +    TEST(a, b, 1, 0x1d, CRF_LT);
> +
> +    /* maximum negative BCD value */
> +    a =3D (((__int128) 0x9999999999999999) << 64 | 0x999999999999999d);
> +
> +    /* positive one BCD value */
> +    b =3D (__int128) 0x1c;
> +
> +    TEST(a, b, 0, 0xd, (CRF_LT | CRF_SO));
> +    TEST(a, b, 1, 0xd, (CRF_LT | CRF_SO));
> +}
> +
> +void test_bcdsub_invalid(void)
> +{
> +    __int128 a, b;
> +
> +    /* positive one BCD value */
> +    a =3D (__int128) 0x1c;
> +    b =3D 0xf00;
> +
> +    TEST(a, b, 0, UNDEF, CRF_SO);
> +    TEST(a, b, 1, UNDEF, CRF_SO);
> +
> +    TEST(b, a, 0, UNDEF, CRF_SO);
> +    TEST(b, a, 1, UNDEF, CRF_SO);
> +
> +    a =3D 0xbad;
> +
> +    TEST(a, b, 0, UNDEF, CRF_SO);
> +    TEST(a, b, 1, UNDEF, CRF_SO);
> +}
> +
> +int main(void)
> +{
> +    struct sigaction action;
> +
> +    action.sa_handler =3D _exit;
> +    sigaction(SIGABRT, &action, NULL);
> +
> +    test_bcdsub_eq();
> +    test_bcdsub_gt();
> +    test_bcdsub_lt();
> +    test_bcdsub_invalid();
> +
> +    return 0;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uXK2SKfOGP0VjSSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0TE8ACgkQbDjKyiDZ
s5K+HBAAyioJu2Ng+HzwpmLZeqfZm3FvbfV7F6h+rMVuH7xDYxU+J5trvecmdQQc
nhqHg0fwbaLZ+dXlZF6zd0C209NXBEsEYbk/iyypVNWRqcaBnI07EFd3346kDqm3
Uc8vk6uP0IaCbg993cCZMXFTuA5Dq2UxX8sbqNAgrVYrj1IrXeMKcEDexbMlN+HJ
X1mj2Eruk2ZTPkK93kKfVSBEuiTaBTnjhAierAu5aHkSPjVJwpHw6IJkPe2nJJHd
UNyRhWpjHCUsIl/SY2Nqet0KssvosgZtXPg1IB3bPzUxUquDQuNGhaSdCIlsQIf3
Ebnkt00dT007a3L9Z9MB2TI4Ix840nh1hZBTjA9YZBCXGvu+iL0ozcVHgarjz57I
tEm8dt3mYumKvqFNcfoLGx6Op9N6P/IUnays9QJHjP3sw+Vtzja09RkEtQeoTosH
tEhUhlxWFGm/i19E7LDdHX/8JBJ0HDZxV3zj0xQmiGqOggDI1CvctkO2gN5ySgZY
/epHk1VlRPUP1eIQrKhpr/kT9skau0WP/PY3iq0F8cJrpt1hgmaOvvcXWmahbqNL
Avhbm1wkp01076fymOqo4wWmdXmEjUgNWst7874Bt0JaN6nZz+/UYplRCdaQ5rww
w6eboq2yYrDX5jy6yTH3jzSXhxX6In4RfFs3Xa8nEa8ez+Ux710=
=y5vQ
-----END PGP SIGNATURE-----

--uXK2SKfOGP0VjSSM--

