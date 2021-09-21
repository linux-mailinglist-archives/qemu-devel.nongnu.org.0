Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855C412D13
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:53:16 +0200 (CEST)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVuE-0001Cc-VX
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrF-0007Bt-Hw; Mon, 20 Sep 2021 22:50:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58313 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrA-0007DU-L3; Mon, 20 Sep 2021 22:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632192599;
 bh=yDrSZM8A0qOB5iCFPWQlzn6Wewc9rNrlXPJ1ZW3CZsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NkNqzDlVQWLwBf/z17MLmF4850g8J7+cGOuOJHI2g/xvXMu7kWP0VpF+tN68Onj2s
 y9fZulBfki02YGQHQ9z8IrT9qH3z0PXJZNWsyfH5xchzXe0Cs2TTRDusQG4RQ6l+Iq
 qM/MqFn8L5bEWTUrmIWpzDpIswC44kjoMi+xx5hg=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HD5WC5zshz9t0p; Tue, 21 Sep 2021 12:49:59 +1000 (AEST)
Date: Tue, 21 Sep 2021 11:37:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v9 7/7] spapr_numa.c: handle auto NUMA node with no
 distance info
Message-ID: <YUk3QF0LHjSxrhRn@yekko>
References: <20210920174947.556324-1-danielhb413@gmail.com>
 <20210920174947.556324-8-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cYpQFTRd6wEXY1To"
Content-Disposition: inline
In-Reply-To: <20210920174947.556324-8-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cYpQFTRd6wEXY1To
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 02:49:47PM -0300, Daniel Henrique Barboza wrote:
> numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
> for the pSeries machine if none was specified, but without node distance
> information for the single node created.
>=20
> NUMA FORM1 affinity code didn't rely on numa_state information to do its
> job, but FORM2 does. As is now, this is the result of a pSeries guest
> with NUMA FORM2 affinity when no NUMA nodes is specified:
>=20
> $ numactl -H
> available: 1 nodes (0)
> node 0 cpus: 0
> node 0 size: 16222 MB
> node 0 free: 15681 MB
> No distance information available.
>=20
> This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
> enforcing that the local distance (the distance to the node to itself) is
> always 10. This allows for the proper creation of the NUMA distance table=
s,
> fixing the output of 'numactl -H' in the guest:
>=20
> $ numactl -H
> available: 1 nodes (0)
> node 0 cpus: 0
> node 0 size: 16222 MB
> node 0 free: 15685 MB
> node distances:
> node   0
>   0:  10
>=20
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_numa.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 13db321997..58d5dc7084 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(Spapr=
MachineState *spapr,
> =20
>      for (src =3D 0; src < nb_numa_nodes; src++) {
>          for (dst =3D 0; dst < nb_numa_nodes; dst++) {
> +            /*
> +             * We need to be explicit with the local distance
> +             * value to cover the case where the user didn't added any
> +             * NUMA nodes, but QEMU adds the default NUMA node without
> +             * adding the numa_info to retrieve distance info from.
> +             */
> +            if (src =3D=3D dst) {
> +                node_distances[i++] =3D 10;

Would it make sense to use NUMA_DISTANCE_MIN here, rather than a fixed
value?

Again, simple enough that it can be fixed in followup.

> +                continue;
> +            }
> +
>              node_distances[i++] =3D numa_info[src].distance[dst];
>          }
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cYpQFTRd6wEXY1To
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJN0AACgkQbDjKyiDZ
s5LhghAA2Eelpj4q69f/JsX3dLv/tsqVhfqDbYEaDUXXih2vUXo95LI86pEzqThR
8pfMh1tu3dvMbAUeUePPx/YWHzFA+2k8lSEshufqKH6hK3s2pnxJTwfv4dU7B4MS
qzS6lMFRbuUvo9MOoJd7lfLd2GGtFUgaRZpuBXZriEmFsucR5n813ebi9v7SWETh
s4Zf8W7bAqpu+3JuX9lbxc2Swjc+ZBd0mgr4SpagKOyhL/B3KzARHVqL2NB8VYi/
QovtBoKwolzDfuWP5YbXcax4fIwynOewsmdMTX3ibeKAeKsXJo3Mz1+SRzVPOEnL
+hHK9Dip8qKkNQMMp75aHFXjPFCwH1fqonGWkalkNCSULhGQqChLx0Laf/CL2LpW
2wJG1mLJYYMjgQsQLYGE0hqH+MZ2GxF3fcViRLFn4XOqYmmOWyfXKFGJfnBDw15E
Ev1uWEMi02L2Xoz0VZ5qsg/lLNgbAFFYBYsVbSA3nibT0hnNdqAhwQ+HMVklfzDC
2NinRgdJoCXcu/wUtdFrk7mjmXyKMJnzoijF2ksqw65bJ0MnYIlBTTvAtqtvEoZk
uHA9Pj6ma/gN+roLEL2wsQQRm9HGZwOO1ewkgF+3u76w33Qr1H1q2o3sm61H+k74
JYv2nnurxe3+JAQcR79ijO+tB68jhQkRmm22soZHqrVk3C2okpw=
=lDjc
-----END PGP SIGNATURE-----

--cYpQFTRd6wEXY1To--

