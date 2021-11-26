Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D263F45E44A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:17:15 +0100 (CET)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqQna-0003NA-Am
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:17:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqQjs-0002UM-7e; Thu, 25 Nov 2021 21:13:24 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:52879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqQjo-0006rh-Os; Thu, 25 Nov 2021 21:13:24 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J0dZL4t3tz4xcK; Fri, 26 Nov 2021 13:13:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637892794;
 bh=6g2i3vCmNVuTYelBtr9R6f5dubJSJFmywIkLHgZ6OdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LygPrD0ojx05OufYaM4TihHonYF8q7/HVGS/5Ci+QxHhIgoQMTeZaKYfRCVyqPoG9
 SzfgxeDpW9U4G9L8PThmjueYHayywmcYMTpWoUONTLlBbrFJngu8qiszoiYH6oPRvw
 p1JQ3oKrpWsupQCzN3KiK7pFNLSxMTcFouoRF9VA=
Date: Fri, 26 Nov 2021 12:13:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v2] target/ppc: fix Hash64 MMU update of PTE bit R
Message-ID: <YaA0nkWqcGdZ7jM2@yekko>
References: <20211125183322.47230-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wiKuDAs6Y/VTvSrg"
Content-Disposition: inline
In-Reply-To: <20211125183322.47230-1-leandro.lupori@eldorado.org.br>
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


--wiKuDAs6Y/VTvSrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 03:33:22PM -0300, Leandro Lupori wrote:
> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
> offset, causing the first byte of the adjacent PTE to be corrupted.
> This caused a panic when booting FreeBSD, using the Hash MMU.
>=20
> Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

If you're introducing the constant, it would make sense to also use it
in spapr_hpte_set_r().

> ---
> Changes from v1:
> - Add and use a new define for the byte offset of PTE bit R
> ---
>  target/ppc/mmu-hash64.c | 2 +-
>  target/ppc/mmu-hash64.h | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46..0968927744 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_=
idx, uint64_t dar, uint64_t
> =20
>  static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>  {
> -    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + 16;
> +    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OF=
FSET;
> =20
>      if (cpu->vhyp) {
>          PPCVirtualHypervisorClass *vhc =3D
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index c5b2f97ff7..40bb901262 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -97,6 +97,9 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
>  #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
>  #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
> =20
> +/* PTE byte offsets */
> +#define HPTE64_R_R_BYTE_OFFSET  14
> +
>  /* Format changes for ARCH v3 */
>  #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
>  #define HPTE64_R_3_0_SSIZE_SHIFT 58

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wiKuDAs6Y/VTvSrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGgNJ4ACgkQbDjKyiDZ
s5IqVg//S3e5WchJLRK+Hf8T/2XHaJVQRW95F/T9yJ8zf8zffw3LFRoigsFs6ztK
yu//NbR7XW0Yz1QPDfKcJy7pLnCQUTtkE4jXTR1a2RdZwEXhyrmGTHlyagST9MS/
xR9IU6+LYRm2mINU3YmmWrVL2ALu63eTgKwQlBZX94NXj6SdNqgH1lbQ19hcuSPJ
Cb70BlhxT4ZALa2NLu6Lu67ANeV+FzfNUxDu2kFJ0qJsQ4BHzVDSnuzEW6WQ6s9x
2rlzXsKmiqyDpMP2USuy1CGkSW6S4NawLSBAaa7pGBlyOYSICicGtTXI3dRfUUBR
Z73LPYVfdaY6ezRyHlsaW/jTD5PKXWFcVKRCsStFWEi32zWk1VvX3jbwpQtyNS+H
1etfHBmeKYVSsjTTY3FwYk6JW/+fPD2+76jGF3taLpVZ6OujJqsm+A+MS+bKTlGt
LebjB2OCqAfgLjjP+YBf9FYc9wfuP+11IAAJVc7Ba2yrR3PuTjTSJbTHZg5JuxnW
g/s/vB3iloDytY7t2+bRMb54hEjuBLGC3+p8AExZqz5HcMLcoQIKZI7sfTk2t6iY
jYJX4jUo8tPw3MBYGU6W2D6HdUV2kpQ5XNOEcpkdoDR+aR7ZWif599eufB9O7yTE
WBAPjrWCYBjy0/e5zEdcJf3fjVdVI2tWDFdTVIftfCEyu6QOixo=
=+MHS
-----END PGP SIGNATURE-----

--wiKuDAs6Y/VTvSrg--

