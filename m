Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644D2F9A50
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:03:27 +0100 (CET)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OZS-0001CN-8D
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1OO0-0001U1-KS; Mon, 18 Jan 2021 01:51:36 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44735 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1ONq-000457-K9; Mon, 18 Jan 2021 01:51:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DK2WD22T7z9sRR; Mon, 18 Jan 2021 17:51:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610952680;
 bh=7NMMFuxqR/oqmJmRsYnvF4j5LoauvHYx94eOpc6vSaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mr7B7qJ1AkiT3ZWIpzqj5zv/ALvvjFMKgzxYJMu6vxfdph1hcJmItCSd1SXOoSrT8
 dW/ieNdckTW+7NF4worGTgay8tTgnOoFswsAWAHOSEOZBlXRv8HEpC3mkvVj8/PzAY
 UHiznGMwupWZj9rQzcwJ8vlHP8egzonVAigGJqV0=
Date: Mon, 18 Jan 2021 17:31:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Improve handling of memory unplug with old guests
Message-ID: <20210118063137.GJ2089552@yekko.fritz.box>
References: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
 <20210113012058.GJ435587@yekko.fritz.box>
 <20210113180127.563126ad@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8jNwmpfkpox/fiJK"
Content-Disposition: inline
In-Reply-To: <20210113180127.563126ad@bahia.lan>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8jNwmpfkpox/fiJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 06:01:27PM +0100, Greg Kurz wrote:
> On Wed, 13 Jan 2021 12:20:58 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Jan 08, 2021 at 06:31:27PM +0100, Greg Kurz wrote:
> > > Since commit 1e8b5b1aa16b ("spapr: Allow memory unplug to always succ=
eed")
> > > trying to unplug memory from a guest that doesn't support it (eg. rhe=
l6)
> > > no longer generates an error like it used to. Instead, it leaves the
> > > memory around : only a subsequent reboot or manual use of drmgr within
> > > the guest can complete the hot-unplug sequence. A flag was added to
> > > SpaprMachineClass so that this new behavior only applies to the defau=
lt
> > > machine type.
> > >=20
> > > We can do better. CAS processes all pending hot-unplug requests. This
> > > means that we don't really care about what the guest supports if
> > > the hot-unplug request happens before CAS.
> > >=20
> > > All guests that we care for, even old ones, set enough bits in OV5
> > > that lead to a non-empty bitmap in spapr->ov5_cas. Use that as a
> > > heuristic to decide if CAS has already occured or not.
> > >=20
> > > Always accept unplug requests that happen before CAS since CAS will
> > > process them. Restore the previous behavior of rejecting them after
> > > CAS when we know that the guest doesn't support memory hot-unplug.
> > >=20
> > > This behavior is suitable for all machine types : this allows to
> > > drop the pre_6_0_memory_unplug flag.
> > >=20
> > > Fixes: 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> >=20
> > Applied, sorry it too me so long.
> >=20
>=20
> No problem. Any estimate for your next PR ?

Intending to do it tomorrow (Tuesday 19th).

>=20
> > > ---
> > >  hw/ppc/spapr.c              |   24 +++++++++++++-----------
> > >  hw/ppc/spapr_events.c       |    3 +--
> > >  hw/ppc/spapr_ovec.c         |    7 +++++++
> > >  include/hw/ppc/spapr.h      |    2 +-
> > >  include/hw/ppc/spapr_ovec.h |    1 +
> > >  5 files changed, 23 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 2c403b574e37..6c47466fc2f1 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -4048,6 +4048,18 @@ static void spapr_machine_device_unplug(Hotplu=
gHandler *hotplug_dev,
> > >      }
> > >  }
> > > =20
> > > +bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr)
> > > +{
> > > +    return spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT) ||
> > > +        /*
> > > +         * CAS will process all pending unplug requests.
> > > +         *
> > > +         * HACK: a guest could theoretically have cleared all bits i=
n OV5,
> > > +         * but none of the guests we care for do.
> > > +         */
> >=20
> > Hrm.  This is pretty ugly - I thought we had a better canonical way of
> > determining if CAS had already happened this boot, but it appears
> > not.  I don't want to delay this patch, since it is an important fix,
> > but it would be nice if you could do a later cleanup to have a nicer
> > way of detecting CAS-hasn't-happened.
> >=20
>=20
> Yeah, I fully agree this is ugly. I'll try to find something nicer later.
>=20
> Thanks for taking it anyway !
>=20
> Cheers,
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8jNwmpfkpox/fiJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAFK0kACgkQbDjKyiDZ
s5L4JQ/+L0B4sn/KZQ3S4zA1FT/1hKgpXNERpLQJi9zno2dUeFB0ROIV++ZCNq87
qXCt9zjpPvpItD9lBS1Jxf57rayurFsbqsFoudggY8gw7awF02lWIraTOuBHaPe5
+lwJjB9DZ/ZQmDetagUkUTukzt3QWrhLITFLOR/yTbrpVA995dPizlBND/mC62GY
BdyxWGjcNDofzq3MUhIbYF0NmoDeeZ+acstmj9GLyYG1wM/g2EWTiby7Zmn9Q5+U
wmVcwtV9wQa0GTCjV5uHy/RJQIglzAwwndaKfY7Ab+x/KYZyRnL1Zzvl40gdsI4z
cxjF6fwiGrfWV4qbXuxKswuYVLZH3ZoDIMC0h8sLkJIpTlDmtVWrrLFaKNuzkb6H
tIBs/Plzk6uSoT1Si0O1BYDvgOZ15TNr505pmY4yyvLDPhLXt0nPN731noxhrSnv
tvawqX4JLS/e7WoQ5cbFpH88l8MKQaMpUMtYsOXJBvMP3lR1ZQf7L3IojCXr0WZo
3xC9nijs1GQaAPX/LdEfeFeyi2rzXnjLis7ZViljz1Qi2AkUxxlXcn/CLD4mCPH3
LPMygy1TsNFXSVaPZyQGSrL+OSQdxbxgh/JQDT3D1oO92v7Igp9FtlA0djVQJZ9n
YlwZOhGoljLB+fz9in5w4Eo4zW5V+gJK1sj5zKvZnuU84YaHbTY=
=8SM9
-----END PGP SIGNATURE-----

--8jNwmpfkpox/fiJK--

