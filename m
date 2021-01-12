Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84A2F26F9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:21:04 +0100 (CET)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBB0-00068y-JC
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzB9U-0005b3-Rn; Mon, 11 Jan 2021 23:19:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45145 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzB9R-00077N-B6; Mon, 11 Jan 2021 23:19:28 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFHQZ6XjQz9sjJ; Tue, 12 Jan 2021 15:19:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610425158;
 bh=/OAbBYrsu+cIkzUMN9z6syTbCCHg7FCLMHSSzvz7h6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dX4XKIR0NSQtnygnNNCyiItpkGyz6zTSnYjq3av25B6YbpzwbbdjtDgCc5nbjYAEX
 Q7D6wnxZukiIBIMMsYAk28RYUWSMV5618UUVJr5lpXNolQaLnlSGS+3+hhIu3IzQ4O
 qvficxhX8pw4u5X4bzEEcCgXj+MTmNzuKefISkU4=
Date: Tue, 12 Jan 2021 15:18:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/intc/ppc-uic: Make default dcr-base 0xc0, not 0x30
Message-ID: <20210112041805.GM3051@yekko.fritz.box>
References: <20210111213007.7381-1-peter.maydell@linaro.org>
 <20210112001257.GG3051@yekko.fritz.box>
 <alpine.LMD.2.03.2101120224300.11445@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OGW1Z2JKiS9bXo17"
Content-Disposition: inline
In-Reply-To: <alpine.LMD.2.03.2101120224300.11445@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OGW1Z2JKiS9bXo17
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 02:25:58AM +0100, BALATON Zoltan wrote:
> On Tue, 12 Jan 2021, David Gibson wrote:
> > On Mon, Jan 11, 2021 at 09:30:07PM +0000, Peter Maydell wrote:
> > > In commit 34d0831f38fd8 the ppc-uic device was added, with a dcr-base
> > > property. The intention was that the default value of dcr-base should=
 be
> > > the one that most of our boards need, so that in the common case they
> > > don't need to specify a property value.
> > >=20
> > > All QEMU boards with a UIC use a dcr-base of 0xc0, with the exception=
 of
> > > sam460ex which has four UICs and so puts them at 0xc0, 0xd0, 0xe0, 0x=
f0.
> > > So 0xc0 is the obvious right choice for the default dcr-base.
> > >=20
> > > The board code conversions in commits 0270d74ef88623505 (bamboo) and
> > > c5ac9dc64fa552a6 (virtex_ml507) assumed that default was 0xc0. Unfort=
unately
> > > the actual default in 34d0831f38fd8 was 0x30, by mistake, so the
> > > bamboo and virtex_ml507 boards were broken as they were converted
> > > away from ppcuic_init() (which always specifies the dcr_base property
> > > value explicitly).
> > >=20
> > > Set the default dcr-base to 0xc0 as was intended, fixing bamboo and
> > > virtex_ml507.
> > >=20
> > > Fixes: 34d0831f38fd8
> > > Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >=20
> > Applied, thanks.
>=20
> Will you take my series too?
>=20
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D223439

Huh.  I will now I've seen it.

> I've cc'd you but your DNS seems to not return an MX record most of the t=
ime
> still so these are bouncing back.

Ugh.  This is weird.  I know the DNS went out for a little while, but
some of your mails have come through, and AFAICT it's been working for
most people most of the time since that incident.  I'm wondering if
something on your side is negative caching for too long.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OGW1Z2JKiS9bXo17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/9IvsACgkQbDjKyiDZ
s5KPtA//WxqyL5iL4Pp24XaORpaiYfCbb3TrrMmsQpbxXlxnSDG97W6BPKcit9AL
GhpKkQiT58GYNXbtiLIEq1oACCRSrSVzbkgNutlUDD0RxbOhvTpYv6S1Bcb3XF3D
jyVDKMs62Iji9YPctYdxcYXEnFqcEamTzbpwruFt30D80B1UPrtNu4p7gwQdeggE
Mer0Jp3VQsvpn5HmsmYRt+ay6zFKauGEJoS70QNbnJ5yg+HmjcCzXzpBoikbGjsL
thnKAkck/rftvfzNFOtK2ufpzbFGRAJP8wDctLHCppR+VjMcs8GUzwa52OMCDDln
uesnke1cbXAclpib5o7WopRyy95UmbVWqSka/y/jM6ssNWywbXkFktOqqZusaKo6
C702q+rYCTKDcfgHRpVD19EAzqTAK0JirgrHTXg0wRCNY+VA9bQgjq3ov9vE3Ugj
w49kr330uS7tuPW+tx5EWz9me2e7xwtLB1wFPdNMVMAVxjAnMJPPdhHSBNMzvnUz
CxU4vWhJiK17hf4gCb9dTSQsssQ2d2YCZwQS5ccMR3riNv5wPbrLqKPrx9HSn8GO
6+ydCMaHt1mLiJscpxAFkl2AWMPcdfZjUGIxyzPucVAebixU5XuCY1pivNO6OUjh
gTA0wT7ECg5Ir9IVbCIlUeMQpGLxPK6k8w9i4gODQ5pc6IG33oE=
=egM+
-----END PGP SIGNATURE-----

--OGW1Z2JKiS9bXo17--

