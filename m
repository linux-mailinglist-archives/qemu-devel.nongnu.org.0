Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F44A9951
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:29:59 +0100 (CET)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxiw-0005fo-UI
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldv@altlinux.org>)
 id 1nFxVj-0002Cj-Jq; Fri, 04 Feb 2022 07:16:19 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:37088)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ldv@altlinux.org>)
 id 1nFxVT-0001MC-WC; Fri, 04 Feb 2022 07:16:13 -0500
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 7D17972C905;
 Fri,  4 Feb 2022 15:15:38 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 6F1017CD200; Fri,  4 Feb 2022 15:15:38 +0300 (MSK)
Date: Fri, 4 Feb 2022 15:15:38 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Vitaly Chikunov <vt@altlinux.org>
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220204121538.GA16340@altlinux.org>
References: <20220204050609.15510-1-vt@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204050609.15510-1-vt@altlinux.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=ldv@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 04, 2022 at 08:06:09AM +0300, Vitaly Chikunov wrote:
> `struct dirent' returned from readdir(3) could be shorter (or longer)
> than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:
> 
>  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 + 0x497eed)
>  #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64 + 0x4982e9)
>  #2  0x0000555555eb7983 coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983)
>  #3  0x00007ffff73e0be0 n/a (n/a + 0x0)
> 
> While fixing, provide a helper for any future `struct dirent' cloning.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> Cc: qemu-stable@nongnu.org
> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> ---
> Tested on x86-64 Linux again.
> 
> Changes from v2:
> - Make it work with a simulated dirent where d_reclen is 0, which was
>   caused abort in readdir qos-test, by using fallback at runtime.
> 
>  hw/9pfs/codir.c      |  3 +--
>  include/qemu/osdep.h | 13 +++++++++++++
>  util/osdep.c         | 18 ++++++++++++++++++
>  3 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 032cce04c4..c0873bde16 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -143,8 +143,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
>          } else {
>              e = e->next = g_malloc0(sizeof(V9fsDirEnt));
>          }
> -        e->dent = g_malloc0(sizeof(struct dirent));
> -        memcpy(e->dent, dent, sizeof(struct dirent));
> +        e->dent = qemu_dirent_dup(dent);
>  
>          /* perform a full stat() for directory entry if requested by caller */
>          if (dostat) {
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index d1660d67fa..ce12f64853 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -805,6 +805,19 @@ static inline int platform_does_not_support_system(const char *command)
>  }
>  #endif /* !HAVE_SYSTEM_FUNCTION */
>  
> +/**
> + * Duplicate directory entry @dent.
> + *
> + * It is highly recommended to use this function instead of open coding
> + * duplication of @c dirent objects, because the actual @c struct @c dirent
> + * size may be bigger or shorter than @c sizeof(struct dirent) and correct
> + * handling is platform specific (see gitlab issue #841).
> + *
> + * @dent - original directory entry to be duplicated
> + * @returns duplicated directory entry which should be freed with g_free()
> + */
> +struct dirent *qemu_dirent_dup(struct dirent *dent);
> +
>  #ifdef __cplusplus
>  }
>  #endif
> diff --git a/util/osdep.c b/util/osdep.c
> index 42a0a4986a..2c80528a61 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -33,6 +33,7 @@
>  extern int madvise(char *, size_t, int);
>  #endif
>  
> +#include <dirent.h>
>  #include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "qemu/sockets.h"
> @@ -615,3 +616,20 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
>      return readv_writev(fd, iov, iov_cnt, true);
>  }
>  #endif
> +
> +struct dirent *
> +qemu_dirent_dup(struct dirent *dent)
> +{
> +    size_t sz = 0;
> +#if defined _DIRENT_HAVE_D_RECLEN
> +    /* Avoid use of strlen() if there's d_reclen. */
> +    sz = dent->d_reclen;
> +#endif
> +    if (sz == 0) {
> +        /* Fallback to the most portable way. */
> +        sz = offsetof(struct dirent, d_name) +
> +                      strlen(dent->d_name) + 1;
> +    }
> +    struct dirent *dst = g_malloc(sz);
> +    return memcpy(dst, dent, sz);
> +}

Reviewed-by: Dmitry V. Levin" <ldv@altlinux.org>


-- 
ldv

