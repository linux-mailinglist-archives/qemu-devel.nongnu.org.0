Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC44C386F90
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:46:41 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liooi-0002nt-U4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeU-00079R-9l; Mon, 17 May 2021 21:36:06 -0400
Received: from ozlabs.org ([203.11.71.1]:48533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeS-0007HH-Es; Mon, 17 May 2021 21:36:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqk3KJ4z9t1C; Tue, 18 May 2021 11:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301746;
 bh=+7Yx1kDON7KAv1hcClcDhsAEJKjpJPs/IkDr0OzA0So=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CD/z1Iu4FBy2l7Q7LcU8N/dBulEX8qGkzPSnXRjP7krJhtp9X/VYYapyfX9koEhS9
 RRu8fDXp7o/wz3jgc92WcLwINAe0GEIsiInIZFVU47zvjnTdJ3T31Fuc00gh9T27Nz
 wYm2rEZsKInyhVt4nweVeLEpPbrXlx4tuBchj5/o=
Date: Tue, 18 May 2021 11:34:57 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Paul A. Clarke" <pc@us.ibm.com>
Subject: Re: [PATCH] Fix `lxvdsx` (issue #212)
Message-ID: <YKMZwVmfec0IocfV@yekko>
References: <20210517214032.156187-1-pc@us.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y1o3etWOWlVi+UR4"
Content-Disposition: inline
In-Reply-To: <20210517214032.156187-1-pc@us.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--y1o3etWOWlVi+UR4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Mon, May 17, 2021 at 04:40:32PM -0500, Paul A. Clarke wrote:
> `lxvdsx` is byte-swapping the data it loads, which it should not
> do.  Fix it.
>=20
> Fixes #212.
>=20
> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
> Signed-off-by:  Paul A. Clarke <pc@us.ibm.com
                           nit, missing '>' ...^

I'm having a hard time convincing myself this is correct in all cases.
Have you tested it with all combinations of BE/LE host and BE/LE guest
code?

The description in the ISA is pretty inscrutable, since it's in terms
of the confusing numbering if different element types in BE vs LE
mode.

It looks to me like before bcb0b7b1a1c0 this originally resolved to
MO_Q modified by ctx->default_tcg_memop_mask, which appears to depend
on the current guest endian mode.  That's pretty hard to trace through
the various layers of macros, but for reference, before bcb0b7b1a1c0
this used gen_qemu_ld64_i64(), which appears to be constructed by the
line GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_Q)) in translate.c.

Richard or Giuseppe, care to weigh in?

> ---
>  target/ppc/translate/vsx-impl.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
> index b817d31260bb..46f97c029ca8 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
> =20
>      data =3D tcg_temp_new_i64();
> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
>      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16,=
 data);
> =20
>      tcg_temp_free(EA);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--y1o3etWOWlVi+UR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjGb8ACgkQbDjKyiDZ
s5KuVQ//ff/qckXY+L/zoX9ZtcjwP2MLK7VSY/wX/FVhUtKDhCuNlvmExNzArAVR
1rxvmIypogyrHu5OZF3+1cLlvQlEf7JVJZvdrhvNys5Gy/Cw5qShtpf6tWwzjsmN
j4g+wb2vDMYDDKjhnOFzTQH0IbMf/yCIcbsDb/ZTBP6Nw4mwWUVl8TLGp1dJWG3g
gtBEYffcLMa2kSXkLoxLBKs/1M1RB3X4QHciggJ0OfW1JjUYsRg1tdUswVS7T0zz
HzaeJWVBWVg5quLlUWO4+WEFt1tiBgIqUsuiaxM5L/3oswmPqtTcii/omnVcEGmI
lzLZg/AJ5W8frCd9DDTXaL0n6LegmEUWw50TjM+HH+2w6T4kd4jfQ37yU6Vv2of3
4+wJ+6Pb0dHr3vRnCYKR+gt+qLP8P8FR+86wcGI+FHkjJM0p2fQ3aKDAkBXMjBQk
FzN+PmevEeX3mDugTeQs6JJgCx43p+VQY3hFWqvMBJWhdHYZ7WKwVomB2EMq/at8
DwUAcrXY4mbt3GAx4RPJlzJIAxh29ACc3Zwd8UZMkPgo7AwUZc824GTIn7YbL1J0
WzUv1cJmb35o5J4l/qyRPID8gFtDA7bPLBWHxq4T58Cd7cAufYOVOMr3NOup7pmO
pMKooGTxVjAKfF5IwGNeApXFonutkzLWTPaP8LeamjHPqFAwZwU=
=4KGJ
-----END PGP SIGNATURE-----

--y1o3etWOWlVi+UR4--

