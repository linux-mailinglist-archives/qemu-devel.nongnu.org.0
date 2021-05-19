Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5FD388548
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:32:18 +0200 (CEST)
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljCwT-0001Gt-Ui
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuJ-0006xi-Q9; Tue, 18 May 2021 23:30:03 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuH-0006i6-OV; Tue, 18 May 2021 23:30:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlJK16mklz9sXF; Wed, 19 May 2021 13:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621394997;
 bh=2PjEmzz95oIt06mJH93gQWxWyg3bWojrbUaRbPH5+C0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JT/VL+C159XtGMk72y21UatJbddBKti9xgWbX47ikexicrUYxrIM7tUmbmMSEtwEa
 GgI4Gd7KuoekbTSVoEI/2ilZ+LfQ/pWYy/+UhGHYH3AW67ZicKmJcoio8djxoPBPeN
 VLM7wG4q/dDRqKVps8SyfAPFwx3304FBogVa9MmM=
Date: Wed, 19 May 2021 11:54:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 1/7] target/ppc: fix ppc_store_sdr1 for user-only
 compilation
Message-ID: <YKRv1lUvFANBeTIz@yekko>
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
 <20210518150515.57983-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PA07fQhG1XaV9rrC"
Content-Disposition: inline
In-Reply-To: <20210518150515.57983-2-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PA07fQhG1XaV9rrC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 12:05:09PM -0300, Bruno Larsen (billionai) wrote:
> When the function was moved to cpu.c, it should have been wrapped with
>  #if !defined(CONFIG_USER_ONLY), otherwise linux-user builds don't work.

I already corrected this in my tree, folding it into the original
change to avoid breaking bisect.

> The cleanup suggested by Richard Henderson has also been applied,
> changing error_report(...) to qemu_log_mask(LOG_GUEST_ERROR, ...) in
> that function.

That's a reasonable change, but doesn't belong with the compile fix.
Please rebase and update the commit message.

>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/cpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 0ab7ac1af1..82e276349a 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -65,6 +65,7 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>      return env->vscr | (sat << VSCR_SAT);
>  }
> =20
> +#if !defined(CONFIG_USER_ONLY)
>  void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
> @@ -76,13 +77,13 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong va=
lue)
>          target_ulong htabsize =3D value & SDR_64_HTABSIZE;
> =20
>          if (value & ~sdr_mask) {
> -            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
> -                         value & ~sdr_mask);
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
> +                     " set in SDR1", value & ~sdr_mask);
>              value &=3D sdr_mask;
>          }
>          if (htabsize > 28) {
> -            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in =
SDR1",
> -                         htabsize);
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_=
FMT_lx
> +                     " stored in SDR1", htabsize);
>              return;
>          }
>      }
> @@ -90,3 +91,4 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong valu=
e)
>      /* FIXME: Should check for valid HTABMASK values in 32-bit case */
>      env->spr[SPR_SDR1] =3D value;
>  }
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PA07fQhG1XaV9rrC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCkb9QACgkQbDjKyiDZ
s5LS5A/5ARvujReKzFDtNS/n3mWJNyva0rxTtfwJB6LQFqq0DysOHzHmlAILJfJB
++sJKTA+TC3jas50t2GBgXk+yWH2PIyTM9378M60N7aYK7cqibvJWYYN3coIyB+6
WHWd9k+7tPiIQPRqR+bQfmlTgimD8JcF6SxQIgrjeuts0b21UntCqNUt4ys7leck
PFpl8LnIAT5w3oHViqvNKClU7qcRYZYhsfs1QVUXyEV1MMY26Er0kY+ud6a5rM4o
I5rlTwhJFucmfpYQEyovyI7ul3Hlzm/JkjLEm5e5qDrpNhKW21ZeJEQ65Vw+CybY
adG+jy4L3YZXw0HyaFB4Azlidem+/8T9OvGrdXIDu8Jicbl3U28a9cpOcQjyqgqV
HoI8lm5/kTy/ePjn1dSLVtUK0fsREA+8hg20ltudYe3o2JwehnLh9g0L1YTgck0Z
GIU8Sxjf8NqRxQc3jpprBOliliEA83Qy5pX27YNQOAXn2b5yfw4YqogkYrzvThNc
TGAC+Cm/8cBXlIWDmjDE7VKaFbh0lIch5z80ZhmaJP392Y911euG3MXM0j3DtCHD
Qz3Q06kvNU0/UsH+BcWJr+oYhENlZ7+xk8aSe+LPWbxxYb+PKRxXusEz8xL8ESt3
D/oSTeXPJWcGTFgcc+SGCfEmww89ZNjZRi+1tUF/s6VRKgHuSvw=
=Q7Vz
-----END PGP SIGNATURE-----

--PA07fQhG1XaV9rrC--

