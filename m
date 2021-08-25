Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D673F6E2D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:16:37 +0200 (CEST)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkL0-00039U-Nh
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGZ-0000cC-3n; Wed, 25 Aug 2021 00:11:55 -0400
Received: from ozlabs.org ([203.11.71.1]:60759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGW-0007Bq-DZ; Wed, 25 Aug 2021 00:11:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt5b3Yz9t0Y; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=WcHc/wz/4dLv4hkZT9exIfaDSpwjw+xrIsIKTrsCceA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iLGsmjRpxeTkjmVdym3FS6gtwUzm/XY6PWQl8qoYkQ6+vs3ZBtIX9DtW0U9n3Q2cn
 Khbgy8Qam0u2HDp2lqFlRuBLwNvfSDnF0lIbtVWdlYuxT0oystRWd251XkoZyVkqbM
 qNuz6leUGtkb+f6zIaS2Jyv35Z/S2N7s146Kl2vU=
Date: Wed, 25 Aug 2021 13:43:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH 02/19] host-utils: move abs64() to host-utils
Message-ID: <YSW8TigYwJVIrd5w@yekko>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-3-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wvyAoWH/j7dFnCKK"
Content-Disposition: inline
In-Reply-To: <20210824142730.102421-3-luis.pires@eldorado.org.br>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wvyAoWH/j7dFnCKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 11:27:13AM -0300, Luis Pires wrote:
> Move abs64 to host-utils so it can be reused elsewhere.
> Also made it inline.
>=20
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  hw/i386/kvm/i8254.c       | 5 -----
>  include/qemu/host-utils.h | 8 ++++++++
>  2 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
> index fa68669e8a..761034743b 100644
> --- a/hw/i386/kvm/i8254.c
> +++ b/hw/i386/kvm/i8254.c
> @@ -59,11 +59,6 @@ struct KVMPITClass {
>      DeviceRealize parent_realize;
>  };
> =20
> -static int64_t abs64(int64_t v)
> -{
> -    return v < 0 ? -v : v;

Hrm..  I'm a bit concerned about mkaing this a more widespread
function, because it has a nasty edge case... which is basically
unavoidable in an abs64() implementation.  Specifically:

abs64(0x800_0000_0000_00000) =3D=3D 0x800_0000_0000_0000 < 0

At least in the most likely 2's complement implementation.

> -}
> -
>  static void kvm_pit_update_clock_offset(KVMPITState *s)
>  {
>      int64_t offset, clock_offset;
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index 711b221704..5fec44a9c4 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -357,6 +357,14 @@ static inline uint64_t revbit64(uint64_t x)
>  #endif
>  }
> =20
> +/**
> + * Return the absolute value of a 64-bit integer
> + */
> +static inline int64_t abs64(int64_t v)
> +{
> +    return v < 0 ? -v : v;
> +}
> +
>  /**
>   * sadd32_overflow - addition with overflow indication
>   * @x, @y: addends

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wvyAoWH/j7dFnCKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvE4ACgkQbDjKyiDZ
s5K7sA/+PhfYbyXaWmk990bEnxSQZc+hOP33WQZj9DJAgOSRKnCF0uoMPJJU+PQi
dnIYGl23HU/JuexEszPr/EYcmyjGVvlrgu4tq1wlG9N/DY1y32efMZOmouH1uevI
ot/W9MsolsI/dfmsjXucXNxsz9r/O6ar5wnp/UuiDb510+kvdLqTWfWRGQePTE+S
06/L5hUHUAjQriiCivRenIKQZ6FMlUr8et0GOiGK59W6FvFTqKh1vKnZvqk7KrWw
QiSuDQIKoGX0+OLzvTnSRS4GuyKuGY86SFGwIKvGVamT4/hykIpYjSZtiHkSG3xd
7vZQ7IB1A2pcjjE+re9Njem+oiNpab8hjU1wP4FnV2/zJ1DrpgWVQW3eKIzEIZ4H
5du9StGFihiClsDspBzvH3yqo8aXgOH9CzI3SHjWtZyZj+boIEOIfQrKN13JIsqo
sxx3yW0AHH0Y2Mk0wPc6wQhTq/VnLFtMI3503LHN8ektVXea1i2kEpFOlASeSHcC
EMtAWkJtZoGKxTJYtLeuWcL/AcZHEq3ptDUu1y6J5oIh+4gYrkZPalHMxE49nxCw
y9J7dA+xhQToa76wqhh3tWg4ZlD5FUVIT91ctfl96CQcuC3KlH4sgcmASw9oRpMG
mXrkzgP00yMz9Ks1k3NVIs6DTBFWOOUnO0nvX2xUPf5Ut8mUZuA=
=YiIt
-----END PGP SIGNATURE-----

--wvyAoWH/j7dFnCKK--

