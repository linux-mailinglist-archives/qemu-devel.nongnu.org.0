Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354D131882
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 20:18:26 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioXtR-0005lP-5b
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 14:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ioXkG-0001Mc-KW
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 14:08:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ioXkC-0001Gx-S6
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 14:08:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58437
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ioXkC-0001Fs-O4
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 14:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578337731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIqx25T/cqrrI2vcujX1MSEZv3SEzKNOsGSTMxsiGTo=;
 b=HNSLtZF0LzoovwY8QT/e5WpIOA6VcUXDA9o6daTP1KZqQDJ9oXedzfjfuNaxADQ8+8mnSH
 0fUewbbAUK4eiRJdiBJMd6JrjDp1Au+gZXVDjedfxDs64TfXtYRoZoOIhCR9rjYNW3rHhm
 z/b0rLvcx59Q9TDghDAYl43W/OMJG+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-WX2UWC_4ND6zzkyQwm5B8A-1; Mon, 06 Jan 2020 14:08:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F0F106B2FE
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 19:08:49 +0000 (UTC)
Received: from work-vm (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8E471FE07;
 Mon,  6 Jan 2020 19:08:45 +0000 (UTC)
Date: Mon, 6 Jan 2020 19:08:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 032/104] virtiofsd: passthrough_ll: create new files in
 caller's context
Message-ID: <20200106190843.GP2798@work-vm>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-33-dgilbert@redhat.com>
 <20200106143011.GK2930416@redhat.com>
 <20200106190041.GO2798@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200106190041.GO2798@work-vm>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: WX2UWC_4ND6zzkyQwm5B8A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > On Thu, Dec 12, 2019 at 04:37:52PM +0000, Dr. David Alan Gilbert (git) =
wrote:
> > > From: Vivek Goyal <vgoyal@redhat.com>
> > >=20
> > > We need to create files in the caller's context. Otherwise after
> > > creating a file, the caller might not be able to do file operations o=
n
> > > that file.
> > >=20
> > > Changed effective uid/gid to caller's uid/gid, create file and then
> > > switch back to uid/gid 0.
> > >=20
> > > Use syscall(setresuid, ...) otherwise glibc does some magic to change=
 EUID
> > > in all threads, which is not what we want.
> > >=20
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 79 ++++++++++++++++++++++++++++++=
--
> > >  1 file changed, 74 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passt=
hrough_ll.c
> > > index 68bacb6fc5..0188cd9ad6 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> >=20
> >=20
> > > +static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> > > +{
> > > +    int res;
> > > +
> > > +    old->euid =3D geteuid();
> > > +    old->egid =3D getegid();
> > > +
> > > +    res =3D syscall(SYS_setresgid, -1, fuse_req_ctx(req)->gid, -1);
> >=20
> > Do we need to be using  SYS_setres[u,g]id32 instead...
> >=20
> > [quote setresgid(2)]
> >        The original Linux setresuid() and setresgid() system  calls
> >        supported  only  16-bit  user  and group IDs.  Subsequently,
> >        Linux 2.4 added setresuid32() and setresgid32(),  supporting
> >        32-bit  IDs.   The glibc setresuid() and setresgid() wrapper
> >        functions transparently deal with the variations across ker=E2=
=80=90
> >        nel versions.
> > [/quote]
>=20
> OK, updated.

Hmm hang on; this is messy.  x86-64 only seems to have setresuid
where as some architectures have both;  If I'm reading this right, all
64 bit machines have setresuid/gid calling the code that takes the
32bit ID; some have compat entries for 32bit syscalls.

I think it's probably more correct to call setresuid here; except
for 32 bit platforms - but how do we tell?

Dave

> Dave
>=20
> > > +    if (res =3D=3D -1) {
> > > +        return errno;
> > > +    }
> > > +
> > > +    res =3D syscall(SYS_setresuid, -1, fuse_req_ctx(req)->uid, -1);
> > > +    if (res =3D=3D -1) {
> > > +        int errno_save =3D errno;
> > > +
> > > +        syscall(SYS_setresgid, -1, old->egid, -1);
> > > +        return errno_save;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/* Regain Privileges */
> > > +static void lo_restore_cred(struct lo_cred *old)
> > > +{
> > > +    int res;
> > > +
> > > +    res =3D syscall(SYS_setresuid, -1, old->euid, -1);
> > > +    if (res =3D=3D -1) {
> > > +        fuse_log(FUSE_LOG_ERR, "seteuid(%u): %m\n", old->euid);
> > > +        exit(1);
> > > +    }
> > > +
> > > +    res =3D syscall(SYS_setresgid, -1, old->egid, -1);
> > > +    if (res =3D=3D -1) {
> > > +        fuse_log(FUSE_LOG_ERR, "setegid(%u): %m\n", old->egid);
> > > +        exit(1);
> > > +    }
> > > +}
> > > +
> > >  static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> > >                               const char *name, mode_t mode, dev_t rd=
ev,
> > >                               const char *link)
> > > @@ -391,12 +443,21 @@ static void lo_mknod_symlink(fuse_req_t req, fu=
se_ino_t parent,
> > >      int saverr;
> > >      struct lo_inode *dir =3D lo_inode(req, parent);
> > >      struct fuse_entry_param e;
> > > +    struct lo_cred old =3D {};
> > > =20
> > >      saverr =3D ENOMEM;
> > > =20
> > > +    saverr =3D lo_change_cred(req, &old);
> > > +    if (saverr) {
> > > +        goto out;
> > > +    }
> > > +
> > >      res =3D mknod_wrapper(dir->fd, name, link, mode, rdev);
> > > =20
> > >      saverr =3D errno;
> > > +
> > > +    lo_restore_cred(&old);
> > > +
> > >      if (res =3D=3D -1) {
> > >          goto out;
> > >      }
> > > @@ -794,26 +855,34 @@ static void lo_create(fuse_req_t req, fuse_ino_=
t parent, const char *name,
> > >      struct lo_data *lo =3D lo_data(req);
> > >      struct fuse_entry_param e;
> > >      int err;
> > > +    struct lo_cred old =3D {};
> > > =20
> > >      if (lo_debug(req)) {
> > >          fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=3D%" PRIu64 ", na=
me=3D%s)\n",
> > >                   parent, name);
> > >      }
> > > =20
> > > +    err =3D lo_change_cred(req, &old);
> > > +    if (err) {
> > > +        goto out;
> > > +    }
> > > +
> > >      fd =3D openat(lo_fd(req, parent), name, (fi->flags | O_CREAT) & =
~O_NOFOLLOW,
> > >                  mode);
> > > -    if (fd =3D=3D -1) {
> > > -        return (void)fuse_reply_err(req, errno);
> > > -    }
> > > +    err =3D fd =3D=3D -1 ? errno : 0;
> > > +    lo_restore_cred(&old);
> > > =20
> > > -    fi->fh =3D fd;
> > > +    if (!err) {
> > > +        fi->fh =3D fd;
> > > +        err =3D lo_do_lookup(req, parent, name, &e);
> > > +    }
> > >      if (lo->cache =3D=3D CACHE_NEVER) {
> > >          fi->direct_io =3D 1;
> > >      } else if (lo->cache =3D=3D CACHE_ALWAYS) {
> > >          fi->keep_cache =3D 1;
> > >      }
> > > =20
> > > -    err =3D lo_do_lookup(req, parent, name, &e);
> > > +out:
> > >      if (err) {
> > >          fuse_reply_err(req, err);
> > >      } else {
> > > --=20
> > > 2.23.0
> > >=20
> > >=20
> >=20
> > Regards,
> > Daniel
> > --=20
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


