Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D19392864
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:20:49 +0200 (CEST)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAK0-00038S-Qa
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC0-0006ly-B6; Thu, 27 May 2021 03:12:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40767 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmABw-0004eX-MP; Thu, 27 May 2021 03:12:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx15B6z9sW7; Thu, 27 May 2021 17:12:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=E/Ndn2SCd+X6j0dVw/SrVeztQK2/0dfFppAc/lg5MTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b0snFmNVyp3HcV++4u+9C+q3ivNBKZaMEUCkVaatZ0+qi+3a+Rr8siJPBxpFUc58u
 GbHvZQC9oEEFz2VZvR0S1Foa50ywEEYAGM1/pIoX+7Oqu4LwapqRINsmxFzfgfLTJ6
 ZNJ9XvTHlc1EMiaSg/nbSvkSHSOU1zu5SGd61UCQ=
Date: Thu, 27 May 2021 14:26:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr: propagate LPCR to hot-plugged CPUs
Message-ID: <YK8fhio3eTvqVuy7@yekko>
References: <20210524114132.572659-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LL3RTiAzHswm1JSy"
Content-Disposition: inline
In-Reply-To: <20210524114132.572659-1-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LL3RTiAzHswm1JSy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 01:41:32PM +0200, C=E9dric Le Goater wrote:
> Distros have started using the 'scv' instructions (glibc 2.33) which
> relies on the LPCR AIL bits. Unfortunately, the LPCR of hot-plugged
> CPUs is not synchronized with the rest of machine and it breaks the
> guest OS.
>=20
> Fix that by using the first CPU to set the LPCR value of all hot-plugged
> CPUs.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

I'm assuming this is obsoleted by Nick Piggin's rework of LPCR
initialization.  This patch does fix a real bug, but it leaves LPCR
initialization a bit of a mess.

> ---
>  hw/ppc/spapr.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c23bcc449071..e463c2570c7a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3890,6 +3890,8 @@ static void spapr_core_plug(HotplugHandler *hotplug=
_dev, DeviceState *dev)
>          for (i =3D 0; i < cc->nr_threads; i++) {
>              ppc_set_compat(core->threads[i], POWERPC_CPU(first_cpu)->com=
pat_pvr,
>                             &error_abort);
> +            ppc_store_lpcr(core->threads[i],
> +                           POWERPC_CPU(first_cpu)->env.spr[SPR_LPCR]);
>          }
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LL3RTiAzHswm1JSy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvH4YACgkQbDjKyiDZ
s5K6IxAAvqltC2P0qCOm9pIE7gPPNIYKWJTN0gSWAVyODMYZe/bnL6zilMeH1f5W
UxDXsc5mJrnzFV3A1QhU/Rwej5zwAdo69RyrkWSj6LVMg8X+IuGIkW9k5SlD0IYl
pidj9cOoMzOowCz4FAxk8RTmP56ON/b/5DcRDBXZMDV+MZoKsfwyjf2M0JFeNqdc
kP97PCgFnxWyt1oxDmQpA+DN+TMbUSW1R0OhgF/Wh5U515gD9CuZtv9QQCjWI688
qxDbohZUQBTRQOBfrnCPT6da1lyTwaX7Dc+8GBAoQXx8oftvV+IkAFcTqXR2aetH
DJT7OLIwOU/C0nyLF7hAMGuzSbCkTzmAiabEAA2r/CwaAEBoEhWa2Cm0Kdx2gyea
x2N/X2vw9LWb2dHgwttoDN7lNx2ij0SneNbaySygzvLC8Ddyd2EvoH/CRw//SysS
jaP6sjcHpKPNRtpZZXIEAQEppA+B42C/rHY1XghH/bKeKMKgGbY4u8QYNKt/2l4s
7LzcuisaZztjSupC4WXbCiPmjR/kMRcbqVtYQAeEhA4f5aWZACkbnvqoFYhs3ip4
KFHVoVegTtzlZXgGT6v+1qLdNhz/8fqcq9JnUC/fZCsa/MU7SCCDI3fX8bZLKZZN
i0aAvcmtn8Yu6hDv414WKwbtL+JxDiq7qsXarZVjP160v2/Bfhg=
=w5qT
-----END PGP SIGNATURE-----

--LL3RTiAzHswm1JSy--

