Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408E2DAB6D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:53:35 +0100 (CET)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7xW-0004dt-Ff
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kp7w5-0003w8-Gm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:52:05 -0500
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:42375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kp7w2-0007Af-Mi
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:52:05 -0500
Received: by mail-vs1-xe44.google.com with SMTP id b23so10701580vsp.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 02:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YgNXq0TmeiwXykaHAsHUrt8oIwT4A523ZaG4MxpRXho=;
 b=do38suFu6CremSvwV1SxgbiPTlJ2CnbEtoCJyF/Sx5rYYvBU4Qwh8EDIklv/q6QzaF
 aaKHahLi1Ne7ZJCQ2U4qCsDc9wNivPUzYOLJlgXlouRygAv0nVOwbd80hQdH/F3gdb+l
 haEVDIr74vkwtr/+CptgiHnG3Z7PWzLvJ5t9qoIZNc8PhCGGmoZRzax7/clOZM7EobsD
 eeEtGvbGHvrQKgkAeGMMPTSzZjJbySqrLFBdAUKgbGg9ANA+EHEEAbEdlstBXE/Axu1G
 USfXsS7xm9Es9Um6yS1ZD0VGzrMpcCiV+g3UJ7pqwj6m4Plthc5kXJmwHFlZ/bA5SK4a
 wWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YgNXq0TmeiwXykaHAsHUrt8oIwT4A523ZaG4MxpRXho=;
 b=WjGaMJRRIpf+GgwR1TdFXlzJMXbduIwmzGbxb7wLp2jhaGsX3kN6EHBGE2QPMZ5pXD
 rP5YXDZ7uJf7fmW5tvwdd3zgRanzUaH7Wcxr3YxQSJ+BhNeoEsnSZBllFspg+Aar7r8/
 VOz7FP8KXVB16DSgrwmPUUYahkkwnCG//KpB8dQEsru5jpe70HbYWxQ4IUYVMDirdfjd
 uia45B9x9FX/VB3aurw+1fqB2blAsdCT0MIcUWrM3ziXkiRtfw6/s1Y9Km0XOD65oREB
 G1VYoBRPTqNY7dpIU5vF1UXEYL4XbH+VMpChhzSJq6qFNbBlvHZPxedZReGz3tUc9Uht
 TzHA==
X-Gm-Message-State: AOAM533HBm6F9iyhjcuEZ8Y3wHff120bGjVd+zqMakyAvYOrrXn1exc3
 ZZfsGzyTHYosp9XPRU2scFg1tA1nGmZdcPTS3EzyHQ==
X-Google-Smtp-Source: ABdhPJzGA2tO5PAVLNc2Fvx2PhCXZS+Kgiv8iZyLBt8EyGCvBuQqAJpqx14uVn//VonlrVOQF20qsJjuJBtJl+FIfHo=
X-Received: by 2002:a05:6102:40a:: with SMTP id
 d10mr10867428vsq.29.1608029521180; 
 Tue, 15 Dec 2020 02:52:01 -0800 (PST)
MIME-Version: 1.0
References: <1608016169-5639-1-git-send-email-fengli@smartx.com>
 <20201215100830.GG121272@redhat.com>
In-Reply-To: <20201215100830.GG121272@redhat.com>
From: Li Feng <fengli@smartx.com>
Date: Tue, 15 Dec 2020 18:51:49 +0800
Message-ID: <CAHckoCzXfq=Ox-=7vQ4d7soJsftRd62kSLfe-STG7PQbY03UBQ@mail.gmail.com>
Subject: Re: [PATCH v4] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::e44;
 envelope-from=fengli@smartx.com; helo=mail-vs1-xe44.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Feng Li <lifeng1519@gmail.com>,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Kyle Zhang <kyle@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=
=9C=8815=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=886:08=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On Tue, Dec 15, 2020 at 03:09:28PM +0800, Li Feng wrote:
> > This patch addresses this issue:
> > When accessing a volume on an NFS filesystem without supporting the fil=
e lock,
> > tools, like qemu-img, will complain "Failed to lock byte 100".
> >
> > In the original code, the qemu_has_ofd_lock will test the lock on the
> > "/dev/null" pseudo-file. Actually, the file.locking is per-drive proper=
ty,
> > which depends on the underlay filesystem.
> >
> > In this patch, add a new 'qemu_has_file_lock' to detect whether the
> > file supports the file lock. And disable the lock when the underlay fil=
e
> > system doesn't support locks.
> >
> > Signed-off-by: Li Feng <fengli@smartx.com>
> > ---
> > v4: use the fd as the qemu_has_file_lock argument.
> > v3: don't call the qemu_has_ofd_lock, use a new function instead.
> > v2: remove the refactoring.
> > ---
> >  block/file-posix.c   | 66 +++++++++++++++++++++++++-------------------
> >  include/qemu/osdep.h |  1 +
> >  util/osdep.c         | 19 +++++++++++++
> >  3 files changed, 58 insertions(+), 28 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 806764f7e3..9708212f01 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -584,6 +584,21 @@ static int raw_open_common(BlockDriverState *bs, Q=
Dict *options,
> >      s->use_linux_io_uring =3D (aio =3D=3D BLOCKDEV_AIO_OPTIONS_IO_URIN=
G);
> >  #endif
> >
> > +    s->open_flags =3D open_flags;
> > +    raw_parse_flags(bdrv_flags, &s->open_flags, false);
> > +
> > +    s->fd =3D -1;
> > +    fd =3D qemu_open(filename, s->open_flags, errp);
> > +    ret =3D fd < 0 ? -errno : 0;
> > +
> > +    if (ret < 0) {
> > +        if (ret =3D=3D -EROFS) {
> > +            ret =3D -EACCES;
> > +        }
> > +        goto fail;
> > +    }
> > +    s->fd =3D fd;
> > +
> >      locking =3D qapi_enum_parse(&OnOffAuto_lookup,
> >                                qemu_opt_get(opts, "locking"),
> >                                ON_OFF_AUTO_AUTO, &local_err);
> > @@ -607,6 +622,13 @@ static int raw_open_common(BlockDriverState *bs, Q=
Dict *options,
> >          break;
> >      case ON_OFF_AUTO_AUTO:
> >          s->use_lock =3D qemu_has_ofd_lock();
> > +        if (s->use_lock && !qemu_has_file_lock(s->fd)) {
> > +            /*
> > +             * When the os supports the OFD lock, but the filesystem d=
oesn't
> > +             * support, just disable the file lock.
> > +             */
> > +            s->use_lock =3D false;
> > +        }
>
> This should just be
>
>   s->use_lock =3D qemu_has_file_lock(s->fd) && qemu_has_ofd_lock();
>
Acked.

>
>
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 66d01b9160..07de97e2c5 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -225,6 +225,25 @@ static void qemu_probe_lock_ops(void)
> >      }
> >  }
> >
> > +bool qemu_has_file_lock(int fd)
> > +{
> > +#ifdef F_OFD_SETLK
> > +    int cmd =3D F_OFD_GETLK;
> > +#else
> > +    int cmd =3D F_GETLK;
> > +#endif
>
> This should unconditionally use  F_GETLK.
Acked.

>
> > +    int ret;
> > +    struct flock fl =3D {
> > +        .l_whence =3D SEEK_SET,
> > +        .l_start  =3D 0,
> > +        .l_len    =3D 0,
> > +        .l_type   =3D F_WRLCK,
> > +    };
> > +
> > +    ret =3D fcntl(fd, cmd, &fl);
> > +    return ret =3D=3D 0;
> > +}
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

