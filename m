Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2796F45CAB4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 18:13:25 +0100 (CET)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpvpk-0002la-9h
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 12:13:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpvjy-00029e-VK
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:07:27 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:32995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpvjw-0007sS-0p
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=jFU8uYpm3b2eqE/dPrPEf5rUfWHKs9M8MKj2Mg6pTSk=; b=XXOoJZ/flsYCg2EB0QcgxEvy0J
 230H7qz0WrWh/nhTLx1SAu4ZGWjbrE/5lj+SMPNcwqrRMZj9uTmHXLVoQ1xDtnwpIhHkNDHFHiHUO
 kmX3cTfPtg1s2VefIvBECFsDCu4eMh4IiRIRAss9riGMwvF4BEaTZU/aSlaHa6hqVpQeBkBviyqhV
 e90CvWh8Xf4kpBE0VocptghX6rDsj0rWC+qreqxVhyRYF8XXO8ka2zIhCEmcEmurbl8mWB9OFTqHv
 lUNc5YugZ70nhMa6jg9mEZfQGPozwrHf7TVqmhVrbx8p8E0y9xHOUkYnpbnflWWfySRaFQF2/w1Fh
 9EQ9YzUubyvaAnKgf2gUtcMyWa9Tr5V+0IKhh1CCmgH0giOTQTNKi+5C6YlQd+E3WA57u+edZWpSJ
 Lg85GFs5RRWij6KPhggL/IOEr4UuRcpNoQxmpF31CfW1omKXWwledoLqR65/6R8HZeePl1tgEKMGS
 3pHMlw5mOOydD0xbyQAHwk7g+X1NX8BBYtKPqwgxW9GD7F5KEBYk+I1vBBbGwcDe0HcObA/SPKw+3
 jdhTJGZQK7LzvRmzyyzF9M1gBZrtuZqT2TJW4pg6lNTO9FS5ortIVp4AXKt4v/KPSZKo8Yg4yYm9J
 wWuAiXnBt+LbsfrTHoHYjI/9JDmDcAjFrblYOm0sk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v2 09/11] 9p: darwin: Provide fallback impl for utimensat
Date: Wed, 24 Nov 2021 18:07:19 +0100
Message-ID: <3138822.p1SLbFchMD@silver>
In-Reply-To: <20211122004913.20052-10-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-10-wwcohen@gmail.com>
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

On Montag, 22. November 2021 01:49:11 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> This function is new in Mac OS 10.13. Provide a fallback implementation
> when building against older SDKs. The complication in the definition comes
> having to separately handle the used SDK version and the target OS version.
> 
> - If the SDK version is too low (__MAC_10_13 not defined), utimensat is not
>   defined in the header, so we must not try to use it (doing so would
> error). - Otherwise, if the targetted OS version is at least 10.13, we know
> this function is available, so we can unconditionally call it.

AFAIK QEMU officially only supports "the last two released versions" of macOS,
and Peter periodically wipes backward compatibility code for older macOS
versions with new release cycles:

commit 483644c25b932360018d15818d8bcd8c85ba70b8
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Sat Feb 1 17:05:34 2020 +0000

    ui/cocoa: Drop workarounds for pre-10.12 OSX
    
    Our official OSX support policy covers the last two released versions.
    Currently that is 10.14 and 10.15.  We also may work on older versions, but
    don't guarantee it.
    
    In commit 50290c002c045280f8d in mid-2019 we introduced some uses of
    CLOCK_MONOTONIC which incidentally broke compilation for pre-10.12 OSX
    versions (see LP:1861551). We don't intend to fix that, so we might
    as well drop the code in ui/cocoa.m which caters for pre-10.12
    versions as well. (For reference, 10.11 fell out of Apple extended
    security support in September 2018.)
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
    Message-Id: <20200201170534.22123-1-peter.maydell@linaro.org>
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

And this series would not go into a QEMU release prior early next year,
so probably dropping this macOS backward compatibility code right from
the start?

> - Lastly, we check for the availability of the __builtin_available macro to
>   potentially insert a dynamic check for this OS version. However,
> __builtin_available is only available with sufficiently recent versions of
> clang and while all Apple clang versions that ship with Xcode versions that
> support the 10.13 SDK support with builtin, we want to allow building with
> compilers other than Apple clang that may not support this builtin.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-local.c       |  2 +-
>  hw/9pfs/9p-util-darwin.c | 96 ++++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p-util-linux.c  |  6 +++
>  hw/9pfs/9p-util.h        |  8 ++++
>  hw/9pfs/9p.c             |  1 +
>  5 files changed, 112 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 2bfff79b12..4268703d05 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -1076,7 +1076,7 @@ static int local_utimensat(FsContext *s, V9fsPath
> *fs_path, goto out;
>      }
> 
> -    ret = utimensat(dirfd, name, buf, AT_SYMLINK_NOFOLLOW);
> +    ret = utimensat_nofollow(dirfd, name, buf);
>      close_preserve_errno(dirfd);
>  out:
>      g_free(dirpath);
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index cdb4c9e24c..ac414bcbfd 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -62,3 +62,99 @@ int fsetxattrat_nofollow(int dirfd, const char *filename,
> const char *name, close_preserve_errno(fd);
>      return ret;
>  }
> +
> +#ifndef __has_builtin
> +#define __has_builtin(x) 0
> +#endif
> +
> +static int update_times_from_stat(int fd, struct timespec times[2],
> +                                  int update0, int update1)
> +{
> +    struct stat buf;
> +    int ret = fstat(fd, &buf);
> +    if (ret == -1) {
> +        return ret;
> +    }
> +    if (update0) {
> +        times[0] = buf.st_atimespec;
> +    }
> +    if (update1) {
> +        times[1] = buf.st_mtimespec;
> +    }
> +    return 0;
> +}
> +
> +int utimensat_nofollow(int dirfd, const char *filename,
> +                       const struct timespec times_in[2])
> +{
> +    int ret, fd;
> +    int special0, special1;
> +    struct timeval futimes_buf[2];
> +    struct timespec times[2];
> +    memcpy(times, times_in, 2 * sizeof(struct timespec));
> +
> +/* Check whether we have an SDK version that defines utimensat */
> +#if defined(__MAC_10_13)
> +# if __MAC_OS_X_VERSION_MIN_REQUIRED >= __MAC_10_13
> +#  define UTIMENSAT_AVAILABLE 1
> +# elif __has_builtin(__builtin_available)
> +#  define UTIMENSAT_AVAILABLE __builtin_available(macos 10.13, *)
> +# else
> +#  define UTIMENSAT_AVAILABLE 0
> +# endif
> +    if (UTIMENSAT_AVAILABLE) {
> +        return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
> +    }
> +#endif
> +
> +    /* utimensat not available. Use futimes. */
> +    fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
> +    if (fd == -1) {
> +        return -1;
> +    }
> +
> +    special0 = times[0].tv_nsec == UTIME_OMIT;
> +    special1 = times[1].tv_nsec == UTIME_OMIT;
> +    if (special0 || special1) {
> +        /* If both are set, nothing to do */
> +        if (special0 && special1) {
> +            ret = 0;
> +            goto done;
> +        }
> +
> +        ret = update_times_from_stat(fd, times, special0, special1);
> +        if (ret < 0) {
> +            goto done;
> +        }
> +    }
> +
> +    special0 = times[0].tv_nsec == UTIME_NOW;
> +    special1 = times[1].tv_nsec == UTIME_NOW;
> +    if (special0 || special1) {
> +        ret = futimes(fd, NULL);
> +        if (ret < 0) {
> +            goto done;
> +        }
> +
> +        /* If both are set, we are done */
> +        if (special0 && special1) {
> +            ret = 0;
> +            goto done;
> +        }
> +
> +        ret = update_times_from_stat(fd, times, special0, special1);
> +        if (ret < 0) {
> +            goto done;
> +        }
> +    }
> +
> +    futimes_buf[0].tv_sec = times[0].tv_sec;
> +    futimes_buf[0].tv_usec = times[0].tv_nsec / 1000;
> +    futimes_buf[1].tv_sec = times[1].tv_sec;
> +    futimes_buf[1].tv_usec = times[1].tv_nsec / 1000;
> +    ret = futimes(fd, futimes_buf);
> +
> +done:
> +    close_preserve_errno(fd);
> +    return ret;
> +}
> diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> index 398614a5d0..d54bf57a59 100644
> --- a/hw/9pfs/9p-util-linux.c
> +++ b/hw/9pfs/9p-util-linux.c
> @@ -62,3 +62,9 @@ int fsetxattrat_nofollow(int dirfd, const char *filename,
> const char *name, g_free(proc_path);
>      return ret;
>  }
> +
> +int utimensat_nofollow(int dirfd, const char *filename,
> +                       const struct timespec times[2])
> +{
> +    return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
> +}
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 38ef8b289d..1c477a0e66 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -36,6 +36,12 @@ static inline int qemu_lsetxattr(const char *path, const
> char *name, #define qemu_lsetxattr lsetxattr
>  #endif
> 
> +/* Compatibility with old SDK Versions for Darwin */
> +#if defined(CONFIG_DARWIN) && !defined(UTIME_NOW)
> +#define UTIME_NOW -1
> +#define UTIME_OMIT -2
> +#endif
> +
>  static inline void close_preserve_errno(int fd)
>  {
>      int serrno = errno;
> @@ -96,5 +102,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char
> *filename, char *list, size_t size);
>  ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
>                                  const char *name);
> +int utimensat_nofollow(int dirfd, const char *filename,
> +                       const struct timespec times[2]);
> 
>  #endif
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index d671995aa4..3d676405c7 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -27,6 +27,7 @@
>  #include "virtio-9p.h"
>  #include "fsdev/qemu-fsdev.h"
>  #include "9p-xattr.h"
> +#include "9p-util.h"
>  #include "coth.h"
>  #include "trace.h"
>  #include "migration/blocker.h"




