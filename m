Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50204C4B00
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:39:36 +0100 (CET)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdd1-0007TA-Ow
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNdVG-0000iq-D1
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:31:36 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNdVD-0003C4-5t
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=O0JHICHXqr+Bf+e1uWV/JB1UqLibTOpQvLXG8RTp6Zk=; b=tMDn97Jskr8Zjuk9dkKwqfNpxN
 18/Nz/vfUmAbYolKIvyKG0WNAO/CTAM4vFffPtyldNXy+05A61zXLtpo/pq5m9ljm7LFuWvXwjlag
 V5yHLQveJJlqZsXrCLEeUBMlQ7neWK3qS1D5oRAWMHA9Si5cCAAaW1xB4ugv3H4i89LxCL8JmiCLO
 mUJLXzrt93pBI8dCHuecbMIp6aWtA1Agf1Vp6YQnsfD0BoxEKRA1OEkJxhYOEYH7Gri7R8tOy3V8u
 feLP3U2H0XoILg4Kl9FDzLUslQnXurW1YL8vZxFt/lwr8WEHXl90wYPvqjIAKqMeQ452S6KT4HiNN
 NmYxfuORSH/BHu8iLs4N+TjycVBzKK9DaabYeHnEXI15H+SpSCAdhMNJCAX6xwSr0Afv4HDHMlAPt
 WnAyd7bwPz37MLo9PnmXk6NquHb0zV0pgmXzPUXUTl7nqbDQTAyJVOgrmejifDydY8j3wyERzujwm
 fAlzjx74drxKrLAvHdYDIJqfuKIoHKdZXIbT3yoh9/TxinNpeK00Io9WipDCZyvDZo0QYc2hRs9wo
 l2LkG0i/qgwjYX7tzxub1F4WNDTnGcukZH6Tq8dshR9QMO/LXgxghVC0zJJ4WTr2j2vubzbKO7Gg5
 ZvPCk/jZzgLFS+Fwiid+kGVFx84RTR+Cr2tXexYhA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Fri, 25 Feb 2022 17:31:25 +0100
Message-ID: <2843831.zseRdOWLSh@silver>
In-Reply-To: <CAB26zV2ePB=1ZHogaWndR5cc1Hru9BXRk88cbnN4LahLSFxCmQ@mail.gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
 <8571874.GWnKUVsiaS@silver>
 <CAB26zV2ePB=1ZHogaWndR5cc1Hru9BXRk88cbnN4LahLSFxCmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Freitag, 25. Februar 2022 15:00:40 CET Will Cohen wrote:
> On Tue, Feb 22, 2022 at 9:27 AM Christian Schoenebeck <
> 
> qemu_oss@crudebyte.com> wrote:
> > On Sonntag, 20. Februar 2022 17:50:54 CET Will Cohen wrote:
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
> > > 
> > >              - Replace clang references with gcc
> > >              - Note radar filed with Apple for missing syscall
> > >              - Replace direct syscall with pthread_fchdir_np and
> > >              
> > >                adjust patch notes accordingly
> > >              
> > >              - Move qemu_mknodat from 9p-util to osdep and os-posix
> > >              - Move pthread_fchdir_np declaration only to osdep
> > >              - Declare pthread_fchdir_np with
> > >              - __attribute__((weak_import)) to allow checking for
> > >              
> > >                its presence before usage
> > >              
> > >              - Move declarations above cplusplus guard
> > >              - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> > >              
> > >                presence in osdep.h and os-posix.c
> > >              
> > >              - Rebase to apply cleanly on top of the 2022-02-10
> > >              
> > >                changes to 9pfs]
> > > 
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > > 
> > >  hw/9pfs/9p-local.c   |  4 ++--
> > >  include/qemu/osdep.h | 12 ++++++++++++
> > >  meson.build          |  1 +
> > >  os-posix.c           | 35 +++++++++++++++++++++++++++++++++++
> > >  4 files changed, 50 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > index a0d08e5216..d42ce6d8b8 100644
> > > --- a/hw/9pfs/9p-local.c
> > > +++ b/hw/9pfs/9p-local.c
> > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > > *dir_path,
> > > 
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > >      
> > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > 
> > > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > 
> > >          if (err == -1) {
> > >          
> > >              goto out;
> > >          
> > >          }
> > > 
> > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > > *dir_path, }
> > > 
> > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > >      
> > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > > 
> > > -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
> > > credp->fc_rdev);
> > > 
> > >          if (err == -1) {
> > >          
> > >              goto out;
> > >          
> > >          }
> > > 
> > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > index ce12f64853..c0f442d791 100644
> > > --- a/include/qemu/osdep.h
> > > +++ b/include/qemu/osdep.h
> > > @@ -818,6 +818,18 @@ static inline int
> > > platform_does_not_support_system(const char *command) */
> > > 
> > >  struct dirent *qemu_dirent_dup(struct dirent *dent);
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
> > 
> > dev);
> > 
> > > +
> > > 
> > >  #ifdef __cplusplus
> > >  }
> > >  #endif
> > 
> > Peter just informed me that osdep.h is not the right place to add
> > something
> > like this:
> > 
> > https://lore.kernel.org/qemu-devel/CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKL
> > WUDjk7v6Khmg@mail.gmail.com/
> > 
> > So this should be moved into a different header file.
> 
> Does that logic apply here too? In some ways I'd say that mknodat falls
> into the category of "things without which code would work on most
> platforms but fail to compile or misbehave on a minority of host OSes." If
> osdep.h is the wrong place, should it go back to 9p-util, where it lived
> before it moved to osdep?

The other function Peter wanted out from osdep.h would fall into that category 
as well. I understand it like "only put things into osdep.h as very last 
resort". CCing Peter on this. If he doesn't give you green light, or on doubt, 
then yes please move it from osdep -> 9p-util.

Will, are you planning to send a v9 of this series soon? Next week I need to 
add changes that would collide with these here. So if you intend to send it 
soon, then I just wait so that we can finally queue these macOS patches here 
for QEMU 7.0, before I would go along with my changes.

Best regards,
Christian Schoenebeck

> > > diff --git a/meson.build b/meson.build
> > > index ae5f7eec6e..6fdc0281ad 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -1557,6 +1557,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE',
> > > cc.has_function('posix_fallocate'
> > > config_host_data.set('CONFIG_POSIX_MEMALIGN',
> > > cc.has_function('posix_memalign')) config_host_data.set('CONFIG_PPOLL',
> > > cc.has_function('ppoll'))
> > > 
> > >  config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix:
> > > '#include <sys/uio.h>'))
> > 
> > +config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP',
> > 
> > > cc.has_function('pthread_fchdir_np'))
> > > config_host_data.set('CONFIG_SEM_TIMEDWAIT',
> > > cc.has_function('sem_timedwait', dependencies: threads))
> > > config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
> > > config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and
> > > cc.has_function('unshare')) diff --git a/os-posix.c b/os-posix.c
> > > index ae6c9f2a5e..ccc3d1e9d3 100644
> > > --- a/os-posix.c
> > > +++ b/os-posix.c
> > > @@ -332,3 +332,38 @@ int os_mlock(void)
> > > 
> > >      return -ENOSYS;
> > >  
> > >  #endif
> > >  }
> > > 
> > > +
> > > +/*
> > > + * As long as mknodat is not available on macOS, this workaround
> > > + * using pthread_fchdir_np is needed.
> > > + *
> > > + * Radar filed with Apple for implementing mknodat:
> > > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > > + */
> > > +#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > > +
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > 
> > dev)
> > 
> > > +{
> > > +    int preserved_errno, err;
> > > +    if (!pthread_fchdir_np) {
> > > +        error_report_once("pthread_fchdir_np() is not available on this
> > > version of macOS"); +        return -ENOTSUP;
> > > +    }
> > > +    if (pthread_fchdir_np(dirfd) < 0) {
> > > +        return -1;
> > > +    }
> > > +    err = mknod(filename, mode, dev);
> > > +    preserved_errno = errno;
> > > +    /* Stop using the thread-local cwd */
> > > +    pthread_fchdir_np(-1);
> > > +    if (err < 0) {
> > > +        errno = preserved_errno;
> > > +    }
> > > +    return err;
> > > +}
> > > +#else
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > 
> > dev)
> > 
> > > +{
> > > +    return mknodat(dirfd, filename, mode, dev);
> > > +}
> > > +#endif



