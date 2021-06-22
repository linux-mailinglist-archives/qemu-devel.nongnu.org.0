Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7233B09E1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:04:32 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvit5-0003Ye-8s
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lviqe-00013A-CS
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:02:00 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lviqY-0004pT-Lx
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:01:59 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-0g5wLfnfMZ-fYDLoeowX5w-1; Tue, 22 Jun 2021 12:01:48 -0400
X-MC-Unique: 0g5wLfnfMZ-fYDLoeowX5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C1B31006B3D;
 Tue, 22 Jun 2021 16:01:46 +0000 (UTC)
Received: from bahia.lan (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD12692BC;
 Tue, 22 Jun 2021 16:01:22 +0000 (UTC)
Date: Tue, 22 Jun 2021 18:01:21 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
Message-ID: <20210622180121.0e4d6748@bahia.lan>
In-Reply-To: <YNCVzPd1UGSzriMP@stefanha-x1.localdomain>
References: <20210617141518.304659-1-groug@kaod.org>
 <YNCVzPd1UGSzriMP@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SSFE.C8W0nmf_OLp0YmrYa3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 qemu-devel@nongnu.org, Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/SSFE.C8W0nmf_OLp0YmrYa3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Jun 2021 14:36:12 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Jun 17, 2021 at 04:15:18PM +0200, Greg Kurz wrote:
> > A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> > supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> > the "fuse_lowlevel.h" header :
> >=20
> >     /**
> >      * Open a file
> >      *
> >      * Open flags are available in fi->flags. The following rules
> >      * apply.
> >      *
> >      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
> >      *    filtered out / handled by the kernel.
> >=20
> > But if it does anyway, virtiofsd crashes with:
> >=20
> > *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: termi=
nated
> >=20
> > This is because virtiofsd ends up passing this flag to openat() without
> > passing a mode_t 4th argument which is mandatory with O_CREAT, and glibc
> > aborts.
> >=20
> > The offending path is:
> >=20
> > lo_open()
> >     lo_do_open()
> >         lo_inode_open()
> >=20
> > Other callers of lo_inode_open() only pass O_RDWR and lo_create()
> > passes a valid fd to lo_do_open() which thus doesn't even call
> > lo_inode_open() in this case.
> >=20
> > Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> > in lo_open() and return an error to the client : EINVAL since this is
> > already what glibc returns with other illegal flag combinations.
> >=20
> > The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> > same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> > that as well.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>=20
> Thank you!
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Upstream libfuse folks suggested to do the change in fuse_lowlevel.c so
that it fixes all filesystems, not only those based on passthrough_ll.c.

I'll thus post a new version.

They also seemed to be a little concerned by open() returning EINVAL
to the end user who did nothing wrong (kernel did). They suggested
that the server should rather print out an error and exit... which
isn't really an option for us. And anyway, we already return EINVAL
when we can't extract the arguments of the request. So I won't
address this concern, but I still wanted to share it here.

--Sig_/SSFE.C8W0nmf_OLp0YmrYa3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmDSCVEACgkQcdTV5YIv
c9Y/ww/+I3DeyRtFBJWuFL4Xpgx4Ldc7qJ5NWljpE0EPpBR+nWCxIeI0kvtuswmK
9kxatBAe7wp6lZChnu27cmk/MN8vXXV4GLZya+SJ2EvfEE9eNunksOLkFlwP2NtL
fM4gOWv6KjXhvOYQJJTm3J5GoCbBpPD3s23tsz0lDBu3TIG/sNJ4PzJ6dtu38+Rl
sCyMWP1g1trwx2S+HEjpJbwmmo5yPY9Lsg17Qm8k0K9Sat7RX3eooSMarLk1skWI
5LZeB87QaktKg6d7HBTzO0nuBYu+glHsaPM0lF89MdzgiO/YhlsB3jwv16tqXniV
1Jc2isrMmGyTkoTwRCZlcpos3RRZ5zju3KMCzMrC3NHMZ9ah43/+OPdbtCZnJu23
eDAAf6pakgsBabdx/dMRt2cvX2yLc66he5dyBNnRQWseBuyj3Lm9Hj0iMGAKrv2T
XyJnx1JqN2QXPGXseSlG2fW8NZB9ZSxakjUzPqN8LduvwMqk3eVzOwgE51hw0bJu
y6hTlSYzmgk8h+gX3lqPpbdYQTdViO0vs2NDrVIE/j7XMKhx54H134YGnKEfTWD1
ZM8bU9qq0NW3RHWoH8i0CTp6EL7ucrziRiYTzSvympBKHiphQUEWBjCbmp3e2/oh
q68UEmyRqi/z/PyiaWBOJI3hu3K+4D2GqyadhtsiTEP8iP+gVsI=
=245e
-----END PGP SIGNATURE-----

--Sig_/SSFE.C8W0nmf_OLp0YmrYa3--


