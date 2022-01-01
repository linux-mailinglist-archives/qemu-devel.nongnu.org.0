Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090E482714
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jan 2022 09:32:49 +0100 (CET)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Zol-00017x-8t
	for lists+qemu-devel@lfdr.de; Sat, 01 Jan 2022 03:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n3Zlc-00009p-Oa; Sat, 01 Jan 2022 03:29:32 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=46913
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n3ZlZ-0005hr-13; Sat, 01 Jan 2022 03:29:32 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JQwCg3B1Qz4xn7; Sat,  1 Jan 2022 19:29:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641025759;
 bh=I1AR7QLV+hRbAqIIWPmr5IcFuK7EKCEs1D015tyXVvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hyOZkZ+5RZtZt9cCWAWBOrbZUW2BCXwsHPQFryalw/7EAhVUA4rQ95J4acHmjDMX+
 pPP9+3KDZ2OQnq4rRx5PV2IysA5SoVBSCebOeQgrvrvWUFOf7vzzTJec+1wAzizZux
 dm6vgr1oEAEjgWg2ATEbR2HOd1SiaVtdkzXlNSAY=
Date: Sat, 1 Jan 2022 19:29:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 2/5] target/ppc: powerpc_excp: Add excp_vectors bounds
 check
Message-ID: <YdAQ1DuxfAV8mcY2@yekko>
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
 <20211229165751.3774248-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9MJDWNZ6Ogs9fFhE"
Content-Disposition: inline
In-Reply-To: <20211229165751.3774248-3-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9MJDWNZ6Ogs9fFhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2021 at 01:57:48PM -0300, Fabiano Rosas wrote:
> The next patch will start accessing the excp_vectors array earlier in
> the function, so add a bounds check as first thing here.
>=20
> This converts the empty return on POWERPC_EXCP_NONE to an error. This
> exception number never reaches this function and if it does it
> probably means something else went wrong up the line.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8b9c6bc5a8..9a03e4b896 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -300,6 +300,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>      target_ulong msr, new_msr, vector;
>      int srr0, srr1, lev =3D -1;
> =20
> +    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
> +        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> +    }
> +
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                    " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
> =20
> @@ -353,9 +357,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>  #endif
> =20
>      switch (excp) {
> -    case POWERPC_EXCP_NONE:
> -        /* Should never happen */
> -        return;
>      case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
>          switch (excp_model) {
>          case POWERPC_EXCP_40x:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9MJDWNZ6Ogs9fFhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHQENIACgkQbDjKyiDZ
s5KDjRAAq+X13TlbWuR5PJ5IV5/ND4AetFQQDrLRTv00gIt/ChPUeG4V/qz6c279
4VaUpGTRJAOTm0TnTBAYRnSoRCXRsrgsq8IMKx5qc5Yuj/JC+U7TJ419BIYKUqIT
W71QwqE1WsGcfRdmuCwhlg0MVBmyfVVI02KT7mKJBRhbxIuEpam8yepRnKufPNio
Hn34Zi14f5h8sZihcei1WRrimQFIcxR0dBatPWvJEE1VGbRom5zU95rwJgeiYfmb
ST0UGXBo67AwKKT5KKLOf4TT+9+KFH9KMp9Smavzw13vM5JUAOdH3Lc7rUYh7T5i
SWdZFSpnTPMFfHMBj5eDIOPBmsi6cS+UsDtkxEteXNvaaWx0lDzeVgXvaWCyMtf9
2iOT2y0a1ZRynP5o5WkBnBd/K9mXV3aytFdehVnnO0HJku8HDWLYhCLJWF1fAhGQ
OyU6/+zeV6XV6cts3HwRNBBuhlvBOlj2OKmHQTSRKj+jD1QO7mCx10QZvD2fGR8L
U8Kue6Fee6xN4XVevk9H7CikYD3hnVk3lOqmbMzOhesOglryr/HDFMf2HxtY32ab
PTM+cvCBBdcM5ddlSe6DcpQ02NR1fLew5XqUvpwK9crj0dfrPFhn0Xkp1yRwxh9S
W4nby16+yWflFSsP6XwumoN9Xpquytk/e0K5FQkwkKbKFUJ6nZA=
=qyJH
-----END PGP SIGNATURE-----

--9MJDWNZ6Ogs9fFhE--

