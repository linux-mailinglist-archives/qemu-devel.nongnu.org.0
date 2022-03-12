Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120724D6DBF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 10:26:34 +0100 (CET)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSy1A-0000tR-LF
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 04:26:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nSxvC-0007C7-4b; Sat, 12 Mar 2022 04:20:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:46583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nSxv8-0005a1-W7; Sat, 12 Mar 2022 04:20:21 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KFy1z35pNz4xLT; Sat, 12 Mar 2022 20:20:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647076807;
 bh=d7iAK8zbGmRuTUjOgJkkSUuYq3sGQGfFsVxTDMxkcTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bioZaj8nzhDNwFwDsllDwa5k3phOc+i7fv7YkAnHvxfVpEc3ZekfpRyQRmjuQa7Ts
 LcJxd+nMg7w+ZpNWG92ibQboLh48u2WxWhBUTNaigUNzdSZdlU2XbaWbRoFo9WU/Rj
 tNNndPI08vY0dPehBI/dUa18CiLe5NBR+zctx01I=
Date: Sat, 12 Mar 2022 19:50:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/4] target/ppc: Remove chip type field from POWER9
 DD2.0 PVR
Message-ID: <Yixe8IpDkrtoAuJW@yekko>
References: <20220307065527.156132-1-npiggin@gmail.com>
 <20220307065527.156132-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rFqM1Z/HrNA3wAaz"
Content-Disposition: inline
In-Reply-To: <20220307065527.156132-3-npiggin@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rFqM1Z/HrNA3wAaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 04:55:25PM +1000, Nicholas Piggin wrote:
> The POWER9 DD2.0 PVR does not follow the same format as the other
> POWER9/10 PVRs, it includes a non-zero value in the "chip type" field.

I'm unclear whether you're describing the hardware PVR here, or the
value in qemu.

> This does not cause problems because the pvr check is masks it out and
> matches against the base, but it's a small inconsistency. Zero the
> field.

I assume this is making the qemu model match the hardware, but that's
not entirely clear to me from the commit message.

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/cpu-models.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index 76775a74a9..b42f2ab162 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -349,7 +349,7 @@ enum {
>      CPU_POWERPC_POWER8NVL_v10      =3D 0x004C0100,
>      CPU_POWERPC_POWER9_BASE        =3D 0x004E0000,
>      CPU_POWERPC_POWER9_DD1         =3D 0x004E0100,
> -    CPU_POWERPC_POWER9_DD20        =3D 0x004E1200,
> +    CPU_POWERPC_POWER9_DD20        =3D 0x004E0200,
>      CPU_POWERPC_POWER10_BASE       =3D 0x00800000,
>      CPU_POWERPC_POWER10_DD1        =3D 0x00800100,
>      CPU_POWERPC_POWER10_DD20       =3D 0x00800200,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rFqM1Z/HrNA3wAaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIsXucACgkQgypY4gEw
YSJRkQ/+OPwS+BaQZGQLY0RYgzvCwlH+piPoYLe4O4Yg2YYznEkIqDYxj+8gBxJu
+8VIjm7L+/JOgq0iJe2g0VBXt0cJsU662nBxoD/0FuE5H/Wcv22EpuP3d5E7WnJe
KOfwNUrCeijAj2YWISJtOwETnbqoihZqTm2IFVB5wQF4U2zZaO9HaZLn0GqisJf4
GAPUNSMdBhnpXFHHdTKHKQZd5tW5/r8cOdyz83qxnz5bW956GvQCkQTqbRRARhlh
IZswspslCay34NGoYq4GwBQ7rXpLOVok6dlXoRWqVck87Dp2eKnVEk00Er0kh7d8
Vd7uF8hSk/08UDFWI/rg9+kI6jdGCbSjvjYHdByHrgzxN5i4bo53SNmUkE2GAPDm
XEVaKGtSChoWMJoF/RHSTTsORrv0rYZQR+S9UbM+R6xwJz2ZFk8hVlq2Sguxnekv
1nu2fh4n1WhZzpwMasnjVnjhNtwRjARL5QhdpeYkUQDRCUDnhT/AJEOesQwW0P9I
gYuqdreFBc11GJzPwlCxf1kr7sm+IcinRt/Fp3/meTzVz8T6IjcA39RF+J2b3sWM
c7HSLL2zcZ98pQu8K8mD/ryW5o+bKvzUl68sOCvBRC4iiNG1378CeAVgh3RGYMSk
rmJZMRKADAJvpmp2zYIAig8CG6+y+8r5SHMv2/YHDgJajZqeOY8=
=n1l8
-----END PGP SIGNATURE-----

--rFqM1Z/HrNA3wAaz--

