Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6684A78B7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:29:26 +0100 (CET)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLJk-0003Vv-Tu
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFJkT-0005LM-7R
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:48:53 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFJkQ-0002dg-NT
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=gMYHFO+mVi4A6wWiFBMslrY6UsbpYBMmU5Fa09M1J+0=; b=nAvGLv6Sr5oB9HBh3mEBDrifqA
 99WXCD5N8hziPPUViCs8qLF0UF5+6x5wQSTtSfIPzWWH/T1vZa9qbUjN8By0h2sFZC+jzwhNqMX80
 CdGjPZURBCiYBZmdO9OdKnhrUlcd25fTeU7JKWKs7vDrjWluf4T9iQFPw6fOy4mWElG1R+JcC3aYR
 iT0/KXjIZnLyNCZBWlb4Nq3eJv9np2JFhMMtlVZPzdoJbA7jkYA6EtgKJaK5UuzDHy1ucZIOj+Ngh
 W3InZLcUlkLiH0/2MHeRFIdwRVkETr07fjCuUF2oGSsyzsWYk3hkC3cfVeTLOtT8lU55q/Y1yVEcY
 hJQtuhL7kejJKTgi2ByrFlxtIxCPsI+w8no5f2biWllxMtAMltRyfpkLaZ0+3UcMBBEfoveBPoPGH
 BJdnsEIFYL+n8gIoDjJqDzCvvVhU76WBCPOMdqYrJ7I+TnV4FQPi2SESMBe8/m2jH+IRtQR05u4Xn
 YKqgrKZb5CWOfqKrVmrbDXq7U//iYGlTTxv81ph4vLG6c2JWTX5FcOMCufidHmS0+qQ6ifz3kY5se
 tMF3bX43DqZyJAyHqg1pEYzIL8zRH/MTVgIEmNXClK81xnXH6WAorYIfMznkTWx2yVs0nLs6VfRDt
 jd8d0iXoFLgGGKDCVbYtEMwF8Ho5nctQN6fzlW5iU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v3 03/11] 9p: darwin: Handle struct stat(fs) differences
Date: Wed, 02 Feb 2022 18:48:39 +0100
Message-ID: <3243583.xhL7s5NutC@silver>
In-Reply-To: <20220128005611.87185-4-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-4-wwcohen@gmail.com>
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

On Freitag, 28. Januar 2022 01:56:03 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Note lack of f_namelen and f_frsize on Darwin]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-proxy.c | 18 +++++++++++++++---
>  hw/9pfs/9p-synth.c |  2 ++
>  hw/9pfs/9p.c       | 16 ++++++++++++++--
>  3 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 09bd9f1464..f5aade21b5 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -123,10 +123,16 @@ static void prstatfs_to_statfs(struct statfs *stfs,
> ProxyStatFS *prstfs) stfs->f_bavail = prstfs->f_bavail;
>      stfs->f_files = prstfs->f_files;
>      stfs->f_ffree = prstfs->f_ffree;
> +#ifdef CONFIG_DARWIN
> +    /* f_namelen and f_frsize do not exist on Darwin */
> +    stfs->f_fsid.val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
> +    stfs->f_fsid.val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
> +#else
>      stfs->f_fsid.__val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
>      stfs->f_fsid.__val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
>      stfs->f_namelen = prstfs->f_namelen;
>      stfs->f_frsize = prstfs->f_frsize;
> +#endif
>  }
> 
>  /* Converts proxy_stat structure to VFS stat structure */
> @@ -143,12 +149,18 @@ static void prstat_to_stat(struct stat *stbuf,
> ProxyStat *prstat) stbuf->st_size = prstat->st_size;
>     stbuf->st_blksize = prstat->st_blksize;
>     stbuf->st_blocks = prstat->st_blocks;
> -   stbuf->st_atim.tv_sec = prstat->st_atim_sec;

Like already mentioned in v2: please assign some value to
stbuf->st_atim.tv_sec as well, i.e. don't just delete it.

On most systems there is a workaround in place like:

           #define st_atime st_atim.tv_sec      /* Backward compatibility */
           #define st_mtime st_mtim.tv_sec
           #define st_ctime st_ctim.tv_sec

In that case your changes would work, but I would not rely on that.

Best regards,
Christian Schoenebeck

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
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 9c63e14b28..1563d7b7c6 100644
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
> +    f_namelen = NAME_MAX;
> +#else
>      fsid_val = (unsigned int) stbuf->f_fsid.__val[0] |
>                 (unsigned long long)stbuf->f_fsid.__val[1] << 32;
>      f_namelen = stbuf->f_namelen;
> +#endif
> 
>      return pdu_marshal(pdu, offset, "ddqqqqqqd",
>                         f_type, f_bsize, f_blocks, f_bfree,



