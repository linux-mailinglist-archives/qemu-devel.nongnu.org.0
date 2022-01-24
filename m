Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9C49A208
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:23:57 +0100 (CET)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAYt-0000Jb-2F
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nCAT6-0007jg-BU; Mon, 24 Jan 2022 20:17:56 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nCASm-0008FT-Uz; Mon, 24 Jan 2022 20:17:54 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JjTV31TnCz4xmk; Tue, 25 Jan 2022 12:17:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1643073435;
 bh=GcPmjTN++CNOsKTb+reuh1otfl0LJ36dD9rpDdxrxtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XVPsMCXM2tsUkIGsn6LUey1nOgz4meJEng5Nd+1GLZvFdVrM9wK5XrzLIHs1fcRSA
 5y3mlo583locqlX2QgFQsIui0qozArv08IY4FDd8Ot2Rmm8YyNIKvtM6wK+Q9fGDvg
 QMrZsYxYNv5YJ8lyslnDrtsrav7jYWKqkVCNuHtU=
Date: Mon, 24 Jan 2022 20:47:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] target/ppc: Fix test on mmu_model in
 hreg_compute_hflags_value()
Message-ID: <Ye51unqn7kGQTMzE@yekko>
References: <20220124081609.3672341-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hx6N+XfXEr5o1h1B"
Content-Disposition: inline
In-Reply-To: <20220124081609.3672341-1-clg@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Hx6N+XfXEr5o1h1B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 09:16:09AM +0100, C=E9dric le Goater wrote:
> POWERPC_MMU_BOOKE is not a mask and should not be tested with a
> bitwise AND operator.
>=20
> It went unnoticed because it only impacts the 601 CPU implementation
> for which we don't have a known firmware image.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

The longer term fix, of course, is to entirely get rid of the unholy
mix of enum and bitmask that is mmu_model.

> ---
>  target/ppc/helper_regs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 7dca585dddeb..5b12cb03c961 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -156,7 +156,8 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState=
 *env)
>       */
>      unsigned immu_idx, dmmu_idx;
>      dmmu_idx =3D msr & (1 << MSR_PR) ? 0 : 1;
> -    if (env->mmu_model & POWERPC_MMU_BOOKE) {
> +    if (env->mmu_model =3D=3D POWERPC_MMU_BOOKE ||
> +        env->mmu_model =3D=3D POWERPC_MMU_BOOKE206) {
>          dmmu_idx |=3D msr & (1 << MSR_GS) ? 4 : 0;
>          immu_idx =3D dmmu_idx;
>          immu_idx |=3D msr & (1 << MSR_IS) ? 2 : 0;
> @@ -237,7 +238,8 @@ int hreg_store_msr(CPUPPCState *env, target_ulong val=
ue, int alter_hv)
>          ((value >> MSR_DR) & 1) !=3D msr_dr) {
>          cpu_interrupt_exittb(cs);
>      }
> -    if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
> +    if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE ||
> +         env->mmu_model =3D=3D POWERPC_MMU_BOOKE206) &&
>          ((value >> MSR_GS) & 1) !=3D msr_gs) {
>          cpu_interrupt_exittb(cs);
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Hx6N+XfXEr5o1h1B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHudY4ACgkQgypY4gEw
YSI6qQ//Tpavp+UVLJ080c6wuuYElslb1pytEPEpY4lKSJgv+pSFpWClGiG3GJNW
iDul/MY+UKkjQ6EPED3w+ZI97EvaZZJ6QozF8KRMOseh6c9EanW0o178zuDxGqxk
UzQOReDWVWX3bcj/RK/sZJf1cJazLMHXA7ZeIRJ6W51Z6DR9sRRZ20cz1RHqg3+X
Vqqvupep1k0Xx204YRsLQSUsoYlny29TUtlA41ttY3Hjw5I872dALeUZOUPR9upD
/VYHFDl+6cku6Grp1/lzR3C/4LC2Bkg5O1YzOa2iv8R2k6zpuGX9dbCcWmX34CGn
YfUvEC41/OQk5uHqgy271ddV7uFZ45bG6suWTNtio9e4di3GsJ8Mjy+3ddbIP5hg
+s6jaIpINj40lAcqNbshbdwyt/3rYmFGdKQHO9CNiFdFCPsR7HbI831kbXxju0Mt
h9bPfYekDMIgycDpuVgsNbkMy/b8O9OhWtp2/BPJTUPmYbCDVrMPzXkY2UWJ6LQT
/RduwTq0jhCmq2xtiTfLNduyX7oXe9vb9K7vTtf5sEGR/9W5R6mVheD7EmhTcMv2
8iH6+mU9Cv65gCXiFsuc9KDpwxYAPbfd8FOGjnJTfEfUXUIYrFmdzk7hDupABAOV
wAGClMVOIQZHXQ9NLCsUSPbtSAv48rz4ioX1WxqzMmZdALT5/QQ=
=B/1/
-----END PGP SIGNATURE-----

--Hx6N+XfXEr5o1h1B--

