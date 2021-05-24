Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6EE38E07D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:52:37 +0200 (CEST)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2Zw-0001ov-Ba
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2Wy-00067r-2l; Mon, 24 May 2021 00:49:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51355 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2Wv-0008IY-N2; Mon, 24 May 2021 00:49:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpPrP46Ypz9sW1; Mon, 24 May 2021 14:49:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621831765;
 bh=RUT6WxFjiLp23SRdcHAinkEy/mGtWxSEuaI7jcEV15o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dbc+9OGHtok1p7NEu3hA89lQOcqq8VOIz7Z4F73VOvUkKkWGoTwfyKnPPXWC/2LSB
 FseiDyg2MNY0+cBtZQCBNYPSnrJMTTeHwLWpTgT7hS/8fD/OESEM//i1X+1yryrfG0
 UozhKW3rhc2cCt6W7nJUpIcdFoZE5JJZwRaDmRsg=
Date: Mon, 24 May 2021 14:49:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: Implement ISA v3.1 wait variants
Message-ID: <YKswTHP6Yrop3joJ@yekko>
References: <20210517024651.2200837-1-npiggin@gmail.com>
 <YKIBlzRg3oicnKIO@yekko> <1621234864.zkbj7ifbxd.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EgdHp8Prkj6t+B4N"
Content-Disposition: inline
In-Reply-To: <1621234864.zkbj7ifbxd.astroid@bobo.none>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EgdHp8Prkj6t+B4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:19:06PM +1000, Nicholas Piggin wrote:
> Excerpts from David Gibson's message of May 17, 2021 3:39 pm:
> > On Mon, May 17, 2021 at 12:46:51PM +1000, Nicholas Piggin wrote:
> >> ISA v3.1 adds new variations of wait, specified by the WC field. These
> >> are not compatible with the wait 0 implementation, because they add
> >> additional conditions that cause the processor to resume, which can
> >> cause software to hang or run very slowly.
> >>=20
> >> Add the new wait variants with a trivial no-op implementation, which is
> >> allowed, as explained in comments: software must not depend on any
> >> particular architected WC condition having caused resumption of
> >> execution, therefore a no-op implementation is architecturally correct.
> >>=20
> >> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >=20
> > Logic looks fine.  There is no test on the CPU's features or model
> > here, though, so this will change behaviour for pre-3.1 CPUs as well.
>=20
> Huh. 2.06-2.07 has very similar WC bits as 3.1, but 3.0 removed them
> and made them reserved. I should have looked back but I'd assumed
> they weren't there either.
>=20
> Existing code treats WC !=3D 0 as invalid on pre-3.0 processors AFAIKS,
> so that's not quite right for 2.06-7 (they should look more like 3.1).
>=20
> But before that it looks like it was just wait with no WC field.
>=20
> > What would invoking these wait variants (presumably reserved) on
> > earlier CPUs do?
>=20
> Prior to 2.06, it looks like there is no WC field, and so they should=20
> generate a program check. So that just leaves the incorrect program
> checks for 2.06-7, something like this should do it:
>=20
> -GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300),
> +GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA206),

Ok, can you update with such a change, and put some of this
explanation of the history in a comment.

> 2.06-3.1 should all be fine with this patch, AFAIKS they all have words=
=20
> to the effect that WC !=3D 0 is subject to implementation defined=20
> behaviour and may be treated as a no-op or not implemented.

Ok.  Note that we do try to match specific CPU behaviour, not just the
architecture, although the architecture is obviously more important.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EgdHp8Prkj6t+B4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrMEwACgkQbDjKyiDZ
s5IUKw/6ApNqNRRfFxndRNMuaXbZtsqpe52wcgr+AfLvmUHpdZ4NdLI1121GFuHM
RiVAUl6hJx/tQCDainfdsSTQYl0Vtwng2kFZKN2s9IKLs9gkLPGE3s7dZjEB5+zu
KMtiN3cgHw9hTEpOI6ITaBPDOO9v6IhF2+CRUc6sx83JaZdT3QCat7Me1c51ePUK
YWoHlv02zpdvmsKgWk+1hLF4nPSLepLkInvqpuZrITEC7mAS8fjEA0XSD7f5fke8
zc0UhkUEMrzHBMs8zMn+Selg8ilRqXW+9HNTxVUZrOIl9c3NgLgxs7bF6Bq22Lzw
QN2A9nTPNNv0JgpWnLUg8nnFNGZEKFDij3VLBflmRueRaPPoOcMKg6J9q4ft4ILg
RmE7lyX1gE7+3vD/sstSWTfXnCciwc02rVyEzag9CN/+YRtoPc8Kzjl6NBhhvwpI
C7v0QjKExHDK6TntAFsZXf0UXJDnw381stA+3YMGpGzZ5j5j1dPn4+Tfmm7bR3Nl
Bf5lU1ssw1lbLKgSmZ52MjtTxf92h/hEpW9o13gQKdKpv7e/+JhUAXsZhXAK1bLU
VSlP1czJHA8CuJYL4nJfcz0EMQS14qflznNhsvlywZI3TRLuKSSDfuB7LqOmGiuB
FGNG7JmfitMFTSwrLB/ZW7yNFQIWtq1rYFxYXG18xw6U7frBRvo=
=tUJf
-----END PGP SIGNATURE-----

--EgdHp8Prkj6t+B4N--

