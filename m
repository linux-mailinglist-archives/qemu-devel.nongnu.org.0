Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026030E0B4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:16:42 +0100 (CET)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Llh-0007EP-5i
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Lb3-0003vw-9X
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Lb0-0000zD-5Z
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612371936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRMTGQefPdMEeA7iSodUerqWQBAn7CQhJSfER/GrT2Q=;
 b=YHs7fZ41aKeXHlSjL63N65Yv1mN65FRM90s1rSalokI3HczYeMfvo/2K2SHM+CLCkvmxLn
 NjOE3QPe/jH05SH4wBCZxgKnbbV5XgoxdaadHXVJ6rjgBbRYTsKmJCgJkmmE8WtD392N3Q
 1cIv/3zQ2VmjmroLASFq0LvgtE7p50k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-t_W2HPmRNwSTkVe0BUdSTw-1; Wed, 03 Feb 2021 12:05:23 -0500
X-MC-Unique: t_W2HPmRNwSTkVe0BUdSTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E2E5BBEE2;
 Wed,  3 Feb 2021 17:05:22 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2745C10013DB;
 Wed,  3 Feb 2021 17:05:15 +0000 (UTC)
Date: Wed, 3 Feb 2021 17:05:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 3/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210203170514.GL74271@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-4-stefanha@redhat.com>
 <20210203152850.GA3307@redhat.com>
 <20210203170237.0c98f95f@bahia.lan>
 <20210203160858.GC3307@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203160858.GC3307@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zH41lVBEV8cLJnCl"
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Alex Xu <alex@alxu.ca>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--zH41lVBEV8cLJnCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 11:08:58AM -0500, Vivek Goyal wrote:
> On Wed, Feb 03, 2021 at 05:02:37PM +0100, Greg Kurz wrote:
> > On Wed, 3 Feb 2021 10:28:50 -0500
> > Vivek Goyal <vgoyal@redhat.com> wrote:
> >=20
> > > On Wed, Feb 03, 2021 at 11:37:19AM +0000, Stefan Hajnoczi wrote:
> > >=20
> > > [..]
> > > > @@ -1727,36 +1764,38 @@ static void lo_create(fuse_req_t req, fuse_=
ino_t parent, const char *name,
> > > > =20
> > > >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > > =20
> > > > -    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & =
~O_NOFOLLOW,
> > > > -                mode);
> > > > +    /* Try to create a new file but don't open existing files */
> > > > +    fd =3D openat(parent_inode->fd, name, fi->flags | O_CREAT | O_=
EXCL, mode);
> > > >      err =3D fd =3D=3D -1 ? errno : 0;
> > > > +
> > > >      lo_restore_cred(&old);
> > > > =20
> > > > -    if (!err) {
> > > > -        ssize_t fh;
> > > > -
> > > > -        pthread_mutex_lock(&lo->mutex);
> > > > -        fh =3D lo_add_fd_mapping(lo, fd);
> > > > -        pthread_mutex_unlock(&lo->mutex);
> > > > -        if (fh =3D=3D -1) {
> > > > -            close(fd);
> > > > -            err =3D ENOMEM;
> > > > -            goto out;
> > > > -        }
> > > > +    /* Ignore the error if file exists and O_EXCL was not given */
> > > > +    if (err && !(err =3D=3D EEXIST && !(fi->flags & O_EXCL))) {
> > >=20
> > > Can this check be simplified to.
> > >        if (err && (err =3D=3D EEXIST && (fi->flags & O_EXCL)) {
> >=20
> > I guess you meant :
> >=20
> >         if (err && (err !=3D EEXIST || fi->flags & O_EXCL) {
>=20
> This sounds correct. I forgot to take into account that if error is
> not -EEXIST, we still want to bail out irrespective of O_EXCL.

I thought about De Morgan's law too but found the OR expression is not
easier to read than the AND expression :(. If you prefer it written this
way I can change it though.

Stefan

--zH41lVBEV8cLJnCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAa18oACgkQnKSrs4Gr
c8g1rAf/XJtMnuMThrGmuMVWlc6cAhxTiwwyPYAb+CFiECa2hVjFaoX3paOxWkDG
8PPXQWvUVz1VaCX23CKsvAdX8QNW4RbjUwphBjHnDNkHGviLapu25ZmiNuGplKDx
WUUWMwE5BOujGc0rBnvwEP+H9A3Zvdg7SkMcrly97b3pnLCQ97DSmvCbt9dSPegc
S4CDg9Y04f9RZeL2t8rKW/G7cNM9RRgDjZzm62s58rLk1jVfn8k1qGyjuScwBezt
m/6UKYYV58uSUkbPb8zjXM5F0S1JdJ6RRpG2RW4hfyCg2vmUzAVbQk1IFUaBl/iq
2nEic75Xa+vOtvib6oiFfprvv/QyAg==
=CTe+
-----END PGP SIGNATURE-----

--zH41lVBEV8cLJnCl--


