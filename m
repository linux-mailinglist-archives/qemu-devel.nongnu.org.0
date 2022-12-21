Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746F6652B0A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7o1n-0003LR-VV; Tue, 20 Dec 2022 20:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p7o1f-0003Ef-Pa; Tue, 20 Dec 2022 20:36:08 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p7o1Y-0001yN-GL; Tue, 20 Dec 2022 20:36:07 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4NcGHC3Qhwz4xND; Wed, 21 Dec 2022 12:35:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1671586551;
 bh=hc/MkNbRs6HXfOsHgP/4CBoGgqRbaZEm2xDfRWEe8vY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQ0GOFne/xbNyB6x1iZteJCfD1GFLXawsqQiFYP2XBPszL8AqlZ9DAjxCmOk6VCtH
 6w0wyPawi4n7AUMwR3ZcvJRxvJfkGhatGG+bRPZgED54B8cckyCbHtcp4do6vk3fh9
 AgLzKpMXB6mfq5GPi13m9VEJPwhqy/QlNQdhAd7A=
Date: Wed, 21 Dec 2022 12:16:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Message-ID: <Y6JeXJn1qCkeIzuz@yekko>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
 <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6LrPJVJFL2btEcHt"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--6LrPJVJFL2btEcHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
> On Mon, 19 Dec 2022 at 06:35, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Fri, Dec 16, 2022 at 09:39:19PM +0000, Peter Maydell wrote:
> > > On Fri, 16 Dec 2022 at 19:11, Daniel Henrique Barboza
> > > <danielhb413@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On 12/13/22 10:51, Peter Maydell wrote:
> > > > Yes, most if not all accesses are being handled as "target endian",=
 even
> > > > though the target is always big endian.
> >
> > So "target is always big endian" is pretty misleading for POWER.  We
> > always define "TARGET_BIG_ENDIAN" in qemu, but for at least 10 years
> > the CPUs have been capable of running in either big endian or little
> > endian mode (selected at runtime).  Some variants can choose
> > endianness on a per-page basis.  Since the creation of the ISA it's
> > had "byte reversed" load and store instructions that let it use little
> > endian for specific memory accesses.
>=20
> Yeah, this is like Arm (and for the purposes of this thread
> I meant essentially "TARGET_BIG_ENDIAN is always defined").

Ok.

> > Really the whole notion of an ISA having an "endianness" doesn't make
> > a lot of sense - it's an individual load or store to memory that has
> > an endianness which can depend on a bunch of factors.  When these
> > macros were created, an ISA nearly always used the same endianness,
> > but that's not really true any more - not just for POWER, but for a
> > bunch of targets.  So from that point of view, I think getting rid of
> > tswap() - particularly one that has compile time semantics, rather
> > than behaviour which can depend on cpu mode/state is a good idea.
>=20
> I tend to think of the TARGET_BIG_ENDIAN/not setting as being
> something like "CPU bus endianness". At least for Arm, when you
> put the CPU into BE mode it pretty much means "the CPU byteswaps
> the data when it comes in/out", AIUI.

Hmm, I guess.  We're not really modelling down to the level of bus
byte lanes, though, so I'm not really convinced that's a meaningful
definition in the context of qemu.

> > I believe that even when running in little-endian mode, the hash page
> > tables are encoded in big-endian, so I think the proposed change makes
> > sense.
>=20
> OK. I still think we should consistently change all the places that are
> accessing this data structure, though, not just half of them.

Yes, that makes sense.  Although what exactly constitutes "this data
structure" is a bit complex here.  If we mean just the spapr specific
"external HPT", then there are only a few more references to it.  If
we mean all instances of a powerpc hashed page table, then there are a
bunch more in the cpu target code.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6LrPJVJFL2btEcHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmOiXkIACgkQgypY4gEw
YSIbTxAAtUxo8q8Ho8bHkxd+V4KhOskxNx22PrNJ47p+k6gErIgGpoV+XVrsFXGW
vD4Oy8F8ZZXxE/aPXKhVceFkZe/U+VRrd6+7Ki9R8Wp6z2bdwQ8APdk9tUDFdKuG
Qpu1Hkh/K0CcK3XuX2nBRSAVOn+x6cNCD8ZSFw8qYYbGvxYDfg3tv34y7uipZ12o
Rr8w/zxXWBCdrvT312s40vjQphzzbgHYfey3zHdrXfxGL2whS3FtSzpkQvk97DM2
XltzVWz5Dq5DT5cv2uSCagwuEvhH3lhHQ+QxaJm78ogCrido2hvIwxR8JW4ebF0Y
oK7Qz/EWDcKDDelOD/4frq6k7j7KsV0AiHTpqngP4TXixcUrv3CUQSfBr7+lM0uP
Ao8wp7INosKX8AANRHyyCp3Ecr8SOG/lfGjj3cYCJVn9I1XhObgHAkpeSsvk/PmX
+WXiRSz/TwM9NH0gb+4ylFxz0CijtSLrS+p+AuArxUnoQE1VAZkHCVH9pI93yjT8
1i/uOJIEsMKWxEZTYKNEaCRqMGn9acwNaSofdoaCNFsZYL1Wie4OtVwbmcsN1peH
S8nqJURDs+iB4JZFNq1lIQD2TmYf+vHriBTujN57yVx1oliAFo4mJ6MF787PJZHw
NgE3jHW5oA11vKRbey7fbUKN2/eczbNyE9RMaxzlP3bUVsxV6Pg=
=TJ9j
-----END PGP SIGNATURE-----

--6LrPJVJFL2btEcHt--

