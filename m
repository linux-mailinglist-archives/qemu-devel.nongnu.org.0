Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D6D45CAC9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 18:22:37 +0100 (CET)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpvye-0004Fy-Fh
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 12:22:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpvwt-00037P-Vv
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:20:48 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:49155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpvwr-00061v-H6
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=D1wiAW11ZfIg03zPQw1H/lRjsAa8E9/8zx14C6Ksva0=; b=OfUGb0oMb7PHSrTuswCHy/h7K4
 awtlAhi3KHwIj9f6+12weE6pqevCOTWRA2M+ZsJ1Tmpz9IJt3qB249rhuavLkyEaRMorfvv9sOLKs
 LBnmRyDaACXkO2NPLqu/LvQ3t1rX2MNUP5gQVY+xjAwjsDi/oci+BIO24GwhaATLRoh/p/PA14bsV
 1dZ4wjsmGvzIUJvC1OIwOOSW3BW7UX26eBVgWzbHbjp+9GnxsUAzfYFl6TI7YHBtUnQBXOFowQ959
 RZL+BNG3GSXcvZ7Ahs24BPI4YgOtq4xqxsY/q8Gs9Em30urORslY2nZNnGSizu78HSq6edGJnpL00
 W9VTIzZ8eY3LYh2O809J/VvG/PNkj/fgrHVL1Ykp5Nu2PfD0cXMHT5MZkrbQ/hXr6Gg2C9ovgC7wl
 Nc3nZi+12801aRaO1ulMpW/6+YzmQY0wLSBi+f+CfIBcFZ8fqACDJF1d9y3wdTi6vMyIQZPiae8+l
 9iS8oHFdlPpvzvpi7/exmPx3fnLhlrSOqg4GCUIpArUcoh0F0Ct/u6LzUvx2fkQRGK5nMYoyu1pdK
 RjCDi4WwuPSySzGH/5DRdfqcdTjKYLqtbfckZ5oXyInxvrPywNNVJeynC2/9091cEuFgDNj0iWTQG
 dMoZb8nxre8uX6fZZ3Z707bXmPlGc82SDm+fqttnY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v2 10/11] 9p: darwin: Implement compatibility for mknodat
Date: Wed, 24 Nov 2021 18:20:42 +0100
Message-ID: <3039867.d4g7DdiYNH@silver>
In-Reply-To: <20211122004913.20052-11-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-11-wwcohen@gmail.com>
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

On Montag, 22. November 2021 01:49:12 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Darwin does not support mknodat. However, to avoid race conditions
> with later setting the permissions, we must avoid using mknod on
> the full path instead. We could try to fchdir, but that would cause
> problems if multiple threads try to call mknodat at the same time.
> However, luckily there is a solution: Darwin as an (unexposed in the
> C library) system call that sets the cwd for the current thread only.
> This should suffice to use mknod safely.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-local.c       |  5 +++--
>  hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
>  hw/9pfs/9p-util-linux.c  |  5 +++++
>  hw/9pfs/9p-util.h        |  2 ++
>  4 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 4268703d05..42b65e143b 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -673,7 +673,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> *dir_path,
> 
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
>          if (err == -1) {
>              goto out;
>          }
> @@ -688,7 +688,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> *dir_path, }
>      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
>                 fs_ctx->export_flags & V9FS_SM_NONE) {
> -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> +        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
>          if (err == -1) {
>              goto out;
>          }
> @@ -701,6 +701,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> *dir_path,
> 
>  err_end:
>      unlinkat_preserve_errno(dirfd, name, 0);
> +
>  out:
>      close_preserve_errno(dirfd);
>      return err;
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index ac414bcbfd..25e67d5067 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -158,3 +158,36 @@ done:
>      close_preserve_errno(fd);
>      return ret;
>  }
> +
> +#ifndef SYS___pthread_fchdir
> +# define SYS___pthread_fchdir 349
> +#endif
> +
> +/*
> + * This is an undocumented OS X syscall. It would be best to avoid it,
> + * but there doesn't seem to be another safe way to implement mknodat.
> + * Dear Apple, please implement mknodat before you remove this syscall.
> + */
> +static int fchdir_thread_local(int fd)

Hooo, that's a brave move. Shouldn't its future and likely becoming absence be 
guarded "somehow"? :)

BTW it might make sense to file a report instead of hoping Apple will just 
read this comment: ;-)
https://feedbackassistant.apple.com/

> +{
> +#pragma clang diagnostic push
> +#pragma clang diagnostic ignored "-Wdeprecated-declarations"
> +    return syscall(SYS___pthread_fchdir, fd);
> +#pragma clang diagnostic pop
> +}

Consider s/clang/GCC/ then it would also work with GCC. In the end most people 
probably just use clang on macOS anyway, but just saying.

> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    int preserved_errno, err;
> +    if (fchdir_thread_local(dirfd) < 0) {
> +        return -1;
> +    }
> +    err = mknod(filename, mode, dev);
> +    preserved_errno = errno;
> +    /* Stop using the thread-local cwd */
> +    fchdir_thread_local(-1);
> +    if (err < 0) {
> +        errno = preserved_errno;
> +    }
> +    return err;
> +}
> diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> index d54bf57a59..4f57d8c047 100644
> --- a/hw/9pfs/9p-util-linux.c
> +++ b/hw/9pfs/9p-util-linux.c
> @@ -68,3 +68,8 @@ int utimensat_nofollow(int dirfd, const char *filename,
>  {
>      return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
>  }
> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    return mknodat(dirfd, filename, mode, dev);
> +}
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 1c477a0e66..cac682d335 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -105,4 +105,6 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
> *filename, int utimensat_nofollow(int dirfd, const char *filename,
>                         const struct timespec times[2]);
> 
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
> +
>  #endif



