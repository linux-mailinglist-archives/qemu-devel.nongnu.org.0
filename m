Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109830E03D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:56:26 +0100 (CET)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LS4-0003x7-O8
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LOz-0001wk-MU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LOw-0007aQ-7e
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612371189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fv94UWc4KClQSMvRNbOSCuf8XSB3J4V1D81kKcqVZhA=;
 b=dVy7gFmu8yRjcxNT/l081+VPy7/1BIJStVIETqPZWtxnSGDmwIQVEhiFyWPt+NTnD8bD7a
 wf/ftUNHFIwpQ2euvcsVRzBFd2rBlE2cuDrX7dUd3ZOyxM6LvYZ3z05LtZsJ4c+pmQaZ3z
 TZ6RZ6TttKpoc+5tTXfi+Jmqy3MmO90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-e8tSnE_xMIesA2isp7jY6w-1; Wed, 03 Feb 2021 11:53:07 -0500
X-MC-Unique: e8tSnE_xMIesA2isp7jY6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5195F6D4E0;
 Wed,  3 Feb 2021 16:53:06 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D93E15D9E3;
 Wed,  3 Feb 2021 16:53:05 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:53:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: vu_dispatch locking should never fail
Message-ID: <20210203165304.GI74271@stefanha-x1.localdomain>
References: <20210129155312.595980-1-groug@kaod.org>
 <20210203155934.GB3307@redhat.com>
 <20210203170857.626224b0@bahia.lan>
 <20210203162915.GD3307@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203162915.GD3307@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="81JctsDUVPekGcy+"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--81JctsDUVPekGcy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 11:29:15AM -0500, Vivek Goyal wrote:
> On Wed, Feb 03, 2021 at 05:08:57PM +0100, Greg Kurz wrote:
> > On Wed, 3 Feb 2021 10:59:34 -0500
> > Vivek Goyal <vgoyal@redhat.com> wrote:
> >=20
> > > On Fri, Jan 29, 2021 at 04:53:12PM +0100, Greg Kurz wrote:
> > > > pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
> > > > deadlock condition is detected or the current thread already owns
> > > > the lock. They can also fail, like pthread_rwlock_unlock(), if the
> > > > mutex wasn't properly initialized. None of these are ever expected
> > > > to happen with fv_VuDev::vu_dispatch_rwlock.
> > > >=20
> > > > Some users already check the return value and assert, some others
> > > > don't. Introduce rdlock/wrlock/unlock wrappers that just do the
> > > > former and use them everywhere.
> > > >=20
> > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > ---
> > > >  tools/virtiofsd/fuse_virtio.c | 42 +++++++++++++++++++++++--------=
----
> > > >  1 file changed, 28 insertions(+), 14 deletions(-)
> > > >=20
> > > > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_v=
irtio.c
> > > > index ddcefee4272f..7ea269c4b65d 100644
> > > > --- a/tools/virtiofsd/fuse_virtio.c
> > > > +++ b/tools/virtiofsd/fuse_virtio.c
> > > > @@ -187,6 +187,24 @@ static void copy_iov(struct iovec *src_iov, in=
t src_count,
> > > >      }
> > > >  }
> > > > =20
> > > > +/*
> > > > + * pthread_rwlock_rdlock() and pthread_rwlock_wrlock can fail if
> > > > + * a deadlock condition is detected or the current thread already
> > > > + * owns the lock. They can also fail, like pthread_rwlock_unlock()=
,
> > > > + * if the mutex wasn't properly initialized. None of these are eve=
r
> > > > + * expected to happen.
> > > > + */
> > > > +#define VU_DISPATCH_LOCK_OP(op)                              \
> > > > +static inline void vu_dispatch_##op(struct fv_VuDev *vud)    \
> > > > +{                                                            \
> > > > +    int ret =3D pthread_rwlock_##op(&vud->vu_dispatch_rwlock); \
> > > > +    assert(ret =3D=3D 0);                                        \
> > > > +}
> > > > +
> > > > +VU_DISPATCH_LOCK_OP(rdlock);
> > > > +VU_DISPATCH_LOCK_OP(wrlock);
> > > > +VU_DISPATCH_LOCK_OP(unlock);
> > > > +
> > >=20
> > > I generally do not prefer using macros to define functions as searchi=
ng
> > > to functions declarations/definitions becomes harder. But I see lot
> > > of people prefer that because they can reduce number of lines of code=
.
> > >=20
> >=20
> > Well, I must admit I hesitated since this doesn't gain much in
> > terms of LoC compared to the expanded version. I'm perfectly
> > fine with dropping the macro in my v2 if this looks better
> > to you.
>=20
> If you are posting V2 anyway, so lets do it. Agreed, we are not saving
> many lines where so why to use macros to define functions.

Nice. I also prefer the open-coded version because ctags won't be able
to interpret the macros :).

Stefan

--81JctsDUVPekGcy+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAa1PAACgkQnKSrs4Gr
c8h33Af9Gb1QQjmbLKyNffQLFuq7eJH7OEI+ZKHhXlbD7pHToGM19qQb36S1uhYD
+91Kx2m3wW+fvZpBtVZlBr/PVfdyAgt6+O1LPQa+ENGMbSDu1vj4p4mJPQ6maLsY
qJa7cefphz991VC6gxcCwi30Kkl7HigkydWeuFj/KTxyrxrIcHVqzaDh2LcTxBhM
a0Rs7Q2gsQKIUOj6GDbvV090ufwBUG8lHFIIGyOm2PZ80s7t1Y5sddoAnSROQTeJ
C+3yG9VzJilWpisF3lsyudJtajpAw23yRODn/Vgwx2DukxK/vB7nb2XELRSkJ7X4
ul2GhDRmS1VKLdhSeuyBBpqLImPXEA==
=M66M
-----END PGP SIGNATURE-----

--81JctsDUVPekGcy+--


