Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1EC4C6ED0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:04:57 +0100 (CET)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOge0-0002XF-6S
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nOgHe-0002o5-Em
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:41:51 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nOgHa-0005gG-5T
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:41:48 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-SKWmTflxPAWBaC6HMOAt9A-1; Mon, 28 Feb 2022 08:41:33 -0500
X-MC-Unique: SKWmTflxPAWBaC6HMOAt9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EC7C51E6;
 Mon, 28 Feb 2022 13:41:32 +0000 (UTC)
Received: from bahia (unknown [10.39.195.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BC6D2ED86;
 Mon, 28 Feb 2022 13:41:17 +0000 (UTC)
Date: Mon, 28 Feb 2022 14:41:16 +0100
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Message-ID: <20220228144116.02d9236f@bahia>
In-Reply-To: <CAB26zV1WGKCCD3xHzKq-DWuX7fNRo-jk8of6kPNVN0eH=yW5Ag@mail.gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-10-wwcohen@gmail.com>
 <5277572.8N0aQqchxN@silver>
 <CAB26zV1WGKCCD3xHzKq-DWuX7fNRo-jk8of6kPNVN0eH=yW5Ag@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 08:37:10 -0500
Will Cohen <wwcohen@gmail.com> wrote:

> On Mon, Feb 28, 2022 at 8:20 AM Christian Schoenebeck <
> qemu_oss@crudebyte.com> wrote:
>=20
> > On Sonntag, 27. Februar 2022 23:35:20 CET Will Cohen wrote:
> > > From: Keno Fischer <keno@juliacomputing.com>
> > >
> > > Darwin does not support mknodat. However, to avoid race conditions
> > > with later setting the permissions, we must avoid using mknod on
> > > the full path instead. We could try to fchdir, but that would cause
> > > problems if multiple threads try to call mknodat at the same time.
> > > However, luckily there is a solution: Darwin includes a function
> > > that sets the cwd for the current thread only.
> > > This should suffice to use mknod safely.
> > >
> > > This function (pthread_fchdir_np) is protected by a check in
> > > meson in a patch later in this series.
> > >
> > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > [Will Cohen: - Adjust coding style
> > >              - Replace clang references with gcc
> > >              - Note radar filed with Apple for missing syscall
> > >              - Replace direct syscall with pthread_fchdir_np and
> > >                adjust patch notes accordingly
> > >              - Declare pthread_fchdir_np with
> > >              - __attribute__((weak_import)) to allow checking for
> > >                its presence before usage
> > >              - Move declarations above cplusplus guard
> > >              - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> > >                presence in 9p-util
> > >              - Rebase to apply cleanly on top of the 2022-02-10
> > >                changes to 9pfs
> > >              - Fix line over 90 characters formatting error]
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > >  hw/9pfs/9p-local.c       |  4 ++--
> > >  hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
> > >  hw/9pfs/9p-util-linux.c  |  6 ++++++
> > >  hw/9pfs/9p-util.h        | 11 +++++++++++
> > >  meson.build              |  1 +
> > >  5 files changed, 53 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > index a0d08e5216..d42ce6d8b8 100644
> > > --- a/hw/9pfs/9p-local.c
> > > +++ b/hw/9pfs/9p-local.c
> > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPat=
h
> > > *dir_path,
> > >
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > -        err =3D mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > +        err =3D qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0=
);
> > >          if (err =3D=3D -1) {
> > >              goto out;
> > >          }
> > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPat=
h
> > > *dir_path, }
> > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > > -        err =3D mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev)=
;
> > > +        err =3D qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_=
rdev);
> > >          if (err =3D=3D -1) {
> > >              goto out;
> > >          }
> > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > > index cdb4c9e24c..bec0253474 100644
> > > --- a/hw/9pfs/9p-util-darwin.c
> > > +++ b/hw/9pfs/9p-util-darwin.c
> > > @@ -7,6 +7,8 @@
> > >
> > >  #include "qemu/osdep.h"
> > >  #include "qemu/xattr.h"
> > > +#include "qapi/error.h"
> > > +#include "qemu/error-report.h"
> > >  #include "9p-util.h"
> > >
> > >  ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const =
char
> > > *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const c=
har
> > > *filename, const char *name, close_preserve_errno(fd);
> > >      return ret;
> > >  }
> > > +
> > > +/*
> > > + * As long as mknodat is not available on macOS, this workaround
> > > + * using pthread_fchdir_np is needed.
> > > + *
> > > + * Radar filed with Apple for implementing mknodat:
> > > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > > + */
> > > +#if defined CONFIG_PTHREAD_FCHDIR_NP
> > > +
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > dev)
> > > +{
> > > +    int preserved_errno, err;
> > > +    if (!pthread_fchdir_np) {
> > > +        error_report_once("pthread_fchdir_np() not available on this
> > version of macOS");
> >
> > You took the code style error message a bit too literal; this line is s=
till
> > too long:
> >
> > WARNING: line over 80 characters
> > #199: FILE: hw/9pfs/9p-util-darwin.c:81:
> > +        error_report_once("pthread_fchdir_np() not available on this
> > version of macOS");
> >
> > total: 0 errors, 1 warnings, 91 lines checked
> >
> > However this is too trivial to send a v10 just for this. If there are n=
o
> > other
> > issues in this v9 then I'll simply fix this on my end. My plan is to qu=
eue
> > this series tomorrow.
> >
> > Best regards,
> > Christian Schoenebeck
>=20
>=20
> Sorry for the over-literalness. I was just trying to avoid a need for
> further changes by being too dramatic on my end for a small fix! Any
> stylistic changes needed here are, of course, totally acceptable!
>=20

As Thomas is saying this is just a warning and it is certainly
easier for a developer to grep the error message if it is kept
on a single line.

> >
> >
> > > +        return -ENOTSUP;
> > > +    }
> > > +    if (pthread_fchdir_np(dirfd) < 0) {
> > > +        return -1;
> > > +    }
> > > +    err =3D mknod(filename, mode, dev);
> > > +    preserved_errno =3D errno;
> > > +    /* Stop using the thread-local cwd */
> > > +    pthread_fchdir_np(-1);
> > > +    if (err < 0) {
> > > +        errno =3D preserved_errno;
> > > +    }
> > > +    return err;
> > > +}
> > > +
> > > +#endif
> > > diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> > > index 398614a5d0..db451b0784 100644
> > > --- a/hw/9pfs/9p-util-linux.c
> > > +++ b/hw/9pfs/9p-util-linux.c
> > > @@ -61,4 +61,10 @@ int fsetxattrat_nofollow(int dirfd, const char
> > *filename,
> > > const char *name, ret =3D lsetxattr(proc_path, name, value, size, fla=
gs);
> > >      g_free(proc_path);
> > >      return ret;
> > > +
> > > +}
> > > +
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > dev)
> > > +{
> > > +    return mknodat(dirfd, filename, mode, dev);
> > >  }
> > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > > index 9abff79884..1f74d37558 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -112,5 +112,16 @@ static inline off_t qemu_dirent_off(struct diren=
t
> > > *dent) #endif
> > >  }
> > >
> > > +/*
> > > + * As long as mknodat is not available on macOS, this workaround
> > > + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> > > + * os-posix.c. pthread_fchdir_np is weakly linked here as a guard
> > > + * in case it disappears in future macOS versions, because it is
> > > + * is a private API.
> > > + */
> > > +#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > > +int pthread_fchdir_np(int fd) __attribute__((weak_import));
> > > +#endif
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > dev);
> > >
> > >  #endif
> > > diff --git a/meson.build b/meson.build
> > > index 8df40bfac4..3f8dca2c7a 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -1609,6 +1609,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE',
> > > cc.has_function('posix_fallocate'
> > > config_host_data.set('CONFIG_POSIX_MEMALIGN',
> > > cc.has_function('posix_memalign')) config_host_data.set('CONFIG_PPOLL=
',
> > > cc.has_function('ppoll'))
> > >  config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', pref=
ix:
> > > '#include <sys/uio.h>'))
> > +config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP',
> > > cc.has_function('pthread_fchdir_np'))
> > > config_host_data.set('CONFIG_SEM_TIMEDWAIT',
> > > cc.has_function('sem_timedwait', dependencies: threads))
> > > config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
> > > config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and
> > > cc.has_function('unshare'))
> >
> >
> >


