Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34F2412D12
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:53:15 +0200 (CEST)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVuE-0001Ce-AK
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrG-0007CI-W0; Mon, 20 Sep 2021 22:50:11 -0400
Received: from ozlabs.org ([203.11.71.1]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrA-0007DB-Jm; Mon, 20 Sep 2021 22:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632192600;
 bh=5BBLhaQInxlc4yhjVlvmwEnhSEQyk9hVSByhA8F9L24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P0qwbre5G9GLK71IN7KDEDclfvJ834bRoz4Fn2triRwu3szUqRlsT9CwWDJWh4FoK
 zt+052IzbkD0wylk50wTTtitmZEZNIr8/YlnqMHZ12JXS0F72vw5IVruv1FNDNvNi9
 0IA+gG06MTwEqxL8FEMfJ7T86kkmisY3hLDuTPS8=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HD5WD03txz9t14; Tue, 21 Sep 2021 12:49:59 +1000 (AEST)
Date: Tue, 21 Sep 2021 11:44:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 4/4] target/ppc: Fix 64-bit decrementer
Message-ID: <YUk5GkaPHVFvPljo@yekko>
References: <20210920061203.989563-1-clg@kaod.org>
 <20210920061203.989563-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NbersvO8hRzLqFEU"
Content-Disposition: inline
In-Reply-To: <20210920061203.989563-5-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NbersvO8hRzLqFEU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 08:12:03AM +0200, C=E9dric Le Goater wrote:
> The current way the mask is built can overflow with a 64-bit decrementer.
> Use sextract64() to extract the signed values and remove the logic to
> handle negative values which has become useless.
>=20
> Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for=
 TCG")
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.
> ---
>  hw/ppc/ppc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index b813ef732ec1..f5d012f860af 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -821,14 +821,12 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, u=
int64_t *nextp,
>      CPUPPCState *env =3D &cpu->env;
>      ppc_tb_t *tb_env =3D env->tb_env;
>      uint64_t now, next;
> -    bool negative;
> +    int64_t signed_value;
> +    int64_t signed_decr;
> =20
>      /* Truncate value to decr_width and sign extend for simplicity */
> -    value &=3D ((1ULL << nr_bits) - 1);
> -    negative =3D !!(value & (1ULL << (nr_bits - 1)));
> -    if (negative) {
> -        value |=3D (0xFFFFFFFFULL << nr_bits);
> -    }
> +    signed_value =3D sextract64(value, 0, nr_bits);
> +    signed_decr =3D sextract64(decr, 0, nr_bits);
> =20
>      trace_ppc_decr_store(nr_bits, decr, value);
> =20
> @@ -850,16 +848,16 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, u=
int64_t *nextp,
>       * On MSB edge based DEC implementations the MSB going from 0 -> 1 t=
riggers
>       * an edge interrupt, so raise it here too.
>       */
> -    if ((value < 3) ||
> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && negative) ||
> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && negative
> -          && !(decr & (1ULL << (nr_bits - 1))))) {
> +    if ((signed_value < 3) ||
> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0)=
 ||
> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value =
< 0
> +          && signed_decr >=3D 0)) {
>          (*raise_excp)(cpu);
>          return;
>      }
> =20
>      /* On MSB level based systems a 0 for the MSB stops interrupt delive=
ry */
> -    if (!negative && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL)) {
> +    if (signed_value >=3D 0 && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL=
)) {
>          (*lower_excp)(cpu);
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NbersvO8hRzLqFEU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJORoACgkQbDjKyiDZ
s5L6jw//V2C+uGefvAZSqrXIe5cHGqE32TzCJZDWZOxa978ubN1goYm1DjKUycrV
dypHElTr87uHCW61Q4eW3phG3wCET1T9eSqGs6YY14QiqoOh68St40wv5JyA0GiJ
cI4vXTADw8WGQPCT/rQoa6vTIScBBK3hP4VqotxWWiECzpWbtcU5D3pQYaF90KWW
d/k5/xdQOxTbD4lyzk/EN/AtzyDCYiyMOvjDnI3da2E7uOmeYc/kbNV8mUQFUpHm
JowkKJp4v7CPTsnB6R2urzuVsaKoV22s61qt4ocOn3ZX9hykyqLnUtfRNOqZgib5
9kyBmMCGJRqzZfQxZbr05VnvClLtodO27aZHhlbuTQoPohiy1JPos340wgf83gpH
qj9aqhw6XEEogf6fD+NO1mraxPB4XFDXGA9RtvrLuyzhUXhU9SgA/0Egt2ZBpGDZ
V911fPowgQuXsxfDnMRj2F1cl6i0+SeizZHEExghKOdQtNJZGEwCB/eeJkMWAFOM
KcCmRvPt5Rynngzd4JNmoVNSH3dR3vTvO7ABIR6Dgm9CWklNJYnXlaelYzLUWn6Y
J5n1rnedLmEWdz8Qg/QDedi1tfnEWsIU5jdKGJ9gGe2Otd2++Z1j0em+KD014UmL
uVv8D4mgX9+N69T5iNLQR3nSvqwVGm84KD8c6AcCWJ+WY8BAIIU=
=kpFI
-----END PGP SIGNATURE-----

--NbersvO8hRzLqFEU--

