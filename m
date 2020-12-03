Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C92CD4B4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:40:04 +0100 (CET)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmxu-0004tb-V0
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkmw1-0003o7-7E
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkmvz-0008Hg-Mp
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606995483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eRHnNZO59wpdkbQMVn0kD+5Q8Up6dtzgDRjOgxQwgsw=;
 b=NCPFbYo5nQ+eHD5gVNgrJL3J4NHLlIDq36bi01WIjkG+sJQHmNJ3wWFJQKOix961nfgA/5
 xya9Au0wtbNbi3pjRQWWXDlMYgDLumqhFaDU3eyEfk+L2mFLQsR0agHaTgZQhiM1LpCutT
 pRJyioQQut5cTSxr75DARuEwg22m5NI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-83vS2OgKNby7xlHWW38QjQ-1; Thu, 03 Dec 2020 06:37:52 -0500
X-MC-Unique: 83vS2OgKNby7xlHWW38QjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9688858192;
 Thu,  3 Dec 2020 11:37:50 +0000 (UTC)
Received: from localhost (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAFB95C1C2;
 Thu,  3 Dec 2020 11:37:43 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:37:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 2/4] contrib/vhost-user-gpu: avoid g_return_val_if()
 input validation
Message-ID: <20201203113742.GG689053@stefanha-x1.localdomain>
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-3-stefanha@redhat.com>
 <CAJ+F1CLrba5T02Dy1=dXSE4ye9rgHZ4r5S-mWwL-7UACeFLVuw@mail.gmail.com>
 <20201203095119.GA689053@stefanha-x1.localdomain>
 <CAJ+F1CLwvE+6BhhpDaufitOHbbYv9XDQ6Yh=iwYzzVheueXPmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLwvE+6BhhpDaufitOHbbYv9XDQ6Yh=iwYzzVheueXPmA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 02:26:08PM +0400, Marc-Andr=E9 Lureau wrote:
> On Thu, Dec 3, 2020 at 1:52 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>=20
> > On Wed, Dec 02, 2020 at 07:50:51PM +0400, Marc-Andr=E9 Lureau wrote:
> > > On Wed, Dec 2, 2020 at 7:27 PM Stefan Hajnoczi <stefanha@redhat.com>
> > wrote:
> > >
> > > > Do not validate input with g_return_val_if(). This API is intended =
for
> > > > checking programming errors and is compiled out with
> > -DG_DISABLE_CHECKS.
> > > >
> > > > Use an explicit if statement for input validation so it cannot
> > > > accidentally be compiled out.
> > > >
> > > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > >  contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > > b/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > > index a019d0a9ac..534bad24d1 100644
> > > > --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > > +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > > @@ -1044,7 +1044,11 @@ vg_get_config(VuDev *dev, uint8_t *config,
> > uint32_t
> > > > len)
> > > >  {
> > > >      VuGpu *g =3D container_of(dev, VuGpu, dev.parent);
> > > >
> > > > -    g_return_val_if_fail(len <=3D sizeof(struct virtio_gpu_config)=
, -1);
> > > > +    if (len > sizeof(struct virtio_gpu_config)) {
> > > > +        g_critical("%s: len %u is larger than %zu",
> > > > +                   __func__, len, sizeof(struct virtio_gpu_config)=
);
> > > >
> > >
> > > g_critical() already has __FILE__ __LINE__ and G_STRFUNC.
> >
> > I did this for consistency with the logging in this source file. The
> > other g_critical() calls in the file also print __func__.
> >
> >
> >
> I see, nevermind then. I gave rb anyway

Thanks! I checked now and don't see the function name printed by
g_critical() even though G_STRFUNC is captured in the header file:

** (process:693258): CRITICAL **: 11:30:18.210: test

Maybe only custom log handlers can display the function name?

So it seems the explicit __func__ approach is okay-ish :).

Stefan

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/IzgYACgkQnKSrs4Gr
c8it1AgAjsBcbdkdBkaidn4GObTaUnyR16+ojE9H14yVXxhg4xWb4APc++FrKRsZ
/Xq/nfboUUlOX05M6clj3Sthw35ed82EU3nq1GXDONEUBVvk9CDPOvCDdxszjy+m
7H2wSzmcS2WQlMvyJFEnUuKIJPlNpFVzgHxwfQX0be7QEQhPVxv59euK6wvDfV1T
jt3u1sa+r11J5UDegRsoaRPILOgE03f+UfOjJ9GzjAXLBFd48vArHywT86rHymQo
HT8O6WtjJUdiiyvNDCjMuHNtNmnhP2Br25z7/oAzh08SuuIwUUFvTORDpc1z/XLu
3De5Lqz2aNBO0oKDT85u4xulsE4ZTQ==
=tU79
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--


