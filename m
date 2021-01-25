Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C943E30268F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:57:19 +0100 (CET)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43Is-00039y-U1
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l43Fa-0001Tj-Ps
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l43FX-0006Ug-43
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611586429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PFapq3o67VL0o6TnpsCt76xq5fSLyCFi+VyuN/1N4lw=;
 b=feL0l6wyHoU+AYU+HD2k9ZntI0z7qhsSZ2n6e4g6K4ehUYXH1Hh4lPyxIzFdYewwTsC+rV
 JiCmrErgbKzrLLAW9LHDQTDG6NobvroN/PwUxMVxgygOXhlKQToUtqSsQ1/et+E2puude1
 E2Mt8Vxi5BaFz7YUFxWdr/ZYi1RvQdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-QfHoaorwMIWD1_1IZwCOZg-1; Mon, 25 Jan 2021 09:53:44 -0500
X-MC-Unique: QfHoaorwMIWD1_1IZwCOZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 947E31922022;
 Mon, 25 Jan 2021 14:53:43 +0000 (UTC)
Received: from localhost (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C98FD100AE4E;
 Mon, 25 Jan 2021 14:53:31 +0000 (UTC)
Date: Mon, 25 Jan 2021 14:53:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210125145330.GA226981@stefanha-x1.localdomain>
References: <20210121144429.58885-1-stefanha@redhat.com>
 <20210121144803.GN3125227@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121144803.GN3125227@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: mszeredi@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 P J P <ppandit@redhat.com>, virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 vgoyal@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 02:48:03PM +0000, Daniel P. Berrang=E9 wrote:
> On Thu, Jan 21, 2021 at 02:44:29PM +0000, Stefan Hajnoczi wrote:
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
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
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
> >  tools/virtiofsd/passthrough_ll.c | 84 +++++++++++++++++++++-----------
> >  1 file changed, 56 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index 5fb36d9407..e08352d649 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -555,6 +555,29 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
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
> > + * files such as block device nodes.
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
>=20
> Whats the intended behaviour with symlinks ?  Do we need to
> allow S_ISLNK, or are we assuming the symlink has already
> been expanded to the target file by this point ? If the latter
> adding a comment about this would be useful.

I will add a comment. The FUSE client is expected to resolve symlinks
on the client side.

In other words, the client does not open the symlink inode in order to
access the target of the symlink. It must open the target directly.

Stefan

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAO22oACgkQnKSrs4Gr
c8hIWwf9GmpnwRx10Flg4TZV96v3TJmJa7pZ8cSfEiUqP/9hPUpiaPz06yeXb8Qk
2EcGTb+9afyxzxhhg88N1/xQPSI15qBYsSi/lCA65hVO/AG9W0SuGiTx2B03ADKu
4kpHrzEzkm58S04ui2sm/wojdowvmBgv4TlUP49XpnA4r7P44Kt8STqEQwRiHSAr
6V4qFwZcyB64MWYpvqe3oLjD2WTZ9DO8gSgJVBrVAVMvasZn+aYxmxp03+a57gqR
Qi0PMqhWveWtfvMqwR3DKEx3oC3aawji/s2jd5w0mopPBzKNtpnkXN/7FBNd+dju
UsnVM/gtOxHLHzVUD7T9etTr/p78Zw==
=r5EZ
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--


