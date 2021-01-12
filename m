Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD72F234B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:21:40 +0100 (CET)
Received: from localhost ([::1]:36484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7RL-0007Kn-Fy
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kz7NR-0005kA-Bv; Mon, 11 Jan 2021 19:17:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33579 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kz7NM-0005sm-Ry; Mon, 11 Jan 2021 19:17:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFB3X75kLz9sXN; Tue, 12 Jan 2021 11:17:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610410649;
 bh=GLzzxtEQ9Iim2dDjwdvZQLocsRxBSzgrNPFejCIvzR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TttNymKTveF6OxcVwZfdB0ShBq07X9NRQHa7jiR1LHY3ZwU0wWyb9NVWAG7gSRM68
 R0ltjL02PtgK4WdKnRFKRKRqgnpOQR5mo43JOqtKlQ0kKSSad8DKKcxc1QYeJjXA8B
 vCC+XCrQvK4rki0KQpU9G3V0CSicRaoIeC6KjTWA=
Date: Tue, 12 Jan 2021 11:12:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/intc/ppc-uic: Make default dcr-base 0xc0, not 0x30
Message-ID: <20210112001257.GG3051@yekko.fritz.box>
References: <20210111213007.7381-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8S1fMsFYqgBC+BN/"
Content-Disposition: inline
In-Reply-To: <20210111213007.7381-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8S1fMsFYqgBC+BN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 09:30:07PM +0000, Peter Maydell wrote:
> In commit 34d0831f38fd8 the ppc-uic device was added, with a dcr-base
> property. The intention was that the default value of dcr-base should be
> the one that most of our boards need, so that in the common case they
> don't need to specify a property value.
>=20
> All QEMU boards with a UIC use a dcr-base of 0xc0, with the exception of
> sam460ex which has four UICs and so puts them at 0xc0, 0xd0, 0xe0, 0xf0.
> So 0xc0 is the obvious right choice for the default dcr-base.
>=20
> The board code conversions in commits 0270d74ef88623505 (bamboo) and
> c5ac9dc64fa552a6 (virtex_ml507) assumed that default was 0xc0. Unfortunat=
ely
> the actual default in 34d0831f38fd8 was 0x30, by mistake, so the
> bamboo and virtex_ml507 boards were broken as they were converted
> away from ppcuic_init() (which always specifies the dcr_base property
> value explicitly).
>=20
> Set the default dcr-base to 0xc0 as was intended, fixing bamboo and
> virtex_ml507.
>=20
> Fixes: 34d0831f38fd8
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied, thanks.

> ---
> This is the right way to fix the bug I was trying to fix with
> "hw/ppc/ppc400_bamboo: Set dcr-base correctly when creating UIC".
>=20
> David: you probably want to put this patch in your ppc queue
> before "hw/ppc/ppc405_uc: Drop use of ppcuic_init()", as that patch
> also assumes the 0xc0 default.

Done.

>=20
>  hw/intc/ppc-uic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
> index b21951eea83..7171de7b355 100644
> --- a/hw/intc/ppc-uic.c
> +++ b/hw/intc/ppc-uic.c
> @@ -274,7 +274,7 @@ static void ppc_uic_realize(DeviceState *dev, Error *=
*errp)
> =20
>  static Property ppc_uic_properties[] =3D {
>      DEFINE_PROP_LINK("cpu", PPCUIC, cpu, TYPE_CPU, CPUState *),
> -    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0x30),
> +    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0xc0),
>      DEFINE_PROP_BOOL("use-vectors", PPCUIC, use_vectors, true),
>      DEFINE_PROP_END_OF_LIST()
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8S1fMsFYqgBC+BN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/86YYACgkQbDjKyiDZ
s5JzJQ//f9MDDVMUMIRK/X/cOrdHeTswqegsq2e+zuh7R3q4Qam0B5h9DEBO14oR
uRzOTc6a2Xjxt98lSeIuTwZ3hG1TMKmgcuDdxloMk1fbDZXe6fvxkMcsUbJlhWqK
cok9XwSsCDc5J/6qyrqMSM9Xt8EvEVf959l7qFd+RVmkmxk9b8/IXUfFLx/Z06vf
7XPeAfi/cjEE2wertD3wBTNvTKNmJ0uDcFTOPlj1+6oRKGIXhC7jzKlpDr+KfZ8w
sPZS3893WgqBOyPeVl1UzJAu/GQm80Iv2tXY+BOhwYBydfy1NL3rdn168Gk074x6
zzFmkhwbMCQ8I0O7gvjehCOCPO8Aj3FFkU9K6wyYPeuCwTXNkBgSegU0j2GNrbvf
M/CYSsXpoynIHfoKYgkyHGAT5RTriZEtVgHL+wyhlJAZYtqA0wkiyu/DyOAMAHaT
LJCJhgTYA9uIfv8IbrubxfSsVJhk6RRdj7LiJ5+glO96WnIKoVftcGyDaw2TFr3O
BATCNNJ6GhNka4hMU5BRVYCuonOL1xUcaNb61fHNscYWa3ZcRtxRLrGYNvcx7fPl
aQNl5mdxgdMNgMcauiM5LBHJai1k8pjBt8VSKGe+Caotr6gR933uOPZnybiPu5GV
Bqz8pgS09Is648Z0fFl1Hm9rvJw4CyudyOD6O5EbzEFO5QKMTyA=
=pD0Q
-----END PGP SIGNATURE-----

--8S1fMsFYqgBC+BN/--

