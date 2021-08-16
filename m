Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB233ECE20
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 07:46:07 +0200 (CEST)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFVRm-0001vu-Hb
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 01:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFVNR-0000O6-WB; Mon, 16 Aug 2021 01:41:38 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFVNN-0000p4-KE; Mon, 16 Aug 2021 01:41:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gp31Y0F7Gz9sWS; Mon, 16 Aug 2021 15:41:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629092481;
 bh=bY5NjSWeyYPOHhrLRa2wQBVfbwkbZKv0NLb+51gsRmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k7tfYYZBrcwzCki8gh+bMYlZtbamsFDVpMG5QR0NsnSJ093o826VWVoGOW93bPAyw
 AzADypLLEwIWk4aJyGoYRUHuocH3s00KFqL5vqTbM/L2TC1xWtlh8av7JCEZqIZ522
 YFuNsBWjLnd0XGDsryFImJxt4AZ70TeQCkDLmw3I=
Date: Mon, 16 Aug 2021 15:41:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
Message-ID: <YRn6d/Vb10JTmZ18@yekko>
References: <20210816025915.213093-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rqL4XfpV0+di3sqJ"
Content-Disposition: inline
In-Reply-To: <20210816025915.213093-1-linux@roeck-us.net>
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rqL4XfpV0+di3sqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
> IBM EMAC Ethernet controllers are not emulated by qemu. If they are
> enabled in devicetree files, they are instantiated in Linux but
> obviously won't work. Disable associated devicetree nodes to prevent
> unpredictable behavior.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I'll wait for Zoltan's opinion on this, but this sort of thing is why
I was always pretty dubious about qemu *loading* a dtb file, rather
than generating a dt internally.

> ---
>  hw/ppc/sam460ex.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 0737234d66..feb356e625 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -194,6 +194,14 @@ static int sam460ex_load_device_tree(hwaddr addr,
>          _FDT(fdt_nop_node(fdt, offset));
>      }
> =20
> +    /* Ethernet interfaces are not emulated */
> +    offset =3D fdt_node_offset_by_compatible(fdt, -1, "ibm,emac-460ex");
> +    while (offset >=3D 0) {
> +        _FDT(fdt_setprop_string(fdt, offset, "status", "disabled"));
> +        offset =3D fdt_node_offset_by_compatible(fdt, offset, "ibm,emac-=
460ex");
> +    }
> +
> +
>      /* set serial port clocks */
>      offset =3D fdt_node_offset_by_compatible(fdt, -1, "ns16550");
>      while (offset >=3D 0) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rqL4XfpV0+di3sqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEZ+nUACgkQbDjKyiDZ
s5JY+A/+MKqBRuhNF4p4dp98D8QuxeBvTVLevnROFaI0MofuZlx+sKVQwYAY3Nvq
6uEqucCcwa/+vEXoWwHJcSqdP3Pu+fG159kY5AYNeEg9vhz5u/F1y1/sxCTyKVp0
T+S5xCk5KZkBEZT1M2j+SroU1Pb4zCUUwgAXI2PMYyZZ5UfVfT8UvT0GIoXGvqfm
R1IqStzQ49akfSoq0ekkFhimJki+ZohunjYiEzEmZaVjZS7GNHoliC5vyT6TM72E
lV903xLH5+Yf4jCsKrzfbZpkhITKHe8UB4MQH5Lc1iAkbsKGARqhh9wSf758m+Cg
6WHwRDxfSymRRqgoagwuYPhlKOwE3LVnXJj8Nr42vr1A/rc0WDPVhpjmdSrO1rxx
Frbc6bxG9YynSELm6dWsIPZvcOmr2fRbP5Fqe8yUAPomcglgPHLA8/yYVKutSNaI
JfJsfHuuDkt2FPOgPBXDX6W4oSrpsuulgfi6vM2Jm6FQKRjPucVywcdblEfFFG9O
PGVRorjSSKTPe+3WUURJ473ozbnlT7eeurY+2VYxysUh2Ff2dMfqQOpTdrKGgaM6
UjgtzvoqDqbIdyjHyT7N0qv91QNyByHdqWL5G1103TVPQPVkKZRjxEun6bGApUg4
ooFTrSfZoO7/2vgqdaJBdS5pFPwVfz1wn9kP+YGgDbSdXckfhBk=
=pLR5
-----END PGP SIGNATURE-----

--rqL4XfpV0+di3sqJ--

