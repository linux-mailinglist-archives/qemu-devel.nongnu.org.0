Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9784B7FF1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:15:06 +0100 (CET)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCef-0005q4-Ar
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7O-0001DE-BE; Tue, 15 Feb 2022 23:40:42 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:52403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7C-0000Hl-MB; Tue, 15 Feb 2022 23:40:40 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y3314mz4y48; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=jGGeAX1CQmSlBAM7kZh3zCdZAFSfDL+8keel9in4pdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U79N1T5kc47QN4KUZ2BcWvKwqxE+MCA/sxv0FjhnKhTwOEkHTOQaM47qRv2JLcL3T
 wIT28Kfo37Ky06UiGfXlldKeZdXaDFQ9P55oYDo5JATbZS5RYAmRP3orQ24qxO7Gh8
 KM48GS9Pwchy6K1EheB45lpHRJbZ3v7/rvmn8t1k=
Date: Wed, 16 Feb 2022 13:16:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 09/27] target/ppc: cpu_init: Decouple 74xx SPR
 registration from 7xx
Message-ID: <Ygxel7VLY5sunzBY@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-10-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e6g6hu/b7GwafEHl"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-10-farosas@linux.ibm.com>
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


--e6g6hu/b7GwafEHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:30PM -0300, Fabiano Rosas wrote:
> We're considering these two to be from different CPU families, so
> duplicate some code to keep them separate.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 107 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 91 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6a367f2bbc..79cd14d49c 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -803,6 +803,97 @@ static void register_G2_sprs(CPUPPCState *env)
> =20
>  static void register_74xx_sprs(CPUPPCState *env)
>  {
> +    /* Breakpoints */
> +    spr_register_kvm(env, SPR_DABR, "DABR",
> +                     SPR_NOACCESS, SPR_NOACCESS,
> +                     &spr_read_generic, &spr_write_generic,
> +                     KVM_REG_PPC_DABR, 0x00000000);
> +
> +    spr_register(env, SPR_IABR, "IABR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* Cache management */
> +    spr_register(env, SPR_ICTC, "ICTC",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* Performance monitors */
> +    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_PMC1, "PMC1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_PMC2, "PMC2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_PMC3, "PMC3",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_PMC4, "PMC4",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_SIAR, "SIAR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_UPMC1, "UPMC1",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_UPMC2, "UPMC2",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_UPMC3, "UPMC3",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_UPMC4, "UPMC4",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_7XX_USIAR, "USIAR",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +    /* External access control */
> +    spr_register(env, SPR_EAR, "EAR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
>      /* Processor identification */
>      spr_register(env, SPR_PIR, "PIR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -4644,8 +4735,6 @@ static void init_proc_7400(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> =20
> @@ -4718,8 +4807,6 @@ static void init_proc_7410(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> =20
> @@ -4799,8 +4886,6 @@ static void init_proc_7440(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> =20
> @@ -4901,8 +4986,6 @@ static void init_proc_7450(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
> @@ -5025,8 +5108,6 @@ static void init_proc_7445(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* LDSTCR */
> @@ -5156,8 +5237,6 @@ static void init_proc_7455(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
> @@ -5289,8 +5368,6 @@ static void init_proc_7457(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
> @@ -5442,8 +5519,6 @@ static void init_proc_e600(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--e6g6hu/b7GwafEHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXpAACgkQgypY4gEw
YSKBzBAArzlT+Bnc3CvBoMwyK4Cvw/QpZ5GQpzf65uPQQ29OPU9FccdOQaTYTroO
T6ydZoGFMVP1QLTnIhfp7YYy7F+ZMlPBgaxt54TlA0cJCmV4++29fWT1GXlNz3RW
nAcEXFj0rdNnyjMoFIonrijPUSzVAvPIcM03vDZn2PCQHnq4qotGkm8dd1dCRA4b
VtZwIzZJxgVHGx8qbIcaeAAB68rBSi40Ov8485JQnBLtjSV98dPnThGGd+bBhqf+
C9SOvwICnTi54wWuDQD3LnQBb3nqheCMzag037xLJxDXs3BcCWYX1brqptlqus2e
3OikgWPhSW4Ua5/QAx4ibP6sD5slCY+bi4fio+l/lh0mgvG1lZTcfbJhvBoCHAcB
Egbe/83vPRZKYISBngG5c+cVPi6dyejek7pWLZKY9pe0UBO4/1QMPveDZzNZiYCT
xSaJnbGXu1/7oUaygIjQ64TkKlDQC9OsL/0rw3zmNY/Wz1CZt0DVWHsu4saAPNsJ
DnM1zr7n2+u03xnOGqGOfdQ7GziUZUV8WXdHPwmtWTlw85++VegiHmfA4MbZ5Uhw
k7kiDNNowJtJfSmnQreW5yqhDpaSuTdJVCoo4TgH3M2oVbUB6VAr4ArYEAJCuB3z
LLfr7+EYOv3OFzmO5mveuXXRVdjio26SV3UzpRt78W9Od/L+GXs=
=+R2v
-----END PGP SIGNATURE-----

--e6g6hu/b7GwafEHl--

