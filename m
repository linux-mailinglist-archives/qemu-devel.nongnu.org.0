Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A130B4B7FF2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:15:40 +0100 (CET)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCfD-0006bD-IJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:15:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7W-0001HG-VX; Tue, 15 Feb 2022 23:40:58 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7T-0000PP-38; Tue, 15 Feb 2022 23:40:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33mt5z4y4h; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=T+815y6JXZz0gBmmzPJ5eHXv5OMQKB841csvg20PuZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fu/3+8FQds1tdRh2oFDgNaASdxgstYeCseWT57y5jqCexVw76CJE30MpCnnOU0Aea
 67AGOIK1+agZicymyNfHDuwMROhIOOJVm5YDvqFjiNTjixk+cxSxnLv3394hFaC6Hg
 iG6pVQ4PxfAayjSnaYQ+HE/QLCFLd7Rw0SW3b9G4=
Date: Wed, 16 Feb 2022 13:50:14 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 17/27] target/ppc: cpu_init: Move 604e SPR registration
 into a function
Message-ID: <YgxmZjqgzB3wGaY0@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-18-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sYQXuur/XvrD4qsh"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-18-farosas@linux.ibm.com>
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


--sYQXuur/XvrD4qsh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:38PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Now that I've looked at 19/27

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 43 ++++++++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index adda07e56d..baf6be5b0d 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -743,6 +743,29 @@ static void register_604_sprs(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> +static void register_604e_sprs(CPUPPCState *env)
> +{
> +    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
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
> +    /* Hardware implementation registers */
> +    spr_register(env, SPR_HID1, "HID1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +}
> +
>  /* SPR specific to PowerPC 603 implementation */
>  static void register_603_sprs(CPUPPCState *env)
>  {
> @@ -3918,26 +3941,8 @@ static void init_proc_604E(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_604_sprs(env);
> +    register_604e_sprs(env);
> =20
> -    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_7XX_PMC3, "PMC3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_7XX_PMC4, "PMC4",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Hardware implementation registers */
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      init_excp_604(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sYQXuur/XvrD4qsh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMZl8ACgkQgypY4gEw
YSJGqQ//WXyUBlpEAfP8HckLkJJ7N7z3QtfS7PK6PJYbv1XEi49ZW0bkRzf/+BBB
TPzz7Y1VCK7r+XITUAqKNDr/h8YyghDDFzSD6JF67bjwwbdArt/diMXh41yHWr+x
5Um5E2xc5Z4H5A2Kl+qn2XU5G8JWsL5JEL0GMde4YzeZTr01nXn6d1QsNg7TU95V
EMcydTdrhCju2yJLQHhWa54xUeIrDvxIni4LSiYcakSzQn2rmcew1EFvnAdOpVbA
RFbEvK5eGw9bt0cNvYtcNrV3J5wVuaFtA3agGAmD1PbhXJg0MEzOGr1pyjBn9FGD
x2SORYa8dOAKD7n2TSzGvuZbEHteWB2KENNCARxowho4ApjkDTpnugEEfPCSuEmq
aQUo45qNStJLVB0U3Y3SNZtBL2hiDhwo0FRwEcQqfSiFtpVQ9sSQi5iNdUVKP+gp
P7aAaX0fqyZGiUcQagTipQZOpZk/y0STMK4UoNTMByzQN4fptf1BnpfnFnkC1Wz7
ZujkgWABRMjh+bOa39oSiiQB4XTJnHUruySgAykpae/s+Jm73IcS3NshPgUw52sS
SkWflc/mqZsqq86dy4I2VgD6m5EfBdLBRFSXVax+A5us9AibsQMhtIxXNfBYhLk3
F81XSSB5ygfsTEIfT64ESHqMfLSgez6w7pxLvm1ZtRVRFN2gjDw=
=W7sZ
-----END PGP SIGNATURE-----

--sYQXuur/XvrD4qsh--

