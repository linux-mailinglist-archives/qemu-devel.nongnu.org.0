Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBCC4A98FA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:12:17 +0100 (CET)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxRo-000851-7Q
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:12:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFxOW-0006An-M0; Fri, 04 Feb 2022 07:08:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:50799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFxOU-0008HQ-0h; Fri, 04 Feb 2022 07:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=EDL3FcWTUiooXmyNpI66Be6uEJy7DaEDDzCUcd1o1rs=; b=HtlLTby6P4Er6F76DJsb/zZ8kh
 t/C8CNmuBVeT2Yw5zulxYhPmeZCLscLohG7OvtUFstDh9Zr6RT5jbanQVzTlhin/3f5hDCqukbhkn
 2YWc2yf4nv/O32l0SzG4S7pXpaJbgbGMBKZtrwAz5Csdaolg6QM6tGGskxEwyASJRuGYWHFQRI/vp
 W2PWosOyy2bHuH5rbbigtIGAx6zF1rsyR/FcYyqzXOhUnwQYAXVX0whCzx5MBpxohaSNAYZYhPn4i
 OR4goYSRBnCT1kTo8vya56IH0qb7nlDWE0nT3m6JoBa3yYEOGEgMT7EQhViruAzlELZiFq+NLVuA4
 HSzJ+gisglBkAV2ildwVYJZ8WGer1bVU66loAI3tq0UZYPWUj2FUsBgMQ4TF0Q1ISAZ8znDzHFSCB
 /4VY9jj2G49qArj0P/Kblv9Rm8AJqbbJS2TdIuK+96fMr4HPgd4/k9nuUbcBpnXFC1TsovpXQhRsb
 yqCw1ZZlpJPBPP3Hpe0POGNi/e6wlgGvwsPE1ksmNXYeq7SWjG1RQ2In5cVMQ874IhBYAX2puAMqb
 3I++sQ+UumGcUFbje/nE3BnW6dVUeEkHASXBEUg39TgYRk8jgqQBtwMG7coH4xEcNdebOUHv5HJjL
 /jHWr6AqCS4wdNbkBpyAtbqJHw0Wxl9uRz6CluEd4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, ldv@altlinux.org
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Fri, 04 Feb 2022 13:08:45 +0100
Message-ID: <2447721.QdGxfoo5PN@silver>
In-Reply-To: <20220204050609.15510-1-vt@altlinux.org>
References: <20220204050609.15510-1-vt@altlinux.org>
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

On Freitag, 4. Februar 2022 06:06:09 CET Vitaly Chikunov wrote:
> `struct dirent' returned from readdir(3) could be shorter (or longer)
> than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:
> 
>  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
> 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
> + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
> 0x0)
> 
> While fixing, provide a helper for any future `struct dirent' cloning.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> Cc: qemu-stable@nongnu.org
> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> ---
> Tested on x86-64 Linux again.

Tests are passing now, no other issues encountered during some quick tests on 
my side. So looks good to me, thanks!

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck

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
> @@ -143,8 +143,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> *fidp, } else {
>              e = e->next = g_malloc0(sizeof(V9fsDirEnt));
>          }
> -        e->dent = g_malloc0(sizeof(struct dirent));
> -        memcpy(e->dent, dent, sizeof(struct dirent));
> +        e->dent = qemu_dirent_dup(dent);
> 
>          /* perform a full stat() for directory entry if requested by caller
> */ if (dostat) {
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index d1660d67fa..ce12f64853 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -805,6 +805,19 @@ static inline int
> platform_does_not_support_system(const char *command) }
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



