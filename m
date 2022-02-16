Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B34B7FB8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:52:06 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCIP-0000e8-EH
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:52:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7V-0001HC-6z; Tue, 15 Feb 2022 23:40:58 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:52733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7O-0000JI-B2; Tue, 15 Feb 2022 23:40:48 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33WXcz4y4Z; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=o6A/f1b/lJpX4eo3yPR778x2YYsFzOpZVEuJSfKt9Qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G7oiA+qdtpe1Qk0/mt+Mch3inTZCutyg4VTZE7H81VjhWvgw8jXHCGeqCmd7MfZe3
 Tq+Dz6WP5P6tmw4HWc4vq85VA36s9OwV0i2itrNltXPmevjzk3llufm6w1lBzCQjrV
 xhixWXP5bRRfY86ehSYaSToapyL6uT+z1m3rAKdg=
Date: Wed, 16 Feb 2022 13:23:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 13/27] target/ppc: cpu_init: Deduplicate 7xx SPR
 registration
Message-ID: <YgxgDa8EzzatXjG4@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-14-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kT1DARsW5eGIPMHc"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-14-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kT1DARsW5eGIPMHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:34PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

One nit: this doesn't cover 745 and 755, since they're handled by the
next patch - a note of that would have been useful.

That said, it only stands out because in general this series has been
delightfully easy to review.

> ---
>  target/ppc/cpu_init.c | 68 +++++++------------------------------------
>  1 file changed, 11 insertions(+), 57 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index c54f10cb48..2fd6bf21ca 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -580,6 +580,17 @@ static void register_7xx_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> +
> +    /* Hardware implementation registers */
> +    spr_register(env, SPR_HID0, "HID0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_HID1, "HID1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
>  }
> =20
>  #ifdef TARGET_PPC64
> @@ -3946,16 +3957,7 @@ static void init_proc_740(CPUPPCState *env)
>      register_7xx_sprs(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
> -    /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      init_excp_7x0(env);
> @@ -4016,16 +4018,7 @@ static void init_proc_750(CPUPPCState *env)
>                   0x00000000);
>      /* Thermal management */
>      register_thrm_sprs(env);
> -    /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      /*
> @@ -4125,16 +4118,6 @@ static void init_proc_750cl(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
>      spr_register(env, SPR_750CL_HID2, "HID2",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
> @@ -4290,16 +4273,7 @@ static void init_proc_750cx(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> -    /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      /* PowerPC 750cx has 8 DBATs and 8 IBATs */
> @@ -4368,16 +4342,6 @@ static void init_proc_750fx(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
>      spr_register(env, SPR_750FX_HID2, "HID2",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
> @@ -4450,16 +4414,6 @@ static void init_proc_750gx(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
>      spr_register(env, SPR_750FX_HID2, "HID2",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kT1DARsW5eGIPMHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMYAYACgkQgypY4gEw
YSL9QA/+KTiPyd/ad+cfTi0w+eiWnar/TpngKnX3jjljsK3H1jfC8qGLc9XQAxzn
/2gbqRg5lxPIvtHYw8A6Z6m+68ALYHrZ1i5FmLWyaIDlv+IQfSWJo2fF0+6l3x2b
dgLzRL3QJWOrKLqK5kmm/e5+h+F+Q82t2DNHmQ3YUPkRLID4QzQpXj5/v5pkufeZ
gmdyjOUXMRP7uQ+E+dmR8BiNmQqskiagtWw+/FSaeKPfyy0D0wVr640iMhOh4Iz+
JBtSfu2fgPiiqNoh7AiarFFHOrs+0/fg+D2iRhvDKUJq1YODSfIGeAXEfmKtPRFl
loo7VC8/Fix6SpExVMFZmIGo5C89TG+F/6mKLsc3cNolGjiHfQT/SJsOt7rPnkGd
GitwWSa9AWVG+JnryeW61enKqta37CbUWT+IwAa4FVsvU8d0TwyHPWgTKTaMOs3W
R9ST1JjSagFlhhRVRLbDjZWIqDF2qz7rMty9Z51x+XkV3S2dRjMUtgRIXBRJ6vHl
/+qAKXfW9ukfhU4XzJimO64lvPb1ff0she8yyBsNbSNr3E/g0YCbKxwyG1vuh1xW
1AF+kqgs82X8z/mBGgfUOzH2eNjInpMhhjqCzieV2KXQnuFGZXOQbV4vFtQiYLcb
uU67P99w9S1H7TgXgdDDYIq3jQNeV75K83kwGfpnJv3pp9cDKnA=
=E+5I
-----END PGP SIGNATURE-----

--kT1DARsW5eGIPMHc--

