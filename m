Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAE9536A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 03:33:11 +0200 (CEST)
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzt1G-0007w3-Ts
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 21:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1hzszO-0006sf-TM
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 21:31:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hzszM-0008Eu-H9
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 21:31:10 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50641 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hzszI-0008BW-Pe; Mon, 19 Aug 2019 21:31:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CCtC0F81z9sDQ; Tue, 20 Aug 2019 11:30:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566264659;
 bh=9Mpn5Z6QmdUXeBxtxCKzPRS0PSnUdk256o6JdJqyVm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IA27k2SY+MrlL7fRJGESpvJ5rE3ZK36mjpNDTZ74Ns/+HH79maiDfI8CuxuVnBwoi
 yher3fgxTPnC39d98xrKP8Sl5lqbD2hROm6yjb8jMBXYX4JuVdfBu+4AoyNUjqotfY
 zRcy1TXdbGoZyAH0BmuXjvHtxaHh4Zxc804oC/x8=
Date: Tue, 20 Aug 2019 11:00:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Paul A. Clarke" <pc@us.ibm.com>
Message-ID: <20190820010048.GB22747@umbus.fritz.box>
References: <1566250936-14538-1-git-send-email-pc@us.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <1566250936-14538-1-git-send-email-pc@us.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH v2] ppc: Fix emulated single to double
 denormalized conversions
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 04:42:16PM -0500, Paul A. Clarke wrote:
> From: "Paul A. Clarke" <pc@us.ibm.com>
>=20
> helper_todouble() was not properly converting any denormalized 32 bit
> float to 64 bit double.
>=20
> Fix-suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
>=20
> v2:
> - Splitting patch "ppc: Three floating point fixes"; this is just one par=
t.
> - Original suggested "fix" was likely flawed.  v2 is rewritten by
>   Richard Henderson (Thanks, Richard!); I reformatted the comments in a
>   couple of places, compiled, and tested.

Applied to ppc-for-4.2, thanks.

> ---
>  target/ppc/fpu_helper.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 52bcda2..07bc905 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -73,11 +73,20 @@ uint64_t helper_todouble(uint32_t arg)
>          /* Zero or Denormalized operand.  */
>          ret =3D (uint64_t)extract32(arg, 31, 1) << 63;
>          if (unlikely(abs_arg !=3D 0)) {
> -            /* Denormalized operand.  */
> -            int shift =3D clz32(abs_arg) - 9;
> -            int exp =3D -126 - shift + 1023;
> +            /*
> +             * Denormalized operand.
> +             * Shift fraction so that the msb is in the implicit bit pos=
ition.
> +             * Thus, shift is in the range [1:23].
> +             */
> +            int shift =3D clz32(abs_arg) - 8;
> +            /*
> +             * The first 3 terms compute the float64 exponent.  We then =
bias
> +             * this result by -1 so that we can swallow the implicit bit=
 below.
> +             */
> +            int exp =3D -126 - shift + 1023 - 1;
> +
>              ret |=3D (uint64_t)exp << 52;
> -            ret |=3D abs_arg << (shift + 29);
> +            ret +=3D (uint64_t)abs_arg << (52 - 23 + shift);
>          }
>      }
>      return ret;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1bRkAACgkQbDjKyiDZ
s5LGMRAAvQS3FpaSLrE0z0XUgGrHrTa04i/me1NTE7c5HOFhemwLppeUb1bmT0KH
aGhSjmi3nD4EprGlJJlXJLRThCFGLY5VYhVEMHmsZOwDglZJU2Z1QrtIMBhhPB3B
uQVXnX0nvI1bBtLQm2mw3HjPJKmsy35fpk63quRLAZuxlSFeD/FmYcZyeDqxxrt4
rLUWzZ99vhwDtZ/CuSf8byjv4PuuMtleeRR+kEDeP6+1MQbqO3xeB3NqPMe7DnvO
DxZVS2Ztm81TbdKgaDUCUWYb78ZTn/OUnZs7r07LvgR29iIFur4wNgADAKaVK9VM
m782MpT64I/Vf7A13Fux1zQ4wCMwEiJuKDYhuy9BYyE15c+4EzV3AMPvq7dxiO0R
qW4dxwedHoFAl0ncxbXBMevf35k/qxnRko94pt49ihZ1qAjA7Ee5pvWH2OB6cMAz
VSGyyNOWIAdVm3sXd0qTkKHMSMV4YC5YD0bUbvJMRgz0xDXmBPUQ8UyYMRmlPVpW
FNgtad/FMw1hlCNUfauerMC3osUC/RSV3kjDn0BwOP/rl3rgQKu/AcV+q0isV1sW
QPt1p92HpwyO5NpzcOY6PfpymLDSpdvrPfg1s7VsC+sdbwtYlIAd9I+tyvZ74S6t
vRH8oEpQ9cpWOlcbe/R4LAWZ6YJDymuQ/ZOfuM0YnRlabYS7S6w=
=wtVl
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--

