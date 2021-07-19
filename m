Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099443CCCD8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 06:04:52 +0200 (CEST)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5KWQ-0005go-Hz
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 00:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KSs-0004Mq-CK; Mon, 19 Jul 2021 00:01:10 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KSn-0005nt-F5; Mon, 19 Jul 2021 00:01:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSp6f2gymz9sRf; Mon, 19 Jul 2021 14:00:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626667258;
 bh=MvHcxgcSC/HF8IS44QcypiMJkzdeOLS+FwGSQLdQiPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UJ9BnwFu06Kl+0YYcTd9wV8Ztxm/1M+oYM4Fi89sFqIrs6zSluM3ZqQbwR1n4Y1xY
 2NyoMbLeD5yGOgItst57oDqcIPRJyquaLZrdgQscBrNk3sqp+Hg2ykI81PTb8AqvpU
 IuGkhho49x+cA5H8z0owatNUZs7OurmOU3B7P0HM=
Date: Mon, 19 Jul 2021 13:57:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] ppc/vof: Fix Coverity issues
Message-ID: <YPT4DoeG1rNhrOE8@yekko>
References: <20210713134638.1803316-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JLVt9MNIuV56omc6"
Content-Disposition: inline
In-Reply-To: <20210713134638.1803316-1-aik@ozlabs.ru>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JLVt9MNIuV56omc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 11:46:38PM +1000, Alexey Kardashevskiy wrote:
> This fixes NEGATIVE_RETURNS, OVERRUN issues reported by the Coverity.
>=20
> This adds a comment about the return parameters number in the VOF hcall.
> The reason for such counting is to keep the numbers look the same in
> vof_client_handle() and the Linux (an OF client).
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>=20
> Will this make COverity happy? What is the canonical way of fixing these
> uint32_t vs. int? Thanks,

It might make Coverity happy, but I think it's an ugly approach.

>=20
> ---
>  hw/ppc/vof.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index 81f65962156c..872f671babbe 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -517,7 +517,7 @@ static uint32_t vof_instance_to_package(Vof *vof, uin=
t32_t ihandle)
>  static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
>                                      uint32_t buf, uint32_t len)
>  {
> -    uint32_t ret =3D -1;
> +    int ret =3D -1;

I don't think you want to try to use the same variable for the value
=66rom phandle_to_path() and the return value from this function -
they're different types, with different encodings.  The inner value
should remain int (that's the libfdt convention).

The outer one is explicltly unsigned.  You're not really looking for
negative error values, but specifically for -1U =3D=3D ~0U as the single
error value.  So re-introduce your PROM_ERROR valued, defined as ~0U,
so that it's clearly unsigned, and use that and unsigned logic for all
manipulation of the outer value.

>      char tmp[VOF_MAX_PATH] =3D "";
> =20
>      ret =3D phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> @@ -529,13 +529,13 @@ static uint32_t vof_package_to_path(const void *fdt=
, uint32_t phandle,
> =20
>      trace_vof_package_to_path(phandle, tmp, ret);
> =20
> -    return ret;
> +    return (uint32_t) ret;
>  }
> =20
>  static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihand=
le,
>                                       uint32_t buf, uint32_t len)
>  {
> -    uint32_t ret =3D -1;
> +    int ret =3D -1;
>      uint32_t phandle =3D vof_instance_to_package(vof, ihandle);
>      char tmp[VOF_MAX_PATH] =3D "";
> =20
> @@ -549,7 +549,7 @@ static uint32_t vof_instance_to_path(void *fdt, Vof *=
vof, uint32_t ihandle,
>      }
>      trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
> =20
> -    return ret;
> +    return (uint32_t) ret;
>  }
> =20
>  static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
> @@ -965,11 +965,15 @@ int vof_client_call(MachineState *ms, Vof *vof, voi=
d *fdt,
>      }
> =20
>      nret =3D be32_to_cpu(args_be.nret);
> +    if (nret > ARRAY_SIZE(args_be.args) - nargs) {
> +        return -EINVAL;
> +    }

That looks reasonable.

>      ret =3D vof_client_handle(ms, fdt, vof, service, args, nargs, rets, =
nret);
>      if (!nret) {
>          return 0;
>      }
> =20
> +    /* @nrets includes the value which this function returns */
>      args_be.args[nargs] =3D cpu_to_be32(ret);
>      for (i =3D 1; i < nret; ++i) {
>          args_be.args[nargs + i] =3D cpu_to_be32(rets[i - 1]);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JLVt9MNIuV56omc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD0+AwACgkQbDjKyiDZ
s5J2kg//UHbj0KDWl2IOk4U6tRD8N2eCWmyXkT+5ctbj+d/reSkHoAgXhGoJ7nAS
C9rj5cHTxWbRRVYkpcu15/pfzelCSL3Stmu44mVB43k9oqOlIjZ1RPxBZZLcjQwU
6r+47m+DhdVG7SgZIRiGFiWJb93IZp0CFkhJ+TP6G4IJVHQxMHwH5y5ZrAaSyB3h
Mvf4XJytI6wrzIDk8hJN3jv4GTow7f7MUH4vDU62z+uqy2fpfkQara0JVMgDZD0E
3o0k1cO8kD1A6RVSPNwK5PtL27Cl9fAbiq0WF0rqx3tCOAd2PyLUouRPbF/LJhIS
g33/TxAeR5dScx84LzRTK+ZJymxRPIXwzIZi6PUs3U7CzOm14RqsSoJ7nwA++9e+
/fP4WlZrIEPcnaB+u1NAhG6Ohw+a4chFESZrjUkb/hSQ0kS4ZVNqPYVjqto95Iek
2ac39fjf/bgpSj9YAWZZsSUZ7EF27QE9vBtrQE3khfdcI5wnjAryXcRqujXz/5fA
wQJYuHdKGu/6Ec2NJrpBrVJK4ij/TsrH7cATkaI7lAma9uZM2naxEyYp9qQ4mJKu
FqrjjOcixEddmwVHSyDDw5v9SKrAKOX5a/Cc/RdYnHai3MeQVw1+Ga0ZjHuO/ivc
Kw4Yu2Ucj+Ou46cW5e3/U/L78SCertqFr0/VDEUHloOT50Ok7Ac=
=wAhx
-----END PGP SIGNATURE-----

--JLVt9MNIuV56omc6--

