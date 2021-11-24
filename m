Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41745BE65
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 13:44:49 +0100 (CET)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mprdm-0000Fn-Pc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 07:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpraq-0007J6-4X
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:41:44 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpran-0005tK-8i
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KkTIk2JJM8V86732W//HRS1R9POlugfJU5gFrMUS1T8=; b=qvFKca0tGjmH9Mqsze55t7fM7+
 i8AzYk8DpNRwYMijpDJ1XX9/YuucsBsO+SXPztdYSoxmKgrqDIm2o2tv77jO2DQEAxkqzZdlk+ApV
 JTwEfnvO5ImpYNA1B8k5AsrJANOD3E6fattvhsf+0tjdBnA65v8Y/+4Wu423qE6KnHSdAQdiOAlQW
 uu34jsh5XM1S140fi/FdkkEZks4EaDOopsLDIJaJIy1lvaYyy2hxFU9HdVMBHy/zYiBPw+ClpAzM1
 gTk2zHanZPB8h7t91aZyR4/gloDhPcDg+0JOvdZ3RiizeqkXYDuefs2ZzR+ZJ00xsNRwWeacTQany
 s5dRRLCWpB30ox4UEv0gHA5SbKReqcZXvCTAF2rM1i4gwmjQPUKNyxOIdlzVyWDHerC34FIY0WjkN
 vkCN7qkb3vb3FKqHEH+pz1DOeiyfYFcztoV3thocymuQY6uMkbHMV9PMMbMTIEU5uEWC+BUvUJalH
 2ObhnIV/hfQLkdKoSlvK7ATDCFP5tSfz+92TNDVnZ3tv2bSZbzAZt5G/E8QwbD0Uq4bmZ5h0Tqa1g
 z3C6wIHDUYuHHlaSU0uKXjPFAf64GShI29QdfsrRpHnldvCB5AbMg+WToyGOLkgjut4wU7jtOd+7j
 BQDqr2qECS3p1LKZwE/vfnMkMeVM2BZ+WuQr/iyvg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@alumni.harvard.edu>
Subject: Re: [PATCH v2 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Wed, 24 Nov 2021 13:41:34 +0100
Message-ID: <15166157.SjrypyALAi@silver>
In-Reply-To: <20211122004913.20052-2-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-2-wwcohen@gmail.com>
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

On Montag, 22. November 2021 01:49:03 CET Will Cohen wrote:
> From: Keno Fischer <keno@alumni.harvard.edu>
> 
>  - Guard Linux only headers.
>  - Add qemu/statfs.h header to abstract over the which
>    headers are needed for struct statfs
>  - Define `ENOATTR` only if not only defined
>    (it's defined in system headers on Darwin).
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Fix headers for Alpine]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  fsdev/file-op-9p.h    |  2 +-
>  hw/9pfs/9p-local.c    |  2 ++
>  hw/9pfs/9p.c          |  4 ++++
>  include/qemu/statfs.h | 19 +++++++++++++++++++
>  include/qemu/xattr.h  |  4 +++-
>  5 files changed, 29 insertions(+), 2 deletions(-)
>  create mode 100644 include/qemu/statfs.h
> 
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index 8fd89f0447..16c1a9d9fe 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -16,7 +16,7 @@
> 
>  #include <dirent.h>
>  #include <utime.h>
> -#include <sys/vfs.h>
> +#include "qemu/statfs.h"
>  #include "qemu-fsdev-throttle.h"
>  #include "p9array.h"
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 210d9e7705..1a5e3eed73 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -32,10 +32,12 @@
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include <libgen.h>
> +#ifdef CONFIG_LINUX
>  #include <linux/fs.h>
>  #ifdef CONFIG_LINUX_MAGIC_H
>  #include <linux/magic.h>
>  #endif
> +#endif
>  #include <sys/ioctl.h>
> 
>  #ifndef XFS_SUPER_MAGIC
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 15b3f4d385..9c63e14b28 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -32,7 +32,11 @@
>  #include "migration/blocker.h"
>  #include "qemu/xxhash.h"
>  #include <math.h>
> +#ifdef CONFIG_LINUX
>  #include <linux/limits.h>
> +#else
> +#include <limits.h>
> +#endif
> 
>  int open_fd_hw;
>  int total_open_fd;
> diff --git a/include/qemu/statfs.h b/include/qemu/statfs.h
> new file mode 100644
> index 0000000000..dde289f9bb
> --- /dev/null
> +++ b/include/qemu/statfs.h
> @@ -0,0 +1,19 @@
> +/*
> + * Host statfs header abstraction
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2, or any
> + * later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +#ifndef QEMU_STATFS_H
> +#define QEMU_STATFS_H
> +
> +#ifdef CONFIG_LINUX
> +# include <sys/vfs.h>
> +#endif
> +#ifdef CONFIG_DARWIN
> +# include <sys/param.h>
> +# include <sys/mount.h>
> +#endif
> +
> +#endif

I wonder whether adding a separate header file statfs.h just for this isn't 
overkill, as this is only included once. OTOH there is already xattr.h in 
QEMU:

> diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
> index a83fe8e749..f1d0f7be74 100644
> --- a/include/qemu/xattr.h
> +++ b/include/qemu/xattr.h
> @@ -22,7 +22,9 @@
>  #ifdef CONFIG_LIBATTR
>  #  include <attr/xattr.h>
>  #else
> -#  define ENOATTR ENODATA
> +#  if !defined(ENOATTR)
> +#    define ENOATTR ENODATA
> +#  endif
>  #  include <sys/xattr.h>
>  #endif



