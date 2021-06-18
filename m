Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E293AC5E7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 10:22:16 +0200 (CEST)
Received: from localhost ([::1]:49348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu9lV-0006s2-FY
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 04:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lu9ka-0006C3-1M
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:21:16 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:28064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lu9kY-000503-2d
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:21:15 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-11GOmZ0JMy2doLTszF75PQ-1; Fri, 18 Jun 2021 04:21:08 -0400
X-MC-Unique: 11GOmZ0JMy2doLTszF75PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B83A100C61B;
 Fri, 18 Jun 2021 08:21:07 +0000 (UTC)
Received: from bahia.lan (ovpn-112-153.ams2.redhat.com [10.36.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B986719D61;
 Fri, 18 Jun 2021 08:20:58 +0000 (UTC)
Date: Fri, 18 Jun 2021 10:20:57 +0200
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
Message-ID: <20210618102057.21e901fa@bahia.lan>
In-Reply-To: <20210618014007.GA1219970@redhat.com>
References: <20210617141518.304659-1-groug@kaod.org>
 <20210618014007.GA1219970@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 21:40:07 -0400
Vivek Goyal <vgoyal@redhat.com> wrote:

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
>=20

This is also the consequence of virtiofsd being compiled with
-D_FORTIFY_SOURCE=3D2. Without that, no abort but arbitrary data
is passed as mode_t argument to the openat() syscall instead.

> So did you hit this error with current fuse client. If yes, that means
> client needs fixing as well?
>=20

I've patched the client to cause this:

--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -28,6 +28,7 @@ static int fuse_send_open(struct fuse_mount *fm, u64 node=
id,
=20
        memset(&inarg, 0, sizeof(inarg));
        inarg.flags =3D open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
+       if (opcode =3D=3D FUSE_OPEN) inarg.flags |=3D O_TMPFILE;
        if (!fm->fc->atomic_o_trunc)
                inarg.flags &=3D ~O_TRUNC;


> Or you are doing this fix based on comment in fuse_lowlevel.h.
>=20
> I am wondering why this protocl restriction is there that open()
> path should not be able to honor O_CREAT.
>=20

It isn't a protocol restriction IMHO. The distinction between file
creation and file opening has always been there since the start.
Older versions of the protocol would send FUSE_MKNOD to create a
file and then send FUSE_OPEN to open it. Because this was racy,
FUSE_CREATE was introduced at some point to do both operations
atomically.

Question is : what would be the semantics of O_CREAT in FUSE_OPEN ?

> Vivek
>=20
> >=20
> > This is because virtiofsd ends up passing this flag to openat() without
> > passing a mode_t 4th argument which is mandatory with O_CREAT, and glib=
c
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
> >=20
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index 49c21fd85570..14f62133131c 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -2145,6 +2145,12 @@ static void lo_open(fuse_req_t req, fuse_ino_t i=
no, struct fuse_file_info *fi)
> >          return;
> >      }
> > =20
> > +    /* File creation is handled by lo_create() */
> > +    if (fi->flags & (O_CREAT | O_TMPFILE)) {
> > +        fuse_reply_err(req, EINVAL);
> > +        return;
> > +    }
> > +
> >      err =3D lo_do_open(lo, inode, -1, fi);
> >      lo_inode_put(lo, &inode);
> >      if (err) {
> > --=20
> > 2.31.1
> >=20
>=20


