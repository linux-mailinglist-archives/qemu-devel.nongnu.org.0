Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BB30E0B1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:15:59 +0100 (CET)
Received: from localhost ([::1]:50248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ll0-0006Zk-CX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LVx-00010l-Gl
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LVv-0008Qf-C1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612371619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a8ZRCpaTJ/4iWXbRYv0AX+ZrlzYpj9hNgNBzjQzTqus=;
 b=SpDv9v7nU8+dGg3ypbUlbeIfHNjTu6HIFDmleqpRm6Am3VlNvHrdzwtwn4VQ0y/RLvXM3B
 srE0oyk6Ss+peTz+9s0EHjypW83ZllPPNnhUinKd9eTo05qRq7G728PEaCtsST2u95Mqol
 Fk8lJnl0IZF0jAHQ9Qqxp9KTRc26i4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-2qbDM76wNLuBnMUAIIjgLw-1; Wed, 03 Feb 2021 12:00:17 -0500
X-MC-Unique: 2qbDM76wNLuBnMUAIIjgLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 437CE107ACFB;
 Wed,  3 Feb 2021 17:00:16 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0139EF6D7;
 Wed,  3 Feb 2021 17:00:07 +0000 (UTC)
Date: Wed, 3 Feb 2021 17:00:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 2/3] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Message-ID: <20210203170006.GK74271@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-3-stefanha@redhat.com>
 <20210203152014.443a8b29@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210203152014.443a8b29@bahia.lan>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GmiNL4+5WUWrod5m"
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GmiNL4+5WUWrod5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 03:20:14PM +0100, Greg Kurz wrote:
> On Wed,  3 Feb 2021 11:37:18 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > lo_do_lookup() finds an existing inode or allocates a new one. It
> > increments nlookup so that the inode stays alive until the client
> > releases it.
> >=20
> > Existing callers don't need the struct lo_inode so the function doesn't
> > return it. Extend the function to optionally return the inode. The next
> > commit will need it.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index e63cbd3fb7..c87a1f3d72 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int dirfd=
, const char *pathname,
> >  }
> > =20
> >  /*
> > - * Increments nlookup and caller must release refcount using
> > - * lo_inode_put(&parent).
> > + * Increments nlookup on the inode on success. unref_inode_lolocked() =
must be
> > + * called eventually to decrement nlookup again. If inodep is non-NULL=
, the
> > + * inode pointer is stored and the caller must call lo_inode_put().
> >   */
> >  static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char =
*name,
> > -                        struct fuse_entry_param *e)
> > +                        struct fuse_entry_param *e,
> > +                        struct lo_inode **inodep)
> >  {
> >      int newfd;
> >      int res;
> > @@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t=
 parent, const char *name,
> >      struct lo_inode *inode =3D NULL;
> >      struct lo_inode *dir =3D lo_inode(req, parent);
> > =20
> > +    if (inodep) {
> > +        *inodep =3D NULL;
> > +    }
> > +
>=20
> Is this side-effect needed ? If lo_do_lookup() returns an error, it
> rather seems that the caller shouldn't expect anything to be written
> here, i.e. the content of *inodep still belongs to the caller and
> whatever value it previously put in there (as patch 3/3 does) should
> be preserved IMHO.
>=20
> Apart from that LGTM.

I like this approach because it prevents accessing uninitialized memory
in the caller:

  struct lo_inode *inode;

  if (lo_do_lookup(..., &inodep) !=3D 0) {
    goto err;
  }
  ...

  err:
  lo_inode_put(&inode); <-- uninitialized in the error case!

--GmiNL4+5WUWrod5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAa1pYACgkQnKSrs4Gr
c8jP2wf/Tu5nMtwBnFs0/I4vcUvXpTOtYx4f2JQU29z8RnrO9a3PEuD2hzjqSTtV
VTuBV8LIvnrKMV34HPiDgydHE3C7q1aTiBTrIsNH+/TW8W9RJmHrd8ntp9iQmY3k
ioNADcxAdnwmF8dBxwoUI5DIc8Wgdv0pI65R0PPhlUOgPr67qBgTDySJ4nyM5u3R
+1P8dxXiD3TBoKrSWp5WPvHN/lJM7wuh1b00FNB+mGZiG0bRN+nkK8kL4OkOA4Qv
pFewMug12MW2Akh+8EA/BWKqxqE7rND7UiADoj2a6kFAd4M1sWsz7WhpfbHTd+vd
imsyYX5K9A6BQqwphB1RtTMcEkGv5g==
=X3iH
-----END PGP SIGNATURE-----

--GmiNL4+5WUWrod5m--


