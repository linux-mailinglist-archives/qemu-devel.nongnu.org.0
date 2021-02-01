Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841E930ADA5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:21:54 +0100 (CET)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ctd-0004b5-I5
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6cmt-0008Al-TT
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6cmq-0006pU-Vd
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612199691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VKPFxNK4wuWeaSOVbjlfem4QqojWA05oaASWa6e04no=;
 b=O5WPMgkB7vUoIsN/nfE5mj+FOmxGs7rHgD6OZS59VmrOMKhhn+7IjzRSnaZkxOqDt9e8jA
 RPTQ2xe5TNlQrWO14RZm+jW8YNYV1UMXlOAXdwJynLZAARN8viUxsrn0/Nu/Hq7XJRtqyh
 +dxXNnybDdOrQl9aTvFGqzObUDYgqoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-kM37bHVLO_iIJm3qC-nVrg-1; Mon, 01 Feb 2021 12:14:49 -0500
X-MC-Unique: kM37bHVLO_iIJm3qC-nVrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79B54107ACE3;
 Mon,  1 Feb 2021 17:14:48 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 477C910013C0;
 Mon,  1 Feb 2021 17:14:42 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:14:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210201171440.GA180539@stefanha-x1.localdomain>
References: <20210127112131.308451-1-stefanha@redhat.com>
 <20210128184416.4dbdd23b@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210128184416.4dbdd23b@bahia.lan>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
 qemu-devel@nongnu.org, P J P <ppandit@redhat.com>, virtio-fs@redhat.com,
 Alex Xu <alex@alxu.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 06:44:16PM +0100, Greg Kurz wrote:
> On Wed, 27 Jan 2021 11:21:31 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > A well-behaved FUSE client does not attempt to open special files with
> > FUSE_OPEN because they are handled on the client side (e.g. device node=
s
> > are handled by client-side device drivers).
> >=20
> > The check to prevent virtiofsd from opening special files is missing in
> > a few cases, most notably FUSE_OPEN. A malicious client can cause
> > virtiofsd to open a device node, potentially allowing the guest to
> > escape. This can be exploited by a modified guest device driver. It is
> > not exploitable from guest userspace since the guest kernel will handle
> > special files inside the guest instead of sending FUSE requests.
> >=20
> > This patch adds the missing checks to virtiofsd. This is a short-term
> > solution because it does not prevent a compromised virtiofsd process
> > from opening device nodes on the host.
> >=20
> > Reported-by: Alex Xu <alex@alxu.ca>
> > Fixes: CVE-2020-35517
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > v3:
> >  * Protect lo_create() [Greg]
> > v2:
> >  * Add doc comment clarifying that symlinks are traversed client-side
> >    [Daniel]
> >=20
> > This issue was diagnosed on public IRC and is therefore already known
> > and not embargoed.
> >=20
> > A stronger fix, and the long-term solution, is for users to mount the
> > shared directory and any sub-mounts with nodev, as well as nosuid and
> > noexec. Unfortunately virtiofsd cannot do this automatically because
> > bind mounts added by the user after virtiofsd has launched would not be
> > detected. I suggest the following:
> >=20
> > 1. Modify libvirt and Kata Containers to explicitly set these mount
> >    options.
> > 2. Then modify virtiofsd to check that the shared directory has the
> >    necessary options at startup. Refuse to start if the options are
> >    missing so that the user is aware of the security requirements.
> >=20
> > As a bonus this also increases the likelihood that other host processes
> > besides virtiofsd will be protected by nosuid/noexec/nodev so that a
> > malicious guest cannot drop these files in place and then arrange for a
> > host process to come across them.
> >=20
> > Additionally, user namespaces have been discussed. They seem like a
> > worthwhile addition as an unprivileged or privilege-separated mode
> > although there are limitations with respect to security xattrs and the
> > actual uid/gid stored on the host file system not corresponding to the
> > guest uid/gid.
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 104 ++++++++++++++++++++++---------
> >  1 file changed, 74 insertions(+), 30 deletions(-)
> >=20
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index 5fb36d9407..054ad439a5 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -555,6 +555,30 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
> >      return fd;
> >  }
> > =20
> > +/*
> > + * Open a file descriptor for an inode. Returns -EBADF if the inode is=
 not a
> > + * regular file or a directory. Use this helper function instead of ra=
w
> > + * openat(2) to prevent security issues when a malicious client opens =
special
> > + * files such as block device nodes. Symlink inodes are also rejected =
since
> > + * symlinks must already have been traversed on the client side.
> > + */
> > +static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
> > +                         int open_flags)
> > +{
> > +    g_autofree char *fd_str =3D g_strdup_printf("%d", inode->fd);
> > +    int fd;
> > +
> > +    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
> > +        return -EBADF;
> > +    }
> > +
> > +    fd =3D openat(lo->proc_self_fd, fd_str, open_flags);
> > +    if (fd < 0) {
> > +        return -errno;
> > +    }
> > +    return fd;
> > +}
> > +
> >  static void lo_init(void *userdata, struct fuse_conn_info *conn)
> >  {
> >      struct lo_data *lo =3D (struct lo_data *)userdata;
> > @@ -684,8 +708,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t i=
no, struct stat *attr,
> >          if (fi) {
> >              truncfd =3D fd;
> >          } else {
> > -            sprintf(procname, "%i", ifd);
> > -            truncfd =3D openat(lo->proc_self_fd, procname, O_RDWR);
> > +            truncfd =3D lo_inode_open(lo, inode, O_RDWR);
> >              if (truncfd < 0) {
> >                  goto out_err;
> >              }
> > @@ -1654,9 +1677,11 @@ static void update_open_flags(int writeback, int=
 allow_direct_io,
> >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *n=
ame,
> >                        mode_t mode, struct fuse_file_info *fi)
> >  {
> > +    int open_flags =3D (fi->flags | O_CREAT) & ~O_NOFOLLOW;
> >      int fd;
> >      struct lo_data *lo =3D lo_data(req);
> >      struct lo_inode *parent_inode;
> > +    struct lo_inode *existing_inode =3D NULL;
> >      struct fuse_entry_param e;
> >      int err;
> >      struct lo_cred old =3D {};
> > @@ -1682,11 +1707,23 @@ static void lo_create(fuse_req_t req, fuse_ino_=
t parent, const char *name,
> > =20
> >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > =20
> > -    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_N=
OFOLLOW,
> > -                mode);
> > +    /* First, try to create a new file but don't open existing files *=
/
> > +    fd =3D openat(parent_inode->fd, name, open_flags | O_EXCL, mode);
> >      err =3D fd =3D=3D -1 ? errno : 0;
> > +
> >      lo_restore_cred(&old);
> > =20
> > +    /* Second, open existing files if O_EXCL was not specified */
> > +    if (err =3D=3D EEXIST && !(fi->flags & O_EXCL)) {
> > +        existing_inode =3D lookup_name(req, parent, name);
>=20
> No sure about the exact semantics of lookup_name()...
>=20
> > +        if (existing_inode) {
>=20
> IIUC we could stat() an ${name} path in the directory and
> it matches an inode we already know about, right ?
>=20
> > +            fd =3D lo_inode_open(lo, existing_inode, open_flags);
> > +            if (fd < 0) {
> > +                err =3D -fd;
> > +            }
> > +        }
>=20
> What if lookup_name() returned false ? This means either there's
> no ${name} path, which looks like the race we were discussing
> with Miklos, or there's a ${name} but it doesn't match anything
> we know... I guess the latter can happen if the ${name} was
> created externally but we never had a chance to do a lookup
> yet, right ? Shouldn't we do one at this point ?
>=20
> For now, it seems that both cases will return EEXIST, which
> is likely confusing if O_EXCL was not specified.

lo_rmdir(), lo_unlink(), and lo_rename() all behave this way too. That's
another issue that needs to be addressed separately :).

I have an idea for unifying lo_open() and lo_create(). It will solve
this issue by creating new inodes if necessary.

Stefan

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAYNwAACgkQnKSrs4Gr
c8gXigf9Gt4Ok1jmOarRdjE8MFkut0W7Pi37T88mCRmHgPS4Wikj7whljt8iXKvr
dffpVjy2Qsoj6WvM4E1l5k4fm8HCK6T8UqlaKF4p4DR3zdKPh4rKNW60KAiduFBd
VgRRy+uhvGxvCMuh2McIYrjleCAzHUeTckP64KzGMPovUfzi0gWMUXwznew5moYs
dwAIf0NQyzIhhMII0LZDk213/f+yii4M942cNPDezrLS1aci9wThAkJJvC+6yrIg
1tKLC6y8c38pGTCw2j+hWrSzq3cNbfT8GIj3bIootEljhbMtEqoMZ3bbJ0uy3u6Q
pmPGjGaXPSVYm90ek7UM75sgSyaFtw==
=BfbR
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--


