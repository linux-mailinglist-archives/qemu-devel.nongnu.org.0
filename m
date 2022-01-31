Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B66F4A4A36
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:16:16 +0100 (CET)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYPf-000144-Jw
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:16:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEX0Q-0007FX-AK; Mon, 31 Jan 2022 08:46:06 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:50995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEX0L-0004iS-Ln; Mon, 31 Jan 2022 08:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=EFOfpQD44+GUVMFr9sm/X48V8tpuKEu5QIoQBEe48ac=; b=BQM5THtk+5oYQqAwARR+bfirvf
 XdUASLzIcA2RKbdN3Rmbm4J2++rU8h5K2nL+9rdUAJOmklZy8ZPzG3T+7Ao0Lu1pyfA+6D935BtfL
 JhffRH2JY1J9Y//y+y4k9NPmS4HquRHsZgnZyoWKDiosDeaC3aiThSWHsFe/52751nGzA6M3FHhJ2
 zoYhJ5D+JMTLxHcSXpNoWGDIC6lVg7An1ylhG4Y0siYunVLRtVGiccGVA5ZnJbxTZwal7SXDcUz/S
 qIL1n32BZ2i6giizduEeFaZSYSo+/M0fsg1A8Qc6xhjbZeP7qgmqVpZsFVCzM+rA2yfs6r73TYlxQ
 X13dGpCq1272yH2NNw1Rk2ROn3SELCdi35fIk6V2w85VFzkL8P3Nu39fNr+W5iVp+jsC0X+5yRuVC
 dOTCrQAZbu95FRu9x8cAuNU/nYs/a8h+OrkgJ8Uzjdi5QjoW9sxpB4Xt5Ml15DbREO3dsvVSdeXlS
 lUBCwRLO8ikAHh7ZARbDahOQSQXLuEnM/1kFHXv4erK+esXstmgBwBqXKh8XeY/lksF/Gyl6Eep4i
 HSnSKjOsAn7cFVOSaDdUXTrV6qa62adYUmGamxs6qcEvMJo5t/+IMB1JSnUxLkuV4If/kIne821YF
 wDiWBN7fZ49BAjtPcXp3fLWRqWt79YrRWlQq+PscA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, ldv@altlinux.org
Subject: Re: [PATCH v2] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Mon, 31 Jan 2022 14:45:56 +0100
Message-ID: <6821400.qEESzP8Xzo@silver>
In-Reply-To: <20220128223326.927132-1-vt@altlinux.org>
References: <20220128223326.927132-1-vt@altlinux.org>
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

On Freitag, 28. Januar 2022 23:33:26 CET Vitaly Chikunov wrote:
> `struct dirent' returned from readdir(3) could be shorter than
> `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:

I actually suggested to make it clear in the commit log comment here that it 
could be both, shorter or longer, but OK, the API doc comment on 
qemu_dirent_dup() sais it, so ...

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

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
> Tested on x86-64 Linux.
> 
> Changes since v1:
> - Update commentary text.
> - Remove hanging of g_malloc "errors".
> - Simplify qemu_dirent_dup.
> 
>  hw/9pfs/codir.c      |  3 +--
>  include/qemu/osdep.h | 13 +++++++++++++
>  util/osdep.c         | 16 ++++++++++++++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
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
> index 42a0a4986a..0bc7ec1e22 100644
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
> @@ -615,3 +616,18 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
>      return readv_writev(fd, iov, iov_cnt, true);
>  }
>  #endif
> +
> +struct dirent *
> +qemu_dirent_dup(struct dirent *dent)
> +{
> +#if defined _DIRENT_HAVE_D_RECLEN
> +    /* Avoid use of strlen() if there's d_reclen. */
> +    const size_t sz = dent->d_reclen;
> +#else
> +    /* Fallback to a most portable way. */
> +    const size_t sz = offsetof(struct dirent, d_name) +
> +                      strlen(dent->d_name) + 1;
> +#endif
> +    struct dirent *dst = g_malloc(sz);
> +    return memcpy(dst, dent, sz);
> +}



