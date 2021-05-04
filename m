Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79483723F2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 02:47:48 +0200 (CEST)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldjE3-0001I5-Pe
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 20:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB8-0008GD-RI; Mon, 03 May 2021 20:44:46 -0400
Received: from ozlabs.org ([203.11.71.1]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB6-00064F-HP; Mon, 03 May 2021 20:44:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ1M50WJPz9sV5; Tue,  4 May 2021 10:44:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620089073;
 bh=PLvN2GZOUuAV2f+90I1JpgaQnrNgHsgTPuZ3/8ra1B4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SyQNvUTPJjXaDveLmLmmpaUaGWtVCr9xn7bDnydEqJpGVn2hYCfvVRPqG284+j7sZ
 LULpTurdw1isEcnXkY7+muJQWXTHf5cvgc1mhvsaZTaIqQQDwjDrHW7GPAb2Zv/d25
 hrdCOK8cjupj9ZsRu3CaH7qFKih4F06kjdYLR3fI=
Date: Tue, 4 May 2021 10:37:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] hw/ppc/pnv_psi: Use device_cold_reset() instead of
 device_legacy_reset()
Message-ID: <YJCXLQ07euUrnoW3@yekko>
References: <20210503151849.8766-1-peter.maydell@linaro.org>
 <20210503151849.8766-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a6N9rFVjvxLxVeYB"
Content-Disposition: inline
In-Reply-To: <20210503151849.8766-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a6N9rFVjvxLxVeYB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 04:18:49PM +0100, Peter Maydell wrote:
> The pnv_psi.c code uses device_legacy_reset() for two purposes:
>  * to reset itself from its qemu_register_reset() handler
>  * to reset a XiveSource object it has
>=20
> Neither it nor the XiveSource have any qbuses, so the new
> device_cold_reset() function (which resets both the device and its
> child buses) is equivalent here to device_legacy_reset() and we can
> just switch to the new API.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to ppc-for-6.1.

> ---
>  hw/ppc/pnv_psi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index 3e868c8c8da..292b373f93f 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -466,7 +466,7 @@ static void pnv_psi_reset(DeviceState *dev)
> =20
>  static void pnv_psi_reset_handler(void *dev)
>  {
> -    device_legacy_reset(DEVICE(dev));
> +    device_cold_reset(DEVICE(dev));
>  }
> =20
>  static void pnv_psi_realize(DeviceState *dev, Error **errp)
> @@ -710,7 +710,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwadd=
r addr,
>          break;
>      case PSIHB9_INTERRUPT_CONTROL:
>          if (val & PSIHB9_IRQ_RESET) {
> -            device_legacy_reset(DEVICE(&psi9->source));
> +            device_cold_reset(DEVICE(&psi9->source));
>          }
>          psi->regs[reg] =3D val;
>          break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a6N9rFVjvxLxVeYB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQly0ACgkQbDjKyiDZ
s5IHmQ//X8gnfp2sZYSF1z1y2bxX7YM3/wVJLHEoISRpl+pD92NJgaa1THl0nBtl
wZetfIFr5mTb/mT8ZgLUwAbK5FIFV/PRA8taNpvF9BcoppV5yP87Pe2BKjjQ6V6I
1zVEp3rlb6YaoCgqfp9BDI86ReNgg9bfukLz7kLk6x7pqWiIegSOAtHN44wosGdZ
3JywUw1lKZg4DklHTN1k1E5cgjU5w81UJBwzYCDnosYTY1XfzI+sVYDVbbeMSZ+/
ywGylm6+jFv+7VKUMVkAtB4o9zQoTgkq59cSZ5pBe2E1x0ZJugcsiXaj//QckdK/
yP6IcoFWkwayGJ+2iwtNprM/uN9tE3sBNz0aJp7P8iC1C9MTQPSxE6iS8MA3kIN9
YdG2V7HcNCQJ4jUqTb1tC0ERdAp6JJCcZU+T9iWQ7sSkIE7eoFpAH/LWEmAdW6LW
Jx+z/tofhFspcYRC5NH/zUS+ZCfxxcUfcqe/yPHtyEwAGogRnn7WE/e2D0CZIDRt
ZwVCCOwq51qN52rBb63ZVieyqSNrCttEA+IcnxDdIY67jg39mNE3+SsZIfpVSzwd
GLOizVjGAq6YJ6v9LY9czaLP3Dm47QtZB/Hsy7lDkLNSl2eT3FDdhfz8GVyp4ucE
ST1tfnEMkLAOKyxKYCV7d5+WS3i+Pld7WEvlyADKLszA/XsaJlI=
=2Z+Y
-----END PGP SIGNATURE-----

--a6N9rFVjvxLxVeYB--

