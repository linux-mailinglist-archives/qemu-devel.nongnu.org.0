Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95E346F26
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 03:00:20 +0100 (CET)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsol-0002H1-Vi
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 22:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsdw-00028q-2A; Tue, 23 Mar 2021 21:49:08 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53209 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsds-0007u8-ND; Tue, 23 Mar 2021 21:49:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rkN5Rvkz9sWS; Wed, 24 Mar 2021 12:49:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616550540;
 bh=9cel17Qs3AC9j6qARY0cKIsWf/4ELDJbgwZZpRYBr5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWqQloVyGPd9DBPRFYaLPflqEAWNyZtgZf+he+PKYy320G1ianHtoEkU5IPiwHb6F
 YGGjtyCAJKIleK9oUdq3gM0BdovqEJgYgZQE4J2FCrctEETcU2pb8qzW6qubh4cVPL
 /2qlbT3iz38uxhf77wXVlLJA2L/nCL9LlPdYyw9k=
Date: Wed, 24 Mar 2021 12:42:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 07/17] target/ppc: Disconnect hflags from MSR
Message-ID: <YFqY7zsmRHswtwjd@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-8-richard.henderson@linaro.org>
 <YFgUkS3iyr/k9/hE@yekko.fritz.box>
 <47d0bf1d-b423-4503-645a-0f293eb95b87@linaro.org>
 <YFkuRwTMdauBTSHT@yekko.fritz.box>
 <77f791b0-ae68-a646-c38d-484fc0d96961@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W5nOkZhZn4PT+o3X"
Content-Disposition: inline
In-Reply-To: <77f791b0-ae68-a646-c38d-484fc0d96961@linaro.org>
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--W5nOkZhZn4PT+o3X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 11:04:03AM -0600, Richard Henderson wrote:
> On 3/22/21 5:54 PM, David Gibson wrote:
> > On Mon, Mar 22, 2021 at 10:55:46AM -0600, Richard Henderson wrote:
> > > On 3/21/21 9:52 PM, David Gibson wrote:
> > > > > +/*
> > > > > + * Bits for env->hflags.
> > > > > + *
> > > > > + * Most of these bits overlap with corresponding bits in MSR,
> > > > > + * but some come from other sources.  Be cautious when modifying.
> > > >=20
> > > > Yeah.. I'm not sure "be cautious" is enough of a warning.  The exact
> > > > value of some but not all of these flags must equal that for the
> > > > corresponding MSR bits, which is terrifyingly subtle.
> > >=20
> > > Fair.  How about, for the comment here, "This is validated in hreg_co=
mpute_hflags."
> > >=20
> > > > > +    /* Some bits come straight across from MSR. */
> > > > > +    msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
> > > > > +                (1 << MSR_DR) | (1 << MSR_IR) |
> > > > > +                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
> > >=20
> > > Here, and in every other spot within this function where we manipulat=
e msr_mask,
> > >=20
> > >      QEMU_BUILD_BUG_ON(MSR_LE !=3D HFLAGS_LE);
> >=20
> > Seems reasonable.
>=20
> Hah.  Your paranoia was well-founded.  Typo in HFLAGS_PR.  :-)

Heh :).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W5nOkZhZn4PT+o3X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBamO8ACgkQbDjKyiDZ
s5IZRRAAiz/DlUVzPYcs8r7CIKcrU4/daDZVkrnehSkG7ySqkppTNaagKQq/mI/Q
oedDVdMUdtGqD3mKMFmysjoWXgqasiORvZ+wHzjRC27Rd9i4JLbvFGdiQmpzcFXA
i6pPUGmDt5QO8k/h6ipeKPeqq0wRYRNqgnEYTc91YdS6pA9YsKHX916REhrSb5AF
pwiLMPctUwbyRQtHQ762lfJ3xJMHzMRkF1gZETvR9ov3lF4MieDArjsIrD5xKuaw
kWjqkrCdMf6m8wJ5jvxhPDs+cKhNr9BGhZtGdOdvDQc+eiP5XqVr8t5veQvSYplS
gvDht64uiW/Z6X2n6cf08GYuntVzit2e8+L3/euqyBByYsZQqRqOLLzvOlpgUL2k
bUUuhFV8ph5GDpiL8SpQBgIetlGYq4c8/6S8ELfXs9h8xoZRNkkv9zTwHett9+YE
njXYwimygnA2a57DqfXI3wpk7rSy6tcJz7mMTIhH0qtpZHjj0bE0zx4FYlcmBZLL
zeQ9MKAHcE33rAShRdjsmA1Puz6Myp4/OK4CwUOkv+lqrS1DDnvgmfjkVdOQp231
bgrncptKucXALe6joti2SJ550bgyv6DVHeL90P6sY0eiSNqhfR6ut3DCeV6tvAiO
BZvk6ZXynVe/uLWpCzd4znaum8lpTqltcdxtzragXkyIl8zO1Ec=
=KrL9
-----END PGP SIGNATURE-----

--W5nOkZhZn4PT+o3X--

