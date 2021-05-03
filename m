Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8D3710F8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:38:02 +0200 (CEST)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQLJ-0001GK-PH
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJM-0007ZH-95; Mon, 03 May 2021 00:36:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42467 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJI-0002BT-6l; Mon, 03 May 2021 00:36:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXR06Vzz9sW4; Mon,  3 May 2021 14:35:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016551;
 bh=RAT03KtbCWwYYTeCrc/GtgEkVgsE/rHefdNYZD9Kahk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzYUGelfG0AA/FprUmdowcPgPJCd3H5FpCytWgxjf4nihWZCWGaofsAdHk0TLjmwn
 7EK/HOmC5L10dMa81qcHuzQ67ByLZflElGcGXcvDsnfPMp1iu4ZEC+ctaDN2fnuaiN
 PhkhuWZ9MHR9kk9gVdXE0eUzhakbkApXO1FHF+/U=
Date: Mon, 3 May 2021 13:48:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/2] target/ppc: Reduce the size of ppc_spr_t
Message-ID: <YI9ylakaG9PDPlav@yekko>
References: <20210501022923.1179736-1-richard.henderson@linaro.org>
 <20210501022923.1179736-3-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KRfzuLOe08m599VI"
Content-Disposition: inline
In-Reply-To: <20210501022923.1179736-3-richard.henderson@linaro.org>
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
Cc: qemu-ppc@nongnu.org, luis.pires@eldorado.org.br,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KRfzuLOe08m599VI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 07:29:23PM -0700, Richard Henderson wrote:
> We elide values when registering sprs, we might as well
> save space in the array as well.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e73416da68..b704261b49 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -192,17 +192,21 @@ typedef struct ppc_hash_pte64 ppc_hash_pte64_t;
> =20
>  /* SPR access micro-ops generations callbacks */
>  struct ppc_spr_t {
> +    const char *name;
> +    target_ulong default_value;
> +#ifndef CONFIG_USER_ONLY
> +    unsigned int gdb_id;
> +#endif
> +#ifdef CONFIG_TCG
>      void (*uea_read)(DisasContext *ctx, int gpr_num, int spr_num);
>      void (*uea_write)(DisasContext *ctx, int spr_num, int gpr_num);
> -#if !defined(CONFIG_USER_ONLY)
> +# ifndef CONFIG_USER_ONLY
>      void (*oea_read)(DisasContext *ctx, int gpr_num, int spr_num);
>      void (*oea_write)(DisasContext *ctx, int spr_num, int gpr_num);
>      void (*hea_read)(DisasContext *ctx, int gpr_num, int spr_num);
>      void (*hea_write)(DisasContext *ctx, int spr_num, int gpr_num);
> -    unsigned int gdb_id;
> +# endif
>  #endif
> -    const char *name;
> -    target_ulong default_value;
>  #ifdef CONFIG_KVM
>      /*
>       * We (ab)use the fact that all the SPRs will have ids for the

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KRfzuLOe08m599VI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPcpUACgkQbDjKyiDZ
s5KDMBAAj5Oy0pwZkZKdc32JmytbmG+eNN+FSC8JZ5iMx965Tww3dUpW+YTzyKb3
dtNoLqYFBCvftvWXg/oGypv0WkFBuEwBT4XtCUcnxiEpckKKdfgJmkM8vbuNpjKp
RAq4pkWtFIM9KicK2epXEAMHOpgunOmkrg5f54WcdFH655f8vRB9m9MKhVVyGlso
Not8CiACCyqOq53uB3du8uu5OZWKcunB8uwPyfVmhXbq7W9hz7h30Jm/3spD6FCq
rRQ3B9aHfaqAQb0iGO8+TWWj3P+jZCLMmKZFuKhicYqaK+CR99SF0bR5dxG4JHLd
+icp757dYkPPPY5QH5ZtBxt6Jxq/XIiHwg4ARIwEn2fpxIQJ+U8AS/G16SB+N0uB
9qDwC8QUV/S+Mcqtc0iKAMw+nJcw0AtBaj7rWd1fg0Fi5xW2HZBpUXXyytrg6htc
aMzOd73GdjFOJhcl2Fa6JHQuP+MHhCpzK4y4eDSH4Vtzq9GjMqKgClpL6GuaQY2f
CZrEuGcZUt9ivlGwzcpxID4MTC1Si6aKelgweO9AeRb4BbUD3oPnl6Yqb57CCqyn
GGBEZn+z5+y/PuHAB6pOeb3scHo/1Qu9n3iZqBLiBAQ2o0E2bHSibLjdi6qBfM2I
CXkKN6Ql+JxiiC1rVyoBcJejTycfMfBbDsega4n8k3wOEixJ8DM=
=2PRC
-----END PGP SIGNATURE-----

--KRfzuLOe08m599VI--

