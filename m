Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D168831A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:53:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbsn-0007WN-Qm; Thu, 02 Feb 2023 10:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbsd-0007VE-31
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbsb-0007i8-Cg
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675353124;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIeaS1UAJFD0K42Lc+ZJJJ3NpUeQAd8gFx64hVdoAAw=;
 b=HDshA+qHDkSVI1LmqTiWFqhE2BkVeYc5QgY8Y54RfrxF8ivyR8no291xB5sd64ei2JN0gZ
 hez8KSx33vPbcfSdjg7JUwPgfwPdZjOP127YpOh07DYCTLOngmrOSQepQg03wOOuE/hVNg
 S9V6ZzKfAV+p1wXpHonmdP/u6/LflQc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-cRetllrcObe1VOrrEfXoSA-1; Thu, 02 Feb 2023 10:52:03 -0500
X-MC-Unique: cRetllrcObe1VOrrEfXoSA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o5-20020a05600c4fc500b003db0b3230efso3042705wmq.9
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 07:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tIeaS1UAJFD0K42Lc+ZJJJ3NpUeQAd8gFx64hVdoAAw=;
 b=NBlMf+GkI8BRS99RCyPGwZMKXlBb7ZgBZBuvEFMtQuZh3CubcLAJCLRIRfBDK/c+z8
 03lEqlhsBZRGQmiMp1jWG/JXwZMOM64dlzFNXN5i3S3dtuu5KAO7wHSB+LJSfe9/P8IM
 jfNihSZRAVUSJcCypUzEZkanRTfnd/GUlXejlfNL6TrOSxtVXxD84/542joWf7thrm5B
 fFMKP2x6iEhH33cgK4XlHC1tAhgBkD7HyRvZo+zhk95z9KBU7uBA8ZCaoaApdR9bLvP5
 bvrdww7U8lvMklUQikCknavTq9xPli3OTt/8BOT5JOg47CzOeuRB+JqdYd/PhmMI8Ekt
 S6qQ==
X-Gm-Message-State: AO0yUKUvXhe0Dy83FaRHgwfC6oWzmzbIeuOVN9X/bM7xN2Hi6Mp8sAt7
 IVNxEFHBvUPt3Hz9uShjQ6Pyew+L7Flu0Rrk6ED5pck9Je1WCZ5cMDE97wgYmk7TprwYj90Xvlh
 9CsXhBiyA87Je13c=
X-Received: by 2002:a05:6000:1706:b0:2bf:df72:fdf4 with SMTP id
 n6-20020a056000170600b002bfdf72fdf4mr6446977wrc.17.1675353121898; 
 Thu, 02 Feb 2023 07:52:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+ifTXXI3vQyUk/u90xGh1AjuzAAsShBcgYhmJLcuyT59p4CX4TBBYQfb6rmI/kddEn+VzhSQ==
X-Received: by 2002:a05:6000:1706:b0:2bf:df72:fdf4 with SMTP id
 n6-20020a056000170600b002bfdf72fdf4mr6446956wrc.17.1675353121603; 
 Thu, 02 Feb 2023 07:52:01 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t16-20020adfe450000000b002bbdcd15e44sm19746259wrm.37.2023.02.02.07.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 07:52:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,  qemu-devel@nongnu.org,
 dgilbert@redhat.com,  lsoaresp@redhat.com,  Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
In-Reply-To: <Y9vAw4QxR7i1GnzH@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 2 Feb 2023 13:55:15 +0000")
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-2-manish.mishra@nutanix.com>
 <877cx0mf4b.fsf@secure.mitica> <Y9utB91u5JFeHBiN@redhat.com>
 <87sffokz73.fsf@secure.mitica> <Y9u26aMxlryK5c3o@redhat.com>
 <87k010kwzq.fsf@secure.mitica> <Y9vAw4QxR7i1GnzH@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 16:51:59 +0100
Message-ID: <87wn50m5eo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Thu, Feb 02, 2023 at 02:39:05PM +0100, Juan Quintela wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> > On Thu, Feb 02, 2023 at 01:51:28PM +0100, Juan Quintela wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> >> > On Thu, Feb 02, 2023 at 01:22:12PM +0100, Juan Quintela wrote:
>> >> >> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>> >> >> > MSG_PEEK peeks at the channel, The data is treated as unread and
>> >> >> > the next read shall still return this data. This support is
>> >> >> > currently added only for socket class. Extra parameter 'flags'
>> >> >> > is added to io_readv calls to pass extra read flags like MSG_PEE=
K.
>> >> >> >
>> >> >> > Reviewed-by: Peter Xu <peterx@redhat.com>
>> >> >> > Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
>> >> >> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> >> >> > Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>> >> >>=20
>> >> >>=20
>> >> >> This change breaks RDMA migration.
>> >> >>=20
>> >> >> FAILED: libcommon.fa.p/migration_rdma.c.o
>> >> >> cc -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/usr/inc=
lude/libpng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/inc=
lude/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/in=
clude/sysprof-4 -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCS=
C -I/usr/include/p11-kit-1 -I/usr/include/libusb-1.0 -I/usr/include/SDL2 -I=
/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/u=
sr/include/slirp -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -st=
d=3Dgnu11 -O2 -g -isystem /mnt/code/qemu/full/linux-headers -isystem linux-=
headers -iquote . -iquote /mnt/code/qemu/full -iquote /mnt/code/qemu/full/i=
nclude -iquote /mnt/code/qemu/full/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_F=
ORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURC=
E -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissin=
g-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration =
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-=
self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wex=
pansion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute -W=
no-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protec=
tor-strong -fPIE -D_REENTRANT -Wno-undef -DSTRUCT_IOVEC_DEFINED -MD -MQ lib=
common.fa.p/migration_rdma.c.o -MF libcommon.fa.p/migration_rdma.c.o.d -o l=
ibcommon.fa.p/migration_rdma.c.o -c ../../../../mnt/code/qemu/full/migratio=
n/rdma.c
>> >> >> ../../../../mnt/code/qemu/full/migration/rdma.c: In function =E2=
=80=98qio_channel_rdma_class_init=E2=80=99:
>> >> >> ../../../../mnt/code/qemu/full/migration/rdma.c:4020:25: error: as=
signment to =E2=80=98ssize_t (*)(QIOChannel *, const struct iovec *, size_t=
,  int **, size_t *, int,  Error **)=E2=80=99 {aka =E2=80=98long int (*)(QI=
OChannel *, const struct iovec *, long unsigned int,  int **, long unsigned=
 int *, int,  Error **)=E2=80=99} from incompatible pointer type =E2=80=98s=
size_t (*)(QIOChannel *, const struct iovec *, size_t,  int **, size_t *, E=
rror **)=E2=80=99 {aka =E2=80=98long int (*)(QIOChannel *, const struct iov=
ec *, long unsigned int,  int **, long unsigned int *, Error **)=E2=80=99} =
[-Werror=3Dincompatible-pointer-types]
>> >> >>  4020 |     ioc_klass->io_readv =3D qio_channel_rdma_readv;
>> >> >>       |                         ^
>> >> >> cc1: all warnings being treated as errors
>> >> >>=20
>> >> >> And I don't really know how to fix it, because the problem is that=
 rdma
>> >> >> don't use qio_channel_readv_full() at all.
>> >> >
>> >> > Likely qio_channel_rdma_readv just adds the 'int flags' param added.
>> >> > It doesn't need to actually do anything with the flags as they are
>> >> > checked before
>> >>=20
>> >> I can do that.  That would fix the compilation issue.
>> >>=20
>> >> But will rdma work?  Because it fakes a qio channel, so what is going=
 to
>> >> implement the MSG_PEEK functionality for it?  It don't end calling
>> >> recv() at all.
>> >
>> > It is no problem - the qio_channel_readv method changes in this patch
>> > add:
>> >
>> > +    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
>> > +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PE=
EK)) {
>> > +        error_setg_errno(errp, EINVAL,
>> > +                         "Channel does not support peek read");
>> > +        return -1;
>> > +    }
>> >
>> >
>> > so it is impossible for qio_channel_rdma_readv to be invoked with
>> > flags having MSG_PEEK set, thus RDMA can ignore the whole concept.
>>=20
>> And as we require MSG_PEEK to do migration, we have lost RDMA migration
>> in the process.
>>=20
>> The following patch on the series use this functionality to read the
>> beggining of the streams in the channels.
>
> It guards that usage of MSG_PEEK with
>
>    if (... && qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_P=
EEK)) {

You win.

They are back.

Thanks very much for the explanation.


