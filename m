Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278EF18E6B9
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Mar 2020 06:39:33 +0100 (CET)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFtKd-0007iS-My
	for lists+qemu-devel@lfdr.de; Sun, 22 Mar 2020 01:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33573)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jFtJL-0006j2-Lo
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 01:38:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jFtJJ-0007nH-Vw
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 01:38:11 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:40019)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jFtJJ-0007jK-9B; Sun, 22 Mar 2020 01:38:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48lR9x0S3kz9sPR; Sun, 22 Mar 2020 16:37:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584855477;
 bh=5+aAxUbqpP0B9gIAoQokbg5SIOqmJ1Kh0QIuQy6QbqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYimhi5EAlCtXRo0YTm7rgd2nM/0bzJN1Pc0pNbd4oICICVNfqby/e3Ip3XPNEMJM
 SWJA9SgLjunpo3rI+RtYsMndG+tJRCaVA6JsdR08iEm5HJHtH2D9KieHQjVo90oywf
 sU65vBrJO08LvfbSSkMd10gnUMtvK3w3H4WQrq/Q=
Date: Sun, 22 Mar 2020 16:32:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Fix memory leak in h_client_architecture_support()
Message-ID: <20200322053205.GG781112@umbus.fritz.box>
References: <158481206205.336182.16106097429336044843.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X1xGqyAVbSpAWs5A"
Content-Disposition: inline
In-Reply-To: <158481206205.336182.16106097429336044843.stgit@bahia.lan>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--X1xGqyAVbSpAWs5A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2020 at 06:34:22PM +0100, Greg Kurz wrote:
> This is the only error path that needs to free the previously allocated
> ov1.
>=20
> Reported-by: Coverity (CID 1421924)
> Fixes: cbd0d7f36322 "spapr: Fail CAS if option vector table cannot be par=
sed"
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-forr-5.0.

> ---
>  hw/ppc/spapr_hcall.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 40c86e91eb89..0d50fc911790 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1726,6 +1726,7 @@ static target_ulong h_client_architecture_support(P=
owerPCCPU *cpu,
>      }
>      ov5_guest =3D spapr_ovec_parse_vector(ov_table, 5);
>      if (!ov5_guest) {
> +        spapr_ovec_cleanup(ov1_guest);
>          warn_report("guest didn't provide option vector 5");
>          return H_PARAMETER;
>      }
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X1xGqyAVbSpAWs5A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl52+FIACgkQbDjKyiDZ
s5JXCBAAnQW9K7LeF8Fkm+riLI2iNLag+DPJLGMJoUc/S7xSokESaIu6oEKVTqsL
3j9UiYa5eBXOqYkcO8FWBIf3eloZsaOiKaSzbnyotqNykcEd1IrhzQmQxQYnQh78
zQyldrHOQ2oDlFqdLm8rKVsDXy5ZV5ouaHWjzNzsFlD7ioIkMNZThTKx6WIgxxpK
Kzj2t27cgUiVPIChxtyW6XxJjA5lr4LkLVPkiwTD4PXQTU4+SbPW4pPbJYDfJbt/
eBJj3CKanm86crP9wlKg8BnXpVva98JmD88AS/oe/uLEkz+sizltc5ZzMOsgC7DH
isPPvLaWpEvDcMMXH4Qff9VmUt5pdZpnKsg1K0Ot9ofSq10l+m2TDIbXKPAwNKXn
tH+RKWv7xXWE3o0LtLjAOJ4oCd8CIur0muqJqe0CwEmh3VN6ohhOCT43AXjtUXG3
spZtm/vvaEK5WBMLhpv5AkEuU33b2r1bOZudULZFZa53hUVRCfm0aH5Wdtmc2JZi
CLHALmsr9sv1tJMJYGtfCH4mGBLaxR4MLU5myo07BMaMyO745FFD1hcu2eD6F5GM
Tb8memz9UrYCn7KO/ISORDnM8txia+JZ97h14C7uYdcebE8j0gcg8JTwKqM5ohTB
sE7Hq8ropv+zOewOMtvYVqYL/FvHLVoDfBG+TUk6mjZCQno3iBA=
=Ivez
-----END PGP SIGNATURE-----

--X1xGqyAVbSpAWs5A--

