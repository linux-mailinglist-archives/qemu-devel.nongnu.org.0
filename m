Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B815687E5C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZP3-0003Ui-1r; Thu, 02 Feb 2023 08:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNZP1-0003Tp-GN
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNZOz-0006fc-HP
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675343600;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W49rvG6GXUZkUjY4JUa+R6NbUOzS6+IBciFgqgG2bmo=;
 b=axAZA3O/vp+oeE3EtO+l3vhRLEyuevXm2uKSBg6e8sKvw+Hjq4istODTUrfXzglQB/11XX
 V21Tcjo29/lN4KVk+gKtQfXyTuAv9v5Sd7/BiIvq5y1EqigiBCFMLhhU+rAuFZvtdF4p+V
 k/vD+yHpidqJ1lAOXI5JXAV+wVIOQcc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-rJdTY07RNoamSAR7SRu0mA-1; Thu, 02 Feb 2023 08:13:17 -0500
X-MC-Unique: rJdTY07RNoamSAR7SRu0mA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E30EC183B3C0;
 Thu,  2 Feb 2023 13:13:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CABA8404CD80;
 Thu,  2 Feb 2023 13:13:15 +0000 (UTC)
Date: Thu, 2 Feb 2023 13:13:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, lsoaresp@redhat.com, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y9u26aMxlryK5c3o@redhat.com>
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-2-manish.mishra@nutanix.com>
 <877cx0mf4b.fsf@secure.mitica> <Y9utB91u5JFeHBiN@redhat.com>
 <87sffokz73.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87sffokz73.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Thu, Feb 02, 2023 at 01:51:28PM +0100, Juan Quintela wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > On Thu, Feb 02, 2023 at 01:22:12PM +0100, Juan Quintela wrote:
> >> "manish.mishra" <manish.mishra@nutanix.com> wrote:
> >> > MSG_PEEK peeks at the channel, The data is treated as unread and
> >> > the next read shall still return this data. This support is
> >> > currently added only for socket class. Extra parameter 'flags'
> >> > is added to io_readv calls to pass extra read flags like MSG_PEEK.
> >> >
> >> > Reviewed-by: Peter Xu <peterx@redhat.com>
> >> > Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> >> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> >> > Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> >>=20
> >>=20
> >> This change breaks RDMA migration.
> >>=20
> >> FAILED: libcommon.fa.p/migration_rdma.c.o
> >> cc -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/usr/include=
/libpng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/include=
/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/includ=
e/sysprof-4 -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -I=
/usr/include/p11-kit-1 -I/usr/include/libusb-1.0 -I/usr/include/SDL2 -I/usr=
/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/i=
nclude/slirp -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3D=
gnu11 -O2 -g -isystem /mnt/code/qemu/full/linux-headers -isystem linux-head=
ers -iquote . -iquote /mnt/code/qemu/full -iquote /mnt/code/qemu/full/inclu=
de -iquote /mnt/code/qemu/full/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTI=
FY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -f=
no-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-pr=
ototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -Wol=
d-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self=
 -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpans=
ion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute -Wno-m=
issing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-=
strong -fPIE -D_REENTRANT -Wno-undef -DSTRUCT_IOVEC_DEFINED -MD -MQ libcomm=
on.fa.p/migration_rdma.c.o -MF libcommon.fa.p/migration_rdma.c.o.d -o libco=
mmon.fa.p/migration_rdma.c.o -c ../../../../mnt/code/qemu/full/migration/rd=
ma.c
> >> ../../../../mnt/code/qemu/full/migration/rdma.c: In function =E2=80=98=
qio_channel_rdma_class_init=E2=80=99:
> >> ../../../../mnt/code/qemu/full/migration/rdma.c:4020:25: error: assign=
ment to =E2=80=98ssize_t (*)(QIOChannel *, const struct iovec *, size_t,  i=
nt **, size_t *, int,  Error **)=E2=80=99 {aka =E2=80=98long int (*)(QIOCha=
nnel *, const struct iovec *, long unsigned int,  int **, long unsigned int=
 *, int,  Error **)=E2=80=99} from incompatible pointer type =E2=80=98ssize=
_t (*)(QIOChannel *, const struct iovec *, size_t,  int **, size_t *, Error=
 **)=E2=80=99 {aka =E2=80=98long int (*)(QIOChannel *, const struct iovec *=
, long unsigned int,  int **, long unsigned int *, Error **)=E2=80=99} [-We=
rror=3Dincompatible-pointer-types]
> >>  4020 |     ioc_klass->io_readv =3D qio_channel_rdma_readv;
> >>       |                         ^
> >> cc1: all warnings being treated as errors
> >>=20
> >> And I don't really know how to fix it, because the problem is that rdma
> >> don't use qio_channel_readv_full() at all.
> >
> > Likely qio_channel_rdma_readv just adds the 'int flags' param added.
> > It doesn't need to actually do anything with the flags as they are
> > checked before
>=20
> I can do that.  That would fix the compilation issue.
>=20
> But will rdma work?  Because it fakes a qio channel, so what is going to
> implement the MSG_PEEK functionality for it?  It don't end calling
> recv() at all.

It is no problem - the qio_channel_readv method changes in this patch
add:

+    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support peek read");
+        return -1;
+    }


so it is impossible for qio_channel_rdma_readv to be invoked with
flags having MSG_PEEK set, thus RDMA can ignore the whole concept.

With regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


