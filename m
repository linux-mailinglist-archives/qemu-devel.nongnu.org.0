Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F3382453
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:29:17 +0200 (CEST)
Received: from localhost ([::1]:48750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liWkf-0004BW-0T
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liWfm-0000eG-9E; Mon, 17 May 2021 02:24:15 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40431 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liWfj-0005q0-6w; Mon, 17 May 2021 02:24:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk8Gr3YLfz9sWQ; Mon, 17 May 2021 16:24:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621232644;
 bh=8AFTuyHqGyZ4EeHrWbi7hbrcrzo7ONqzGgD2zmCQSCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZI+xkCQv5gt7KKSB8UNjGUWApDyS7CYzYiXDpYSEi3isuvsDarWLah16CFCk0vjuS
 Se1VXHQeSQ9Clv+e7rqwKn11Dkq/gR1M3gzNiicgo7W0gghU1inVSLzUlMj3tUuZgh
 y53w8Vz35C82pdPCuPyBGhbV16FsqiEycr1kTx3w=
Date: Mon, 17 May 2021 15:39:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: Implement ISA v3.1 wait variants
Message-ID: <YKIBlzRg3oicnKIO@yekko>
References: <20210517024651.2200837-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8CvYUvMj9aFFhOMQ"
Content-Disposition: inline
In-Reply-To: <20210517024651.2200837-1-npiggin@gmail.com>
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8CvYUvMj9aFFhOMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 12:46:51PM +1000, Nicholas Piggin wrote:
> ISA v3.1 adds new variations of wait, specified by the WC field. These
> are not compatible with the wait 0 implementation, because they add
> additional conditions that cause the processor to resume, which can
> cause software to hang or run very slowly.
>=20
> Add the new wait variants with a trivial no-op implementation, which is
> allowed, as explained in comments: software must not depend on any
> particular architected WC condition having caused resumption of
> execution, therefore a no-op implementation is architecturally correct.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Logic looks fine.  There is no test on the CPU's features or model
here, though, so this will change behaviour for pre-3.1 CPUs as well.

What would invoking these wait variants (presumably reserved) on
earlier CPUs do?

> ---
> Implementing cpu_relax() in Linux with wait 2,0 (pause_short) causes a
> hang on boot without this patch.
>=20
>  target/ppc/translate.c | 39 +++++++++++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a6381208a5..80db450cab 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3619,12 +3619,39 @@ static void gen_sync(DisasContext *ctx)
>  /* wait */
>  static void gen_wait(DisasContext *ctx)
>  {
> -    TCGv_i32 t0 =3D tcg_const_i32(1);
> -    tcg_gen_st_i32(t0, cpu_env,
> -                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halte=
d));
> -    tcg_temp_free_i32(t0);
> -    /* Stop translation, as the CPU is supposed to sleep from now */
> -    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
> +    uint32_t wc =3D (ctx->opcode >> 21) & 3;
> +
> +    /*
> +     * wait 0 waits for an exception to occur.
> +     */
> +    if (wc =3D=3D 0) {
> +        TCGv_i32 t0 =3D tcg_const_i32(1);
> +        tcg_gen_st_i32(t0, cpu_env,
> +                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, h=
alted));
> +        tcg_temp_free_i32(t0);
> +        /* Stop translation, as the CPU is supposed to sleep from now */
> +        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
> +    }
> +
> +    /*
> +     * Other wait types must not wait until an exception occurs because
> +     * ignoring their other wake-up conditions could cause a hang.
> +     *
> +     * wait 1 (waitrsv) waits for an exception or a reservation to be lo=
st.
> +     * This can happen for implementation specific reasons, so it can be
> +     * implemented as a no-op.
> +     *
> +     * wait 2 waits for an exception or an amount of time to pass. This =
is
> +     * implementation specific so it can be implemented as a no-op.
> +     *
> +     * wait 3 is reserved, so it may be implemented as a no-op.
> +     *
> +     * ISA v3.1 does allow for execution to resume "in the rare case of
> +     * an implementation-dependent event", so in any case software must
> +     * not depend on the architected resumption condition to become
> +     * true, so no-op implementations are architecturally correct (if
> +     * suboptimal).
> +     */
>  }
> =20
>  #if defined(TARGET_PPC64)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8CvYUvMj9aFFhOMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCiAZUACgkQbDjKyiDZ
s5IpSBAAgh9aTMQwGGyllBhtTY05nVn5E6evmRGGyiJFEeE1yPk2hQOp096pBa6T
6ToFSd2uKUf9NL248/Wq7/X5qB5RJZbEaWKWXIrY/DZf0l2aGDUVRkmxINIUVn+h
/UDCh4YsClAyUwwAn5HIRjl7ejDNc9KPyt77wD0r+eGCoHKs3ysS9bKZh/UZpAnU
/QPOZg/6u+vv5z0+V26+zgxHvmI0wZmcoQ7znYw+T6Ciqb6LTJQ+JUp0GT/6KyTU
PFiLcmGyKdsv5Ph+ZBbX7RbNyOOXucr5c9kDIgQp80fPbYv09HsdJAj55Vkskh2t
2fu9fw9Sv9itzbifRzduWpLbD7cywh0jTvac016YDzCn4cHrSEXNPg0HZKj0vRlo
77mdzlQEH3utb+gJqwBdpyxs3P5WiIYlxeYWG5roulKiiiPbIUEUrfkdLlUAHvMa
/QOzvstx7kkFWTzx+0iknHzDnB1q1+P5IQnJYxnnD1WsKLxAfD8I2Hp8osRV56Ga
oLEJL1dxFYNHyXx2aHLLZ0hxYSATjADZdYhF9vlevYL7whtS1YEm+abejg9NAe3b
Io4llLITi3mTCV+9dYTE4Jx2P4xBrbKg6Xg7nuuR6hU0dYENv4W3HPyK33ODP7IK
QWtnrjjNp6DJhzTpkwjssCXkDyH85Y+Kvvhqa/HiUJAXXF0Yspo=
=jV0+
-----END PGP SIGNATURE-----

--8CvYUvMj9aFFhOMQ--

