Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA7A4AC5E1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:38:31 +0100 (CET)
Received: from localhost ([::1]:43008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH726-00005D-21
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:38:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH6th-00069G-GQ; Mon, 07 Feb 2022 11:29:49 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH6tf-0003iu-2U; Mon, 07 Feb 2022 11:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Gqp295vnV5xOl3L4/csyFtzt8iiZTlVrp9YTEi649I0=; b=Yhn56qTQV9QjFHy5jux0w8pgs8
 PvBBt1KhU1hjwNMf40p69n4Z5rhSzlXHIgmFEg8AUUP0zMLUlnquE2X1ZRKubOPIAfsRCOBzeMsBj
 7tRCbfC8rh4xvyCatDncOsujnTjhm5wNa+M7qTPi0DsYVbRdQWcpIlo463lcFFK8cjq7Ns2fh6AMK
 8V80nz65YbllHfe676hUtRZE1ZvYgcF+2LHLBbO/S4nDHa289N4YxLNqnI6fH2FoWHyDTD/vkA9L4
 8ZOqHEvoKxq/EWX2hTPlIhNWsjcxrEJ1SRnI6/LQOqpHiPZ+QIEFc1fR9mrWqi8o29jfa7nbRgidJ
 Lg81wtk5hUC45YcErf5CiyFhJV0zUG1Mxcap4Rmamm6ysPulYyM/0jB77ogtcAOTXh+FOlQUBvsQf
 ld+LAf7/G0mk3xXEicpJU5reOxXkzrK/Nmw0fqIaE3TQaoS2p8UyEEPikE8tf6g1QDzkcXJRbMzqj
 ppWr/D1UxuD2xTKBoCX0Itqs/lpo9lDdXHCgIeeRlNI8BaVgACztS954rEE47F4Dz/1cWtozlyB6M
 XENAXAp9dDr2i7pNv2zu2Ouibr0bmgLxHLKrAbjNPS0ozfmtn5CYN87SYYVYgtzXb89MXBTkiYx2P
 +3p1+oDf2Jsn8dAW57XNZpsTjWdV/KElHJWKDpkVA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Vitaly Chikunov <vt@altlinux.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>, qemu-stable@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Mon, 07 Feb 2022 17:29:42 +0100
Message-ID: <2028775.f1p1aejyUC@silver>
In-Reply-To: <20220207085607.426beff2@bahia>
References: <20220206013419.849161-1-vt@altlinux.org>
 <20220207085607.426beff2@bahia>
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

On Montag, 7. Februar 2022 08:56:07 CET Greg Kurz wrote:
> On Sun, 6 Feb 2022 04:34:19 +0300
> 
> Vitaly Chikunov <vt@altlinux.org> wrote:
> > `struct dirent' returned from readdir(3) could be shorter (or longer)
> > than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> > 
> > into unallocated page causing SIGSEGV. Example stack trace:
> >  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64
> >  + 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir
> >  (/usr/bin/qemu-system-x86_64 + 0x4982e9) #2  0x0000555555eb7983
> >  coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983) #3 
> >  0x00007ffff73e0be0 n/a (n/a + 0x0)
> > 
> > While fixing, provide a helper for any future `struct dirent' cloning.
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > Cc: qemu-stable@nongnu.org
> > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Reviewed-by: Dmitry V. Levin <ldv@altlinux.org>
> > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > ---
> > Tested on x68-64 Linux with btrfs-progs tests and slow qos-test.
> > Changes since v3:
> > - Update commentary on qemu_dirent_dup logic.
> > - Use g_memdup as suggested by Greg Kurz.
> 
> The synth driver should really be made compliant with the
> _DIRENT_HAVE_D_* macros at some point, but this patch fixes
> a crash and the comment is clear enough to understand the
> sz == 0 weirdness so I won't object any further.
> 
> Acked-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

I wait a bit to see whether there are still objections by other people.

Philippe maybe?

> >  hw/9pfs/codir.c      |  3 +--
> >  include/qemu/osdep.h | 13 +++++++++++++
> >  util/osdep.c         | 21 +++++++++++++++++++++
> >  3 files changed, 35 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> > index 032cce04c4..c0873bde16 100644
> > --- a/hw/9pfs/codir.c
> > +++ b/hw/9pfs/codir.c
> > @@ -143,8 +143,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> > *fidp,> 
> >          } else {
> >          
> >              e = e->next = g_malloc0(sizeof(V9fsDirEnt));
> >          
> >          }
> > 
> > -        e->dent = g_malloc0(sizeof(struct dirent));
> > -        memcpy(e->dent, dent, sizeof(struct dirent));
> > +        e->dent = qemu_dirent_dup(dent);
> > 
> >          /* perform a full stat() for directory entry if requested by
> >          caller */
> >          if (dostat) {
> > 
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index d1660d67fa..ce12f64853 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -805,6 +805,19 @@ static inline int
> > platform_does_not_support_system(const char *command)> 
> >  }
> >  #endif /* !HAVE_SYSTEM_FUNCTION */
> > 
> > +/**
> > + * Duplicate directory entry @dent.
> > + *
> > + * It is highly recommended to use this function instead of open coding
> > + * duplication of @c dirent objects, because the actual @c struct @c
> > dirent + * size may be bigger or shorter than @c sizeof(struct dirent)
> > and correct + * handling is platform specific (see gitlab issue #841).
> > + *
> > + * @dent - original directory entry to be duplicated
> > + * @returns duplicated directory entry which should be freed with
> > g_free()
> > + */
> > +struct dirent *qemu_dirent_dup(struct dirent *dent);
> > +
> > 
> >  #ifdef __cplusplus
> >  }
> >  #endif
> > 
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 42a0a4986a..67fbf22778 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -33,6 +33,7 @@
> > 
> >  extern int madvise(char *, size_t, int);
> >  #endif
> > 
> > +#include <dirent.h>
> > 
> >  #include "qemu-common.h"
> >  #include "qemu/cutils.h"
> >  #include "qemu/sockets.h"
> > 
> > @@ -615,3 +616,23 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
> > 
> >      return readv_writev(fd, iov, iov_cnt, true);
> >  
> >  }
> >  #endif
> > 
> > +
> > +struct dirent *
> > +qemu_dirent_dup(struct dirent *dent)
> > +{
> > +    size_t sz = 0;
> > +#if defined _DIRENT_HAVE_D_RECLEN
> > +    /* Avoid use of strlen() if platform supports d_reclen. */
> > +    sz = dent->d_reclen;
> > +#endif
> > +    /*
> > +     * Test sz for zero even if d_reclen is available
> > +     * because some drivers may set d_reclen to zero.
> > +     */
> > +    if (sz == 0) {
> > +        /* Fallback to the most portable way. */
> > +        sz = offsetof(struct dirent, d_name) +
> > +                      strlen(dent->d_name) + 1;
> > +    }
> > +    return g_memdup(dent, sz);
> > +}



