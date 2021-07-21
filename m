Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B073D090F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:40:12 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65tr-0002WY-EJ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65ng-0003ca-9f; Wed, 21 Jul 2021 02:33:48 -0400
Received: from ozlabs.org ([203.11.71.1]:39237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nb-0006pz-Hq; Wed, 21 Jul 2021 02:33:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GV5Pv4j4Hz9sXG; Wed, 21 Jul 2021 16:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626849219;
 bh=hqEBLoErypeJr3mW3ghrAFQ0KrzUsxbx6+rbljz22cU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J2nj3DwMZnvzfD5CPP4PONRwetxllyhD2ikjjX7B7iqsUl3UbODg6zF+V68Yqy4Wz
 gsnUG1L9TQOnorM8J80w1F66mVROvCY/I6QiayczFdxRY8dAwr7LE4TvyHDluMuXgJ
 OqdhxCYAgkwVPcX0aKXgqG/IzVP6StKjMiXPpDHs=
Date: Wed, 21 Jul 2021 16:07:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v2] target/ppc: Ease L=0 requirement on
 cmp/cmpi/cmpl/cmpli for ppc32
Message-ID: <YPe5jaamD0481c5X@yekko>
References: <20210720135507.2444635-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="glWUZbamlQMGrMIi"
Content-Disposition: inline
In-Reply-To: <20210720135507.2444635-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--glWUZbamlQMGrMIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 10:55:07AM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> In commit 8f0a4b6a9b, we started to require L=3D0 for ppc32 to match what
> The Programming Environments Manual say:
>=20
> "For 32-bit implementations, the L field must be cleared, otherwise
> the instruction form is invalid."
>=20
> The stricter behavior, however, broke AROS boot on sam460ex, which is a
> regression from 6.0. This patch partially reverts the change, raising
> the exception only for CPUs known to require L=3D0 (e500 and e500mc) and
> logging a guest error for other cases.
>=20
> Both behaviors are acceptable by the PowerISA, which allows "the system
> illegal instruction error handler to be invoked or yield boundedly
> undefined results."
>=20
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Fixes: 8f0a4b6a9b ("target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree")
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate/fixedpoint-impl.c.inc | 58 +++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index f4fcfadbfc..1c35b60eb4 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -145,8 +145,35 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
> =20
>  static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
>  {
> +    if ((ctx->insns_flags & PPC_64B) =3D=3D 0) {
> +        /*
> +         * For 32-bit implementations, The Programming Environments Manu=
al says
> +         * that "the L field must be cleared, otherwise the instruction =
form is
> +         * invalid." It seems, however, that most 32-bit CPUs ignore inv=
alid
> +         * forms (e.g., section "Instruction Formats" of the 405 and 440
> +         * manuals, "Integer Compare Instructions" of the 601 manual), w=
ith the
> +         * notable exception of the e500 and e500mc, where L=3D1 was rep=
orted to
> +         * cause an exception.
> +         */
> +        if (a->l) {
> +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
> +                /*
> +                 * For 32-bit Book E v2.06 implementations (i.e. e500/e5=
00mc),
> +                 * generate an illegal instruction exception.
> +                 */
> +                return false;
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L=
 =3D 1\n",
> +                        s ? "" : "L", ctx->cia);
> +            }
> +        }
> +        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> +        return true;
> +    }
> +
> +    /* For 64-bit implementations, deal with bit L accordingly. */
>      if (a->l) {
> -        REQUIRE_64BIT(ctx);
>          gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
>      } else {
>          gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> @@ -156,8 +183,35 @@ static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a=
, bool s)
> =20
>  static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
>  {
> +    if ((ctx->insns_flags & PPC_64B) =3D=3D 0) {
> +        /*
> +         * For 32-bit implementations, The Programming Environments Manu=
al says
> +         * that "the L field must be cleared, otherwise the instruction =
form is
> +         * invalid." It seems, however, that most 32-bit CPUs ignore inv=
alid
> +         * forms (e.g., section "Instruction Formats" of the 405 and 440
> +         * manuals, "Integer Compare Instructions" of the 601 manual), w=
ith the
> +         * notable exception of the e500 and e500mc, where L=3D1 was rep=
orted to
> +         * cause an exception.
> +         */
> +        if (a->l) {
> +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
> +                /*
> +                 * For 32-bit Book E v2.06 implementations (i.e. e500/e5=
00mc),
> +                 * generate an illegal instruction exception.
> +                 */
> +                return false;
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L=
 =3D 1\n",
> +                        s ? "I" : "LI", ctx->cia);
> +            }
> +        }
> +        gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
> +        return true;
> +    }
> +
> +    /* For 64-bit implementations, deal with bit L accordingly. */
>      if (a->l) {
> -        REQUIRE_64BIT(ctx);
>          gen_op_cmp(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
>      } else {
>          gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--glWUZbamlQMGrMIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD3uYsACgkQbDjKyiDZ
s5I7Dw//eAdYcpTCSt6b/iTjYknYPTfntN/rMVpRwjPlRY/WGrtt4K0Yq3WJgS8S
wB6ViJTi/l/LCvoC4D3/tkunzSCLdm0Hm+T4Jv/TcpU6Woa5FPXAsLN18DE8bG58
WX52E0zmqjyWUdn7CpB+OzzTezSHyUSrM5ATLM+ZShsRGj9oB1q4A792e4PrToFQ
7QxAZOizBwNJPaKnNmAXXpSb9vqXj0JZU+btA4tzV7LzYJlRrFMCGNXUKCsCf8Ve
Eog4PXUSq0ExyswY3Czi1wIpqQbR1gq6zMTWq1v0ElZUoBSOkRP1dOwziubehdtj
YDnqie3GlOU94R1anVjBvYxQW4hXGzxmBmi5JQ9+X8RKLGN56nNdvuhMnGFBofTJ
lZfJ1nUSF+exTaSFfsGlIXsxwNLO1zJ4+XTQE8z/xLz7qQ9ZdS50pGtSvmES0Gkq
bISObThLXeZHkfv4NjTauP0+cBAMHmL2epnQcViWwVNHdKp5voRmfWQz3vkz4Vs0
grzFopO0F1yY5/D+aOaZLknlXn3mWMyt7VEaL2WTYw5sZPUECQkfw9OZs2P4GP5d
kfLWtZabOnX6ciudCdeDPwrOMzcYFqmvcQfvpXVr5xtl93mF/U4/aYQ1nsSE6OuN
vEwqlkYoT8dHgoTuR9Zy8AZppLqu+4qeVZ88Fw5Mz9mGcJBkxZg=
=ywJk
-----END PGP SIGNATURE-----

--glWUZbamlQMGrMIi--

