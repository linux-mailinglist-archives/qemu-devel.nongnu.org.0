Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518CA343834
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:17:10 +0100 (CET)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCw9-0006Nn-BI
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCtz-0004HZ-JQ; Mon, 22 Mar 2021 01:14:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52853 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCtw-0004au-2d; Mon, 22 Mar 2021 01:14:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jNk2FpKz9sVS; Mon, 22 Mar 2021 16:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390086;
 bh=eS/JsLbTmGk9ISWBsYu8MjaA1gwxAZVST5zZV8h1oVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f+7a8JYn/td9P4TFBnH2NXKRvr73iPnmoMP9zGOe+alTWNXOgQdk9ixyHyem+LVU3
 rAXd3JmvX9OPKuHaVinAC8nzkCRhSI4at8lCRnKogDWjP/ZCn0NyIFyC+8uqvhEZQC
 bKSOoqdXzd9XjupCdUv8DCdHiqmeUVOh/0AIHF2s=
Date: Mon, 22 Mar 2021 15:20:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 12/17] target/ppc: Remove MSR_SA and MSR_AP from hflags
Message-ID: <YFgbJtfP6ZGPrZQy@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-13-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VUDbuE2yZ1FRgTFZ"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-13-richard.henderson@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VUDbuE2yZ1FRgTFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:10PM -0600, Richard Henderson wrote:
> Nothing within the translator -- or anywhere else for that
> matter -- checks MSR_SA or MSR_AP on the 602.  This may be
> a mistake.  However, for the moment, we need not record these
> bits in hflags.
>=20
> This allows us to simplify HFLAGS_VSX computation by moving
> it to overlap with MSR_VSX.

This leans into the requirement that certain hflags and msr bits line
up, which makes me nervous.  Apart from that

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/cpu.h         | 4 +---
>  target/ppc/helper_regs.c | 7 +++----
>  2 files changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 07a4331eec..23ff16c154 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -599,14 +599,12 @@ enum {
>      HFLAGS_DR =3D 4,   /* MSR_DR */
>      HFLAGS_IR =3D 5,   /* MSR_IR */
>      HFLAGS_SPE =3D 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ =
MSR_VR */
> -    HFLAGS_VSX =3D 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ =
MSR_AP */
>      HFLAGS_TM =3D 8,   /* computed from MSR_TM */
>      HFLAGS_BE =3D 9,   /* MSR_BE -- from elsewhere on embedded ppc */
>      HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded ppc */
>      HFLAGS_GTSE =3D 11, /* computed from SPR_LPCR[GTSE] */
>      HFLAGS_FP =3D 13,  /* MSR_FP */
> -    HFLAGS_SA =3D 22,  /* MSR_SA */
> -    HFLAGS_AP =3D 23,  /* MSR_AP */
> +    HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
>      HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
>  };
> =20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 8479789e24..d62921c322 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -95,8 +95,7 @@ void hreg_compute_hflags(CPUPPCState *env)
> =20
>      /* Some bits come straight across from MSR. */
>      msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
> -                (1 << MSR_DR) | (1 << MSR_IR) |
> -                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
> +                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
> =20
>      if (ppc_flags & POWERPC_FLAG_HID0_LE) {
>          /*
> @@ -133,8 +132,8 @@ void hreg_compute_hflags(CPUPPCState *env)
>      if (ppc_flags & POWERPC_FLAG_VRE) {
>          msr_mask |=3D 1 << MSR_VR;
>      }
> -    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
> -        hflags |=3D 1 << HFLAGS_VSX;
> +    if (ppc_flags & POWERPC_FLAG_VSX) {
> +        msr_mask |=3D 1 << MSR_VSX;
>      }
>      if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
>          hflags |=3D 1 << HFLAGS_TM;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VUDbuE2yZ1FRgTFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYGyYACgkQbDjKyiDZ
s5JRhA/+OFtC0yreWBsKeEDJbK3U5lOZ6jzrp9xlDgnBlOPX/P6PG5TIeCDlRXEj
H1ub9aIox7Dxha7MKrDFiy0REqDfdUBSNCe97Ukq7mTuGrmpQmpxA+AUdoIubhNg
EziBc9HsM+o50ggRJ/evw/td0l+csqnQ2/gF9VD9XbLduMnXTe2EjpxCCHAP9ucH
DrNDfHcTi1TydGVoB9TBUbpkUmUCYLgOZdR5p7DD7ibV4SE/MExDcT7B1BRBWg+S
ufZd3Ao8UnNp+JpLo46zDuCcSBkhzOqYxAnWWn892s+9redIlG20aWn+Qq7th75J
sjQuf7dqvDGcyf1IS6NxmuBVCD0d1nnyOiPXbv9Bjb2yd2TJnu5Q9/8QG/+TXNVP
extS/qNo8UrC0yrq/AU9a8HZdCPOKEYVgldccAFcVOk+/RaO4PbcN+8FNo/zsUI/
N5f29cnlpvrEUSKitbmk4DPfQU6oTgz9adtfQEAzCFCFJNHByuws2pc8t3VzkO0b
ktxJAsoY1jVOYZv2t+KLpp4nbaWrlXVYIdioQYMfzPKmrtCj3IPs4/Cqzx1ahMyS
GIUY/qYdr0LSwTvKLUNeR6ITHbeGuli6TxAdZa0ZyC7PkINJGndnHBK8tFs0oLUT
lLd8HIKPW2Z1UAm0lv8qt00sjKtWlCU6HrCqHti+CEkYqyoIpRI=
=gH2I
-----END PGP SIGNATURE-----

--VUDbuE2yZ1FRgTFZ--

