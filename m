Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A04AE278
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:03:45 +0100 (CET)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWiF-0003G2-H7
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:03:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHVEB-0003Rq-GO
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:28:35 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:60593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHVE7-0006u2-G4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=lha7D0rSpQwEETYaLscp7WIUcFcaG9ww9d3rHyEc3l8=; b=uw2SsEAMrxGZZACpxe5U6YGfjm
 l0nuY+wg61BEVkddcTpoYWCFQsFniSDSq3XcHnTWNlPE/3Fd2CvZs+1mPDZUYcv2xlXtAlcmD1BnP
 0XYvbxOLsauYyrLcDU4v41P9+YKAUtd+2EGTi8danlQy0w0Y5kTUSquyZ9U5hEr1ZupvnyEuJt33R
 2w60ss00aYJUoxGjqn21T6TVW6R2lbL+8T2WPGykxfiW5vnXcmaTwgPkjESr0QXK2hp0jDhKj3oFF
 Xt2mDP7Ao6vEdJQI2eBeNfS3Nwuz0Eb58niD0FUFjfwnQ8BxtttdptI1x2mF/GyBXZ9vEiDBl2qKg
 8V3dhxOKWNxMvtRNA2yAERy1vHYoaTXdg0JDlrqpl3gVy6082FN7GW6WTWGSX47E89P1fMpc8BIqd
 XG7n6lmJgRy0CwYnIWp86zhbZimurSQ+XpnIm9YRQTufcbhPxQvjwRiD5RawjwQMlqlq211Lx1O31
 3nCR9JQa9BSFCE3cTM5BqP+cNorxCwlDFr4ULlZ9uvaV17+yE8rysKICvjmPsQmrPSIZ+25udr3vf
 X9u7tQvpDKo0svLHJdzvdWpIqJ9EeKBxG2iERJ6Xb0IOH8T5KSjVmhMCqet97j2VnFzv1ynuysykq
 Wm3ee6ZW64BbRqRd0tiQSyZXW3FqgQ2XF3y8YxgYU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, hi@alyssa.is, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Tue, 08 Feb 2022 19:28:21 +0100
Message-ID: <4809377.qIIDLkA7W8@silver>
In-Reply-To: <CAB26zV3e+WWqJrs7_fJ_xgEc99swYHBqUrY66XCrBFSsptwP5A@mail.gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <CAB26zV1G3-m2=59j8f+f2q-L40WHr1u+sBWKjW+LqJ=GG+6h2A@mail.gmail.com>
 <CAB26zV3e+WWqJrs7_fJ_xgEc99swYHBqUrY66XCrBFSsptwP5A@mail.gmail.com>
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

On Dienstag, 8. Februar 2022 19:04:31 CET Will Cohen wrote:
> On Tue, Feb 8, 2022 at 11:19 AM Will Cohen <wwcohen@gmail.com> wrote:
> > On Tue, Feb 8, 2022 at 11:11 AM Christian Schoenebeck <
> > 
> > qemu_oss@crudebyte.com> wrote:
> >> On Dienstag, 8. Februar 2022 16:57:55 CET Will Cohen wrote:
> >> > My inclination is to go with the __builtin_available(macOS 10.12, *)
> >> 
> >> path,
> >> 
> >> > if acceptable, since it partially mirrors the API_AVAILABLE macro idea.
> >> 
> >> I
> >> 
> >> OTOH that's duplication of the ">= macOS 10.12" info, plus
> >> __builtin_available
> >> is direct use of a clang-only extension, whereas API_AVAILABLE() works
> >> (or
> >> more precisely: doesn't error out at least) with other compilers like GCC
> >> as
> >> well. GCC is sometimes used for cross-compilation.
> >> 
> >> Moreover, I would also add an error message in this case, e.g.:
> >>     if (!pthread_fchdir_np) {
> >>     
> >>         error_report_once("pthread_fchdir_np() is not available on this
> >> 
> >> macOS version");
> >> 
> >>         return -ENOTSUPP;
> >>     
> >>     }
> >> 
> >> I should elaborate why I think this is needed: you are already doing a
> >> Meson
> >> check for the existence of pthread_fchdir_np(), but the system where QEMU
> >> is
> >> compiled and the systems where the compiled binary will be running, might
> >> be
> >> different ones (i.e. different macOS versions).
> >> 
> >> Best regards,
> >> Christian Schoenebeck
> > 
> > Agreed, that way actually closes the edge case. Something along these
> > lines briefly crossed my mind during a previous version, but I quickly got
> > passed it by assuming that the compiling entity would always be the
> > bottleneck, which makes no sense in hindsight, so I very much appreciate
> > that you caught this.
> 
> Ah, rebuilding leads to a compiler error:
> 
> ../os-posix.c:348:10: warning: address of function 'pthread_fchdir_np' will
> always evaluate to 'true' [-Wpointer-bool-conversion]
>     if (!pthread_fchdir_np) {
>         ~^~~~~~~~~~~~~~~~~
> 
> I don't have a machine that's pre-10.12 so I can't see what the result is
> there, but this might be why the __builtin_available approach got taken.

I guess that's because you are compiling QEMU with minimum deployment target 
being macOS >= 10.12 already. In this case the compiler won't make 
pthread_fchdir_np a weak link, it only does emit a weak link if you are 
targeting macOS versions prior than the defined availablity attribute,
hence the address would never be NULL here and hence the compiler warning.

So I guess it is okay if you just omit checking presence of pthread_fchdir_np 
at runtime and just assume it exists.

Added Akihiko on CC, just in case he would have something to add on this macOS 
issue here. :)

Best regards,
Christian Schoenebeck

> >> > guess it's perhaps a tradeoff between predicting the future unknown
> >> > availability of functions versus just ensuring a minimum macOS version
> >> 
> >> and
> >> 
> >> > hoping for the best. With any luck, the distinction between the two
> >> > approaches will be moot, if we try to assume that a future macOS
> >> > version
> >> > that removes this also provides mknodat.
> >> > 
> >> > On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebeck <
> >> > 
> >> > qemu_oss@crudebyte.com> wrote:
> >> > > On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wrote:
> >> > > > On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck
> >> > > > <qemu_oss@crudebyte.com>
> >> > > > 
> >> > > > wrote:
> >> > > > > On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
> >> > > > > > From: Keno Fischer <keno@juliacomputing.com>
> >> > > > > > 
> >> > > > > > Darwin does not support mknodat. However, to avoid race
> >> 
> >> conditions
> >> 
> >> > > > > > with later setting the permissions, we must avoid using mknod
> >> > > > > > on
> >> > > > > > the full path instead. We could try to fchdir, but that would
> >> 
> >> cause
> >> 
> >> > > > > > problems if multiple threads try to call mknodat at the same
> >> 
> >> time.
> >> 
> >> > > > > > However, luckily there is a solution: Darwin includes a
> >> > > > > > function
> >> > > > > > that sets the cwd for the current thread only.
> >> > > > > > This should suffice to use mknod safely.
> >> > > > > > 
> >> > > > > > This function (pthread_fchdir_np) is protected by a check in
> >> > > > > > meson in a patch later in tihs series.
> >> > > > > > 
> >> > > > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> >> > > > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> >> > > > > > [Will Cohen: - Adjust coding style
> >> > > > > > 
> >> > > > > >              - Replace clang references with gcc
> >> > > > > >              - Note radar filed with Apple for missing syscall
> >> > > > > >              - Replace direct syscall with pthread_fchdir_np
> >> > > > > >              and
> >> > > > > >              
> >> > > > > >                adjust patch notes accordingly
> >> > > > > >              
> >> > > > > >              - Move qemu_mknodat from 9p-util to osdep and
> >> 
> >> os-posix]
> >> 
> >> > > > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> >> > > > > > ---
> >> > > > > 
> >> > > > > Like already mentioned by me moments ago on previous v4 (just
> >> 
> >> echoing)
> >> 
> >> > > ...
> >> > > 
> >> > > > > >  hw/9pfs/9p-local.c   |  4 ++--
> >> > > > > >  include/qemu/osdep.h | 10 ++++++++++
> >> > > > > >  os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
> >> > > > > >  3 files changed, 46 insertions(+), 2 deletions(-)
> >> > > > > > 
> >> > > > > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> >> > > > > > index a0d08e5216..d42ce6d8b8 100644
> >> > > > > > --- a/hw/9pfs/9p-local.c
> >> > > > > > +++ b/hw/9pfs/9p-local.c
> >> > > > > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx,
> >> > > 
> >> > > V9fsPath
> >> > > 
> >> > > > > > *dir_path,
> >> > > > > > 
> >> > > > > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> >> > > > > >      
> >> > > > > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> >> > > > > > 
> >> > > > > > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG,
> >> > > > > > 0);
> >> > > > > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode |
> >> 
> >> S_IFREG,
> >> 
> >> > > > > > 0);
> >> > > > > > 
> >> > > > > >          if (err == -1) {
> >> > > > > >          
> >> > > > > >              goto out;
> >> > > > > >          
> >> > > > > >          }
> >> > > > > > 
> >> > > > > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx,
> >> > > 
> >> > > V9fsPath
> >> > > 
> >> > > > > > *dir_path, }
> >> > > > > > 
> >> > > > > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> >> > > > > >      
> >> > > > > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> >> > > > > > 
> >> > > > > > -        err = mknodat(dirfd, name, credp->fc_mode,
> >> 
> >> credp->fc_rdev);
> >> 
> >> > > > > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
> >> > > > > > credp->fc_rdev);
> >> > > > > > 
> >> > > > > >          if (err == -1) {
> >> > > > > >          
> >> > > > > >              goto out;
> >> > > > > >          
> >> > > > > >          }
> >> > > > > > 
> >> > > > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> >> > > > > > index d1660d67fa..f3a8367ece 100644
> >> > > > > > --- a/include/qemu/osdep.h
> >> > > > > > +++ b/include/qemu/osdep.h
> >> > > > > > @@ -810,3 +810,13 @@ static inline int
> >> > > > > > platform_does_not_support_system(const char *command) #endif
> >> > > > > > 
> >> > > > > >  #endif
> >> > > > > > 
> >> > > > > > +
> >> > > > > > +/*
> >> > > > > > + * As long as mknodat is not available on macOS, this
> >> 
> >> workaround
> >> 
> >> > > > > > + * using pthread_fchdir_np is needed. qemu_mknodat is defined
> >> 
> >> in
> >> 
> >> > > > > > + * os-posix.c
> >> > > > > > + */
> >> > > > > > +#ifdef CONFIG_DARWIN
> >> > > > > > +int pthread_fchdir_np(int fd);
> >> > > > > > +#endif
> >> > > > > 
> >> > > > > I would make that:
> >> > > > > 
> >> > > > > #ifdef CONFIG_DARWIN
> >> > > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> >> > > > > #endif
> >> > > > > 
> >> > > > > here and ...
> >> > > > > 
> >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> >> > > > > > dev_t
> >> > > > > 
> >> > > > > dev);
> >> > > > > 
> >> > > > > > diff --git a/os-posix.c b/os-posix.c
> >> > > > > > index ae6c9f2a5e..95c1607065 100644
> >> > > > > > --- a/os-posix.c
> >> > > > > > +++ b/os-posix.c
> >> > > > > > @@ -24,6 +24,7 @@
> >> > > > > > 
> >> > > > > >   */
> >> > > > > >  
> >> > > > > >  #include "qemu/osdep.h"
> >> > > > > > 
> >> > > > > > +#include <os/availability.h>
> >> > > > > > 
> >> > > > > >  #include <sys/wait.h>
> >> > > > > >  #include <pwd.h>
> >> > > > > >  #include <grp.h>
> >> > > > > > 
> >> > > > > > @@ -332,3 +333,36 @@ int os_mlock(void)
> >> > > > > > 
> >> > > > > >      return -ENOSYS;
> >> > > > > >  
> >> > > > > >  #endif
> >> > > > > >  }
> >> > > > > > 
> >> > > > > > +
> >> > > > > > +/*
> >> > > > > > + * As long as mknodat is not available on macOS, this
> >> 
> >> workaround
> >> 
> >> > > > > > + * using pthread_fchdir_np is needed.
> >> > > > > > + *
> >> > > > > > + * Radar filed with Apple for implementing mknodat:
> >> > > > > > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> >> > > > > > + */
> >> > > > > > +#ifdef CONFIG_DARWIN
> >> > > > > > +
> >> > > > > > +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> >> > > > > 
> >> > > > > ... drop the duplicate declaration of pthread_fchdir_np() here.
> >> > > > 
> >> > > > Trying this out, it reminds me that this use of API_AVAILABLE in
> >> > > 
> >> > > os-posix.c
> >> > > 
> >> > > > relies on the added #include <os/availability.h>.
> >> > > > 
> >> > > > Leaving the include out leads to:
> >> > > > .../include/qemu/osdep.h:820:31: error: expected function body
> >> > > > after
> >> > > > function declarator
> >> > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> >> > > > 
> >> > > >                               ^
> >> > > > 
> >> > > > 1 error generated.
> >> > > > ninja: build stopped: subcommand failed.
> >> > > > make[1]: *** [run-ninja] Error 1
> >> > > > make: *** [all] Error 2
> >> > > > 
> >> > > > The admonition against modifying osdep.h's includes too much led me
> >> 
> >> to
> >> 
> >> > > > steer away from putting it all in there. If there's no issue with
> >> 
> >> adding
> >> 
> >> > > > +#include <os/availability.h> to osdep.h, then this change makes
> >> 
> >> sense
> >> 
> >> > > > to
> >> > > > me.
> >> > > 
> >> > > If you embed that include into ifdefs, sure!
> >> > > 
> >> > > #ifdef CONFIG_DARWIN
> >> > > /* defines API_AVAILABLE(...) */
> >> > > #include <os/availability.h>
> >> > > #endif
> >> > > 
> >> > > One more thing though ...
> >> > > 
> >> > > > > > +
> >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> >> > > > > > dev_t
> >> > > > > 
> >> > > > > dev)
> >> > > > > 
> >> > > > > > +{
> >> > > > > > +    int preserved_errno, err;
> >> > > 
> >> > > pthread_fchdir_np() is weakly linked. So I guess here should be a
> >> 
> >> check
> >> 
> >> > > like:
> >> > >         if (!pthread_fchdir_np) {
> >> > >         
> >> > >                 return -ENOTSUPP;
> >> > >         
> >> > >         }
> >> > > 
> >> > > Before trying to call pthread_fchdir_np() below. As already discussed
> >> 
> >> with
> >> 
> >> > > the
> >> > > Chromium [1] example, some do that a bit differently by using
> >> > > 
> >> > > __builtin_available():
> >> > >         if (__builtin_available(macOS 10.12, *)) {
> >> > >         
> >> > >                 return -ENOTSUPP;
> >> > >         
> >> > >         }
> >> > > 
> >> > > Which makes me wonder why they are not doing a simple NULL check?
> >> > > 
> >> > > [1]
> >> 
> >> https://chromium.googlesource.com/chromium/src/+/lkgr/base/process/launch
> >> _
> >> 
> >> > > mac.cc#110>
> >> > > 
> >> > > > > > +    if (pthread_fchdir_np(dirfd) < 0) {
> >> > > > > > +        return -1;
> >> > > > > > +    }
> >> > > > > > +    err = mknod(filename, mode, dev);
> >> > > > > > +    preserved_errno = errno;
> >> > > > > > +    /* Stop using the thread-local cwd */
> >> > > > > > +    pthread_fchdir_np(-1);
> >> > > > > > +    if (err < 0) {
> >> > > > > > +        errno = preserved_errno;
> >> > > > > > +    }
> >> > > > > > +    return err;
> >> > > > > > +}
> >> > > > > > +#else
> >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> >> > > > > > dev_t
> >> > > > > 
> >> > > > > dev)
> >> > > > > 
> >> > > > > > +{
> >> > > > > > +    return mknodat(dirfd, filename, mode, dev);
> >> > > > > > +}
> >> > > > > > +#endif


Best regards,
Christian Schoenebeck



