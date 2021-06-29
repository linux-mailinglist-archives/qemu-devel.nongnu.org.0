Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F93B746E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:37:31 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEri-00058h-T8
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lyEpi-00032Y-1R
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:35:26 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:58719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lyEpd-0004jb-4q
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:35:23 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-LI-U_rXINOW77yxMGyQVYA-1; Tue, 29 Jun 2021 10:35:13 -0400
X-MC-Unique: LI-U_rXINOW77yxMGyQVYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C663B1084F61;
 Tue, 29 Jun 2021 14:35:12 +0000 (UTC)
Received: from bahia.lan (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 066E010023B0;
 Tue, 29 Jun 2021 14:35:07 +0000 (UTC)
Date: Tue, 29 Jun 2021 16:35:06 +0200
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v7 2/7] virtiofsd: Fix xattr operations
 overwriting errno
Message-ID: <20210629163506.23c282a8@bahia.lan>
In-Reply-To: <20210629132236.GB5231@redhat.com>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-3-vgoyal@redhat.com>
 <YNnrT/mCw3w26/lT@work-vm> <20210629150343.5cf10a26@bahia.lan>
 <20210629132236.GB5231@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 09:22:36 -0400
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Tue, Jun 29, 2021 at 03:03:43PM +0200, Greg Kurz wrote:
> > On Mon, 28 Jun 2021 16:31:27 +0100
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >=20
> > > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > > getxattr/setxattr/removexattr/listxattr operations handle regualar
> > > > and non-regular files differently. For the case of non-regular file=
s
> > > > we do fchdir(/proc/self/fd) and the xattr operation and then revert
> > > > back to original working directory. After this we are saving errno
> > > > and that's buggy because fchdir() will overwrite the errno.
> > > >=20
> > > > FCHDIR_NOFAIL(lo->proc_self_fd);
> > > > ret =3D getxattr(procname, name, value, size);
> > > > FCHDIR_NOFAIL(lo->root.fd);
> > > >=20
> > > > if (ret =3D=3D -1)
> > > >     saverr =3D errno
> > > >=20
> > > > In above example, if getxattr() failed, we will still return 0 to c=
aller
> > > > as errno must have been written by FCHDIR_NOFAIL(lo->root.fd) call.
> >=20
> > This assertion doesn't look right.
> >=20
> > From the errno(3) manual page:
> >=20
> >        The value in errno is significant only when the return value of
> >        the call indicated an error (i.e., -1 from most system calls; -1
> >        or NULL from most library functions); a function that succeeds i=
s
> >        allowed to change errno.  The value of errno is never set to zer=
o
> >                                               ^^^^^^^^^^^^^^^^^^^^^^^^^=
^
> >        by any system call or library function.
>=20
> Ok. So it will not set errno to 0. But it also says "a function that
> succeeds is allowed to change errno". So that means a successful
> fchdir(fd) can change errno to something else and we lost original
> error code returned by getxattr() operation. Even "assert(fchdir_res =3D=
=3D 0)"
> will not kick in because fchdir() succeeded.
>=20
> IOW, with current code we can still lose original error code as experienc=
ed
> while executing getxattr()/setxattr()/listxattr(). So it makese sense
> to fix it.
>=20

Sure ! I wasn't challenging the fix, but rather the "still return 0 to call=
er"
wording :)

Cheers,

--
Greg

> Vivek
>=20
> > > > Fix all such instances and capture "errno" early and save in "saver=
r"
> > > > variable.
> > > >=20
> > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > >=20
> > > I think the existing code is actually safe; I don't think fchdir
> > > will/should set errno unless there's an error, and we're explictly
> > > asserting there isn't one.
> > >=20
> > > However, I do prefer doing this save since we already have the save
> > > variables and it makes the chance of screwing it up from any other
> > > forgotten syscall less likely, so
> > >=20
> >=20
> > Agreed. With this rationale in the changelog:
> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
> > >=20
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > >=20
> > > > ---
> > > >  tools/virtiofsd/passthrough_ll.c | 16 ++++++++++------
> > > >  1 file changed, 10 insertions(+), 6 deletions(-)
> > > >=20
> > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/pas=
sthrough_ll.c
> > > > index 49c21fd855..ec91b3c133 100644
> > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > > @@ -2791,15 +2791,17 @@ static void lo_getxattr(fuse_req_t req, fus=
e_ino_t ino, const char *in_name,
> > > >              goto out_err;
> > > >          }
> > > >          ret =3D fgetxattr(fd, name, value, size);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >      } else {
> > > >          /* fchdir should not fail here */
> > > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > > >          ret =3D getxattr(procname, name, value, size);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >          FCHDIR_NOFAIL(lo->root.fd);
> > > >      }
> > > > =20
> > > >      if (ret =3D=3D -1) {
> > > > -        goto out_err;
> > > > +        goto out;
> > > >      }
> > > >      if (size) {
> > > >          saverr =3D 0;
> > > > @@ -2864,15 +2866,17 @@ static void lo_listxattr(fuse_req_t req, fu=
se_ino_t ino, size_t size)
> > > >              goto out_err;
> > > >          }
> > > >          ret =3D flistxattr(fd, value, size);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >      } else {
> > > >          /* fchdir should not fail here */
> > > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > > >          ret =3D listxattr(procname, value, size);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >          FCHDIR_NOFAIL(lo->root.fd);
> > > >      }
> > > > =20
> > > >      if (ret =3D=3D -1) {
> > > > -        goto out_err;
> > > > +        goto out;
> > > >      }
> > > >      if (size) {
> > > >          saverr =3D 0;
> > > > @@ -2998,15 +3002,15 @@ static void lo_setxattr(fuse_req_t req, fus=
e_ino_t ino, const char *in_name,
> > > >              goto out;
> > > >          }
> > > >          ret =3D fsetxattr(fd, name, value, size, flags);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >      } else {
> > > >          /* fchdir should not fail here */
> > > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > > >          ret =3D setxattr(procname, name, value, size, flags);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >          FCHDIR_NOFAIL(lo->root.fd);
> > > >      }
> > > > =20
> > > > -    saverr =3D ret =3D=3D -1 ? errno : 0;
> > > > -
> > > >  out:
> > > >      if (fd >=3D 0) {
> > > >          close(fd);
> > > > @@ -3064,15 +3068,15 @@ static void lo_removexattr(fuse_req_t req, =
fuse_ino_t ino, const char *in_name)
> > > >              goto out;
> > > >          }
> > > >          ret =3D fremovexattr(fd, name);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >      } else {
> > > >          /* fchdir should not fail here */
> > > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > > >          ret =3D removexattr(procname, name);
> > > > +        saverr =3D ret =3D=3D -1 ? errno : 0;
> > > >          FCHDIR_NOFAIL(lo->root.fd);
> > > >      }
> > > > =20
> > > > -    saverr =3D ret =3D=3D -1 ? errno : 0;
> > > > -
> > > >  out:
> > > >      if (fd >=3D 0) {
> > > >          close(fd);
> > > > --=20
> > > > 2.25.4
> > > >=20
> >=20
>=20


