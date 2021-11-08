Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE474479D1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 06:10:03 +0100 (CET)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjwuv-0001Fe-H2
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 00:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mjwp3-00086i-SC; Mon, 08 Nov 2021 00:03:57 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:38829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mjwos-0007TW-0s; Mon, 08 Nov 2021 00:03:57 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HnfCF0GHVz4xdP; Mon,  8 Nov 2021 16:03:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636347817;
 bh=Uf3n6UO9r66G6lFs/r80yDevgpgwFV5LOdLqtfmIzik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IJWdvLjFy/zOMdw8Pv+qz1eTDNRWjLIRMoIkib3OOv8uQMGMyEdB/8utiteb3qs74
 YDhiw7EuwPb+JbXSBKtdD0waTK7vg2xModjp6C14TcwNUTrb3shCcDtSsKCTLTpyA3
 clf7W6RVULZ2KSTf8HB+y0rJbD2XsLccymw/pvzk=
Date: Mon, 8 Nov 2021 14:26:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH] spapr_numa.c: FORM2 table handle nodes with no distance
 info
Message-ID: <YYiY98VGqqLRxf5N@yekko>
References: <20211105135137.1584840-1-npiggin@gmail.com>
 <555804ca-e59e-6dfb-c133-0087b7c0ffd0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F9Px+3+6LM2/b7tk"
Content-Disposition: inline
In-Reply-To: <555804ca-e59e-6dfb-c133-0087b7c0ffd0@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--F9Px+3+6LM2/b7tk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 03:52:13PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 11/5/21 10:51, Nicholas Piggin wrote:
> > A configuration that specifies multiple nodes without distance info
> > results in the non-local points in the FORM2 matrix having a distance of
> > 0. This causes Linux to complain "Invalid distance value range" because
> > a node distance is smaller than the local distance.
> >=20
> > Fix this by building a simple local / remote fallback for points where
> > distance information is missing.
>=20
> Thanks for looking this up. I checked the output of this same scenario wi=
th
> a FORM1 guest and 4 distance-less NUMA nodes. This is what I got:
>=20
> [root@localhost ~]# numactl -H
> available: 4 nodes (0-3)
> (...)
> node distances:
> node   0   1   2   3
>   0:  10  160  160  160
>   1:  160  10  160  160
>   2:  160  160  10  160
>   3:  160  160  160  10
> [root@localhost ~]#
>=20
>=20
> With this patch we're getting '20' instead of '160' because you're using
> NUMA_DISTANCE_DEFAULT, while FORM1 will default this case to the maximum
> NUMA distance the kernel allows for that affinity (160).
>=20
> I do not have strong feelings about changing this behavior between FORM1 =
and
> FORM2. I tested the same scenario with a x86_64 guest and they also uses =
'20'
> in this case as well, so far as QEMU goes using NUMA_DISTANCE_DEFAULT is
> consistent.
>=20
> Aneesh is already in CC, so I believe he'll let us know if there's someth=
ing
> we're missing and we need to preserve the '160' distance in FORM2 for this
> case as well.
>=20
> For now:
>=20
>=20
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
>=20
>=20
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.2, thanks.

>=20
>=20
>=20
> >   hw/ppc/spapr_numa.c | 22 +++++++++++++++++-----
> >   1 file changed, 17 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> > index 5822938448..56ab2a5fb6 100644
> > --- a/hw/ppc/spapr_numa.c
> > +++ b/hw/ppc/spapr_numa.c
> > @@ -546,12 +546,24 @@ static void spapr_numa_FORM2_write_rtas_tables(Sp=
aprMachineState *spapr,
> >                * NUMA nodes, but QEMU adds the default NUMA node without
> >                * adding the numa_info to retrieve distance info from.
> >                */
> > -            if (src =3D=3D dst) {
> > -                distance_table[i++] =3D NUMA_DISTANCE_MIN;
> > -                continue;
> > +            distance_table[i] =3D numa_info[src].distance[dst];
> > +            if (distance_table[i] =3D=3D 0) {
> > +                /*
> > +                 * In case QEMU adds a default NUMA single node when t=
he user
> > +                 * did not add any, or where the user did not supply d=
istances,
> > +                 * the value will be 0 here. Populate the table with a=
 fallback
> > +                 * simple local / remote distance.
> > +                 */
> > +                if (src =3D=3D dst) {
> > +                    distance_table[i] =3D NUMA_DISTANCE_MIN;
> > +                } else {
> > +                    distance_table[i] =3D numa_info[src].distance[dst];
> > +                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
> > +                        distance_table[i] =3D NUMA_DISTANCE_DEFAULT;
> > +                    }
> > +                }
> >               }
> > -
> > -            distance_table[i++] =3D numa_info[src].distance[dst];
> > +            i++;
> >           }
> >       }
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--F9Px+3+6LM2/b7tk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGImPQACgkQbDjKyiDZ
s5K2Aw/+N9phh8AHYcEhCfuPAUnEGsj5EzR+Ev9kF/B5/AJFjIrzOZrZ+cSg7sC1
rlNZbNGzTuz/xOpu7/tByjUalbrZvaCdma2acbpEdA9dzubUkF2kK3g4ou9PWOR1
V6y20RJCyAi2mmUKVMlMiEvr7bFMnPy+0jcvX9T8HRJm9joeqMpUWbJXiUG6mFwY
g1r3o9qtU0i5tB1hAsUf8VIETm5bX3mqUiY8oOOllJBvIHlWHSGJxWzBqMRVTRbE
ViLKFR4zGAkwMw7dSXNF5dvNjwC1mnSaYd+Vu/DDzDieUQ4ufIWL0zjUA26oel5A
J5HIQWwKSn51hOKSSpoZfK/Z7IX9H1EHPZF0p2xMEWsI9n484GsZfxpnqjGEFiSP
fFvO4xWJ40KzTm62ndJF+j2AJ0UVmOaZIqaAsedJg+qhGc0Dcfr2ExKqINZDz+xO
KAutZ3SXXbGiNVT/wy9Xjcc1M71YjZ5KbbCu4AUcSN1hlXYNG30lccoR5l9HWHtz
vrcwD6gyuLMF6/Ux6td3bTNya9IEbvfMfPQmeo6Y8R51GgSoZa7mEXrfGl7EWCPk
gRrbhHic3DaNxgsg/N0TMgyBaXLtE+0Fj01joSi5dMKCvnUgQjjdA/xzkIg8nFNT
FCJtp21TTo2hCprrFp738ILctBnZe3abTxVvSh+uVyI7a9i6pl8=
=PleA
-----END PGP SIGNATURE-----

--F9Px+3+6LM2/b7tk--

