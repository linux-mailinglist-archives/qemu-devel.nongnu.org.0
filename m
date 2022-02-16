Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0948C4B802D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:25:25 +0100 (CET)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCod-0003GO-Oh
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:25:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7V-0001HD-7w; Tue, 15 Feb 2022 23:40:58 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:55547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7O-0000Jv-AS; Tue, 15 Feb 2022 23:40:48 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33cLHz4y4V; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=2A5Oo4WCIGb4Q+whaPW2RYyo8z24mSASkc92AvcQGFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hyAUb03Z/6EKQRKPKHmmTEZemUkowtRN3eCYFTtOyXKWUdusb6YVEhP/e18bw0mkf
 628yV7ZVXMpZbnnOLqI+OAIvYDPAqWu+EUh2TSBkxy3tMP4QCIzEeViDPTJU3gN6d3
 Y1sHEtprkLszmC6GtW8wqvBdUKMsHRoEhM332rnY=
Date: Wed, 16 Feb 2022 13:24:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 15/27] target/ppc: cpu_init: Move 755 L2 cache SPRs into
 a function
Message-ID: <Ygxgd1e5+BnU/1mH@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-16-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tiRxSd9BVuWLDGI9"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-16-farosas@linux.ibm.com>
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


--tiRxSd9BVuWLDGI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:36PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

There's only one caller of the new function, and no commit message, so
the rationale for splitting these out isn't obvious.

> ---
>  target/ppc/cpu_init.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 03aa543814..ddd27c21ae 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -503,6 +503,20 @@ static void register_755_sprs(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> +static void register_755_L2_cache_sprs(CPUPPCState *env)
> +{
> +    /* L2 cache control */
> +    spr_register(env, SPR_L2CR, "L2CR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, spr_access_nop,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_L2PMCR, "L2PMCR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +}
> +
>  /* SPR common to all 7xx PowerPC implementations */
>  static void register_7xx_sprs(CPUPPCState *env)
>  {
> @@ -4549,16 +4563,8 @@ static void init_proc_755(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
>      register_755_sprs(env);
> -    /* L2 cache control */
> -    spr_register(env, SPR_L2CR, "L2CR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, spr_access_nop,
> -                 0x00000000);
> +    register_755_L2_cache_sprs(env);
> =20
> -    spr_register(env, SPR_L2PMCR, "L2PMCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Thermal management */
>      register_thrm_sprs(env);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tiRxSd9BVuWLDGI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMYHAACgkQgypY4gEw
YSLCuA//do0j3VJZcPHj4GXCkrcK3fAqYAA07Ln7koCGIfZ9aggRUFk/EDcFFj9c
lKuqRcMf4QRMN2sVC1JgWeSPAbmXk6hehJ1MnUcVVbxE17uW+2jFSUzsIgEfK7Uv
AC+nls5yUPeiSqSOawcFXbYQQOWHiyytzzI8xbF8yDHz2mcDJbZuzofvb3UHrH4M
y6qqWBLtaddesCqZ4bDza58HVv7p5ZSX56X7xAh9Uc30FfccOwJNLIHi4cKJoA5S
Ylwpz02bbBycgyEX1mrsa2nwZuVBkx8UUg7pzWmXn4kcxw3GpEXfMOKSecfWrsKW
Fd9jMKoEny2biqwtQCB4/aBuHsYZakhlt6fvkvc2fZip6mRDKFODAWc4/dYt5y6T
LvOitE+m90bjTmmhjMVMMuNmZA9OOXysC9lbuGixjB4PWXloiU0Pr5hOdNlbdDpq
wOgYlL+Y3ILUxYK6WMCBczeHhOnvm6w5AS2JwzvONyJ0b94+sjnf/HSi2l1dMtv6
LjopG0jE1LQZEVCzag0BUGiqnJv9XtWFNtCttUFlDm390MKfzGS3ywbbQ8z2F1jd
DcNcQL/cY2wqQcpyvpOMhzoxhKau0AoatKd1TFeTUiQQ0KVuIbw51e4pyRAPe01O
N0zqWJWnkvceLy9afZ6pImdf47rh682j4pGInpCdI8SrCPGeR+A=
=vzg/
-----END PGP SIGNATURE-----

--tiRxSd9BVuWLDGI9--

