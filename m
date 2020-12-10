Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B412D522C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:57:25 +0100 (CET)
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knD51-0008TE-PP
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knD26-0006y4-RJ; Wed, 09 Dec 2020 22:54:24 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:56603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knD23-0000IR-24; Wed, 09 Dec 2020 22:54:22 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs0Qs6nZmz9sWK; Thu, 10 Dec 2020 14:54:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607572453;
 bh=Tf/PnAYOxZF9afMLct/7DlqXTND19BvHvIbbrh/zD78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FvsEFdL8c4gQNoe0esxP/yA2gIB1HxOdV62zbHkY97oV6MVeWoa9CsHljrhpK0MYe
 o6IpWMnQfl8zUTPE68B8dTJy2qkfS7qacXefPcMwi8kddVY6P/80S2rszHEr4tMBBz
 JtCovG5xuiZGQLSUHo9wbYYx7O5siqvwJ8qYjgiM=
Date: Thu, 10 Dec 2020 14:38:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0] spapr: Allow memory unplug to always succeed
Message-ID: <20201210033844.GL2555@yekko.fritz.box>
References: <20201207133704.952459-1-groug@kaod.org>
 <20201208043004.GE2555@yekko.fritz.box>
 <20201208100609.5fcc604a@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oY1uq2ONqt5kuovO"
Content-Disposition: inline
In-Reply-To: <20201208100609.5fcc604a@bahia.lan>
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


--oY1uq2ONqt5kuovO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 10:06:09AM +0100, Greg Kurz wrote:
> On Tue, 8 Dec 2020 15:30:04 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Dec 07, 2020 at 02:37:04PM +0100, Greg Kurz wrote:
> > > It is currently impossible to hot-unplug a memory device between
> > > machine reset and CAS.
> > >=20
> > > (qemu) device_del dimm1
> > > Error: Memory hot unplug not supported for this guest
> > >=20
> > > This limitation was introduced in order to provide an explicit
> > > error path for older guests that didn't support hot-plug event
> > > sources (and thus memory hot-unplug).
> > >=20
> > > The linux kernel has been supporting these since 4.11. All recent
> > > enough guests are thus capable of handling the removal of a memory
> > > device at all time, including during early boot.
> > >=20
> > > Lift the limitation for the latest machine type. This means that
> > > trying to unplug memory from a guest that doesn't support it will
> > > likely just do nothing and the memory will only get removed at
> > > next reboot. Such older guests can still get the existing behavior
> > > by using an older machine type.
> > >=20
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> >=20
> > Looks like this conflicts with something I've added to for-6.0
> > recently.  Can you rebase and resend, please.
> >=20
>=20
> I'm not quite sure what for-6.0 you're talking about. Despite
> you're recent announcement about moving to gitlab, it seems
> that the branch at github is the most up to date.
>=20
> gitlab:
> - HEAD is "xive: Add trace events"
> - Date: 26 Nov, 2020
>=20
> github:
> - HEAD is "MAINTAINERS: Add Greg Kurz as co-maintainer for ppc"
> - Date: Dec 4, 2020
>=20
> I've thus based this patch on github. Also, this is based on Connie's
> "hw: add compat machines for 6.0" patch...
>=20
> > > ---
> > > Based-on: 20201109173928.1001764-1-cohuck@redhat.com
>=20
> ... maybe I should have made it more clear than just
> mentioning the message id ?
>=20
> I think I'll just wait for Connie's patch to get merged and I'll repost a=
fter
> you've rebased ppc-for-6.0.

Sorry, I think I forgot to push the latest to either gitlab *or*
github.  I've pushed some new stuff now.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oY1uq2ONqt5kuovO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/RmEQACgkQbDjKyiDZ
s5KjphAAu87d3C859QhNY42I0u3EPLOqlVcksoOiJyZkfzam2PwXC9cOcghqzh3i
x4TfsHxEONZ3EgSr4riByzZxgXA73VjfrqBIxs8XGqZ4rSimFasF45zGXIaiHJbL
zi/v0u5OFajC0Y1vBSC+d62e8je5iTE5W98Ol0NyV46Vy5885x2zdGUulHAkMMGR
uQ1AzLtRPG76oTT1Ctr831aX7NKACwg55GMbD4MFWjdJle09b7ZSyvXmKcmHUipM
zBSi0DSLUoLYk+dm2JRqmroYzum1gZGS7UkbER5ANwCdYP+4wVGYSQf3mxp3SmnY
hgH+ZGKJWCZOf/KKfMssCdU1cMSykPT5omeGSHzPcAZaHenCsGve1WWKGXZ69KcF
3XKVfJMt3zwkChi/TieYqg6XezOEj4jGsGksa+N9C88gGbQLbjDDcpGN9m0E8QkQ
sWA6goRpFuO4pQfb7nc301m9rLlNghghlW2n/CsyEw9wd1pvNSMS3BaAYZYuYjxD
tCSK+XRcPYoK++C1VsgOQQ13+Gyc0EboPKb9oNsn8lu8fuPm/48k0X43t1tK63cz
dVVe/xVaGDvBvvTxx9d8HyQAp4RPVcTwbYmr9eIsBZR3P8ugMazGD7AgWghajAkB
z1/snDzP7n1pBIJCw/5YLFOzSw84eNeCVW04bgDT7BLfKJ3xDHs=
=pcP1
-----END PGP SIGNATURE-----

--oY1uq2ONqt5kuovO--

