Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE43CF14E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:26:54 +0200 (CEST)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eX7-0006j0-DJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5ePv-0000vy-Pz; Mon, 19 Jul 2021 21:19:27 -0400
Received: from ozlabs.org ([203.11.71.1]:60693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5ePt-000477-0y; Mon, 19 Jul 2021 21:19:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GTLTh4ygcz9sWX; Tue, 20 Jul 2021 11:19:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626743960;
 bh=mGkEUsAOyOLw9uCd7uU0L8Tlr4YZiTDcdyWt6nHN/gU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EbhgBVYC4tekh7wJi23pBYwPIdi95PlJ8cMESVpy7oE/UaZY5ySo3EpaczwN0+Zeb
 LDS1+0cRVplz0eHfJi8ZzOR6vXu+ZYgHQczxSvR4l07tRyIsKBShzfcCT4VHmPEFxZ
 1jiolUz1UvtAZf2NR1v6p+RF3l8NWhlxc6e+X570=
Date: Mon, 19 Jul 2021 22:07:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] ppc/vof: Fix Coverity issues
Message-ID: <YPVq7sFeM9sCzQ0W@yekko>
References: <20210713134638.1803316-1-aik@ozlabs.ru> <YPT4DoeG1rNhrOE8@yekko>
 <8e0e013e-4043-7424-8b93-f3f144601b8c@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BSj5lTXcR6FG6qLA"
Content-Disposition: inline
In-Reply-To: <8e0e013e-4043-7424-8b93-f3f144601b8c@ozlabs.ru>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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


--BSj5lTXcR6FG6qLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 06:25:53PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 7/19/21 13:57, David Gibson wrote:
> > On Tue, Jul 13, 2021 at 11:46:38PM +1000, Alexey Kardashevskiy wrote:
> > > This fixes NEGATIVE_RETURNS, OVERRUN issues reported by the Coverity.
> > >=20
> > > This adds a comment about the return parameters number in the VOF hca=
ll.
> > > The reason for such counting is to keep the numbers look the same in
> > > vof_client_handle() and the Linux (an OF client).
> > >=20
> > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > ---
> > >=20
> > > Will this make COverity happy? What is the canonical way of fixing th=
ese
> > > uint32_t vs. int? Thanks,
> >=20
> > It might make Coverity happy, but I think it's an ugly approach.
> >=20
> > >=20
> > > ---
> > >   hw/ppc/vof.c | 12 ++++++++----
> > >   1 file changed, 8 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> > > index 81f65962156c..872f671babbe 100644
> > > --- a/hw/ppc/vof.c
> > > +++ b/hw/ppc/vof.c
> > > @@ -517,7 +517,7 @@ static uint32_t vof_instance_to_package(Vof *vof,=
 uint32_t ihandle)
> > >   static uint32_t vof_package_to_path(const void *fdt, uint32_t phand=
le,
> > >                                       uint32_t buf, uint32_t len)
> > >   {
> > > -    uint32_t ret =3D -1;
> > > +    int ret =3D -1;
> >=20
> > I don't think you want to try to use the same variable for the value
> > from phandle_to_path() and the return value from this function -
> > they're different types, with different encodings.  The inner value
> > should remain int (that's the libfdt convention).
> >=20
> > The outer one is explicltly unsigned.  You're not really looking for
> > negative error values, but specifically for -1U =3D=3D ~0U as the single
> > error value.  So re-introduce your PROM_ERROR valued, defined as ~0U,
> > so that it's clearly unsigned, and use that and unsigned logic for all
> > manipulation of the outer value.
>=20
>=20
> Fair enough. One question. Linux defines it as
>=20
> #define PROM_ERROR (-1u)
>=20
> Do you still vote for "~0U"?

I don't really mind.  I think (-1U) might cause some more Coverity
confusion that ~0U, based on experience with Coverity scans of dtc &
libfdt.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BSj5lTXcR6FG6qLA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD1auwACgkQbDjKyiDZ
s5KQWA//d4weSnTnARH4e4CFGG4MzKM6N/Gh+l9N/NPd+9Lcr5tC3K4CWsoCAz8J
AgIoPXRsEvjW26MF8nVv+07qQ7DyYpVGa10/cdVvNGcXVeTeqKINR0jTpYYgEDnr
gTalCbcc3QMNjCUrM0FiSsSc9hZLhbmLKHDXFHdiMourcZ+qyJq/gLLrdust6MLZ
vI0OgnPxhX47z09MlL3Jj8Bi8G8+hcxpka+WLuQSpKp+2efidyEg/bYS02q2CXty
UVaTI4dKEb6ibF1fk+cbhfLBH4hDbYJfF9DDwD/8XCP4BnGM+4szPpoWgWT+dh38
Kh48ivvYdMueBqD8CKbbEE8rA+8s1S0o+j1YoBH1W4z1osFE933KZ+0EcjK1LZVA
Qkr8nS8GIqA+OqoA3tb7j+dBzj4p+nVw5x7YJFdCY/Sy6a0nevcpnLhyrwQFK2gS
CpbmzIzRQOUKVOWf09WqpH/wvLEyicX4znCr4mOxMij+l0is5H5XsRAYVw0ilTUi
0Hw3xEoVikw0jzh9rzbZ0S9FodqmFnvLhcklpbualhjAlaCfrswPKdAJZGVMsIbO
40iADwQZj4s5UYtighUczDcd/s5cL5hhbTxhbci07AhobeHeRSZwWdVDqh4RcXc9
XGikqrP+PTZOUyLq+EuiG4OzX+lNHL3S7Fbe0lieUcgr6VVfMSU=
=CHFw
-----END PGP SIGNATURE-----

--BSj5lTXcR6FG6qLA--

