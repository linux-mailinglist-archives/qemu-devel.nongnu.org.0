Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C81EBEE8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:05 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQS0S-0004ie-Oc
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 04:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iQRzU-00040n-Gm
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iQRzS-0003RG-Hw
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:09:03 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56608
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iQRzS-0003OL-3R
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572595741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWcyDLi7H/z/VbVpey4pPF9xn2Tj1jrjLAYR8Iaw3g8=;
 b=RFDZsFuZK4EFl76ApeAf8eOHMhBSOH2sosr3rOXzFU8qegQiYnEJ3a1rqUgQvcgvGgKS4W
 QYNjeQY7PocNEsza8RcNn8mSSehk9DG9CQRR6SvSCKSWm/DQBgmX1YWEWxyebsDxdsfd58
 dOswg1Xw6gkyVMwrbJZKyrV68rrW5XA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-J33KOnOsOsGwGJjbPDPqCg-1; Fri, 01 Nov 2019 04:08:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77087800A1E;
 Fri,  1 Nov 2019 08:08:57 +0000 (UTC)
Received: from work-vm (ovpn-116-155.ams2.redhat.com [10.36.116.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C6160872;
 Fri,  1 Nov 2019 08:08:53 +0000 (UTC)
Date: Fri, 1 Nov 2019 08:08:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Fix data corruption with O_APPEND
 wirte in writeback mode
Message-ID: <20191101080850.GA2432@work-vm>
References: <20191023122523.1816-1-misono.tomohiro@jp.fujitsu.com>
 <20191031154732.GC7308@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191031154732.GC7308@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: J33KOnOsOsGwGJjbPDPqCg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: virtio-fs@redhat.com, Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Wed, Oct 23, 2019 at 09:25:23PM +0900, Misono Tomohiro wrote:
> > When writeback mode is enabled (-o writeback), O_APPEND handling is
> > done in kernel. Therefore virtiofsd clears O_APPEND flag when open.
> > Otherwise O_APPEND flag takes precedence over pwrite() and write
> > data may corrupt.
> >=20
> > Currently clearing O_APPEND flag is done in lo_open(), but we also
> > need the same operation in lo_create(). So, factor out the flag
> > update operation in lo_open() to update_open_flags() and call it
> > in both lo_open() and lo_create().
> >=20
> > This fixes the failure of xfstest generic/069 in writeback mode
> > (which tests O_APPEND write data integrity).
> >=20
> > Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
>=20
> Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Thanks, merged.

Dave

> Thanks
> Vivek
>=20
> > ---
> >  contrib/virtiofsd/passthrough_ll.c | 56 +++++++++++++++---------------
> >  1 file changed, 28 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/pas=
sthrough_ll.c
> > index e8892c3c32..79fb78ecce 100644
> > --- a/contrib/virtiofsd/passthrough_ll.c
> > +++ b/contrib/virtiofsd/passthrough_ll.c
> > @@ -1733,6 +1733,32 @@ static void lo_releasedir(fuse_req_t req, fuse_i=
no_t ino, struct fuse_file_info
> >  =09fuse_reply_err(req, 0);
> >  }
> > =20
> > +static void update_open_flags(int writeback, struct fuse_file_info *fi=
)
> > +{
> > +=09/* With writeback cache, kernel may send read requests even
> > +=09   when userspace opened write-only */
> > +=09if (writeback && (fi->flags & O_ACCMODE) =3D=3D O_WRONLY) {
> > +=09=09fi->flags &=3D ~O_ACCMODE;
> > +=09=09fi->flags |=3D O_RDWR;
> > +=09}
> > +
> > +=09/* With writeback cache, O_APPEND is handled by the kernel.
> > +=09   This breaks atomicity (since the file may change in the
> > +=09   underlying filesystem, so that the kernel's idea of the
> > +=09   end of the file isn't accurate anymore). In this example,
> > +=09   we just accept that. A more rigorous filesystem may want
> > +=09   to return an error here */
> > +=09if (writeback && (fi->flags & O_APPEND))
> > +=09=09fi->flags &=3D ~O_APPEND;
> > +
> > +=09/*
> > +=09 * O_DIRECT in guest should not necessarily mean bypassing page
> > +=09 * cache on host as well. If somebody needs that behavior, it
> > +=09 * probably should be a configuration knob in daemon.
> > +=09 */
> > +=09fi->flags &=3D ~O_DIRECT;
> > +}
> > +
> >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *n=
ame,
> >  =09=09      mode_t mode, struct fuse_file_info *fi)
> >  {
> > @@ -1760,12 +1786,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t=
 parent, const char *name,
> >  =09if (err)
> >  =09=09goto out;
> > =20
> > -=09/*
> > -=09 * O_DIRECT in guest should not necessarily mean bypassing page
> > -=09 * cache on host as well. If somebody needs that behavior, it
> > -=09 * probably should be a configuration knob in daemon.
> > -=09 */
> > -=09fi->flags &=3D ~O_DIRECT;
> > +=09update_open_flags(lo->writeback, fi);
> > =20
> >  =09fd =3D openat(parent_inode->fd, name,
> >  =09=09    (fi->flags | O_CREAT) & ~O_NOFOLLOW, mode);
> > @@ -1966,28 +1987,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t i=
no, struct fuse_file_info *fi)
> > =20
> >  =09fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=3D%" PRIu64 ", flags=3D%d)\n"=
, ino, fi->flags);
> > =20
> > -=09/* With writeback cache, kernel may send read requests even
> > -=09   when userspace opened write-only */
> > -=09if (lo->writeback && (fi->flags & O_ACCMODE) =3D=3D O_WRONLY) {
> > -=09=09fi->flags &=3D ~O_ACCMODE;
> > -=09=09fi->flags |=3D O_RDWR;
> > -=09}
> > -
> > -=09/* With writeback cache, O_APPEND is handled by the kernel.
> > -=09   This breaks atomicity (since the file may change in the
> > -=09   underlying filesystem, so that the kernel's idea of the
> > -=09   end of the file isn't accurate anymore). In this example,
> > -=09   we just accept that. A more rigorous filesystem may want
> > -=09   to return an error here */
> > -=09if (lo->writeback && (fi->flags & O_APPEND))
> > -=09=09fi->flags &=3D ~O_APPEND;
> > -
> > -=09/*
> > -=09 * O_DIRECT in guest should not necessarily mean bypassing page
> > -=09 * cache on host as well. If somebody needs that behavior, it
> > -=09 * probably should be a configuration knob in daemon.
> > -=09 */
> > -=09fi->flags &=3D ~O_DIRECT;
> > +=09update_open_flags(lo->writeback, fi);
> > =20
> >  =09sprintf(buf, "%i", lo_fd(req, ino));
> >  =09fd =3D openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > --=20
> > 2.21.0
> >=20
> > _______________________________________________
> > Virtio-fs mailing list
> > Virtio-fs@redhat.com
> > https://www.redhat.com/mailman/listinfo/virtio-fs
>=20
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


