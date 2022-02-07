Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF94ACC5C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:57:15 +0100 (CET)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCwc-0001RJ-Kl
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHCoD-0000Ht-A6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:48:34 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:34043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHCnl-0006jn-MY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=mPo/BlFt4qzVG3ctYcDDuTb11xRQOjuuKKzqRWP/i7s=; b=a6+BRiN/R6lOk69PAmLLjatRVW
 xGoScRSmpLqYXHStL244lgkvq8YX6FAGqLb6n7cn+siZ19gy6B1NdA/m+gb2yp4iqzbeFcPrravKY
 4oCvYTTJm/tfWeuqhIF32pybvFH0Y46MM9eOAtGIt/3EL72y6PL30Ul4cg1A51cA+YjEJbcmwK4BA
 Xs/MlbVl6fFIHSHIEIZQ2Pe9TH9x358TCIjYvC+LjbcafmOLpbSXKT4G+xpKoPtCVbbK1Rsol7akK
 KWeERlK6j398oqwQeJ0lyWmCjulcNRAYmVEvOiCEeJTX8mgtqvRQiBZBnp3vC5jHpCyipK9eUVU72
 Hd202AOeWrtlZGjQe0GlVolnAL/hNWFQ79c786d3dOa8LZXwb/2OOqXE50FBq7+5+GxYJ9eHo7/nz
 XWSO33i3abs/bSPrz9LMYFZBB97QydZfHv4fMYuK/qpwYd/GGybiHJtsQzKbYwglROypWdaG/O3Q6
 7xfkdgb8JhV29ZNCugQHCng9iL2IdE7DnJ2LzrVazfLl3qRc835LzjtdxwntVA3d0sjIzBSGDNbH3
 gOvj61dnRT4IaBLJFNvkwL8+R/CypO+/Cfhs3Z6XFSNiusL641MyVsMQT1oTdYKRSXJ2odEUrjk/L
 KaJ0rmqMF+7bS1ZCVCiT/s4L7epmlRdfNf2tnmEjg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Vivek <vgoyal@redhat.com>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Mon, 07 Feb 2022 23:47:58 +0100
Message-ID: <8937604.n9ZydULHvW@silver>
In-Reply-To: <CAB26zV23fCzmtQd+heort4rXkqU0SD-dSBVwzabxE-64edWFmg@mail.gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <5204641.elYuxvqpol@silver>
 <CAB26zV23fCzmtQd+heort4rXkqU0SD-dSBVwzabxE-64edWFmg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 7. Februar 2022 22:07:34 CET Will Cohen wrote:
> On Mon, Feb 7, 2022 at 9:21 AM Christian Schoenebeck
> <qemu_oss@crudebyte.com>
> wrote:
> > On Montag, 7. Februar 2022 11:57:25 CET Dr. David Alan Gilbert wrote:
> > > * Greg Kurz (groug@kaod.org) wrote:
> > > > On Mon, 7 Feb 2022 11:30:18 +0100
> > > >=20
> > > > Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:
> > > > > On 7/2/22 09:47, Greg Kurz wrote:
> > > > > > On Sun, 6 Feb 2022 20:10:23 -0500
> > > > > >=20
> > > > > > Will Cohen <wwcohen@gmail.com> wrote:
> > > > > >> This patch set currently places it in 9p-util only because 9p =
is
> >=20
> > the
> >=20
> > > > > >> only
> > > > > >> place where this issue seems to have come up so far and we were
> >=20
> > wary
> >=20
> > > > > >> of
> > > > > >> editing files too far afield, but I have no attachment to its
> > > > > >> specific
> > > > > >> location!
> > > > > >=20
> > > > > > Inline comments are preferred on qemu-devel. Please don't top p=
ost
> >=20
> > !
> >=20
> > > > > > This complicates the review a lot.
> > > > > >=20
> > > > > > This is indeed a good candidate for osdep. This being said, unl=
ess
> > > > > > there's
> > > > > > some other user in the QEMU code base, it is acceptable to leave
> > > > > > it
> > > > > > under
> > > > > > 9pfs.
> > > > >=20
> > > > > virtiofsd could eventually use it.
> > > >=20
> > > > Indeed but virtiofsd is for linux hosts only AFAICT and I'm not awa=
re
> >=20
> > of
> >=20
> > > > any work to support any other host OS.
> > > >=20
> > > > Cc'ing virtio-fs people for inputs on this topic.
> > >=20
> > > Indeeed, there's a lot of Linux specific code in the virtiofsd - I kn=
ow
> > > people are interested in other platforms, but I'm not sure that's the
> > > right starting point.
> > >=20
> > > Dave
> >=20
> > Agreeing with Greg here: i.e. I would have placed this into osdep, but I
> > would
> > not insist on it either.
> >=20
> > Best regards,
> > Christian Schoenebeck
>=20
> This makes sense. A revised version of this patch, moving qemu_mknodat fr=
om
> 9p-util to osdep and os-posix, is attached below. I'd appreciate any
> feedback from those looped in here, so that the context isn't lost before
> resubmitting as a v5 patch, especially since this is starting to touch
> files outside of 9p.
>=20
> From c9713c87163da7c96b5357d0d85ac318ae3d3051 Mon Sep 17 00:00:00 2001
> From: Keno Fischer <keno@juliacomputing.com>
> Date: Sat, 16 Jun 2018 20:56:55 -0400
> Subject: [PATCH] 9p: darwin: Implement compatibility for mknodat
>=20
> Darwin does not support mknodat. However, to avoid race conditions
> with later setting the permissions, we must avoid using mknod on
> the full path instead. We could try to fchdir, but that would cause
> problems if multiple threads try to call mknodat at the same time.
> However, luckily there is a solution: Darwin includes a function
> that sets the cwd for the current thread only.
> This should suffice to use mknod safely.
>=20
> This function (pthread_fchdir_np) is protected by a check in
> meson in a patch later in tihs series.
>=20
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style
>              - Replace clang references with gcc
>              - Note radar filed with Apple for missing syscall
>              - Replace direct syscall with pthread_fchdir_np and
>                adjust patch notes accordingly
>              - Move qemu_mknodat from 9p-util to osdep and os-posix]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-local.c   |  4 ++--
>  include/qemu/osdep.h | 10 ++++++++++
>  os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index a0d08e5216..d42ce6d8b8 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> *dir_path,
>=20
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        err =3D mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> +        err =3D qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
>          if (err =3D=3D -1) {
>              goto out;
>          }
> @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> *dir_path,
>          }
>      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
>                 fs_ctx->export_flags & V9FS_SM_NONE) {
> -        err =3D mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> +        err =3D qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev=
);
>          if (err =3D=3D -1) {
>              goto out;
>          }
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index d1660d67fa..f3a8367ece 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -810,3 +810,13 @@ static inline int
> platform_does_not_support_system(const char *command)
>  #endif
>=20
>  #endif
> +
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> + * os-posix.c
> + */
> +#ifdef CONFIG_DARWIN
> +int pthread_fchdir_np(int fd);
> +#endif

I would make that:

#ifdef CONFIG_DARWIN
int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
#endif

here and ...

> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev=
);
> diff --git a/os-posix.c b/os-posix.c
> index ae6c9f2a5e..95c1607065 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -24,6 +24,7 @@
>   */
>=20
>  #include "qemu/osdep.h"
> +#include <os/availability.h>
>  #include <sys/wait.h>
>  #include <pwd.h>
>  #include <grp.h>
> @@ -332,3 +333,36 @@ int os_mlock(void)
>      return -ENOSYS;
>  #endif
>  }
> +
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed.
> + *
> + * Radar filed with Apple for implementing mknodat:
> + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> + */
> +#ifdef CONFIG_DARWIN
> +
> +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));

=2E.. drop the duplicate declaration of pthread_fchdir_np() here.

> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    int preserved_errno, err;
> +    if (pthread_fchdir_np(dirfd) < 0) {
> +        return -1;
> +    }
> +    err =3D mknod(filename, mode, dev);
> +    preserved_errno =3D errno;
> +    /* Stop using the thread-local cwd */
> +    pthread_fchdir_np(-1);
> +    if (err < 0) {
> +        errno =3D preserved_errno;
> +    }
> +    return err;
> +}
> +#else
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    return mknodat(dirfd, filename, mode, dev);
> +}
> +#endif



