Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A84666D9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 16:39:22 +0100 (CET)
Received: from localhost ([::1]:56944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msoB7-0001Hn-V2
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 10:39:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mso7V-0006vp-Q3
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:35:37 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mso7T-0001rh-1K
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=MNTSVvhIOgbBUyz37atHf73qhmYps/Fgj/mJWenr2o8=; b=fZ5sNC8p7Y7VQCmznhVJeMddwL
 L5WM9gEGDQbpQXqv2IrGnPQB6h4JgDjBsikNl4MTapP+ey2mxa6UAMP0FGoKMzQSlKF7HZfiq+odD
 75z80HbN8XRrwJW/VxWT8ro+jgCSH3AiKD9jhQonz2F2e8syNCEKH+TW+O3Q6SE7HItiHIKBfYxOt
 EbYA17uc1T04q2Yx5zr9IlwtrxxWZSprI2wjnLHGTlrF6LSCw0sCLTPsWCCTvrzUPzbuwWj/EuCa5
 iABv/lhdFuU6kJqVvKugOB3YfRS3T0kqI7dX543xtldcoD7qJ61zrI8zdftWTC//wXsLEteWlt8Pa
 oRUi0fu96IK10QaF9ekuQqL1n8jE2bb3St37QtEMIAKDL8E7b23EFCMjMSfjG3IbbEDCQuupBMQIQ
 jXDE3LEk1suH5f2LASAmnRYb4N8Eru/5Abp4xjMjir8VKWBVMadxpFW1R0btCpoNyQQhzhUwSaXfW
 vqfNoc59b2YXdaYRdL+WRSG2csfk+TfW/SqRygNhxsX7Qc45YqWl3xe6gPOPBnfQNpkLomqkVeSwB
 PIZyomdrFgR1LDqsb/Ut6reEO4pK9ZfAn9Xg2P8YRGD22QtPLf832hIiersauoiSIy8FK9pBgg/uL
 GER24ugThwhdATNlWAXKV479FlwuCduJFw8D6ixIY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, hi@alyssa.is,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 03/11] 9p: darwin: Handle struct stat(fs) differences
Date: Thu, 02 Dec 2021 16:35:30 +0100
Message-ID: <2009241.jLoMpMqClM@silver>
In-Reply-To: <CAB26zV1Ges+N1kO1Lcy666OPezphy-17Wj2OaL9aKxaT_xx13w@mail.gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <2263838.SjeFQtN84K@silver>
 <CAB26zV1Ges+N1kO1Lcy666OPezphy-17Wj2OaL9aKxaT_xx13w@mail.gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 1. Dezember 2021 23:46:43 CET Will Cohen wrote:
> On Wed, Nov 24, 2021 at 9:23 AM Christian Schoenebeck <
> 
> qemu_oss@crudebyte.com> wrote:
> > On Montag, 22. November 2021 01:49:05 CET Will Cohen wrote:
> > > From: Keno Fischer <keno@juliacomputing.com>
> > > 
> > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > > 
> > >  hw/9pfs/9p-proxy.c | 17 ++++++++++++++---
> > >  hw/9pfs/9p-synth.c |  2 ++
> > >  hw/9pfs/9p.c       | 16 ++++++++++++++--
> > >  3 files changed, 30 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> > > index 09bd9f1464..be1546c1be 100644
> > > --- a/hw/9pfs/9p-proxy.c
> > > +++ b/hw/9pfs/9p-proxy.c
> > > @@ -123,10 +123,15 @@ static void prstatfs_to_statfs(struct statfs
> > > *stfs,
> > > ProxyStatFS *prstfs) stfs->f_bavail = prstfs->f_bavail;
> > > 
> > >      stfs->f_files = prstfs->f_files;
> > >      stfs->f_ffree = prstfs->f_ffree;
> > > 
> > > +#ifdef CONFIG_DARWIN
> > > +    stfs->f_fsid.val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
> > > +    stfs->f_fsid.val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
> > > +#else
> > > 
> > >      stfs->f_fsid.__val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
> > >      stfs->f_fsid.__val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
> > >      stfs->f_namelen = prstfs->f_namelen;
> > >      stfs->f_frsize = prstfs->f_frsize;
> > > 
> > > +#endif
> > > 
> > >  }
> > 
> > Please assign some value to f_namelen. You could either use the BSD
> > version
> > MAXNAMLEN from dirent.h (which you actually use for 9p.c below) or
> > NAME_MAX
> > from sys/syslimits.h on macOS.
> 
> statfs on darwin has no f_namelen or f_frsize present (
> https://github.com/apple/darwin-xnu/blob/main/bsd/sys/mount.h#L141), which
> is why they're excluded here. Given that this is converting to darwin's
> statfs structure, is it okay if these stay omitted?

Yes, that's OK for both.

With this patch f_frsize is set to zero, and 'man 2 statfs' on Linux sais:

	"Fields that are undefined for a particular filesystem are set to 0."

And the Linux kernel (guest side) seems to automatically use f_bsize in its
absence instead:
https://github.com/torvalds/linux/blob/58e1100fdc5990b0cc0d4beaf2562a92e621ac7d/fs/statfs.c#L67

And for f_namelen I realized there is only one place on 9p server where this
field is used at all, which is v9fs_fill_statfs() in 9p.c and you are already
assigning MAXNAMLEN at that place, so OK.

> > >  /* Converts proxy_stat structure to VFS stat structure */
> > > 
> > > @@ -143,12 +148,18 @@ static void prstat_to_stat(struct stat *stbuf,
> > > ProxyStat *prstat) stbuf->st_size = prstat->st_size;
> > > 
> > >     stbuf->st_blksize = prstat->st_blksize;
> > >     stbuf->st_blocks = prstat->st_blocks;
> > > 
> > > -   stbuf->st_atim.tv_sec = prstat->st_atim_sec;
> > 
> > Where did that go to? ^-
> 
> Unless I'm mistaken, I think this logic should still be present. Pre-patch,
> it's ordered so it runs through sec and nsec each for atime, mtime, and
> ctime respectively. To handle the darwin logic more cleanly, it's now
> broken out so it does _sec first, and then only needs one #ifdef to handle
> the two _nsec cases.

If I understand you correctly, your point is that prstat_to_stat()
(9p-proxy.c) would leave st_[amc]time_sec uninitialized, but eventually
stat_to_v9stat_dotl() (9p.c) would fill them subsequently by:

	v9lstat->st_[amc]time_sec = stbuf->st_[amc]time;

Still wouldn't hurt to initialize these fields right from the start IMO. Which
was apparently never done in 9p-proxy.c for all 3 BTW.

> > > -   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
> > > +   stbuf->st_atime = prstat->st_atim_sec;
> > > 
> > >     stbuf->st_mtime = prstat->st_mtim_sec;
> > > 
> > > -   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
> > > 
> > >     stbuf->st_ctime = prstat->st_ctim_sec;
> > > 
> > > +#ifdef CONFIG_DARWIN
> > > +   stbuf->st_atimespec.tv_nsec = prstat->st_atim_nsec;
> > > +   stbuf->st_mtimespec.tv_nsec = prstat->st_mtim_nsec;
> > > +   stbuf->st_ctimespec.tv_nsec = prstat->st_ctim_nsec;
> > > +#else
> > > +   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
> > > +   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
> > > 
> > >     stbuf->st_ctim.tv_nsec = prstat->st_ctim_nsec;
> > > 
> > > +#endif
> > > 
> > >  }
> > >  
> > >  /*
> > > 
> > > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > > index b38088e066..4a4a776d06 100644
> > > --- a/hw/9pfs/9p-synth.c
> > > +++ b/hw/9pfs/9p-synth.c
> > > @@ -427,7 +427,9 @@ static int synth_statfs(FsContext *s, V9fsPath
> > 
> > *fs_path,
> > 
> > > stbuf->f_bsize = 512;
> > > 
> > >      stbuf->f_blocks = 0;
> > >      stbuf->f_files = synth_node_count;
> > > 
> > > +#ifndef CONFIG_DARWIN
> > > 
> > >      stbuf->f_namelen = NAME_MAX;
> > > 
> > > +#endif
> > > 
> > >      return 0;
> > >  
> > >  }
> > 
> > As mentioned above.
> > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 9c63e14b28..f4f0c200c7 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1313,11 +1313,17 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu,
> > 
> > const
> > 
> > > struct stat *stbuf, v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
> > > 
> > >      v9lstat->st_blocks = stbuf->st_blocks;
> > >      v9lstat->st_atime_sec = stbuf->st_atime;
> > > 
> > > -    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
> > > 
> > >      v9lstat->st_mtime_sec = stbuf->st_mtime;
> > > 
> > > -    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
> > > 
> > >      v9lstat->st_ctime_sec = stbuf->st_ctime;
> > > 
> > > +#ifdef CONFIG_DARWIN
> > > +    v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
> > > +    v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
> > > +    v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
> > > +#else
> > > +    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
> > > +    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
> > > 
> > >      v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
> > > 
> > > +#endif
> > > 
> > >      /* Currently we only support BASIC fields in stat */
> > >      v9lstat->st_result_mask = P9_STATS_BASIC;
> > > 
> > > @@ -3519,9 +3525,15 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsPDU
> > > *pdu, struct statfs *stbuf) f_bavail = stbuf->f_bavail / bsize_factor;
> > > 
> > >      f_files  = stbuf->f_files;
> > >      f_ffree  = stbuf->f_ffree;
> > > 
> > > +#ifdef CONFIG_DARWIN
> > > +    fsid_val = (unsigned int)stbuf->f_fsid.val[0] |
> > > +               (unsigned long long)stbuf->f_fsid.val[1] << 32;
> > > +    f_namelen = MAXNAMLEN;
> > > +#else
> > > 
> > >      fsid_val = (unsigned int) stbuf->f_fsid.__val[0] |
> > >      
> > >                 (unsigned long long)stbuf->f_fsid.__val[1] << 32;
> > >      
> > >      f_namelen = stbuf->f_namelen;
> > > 
> > > +#endif
> > > 
> > >      return pdu_marshal(pdu, offset, "ddqqqqqqd",
> > >      
> > >                         f_type, f_bsize, f_blocks, f_bfree,



