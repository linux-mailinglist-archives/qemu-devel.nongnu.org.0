Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DB3BF46E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:08:27 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LKs-0006BF-G6
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFV-0001QC-IB; Thu, 08 Jul 2021 00:02:53 -0400
Received: from ozlabs.org ([203.11.71.1]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFR-0004eH-Mp; Thu, 08 Jul 2021 00:02:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL2gk3dnjz9sWc; Thu,  8 Jul 2021 14:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625716962;
 bh=qhghhd2rxZaXIKxTm3X7myzc+Kt+Kgt2IBFadlE21DY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LA2TNPQzrPePoKaR6bv1tgNdbWYJd/yunudIS9CbMZDwXX6XuUtfKLa814gKjjvcb
 UYwJ9BqFf0HVmFXzxHb0RXA1wd5k6RPtNJe0z2RbPc5ACr+RGKyCk4dcEOJ+6X7A7K
 vjBuhUby7n24s3sVoc++2rgbLi6dy+CSfsvB8pR0=
Date: Thu, 8 Jul 2021 12:44:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: mtmsrd is an illegal instruction on BookE
Message-ID: <YOZmdsNUrcuIbfV/@yekko>
References: <20210706051321.609046-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G+r49oJx2H4c9xld"
Content-Disposition: inline
In-Reply-To: <20210706051321.609046-1-npiggin@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--G+r49oJx2H4c9xld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 03:13:21PM +1000, Nicholas Piggin wrote:
> MSR is a 32-bit register in BookE and there is no mtmsrd instruction.
>=20
> Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index f65d1e81ea..d1f482b0f3 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4940,6 +4940,11 @@ static void gen_mtcrf(DisasContext *ctx)
>  #if defined(TARGET_PPC64)
>  static void gen_mtmsrd(DisasContext *ctx)
>  {
> +    if (unlikely(!is_book3s_arch2x(ctx))) {
> +        gen_invalid(ctx);
> +        return;
> +    }
> +
>      CHK_SV;
> =20
>  #if !defined(CONFIG_USER_ONLY)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G+r49oJx2H4c9xld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmZnYACgkQbDjKyiDZ
s5KQKQ//d4iEHCrZgJ1yn8FkWC568gx1yl6uwJmGNkbMNc5KNDiPNSBcQOF7YEo5
cTC42e7PVZdx8gzyLPf4mzhIsMsZ7FUYSBaDnowCebL54cXtDVpiViDEE8rYxvPz
CVcu7bz1/HBug6lsDNLtI6vZU+HysiLO2caTxJEhiqJznfVx1QpuHVY6AjpDgZ6C
TYSvQaTX9v4SHkPLJfNK2jUWp6an2QxfPJphMGc9dDMP3rGtjkSEmCkJphFmEfIy
k6bllkPoylM1mBJJv7NyH4G435OMlSgZvmcGqYZnxNfO67177bXyLhF7ROaLB+G0
CgiV2MM8auZMHeykJR7ltpulPbymIVEvjcLrKYi4RIsPt91Tz4Fy/I+c723DYX7o
vBUTJ6Lcx441aOw5yTa5uv7yVSdW/BcvjKW113k/FqMqnfrbG9y4S9FS8N1iynaJ
nT8YCF6Xttw4Xld8R6eV6x9yLzpHuZTX4cOV2nQFwHFN/fXe7dAnDSkA4jppUIZe
zBoCg6EfVUh1g09Rn2WDN4trv0P1vyqsgOvkPAcvz6jGtt5GBifPh89+0FXk91gA
m7eQOR4eL+byLJbJuwszITDgnZ5Z1ukWmIBwtPKMRe2xNfT/qkYYdKXdherEx1PX
JEtc7HRVMxLGJuxwOwx4VYdl5ZaKJTPYX6enCmoNPXWXUZFU82k=
=7V3j
-----END PGP SIGNATURE-----

--G+r49oJx2H4c9xld--

