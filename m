Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836649FE85
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:58:44 +0100 (CET)
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUaB-0003IO-3g
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1nDU2h-0001Hn-71; Fri, 28 Jan 2022 11:24:07 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:37956)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1nDU2e-0005qO-Fv; Fri, 28 Jan 2022 11:24:06 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id E840A72C8FA;
 Fri, 28 Jan 2022 19:24:01 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id CC7A34A46F0;
 Fri, 28 Jan 2022 19:24:01 +0300 (MSK)
Date: Fri, 28 Jan 2022 19:24:01 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Message-ID: <20220128162401.vbnffmghae3zgrfo@altlinux.org>
References: <20220127212734.218900-1-vt@altlinux.org>
 <2533498.9Ea8Rob0xc@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <2533498.9Ea8Rob0xc@silver>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org, ldv@altlinux.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian,

On Fri, Jan 28, 2022 at 03:43:10PM +0100, Christian Schoenebeck wrote:
> On Donnerstag, 27. Januar 2022 22:27:34 CET Vitaly Chikunov wrote:
> > `struct dirent' returned from readdir(3) could be shorter than
> > `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> > into unallocated page causing SIGSEGV. Example stack trace:
> 
> It could be shorter or longer. Your patch is fixing both possibilities.
> 
> I just realized BTW that there are other places that should be fixed as well. 
> :/
> 
> For instance hw/9pfs/9p-synth.c (used for the 9p test cases [1][2]) is copying 
> dirents, too.

I noticed this one too, it could theoretically result in overflow on
CIFS if long filenames are prepared. But I decided to concentrate on
this more important fix, since this happen on normal fs.

I will apply all other your comments, except these new fixes.

> And in hw/9pfs/9p.c v9fs_do_readdir_with_stat() used by 9p2000.u doesn't even 
> bother to copy at all, which is undefined behaviour as fs driver is running on 
> a background thread and the dirent pointer might have mutated in the meantime 
> with the next readdir() call.
> 
> [1] https://wiki.qemu.org/Documentation/9p#Test_Cases
> [2] https://wiki.qemu.org/Documentation/9p#9p_Filesystem_Drivers
> 
> >  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
> > 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
> > + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> > (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
> > 0x0)
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> 
> Adding qemu-stable on CC for making sure this patch will be handled for the 
> stable branches as well.
> 
> > ---
> > Tested on x86-64 Linux.
> > 
> >  hw/9pfs/codir.c      |  7 +++++--
> >  include/qemu/osdep.h |  6 ++++++
> >  util/osdep.c         | 23 +++++++++++++++++++++++
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> > index 032cce04c4..ea7f5e6578 100644
> > --- a/hw/9pfs/codir.c
> > +++ b/hw/9pfs/codir.c
> > @@ -143,8 +143,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> > *fidp, } else {
> >              e = e->next = g_malloc0(sizeof(V9fsDirEnt));
> >          }
> > -        e->dent = g_malloc0(sizeof(struct dirent));
> > -        memcpy(e->dent, dent, sizeof(struct dirent));
> > +        e->dent = qemu_dirent_dup(dent);
> 
> That's the actual fix.
> 
> > +        if (!e->dent) {
> > +            err = -errno;
> > +            break;
> > +        }
> 
> e->dent is never NULL, so this check can be removed. See explanation about 
> g_malloc() below.

Yes, I forgot about this.

> > 
> >          /* perform a full stat() for directory entry if requested by caller
> > */ if (dostat) {
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index d1660d67fa..b54d22db04 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -805,6 +805,12 @@ static inline int
> > platform_does_not_support_system(const char *command) }
> >  #endif /* !HAVE_SYSTEM_FUNCTION */
> > 
> > +/**
> > + * Actual 'struct dirent' size may be bigger or shorter than
> > + * sizeof(struct dirent) in many cases.
> > + */
> > +struct dirent *qemu_dirent_dup(struct dirent *dent);
> > +
> 
> I think this issue deserves a more verbose API doc comment, something like:
> 
> /**
>  * Duplicate directory entry @dent.
>  *
>  * It is highly recommended to use this function instead of open coding 
>  * duplication of @c dirent objects, because the actual @c struct @c dirent 
>  * size may be bigger or shorter than @c sizeof(struct dirent) and correct
>  * handling is platform specific (see gitlab issue #841).
>  *
>  * @dent - original directory entry to be duplicated
>  * @returns duplicated directory entry which should be freed with g_free()
>  */
> struct dirent *qemu_dirent_dup(struct dirent *dent);
> 
> >  #ifdef __cplusplus
> >  }
> >  #endif
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 42a0a4986a..e39d1071fd 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -33,6 +33,7 @@
> >  extern int madvise(char *, size_t, int);
> >  #endif
> > 
> > +#include <dirent.h>
> 
> Wouldn't that break Windows builds?

Possible, but I don't have windows build to test. What would you
suggest as better fix?

I took as example `util/path.c' which includes `dirent.h' too, but it is
not handled anyway different than `util/osdep.c'


> 
> >  #include "qemu-common.h"
> >  #include "qemu/cutils.h"
> >  #include "qemu/sockets.h"
> > @@ -615,3 +616,25 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
> >      return readv_writev(fd, iov, iov_cnt, true);
> >  }
> >  #endif
> > +
> > +struct dirent *
> > +qemu_dirent_dup(struct dirent *dent)
> > +{
> > +    struct dirent *dst;
> > +#if defined _DIRENT_HAVE_D_RECLEN
> > +    /* Avoid use of strlen() if there's d_reclen. */
> > +    dst = g_malloc(dent->d_reclen);
> > +#else
> > +    /* Fallback to a most portable way. */
> > +    const size_t reclen = offsetof(struct dirent, d_name) +
> > strlen(dent->d_name) + 1; +
> > +    dst = g_malloc(reclen);
> > +#endif
> > +    if (!dst)
> > +        return NULL;
> > +#ifdef _DIRENT_HAVE_D_RECLEN
> > +    return memcpy(dst, dent, dent->d_reclen);
> > +#else
> > +    return memcpy(dst, dent, reclen);
> > +#endif
> > +}
> 
> On the long run we probably should have a configure check whether d_reclen
> exists, but I would not insist on that now as there is a valid fallback
> solution at least.
> 
> Note that g_malloc() never returns NULL, if it runs out of memory it
> terminates instead, so the NULL checks are unncessary:
> https://developer.gimp.org/api/2.0/glib/glib-Memory-Allocation.html#g-try-malloc
> 
> Also I would prefer g_malloc0() over g_malloc().
> 
> Then by adding a variable for the d_reclen yes/no case, overall code can be
> reduced. So I would suggest something like this instead:
> 
> struct dirent *
> qemu_dirent_dup(struct dirent *dent)
> {
> #if defined _DIRENT_HAVE_D_RECLEN
>     /* Avoid use of strlen() if there's d_reclen. */
>     const size_t sz = dent->d_reclen;
> #else
>     /* Fallback to a most portable way. */
>     const size_t sz = offsetof(struct dirent, d_name) +
>                       strlen(dent->d_name) + 1;
> #endif
>     struct dirent *dst = g_malloc(sz);
>     return memcpy(dst, dent, sz);
> }
> 
> Best regards,
> Christian Schoenebeck

Thanks!

> 

