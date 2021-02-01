Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5330A7BD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:37:44 +0100 (CET)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YSd-0003Vh-FE
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YQ5-0001Xw-CZ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YQ3-0005nj-Oy
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:35:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612182902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V3i9qklopZax1KwJ6Ua0DsfqSwhPLoTUTuUZJCKCO/Y=;
 b=HIw/uIUNsToI28IyfnapsGhV+ILQfcoCV1clFe5/O+gpUYZm1Tg0JwU33+8TvNJFCMHfAn
 aURWOQ4PG2QV+CBcxhjyFGHfOTi7NIs9SFjYmX3KhSlxfL5jpAmBVNpE04tBo8L67DMiP9
 Rk/753R6N3nY68+kXkZ5vgqcL4KOnL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-oSdCoRwXPCWhuAZ0TjSZjQ-1; Mon, 01 Feb 2021 07:35:00 -0500
X-MC-Unique: oSdCoRwXPCWhuAZ0TjSZjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3E489CC23;
 Mon,  1 Feb 2021 12:34:59 +0000 (UTC)
Received: from localhost (ovpn-113-25.rdu2.redhat.com [10.10.113.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D4D5DA27;
 Mon,  1 Feb 2021 12:34:59 +0000 (UTC)
Date: Mon, 1 Feb 2021 13:34:58 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 1/2] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20210201123458.dmnl4ehjwmepdy3p@mhamilton>
References: <20210121170700.59734-1-slp@redhat.com>
 <20210121170700.59734-2-slp@redhat.com>
 <20210201120631.GA13157@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210201120631.GA13157@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lvt5zouokx62mact"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lvt5zouokx62mact
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 01:06:31PM +0100, Kevin Wolf wrote:
> Am 21.01.2021 um 18:06 hat Sergio Lopez geschrieben:
> > Some graphs may contain an indirect reference to the first BDS in the
> > chain that can be reached while walking it bottom->up from one its
> > children.
> >=20
> > Doubling-processing of a BDS is especially problematic for the
> > aio_notifiers, as they might attempt to work on both the old and the
> > new AIO contexts.
> >=20
> > To avoid this problem, add every child and parent to the ignore list
> > before actually processing them.
> >=20
> > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  block.c | 34 +++++++++++++++++++++++++++-------
> >  1 file changed, 27 insertions(+), 7 deletions(-)
>=20
> The patch looks correct to me, I'm just wondering about one thing:
>=20
> > diff --git a/block.c b/block.c
> > index 8b9d457546..3da99312db 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -6414,7 +6414,10 @@ void bdrv_set_aio_context_ignore(BlockDriverStat=
e *bs,
> >                                   AioContext *new_context, GSList **ign=
ore)
> >  {
> >      AioContext *old_context =3D bdrv_get_aio_context(bs);
> > -    BdrvChild *child;
> > +    GSList *children_to_process =3D NULL;
> > +    GSList *parents_to_process =3D NULL;
>=20
> Why do we need these separate lists? Can't we just iterate over
> bs->parents/children a second time? I don't think the graph can change
> between the first and the second loop (and if it could, the result would
> be broken anyway).

It's not strictly needed, but this makes the code more readable by
making our intentions clearer. To my eyes, at least.

Sergio.

--lvt5zouokx62mact
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmAX9XEACgkQ9GknjS8M
AjUBDw//aKmkroxWq1K+xXv0XUaLJjx9RMqGeQ0d5Kmtb3SPEcCR7SYsADuBev6P
/zGp6JNIpwabBC4RuuRoBsBsf4LzZYdV/thZF4hgmll8FxdENUS161Dc3D7dRRgI
J4txNJwj9GcckwoFtvnTD1AMzXgKcEuSxtHu4jpaMTC8Gzg0ajfxF5n0xPp2W4F4
YG4l8yl36jS9E3ZlT57GuLMPtp+XzxEIe5G+bdKHbxDJa61BI8tRLaVglOGfnpWu
eBbRMLsqCWFoeiT6WyEyCv3TUHjUpaB23X1xYhID821+EneMzDKLU14OXfz/QKt1
HAYmRTExF6cAq3LEV3NXIp6VpPS73pwDcIoa7dbEL925frdg0gCuXHmql96QfAJT
FRGobeHhtAeSpYxOXNbkjqH10XbTeUc2t8o1cRczkSssvkWGqyElhrhCj35ZTnQP
QVhF3D6HKQwEG23iF6qH8KFZN1mr9dL5Zz6WjZ2JFLy+BVSvu3GBzHZ7g1CFKQla
ZcDZYldlWRZqSqhLZlLuUIckv4oG3CSg2e4iYVZssCk8nVbMGSnsDhSUqPcc8JS7
YQbO3VNXTtF9sPt0Jiad/yqgPN8cZxFKBeDk04/E8eGqAuuaq/q7pDFPfSnT4PCC
bsHKS0nk619xHRDBQD4Kphudvkw+wbamLv26bdZx1A/DvvCgo5I=
=8GAu
-----END PGP SIGNATURE-----

--lvt5zouokx62mact--


