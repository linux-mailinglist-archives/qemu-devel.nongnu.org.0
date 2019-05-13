Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132971AECC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 04:14:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ0U7-0006bg-UO
	for lists+qemu-devel@lfdr.de; Sun, 12 May 2019 22:14:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hQ0T1-0006I3-9w
	for qemu-devel@nongnu.org; Sun, 12 May 2019 22:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hQ0Sz-0003t4-Ed
	for qemu-devel@nongnu.org; Sun, 12 May 2019 22:13:27 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34719 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1hQ0Sv-0003gn-Fd
	for qemu-devel@nongnu.org; Sun, 12 May 2019 22:13:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 452PVT4KYNz9s9N; Mon, 13 May 2019 12:13:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1557713585;
	bh=p9Etlr2Tg5KE7bUWypOKNsG9J9nt2s1EV+3Bb9y+K/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KGIxTD6uzZ66Zl9ehmhO4MYmndFzYHlZCVHQmA/OO7Wr+v/mjrY3PmYQp5/8fF8K3
	55IT1zr7g7dyDaFf1pTbHbTPKvBoWQkygvg3CPTK46eGEWqI5ZlGsBza0FRTcomcoS
	7WfIJYR9EhRhHORGTScNKhdAX8eUVbJu5I/JNP60=
Date: Mon, 13 May 2019 11:38:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190513013844.GA12044@umbus.fritz.box>
References: <20190510173049.28171-1-richard.henderson@linaro.org>
	<20190510173049.28171-25-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20190510173049.28171-25-richard.henderson@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH v6 24/25] target/ppc: Use gen_io_start/end
 around DARN
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2019 at 10:30:48AM -0700, Richard Henderson wrote:
> Generating a random number counts as I/O, as it cannot be
> replayed and produce the same results.
>=20
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/translate.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 8d08625c33..76628df6dd 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1847,13 +1847,22 @@ static void gen_darn(DisasContext *ctx)
>  {
>      int l =3D L(ctx->opcode);
> =20
> -    if (l =3D=3D 0) {
> -        gen_helper_darn32(cpu_gpr[rD(ctx->opcode)]);
> -    } else if (l <=3D 2) {
> -        /* Return 64-bit random for both CRN and RRN */
> -        gen_helper_darn64(cpu_gpr[rD(ctx->opcode)]);
> -    } else {
> +    if (l > 2) {
>          tcg_gen_movi_i64(cpu_gpr[rD(ctx->opcode)], -1);
> +    } else {
> +        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +        }
> +        if (l =3D=3D 0) {
> +            gen_helper_darn32(cpu_gpr[rD(ctx->opcode)]);
> +        } else {
> +            /* Return 64-bit random for both CRN and RRN */
> +            gen_helper_darn64(cpu_gpr[rD(ctx->opcode)]);
> +        }
> +        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_end();
> +            gen_stop_exception(ctx);
> +        }
>      }
>  }
>  #endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzYyqEACgkQbDjKyiDZ
s5KZxg//YyykaEUUIjPGnYHtjNrah8LjVL9R88ERabka/AeMAocV8Yb2WbAk6ATB
59QR4R3Pslij42islVkHq5yetqGHi3zQfh+8LMZAto//cQkZTOWlq6q/gVUuG0zt
IBTy8+Tfy4zdP+kyZKvuTytVL+SZJz18bTLDJdZwGg578RAXjFU6/JSnc2HnVWJu
80enlyd0j3YlPUdpfDRn041QiUj9IAuZ+cDpC3CbcweSUx+8uBOAWG+7HcR07hRz
LkyRJJgjmYDlExkH51KXOFPB5KbkI09//TbynDV/gcJW7KZtFT3pilbwu0LX2/F4
8kfhcYTiD0a2Uh0CILU6fxWlKG2G/EQDlj7DJg1WmCRt04g6QUZkXORMdWKoA4mR
CuFmRAbvPM/NWucqqb077fEEEFHe+M4uL+/IJ1ObhTyZ3XMff2U52/o+DXbxOheY
/DmQiMCF2YgJUaBhwAfzQbu6SaJlQ5HJe53pxr+t4yJbOmmLcHUxvu2XmXTWpsTf
FQvvt7xja8zAEZjFUXYeMJ3rpkkilqXcfj4kjAYEA5eahbg2EBw8qbUuLysBuriN
2xaY/6c8/JObkym5l7ivkgJ3oBFSVSfhJv5zU30rB70TTYR3ZETJHv98K4e/JgzT
AH7Zwnggv32XBq8IAUpBeriQhlkb8GPhQGH+E9TcHAwnPC8VGRI=
=LhcQ
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

