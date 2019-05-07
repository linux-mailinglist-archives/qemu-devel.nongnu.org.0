Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFA15D58
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 08:28:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNtai-0004VX-NJ
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 02:28:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hNtVi-0000mZ-Dv
	for qemu-devel@nongnu.org; Tue, 07 May 2019 02:23:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hNtVh-0002e4-Bl
	for qemu-devel@nongnu.org; Tue, 07 May 2019 02:23:30 -0400
Received: from ozlabs.org ([203.11.71.1]:45185)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hNtVg-0002aE-QU; Tue, 07 May 2019 02:23:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 44yqL230kWz9sBp; Tue,  7 May 2019 16:23:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1557210202;
	bh=GehXOXm+CYwKTk9qR9q6LTAJidSherPl1TSzynR+wdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSSTzYYFd86fvXuPkQNJVB5ynlZITaSVa3NI4HFMRqJziEJj9To51/vqQHdMTzsGk
	JuAfIwWoNN6i9v6BQ7JiAHHJoOn/wyT0LeSyDSjOg2rJrsqjVGFEbOV9+rwpbjUUp2
	43Eg7AotXHok/3gPmdr3C38yl5wSVp5x/zjDntL8=
Date: Tue, 7 May 2019 15:21:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Anton Blanchard <anton@ozlabs.org>
Message-ID: <20190507052129.GG7073@umbus.fritz.box>
References: <20190507004811.29968-1-anton@ozlabs.org>
	<20190507004811.29968-3-anton@ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Content-Disposition: inline
In-Reply-To: <20190507004811.29968-3-anton@ozlabs.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH 3/9] target/ppc: Fix xxbrq, xxbrw
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
Cc: ego@linux.vnet.ibm.com, sandipandas1990@gmail.com,
	mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
	qemu-devel@nongnu.org, f4bug@amsat.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 10:48:05AM +1000, Anton Blanchard wrote:
> Fix a typo in xxbrq and xxbrw where we put both results into the lower
> doubleword.
>=20
> Fixes: 8b3b2d75c7c0 ("introduce get_cpu_vsr{l,h}() and set_cpu_vsr{l,h}()=
 helpers for VSR register access")
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>

Applied, thanks.

> ---
>  target/ppc/translate/vsx-impl.inc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
> index d050cc03ed..05b75105be 100644
> --- a/target/ppc/translate/vsx-impl.inc.c
> +++ b/target/ppc/translate/vsx-impl.inc.c
> @@ -1192,7 +1192,7 @@ static void gen_xxbrq(DisasContext *ctx)
>      tcg_gen_bswap64_i64(xtl, xbh);
>      set_cpu_vsrl(xT(ctx->opcode), xtl);
>      tcg_gen_mov_i64(xth, t0);
> -    set_cpu_vsrl(xT(ctx->opcode), xth);
> +    set_cpu_vsrh(xT(ctx->opcode), xth);
> =20
>      tcg_temp_free_i64(t0);
>      tcg_temp_free_i64(xth);
> @@ -1220,7 +1220,7 @@ static void gen_xxbrw(DisasContext *ctx)
>      get_cpu_vsrl(xbl, xB(ctx->opcode));
> =20
>      gen_bswap32x4(xth, xtl, xbh, xbl);
> -    set_cpu_vsrl(xT(ctx->opcode), xth);
> +    set_cpu_vsrh(xT(ctx->opcode), xth);
>      set_cpu_vsrl(xT(ctx->opcode), xtl);
> =20
>      tcg_temp_free_i64(xth);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzRFdkACgkQbDjKyiDZ
s5JAGxAArqVerhh0V3aBwhi/G3QjrEfBDm42xaRxWJEJpAWP+PMIPSYXb4fkDuZM
CSgknjzZpYhGF0MRvfDdaO41uY8317unL/dax1Y0RGfDtdB9QWaoIDBmDx1lbEk6
B33SeyRkB/1tB1LgW7iaxKZmZaP3EGqr5BYMgrkfk56Mn8QAeTJnCCKGkLPraHH+
aDUJ1cYq08RHl4Opfut3bhGi26CaRmht1KXuXAWF95mRez0/KyQwc+jQVAkVdolW
IRzT5Kqmz0hjfMpAwpuX156lPaDW63rawR0Ni1mXBHh1qkhcpHRWb981NUez7pA6
OqJbMszxk2NxEgL/JWIeW8Q/3i2y2IhD7URpqIxKNgWG7cvBMJ3rJHgrnHZOvjTd
6sVFtHpDDo8oGHNU9yD8CvhpGTmRLhCxMjPJgMfV+dX+7PU1Sk0NIzhkaSJd1Jll
n7b7+BmsblRSfPAkEGJvrs7hdkoDc6aGZZ8UeD0HtIA8uFOm6XtwMdigUrG0MQCX
5Wm7/4c6+8fkz7DfCboAl+CCZ3GrrayfmL0Z74fdsciTBlWH2gcdYmnrOcF4O/cO
3Y2HAXJzc8jqXTBwGAVmQlxNzcQAeUDs5eDkdN+pgh18spC7LoxuvgHjLku/UKvT
2rtn8cJx2fEPgRnXYjr2K3p4MS9CNpQtFjzBxqJ1BIhaiAMR7EI=
=mu4J
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--

