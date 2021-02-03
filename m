Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A930E0C1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:19:48 +0100 (CET)
Received: from localhost ([::1]:32936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Loh-00033S-4U
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LcL-0004uU-RU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LcI-0001Ge-S3
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612372017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FTNu/1V8cnuyfMHR4J3IPEvL7rsITK9M9fCgSTXUcXM=;
 b=ZnuSAiGRkzlwkrLqa0CsFf+MdTAt9i7eduv0ckkF9/wRIYU7bf++IeGor/N1reekrlNpt8
 lNjinpPITzUW/ZAuIEhDQqxHLC9am6GyC4FzcbC/NB7aP+HgEtU3RBiKoU87tOU3OUbAOj
 s8yH6R27MMUnIXwjrrtZZ4nASX5lazQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-fAS-z0NpMzSaBK8wGrSr2g-1; Wed, 03 Feb 2021 12:06:55 -0500
X-MC-Unique: fAS-z0NpMzSaBK8wGrSr2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707B9100C668;
 Wed,  3 Feb 2021 17:06:54 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DECEE5D9F6;
 Wed,  3 Feb 2021 17:06:33 +0000 (UTC)
Date: Wed, 3 Feb 2021 17:06:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 3/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210203170632.GM74271@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-4-stefanha@redhat.com>
 <20210203165759.352a7f64@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210203165759.352a7f64@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iUV/lbBrmPtUT9dM"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--iUV/lbBrmPtUT9dM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 04:57:59PM +0100, Greg Kurz wrote:
> On Wed,  3 Feb 2021 11:37:19 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >  static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
> > -                      struct fuse_file_info *fi)
> > +                      int existing_fd, struct fuse_file_info *fi)
> >  {
> > -    char buf[64];
> >      ssize_t fh;
> > -    int fd;
> > +    int fd =3D existing_fd;
> > =20
> >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > =20
> > -    sprintf(buf, "%i", inode->fd);
> > -    fd =3D openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > -    if (fd =3D=3D -1) {
> > -        return -errno;
> > +    if (fd < 0) {
> > +        fd =3D lo_inode_open(lo, inode, fi->flags);
> > +        if (fd =3D=3D -1) {
> > +            return -errno;
> > +        }
>=20
> lo_inode_open() returns a negative errno already so
> this should be converted to:
>=20
>         if (fd < 0) {
>             return fd;
>         }
>=20
> Apart from that LGTM.

Thanks, will fix.

Stefan

--iUV/lbBrmPtUT9dM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAa2BgACgkQnKSrs4Gr
c8jx4wf/UmitQcttkvQqMMvvVqX6f1n6h+BSvp2oyj7q59GXztl4/vOtC662vAFG
/1KSIn0BsNFbTx0Jy2P1AoRB/RpMVhCSMgOfI+taE8wZlCATBZZLWCKfVrlJgPm7
g7DrrypucyipQSDrnHwYFp/caoaGlvBPHOzDaFZqbh2eXsrlZxGNPjFqm8FMxvfL
9U1Id0ieWMHKW6kBB+7+n6+B+mTfbcphgb/XgTXCT198mD7L4biDbpoyN97f/xtK
4HCTYlDoBoDQim9HEBz7Bhrk+eQ22UTKS6VIcF8m9TLL9gBj7NbS8xYqHYLse0nT
xsKh9Y+y7Vsew2+XLlKp2RC0co7U/A==
=SM32
-----END PGP SIGNATURE-----

--iUV/lbBrmPtUT9dM--


