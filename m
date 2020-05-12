Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41D1CEB8C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 05:35:51 +0200 (CEST)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYLhu-0006mb-5V
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 23:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jYLgu-0005lr-F0; Mon, 11 May 2020 23:34:48 -0400
Received: from ozlabs.org ([203.11.71.1]:37721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jYLgs-0001pO-0a; Mon, 11 May 2020 23:34:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49Lk243c5Vz9sSg; Tue, 12 May 2020 13:34:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1589254476;
 bh=gGahroeaTim0FjgSz+hr+x3pqmkGlST3ysBXTZOj4C8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eGpmjp60MKBOlSy7y71kqpH7rYiRkAFDLpYzwgSAzv/TWOonx02PikaOhHjpkOfSE
 qIqqnmKenOZmnqzh2avK88BX9UMw1QTMqVopbqw5aYcdzjaXbgGvkx4JGA3O+sozQw
 AmjpRd5NrVegBx4KDJLLDKde/hRL2mwOnaNtMARw=
Date: Tue, 12 May 2020 10:00:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 0/6] target/ppc: Various clean-up and fixes for radix64
Message-ID: <20200512000020.GV2183@umbus.fritz.box>
References: <158887239173.1564424.16721638327458334129.stgit@bahia.lan>
 <20200511014426.GO2183@umbus.fritz.box>
 <20200511185521.1601dbde@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JEhTuUFIcUlI65CC"
Content-Disposition: inline
In-Reply-To: <20200511185521.1601dbde@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 23:34:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JEhTuUFIcUlI65CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 06:55:21PM +0200, Greg Kurz wrote:
> On Mon, 11 May 2020 11:44:26 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Thu, May 07, 2020 at 07:26:32PM +0200, Greg Kurz wrote:
> > > First three patches of this series are simple cleanups. The other
> > > ones fix some regressions introduced by Cedric's recent addition
> > > of partition-scoped translation.
> >=20
> > 1-5/6 applied to ppc-for-5.1.  I have some comments on 6/6.
> >=20
>=20
> As said in another mail, since patch 3 breaks build with gcc-9.3.1, I
> intend to send a v2 for the whole series later this week. I suggest
> you simply drop the patches you've applied for now.

Ok, done.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JEhTuUFIcUlI65CC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl655xIACgkQbDjKyiDZ
s5L9zw/+Kofkp5JFQgai8R8LX8jRUVop/zrDG3Zd+44QMBFVuAPCw2dePncetwcd
9c8fvjnZS5ne2nZbJZeHiZ85lw0JKXywNa3cmcoFD62+r0r/FzX3Lzlr49r+YpZW
NB/hsvglmB5L3HvxqClUlJ1mC1sdiNB8elCWNOy9SJuO+qsrvJzaszrCSIF+n+aB
SeKVjv6b/A3evMX8bdU7MQRkqaHA8iUsKcdOI7xmcfbN5WQLCDVMpSxCI0weJUtx
TjfTboHiNF2Xmara0BXhH2zTOSCIKwOtscdsIWwsleEp2PhsjVzUnwMd7kmYHYvT
d2YwbNs1XsM3o+gfp4/wkegEqokOns1TyYImncRfyFGqiUpGrtTh3BMSeuWRbuvm
+cM1dhR94jmYemNkuqiozqGcIZXIP4XUlZaMTlW0K2LujUUeJ8kY+sKtAY+ham1k
Bv+5a6MoNk+/es8vWHqsdu6+rq7j5NOq6Nv7zfJozWpULwMGfdIUCIdvz+6FvKAe
QfWDlJgUhYCR0AFhfN1rF9kgLBjNAAvX+k68ycsCq8tInsJo9YgLSkpZHKtoterY
ze1dpjmfjrfWYROlHa47keZ2jl5eUjjwp9oQELqZhQCWpcKDl1v4ZW/45mjO/3Pp
kavLqZu2CF90QeMAQVhlA7OyQ/jy/JLFnFPbwont/brftIU6TpE=
=N5nf
-----END PGP SIGNATURE-----

--JEhTuUFIcUlI65CC--

