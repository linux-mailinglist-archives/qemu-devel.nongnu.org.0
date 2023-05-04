Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1406F65EE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:39:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTYC-0005Qu-Le; Thu, 04 May 2023 03:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puTYA-0005QL-P1
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puTY9-00056p-4O
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683185927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nhmbd0mu+M1vOSPYSO7rxQdsSHGwP/yzkzcGUfqOvcA=;
 b=NjFhCUiA2YT7NiytH2p+NrCcmnKVqrENXcPrfeWLEyWIxvPM5zCFOHbUyr+b9I6hFfMdDO
 2NEuPkkjK6zYlfiNelPlcOIVMwv4WafpqnhEA+OKbhMHOvhjGJE6rM2921r893gjZqdbcM
 sVK3yvuWj6Ii86JVmE7H0XqmfxhzFMM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-uid29SenO3i8YjEtzy_9iQ-1; Thu, 04 May 2023 03:38:45 -0400
X-MC-Unique: uid29SenO3i8YjEtzy_9iQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-b9a7df507c5so380693276.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683185925; x=1685777925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nhmbd0mu+M1vOSPYSO7rxQdsSHGwP/yzkzcGUfqOvcA=;
 b=Y2zfrG/BthdSPykijbLntEIrmyCo0RxsuLptvkt+13xisKO1aGyXiDPNCkbrP1o09k
 FCcaELQVHIU2MnAzfHA2ykyiqyfyyXClUg36SpuFSkxOHVjtZpRJnfKC9FEpkUeGewEZ
 /VS91WAUoAewYp8WFvyiZ4AeTZ7NX0hSzgS9chcNd0qeREcd4qKGss6kp7OryouU4to4
 C5DktRLSH4a2CH5RVh4jxr45WXKOWH3S/EOX/uH8LAvnFomxYUqPfGAdi2P+j9DG4X/A
 D/BjcruynqsnOQY0Zk6OB3OU8DxMmsdqPPjdFpvTS5cSAl1yJCDiM7r+HFPp1BMQbszs
 kkBA==
X-Gm-Message-State: AC+VfDwAbNjnWEuDFruxOtLyZnEfh00kcXim75CkA1+bL16Rhyr6lmQV
 jsvPc/XAf+c7w5hUb+1uGO/0czmVGJi3WZeJRMMDswYjyH16LSmCf+ICnD1tKoIAjwWFtKQuppF
 Za3p+8mENoUd/tYfMvvzq+F12QMcFnDI=
X-Received: by 2002:a25:408d:0:b0:b8f:384b:4f83 with SMTP id
 n135-20020a25408d000000b00b8f384b4f83mr21507928yba.33.1683185925336; 
 Thu, 04 May 2023 00:38:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nWPpmatrjZxBwnOb3bRaXCL//5CW9KFMmVAzp+ESWDZytcPivKb5h9U5wwAJvbEBuc3u5kyHRZFpp7U/HaJY=
X-Received: by 2002:a25:408d:0:b0:b8f:384b:4f83 with SMTP id
 n135-20020a25408d000000b00b8f384b4f83mr21507913yba.33.1683185925049; Thu, 04
 May 2023 00:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230502145050.224615-1-sgarzare@redhat.com>
 <20230502190232.GB535070@fedora>
 <2dhjygwf76syej7espfdecxcoawborvm2qqx66bz3g6ljdvg53@xo3d64wtbdeu>
 <20230503132618.GD757667@fedora>
In-Reply-To: <20230503132618.GD757667@fedora>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 4 May 2023 09:38:33 +0200
Message-ID: <CAGxU2F4UrTcmatM96MiH-3JwOkZhXJNu5yM7+WH28BS6+Z5f5Q@mail.gmail.com>
Subject: Re: [PATCH] block/blkio: add 'fd' option to virtio-blk-vhost-vdpa
 driver
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, jjongsma@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 3, 2023 at 5:57=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
>
> On Wed, May 03, 2023 at 11:15:56AM +0200, Stefano Garzarella wrote:
> > On Tue, May 02, 2023 at 03:02:32PM -0400, Stefan Hajnoczi wrote:
> > > On Tue, May 02, 2023 at 04:50:50PM +0200, Stefano Garzarella wrote:
> > > > The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
> > > > 'fd' property. Let's expose this to the user, so the management lay=
er
> > > > can pass the file descriptor of an already opened vhost-vdpa charac=
ter
> > > > device. This is useful especially when the device can only be acces=
sed
> > > > with certain privileges.
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > >
> > > > Notes:
> > > >     As an alternative we could support passing `/dev/fdset/N` via '=
path',
> > > >     always opening the path with qemu_open() and passing the fd to =
the
> > > >     libblkio driver.
> > > >     I preferred to add a new parameter though, because the code is
> > > >     simpler without changing how path works (alternatively we shoul=
d check
> > > >     first if fd is supported by the driver or not).
> > > >
> > > >     What do you think?
> > >
> > > I think the approach in this patch is fine.
> > >
> > > >
> > > >     Thanks,
> > > >     Stefano
> > > >
> > > >  qapi/block-core.json |  6 +++++-
> > > >  block/blkio.c        | 45 ++++++++++++++++++++++++++++++++++++++++=
+++-
> > > >  2 files changed, 49 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > > index b57978957f..9f70777d49 100644
> > > > --- a/qapi/block-core.json
> > > > +++ b/qapi/block-core.json
> > > > @@ -3841,10 +3841,14 @@
> > > >  #
> > > >  # @path: path to the vhost-vdpa character device.
> > > >  #
> > > > +# @fd: file descriptor of an already opened vhost-vdpa character d=
evice.
> > > > +#      (Since 8.1)
> > > > +#
> > > >  # Since: 7.2
> > > >  ##
> > > >  { 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
> > > > -  'data': { 'path': 'str' },
> > > > +  'data': { '*path': 'str',
> > > > +            '*fd': 'str' },
> > > >    'if': 'CONFIG_BLKIO' }
> > > >
> > > >  ##
> > > > diff --git a/block/blkio.c b/block/blkio.c
> > > > index 0cdc99a729..98394b5745 100644
> > > > --- a/block/blkio.c
> > > > +++ b/block/blkio.c
> > > > @@ -694,6 +694,49 @@ static int blkio_virtio_blk_common_open(BlockD=
riverState *bs,
> > > >      return 0;
> > > >  }
> > > >
> > > > +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
> > > > +        QDict *options, int flags, Error **errp)
> > > > +{
> > > > +    const char *path =3D qdict_get_try_str(options, "path");
> > > > +    const char *fd_str =3D qdict_get_try_str(options, "fd");
> > > > +    BDRVBlkioState *s =3D bs->opaque;
> > > > +    int ret;
> > > > +
> > > > +    if (path && fd_str) {
> > > > +        error_setg(errp, "'path' and 'fd' options are mutually exc=
lusive");
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    if (!path && !fd_str) {
> > > > +        error_setg(errp, "none of 'path' or 'fd' options was speci=
fied");
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    if (path) {
> > > > +        ret =3D blkio_set_str(s->blkio, "path", path);
> > > > +        qdict_del(options, "path");
> > > > +        if (ret < 0) {
> > > > +            error_setg_errno(errp, -ret, "failed to set path: %s",
> > > > +                             blkio_get_error_msg());
> > > > +            return ret;
> > > > +        }
> > > > +    } else {
> > > > +        ret =3D blkio_set_str(s->blkio, "fd", fd_str);
> > >
> > > monitor_fd_param() is used by vhost-net, vhost-vsock, vhost-scsi, etc=
.
> > >
> > > I think QEMU should parse the fd string and resolve it to a file
> > > descriptor so the fd passing syntax matches the other vhost devices.
> >
> > Okay, but I have a linker issue if I use monitor_fd_param().
> > IIUC because blkio is built as a module, so what about adding
> > qemu_fd_param() in libqemuutil?
>
> Modules can access any extern function in QEMU so I don't think there is
> a fundamental limitation there.
>
> Maybe it's related to the dependencies between the blkio module and
> monitor/ code. monitor_get_fd_param() is in softmmu_ss, which block
> drivers don't directly depend on AFAICT.

Yep, I think this is the case.

>
> >
> > I mean something like this:
> >
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index 9eff0be95b..87360c983a 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -568,6 +568,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len=
, bool exclusive);
> >  int qemu_unlock_fd(int fd, int64_t start, int64_t len);
> >  int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusi=
ve);
> >  bool qemu_has_ofd_lock(void);
> > +int qemu_fd_param(const char *fdname, Error **errp);
> >  #endif
> >
> >  #if defined(__HAIKU__) && defined(__i386__)
> > diff --git a/util/osdep.c b/util/osdep.c
> > index e996c4744a..ed0832810b 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -234,6 +234,11 @@ bool qemu_has_ofd_lock(void)
> >  #endif
> >  }
> >
> > +int qemu_fd_param(const char *fdname, Error **errp)
> > +{
> > +    return monitor_fd_param(monitor_cur(), fdname, errp);
> > +}
>
> I'm not sure. If it works with modules enabled/disabled,
> qemu-io/qemu-img/etc, and qemu-user then I guess this solution is okay.

It seems to work, and I think it's easier than introducing the
dependency between the blkio module and monitor/ code.
Something similar has already been done with monitor_get_fd().
Anyway I'll send v2 by adding that patch and we can discuss it there.

Thanks for the advice,
Stefano


