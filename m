Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACEB3723F1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 02:47:41 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldjDw-0001Hg-0T
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 20:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB8-0008GH-Vb; Mon, 03 May 2021 20:44:46 -0400
Received: from ozlabs.org ([203.11.71.1]:36029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB5-00064B-RN; Mon, 03 May 2021 20:44:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ1M46v1Pz9sSs; Tue,  4 May 2021 10:44:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620089072;
 bh=pPQqdd8ATVZAviZ98Yp0cs2ZpCxObXzSi/9SPu0uDho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5gTSw7JY+FCIPUzlYn0wUksuUnndo76IfnmIWltYchYhbk5GUGpfCNSynrirE5JN
 YTMel/Pjoc5lQxBzBp23mjoM2hBGPtlhRUP8s3qDI85OPXtWTP1YOTSAvZOBXlV9jR
 ZkozFIYfpcnlfvh4o1bUzqeDI23+6ODuen3Rothc=
Date: Tue, 4 May 2021 10:36:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/3] hw/ppc/spapr_vio: Reset TCE table object with
 device_cold_reset()
Message-ID: <YJCW8i9ePqDORgRS@yekko>
References: <20210503151849.8766-1-peter.maydell@linaro.org>
 <20210503151849.8766-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9kh7pS6FgneppnXx"
Content-Disposition: inline
In-Reply-To: <20210503151849.8766-3-peter.maydell@linaro.org>
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


--9kh7pS6FgneppnXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 04:18:48PM +0100, Peter Maydell wrote:
> The spapr_vio_quiesce_one() function resets the TCE table object
> (TYPE_SPAPR_TCE_TABLE) via device_legacy_reset().  We know that
> objects of that type do not have a qbus of their own, so the new
> device_cold_reset() function (which resets both the device and its
> child buses) is equivalent here to device_legacy_reset() and we can
> just switch to the new API.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to ppc-for-6.1.

Actually, I strongly suspect we could just change rtas_quiesce() to
cold reset the entire VIO bus, but we can look at that as a followup
after checking  bit more closely.

> ---
>  hw/ppc/spapr_vio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
> index ef06e0362c8..b59452bcd62 100644
> --- a/hw/ppc/spapr_vio.c
> +++ b/hw/ppc/spapr_vio.c
> @@ -310,7 +310,7 @@ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *=
crq)
>  static void spapr_vio_quiesce_one(SpaprVioDevice *dev)
>  {
>      if (dev->tcet) {
> -        device_legacy_reset(DEVICE(dev->tcet));
> +        device_cold_reset(DEVICE(dev->tcet));
>      }
>      free_crq(dev);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9kh7pS6FgneppnXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQlvEACgkQbDjKyiDZ
s5IXDhAAun4JBjfu7LXNy9iAcVPz8r8OkFiMrnx5jrQTuQt/BxTvKOvyg5USmNuo
t30/zEs5DScDq72TU5JdsDpG7glvsJfUs02+lc1I6NUuELw7y4jUL5+3C/jKTWLj
D+iiokLyXxFd6cAflCvqBoDXyv8KqsIW3W6u+95YT87tdD3jJK8SS2tQbl6zms9A
sf0nw2BNy2dAfPJRvgPbzsroCydP7EwxtPDiyN7sm/QVa3EcbgAg4Q9VhyAqsc+R
xvbiaA2516bqet3M9DX1Kq/hee7ktm0QdynbdSQFudgfBN8/czZPaA+Noo22+oYL
F07KA41WqJjqFo8/saf4jCUZySYlNHQrqlyn0d7yBQs1kOLLTVtlYWc3YTVYp8r1
mUudyUyqohyrKCFMtUapErNmzW1NG8hllX/BtMoF5W2pygK3N40ptMTzH2rZ4+XW
pcBFyLEfaPjuZvrD52TV8pffvg7ZkUj0VtZRtK50MP7FYiCZEROq8a2xf0x7xxHX
K/FuHLf1IIrZbczjZMhf/1WzOIEPGcmJUhpXPrir/uCh8Mj8Av6LbOa+xQqgnq9H
otH0xerIGkudHJ2TrAw8CAe0+MKVNoRtoLj9BSVewz6QX3mfWQT3uMOitNzCMLh6
viBDqs4Ilg5bWWGiPbgaQanJ+YjzGI/JNHVZS5lVzAB4yXMXot0=
=sXUr
-----END PGP SIGNATURE-----

--9kh7pS6FgneppnXx--

