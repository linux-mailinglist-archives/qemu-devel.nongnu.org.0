Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B849FE4C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:47:41 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUPU-0003i5-9T
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nDTZb-0008OY-1S
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:54:03 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nDTZZ-0001N5-89
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:54:02 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-2b-ZHByjPeiltqcUYqM4Kg-1; Fri, 28 Jan 2022 10:52:55 -0500
X-MC-Unique: 2b-ZHByjPeiltqcUYqM4Kg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72EA21083F65;
 Fri, 28 Jan 2022 15:52:53 +0000 (UTC)
Received: from bahia (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C707B028;
 Fri, 28 Jan 2022 15:52:47 +0000 (UTC)
Date: Fri, 28 Jan 2022 16:52:45 +0100
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v3 01/11] 9p: linux: Fix a couple Linux assumptions
Message-ID: <20220128165246.560c8310@bahia>
In-Reply-To: <20220128005611.87185-2-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-2-wwcohen@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@alumni.harvard.edu>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 19:56:01 -0500
Will Cohen <wwcohen@gmail.com> wrote:

> From: Keno Fischer <keno@alumni.harvard.edu>
>=20
>  - Guard Linux only headers.
>  - Add qemu/statfs.h header to abstract over the which
>    headers are needed for struct statfs
>  - Define `ENOATTR` only if not only defined
>    (it's defined in system headers on Darwin).
>=20
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Fix headers for Alpine
>              - Integrate statfs.h back into file-op-9p.h]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  fsdev/file-op-9p.h   | 15 ++++++++++++++-
>  hw/9pfs/9p-local.c   |  2 ++
>  hw/9pfs/9p.c         |  4 ++++
>  include/qemu/xattr.h |  4 +++-

fsdev/virtfs-proxy-helper.c would need similar fixing in theory
but patch 10 disables the build for non-linux. Maybe just mention
it in the changelog so that people know this is deliberate.

Apart from that, LGTM.

>  4 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index 8fd89f0447..616c6f503f 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -16,10 +16,23 @@
> =20
>  #include <dirent.h>
>  #include <utime.h>
> -#include <sys/vfs.h>
>  #include "qemu-fsdev-throttle.h"
>  #include "p9array.h"
> =20
> +#ifndef QEMU_STATFS_H
> +#define QEMU_STATFS_H
> +

Include guards from the old header file don't make sense
anymore here. You should drop them.

> +#ifdef CONFIG_LINUX
> +# include <sys/vfs.h>
> +#endif
> +#ifdef CONFIG_DARWIN
> +# include <sys/param.h>
> +# include <sys/mount.h>
> +#endif
> +
> +#endif
> +
> +
>  #define SM_LOCAL_MODE_BITS    0600
>  #define SM_LOCAL_DIR_MODE_BITS    0700
> =20
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
> =20
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
> =20
>  int open_fd_hw;
>  int total_open_fd;
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
> =20


