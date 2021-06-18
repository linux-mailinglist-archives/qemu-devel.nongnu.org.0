Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DFD3AC752
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:22:50 +0200 (CEST)
Received: from localhost ([::1]:51604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAi9-0006ZR-RI
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1luAhD-0005pJ-8l
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:21:51 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:60643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1luAhB-0000dR-A7
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:21:50 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545--1SrqMEXOTeKGyfCc71dOA-1; Fri, 18 Jun 2021 05:21:44 -0400
X-MC-Unique: -1SrqMEXOTeKGyfCc71dOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD591835AC5;
 Fri, 18 Jun 2021 09:21:43 +0000 (UTC)
Received: from bahia.lan (ovpn-112-153.ams2.redhat.com [10.36.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 919E019704;
 Fri, 18 Jun 2021 09:21:33 +0000 (UTC)
Date: Fri, 18 Jun 2021 11:21:31 +0200
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
Message-ID: <20210618112131.46ce0b2a@bahia.lan>
In-Reply-To: <CAJfpegtpvU6Z6hQ-NKh-shN+Pux7+XzXwNK_Ro8YpfA-3tCOkg@mail.gmail.com>
References: <20210617141518.304659-1-groug@kaod.org>
 <CAJfpegtpvU6Z6hQ-NKh-shN+Pux7+XzXwNK_Ro8YpfA-3tCOkg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 10:58:33 +0200
Miklos Szeredi <miklos@szeredi.hu> wrote:

> On Thu, 17 Jun 2021 at 16:15, Greg Kurz <groug@kaod.org> wrote:
> >
> > A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> > supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> > the "fuse_lowlevel.h" header :
> >
> >     /**
> >      * Open a file
> >      *
> >      * Open flags are available in fi->flags. The following rules
> >      * apply.
> >      *
> >      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
> >      *    filtered out / handled by the kernel.
> >
> > But if it does anyway, virtiofsd crashes with:
> >
> > *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: termi=
nated
> >
> > This is because virtiofsd ends up passing this flag to openat() without
> > passing a mode_t 4th argument which is mandatory with O_CREAT, and glib=
c
> > aborts.
> >
> > The offending path is:
> >
> > lo_open()
> >     lo_do_open()
> >         lo_inode_open()
> >
> > Other callers of lo_inode_open() only pass O_RDWR and lo_create()
> > passes a valid fd to lo_do_open() which thus doesn't even call
> > lo_inode_open() in this case.
> >
> > Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> > in lo_open() and return an error to the client : EINVAL since this is
> > already what glibc returns with other illegal flag combinations.
> >
> > The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> > same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> > that as well.
> >
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index 49c21fd85570..14f62133131c 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -2145,6 +2145,12 @@ static void lo_open(fuse_req_t req, fuse_ino_t i=
no, struct fuse_file_info *fi)
> >          return;
> >      }
> >
> > +    /* File creation is handled by lo_create() */
> > +    if (fi->flags & (O_CREAT | O_TMPFILE)) {
> > +        fuse_reply_err(req, EINVAL);
> > +        return;
> > +    }
> > +
>=20
> Okay.  Question comes to mind whether the check should be even more
> strict, possibly allowing just a specific set of flags, and erroring
> out on everything else?
>=20

I've focused on O_CREAT and O_TMPFILE because they cause an explicit abort(=
)
in glibc when the code is compiled with -D_FORTIFY_SOURCE=3D2, but yes,
maybe it could make sense to check more of them.

> AFAICS linux kernel should never pass anything to FUSE_OPEN outside of th=
is set:
>=20
> O_RDONLY
> O_WRONLY
> O_RDWR
> O_APPEND
> O_NDELAY
> O_NONBLOCK
> __O_SYNC
> O_DSYNC
> FASYNC
> O_DIRECT
> O_LARGEFILE
> O_NOFOLLOW
> O_NOATIME
>=20
> A separate question is whether virtiofsd should also be silently
> ignoring some of the above flags.
>=20

Dunno on the top of my head...

BTW, as suggested by Dave, I've submitted a similar patch to upstream
libfuse:

https://github.com/libfuse/libfuse/pull/615

And I got interesting suggestions:
1) do it in core FUSE, i.e. fuse_lowlevel.c, since this isn't specific to
   passthrough_ll AFAICT
2) print out an error
3) exit

1 makes a lot of sense. I guess 2 is fine this cannot be used by a
buggy guest to flood some log file on the host. 3 doesn't seems
to be an acceptable solution, and it wouldn't change much the
outcome compared to what we have now.

So I will go for 1 and 2.

Cheers,

--
Greg

> Thanks,
> Miklos
>=20
>=20
>=20
> >      err =3D lo_do_open(lo, inode, -1, fi);
> >      lo_inode_put(lo, &inode);
> >      if (err) {
> > --
> > 2.31.1
> >


