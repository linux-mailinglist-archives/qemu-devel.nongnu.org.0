Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B400C34538E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 01:03:47 +0100 (CET)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOUWQ-0001aY-5q
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 20:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUU4-0000KJ-Q9; Mon, 22 Mar 2021 20:01:20 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41985 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUU1-0002u4-7G; Mon, 22 Mar 2021 20:01:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4BNR299Vz9sVb; Tue, 23 Mar 2021 11:01:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616457671;
 bh=+l2WxT8GsyC7ZQXrNP4h23ZeIHrVgAgDGnnofRJQq/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GwVTWr+GC4TW5ODvnqD76SJwHS+GnOCHAnmhSSpUJaD5zj80PCekV/zVcdLS2mT3H
 4eSmgELsm4nSKoNP6JznicocLfzfDoSB68dU5mZlfHidf42wAUwytF3YrtNxUt40PD
 lCn6l5lvRp6iNWv3SH5KuMBGv9KZ1mkQPyRKBLoo=
Date: Tue, 23 Mar 2021 10:54:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 07/17] target/ppc: Disconnect hflags from MSR
Message-ID: <YFkuRwTMdauBTSHT@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-8-richard.henderson@linaro.org>
 <YFgUkS3iyr/k9/hE@yekko.fritz.box>
 <47d0bf1d-b423-4503-645a-0f293eb95b87@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pB9jlxm9ieUNdybG"
Content-Disposition: inline
In-Reply-To: <47d0bf1d-b423-4503-645a-0f293eb95b87@linaro.org>
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pB9jlxm9ieUNdybG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 10:55:46AM -0600, Richard Henderson wrote:
> On 3/21/21 9:52 PM, David Gibson wrote:
> > > +/*
> > > + * Bits for env->hflags.
> > > + *
> > > + * Most of these bits overlap with corresponding bits in MSR,
> > > + * but some come from other sources.  Be cautious when modifying.
> >=20
> > Yeah.. I'm not sure "be cautious" is enough of a warning.  The exact
> > value of some but not all of these flags must equal that for the
> > corresponding MSR bits, which is terrifyingly subtle.
>=20
> Fair.  How about, for the comment here, "This is validated in hreg_comput=
e_hflags."
>=20
> > > +    /* Some bits come straight across from MSR. */
> > > +    msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
> > > +                (1 << MSR_DR) | (1 << MSR_IR) |
> > > +                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
>=20
> Here, and in every other spot within this function where we manipulate ms=
r_mask,
>=20
>     QEMU_BUILD_BUG_ON(MSR_LE !=3D HFLAGS_LE);

Seems reasonable.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pB9jlxm9ieUNdybG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZLkcACgkQbDjKyiDZ
s5IeNA//eSPglji/EcgxfKZpvFWR6FHofycTVWJBnwPvfpppVWxOQvbkiqwTyWni
gWnQt7J9Qkv3SwbEGXIhJXwC0lBJlTuayarRJleUOeHcI5VkCYqNux50yX/U0n71
4YTwot5kSdtWbiOEzMUFmUEZMVhrc7ijewMwfMIsuO9bJ0DAKbWGxWgxk/qXUZTs
3mdpFvjkDhKRue1nw6Rsz4wSv4qWxdN9sA6aD54YBX/yWWZoF8ASiIDVTcqSXWbz
hT/t0dk6gEPQ8GQO9/BL8sgD0YG2GvDe4mnq6TWTa30wVJKpMpDxP3AW0G2fwhCu
qD76leMAKsH8J1+h8gnfnU1Far8TEWnL6A3MTRZuHxv5NjYQaIv3iolKW7DGSwPe
KqwB/Unv+QOp7py4PDvk/2hToSg7zauZvvK+DYRENjzcP/slhZN8ci40gwyUhmlq
ZDQmcyw5Fw3/Xc6XoCee2SfhZzY3HQf/PWGJZD1bTfWL9Hz9cmnRg52fY/FoH+7z
EvHKYTjfqP5dkXwk6moQZ3dBzjh0AEaxnb1tpAR1+NZZWMPoCFnjyNiCAK1gk8x5
dqIjGcVQbWhJfiMEbqU20/AGCYn8mUnJuQcpQ48UM2QNgAXm6+o2gq7GqY75DmCk
mZ60bEaZm5Twn63DP1WtxUqUfuOo35jg/KBFQ8VlWgfTo0ZfYvs=
=cmmI
-----END PGP SIGNATURE-----

--pB9jlxm9ieUNdybG--

