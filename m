Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697AB45D375
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 04:10:13 +0100 (CET)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq59I-0000ub-GE
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 22:10:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mq56i-0007dH-KG; Wed, 24 Nov 2021 22:07:32 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mq56f-0003ZH-BQ; Wed, 24 Nov 2021 22:07:32 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J02qD6Ydvz4xZ0; Thu, 25 Nov 2021 14:07:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637809640;
 bh=0Hhxend+bA72FQL3YbUvoah73Z6fp/4ublhVkJTfsl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CqEbObYwFockF1EXDGfYLFr3NYnKC55C78awjgbeXLFLa/Vutz2MqlPRqbypoYG7B
 So2/BcDNibBS8UUTl/fXl8lnoaKWHcbyM6w8tfkfBU9kE7B+YnAU+Z6nwHizBrTynC
 Q0VL+3ia1scTJrPFSe1O2gYFXDs1H8+pO8QGnYk0=
Date: Thu, 25 Nov 2021 14:03:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH] target/ppc: fix Hash64 MMU update of PTE bit R
Message-ID: <YZ79HJy3rkyyJfgM@yekko>
References: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1oirXlTKpiW/k36B"
Content-Disposition: inline
In-Reply-To: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: groug@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1oirXlTKpiW/k36B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 09:00:46AM -0300, Leandro Lupori wrote:
> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
> offset, causing the first byte of the adjacent PTE to be corrupted.
> This caused a panic when booting FreeBSD, using the Hash MMU.
>=20
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

Ouch, that's an embarrassing error :/.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/mmu-hash64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46..f165ac691a 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_=
idx, uint64_t dar, uint64_t
> =20
>  static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>  {
> -    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + 16;
> +    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + 14;
> =20
>      if (cpu->vhyp) {
>          PPCVirtualHypervisorClass *vhc =3D

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1oirXlTKpiW/k36B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGe/RwACgkQbDjKyiDZ
s5IBJBAA5a2xLelW9AI3IRHgk6SYjDLWgCM+bmPcLyOOil/jKb7YhDaBqaRB2hgb
Bzk9P6EjFaPVnqLDrRIBBy77S/g7WmbwtGWzhsqB8UrNuy/5lem/wVXsEURR91CK
DhJPquNakgFiZmE4i696ILkhNCV9qctLEsnWsLKEPcYqFIBITdirH66ege+R+y4J
YMrP2mb8MjBYbxEvi/u1SCNTHlHWWTxWDtAjwFncTqGrSrvmuQ8XgJ+PiBOfo6lr
tu3B3SovX6mKuB0kRA0gWyjIKLH1FIHjAyxLcBcgCMibG+6Omv7ih1P8psynOxD4
tZUsDamnc9O3Ap5W9dg4Nx6Eun5Y0g5yDj6e9/CJhiN7IQGZqYSh4/bQE3qhFln6
fXZLK/zyuYJ+R2EboKKzAm27vOB+wF25IKwTpKLJM5t6nRhINqrB/ojkBK3RcKnb
5Nk5fBZtHRlNSQu91/kMfi0fGIITUN2HDuSNRep3AS1gXyLLX9sxkeA3ydhDudnP
zJVb8ywqcHdO+mXhgttX5ZoWJstH6JMQKjhj14xNs1f8FTJmA2ftIe/BCaV5VgPz
GQpwlhHTwnEvNOV5tg9ZUtkVVftJuOWIk3y8or6tfcYYga1C3VyFsSO7JtwAQiyY
4AGVLVOZ9BUITU71viiNxA+dUyNA1IJe2lRHFpbSd3V/Yml8RFA=
=8Gki
-----END PGP SIGNATURE-----

--1oirXlTKpiW/k36B--

