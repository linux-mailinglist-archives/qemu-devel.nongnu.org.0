Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31BC30EFEB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:48:07 +0100 (CET)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bF8-0002rJ-PI
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bCy-0001KT-Ew
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bCw-00028z-JF
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612431949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ed0ICb5OHsa52+nJnCB4b+pkJnLk2YvgatUc2FVj+Ks=;
 b=IbUel0mC/gBZdZG9JcHNBU5Vhpy3NOpTpsoth4QNe60sDn1jjVspDatWnL4T1S7DkEEcAQ
 dqGmTD77oYkAG0q0HYvad49wrRsGO4Go3qK/ilPfXwhP1F6mgD0q0ohMwN6ElUX+e9LD1N
 reKklXdIq1wRNLgo0g+9oDea3ceOh/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-NLNqWm4jNByDAn5ZPgujMw-1; Thu, 04 Feb 2021 04:45:46 -0500
X-MC-Unique: NLNqWm4jNByDAn5ZPgujMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6731D801960;
 Thu,  4 Feb 2021 09:45:45 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E34BD5D9C9;
 Thu,  4 Feb 2021 09:45:38 +0000 (UTC)
Date: Thu, 4 Feb 2021 09:45:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 2/3] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Message-ID: <20210204094537.GB344659@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-3-stefanha@redhat.com>
 <20210203152014.443a8b29@bahia.lan>
 <20210203170006.GK74271@stefanha-x1.localdomain>
 <20210204092528.0f4b3200@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210204092528.0f4b3200@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
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

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 09:25:28AM +0100, Greg Kurz wrote:
> On Wed, 3 Feb 2021 17:00:06 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Wed, Feb 03, 2021 at 03:20:14PM +0100, Greg Kurz wrote:
> > > On Wed,  3 Feb 2021 11:37:18 +0000
> > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >=20
> > > > lo_do_lookup() finds an existing inode or allocates a new one. It
> > > > increments nlookup so that the inode stays alive until the client
> > > > releases it.
> > > >=20
> > > > Existing callers don't need the struct lo_inode so the function doe=
sn't
> > > > return it. Extend the function to optionally return the inode. The =
next
> > > > commit will need it.
> > > >=20
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > >  tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++-------=
-
> > > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/pas=
sthrough_ll.c
> > > > index e63cbd3fb7..c87a1f3d72 100644
> > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > > @@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int d=
irfd, const char *pathname,
> > > >  }
> > > > =20
> > > >  /*
> > > > - * Increments nlookup and caller must release refcount using
> > > > - * lo_inode_put(&parent).
> > > > + * Increments nlookup on the inode on success. unref_inode_lolocke=
d() must be
> > > > + * called eventually to decrement nlookup again. If inodep is non-=
NULL, the
> > > > + * inode pointer is stored and the caller must call lo_inode_put()=
.
> > > >   */
> > > >  static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const c=
har *name,
> > > > -                        struct fuse_entry_param *e)
> > > > +                        struct fuse_entry_param *e,
> > > > +                        struct lo_inode **inodep)
> > > >  {
> > > >      int newfd;
> > > >      int res;
> > > > @@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_i=
no_t parent, const char *name,
> > > >      struct lo_inode *inode =3D NULL;
> > > >      struct lo_inode *dir =3D lo_inode(req, parent);
> > > > =20
> > > > +    if (inodep) {
> > > > +        *inodep =3D NULL;
> > > > +    }
> > > > +
> > >=20
> > > Is this side-effect needed ? If lo_do_lookup() returns an error, it
> > > rather seems that the caller shouldn't expect anything to be written
> > > here, i.e. the content of *inodep still belongs to the caller and
> > > whatever value it previously put in there (as patch 3/3 does) should
> > > be preserved IMHO.
> > >=20
> > > Apart from that LGTM.
> >=20
> > I like this approach because it prevents accessing uninitialized memory
> > in the caller:
> >=20
> >   struct lo_inode *inode;
> >=20
> >   if (lo_do_lookup(..., &inodep) !=3D 0) {
> >     goto err;
> >   }
> >   ...
> >=20
> >   err:
> >   lo_inode_put(&inode); <-- uninitialized in the error case!
>=20
> My point is that it is the caller's business to ensure that inode
> doesn't contain garbage if it is to be used irrespective of the
> outcome of lo_do_lookup(). This is precisely what patch 3/3 does,
> so I don't understand the ultimate purpose of nullifying the
> inode pointer _again_ in lo_do_lookup()...

APIs should be designed to eliminate classes of errors where possible
IMO. Taking care regarding the uninitialized pointer in the error case
could be the caller's responsibility, but what's the advantage?

(There's a related thing with lo_inode_put(&inode) where it sets *inode
=3D NULL to eliminate use-after-free bugs in callers. It would have been
possible to use the same approach as free(3) where it's the caller's
responsiblity, but that API design decision in free(3) has caused
many bugs in applications.)

Stefan

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAbwkEACgkQnKSrs4Gr
c8h15wf9F9O6BieAFs2QafRMQcgfmL/9VsYKQyRV1yrH2nzfG/xTMbKsdx81S/yj
EIiXqs9ni8xyMW5jNTr9F1YEoeyYNFFE9FbIx/AsiUJDegnHwg40yorzOswP2lFu
5YdAM5YjDi/ZCXRJ7b7l3SX12bqCDtIWzYbmtrFlCGPjHScy8uS6dt2JpUvUq+/o
dXxEd8KCF6YZHul7immXpVD52h4CdPV5cSjpphrCmjnJqZ7lpF8FPX0xKFiMSEPo
3h1L5+w2zAYw156ng56re6QBMW3vJqJjXkCHh+hLiqQ2XGJTNREUOUf/4o7Tkj9E
QN8ioUtu6geV14yyT+FWSnZBzgT4sg==
=b+/r
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--


