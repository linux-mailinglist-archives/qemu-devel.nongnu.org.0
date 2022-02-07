Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F78B4ACC67
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 00:03:29 +0100 (CET)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHD2d-000791-7g
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 18:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHCvf-0000kH-UR
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:56:15 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHCvd-0007zC-PL
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=V/veNjeb63bgrUfjGzzUVR29/f6CXeLyHE37pzA9okI=; b=U7cmmCUc1Lc/7xmMrij5lwjJDw
 dfpR9TopcwLu29ds1fRgjvVDf4oyvd7VxWQCJSExkVc9XhGx67cNvhSbLRxqAS9AkmgbwxFhHiNyD
 STQJymdiPIJNfU60Z1IHGcivf73hgxnF8XfpeRVZKmoDks/nSuBmvM7A+2fQXwdIpJ+neRB9pfcdx
 0HuioHzZcMNA6ECb8GQusa9zFV46lcA00dZcfl5AQg337S0zZTfzwgg5xT77XIwGtktlMi+ebDvze
 g9hjbpcKkVTQxhHUXqCd8q/paTC09aUTixh/OfFN1aJ/fSr8MqF87RG4ZO4MUzmXgPEePw6n40QkH
 xyHOeA17iEYn09wssjqct9ajFb0v7Y2iHsLaaVW8TTqB0l55Ck5HKzWiPzVD2hCl0s7WTLSbpMugO
 Bn6I0vUQHc7vY0uB7CZL9ViBalsJbSPMFcV810mWa4yUNYjsBw45cFIEaGg7q9BK5dJpXPyMydjWY
 rXq055FtWGKpYvYb7c/9nlCDvhfB3iUS60pArYpWzBQAvabVo8WE2tVogxNO8k8+59hgIgbJ1GGBY
 RiPdHVbFgx7FpGiIPnIJ3gHMfiVCVa4fhK7djORKIZX2wduuB71+NJEmSWpq7ae9c7W9vDSTZR9dZ
 QTYDzXD0DdoXpiM2B7ilxwrETQwwc5BV/81OUKdmw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, hi@alyssa.is, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Mon, 07 Feb 2022 23:56:10 +0100
Message-ID: <2714656.jhBehFKKHS@silver>
In-Reply-To: <20220207224024.87745-10-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-10-wwcohen@gmail.com>
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

On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Darwin does not support mknodat. However, to avoid race conditions
> with later setting the permissions, we must avoid using mknod on
> the full path instead. We could try to fchdir, but that would cause
> problems if multiple threads try to call mknodat at the same time.
> However, luckily there is a solution: Darwin includes a function
> that sets the cwd for the current thread only.
> This should suffice to use mknod safely.
> 
> This function (pthread_fchdir_np) is protected by a check in
> meson in a patch later in tihs series.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style
>              - Replace clang references with gcc
>              - Note radar filed with Apple for missing syscall
>              - Replace direct syscall with pthread_fchdir_np and
>                adjust patch notes accordingly
>              - Move qemu_mknodat from 9p-util to osdep and os-posix]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---

Like already mentioned by me moments ago on previous v4 (just echoing) ...

>  hw/9pfs/9p-local.c   |  4 ++--
>  include/qemu/osdep.h | 10 ++++++++++
>  os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index a0d08e5216..d42ce6d8b8 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> *dir_path,
> 
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
>          if (err == -1) {
>              goto out;
>          }
> @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> *dir_path, }
>      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
>                 fs_ctx->export_flags & V9FS_SM_NONE) {
> -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> +        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
>          if (err == -1) {
>              goto out;
>          }
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index d1660d67fa..f3a8367ece 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -810,3 +810,13 @@ static inline int
> platform_does_not_support_system(const char *command) #endif
> 
>  #endif
> +
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> + * os-posix.c
> + */
> +#ifdef CONFIG_DARWIN
> +int pthread_fchdir_np(int fd);
> +#endif

I would make that:

#ifdef CONFIG_DARWIN
int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
#endif

here and ...

> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
> diff --git a/os-posix.c b/os-posix.c
> index ae6c9f2a5e..95c1607065 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -24,6 +24,7 @@
>   */
> 
>  #include "qemu/osdep.h"
> +#include <os/availability.h>
>  #include <sys/wait.h>
>  #include <pwd.h>
>  #include <grp.h>
> @@ -332,3 +333,36 @@ int os_mlock(void)
>      return -ENOSYS;
>  #endif
>  }
> +
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed.
> + *
> + * Radar filed with Apple for implementing mknodat:
> + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> + */
> +#ifdef CONFIG_DARWIN
> +
> +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));

... drop the duplicate declaration of pthread_fchdir_np() here.

> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    int preserved_errno, err;
> +    if (pthread_fchdir_np(dirfd) < 0) {
> +        return -1;
> +    }
> +    err = mknod(filename, mode, dev);
> +    preserved_errno = errno;
> +    /* Stop using the thread-local cwd */
> +    pthread_fchdir_np(-1);
> +    if (err < 0) {
> +        errno = preserved_errno;
> +    }
> +    return err;
> +}
> +#else
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    return mknodat(dirfd, filename, mode, dev);
> +}
> +#endif



