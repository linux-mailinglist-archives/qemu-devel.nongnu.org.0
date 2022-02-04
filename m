Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C6C4A9186
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 01:18:04 +0100 (CET)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFmIc-00066X-M3
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 19:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1nFmG6-0004ZP-7w; Thu, 03 Feb 2022 19:15:26 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:54006)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1nFmG0-0000Zf-VT; Thu, 03 Feb 2022 19:15:24 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 8AC0172C905;
 Fri,  4 Feb 2022 03:15:16 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 731AD4A46F0;
 Fri,  4 Feb 2022 03:15:16 +0300 (MSK)
Date: Fri, 4 Feb 2022 03:15:16 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220204001516.n5ma26x3wxsoixeb@altlinux.org>
References: <20220128223326.927132-1-vt@altlinux.org>
 <2001191.mYrJCF7IzP@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <2001191.mYrJCF7IzP@silver>
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

On Thu, Feb 03, 2022 at 01:42:19PM +0100, Christian Schoenebeck wrote:
> On Freitag, 28. Januar 2022 23:33:26 CET Vitaly Chikunov wrote:
> > `struct dirent' returned from readdir(3) could be shorter than
> > `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> > into unallocated page causing SIGSEGV. Example stack trace:
> > 
> >  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
> > 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
> > + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> > (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
> > 0x0)
> > 
> > While fixing, provide a helper for any future `struct dirent' cloning.
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > Cc: qemu-stable@nongnu.org
> > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > ---
> > Tested on x86-64 Linux.
> > 
> > Changes since v1:
> > - Update commentary text.
> > - Remove hanging of g_malloc "errors".
> > - Simplify qemu_dirent_dup.
> > 
> >  hw/9pfs/codir.c      |  3 +--
> >  include/qemu/osdep.h | 13 +++++++++++++
> >  util/osdep.c         | 16 ++++++++++++++++
> >  3 files changed, 30 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> > index 032cce04c4..c0873bde16 100644
> > --- a/hw/9pfs/codir.c
> > +++ b/hw/9pfs/codir.c
> > @@ -143,8 +143,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> > *fidp, } else {
> >              e = e->next = g_malloc0(sizeof(V9fsDirEnt));
> >          }
> > -        e->dent = g_malloc0(sizeof(struct dirent));
> > -        memcpy(e->dent, dent, sizeof(struct dirent));
> > +        e->dent = qemu_dirent_dup(dent);
> > 
> >          /* perform a full stat() for directory entry if requested by caller
> > */ if (dostat) {
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index d1660d67fa..ce12f64853 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -805,6 +805,19 @@ static inline int
> > platform_does_not_support_system(const char *command) }
> >  #endif /* !HAVE_SYSTEM_FUNCTION */
> > 
> > +/**
> > + * Duplicate directory entry @dent.
> > + *
> > + * It is highly recommended to use this function instead of open coding
> > + * duplication of @c dirent objects, because the actual @c struct @c dirent
> > + * size may be bigger or shorter than @c sizeof(struct dirent) and correct
> > + * handling is platform specific (see gitlab issue #841).
> > + *
> > + * @dent - original directory entry to be duplicated
> > + * @returns duplicated directory entry which should be freed with g_free()
> > + */
> > +struct dirent *qemu_dirent_dup(struct dirent *dent);
> > +
> >  #ifdef __cplusplus
> >  }
> >  #endif
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 42a0a4986a..0bc7ec1e22 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -33,6 +33,7 @@
> >  extern int madvise(char *, size_t, int);
> >  #endif
> > 
> > +#include <dirent.h>
> >  #include "qemu-common.h"
> >  #include "qemu/cutils.h"
> >  #include "qemu/sockets.h"
> > @@ -615,3 +616,18 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
> >      return readv_writev(fd, iov, iov_cnt, true);
> >  }
> >  #endif
> > +
> > +struct dirent *
> > +qemu_dirent_dup(struct dirent *dent)
> > +{
> > +#if defined _DIRENT_HAVE_D_RECLEN
> > +    /* Avoid use of strlen() if there's d_reclen. */
> > +    const size_t sz = dent->d_reclen;
> > +#else
> > +    /* Fallback to a most portable way. */
> > +    const size_t sz = offsetof(struct dirent, d_name) +
> > +                      strlen(dent->d_name) + 1;
> > +#endif
> 
> >From the experience we just made, I would add in v3 something like
> 
> 	assert(sz > 0);
> 
> here.

Yes but this will cause another abort() call. I am thinking about v3 fix
like this:

  struct dirent *
  qemu_dirent_dup(struct dirent *dent)
  {
      size_t sz = 0;
  #if defined _DIRENT_HAVE_D_RECLEN
      /* Avoid use of strlen() if there's d_reclen. */
      sz = dent->d_reclen;
  #endif
      if (sz == 0) {
          /* Fallback to a most portable way. */
          sz = offsetof(struct dirent, d_name) +
			strlen(dent->d_name) + 1;
      }
      struct dirent *dst = g_malloc(sz);
      return memcpy(dst, dent, sz);
  }

Thus it will use strlen for simulated dirents and d_reclen for real ones
(on Linux).


Thanks,

> 
> > +    struct dirent *dst = g_malloc(sz);
> > +    return memcpy(dst, dent, sz);
> > +}
> 
> Best regards,
> Christian Schoenebeck
> 

