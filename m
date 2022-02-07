Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE74AB775
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:21:09 +0100 (CET)
Received: from localhost ([::1]:47442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0Cq-00024X-BM
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nGz0K-0001By-OM
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:04:11 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:52162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nGz0H-0003kk-42
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:04:08 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-RviwJBVtOiS-vS7EYOFuZg-1; Mon, 07 Feb 2022 03:03:24 -0500
X-MC-Unique: RviwJBVtOiS-vS7EYOFuZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 378F11923E21;
 Mon,  7 Feb 2022 08:03:23 +0000 (UTC)
Received: from bahia (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CD21105C730;
 Mon,  7 Feb 2022 08:03:13 +0000 (UTC)
Date: Mon, 7 Feb 2022 09:03:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v4 01/11] 9p: linux: Fix a couple Linux assumptions
Message-ID: <20220207090312.7a2ed4b3@bahia>
In-Reply-To: <20220206200719.74464-2-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-2-wwcohen@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun,  6 Feb 2022 15:07:09 -0500
Will Cohen <wwcohen@gmail.com> wrote:

> From: Keno Fischer <keno@juliacomputing.com>
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
>=20
> While it might at first appear that fsdev/virtfs-proxy-header.c would
> need similar adjustment for darwin as file-op-9p here, a later patch in
> this series disables virtfs-proxy-helper for non-Linux. Allowing
> virtfs-proxy-helper on darwin could potentially be an additional
> optimization later.
>=20
> [Will Cohen: - Fix headers for Alpine
>              - Integrate statfs.h back into file-op-9p.h
>              - Remove superfluous header guards from file-opt-9p
>              - Add note about virtfs-proxy-helper being disabled
>                on non-Linux for this patch series]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  fsdev/file-op-9p.h   | 9 ++++++++-
>  hw/9pfs/9p-local.c   | 2 ++
>  hw/9pfs/9p.c         | 4 ++++
>  include/qemu/xattr.h | 4 +++-
>  4 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index 8fd89f0447..4997677460 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -16,10 +16,17 @@
> =20
>  #include <dirent.h>
>  #include <utime.h>
> -#include <sys/vfs.h>
>  #include "qemu-fsdev-throttle.h"
>  #include "p9array.h"
> =20
> +#ifdef CONFIG_LINUX
> +# include <sys/vfs.h>
> +#endif
> +#ifdef CONFIG_DARWIN
> +# include <sys/param.h>
> +# include <sys/mount.h>
> +#endif
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


