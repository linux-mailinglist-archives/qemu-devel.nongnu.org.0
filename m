Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A62BFF0F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 05:43:02 +0100 (CET)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh3gr-0006CD-Bm
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 23:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d3-0000vn-Vg; Sun, 22 Nov 2020 23:39:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54449 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d0-0006KE-JZ; Sun, 22 Nov 2020 23:39:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZD93rtJz9sTL; Mon, 23 Nov 2020 15:38:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606106329;
 bh=10KUIri8jJydxNJLrH6qG3uc01r2M1JE15p1m4Ab7T4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bcxAjVhJ2iq2WkK42s5dzCYB2mE/fhCiSERv8R7P/76PtJtUKINTHlS4XREJd5wO+
 b6LaGdCcXiB9gX+iAekbmWiVONJ4vpk7mHQkJIQOe3izRl934YQWcIGKgzLHG73Tp3
 3VdG+44i8IhdHEuucObDy5C8Uvvn7XxPlNfWXpes=
Date: Mon, 23 Nov 2020 14:33:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 1/8] spapr/xive: Turn some sanity checks into
 assertions
Message-ID: <20201123033308.GA521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-2-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20201120174646.619395-2-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:46:39PM +0100, Greg Kurz wrote:
> The sPAPR XIVE device is created by the machine in spapr_irq_init().
> The latter overrides any value provided by the user with -global for
> the "nr-irqs" and "nr-ends" properties with strictly positive values.
>=20
> It seems reasonable to assume these properties should never be 0,
> which wouldn't make much sense by the way.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0.

> ---
>  hw/intc/spapr_xive.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 1fa09f287ac0..60e0d5769dcc 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -296,22 +296,16 @@ static void spapr_xive_realize(DeviceState *dev, Er=
ror **errp)
>      XiveENDSource *end_xsrc =3D &xive->end_source;
>      Error *local_err =3D NULL;
> =20
> +    /* Set by spapr_irq_init() */
> +    g_assert(xive->nr_irqs);
> +    g_assert(xive->nr_ends);
> +
>      sxc->parent_realize(dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
>      }
> =20
> -    if (!xive->nr_irqs) {
> -        error_setg(errp, "Number of interrupt needs to be greater 0");
> -        return;
> -    }
> -
> -    if (!xive->nr_ends) {
> -        error_setg(errp, "Number of interrupt needs to be greater 0");
> -        return;
> -    }
> -
>      /*
>       * Initialize the internal sources, for IPIs and virtual devices.
>       */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7LXIACgkQbDjKyiDZ
s5Jy9Q//Y0d+0KqzKir4cD/B/wvOQyy1v4YQgtE8hGIU8CtVl93QTeTrCZxqQlpg
IvfH3RhNnQSPLlRsKEM+DRHvHMDAEGaDLqLNUenb/JQxhXbZkawd3csceFxSXS+D
mNjsAsY2hbLtv/hF1z8hdvt7RhUAY748jWXMX+ZXHQE3v1N9dmvL4cv+ccygsm3C
oUjEjyKDJdXZvKN7FtJTrWQO9quGPa0/p58yEReZxS/SbA2cmuvPoYguhbf5Mi8a
ZKghSWfIQHrigGfapjE3boQxZg0yWoxMvC+5PvnYPMXqN1Vl7mt5JRGiTqgSB0V/
mKZuAMZSuHHTnUJodT9PSsCAmgytdl0lkxJntrMnJcvpiKd1uSPv64f/mHnQgBI7
+jgvvAefuockU9IrJp+veKGRpjKQvsHBHS1gT3yHBR5iN+fLOuWRg6v9U4inrBRu
MWYr4u++5PsJxLV1ITavHPwqRJiy1vI/dyjZcb0LlQe8aR478jA0vSgxJibVmN8A
vWTIhVMATXJBkhcNPDL0RWhYh7jM4B+/1NuYcZiT2o8EUIvQdBJylDFWKtjKRdQX
pqJ/UgWYOTK5/j8I5xoNLGlz9fM/egPO4vzVCXhqw08geFkZAeUf6X/ysOrSfKWh
ElaxGN1DNl6kJeJxOWxcPhwIkLhKYL6byybWuLqggt6pxRKM+jM=
=y7lI
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

