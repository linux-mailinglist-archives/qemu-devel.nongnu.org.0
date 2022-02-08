Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C591B4AE053
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:08:06 +0100 (CET)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUuL-00049G-PZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:08:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHT67-0003aq-DT
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:12:09 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:58695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHT63-0000Cg-Ca
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=R7O9h9rEck/xHcMRKKfJRag72csm50iikw2j7xpRPpk=; b=urgFgbjsKB66tr6aeRXPN/+klH
 yYRPqJpBkARiW0K/QAi/wiKWFxv+lRu0yauHq8DbxRPc9c0x8KRj5wSNxBQ8hgwQXYpRHTs+dROCp
 WonbeGy+LD9yFRb34tUFhPriMpXmsJwAw8yvsNpRyMGxoJMHbxlIIrIucU392oLBnAS/6pq+DL0Dw
 JHjze91ze+jaHrA6iAz7+Ne/BGKI2z4PX58/fmnLamtKbJ4A/dr+J6I7v36hx1FPcUBpv/xIMVBWF
 B84G4ibuLXMg6qQKzLDy8GgQTExfQkyHJYBWD6aUShmp6E1wTIF9htn0+uUuqdQuoQZfIy0IAUlfL
 uL+BxRSHQCWyn7O1XS3EIOIADT+5aoQEqtwVdzL6EwjYUw1vs1wb1sc+7AlSciaEPqadlqiuMS8Ta
 UYdhaf0buLz30BwAAcuV4glXIKUrEZQXP+tuU5RZBhEReiPFJ0tvklXRS9U42pPAP6l0PRdYO7L4I
 soyy8jfovOZ+VaAvKNeu7rPvuA0ybQomPVVq6Qm6FZrdvfEMyZxA/HvVDy42ZXGymmJxykjWY/WjQ
 eEQZx1lVhptsPUMamRW6Uz4EKdy+2guOKiQor9fovs9t465o2N+4UNGOziAOB1gsSfOYyEoryRv5L
 pdWx+5w+XNO22fUwqSsZ7VB4IXZ1JwyoOYjy+JLPM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, hi@alyssa.is, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Tue, 08 Feb 2022 17:11:56 +0100
Message-ID: <8390824.yUqPNeXlkU@silver>
In-Reply-To: <CAB26zV20ptbz+A9AvV9H_8rv19s2gD6+XBUJGtse2s6zq_HsYA@mail.gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <44442748.7pOeeLDITA@silver>
 <CAB26zV20ptbz+A9AvV9H_8rv19s2gD6+XBUJGtse2s6zq_HsYA@mail.gmail.com>
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

On Dienstag, 8. Februar 2022 16:57:55 CET Will Cohen wrote:
> My inclination is to go with the __builtin_available(macOS 10.12, *) path,
> if acceptable, since it partially mirrors the API_AVAILABLE macro idea. I

OTOH that's duplication of the ">= macOS 10.12" info, plus __builtin_available
is direct use of a clang-only extension, whereas API_AVAILABLE() works (or
more precisely: doesn't error out at least) with other compilers like GCC as
well. GCC is sometimes used for cross-compilation.

Moreover, I would also add an error message in this case, e.g.:

    if (!pthread_fchdir_np) {
        error_report_once("pthread_fchdir_np() is not available on this macOS version");
        return -ENOTSUPP;	
    }

I should elaborate why I think this is needed: you are already doing a Meson
check for the existence of pthread_fchdir_np(), but the system where QEMU is
compiled and the systems where the compiled binary will be running, might be
different ones (i.e. different macOS versions).

Best regards,
Christian Schoenebeck

> guess it's perhaps a tradeoff between predicting the future unknown
> availability of functions versus just ensuring a minimum macOS version and
> hoping for the best. With any luck, the distinction between the two
> approaches will be moot, if we try to assume that a future macOS version
> that removes this also provides mknodat.
> 
> On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebeck <
> 
> qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wrote:
> > > On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck
> > > <qemu_oss@crudebyte.com>
> > > 
> > > wrote:
> > > > On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
> > > > > From: Keno Fischer <keno@juliacomputing.com>
> > > > > 
> > > > > Darwin does not support mknodat. However, to avoid race conditions
> > > > > with later setting the permissions, we must avoid using mknod on
> > > > > the full path instead. We could try to fchdir, but that would cause
> > > > > problems if multiple threads try to call mknodat at the same time.
> > > > > However, luckily there is a solution: Darwin includes a function
> > > > > that sets the cwd for the current thread only.
> > > > > This should suffice to use mknod safely.
> > > > > 
> > > > > This function (pthread_fchdir_np) is protected by a check in
> > > > > meson in a patch later in tihs series.
> > > > > 
> > > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > > > [Will Cohen: - Adjust coding style
> > > > > 
> > > > >              - Replace clang references with gcc
> > > > >              - Note radar filed with Apple for missing syscall
> > > > >              - Replace direct syscall with pthread_fchdir_np and
> > > > >              
> > > > >                adjust patch notes accordingly
> > > > >              
> > > > >              - Move qemu_mknodat from 9p-util to osdep and os-posix]
> > > > > 
> > > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > > ---
> > > > 
> > > > Like already mentioned by me moments ago on previous v4 (just echoing)
> > 
> > ...
> > 
> > > > >  hw/9pfs/9p-local.c   |  4 ++--
> > > > >  include/qemu/osdep.h | 10 ++++++++++
> > > > >  os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
> > > > >  3 files changed, 46 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > > > index a0d08e5216..d42ce6d8b8 100644
> > > > > --- a/hw/9pfs/9p-local.c
> > > > > +++ b/hw/9pfs/9p-local.c
> > > > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx,
> > 
> > V9fsPath
> > 
> > > > > *dir_path,
> > > > > 
> > > > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > > > >      
> > > > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > > > 
> > > > > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG,
> > > > > 0);
> > > > > 
> > > > >          if (err == -1) {
> > > > >          
> > > > >              goto out;
> > > > >          
> > > > >          }
> > > > > 
> > > > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx,
> > 
> > V9fsPath
> > 
> > > > > *dir_path, }
> > > > > 
> > > > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > > > >      
> > > > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > > > > 
> > > > > -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> > > > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
> > > > > credp->fc_rdev);
> > > > > 
> > > > >          if (err == -1) {
> > > > >          
> > > > >              goto out;
> > > > >          
> > > > >          }
> > > > > 
> > > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > > index d1660d67fa..f3a8367ece 100644
> > > > > --- a/include/qemu/osdep.h
> > > > > +++ b/include/qemu/osdep.h
> > > > > @@ -810,3 +810,13 @@ static inline int
> > > > > platform_does_not_support_system(const char *command) #endif
> > > > > 
> > > > >  #endif
> > > > > 
> > > > > +
> > > > > +/*
> > > > > + * As long as mknodat is not available on macOS, this workaround
> > > > > + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> > > > > + * os-posix.c
> > > > > + */
> > > > > +#ifdef CONFIG_DARWIN
> > > > > +int pthread_fchdir_np(int fd);
> > > > > +#endif
> > > > 
> > > > I would make that:
> > > > 
> > > > #ifdef CONFIG_DARWIN
> > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > > #endif
> > > > 
> > > > here and ...
> > > > 
> > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> > > > > dev_t
> > > > 
> > > > dev);
> > > > 
> > > > > diff --git a/os-posix.c b/os-posix.c
> > > > > index ae6c9f2a5e..95c1607065 100644
> > > > > --- a/os-posix.c
> > > > > +++ b/os-posix.c
> > > > > @@ -24,6 +24,7 @@
> > > > > 
> > > > >   */
> > > > >  
> > > > >  #include "qemu/osdep.h"
> > > > > 
> > > > > +#include <os/availability.h>
> > > > > 
> > > > >  #include <sys/wait.h>
> > > > >  #include <pwd.h>
> > > > >  #include <grp.h>
> > > > > 
> > > > > @@ -332,3 +333,36 @@ int os_mlock(void)
> > > > > 
> > > > >      return -ENOSYS;
> > > > >  
> > > > >  #endif
> > > > >  }
> > > > > 
> > > > > +
> > > > > +/*
> > > > > + * As long as mknodat is not available on macOS, this workaround
> > > > > + * using pthread_fchdir_np is needed.
> > > > > + *
> > > > > + * Radar filed with Apple for implementing mknodat:
> > > > > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > > > > + */
> > > > > +#ifdef CONFIG_DARWIN
> > > > > +
> > > > > +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > > 
> > > > ... drop the duplicate declaration of pthread_fchdir_np() here.
> > > 
> > > Trying this out, it reminds me that this use of API_AVAILABLE in
> > 
> > os-posix.c
> > 
> > > relies on the added #include <os/availability.h>.
> > > 
> > > Leaving the include out leads to:
> > > .../include/qemu/osdep.h:820:31: error: expected function body after
> > > function declarator
> > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > 
> > >                               ^
> > > 
> > > 1 error generated.
> > > ninja: build stopped: subcommand failed.
> > > make[1]: *** [run-ninja] Error 1
> > > make: *** [all] Error 2
> > > 
> > > The admonition against modifying osdep.h's includes too much led me to
> > > steer away from putting it all in there. If there's no issue with adding
> > > +#include <os/availability.h> to osdep.h, then this change makes sense
> > > to
> > > me.
> > 
> > If you embed that include into ifdefs, sure!
> > 
> > #ifdef CONFIG_DARWIN
> > /* defines API_AVAILABLE(...) */
> > #include <os/availability.h>
> > #endif
> > 
> > One more thing though ...
> > 
> > > > > +
> > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> > > > > dev_t
> > > > 
> > > > dev)
> > > > 
> > > > > +{
> > > > > +    int preserved_errno, err;
> > 
> > pthread_fchdir_np() is weakly linked. So I guess here should be a check
> > 
> > like:
> >         if (!pthread_fchdir_np) {
> >         
> >                 return -ENOTSUPP;
> >         
> >         }
> > 
> > Before trying to call pthread_fchdir_np() below. As already discussed with
> > the
> > Chromium [1] example, some do that a bit differently by using
> > 
> > __builtin_available():
> >         if (__builtin_available(macOS 10.12, *)) {
> >         
> >                 return -ENOTSUPP;
> >         
> >         }
> > 
> > Which makes me wonder why they are not doing a simple NULL check?
> > 
> > [1]
> > https://chromium.googlesource.com/chromium/src/+/lkgr/base/process/launch_
> > mac.cc#110> 
> > > > > +    if (pthread_fchdir_np(dirfd) < 0) {
> > > > > +        return -1;
> > > > > +    }
> > > > > +    err = mknod(filename, mode, dev);
> > > > > +    preserved_errno = errno;
> > > > > +    /* Stop using the thread-local cwd */
> > > > > +    pthread_fchdir_np(-1);
> > > > > +    if (err < 0) {
> > > > > +        errno = preserved_errno;
> > > > > +    }
> > > > > +    return err;
> > > > > +}
> > > > > +#else
> > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> > > > > dev_t
> > > > 
> > > > dev)
> > > > 
> > > > > +{
> > > > > +    return mknodat(dirfd, filename, mode, dev);
> > > > > +}
> > > > > +#endif



