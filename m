Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8C4B7FAE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:48:39 +0100 (CET)
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCF2-0005K7-VL
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:48:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC76-0000xt-Vy; Tue, 15 Feb 2022 23:40:27 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:42463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC73-00009r-Fc; Tue, 15 Feb 2022 23:40:23 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y32d6bz4y45; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=6bK2CqwAdDRuFKH7dxs8PQvndYQpiCYIPzLsJ2HhnCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bzax9d5UNNQ7AtjVaGMpGCTf4lwF5p3msIG+G+iy+HB7plfw2+bfnYdSAP8JqxrdY
 dFKVwkwxIl4aFXnhG5tvg5T88I56CjREPrb7BvNYjeybP7kUOu43mbwLZuqysU7Fbt
 tB1y1gtU7DOg/ROJC546IB0XaOo7C2Hbi7gTy3g4=
Date: Wed, 16 Feb 2022 13:12:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 05/27] target/ppc: cpu_init: Avoid nested SPR register
 functions
Message-ID: <YgxdfToSNXwr8t2d@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-6-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QgdF4h+TwaONe6GW"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-6-farosas@linux.ibm.com>
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


--QgdF4h+TwaONe6GW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:26PM -0300, Fabiano Rosas wrote:
> Make sure that every register_*_sprs function only has calls to
> spr_register* to register individual SPRs. Do not allow nesting. This
> makes the code easier to follow and a look at init_proc_* should
> suffice to know what SPRs a CPU has.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index b7e460e12d..1eef006a04 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1128,8 +1128,6 @@ static void register_BookE206_sprs(CPUPPCState *env=
, uint32_t mas_mask,
>          break;
>      }
>  #endif
> -
> -    register_usprgh_sprs(env);
>  }
> =20
>  /* SPR specific to PowerPC 440 implementation */
> @@ -1427,7 +1425,6 @@ static void register_405_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   spr_read_generic, &spr_write_generic,
>                   0x00000000);
> -    register_usprgh_sprs(env);
>  }
> =20
> =20
> @@ -2322,6 +2319,7 @@ static void init_proc_405(CPUPPCState *env)
>  {
>      register_40x_sprs(env);
>      register_405_sprs(env);
> +    register_usprgh_sprs(env);
>      /* Bus access control */
>      /* not emulated, as QEMU never does speculative access */
>      spr_register(env, SPR_40x_SGR, "SGR",
> @@ -2951,6 +2949,7 @@ static void init_proc_e200(CPUPPCState *env)
>                   0x00000000);
>      /* Memory management */
>      register_BookE206_sprs(env, 0x0000005D, NULL, 0);
> +    register_usprgh_sprs(env);
> =20
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3298,6 +3297,7 @@ static void init_proc_e500(CPUPPCState *env, int ve=
rsion)
>                    env->spr[SPR_PVR]);
>      }
>      register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
> +    register_usprgh_sprs(env);
> =20
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QgdF4h+TwaONe6GW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXXYACgkQgypY4gEw
YSKLxA//fr4ANNqrcQmZWm239TNNReYrfRpVa0dZUl7iAo2tib/l4SU6b37NNoIg
ZxFKiGo0wLZEYs5+ruv2B2of15UCQSGF+Dx577q4PQsfFwY9b+9IG5qHmaeMxfvQ
UyEqOTpZoptlInOOk41mbIkMT9iK7g9xC/nlKUtDYG+xOp4EE9Zhba6F4Keq202n
JNtqdNnFLu9W3/6XrA1cRvgxhJDIj45SxTcl6tw8dUEEJphhwpT0BfK9DaeYxTbw
MCy4nmPBXziTIlOKlruFz6kAcyohz9rRNGuCvHAFRZND13SlShFUN4ebQTbTmGWw
Zb4J195SguhT83zmKESG3pxm1FtKxm24Qxo3OoziZh2F0VvzrnndO9ysX4VBbaGE
EFQjvdZp4lPiTl/ceC56eSjY4k5TcKrjsQLtLrmL3p1GmUh9tK31Sf87ogkGYV2E
scEXTigGGe65o49KX2XoY+rt+nJ6NgK/AZQDHrj2WDBNdPR7EpPkP40TPjIey2I1
7brdOVy4JAmBQJUM4vR8q73mS75iXHXgXMLBk811kvJydK5cipvo/xC/aB88mXrH
exZRpJFSGEjCDZoTPsMISe3J2wMKnR1SiOraQKZbvbzopZTWXVHRcfvgjv7Fpjk0
xON7QBS58yJ6kyqyp3fha4kX+rMbdMMC9z93uGHwGq6qOAYuATs=
=Gp9M
-----END PGP SIGNATURE-----

--QgdF4h+TwaONe6GW--

