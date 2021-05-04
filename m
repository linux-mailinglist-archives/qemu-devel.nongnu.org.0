Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2773723FE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 02:51:30 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldjHd-0004Xs-M1
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 20:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB8-0008G9-Qb; Mon, 03 May 2021 20:44:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB5-00064E-RQ; Mon, 03 May 2021 20:44:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ1M508XWz9sVb; Tue,  4 May 2021 10:44:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620089073;
 bh=cYDch95/fpblAHgS12xk1CK4m0qvhj8LNf0okxDU9PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YjiwbkJzcnX7ZeaC40LSh4lQYztoiLk57/DbM9MHvjMcVYkrWNEcEhKVip2Qb8Gmo
 /orYWYWnTlioIYzlLFg4XbX/uoZfKsogqTkGIJCkZKhKI58OIbGE7bYREiEdJOfMg3
 Qp1sgA4aNFrbMGXRm1nr6EK89HmU5mYjA17+6Tm4=
Date: Tue, 4 May 2021 10:32:47 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/3] hw/intc/spapr_xive: Use device_cold_reset() instead
 of device_legacy_reset()
Message-ID: <YJCWL72pTbjFxx0v@yekko>
References: <20210503151849.8766-1-peter.maydell@linaro.org>
 <20210503151849.8766-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XmJjt93fWusNr7iV"
Content-Disposition: inline
In-Reply-To: <20210503151849.8766-2-peter.maydell@linaro.org>
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
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XmJjt93fWusNr7iV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 04:18:47PM +0100, Peter Maydell wrote:
> The h_int_reset() function resets the XIVE interrupt controller via
> device_legacy_reset().  We know that the interrupt controller does
> not have a qbus of its own, so the new device_cold_reset() function
> (which resets both the device and its child buses) is equivalent here
> to device_legacy_reset() and we can just switch to the new API.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to ppc-for-6.1.

> ---
>  hw/intc/spapr_xive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 801bc193416..89cfa018f59 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -1798,7 +1798,7 @@ static target_ulong h_int_reset(PowerPCCPU *cpu,
>          return H_PARAMETER;
>      }
> =20
> -    device_legacy_reset(DEVICE(xive));
> +    device_cold_reset(DEVICE(xive));
> =20
>      if (spapr_xive_in_kernel(xive)) {
>          Error *local_err =3D NULL;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XmJjt93fWusNr7iV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQli4ACgkQbDjKyiDZ
s5K5xg/+LWshrzmIMTmlzyJItaugDdgedRHbFCJBDXbR5Pu5OKySSeQ6++8alPvk
Awbwttlf2Wg8gAvsqc9ylzRcEzgo4yo+5C/2dY9kSj6WxL2l9tQ6gOyhC7KDdTsX
g4EZvRa223u18UZsL2PZiGJ8LsYDGHyJJHpwGZdygx35H32tEd9TLz5tSxA9tG6n
nHZxm6k/+0nJkHUBSId0TLA6xhRASn9krb/QpPOcS80X/l2HaSbhq5DlNirqIdqv
nU/TfWHne/3MqvYvjSLgt+NTvjWdCV0t7BUfn8t7H902H2xWnMb9cHP0NV+4H2Jd
n0nOlL6E+J22TLkatsE0aVP9FQ5m+tfBVK1511W0SUCQVwdvn3QVtJNWMiCf8Wh2
YeUQbAqG11Sv4LFQGMdkh6hWDZrJpJhz4/BobRB5OZDKQEZ6ahcuigGk8UP0VBQR
bozNrOS9Fv9i7aO35hDZ3DUUzzQ9F1anxpw45vI+r29NP1ZSn6ajUOR1oKa/PQIP
ti3Fzvyh+o+mrjp75iL7AeRdTxWe4RXotsSYcKW8y5tuiJz3jwziZiyYEbwEBm9h
tg1HtD8aRpZYBa5Y3HUKFtmv75vgPLUl31fLD4rdYSwILBcb/WT9XTB7rtsNU6mH
G68Q9GPqUvD1moe/ngOo6nmAIQo5GOfpiFGYypiVGYBLgATC3LU=
=uGKS
-----END PGP SIGNATURE-----

--XmJjt93fWusNr7iV--

