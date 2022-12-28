Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79465760B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 12:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAUxn-0003R8-Ga; Wed, 28 Dec 2022 06:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pAUxl-0003Qz-BU
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 06:51:13 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pAUxi-00069c-1k
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 06:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=iNcfJkUisoAVq6CwvVy1eL3Oigbg3S95J+7N/8k4978=; b=cZQtt28KQjrbQMSHRnXC+/BlLK
 TQOG+jAKp6pHN07sf4OUmcD+jh/5oEwilE21ewCyQMkjDZU3aQdWtF3pmOUTWT3xNLx2/tteHsa27
 Dqqeez3Ql1KCBF/uQ6kMZryLb5RH9D//Izw5HnilAmuRhB+iOKtDlCFTLt/F8fvRiXNnYsG2WFcUf
 M/DSjFsiff7cjZJDMCRjyBVW5c79h3ewML3M9Ez4M7g5TetrT2hIhvDR3caeG5aUhysUInJ8r+SyL
 xfnSmTpNk8bAtp7xBGo36eUBMYWbGbqc9e4lXgE1KWyGpWqCAi1eznfbAKm7L8sXMQ/WEgScJ/lpg
 Jt+6SWkOU1zbKPJEIEfGNRcYlgsv3kGrdW665dTpVcMvQJ6fN/MhIckUQxBqZY6w9oHsxkdB/xN0Z
 A5QJr4McuGKH+TddAvyTmwg90eXFvvl+Q3UmCr2IiqTJqQHkzCjhCYFxXu1WLIUUl9N7nGVV0KiPC
 DXnBmKDUzs7m3pouxZoGnZpveAxMYYfDO8eSYwUFSJHuvPt/6qie/jasymaxiQbAWgrvMx55VpMSl
 T99SyHFoauT57JWqV6haWcur8niz1P5hwWudjHsvUYtZwvCtvrhWFjpiqI4ft0P0Aq7Wye+y5xBbE
 TE7nEkMhg5sI1u7/j2PXatkfgasmGsQl6eAgruHKs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH v3 07/17] hw/9pfs: Support getting current directory
 offset for Windows
Date: Wed, 28 Dec 2022 12:51:03 +0100
Message-ID: <2830993.GtbaR8S6b6@silver>
In-Reply-To: <MN2PR11MB4173F332BAEA088CEA1C5629EFEB9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
 <1688271.CY4Nip6A2B@silver>
 <MN2PR11MB4173F332BAEA088CEA1C5629EFEB9@MN2PR11MB4173.namprd11.prod.outlook.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wednesday, December 21, 2022 7:02:43 PM CET Shi, Guohuai wrote:
> 
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Wednesday, December 21, 2022 22:48
> > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > <Bin.Meng@windriver.com>
> > Subject: Re: [PATCH v3 07/17] hw/9pfs: Support getting current directory
> > offset for Windows
> > 
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and
> > know the content is safe.
> > 
> > On Monday, December 19, 2022 11:20:11 AM CET Bin Meng wrote:
> > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > >
> > > On Windows 'struct dirent' does not have current directory offset.
> > > Update qemu_dirent_off() to support Windows.
> > >
> > > While we are here, add a build time check to error out if a new host
> > > does not implement this helper.
> > >
> > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/9pfs/9p-util.h       | 11 ++++++++---
> > >  hw/9pfs/9p-util-win32.c |  7 +++++++
> > >  hw/9pfs/9p.c            |  4 ++--
> > >  hw/9pfs/codir.c         |  2 +-
> > >  4 files changed, 18 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > 90420a7578..e395936b30 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -127,6 +127,7 @@ int unlinkat_win32(int dirfd, const char
> > > *pathname, int flags);  int statfs_win32(const char *root_path, struct
> > > statfs *stbuf);  int openat_dir(int dirfd, const char *name);  int
> > > openat_file(int dirfd, const char *name, int flags, mode_t mode);
> > > +off_t qemu_dirent_off_win32(void *s, void *fs);
> > >  #endif
> > >
> > >  static inline void close_preserve_errno(int fd) @@ -200,12 +201,16 @@
> > > ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > >   * so ensure it is manually injected earlier and call here when
> > >   * needed.
> > >   */
> > > -static inline off_t qemu_dirent_off(struct dirent *dent)
> > > +static inline off_t qemu_dirent_off(struct dirent *dent, void *s,
> > > +void *fs)
> > >  {
> > 
> > Not sure why you chose void* here.
> 
> It is "V9fsState *" here, but 9p-util.h may be included by some other source file which is not have definition of "V9fsState".
> So change it to "void *" to prevent unnecessary type declarations.

You can anonymously declare the struct to avoid cyclic dependencies (e.g. like
in 9p.h):

typedef struct V9fsState V9fsState;

Avoid the void.

> > 
> > > -#ifdef CONFIG_DARWIN
> > > +#if defined(CONFIG_DARWIN)
> > >      return dent->d_seekoff;
> > > -#else
> > > +#elif defined(CONFIG_LINUX)
> > >      return dent->d_off;
> > > +#elif defined(CONFIG_WIN32)
> > > +    return qemu_dirent_off_win32(s, fs); #else #error Missing
> > > +qemu_dirent_off() implementation for this host system
> > >  #endif
> > >  }
> > >
> > > diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > > 7a270a7bd5..3592e057ce 100644
> > > --- a/hw/9pfs/9p-util-win32.c
> > > +++ b/hw/9pfs/9p-util-win32.c
> > > @@ -929,3 +929,10 @@ int qemu_mknodat(int dirfd, const char *filename,
> > mode_t mode, dev_t dev)
> > >      errno = ENOTSUP;
> > >      return -1;
> > >  }
> > > +
> > > +off_t qemu_dirent_off_win32(void *s, void *fs) {
> > > +    V9fsState *v9fs = s;
> > > +
> > > +    return v9fs->ops->telldir(&v9fs->ctx, (V9fsFidOpenState *)fs); }
> > 
> > That's a bit tricky. So far (i.e. for Linux host, macOS host) we are storing
> > the directory offset directly to the dirent struct. We are not using
> > telldir() as the stream might have mutated in the meantime, hence calling
> > telldir() might return a value that does no longer correlate to dirent in
> > question.
> > 
> > Hence my idea was to use the same hack for Windows as we did for macOS, where
> > we simply misuse a dirent field known to be not used, on macOS that's
> > d_seekoff which we are misusing for that purpose.
> > 
> > Looking at the mingw dirent.h header though, there is not much we can choose
> > from. d_reclen is not used, but too short, d_ino is not used by mingw, but
> > currently we actually read this field in server common code to assemble a
> > file ID for guest. I mean it is always zero on Windows, so we could still
> > misuse it, but we would need to inject more hacks there. :/
> 
> If you check seekdir and telldir() implement in MinGW, 
> you can see that MinGW (and Windows) does not have a safety way to seek/tell directory offset.
> Because Windows POSIX and native API does not provide a way to seek directory.
> Windows native API only allow to read directory forward, but not backward.
> So even we store the d_seekoff to some places, the directory may still be modified.
> 
> And Windows file system actually has inode number, MinGW does not introduce it to MinGW API.
> So I think it is not good way to use d_ino.

Scratch that d_ino hack. My original concern was that we might get concurrency
on the directory stream, however after a recap I stumbled over one of my
comments on this:

static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
                           struct V9fsDirEnt **entries, off_t offset,
                           int32_t maxsize, bool dostat)
{
    ...
    /*
     * TODO: Here should be a warn_report_once() if lock failed.
     *
     * With a good 9p client we should not get into concurrency here,
     * because a good client would not use the same fid for concurrent
     * requests. We do the lock here for safety reasons though. However
     * the client would then suffer performance issues, so better log that
     * issue here.
     */
    v9fs_readdir_lock(&fidp->fs.dir);
    ...
}

So it boils down to whether or not we would want to care about broken 9p
clients on Windows host or not, and considering the huge amount of code to
deal with here for Windows host, we might say that we have more important
(real) problems to deal with than caring about a broken 9p client that does
not clone a FID before sending Treaddir (9p2000.L) or Tread (9p2000.u).

However looking at current MinGW implementation I start to think whether we
should use that API for directory retrieval at all, because for seekdir() they
are rewinding the directory stream to the very beginning on *each* call of
seekdir() and then readdir() in a while loop to the requested location for
which they use a simple, self-incremented consecutive number as stream
position:

https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-crt/misc/dirent.c#L319

Which can lead to two problems:

1. n-square performance issue (minor issue).

2. Inconsistent state if directory is modified in between (major issue), e.g.
the same directory appearing more than once in output, or directories not
appearing at all in output even though they were neither newly created nor
deleted. POSIX does not define what happens with deleted or newly created
directories in between, but it guarantees a consistent state.

What about calling _findfirst() and _findnext() directly, fetching all
directory entries at once, closing the stream, and 9p would just access that
snapshot instead? As long as the stream is not closed, Windows blocks all
directory changes, so we would have a consistent state.

> > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c index 072cf67956..be247eeb30
> > > 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -2336,7 +2336,7 @@ static int coroutine_fn
> > v9fs_do_readdir_with_stat(V9fsPDU *pdu,
> > >          count += len;
> > >          v9fs_stat_free(&v9stat);
> > >          v9fs_path_free(&path);
> > > -        saved_dir_pos = qemu_dirent_off(dent);
> > > +        saved_dir_pos = qemu_dirent_off(dent, pdu->s, &fidp->fs);
> > >      }
> > >
> > >      v9fs_readdir_unlock(&fidp->fs.dir);
> > > @@ -2537,7 +2537,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,
> > V9fsFidState *fidp,
> > >              qid.version = 0;
> > >          }
> > >
> > > -        off = qemu_dirent_off(dent);
> > > +        off = qemu_dirent_off(dent, pdu->s, &fidp->fs);
> > >          v9fs_string_init(&name);
> > >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> > >
> > > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c index
> > > 93ba44fb75..d40515a607 100644
> > > --- a/hw/9pfs/codir.c
> > > +++ b/hw/9pfs/codir.c
> > > @@ -168,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> > *fidp,
> > >          }
> > >
> > >          size += len;
> > > -        saved_dir_pos = qemu_dirent_off(dent);
> > > +        saved_dir_pos = qemu_dirent_off(dent, s, &fidp->fs);
> > >      }
> > >
> > >      /* restore (last) saved position */
> > >
> > 
> > 
> 
> 
> 



