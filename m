Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397E30827A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:38:11 +0100 (CET)
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Hne-0006Tx-7t
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk8-0001VS-GG; Thu, 28 Jan 2021 19:34:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33201 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk6-0003L4-N5; Thu, 28 Jan 2021 19:34:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRddB13z7z9sWX; Fri, 29 Jan 2021 11:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611880462;
 bh=w965pPUTtdr0OQD34WPnD+e41EnpLduXsPsSmkYnQrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oBXbtNZM5N7F10vrK16Nt7BOd+mmPtzYp28VlPvZTO7o/2N8/hmJZ/2l6Tvsq9A92
 SPZnkJFAdDawFZHitZh7qTj0I+kfGNvPaYOb5LoLEQGVxuM96yua5EqxzQHw/AvaTw
 QGR5QfdIPtRjGnVvButwU8GkBKc08OZJ6vY6H0so=
Date: Fri, 29 Jan 2021 11:15:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/ppc: Fix truncation of env->hflags
Message-ID: <20210129001537.GG6951@yekko.fritz.box>
References: <20210124032422.2113565-1-richard.henderson@linaro.org>
 <20210124044634.GA8202@yekko.fritz.box>
 <fed7279c-528c-c4d3-f305-c88ffcdf7bff@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline
In-Reply-To: <fed7279c-528c-c4d3-f305-c88ffcdf7bff@linaro.org>
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2021 at 09:38:04AM -1000, Richard Henderson wrote:
> On 1/23/21 6:46 PM, David Gibson wrote:
> > On Sat, Jan 23, 2021 at 05:24:22PM -1000, Richard Henderson wrote:
> >> Use the cs_base field, because it happens to be the same
> >> size as hflags (and MSR, from which hflags is derived).
> >>
> >> In translate, extract most bits from a local hflags variable.
> >> Mark several cases where code generation is *not* derived from
> >> data stored within the hashed elements of the TranslationBlock.
> >=20
> > My knowledge of TCG isn't great, so I'm pretty much prepared to accept
> > this is correct on your say so.
> >=20
> > But that commit message feels like it's following on from a
> > conversation that's not here, nor linked.  It'd be great if it
> > explained how said hflags truncation is happening, because it's
> > certainly not obvious to someone with only a fair to middling
> > understanding of TCG.
>=20
> Mm, fair.
>=20
> How about:
>=20
> The assignment from env->hflags to tb->flags truncates
> target_ulong to uint32_t.  This loses important bits from
> the top of hflags, which results in incorrect tb selection.
>=20
> Use the cs_base field instead, because it happens to be the
> same size as hflags (and MSR fom which hflags is derived).
>=20
> In translate, extract most bits from a local hflags variable.
> All of the checks vs env->flags are redundant with env->msr_mask
> in that msr bits cannot be set when the feature is not available.
> Mark several cases where code generation is *not* derived from
> data stored within hashed elements of the tb.

Thanks, I've applied the patch with the updated description.

>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATU6kACgkQbDjKyiDZ
s5JfBg/9Fnkuay34+bCWZerwtXfwZcIHIXxldbM0wBbvjFC/F1CB32p+I9b/0hWO
+UFZ3+/QhAPAEkWx2EmvsWAxJ9XD+JhAkqVKiW8eG8J0f0//u/UMGkl1oz+6Jdjv
m2kglwUr+u/nR94QxhCmigJj0kGbkasjOODIRpduL9xzQbl3pYJ6TenX8wjPFABI
koN7Zg7WRWwqom7SCbM9soDgbUYWMOBtvPgPDJaZb14CF3Sogd6SiuLFYwxK/DIQ
eT4Pm7/V4wusANT+d67UPqOoVzzly65pxCmOQpcus4CDq4JYga+fGScDgYppXspp
D1KQR4VpZ1MO5e7WhNb/wrbRbqgC7i4EhNpcUaoqgBDGzvfZVrcqr0Eo3JcBxt5f
JMLVlYubY+ZuDtRpVcTZxLpRQQj9sa3Gywy8VWO2PdrTVnFKLojuhIraTk11gzdS
ijv4wY3BygFASZpKUyxDjR1mhHaaXmldBc+r9mnRgDfVvA5oEz9lbU/9GxLuBhZY
lq6E4LfOV1WeRnLnbbRHFnFY+/VJZOBLCeg1J1EzomxAtyD/GUXt+WZUa/S1Pegn
AsIyBNU4GQeEZiAhRzQAZMnX8DZPXPCpdXKhY6/w3+z4FzPIQPe8ljmGM6ZTmqdD
dLwrbtd2AnE2Pxy0+OXyNf/IwAt2W6qZkAJ8RfoH0aXqsyrmST4=
=2YNr
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--

