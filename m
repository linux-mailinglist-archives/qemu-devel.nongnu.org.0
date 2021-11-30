Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F153462BA4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 05:22:20 +0100 (CET)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mruep-00024x-8F
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 23:22:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mruaS-0007gv-BF; Mon, 29 Nov 2021 23:17:48 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=35877
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mruaP-0005pc-DY; Mon, 29 Nov 2021 23:17:48 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J38832kqcz4xYy; Tue, 30 Nov 2021 15:17:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638245859;
 bh=x/1grbfFjieNPEYm++b4BhOOdSMKM7EG7DmGnJE2+8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B5lk+cttePkkA4kEbzvlhHfEOfrH4ca027CoJyZxUvRC5mRMGIQ0MwobRuQAa7S4t
 5w2YZz2Hc9uvguH5qfKTWnMFzIZsblGtnwdkAAXqPpM4kXLd9+9f+7ezMQOUXt+H9x
 aredkCzvpQSBzFsBZ+s3OYFNE1miQE9cI0oP2BdY=
Date: Tue, 30 Nov 2021 15:17:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 10/10] target/ppc/excp_helper.c: EBB handling
 adjustments
Message-ID: <YaWl2trUqTMpxax+@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mJTsO83oiPiVLnLL"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-11-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mJTsO83oiPiVLnLL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:17PM -0300, Daniel Henrique Barboza wrote:
> The current logic is only considering event-based exceptions triggered
> by the performance monitor. This is true now, but we might want to add
> support for external event-based exceptions in the future.
>=20
> Let's make it a bit easier to do so by adding the bit logic that would
> happen in case we were dealing with an external event-based exception.
>=20
> While we're at it, add a few comments explaining why we're setting and
> clearing BESCR bits.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mJTsO83oiPiVLnLL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGlpdoACgkQbDjKyiDZ
s5JrzxAAwaYMNjMZsLXzHLWFXGgGy/rlFIjB3VfFB+NlwhxD7kJypP48RykTvfFF
GWfN/fhuUXRg9faYJbW7pqPUf49H6Nhwl9RG2H2nIk7YoXCTJQ1K0u4PSEQIVBV+
KcRF27MSfZMMkeDsaz3McCflsPLuKciD3lhKsqyyanc81pRRVm6RZwG8gRzMy8CN
k/IFCXWaNB7ik1+dQuITQzjsUL2b0+Ul5Z5wUBMptCZ9XE4erv/bxk85oa1lTnuN
DzRN9TJW9+4urrhukNd2m91IHaoFEB2w3aiVqSmd44o8eUSSuzmxk0jefTPj1PGB
+a68S5NnAECDoAkBI1UgD+8fl64LswrnM4IMGsUwkMkPLhdfbFqQlMtfdpF9suG2
6PMop3iGLje68i2NagQ0EyQXbikuyS+UtBIZmITH48EKxbWkxcqIRPG17qzXc4fD
E1knlO0UJcJvnCSkvoSfTCtPXkbZLuY4wH1/x8Egc2P1JMdtPDtO1WLOOVFPLKtF
3H0yfrhQXauduRKm8nIdL6r/P+XqHWVn7mFT3Ru8J1mRHxaiDL5eABCbDakjW1G7
Q0g2l0ofiWltTd86RkR4K3Rj/bwIhGTFIRME5KuIoJ9FSQU/TxIW7fdm7zURGCSb
eNcfq0AtYsJ1GUpgi5JkoR+SVX3O3fR/ZG3o0MPHTX2TRj/GY78=
=xxk8
-----END PGP SIGNATURE-----

--mJTsO83oiPiVLnLL--

