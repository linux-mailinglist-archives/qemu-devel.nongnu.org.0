Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3B687F59
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:55:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNa3s-0005KM-D8; Thu, 02 Feb 2023 08:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNa3g-0005Jy-0m
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNa3e-00080t-0f
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675346120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHz5MC4W6AgDJhDEotXYs84dyMa5XuRGofwwYVx1OFM=;
 b=JDCxnz6XMRdRyp+52IdRTbOzzRI+5woI41LK2ioG3A2xH7BYatTfKn5Kr3vV9QTojfoIj3
 syxuhHDghpZ3LYBGImHCzwRUPpLAzDgrYC63t2Z2nwERaxctV2FF7cg3vAWofm3PaOdU8b
 3Dk1tMHTpk+xh+2bdZUja+m2EqUhSj8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-2HMAPb9lMHqJN-l62MsllA-1; Thu, 02 Feb 2023 08:55:19 -0500
X-MC-Unique: 2HMAPb9lMHqJN-l62MsllA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C29371C05AFB;
 Thu,  2 Feb 2023 13:55:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94FD7492C3E;
 Thu,  2 Feb 2023 13:55:17 +0000 (UTC)
Date: Thu, 2 Feb 2023 13:55:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, lsoaresp@redhat.com, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y9vAw4QxR7i1GnzH@redhat.com>
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-2-manish.mishra@nutanix.com>
 <877cx0mf4b.fsf@secure.mitica> <Y9utB91u5JFeHBiN@redhat.com>
 <87sffokz73.fsf@secure.mitica> <Y9u26aMxlryK5c3o@redhat.com>
 <87k010kwzq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87k010kwzq.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 02, 2023 at 02:39:05PM +0100, Juan Quintela wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > On Thu, Feb 02, 2023 at 01:51:28PM +0100, Juan Quintela wrote:
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >> > On Thu, Feb 02, 2023 at 01:22:12PM +0100, Juan Quintela wrote:
> >> >> "manish.mishra" <manish.mishra@nutanix.com> wrote:
> >> >> > MSG_PEEK peeks at the channel, The data is treated as unread and
> >> >> > the next read shall still return this data. This support is
> >> >> > currently added only for socket class. Extra parameter 'flags'
> >> >> > is added to io_readv calls to pass extra read flags like MSG_PEEK.
> >> >> >
> >> >> > Reviewed-by: Peter Xu <peterx@redhat.com>
> >> >> > Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> >> >> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> >> >> > Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> >> >>=20
> >> >>=20
> >> >> This change breaks RDMA migration.
> >> >>=20
> >> >> FAILED: libcommon.fa.p/migration_rdma.c.o
> >> >> cc -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/usr/incl=
ude/libpng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/incl=
ude/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/inc=
lude/sysprof-4 -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC=
 -I/usr/include/p11-kit-1 -I/usr/include/libusb-1.0 -I/usr/include/SDL2 -I/=
usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/us=
r/include/slirp -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=
=3Dgnu11 -O2 -g -isystem /mnt/code/qemu/full/linux-headers -isystem linux-h=
eaders -iquote . -iquote /mnt/code/qemu/full -iquote /mnt/code/qemu/full/in=
clude -iquote /mnt/code/qemu/full/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FO=
RTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE=
 -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing=
-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -=
Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-s=
elf -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexp=
ansion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute -Wn=
o-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protect=
or-strong -fPIE -D_REENTRANT -Wno-undef -DSTRUCT_IOVEC_DEFINED -MD -MQ libc=
ommon.fa.p/migration_rdma.c.o -MF libcommon.fa.p/migration_rdma.c.o.d -o li=
bcommon.fa.p/migration_rdma.c.o -c ../../../../mnt/code/qemu/full/migration=
/rdma.c
> >> >> ../../../../mnt/code/qemu/full/migration/rdma.c: In function =E2=80=
=98qio_channel_rdma_class_init=E2=80=99:
> >> >> ../../../../mnt/code/qemu/full/migration/rdma.c:4020:25: error: ass=
ignment to =E2=80=98ssize_t (*)(QIOChannel *, const struct iovec *, size_t,=
  int **, size_t *, int,  Error **)=E2=80=99 {aka =E2=80=98long int (*)(QIO=
Channel *, const struct iovec *, long unsigned int,  int **, long unsigned =
int *, int,  Error **)=E2=80=99} from incompatible pointer type =E2=80=98ss=
ize_t (*)(QIOChannel *, const struct iovec *, size_t,  int **, size_t *, Er=
ror **)=E2=80=99 {aka =E2=80=98long int (*)(QIOChannel *, const struct iove=
c *, long unsigned int,  int **, long unsigned int *, Error **)=E2=80=99} [=
-Werror=3Dincompatible-pointer-types]
> >> >>  4020 |     ioc_klass->io_readv =3D qio_channel_rdma_readv;
> >> >>       |                         ^
> >> >> cc1: all warnings being treated as errors
> >> >>=20
> >> >> And I don't really know how to fix it, because the problem is that =
rdma
> >> >> don't use qio_channel_readv_full() at all.
> >> >
> >> > Likely qio_channel_rdma_readv just adds the 'int flags' param added.
> >> > It doesn't need to actually do anything with the flags as they are
> >> > checked before
> >>=20
> >> I can do that.  That would fix the compilation issue.
> >>=20
> >> But will rdma work?  Because it fakes a qio channel, so what is going =
to
> >> implement the MSG_PEEK functionality for it?  It don't end calling
> >> recv() at all.
> >
> > It is no problem - the qio_channel_readv method changes in this patch
> > add:
> >
> > +    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
> > +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEE=
K)) {
> > +        error_setg_errno(errp, EINVAL,
> > +                         "Channel does not support peek read");
> > +        return -1;
> > +    }
> >
> >
> > so it is impossible for qio_channel_rdma_readv to be invoked with
> > flags having MSG_PEEK set, thus RDMA can ignore the whole concept.
>=20
> And as we require MSG_PEEK to do migration, we have lost RDMA migration
> in the process.
>=20
> The following patch on the series use this functionality to read the
> beggining of the streams in the channels.

It guards that usage of MSG_PEEK with

   if (... && qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEE=
K)) {


With regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


