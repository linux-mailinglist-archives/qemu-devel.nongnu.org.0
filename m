Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD163CCCB3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:46:06 +0200 (CEST)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5KEG-0005fa-Ra
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5K6N-00017w-Va; Sun, 18 Jul 2021 23:37:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40467 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5K6L-0002wD-Fa; Sun, 18 Jul 2021 23:37:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSnbv1hPqz9sW8; Mon, 19 Jul 2021 13:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626665867;
 bh=OB6SWCODCwqHr1t6NUWoVnPGgQcdM8upYSYzEWNV/hA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EGgswyVVehEI7kk/FLUALYT1b+vC4x4UrF7iCXDI77i5i/6ImRt/We81FZgKVm800
 9iCX8sPTua+BR4fiAbd1O4sE/BpUSG6t5vtvpLcspfuKsAOFBV7lT84964PiZzxD/4
 PvDBbZLP4SvgGrJf9GGd5Ndlp5LZ7lLAhy/Z0Z90=
Date: Mon, 19 Jul 2021 12:42:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
Message-ID: <YPTmoCh2z2VXzc7O@yekko>
References: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mxK7GqjLVT4Y5zbJ"
Content-Disposition: inline
In-Reply-To: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mxK7GqjLVT4Y5zbJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2021 at 09:29:50AM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> In commit 8f0a4b6a9, we started to require L=3D0 for ppc32 to match what
> The Programming Environments Manual say:
>=20
> "For 32-bit implementations, the L field must be cleared, otherwise
> the instruction form is invalid."
>=20
> Further digging, however, shown that older CPUs have different behavior
> concerning invalid forms. E.g.: 440 and 405 manuals say that:
>=20
> "Unless otherwise noted, the PPC440 will execute all invalid instruction
> forms without causing an Illegal Instruction exception".
>=20
> While the PowerISA has an arguably more restrictive:
>=20
> "In general, any attempt to execute an invalid form of an instruction
> will either cause the system illegal instruction error handler to be
> invoked or yield boundedly undefined results."

That's actually less restrictive.  "boundedly undefined" lets the
implementation do nearly anything that won't mess up a hypervisor.
Both ignoring the illegal bits and issuing an invalid instruction
exception are definitely permissible within the meaning of "boundedly
undefined".

> Finally, BALATON Zoltan (CC'ed) reported that the stricter behavior
> broke AROS boot on sam460ex. This patch address this regression by only
> logging a guest error, except for CPUs known to raise an exception for
> this case (e500 and e500mc).

So.. as a rule of thumb, I'd prefer to have qemu give explicit
failures (e.g. program check traps) where there's implementation
specific or architecture undefined behaviour.  On the other hand,
having a real guest that relies on the specific behaviour of real
implementations is a compelling reason to break that rule of thumb.


Given it's a behavioural change, I'm disinclined to squeeze this in
for qemu-6.1, but I'll consider it for 6.2.  Richard, any thoughts?

>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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

--mxK7GqjLVT4Y5zbJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD05p4ACgkQbDjKyiDZ
s5KWLBAAglwReSHxN6sknQCP4yylMYRB7P8lvtH8SgTAtf7vStw6xe6sqFD/7U9a
toHlV6K9Av0+i3di3G0yxRvyq+b021MSQu+hdwGG9yitS3uv93RhKTiGWoc/Yu05
TCYmc54AER2DE1R+gTmYocO7kEtqk6K49gCwLyvGs0/UTO23zLQfkLLEBlKWhaJe
iO7BuwxIZv0hnHaTiCfJZyvJXK8r+mdD0Gj/3Yfa8ZI9DUCEnuvQZjl5/kzNbMgf
EhiIPlc3NeOLyxac3dDtQIDmuxv8lJSQcM5ymXguZXDNDm1mLRcNXvsWsIzl4dxp
1NUsIWlM3h6rGLDI4FKQ7jHcPnTCXV8cazgEFCfg+LM39louZSq0KddzGJns1tv+
8t+nCZtmmpkC6Erj0+gwVrjGkoZIc/9J5zgqVazyNASNEIYMbtru0Gi8dpYP6UgB
UqME44LbVcyYuWkTeQTBbgDSBcEfBqJXx7CaL9+9NjFyEmet0M9X9CwLZZ/tmHzI
Sptvf26EE6BoKXQPQVSW07r3tDqWklajJQfwICu9Q3nmQoIqwb+VRdsEcDPWkYTX
Qp8/IGWXYnFF9UibcvicPkojOnn/7JxAO17XOpmydL+Yn1T4bNzO5ztekdcElSbr
xVdL/RUiENMx4vpMOtWLdkuGlDWvKsMLXH4FEl9nHK3s7tW/G6o=
=QYJO
-----END PGP SIGNATURE-----

--mxK7GqjLVT4Y5zbJ--

