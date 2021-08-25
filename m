Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B93F6E2E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:16:38 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkL7-0003Gd-U9
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGa-0000cP-5a; Wed, 25 Aug 2021 00:11:56 -0400
Received: from ozlabs.org ([203.11.71.1]:40369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGW-0007Bi-Fm; Wed, 25 Aug 2021 00:11:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt3knTz9sjJ; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=Okg97fETd7IVV3hQczowWZBBiZO3v6bVi699GZ7kv6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BwJTtuoL7JkByT0XEWKRr08yySRSozF8zCdLl0aOPfsL4/ARCylN0EJX3/OEX3t2u
 B36K5HEyGETFyQyz4R1jVOxtUA9K4Lezvnr468dFg6P6ix0uRMGz80QFMNBDXdXmKe
 kw7ORR8ylXSBQiXjtYkN2846HjTuCaNjnkhCyt/Y=
Date: Wed, 25 Aug 2021 13:02:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH 0/2] target/ppc: Fix vextu[bhw][lr]x on big endian hosts
Message-ID: <YSWysymmaKYEFQX2@yekko>
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6VhsfqtzH4DoeqTa"
Content-Disposition: inline
In-Reply-To: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6VhsfqtzH4DoeqTa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 05:11:03PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> The definition of struct Int128 is currently independent of the host
> endianness, causing different results when using the member s128 of
> union ppc_vsr_t in big-endian builds with CONFIG_INT128 or
> !CONFIG_INT128.
>=20
> The only PPC instructions that seem to be affected by this issue are the
> "Vector Extract Unsigned Byte/Halfword/Word to GPR using GPR-specified
> Left/Right-Index." Even on builds with Int128 support, however, their
> helpers give the wrong result on big-endian hosts.
>=20
> The first patch in this series changes the definition of struct Int128
> to allow its use in the ppc_vsr_t union. The second patch fixes the
> helper definition.

CCing Richard Henderson, who's probably the best qualified to review
these.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6VhsfqtzH4DoeqTa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElsrEACgkQbDjKyiDZ
s5LWTBAAkaUwMAhnVmYnNkl5eoSdFchv3RutBQwY3z0pW2DT43z8HKSlJhoqbD4n
E0YYpaUIhqrCYQOxO22sSvhuSTYO9XPd22chJw/Qaweb5LUS4oXBBXHmd52zaoPR
f3XcyshWKCWvl3e3r423QcQD6D7ogOcDzqw3Bg53+B1Z6U+HN64pzuC5ecdNAd0S
+jE1Hpai0ezAJWaB5tqBVmVKhLu+EYgoEVG0rnSUzHZ8liCtTdyl82p8dNPgumGn
rz1fAOd6CbDy6o0UDhP+fnZsozZVCm9rTOovb2As694CSAUz++gD1Aqnthaj+IjB
zPunVxISn6mNUkSQUTd/4CYYU4T/89SrYaWU0SSX0I6qVSJnbKmmDV0+gBxKztS9
203qAVv2a3Lcfp7RbLS9cm3lnI0sSYkjzEa/qqu/+h7RsdqKQyN3AAy8lMcme4wU
2J5LV5Da0JyieZ1dQZci2flRfVrzxCwIoyoh/IgZn09UbaoQxDedCTjYSgpCksvh
EiLNLR0sxpgdyeJOhpjba6LIkmJiezV9Dq/tKamY/ngtXiPprXozWbRROD59DVu5
hqKTJja8UpZ6nWZdIU59YbNB+Bni3dpQq4mUHd3xIvQ3LCGY/pLChwPfpvwMfQh7
vGRNMrTxM9VriN/SB3HQB1piUyzBgJM+7znjJ/fcWTGZwGljD4U=
=Ccjm
-----END PGP SIGNATURE-----

--6VhsfqtzH4DoeqTa--

