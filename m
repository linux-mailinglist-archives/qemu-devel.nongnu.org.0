Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1382CCCD3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 03:50:23 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkehK-00015f-P9
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 21:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkee5-0007t6-LQ; Wed, 02 Dec 2020 21:47:03 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48697 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkee0-0005tX-0H; Wed, 02 Dec 2020 21:47:00 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CmgGK1LgVz9sVH; Thu,  3 Dec 2020 13:46:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606963609;
 bh=L/nABbYVA8P1p5UYH4BmatzMW3S5fRg+QYzE7+tqPxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2cOaSo72W2cq6NTGOnQ05SgG+5bsYEcEH9mx/N3VIqHzJf0YdAZn+wYkZf1ecGh7
 iy7HDEl4CBWo8BvmKaxwvHfo14UYxu4IsoaIxot71epJ1dnPZ/0I5Pr85Wo9+Ny59r
 pOF2onScOr3q/MLSWIn95R5neo98MZhuxaPw4Mmw=
Date: Thu, 3 Dec 2020 13:31:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0] hw/ppc: Do not re-read the clock on pre_save if
 doing savevm
Message-ID: <20201203023127.GD7801@yekko.fritz.box>
References: <160693010619.1111945.632640981169395440.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline
In-Reply-To: <160693010619.1111945.632640981169395440.stgit@bahia.lan>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 06:28:26PM +0100, Greg Kurz wrote:
> A guest with enough RAM, eg. 128G, is likely to detect savevm downtime
> and to complain about stalled CPUs. This happens because we re-read
> the timebase just before migrating it and we thus don't account for
> all the time between VM stop and pre-save.
>=20
> A very similar situation was already addressed for live migration of
> paused guests (commit d14f33976282). Extend the logic to do the same
> with savevm.
>=20
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1893787
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/ppc.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 1b9827207676..5cbbff1f8d0c 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1027,7 +1027,8 @@ static void timebase_save(PPCTimebase *tb)
>       */
>      tb->guest_timebase =3D ticks + first_ppc_cpu->env.tb_env->tb_offset;
> =20
> -    tb->runstate_paused =3D runstate_check(RUN_STATE_PAUSED);
> +    tb->runstate_paused =3D
> +        runstate_check(RUN_STATE_PAUSED) || runstate_check(RUN_STATE_SAV=
E_VM);
>  }
> =20
>  static void timebase_load(PPCTimebase *tb)
> @@ -1088,7 +1089,7 @@ static int timebase_pre_save(void *opaque)
>  {
>      PPCTimebase *tb =3D opaque;
> =20
> -    /* guest_timebase won't be overridden in case of paused guest */
> +    /* guest_timebase won't be overridden in case of paused guest or sav=
evm */
>      if (!tb->runstate_paused) {
>          timebase_save(tb);
>      }
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/ITf0ACgkQbDjKyiDZ
s5JdCQ//cSEiZn0ryqyr14eMh40jiSYlFc5TUGMP+LHhvTKSKpPfyFoc6Ypwk85O
ZvKcvstwExrFl5ZwyVJXHgHgQgewvCZ8yn1c6L/+w2OJs/CC4BgwJVJkSVIjAAD6
Whuzt2Hh6Efts+pP69RsUVMKWQyT3FPFL1pRPOhQb6HCNLbceJC4Gdfqzxfnvem3
9bUVoR/8TO9aoTsW0/2eNj0M6OmO0SAOBumJr6Lcg+l0NQSDw416yq9STU3vmjie
WE5q79KK0sOynx1LWaoElwQaQZC3KvZqajQslFztfhTtBNqiFd0BWHIWCfZ5CKL5
5kNFHqcH/ORvpEk+ZpNWHdM/fcMpFSLZ805kxStj0d7poKORDCqd95CtHdhvNuxS
L30L7x+xMBmTfZsTSxms+7lL8kC99bgb1+Yb7+dABJyMLOe5ykpwY9q/R/OGDNAI
PkJT13LHKhONhylTIpvxL0+ySQ/U4RlFqJmIcKtnax3gRFi++nk/3orGv6QeyYGb
08W/NWbPR75PnK7z0u7eZ6t+02XlfVQl+J5tYDsHDCWMpfB6EPdRH/Y+q8Xrg9a+
7guUXLgiiFYeOAZa8cU8DB0fgVcX8+6e1bWgVsJyqwEyf7RVTT6eOxhCzh+k0fwv
JV5q4K5W62bVuEYv0J4oRHBD3aTx6k8YH5mTJMEMdCPNbNgGaZ8=
=scm0
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--

