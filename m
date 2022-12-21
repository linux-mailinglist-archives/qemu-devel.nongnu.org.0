Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749996532A7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80OW-0004si-34; Wed, 21 Dec 2022 09:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p80OQ-0004sY-PL
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:48:26 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p80OO-0005z3-Tp
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Vm4Dwb6zK7cx/lJR4yIdq5bSR1475IjmGkwZGsw35UI=; b=lfFQw7WCEXQS27IJw0hUZCo5am
 TnjTJoAqEG+f/GPer3AwwYZQFmsEy2hGzbTR3rMLETCwRp3/YROwgz2qq4rFao1vSCfW9x6Ra1Dlz
 au67lzAyGRGluCYgmIWGUoV2Z5loKRP/3SpdJF6H3vA3LIhJ6smNoloBBFcp/DRN3+sdy7yltyWru
 UMOcIfRN2+6LFtSw9fnCwB36c6yjXNI+gNNPHNQ7Qf03rf8P3W/UHLwRaivHirrVGce9A9A2mdGBc
 5sSmwj4eu82wrFx6HCsxxhXietP/fWan3SHwK61lSRAydvEP5wB+j83TtZiNztE8PjRlCWIlqo0GV
 PmFmOw5fnlI/wfM/2d3oTQdsV7+TapWLFss2m/goojB8Uq3RjVPPtrLe0e6kgzlvNJcFEBOo6g2l4
 ln2m8pdMFAZu1X9uxi2agmzbzPnejhhixX4HIUJo1kUX5ezd/hQnKu5uyU2S4Trs73SnR3HHtPtKm
 +/a7EIkvQy0nvKqX/KofP1G0EwcpwEdg5hzpoRB9qmUq3BuKLR4WFoAVjJ4KrhH44KtnxXlgwMucp
 6Y1UgFL/cP8Ukrv2aNFcQMK4IDn5SwJO/2qUHSiZiQgqzPtHi3ymsi3sSKT8p9GZ4aTWOB1z0fXf5
 n2QHiPJCKOFQTN7/hMf+vBHjYZ4tOXsI2iQ1XnMio=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v3 07/17] hw/9pfs: Support getting current directory
 offset for Windows
Date: Wed, 21 Dec 2022 15:48:20 +0100
Message-ID: <1688271.CY4Nip6A2B@silver>
In-Reply-To: <20221219102022.2167736-8-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
 <20221219102022.2167736-8-bin.meng@windriver.com>
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

On Monday, December 19, 2022 11:20:11 AM CET Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> On Windows 'struct dirent' does not have current directory offset.
> Update qemu_dirent_off() to support Windows.
> 
> While we are here, add a build time check to error out if a new
> host does not implement this helper.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v1)
> 
>  hw/9pfs/9p-util.h       | 11 ++++++++---
>  hw/9pfs/9p-util-win32.c |  7 +++++++
>  hw/9pfs/9p.c            |  4 ++--
>  hw/9pfs/codir.c         |  2 +-
>  4 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 90420a7578..e395936b30 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -127,6 +127,7 @@ int unlinkat_win32(int dirfd, const char *pathname, int flags);
>  int statfs_win32(const char *root_path, struct statfs *stbuf);
>  int openat_dir(int dirfd, const char *name);
>  int openat_file(int dirfd, const char *name, int flags, mode_t mode);
> +off_t qemu_dirent_off_win32(void *s, void *fs);
>  #endif
>  
>  static inline void close_preserve_errno(int fd)
> @@ -200,12 +201,16 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
>   * so ensure it is manually injected earlier and call here when
>   * needed.
>   */
> -static inline off_t qemu_dirent_off(struct dirent *dent)
> +static inline off_t qemu_dirent_off(struct dirent *dent, void *s, void *fs)
>  {

Not sure why you chose void* here.

> -#ifdef CONFIG_DARWIN
> +#if defined(CONFIG_DARWIN)
>      return dent->d_seekoff;
> -#else
> +#elif defined(CONFIG_LINUX)
>      return dent->d_off;
> +#elif defined(CONFIG_WIN32)
> +    return qemu_dirent_off_win32(s, fs);
> +#else
> +#error Missing qemu_dirent_off() implementation for this host system
>  #endif
>  }
>  
> diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
> index 7a270a7bd5..3592e057ce 100644
> --- a/hw/9pfs/9p-util-win32.c
> +++ b/hw/9pfs/9p-util-win32.c
> @@ -929,3 +929,10 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>      errno = ENOTSUP;
>      return -1;
>  }
> +
> +off_t qemu_dirent_off_win32(void *s, void *fs)
> +{
> +    V9fsState *v9fs = s;
> +
> +    return v9fs->ops->telldir(&v9fs->ctx, (V9fsFidOpenState *)fs);
> +}

That's a bit tricky. So far (i.e. for Linux host, macOS host) we are storing
the directory offset directly to the dirent struct. We are not using telldir()
as the stream might have mutated in the meantime, hence calling telldir()
might return a value that does no longer correlate to dirent in question.

Hence my idea was to use the same hack for Windows as we did for macOS, where
we simply misuse a dirent field known to be not used, on macOS that's
d_seekoff which we are misusing for that purpose.

Looking at the mingw dirent.h header though, there is not much we can choose
from. d_reclen is not used, but too short, d_ino is not used by mingw, but
currently we actually read this field in server common code to assemble a file
ID for guest. I mean it is always zero on Windows, so we could still misuse
it, but we would need to inject more hacks there. :/

> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 072cf67956..be247eeb30 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2336,7 +2336,7 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
>          count += len;
>          v9fs_stat_free(&v9stat);
>          v9fs_path_free(&path);
> -        saved_dir_pos = qemu_dirent_off(dent);
> +        saved_dir_pos = qemu_dirent_off(dent, pdu->s, &fidp->fs);
>      }
>  
>      v9fs_readdir_unlock(&fidp->fs.dir);
> @@ -2537,7 +2537,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
>              qid.version = 0;
>          }
>  
> -        off = qemu_dirent_off(dent);
> +        off = qemu_dirent_off(dent, pdu->s, &fidp->fs);
>          v9fs_string_init(&name);
>          v9fs_string_sprintf(&name, "%s", dent->d_name);
>  
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 93ba44fb75..d40515a607 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -168,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
>          }
>  
>          size += len;
> -        saved_dir_pos = qemu_dirent_off(dent);
> +        saved_dir_pos = qemu_dirent_off(dent, s, &fidp->fs);
>      }
>  
>      /* restore (last) saved position */
> 




