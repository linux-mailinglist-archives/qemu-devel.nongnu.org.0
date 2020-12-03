Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557DD2CD2F7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:54:41 +0100 (CET)
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklJw-0000bM-Cr
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kklHv-0007YU-M6
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kklHr-00058A-8j
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606989150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ypGNHbrp2fbovbGfvfo2LfnFtVDijM531tY5Ob2OkO0=;
 b=DmhKpX38gSHl6vBP6TX0cz8piZ4B+elA/OYmTCq2gk301AOMYXNM9rSIQ3eIIupkLGo9je
 Fs6qXRQtiuPQ+hdQJHsi4YmJnrS7fIuXA1ecN7BCuRss7CEwazpDQMJIW9DwUTu1dmDE8x
 4ay0e4IpM21bL3LyJxEecoRIZybtWtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-G2Gla2RrP_y2ApFx6RNHUg-1; Thu, 03 Dec 2020 04:52:29 -0500
X-MC-Unique: G2Gla2RrP_y2ApFx6RNHUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB663100C68B;
 Thu,  3 Dec 2020 09:52:15 +0000 (UTC)
Received: from localhost (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8624A5D9D7;
 Thu,  3 Dec 2020 09:52:15 +0000 (UTC)
Date: Thu, 3 Dec 2020 09:52:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 3/4] contrib/vhost-user-input: avoid g_return_val_if()
 input validation
Message-ID: <20201203095214.GB689053@stefanha-x1.localdomain>
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-4-stefanha@redhat.com>
 <CAJ+F1C+O-tQDhKvaYnqwHzkWH1Sj+RyVXA0R64Ykga6LPorU7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+O-tQDhKvaYnqwHzkWH1Sj+RyVXA0R64Ykga6LPorU7g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 07:51:49PM +0400, Marc-Andr=E9 Lureau wrote:
> On Wed, Dec 2, 2020 at 7:27 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>=20
> > Do not validate input with g_return_val_if(). This API is intended for
> > checking programming errors and is compiled out with -DG_DISABLE_CHECKS=
.
> >
> > Use an explicit if statement for input validation so it cannot
> > accidentally be compiled out.
> >
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  contrib/vhost-user-input/main.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/contrib/vhost-user-input/main.c
> > b/contrib/vhost-user-input/main.c
> > index 6020c6f33a..1d79c61200 100644
> > --- a/contrib/vhost-user-input/main.c
> > +++ b/contrib/vhost-user-input/main.c
> > @@ -212,7 +212,11 @@ static int vi_get_config(VuDev *dev, uint8_t *conf=
ig,
> > uint32_t len)
> >  {
> >      VuInput *vi =3D container_of(dev, VuInput, dev.parent);
> >
> > -    g_return_val_if_fail(len <=3D sizeof(*vi->sel_config), -1);
> > +    if (len > sizeof(*vi->sel_config)) {
> > +        g_critical("%s: len %u is larger than %zu",
> > +                   __func__, len, sizeof(*vi->sel_config));
> > +        return -1;
> >
>=20
> g_critical() already has __FILE__ __LINE__ and G_STRFUNC.

Will fix.

Stefan

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/ItU4ACgkQnKSrs4Gr
c8gChwgAsVTWsDPtEoN1RjRFoKhY71pbrTHU8ySGAz8ODAs30ZwardeRJZCPJCZp
Ch9zEXbPSkbTbPyt/LwSg5XhxIYCo0xqQWvigGUJo2MQzE4Kizgh0SO2aQjUfWqO
GSQJpa3QbCNf4dtpLieQQ0wb626YSNf95mXxCdLHdt1juDSrRGVc0R8kHn8mK300
uvzhb6N4UoulV0qEXDmRbQTf9e6tXNcVysOl7FAZnPXanYm9+/tvMv2QYIFftNmF
b2sHQ2LazkD5qxQndu6PAYHqIQKT0n264zK9WC+wM2DEIrRl34nU5d8FYyjN7dc/
GgSNK7w/3TeMXRN+QH81aNxa1jgnTQ==
=Xmpd
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--


