Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E0374D6D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:19:55 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTcI-0007rg-NE
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTav-0005oj-8U; Wed, 05 May 2021 22:18:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55313 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTaq-0004ca-Q3; Wed, 05 May 2021 22:18:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbHLJ0L7mz9sW4; Thu,  6 May 2021 12:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620267496;
 bh=WYlB70z+eVZIq1j3dLlNhnhyis7gJO8sepMb+y0/sTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VCGtcRBGWJeV11yW5ubhxiYhOD6KpXQMvdcPs3tSJqg4LGbCl9FyKk8Xk8OLtCaPO
 dyCO+yoVFqC//REDbVEapPLR0wlHsy5JD5dGTVQ+71xC0AC+DBSidzABjkCBakSq07
 LfR1AWYQbuw6vAETyYht19C0yZKqK5JX8DPddVe4=
Date: Thu, 6 May 2021 12:16:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 21/23] target/ppc/kvm: Avoid dynamic stack allocation
Message-ID: <YJNRfZOmH9NKB7EP@yekko>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-22-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4nfXEX1oz+WC3sSD"
Content-Disposition: inline
In-Reply-To: <20210505211047.1496765-22-philmd@redhat.com>
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4nfXEX1oz+WC3sSD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 11:10:45PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index ae62daddf7d..90d0230eb86 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2660,7 +2660,7 @@ int kvmppc_get_htab_fd(bool write, uint64_t index, =
Error **errp)
>  int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
>  {
>      int64_t starttime =3D qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
> -    uint8_t buf[bufsize];
> +    g_autofree uint8_t *buf =3D g_malloc(bufsize);
>      ssize_t rc;
> =20
>      do {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4nfXEX1oz+WC3sSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCTUX0ACgkQbDjKyiDZ
s5J1Xg//fP1CCuNm/HXYPKD8uyQHwvtdILvGbw+HFXKQczWuXk0sjY8FFMtKSRzI
wJeYsZ2GmWAolWYLsVqquprjj4ciC2jjRW17ktQTI1BfvjossxiolQUpDFvRgW8m
ZLGcL9FzEKEJsN3izzKLlYtfmNt/VrPxl5+Oplp/TCyZmoGHyXDthBjss7+ShBss
Bb1y8XkpFyne5dL1pounzAMIhw1o7WPGDzWBhVxTpZeFUqlkRcUCl8cahxgFMcjf
YeJzjwS6on8wj32r3eoUQu8SPJDehkRI76HC/np5P6oWn15/F4Cq4hE3kQvidM1/
luCwRFY04TPHVL7BNDcnV1zyCjtJ/TvlqNbWIHIYhdpahi1uBkM2Qq91bdB1Ehg1
mJczNaXIJbqqT6/BIsbX4MXOCdSCxNCwdRHJupaqzZJGGM+GjmGkXeZmuhJHajh8
s2uAy02ZSqHn+ZBA+Q2lw18gEixs5//IjfEsJ+XE8Ju88ax/UMWr9TpfWcG1IGFu
yAw7CufbuLdF2yvqCvbfeCHbpaNQ0udUpIb8ZO2URtCvFY59s7q+RAg7hsBliYVH
L+iRuKLctjsxPut99eGq8dWaKLr31JmcnULc6t0Dicak5CVQIXye/vP0a9xIyqxT
mR2jrBRpg+rDTdKWGX03s3XO5u9a18DnmikjtMlpqmLPPHlQq9U=
=JU2c
-----END PGP SIGNATURE-----

--4nfXEX1oz+WC3sSD--

