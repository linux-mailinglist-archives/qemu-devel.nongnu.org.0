Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4535F3B7245
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 14:47:24 +0200 (CEST)
Received: from localhost ([::1]:43204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyD98-0000Zz-Aa
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 08:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lyD6i-0008Do-Gu
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:44:52 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:52008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lyD6g-0007CG-Lj
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:44:52 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-iMCKcV7OPtWwWcF5l3DYKA-1; Tue, 29 Jun 2021 08:44:39 -0400
X-MC-Unique: iMCKcV7OPtWwWcF5l3DYKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF751084F59;
 Tue, 29 Jun 2021 12:44:38 +0000 (UTC)
Received: from bahia.lan (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB8A101E249;
 Tue, 29 Jun 2021 12:44:33 +0000 (UTC)
Date: Tue, 29 Jun 2021 14:44:31 +0200
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v7 1/7] virtiofsd: Fix fuse setxattr() API
 change issue
Message-ID: <20210629144431.02e2ce0c@bahia.lan>
In-Reply-To: <YNng0CPIFHxDIE3a@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-2-vgoyal@redhat.com>
 <YNng0CPIFHxDIE3a@work-vm>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 15:46:40 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > With kernel header updates fuse_setxattr_in struct has grown in size.
> > But this new struct size only takes affect if user has opted in
> > for fuse feature FUSE_SETXATTR_EXT otherwise fuse continues to
> > send "fuse_setxattr_in" of older size. Older size is determined
> > by FUSE_COMPAT_SETXATTR_IN_SIZE.
> >=20
> > Fix this. If we have not opted in for FUSE_SETXATTR_EXT, then
> > expect that we will get fuse_setxattr_in of size FUSE_COMPAT_SETXATTR_I=
N_SIZE
> > and not sizeof(struct fuse_sexattr_in).
> >=20
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
>=20
> Yeh it's a bit of a grim fix, but I think it's the best we can do, and
> we need to get it in since the headers have already been merged.

You can also add:

Fixes: 278f064e4524 ("Update Linux headers to 5.13-rc4")

because this is basically what happened : this commit exposes the API
breakage.

This is kinda problematic : linux kernel headers are updated globally,
i.e. an header update merged by some other subsystem will unknowingly
break virtiofsd each time we face a similar situation.

We could cope with it if the code was adapted to API changes when
needed, e.g. this patch squashed into 278f064e4524 . It doesn't
seem that can be achievable without some automation to detect
buggy situations (e.g. code depends on the size of a structure).
And even with that, it would still cause the subsystem that
needs the header update to depend on other subsystems to
fix the breakage.

Another possibility could maybe to stop doing global updates and
let each subsystem handle the kernel headers it needs.

OR we could avoid breaking the API in the kernel in the first
place.

Thoughts ?

Anyway, the fix is good:

Reviewed-by: Greg Kurz <groug@kaod.org>

> (I don't think libfuse has a fix for this in yet itself, but it might
> survive because it doesn't bother copying the data like we do with
> mbuf).
>=20
>=20
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
> > ---
> >  tools/virtiofsd/fuse_common.h   | 5 +++++
> >  tools/virtiofsd/fuse_lowlevel.c | 7 ++++++-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_commo=
n.h
> > index fa9671872e..0c2665b977 100644
> > --- a/tools/virtiofsd/fuse_common.h
> > +++ b/tools/virtiofsd/fuse_common.h
> > @@ -372,6 +372,11 @@ struct fuse_file_info {
> >   */
> >  #define FUSE_CAP_HANDLE_KILLPRIV_V2 (1 << 28)
> > =20
> > +/**
> > + * Indicates that file server supports extended struct fuse_setxattr_i=
n
> > + */
> > +#define FUSE_CAP_SETXATTR_EXT (1 << 29)
> > +
> >  /**
> >   * Ioctl flags
> >   *
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_low=
level.c
> > index 7fe2cef1eb..c2b6ff1686 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -1419,8 +1419,13 @@ static void do_setxattr(fuse_req_t req, fuse_ino=
_t nodeid,
> >      struct fuse_setxattr_in *arg;
> >      const char *name;
> >      const char *value;
> > +    bool setxattr_ext =3D req->se->conn.want & FUSE_CAP_SETXATTR_EXT;
> > =20
> > -    arg =3D fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > +    if (setxattr_ext) {
> > +        arg =3D fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > +    } else {
> > +        arg =3D fuse_mbuf_iter_advance(iter, FUSE_COMPAT_SETXATTR_IN_S=
IZE);
> > +    }
> >      name =3D fuse_mbuf_iter_advance_str(iter);
> >      if (!arg || !name) {
> >          fuse_reply_err(req, EINVAL);
> > --=20
> > 2.25.4
> >=20


