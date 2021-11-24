Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB045C733
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:24:26 +0100 (CET)
Received: from localhost ([::1]:48414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptCD-0001jv-CS
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:24:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mptB8-0000Qx-DH
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:23:18 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mptB6-0005VV-IV
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=xJvwW2MuX5lLqXAXWjxkKqcRH2TKIn4cLytnhoY3RiM=; b=rdS4Cj8uWskDgIo+h55yHR3oG6
 kRD7odXQvyt/i870tnPfaU58hA5DhchLIT2adKyb3LNn9ca7tIf5HVu+T98wCr8nzbvq/NGYIowxR
 YwF0TYDeEe+7d8AfZ036GLJUpYh4dfu8Cl0uOCCPgQVJsGsx5xdxhOBBokof1DNrjpsYwmkhrB54b
 w715ELAVrrO2mjS5LkkQgHb5laqLQHodRfTu7DQJEGZ0RNWhH834KHrL08Hj5XXLttL+yeUWpeZrW
 tBMnYaXGDbie4VVZ7q6/Te0x6lOsCIvawnZeyzhD0yK36Ejl0TWvQ2qJLxdRyhLsH1ZWBGkNqZW+e
 VsVxLydPhiQmR7qdeortG7+++JW5WpVO3rL2DRcHCb11+L0SZ31+vILJjErZRizVi3kxO6J8lbb1z
 25nbzHhtdVemvRyAmAVieNdbqyn7FsMnCo0PNt6s49F6ohcC4wDtP1fHqScePmQWa1Nc8/JFOUGN2
 mM9PHhG4zee5T5I4U99c++l9rZxyE7agM9WhyiensibUGeR93/R7+eBc7dbcQ02I6INdLNh1PXe4c
 L5z/iAU/GPsJz/qkxAPgo+sAacj0FexOb49U3F8qrmRxJfHB6jkDO5vdoUrUqMt+mWx9LRh4m3QxE
 0zw93X3PdiQPQdcie3QCUX7EguOPLjxtc67Am0KIM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v2 03/11] 9p: darwin: Handle struct stat(fs) differences
Date: Wed, 24 Nov 2021 15:23:12 +0100
Message-ID: <2263838.SjeFQtN84K@silver>
In-Reply-To: <20211122004913.20052-4-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-4-wwcohen@gmail.com>
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

On Montag, 22. November 2021 01:49:05 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-proxy.c | 17 ++++++++++++++---
>  hw/9pfs/9p-synth.c |  2 ++
>  hw/9pfs/9p.c       | 16 ++++++++++++++--
>  3 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 09bd9f1464..be1546c1be 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -123,10 +123,15 @@ static void prstatfs_to_statfs(struct statfs *stfs,
> ProxyStatFS *prstfs) stfs->f_bavail = prstfs->f_bavail;
>      stfs->f_files = prstfs->f_files;
>      stfs->f_ffree = prstfs->f_ffree;
> +#ifdef CONFIG_DARWIN
> +    stfs->f_fsid.val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
> +    stfs->f_fsid.val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
> +#else
>      stfs->f_fsid.__val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
>      stfs->f_fsid.__val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
>      stfs->f_namelen = prstfs->f_namelen;
>      stfs->f_frsize = prstfs->f_frsize;
> +#endif
>  }

Please assign some value to f_namelen. You could either use the BSD version 
MAXNAMLEN from dirent.h (which you actually use for 9p.c below) or NAME_MAX 
from sys/syslimits.h on macOS.

>  /* Converts proxy_stat structure to VFS stat structure */
> @@ -143,12 +148,18 @@ static void prstat_to_stat(struct stat *stbuf,
> ProxyStat *prstat) stbuf->st_size = prstat->st_size;
>     stbuf->st_blksize = prstat->st_blksize;
>     stbuf->st_blocks = prstat->st_blocks;
> -   stbuf->st_atim.tv_sec = prstat->st_atim_sec;

Where did that go to? ^-

> -   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
> +   stbuf->st_atime = prstat->st_atim_sec;
>     stbuf->st_mtime = prstat->st_mtim_sec;
> -   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
>     stbuf->st_ctime = prstat->st_ctim_sec;
> +#ifdef CONFIG_DARWIN
> +   stbuf->st_atimespec.tv_nsec = prstat->st_atim_nsec;
> +   stbuf->st_mtimespec.tv_nsec = prstat->st_mtim_nsec;
> +   stbuf->st_ctimespec.tv_nsec = prstat->st_ctim_nsec;
> +#else
> +   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
> +   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
>     stbuf->st_ctim.tv_nsec = prstat->st_ctim_nsec;
> +#endif
>  }
> 
>  /*
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index b38088e066..4a4a776d06 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -427,7 +427,9 @@ static int synth_statfs(FsContext *s, V9fsPath *fs_path,
> stbuf->f_bsize = 512;
>      stbuf->f_blocks = 0;
>      stbuf->f_files = synth_node_count;
> +#ifndef CONFIG_DARWIN
>      stbuf->f_namelen = NAME_MAX;
> +#endif
>      return 0;
>  }

As mentioned above.

> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 9c63e14b28..f4f0c200c7 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1313,11 +1313,17 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const
> struct stat *stbuf, v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
>      v9lstat->st_blocks = stbuf->st_blocks;
>      v9lstat->st_atime_sec = stbuf->st_atime;
> -    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
>      v9lstat->st_mtime_sec = stbuf->st_mtime;
> -    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
>      v9lstat->st_ctime_sec = stbuf->st_ctime;
> +#ifdef CONFIG_DARWIN
> +    v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
> +    v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
> +    v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
> +#else
> +    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
> +    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
>      v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
> +#endif
>      /* Currently we only support BASIC fields in stat */
>      v9lstat->st_result_mask = P9_STATS_BASIC;
> 
> @@ -3519,9 +3525,15 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsPDU
> *pdu, struct statfs *stbuf) f_bavail = stbuf->f_bavail / bsize_factor;
>      f_files  = stbuf->f_files;
>      f_ffree  = stbuf->f_ffree;
> +#ifdef CONFIG_DARWIN
> +    fsid_val = (unsigned int)stbuf->f_fsid.val[0] |
> +               (unsigned long long)stbuf->f_fsid.val[1] << 32;
> +    f_namelen = MAXNAMLEN;
> +#else
>      fsid_val = (unsigned int) stbuf->f_fsid.__val[0] |
>                 (unsigned long long)stbuf->f_fsid.__val[1] << 32;
>      f_namelen = stbuf->f_namelen;
> +#endif
> 
>      return pdu_marshal(pdu, offset, "ddqqqqqqd",
>                         f_type, f_bsize, f_blocks, f_bfree,



