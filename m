Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C390F307A61
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:13:29 +0100 (CET)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59vE-0005vC-E5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l59tW-00050N-PV
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:11:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l59tT-0000E5-Q8
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611850296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1fkEWeH14aNMpFwEXVbdXki5s4mPrVPzgYDFM92QU4c=;
 b=B8tB6TixhCiMVWKlw0AA6D+3AEEgITjiZ8bogrVuc+smheLwpKV33MN8Hel5hY8sycQftz
 YLHaHtlT8BLNz4ByYeDGUK0NS27QmddSqWTTHLEhE1mhVlw+bcVCQRZ+vjlgSGAAW6/KmQ
 Ma1vdkwA+4hrVx2+EOMRPE5DmftcsuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-TgjZCLM1N-GI6l_Ku0E4aQ-1; Thu, 28 Jan 2021 11:11:32 -0500
X-MC-Unique: TgjZCLM1N-GI6l_Ku0E4aQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0E01922027;
 Thu, 28 Jan 2021 16:11:31 +0000 (UTC)
Received: from localhost (ovpn-112-242.ams2.redhat.com [10.36.112.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D0A760C9B;
 Thu, 28 Jan 2021 16:11:25 +0000 (UTC)
Date: Thu, 28 Jan 2021 16:11:24 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210128161124.GB20377@stefanha-x1.localdomain>
References: <20210127112131.308451-1-stefanha@redhat.com>
 <CAOssrKfY7zDOH3NNbtyARHMCdJJN1tKQJri8ec=igjBf=K6Dog@mail.gmail.com>
 <20210127141430.GA310142@stefanha-x1.localdomain>
 <20210127162332.272e5a95@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210127162332.272e5a95@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Sergio Lopez Pascual <slp@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 04:23:32PM +0100, Greg Kurz wrote:
> On Wed, 27 Jan 2021 14:14:30 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Wed, Jan 27, 2021 at 02:01:54PM +0100, Miklos Szeredi wrote:
> > > On Wed, Jan 27, 2021 at 12:21 PM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
> > >               }
> > > > @@ -1654,9 +1677,11 @@ static void update_open_flags(int writeback,=
 int allow_direct_io,
> > > >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const cha=
r *name,
> > > >                        mode_t mode, struct fuse_file_info *fi)
> > > >  {
> > > > +    int open_flags =3D (fi->flags | O_CREAT) & ~O_NOFOLLOW;
> > > >      int fd;
> > > >      struct lo_data *lo =3D lo_data(req);
> > > >      struct lo_inode *parent_inode;
> > > > +    struct lo_inode *existing_inode =3D NULL;
> > > >      struct fuse_entry_param e;
> > > >      int err;
> > > >      struct lo_cred old =3D {};
> > > > @@ -1682,11 +1707,23 @@ static void lo_create(fuse_req_t req, fuse_=
ino_t parent, const char *name,
> > > >
> > > >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > >
> > > > -    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & =
~O_NOFOLLOW,
> > > > -                mode);
> > > > +    /* First, try to create a new file but don't open existing fil=
es */
> > > > +    fd =3D openat(parent_inode->fd, name, open_flags | O_EXCL, mod=
e);
> > > >      err =3D fd =3D=3D -1 ? errno : 0;
> > > > +
> > > >      lo_restore_cred(&old);
> > > >
> > > > +    /* Second, open existing files if O_EXCL was not specified */
> > > > +    if (err =3D=3D EEXIST && !(fi->flags & O_EXCL)) {
> > > > +        existing_inode =3D lookup_name(req, parent, name);
> > > > +        if (existing_inode) {
> > > > +            fd =3D lo_inode_open(lo, existing_inode, open_flags);
> > > > +            if (fd < 0) {
> > > > +                err =3D -fd;
> > > > +            }
> > > > +        }
> > > > +    }
> > > > +
> > > >      if (!err) {
> > > >          ssize_t fh;
> > >=20
> > > It's more of a mess than I thought.
> > >=20
> > > The problem here is there can also be a race between the open and the
> > > subsequent lo_do_lookup().
> > >=20
> > > At this point it's probably enough to verify that fuse_entry_param
> > > refers to the same object as the fh (using fstat and comparing st_dev
> > > and st_ino).
> >=20
> > Can you describe the race in detail? FUSE_CREATE vs FUSE_OPEN?
> > FUSE_CREATE vs FUSE_CREATE?
> >=20
> > > Also O_CREAT open is not supposed to return ENOENT, so failure to ope=
n
> > > without O_CREAT (race between O_CREAT open and plain open) should at
> > > least translate error to ESTALE or EIO.
> >=20
> > Thanks, will fix.
> >=20
>=20
> Please wait, as explained in another mail, ENOENT can happen with
> O_CREAT and guest userspace should be ready to handle it.

Thanks, I have now read the discussion between Miklos and yourself on
the previous revision. You showed an interesting O_CREAT case where
ENOENT does occur.

The O_NOFOLLOW issue is worth fixing but it's not directly related to
this CVE so it can be done in a separate patch.

Miklos, Greg: Any other topics to discuss regarding this patch or shall
we merge it?

Stefan

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAS4isACgkQnKSrs4Gr
c8i6yggApFSRgn1s8X4QjQIeBky4aqh2jScSu7YIGC0yTrq0sRJtxAei9l5N00Er
9wrsiWJwss2wIVZjW096Lss1OduGtrEfbp3RHL5PeDmYVzyN9ot+BS6x/LqPv1KY
Nk+O2vUAMHoAjFuIxJ4oXPg/erRwThbBgaUPrk1ktugNd1hLfxCEGT1rbfpeFiFv
zvR0QtbNlhPI3n0Ltgx0LrDMtOOFs6ndHgred5knuGZmznBp7kneqMSX4DDWbTPg
Ti3aFOlT8zxNueN4sLJhaOlS2PIeYxmco/6FkU6t1zmeEcwN3Jcgtr3FnDdxlYYz
XrNtfHQEqK3KTMt6nzihww7xtrtCwg==
=MR4L
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--


