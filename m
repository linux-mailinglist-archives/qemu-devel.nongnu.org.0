Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2503BB6B3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 07:16:23 +0200 (CEST)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Gxy-0001e8-7g
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 01:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Gut-0000kP-4h; Mon, 05 Jul 2021 01:13:11 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Guq-0006kh-V0; Mon, 05 Jul 2021 01:13:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJDNF19v8z9sX1; Mon,  5 Jul 2021 15:13:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625461981;
 bh=HfqhgnoniodDVHzB84ZWq6m0GnPOxGx0XaIwZRahSqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NkQ90/XLD8r4sTI+bLFhxmNiArlFD+3SKyMopJJ+2Gj/gONrU7VxkfVLbykitEn9T
 3cDRMlm5whyMxJw4ur4XDCF7LD5Wvk3j6Wp3nML5AOJZg2xx2Lvv3iRTxRz/qErZ4F
 bicOpQfhSP0XsNPJ4E8o52o7der+KEVU/w67iIdM=
Date: Mon, 5 Jul 2021 15:12:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS L1D
 cache flush bits
Message-ID: <YOKU2PrA/ic1/7JX@yekko>
References: <20210615044107.1481608-1-npiggin@gmail.com>
 <YM24TwDm3SlCDiVu@yekko> <1624155035.72mw8haex4.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8uAsljXXs+rFwubQ"
Content-Disposition: inline
In-Reply-To: <1624155035.72mw8haex4.astroid@bobo.none>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8uAsljXXs+rFwubQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 20, 2021 at 12:22:53PM +1000, Nicholas Piggin wrote:
> Excerpts from David Gibson's message of June 19, 2021 7:26 pm:
> > On Tue, Jun 15, 2021 at 02:41:07PM +1000, Nicholas Piggin wrote:
> >> There are several new L1D cache flush bits added to the hcall which re=
flect
> >> hardware security features for speculative cache access issues.
> >>=20
> >> These behaviours are now being specified as negative in order to simpl=
ify
> >> patched kernel compatibility with older firmware (a new problem found =
in
> >> existing systems would automatically be vulnerable).
> >=20
> > I don't really understand all the consequences of that.  What I need
> > to know here, is if it's safe to unconditionally enable these bits,
> > even for older machine types.
>=20
> Unconditionally on the condition that the cap is set to fixed?

Sorry, poor phrashing.  I meant it's not conditional on the machine
version, which means we are technically changing behaviour for
existing machine versions.  That's a big red flag, though there can be
circumstances in which it's justified.

> It
> should be fine AFAIKS. If the older machine types are running on
> older hardware that acutally does require the flush, then the fixed
> cap would cause the existing flush bit to be clear and the kernel to=20
> skip the exit flush, so that would be broken already. Does that sound
> right?

Urgh.  The fact that some bits have different sense to others is doing
my head in.

> One thing I'm not entirely clear on is:
>=20
> All these (entry/exit/uaccess) flush requirements stem from basically=20
> the same underlying mechanism, so that gets resolved in hardware and
> software can stop doing all of them. That's fine, but it was decided to
> add different bits to the hcall basically to have flexibility let's say
> in case a new issue is discovered one day that requires just the uaccess=
=20
> flush, for example.
>=20
> In that case we can just set the right combination of bits in firmware,
> and kernels in the field will just do the right thing, and we don't
> need to do all the other flushes that would be worse for performance.

Right, but that doesn't work for qemu guests.  Qemu needs to advertise
things so that guests will do all the things that are necessary not
just on this host, but on any host we might be migrated to.

> How would that work with qemu? I assume we don't have a cap per bit in=20
> the hcall, but rather a cap per vulnerability class, so you would set=20
> that new class as vulnerable, and this code will have to translate those
> and work out the correct combination of bits to set in these fields.

Something like that, yes.  Actually doing so can be pretty complicated
because of the need to have a consistent migration domain.

> If I'm way off base or there's a better way to do it, that could mean
> this patch needs to be done a different way.

I think we need to find a time to discuss this (Slack or call or
whatever), so you can step me through this bit by bit.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8uAsljXXs+rFwubQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDilNYACgkQbDjKyiDZ
s5JIGhAA2z9EC3ve6zSFVhvGM2yX2Z01gJCBgaSTL380TyONaEsI46hnsaz0XwCK
zrN6kP8bk5+u0HYvzIKDtHplh8CnvS8GA+ko5CnXEwAY17OJ2tklNP6tZ3wA1GeQ
NLs8fYgYXdbKSuzZYFgn+y+vHcoM5fXbaRjnxzdvxGP7up2dxWEAyoFHW6EPqSbh
hCxSMoSfldxwKpEE3H21bxkO58xBujB63Q/181up4yymrWWZF/t+yFTWifvGBvNd
1twgO/2qOpXgGad55+HSVcLgN6WfFsHX6I3uy9Yb9kvQwgUUQBzVy/NWFZUjTCK9
CJukK3gezQyyGQJy3eN6xkZxdb6z7pp+gtj4A+s235WLIsL+x0G/6aFK9XTfupGv
3BMw/UXbW+AvsMZ3F0WQWBlld+6SKVUZgmIM3pVi9kGNuuC5SoMK1QyJT7i/No2a
4apedCloNQ49h+ilXMMZH0UJoUaB0ROOHJ1uhQZreKW8lJEZ00JmmwT2PJ9SmX0V
2tzBh39sRGlGcoBufJ6BoTWuW0+KKFRPhM9YubRq+okakr8a0TueGrvuktFuBSRP
TUHEYG4ngeFRGpxjKqZpgJdkMTE1eTbRWVWTT9EYxLNLubrhb7VlFdD2/Tp7ytgV
T5kQUJu+vJ3U+BdAbYgo1ZEG0KbHUD4mIQmAYU+4vYzAEpjGsKM=
=LELH
-----END PGP SIGNATURE-----

--8uAsljXXs+rFwubQ--

