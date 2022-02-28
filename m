Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A174C6E18
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:24:44 +0100 (CET)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOg14-0008Hx-O3
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOfxQ-0005oZ-Cl
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:20:57 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:38341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOfxN-0006cv-N2
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8f+AnIPx4tEqX+DfeEJi2gPGP4wfHq8cCQfrO1oF79I=; b=GXfeXgyXhqMTxCSyNtNHNGdPye
 UFR0ciDp93p3zm/VEunVzuU12u19YMx+Cqyx/u87ZkIP8XDnIlOaVLyF7VPfaGCkq6w/t0293lVqU
 LPcME1P2Fo4yN/eCP05JJvBoKh3XgT3owNdKHydmJkTcYX2p/JRqsR5vS7WB7DYnLti8sXkNSDCkB
 cEG51YXLspU2hWDFyasRLdkgDUSeH+pDj2lak4FEwMgZcOOiGvNnp2TXc7MN2tbjEpn0ALwO73Bah
 6F4uij0xKSRWngxsoysbXPQuykvmps5MeYKjCKoF8SN6Y3DsW8Jydi2/0w9VqPFm9CauA3ceO5GX0
 KlS1GtK2cmi2kTr0J85vBHptSTvExJc/nOpTexnskAHnn3AVOAyemZdaBtwD15Ovf+nbPhd+pfBPu
 CfjK7EBZpb7UpnBUrYwwGqu/T1yAB8ImIMYGzqXFNTCBdzyRRnUMuzgu+GdAy9KUMLfhJDjqsHs6A
 Gws/bpIObcnv9iWBV3tUhi/BpcyLXxv9Gt1DDF3Jbw2fJU0w964d/fTcRfK0P11SlIrSLhc/xPl2O
 iMG6F+l4F4UNC10GTCLI8t6VtPniUO+H8EVGGH9NrHsVK1S4waAdw5XjVJNBnPsbBUoXLmTobIbr9
 NEgveIZx2lUnB4++sMlHQqQvejNgFrZSVUsdJJ5Dw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Mon, 28 Feb 2022 14:20:48 +0100
Message-ID: <5277572.8N0aQqchxN@silver>
In-Reply-To: <20220227223522.91937-10-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-10-wwcohen@gmail.com>
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

On Sonntag, 27. Februar 2022 23:35:20 CET Will Cohen wrote:
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
> meson in a patch later in this series.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style
>              - Replace clang references with gcc
>              - Note radar filed with Apple for missing syscall
>              - Replace direct syscall with pthread_fchdir_np and
>                adjust patch notes accordingly
>              - Declare pthread_fchdir_np with
>              - __attribute__((weak_import)) to allow checking for
>                its presence before usage
>              - Move declarations above cplusplus guard
>              - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
>                presence in 9p-util
>              - Rebase to apply cleanly on top of the 2022-02-10
>                changes to 9pfs
>              - Fix line over 90 characters formatting error]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-local.c       |  4 ++--
>  hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
>  hw/9pfs/9p-util-linux.c  |  6 ++++++
>  hw/9pfs/9p-util.h        | 11 +++++++++++
>  meson.build              |  1 +
>  5 files changed, 53 insertions(+), 2 deletions(-)
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
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index cdb4c9e24c..bec0253474 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -7,6 +7,8 @@
> 
>  #include "qemu/osdep.h"
>  #include "qemu/xattr.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "9p-util.h"
> 
>  ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char
> *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const char
> *filename, const char *name, close_preserve_errno(fd);
>      return ret;
>  }
> +
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed.
> + *
> + * Radar filed with Apple for implementing mknodat:
> + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> + */
> +#if defined CONFIG_PTHREAD_FCHDIR_NP
> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    int preserved_errno, err;
> +    if (!pthread_fchdir_np) {
> +        error_report_once("pthread_fchdir_np() not available on this version of macOS");

You took the code style error message a bit too literal; this line is still
too long:

WARNING: line over 80 characters
#199: FILE: hw/9pfs/9p-util-darwin.c:81:
+        error_report_once("pthread_fchdir_np() not available on this version of macOS");

total: 0 errors, 1 warnings, 91 lines checked

However this is too trivial to send a v10 just for this. If there are no other
issues in this v9 then I'll simply fix this on my end. My plan is to queue
this series tomorrow.

Best regards,
Christian Schoenebeck

> +        return -ENOTSUP;
> +    }
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
> +
> +#endif
> diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> index 398614a5d0..db451b0784 100644
> --- a/hw/9pfs/9p-util-linux.c
> +++ b/hw/9pfs/9p-util-linux.c
> @@ -61,4 +61,10 @@ int fsetxattrat_nofollow(int dirfd, const char *filename,
> const char *name, ret = lsetxattr(proc_path, name, value, size, flags);
>      g_free(proc_path);
>      return ret;
> +
> +}
> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    return mknodat(dirfd, filename, mode, dev);
>  }
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 9abff79884..1f74d37558 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -112,5 +112,16 @@ static inline off_t qemu_dirent_off(struct dirent
> *dent) #endif
>  }
> 
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> + * os-posix.c. pthread_fchdir_np is weakly linked here as a guard
> + * in case it disappears in future macOS versions, because it is
> + * is a private API.
> + */
> +#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> +int pthread_fchdir_np(int fd) __attribute__((weak_import));
> +#endif
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
> 
>  #endif
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..3f8dca2c7a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1609,6 +1609,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE',
> cc.has_function('posix_fallocate'
> config_host_data.set('CONFIG_POSIX_MEMALIGN',
> cc.has_function('posix_memalign')) config_host_data.set('CONFIG_PPOLL',
> cc.has_function('ppoll'))
>  config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix:
> '#include <sys/uio.h>')) +config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP',
> cc.has_function('pthread_fchdir_np'))
> config_host_data.set('CONFIG_SEM_TIMEDWAIT',
> cc.has_function('sem_timedwait', dependencies: threads))
> config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
> config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and
> cc.has_function('unshare'))



