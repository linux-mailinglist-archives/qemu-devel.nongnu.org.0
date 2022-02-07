Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436EE4AB7E9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:43:05 +0100 (CET)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0Y4-0000FW-BX
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nGyt1-00065e-9m
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:35 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nGysv-0002JV-9o
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:31 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-VpWNT6QXO9WzAkz8iMyC9Q-1; Mon, 07 Feb 2022 02:56:11 -0500
X-MC-Unique: VpWNT6QXO9WzAkz8iMyC9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF0515720;
 Mon,  7 Feb 2022 07:56:10 +0000 (UTC)
Received: from bahia (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0D135E4B9;
 Mon,  7 Feb 2022 07:56:08 +0000 (UTC)
Date: Mon, 7 Feb 2022 08:56:07 +0100
From: Greg Kurz <groug@kaod.org>
To: Vitaly Chikunov <vt@altlinux.org>
Subject: Re: [PATCH v4] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220207085607.426beff2@bahia>
In-Reply-To: <20220206013419.849161-1-vt@altlinux.org>
References: <20220206013419.849161-1-vt@altlinux.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: "Dmitry V . Levin" <ldv@altlinux.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 04:34:19 +0300
Vitaly Chikunov <vt@altlinux.org> wrote:

> `struct dirent' returned from readdir(3) could be shorter (or longer)
> than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:
>=20
>  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64=
 + 0x497eed)
>  #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64 + 0x498=
2e9)
>  #2  0x0000555555eb7983 coroutine_trampoline (/usr/bin/qemu-system-x86_64=
 + 0x963983)
>  #3  0x00007ffff73e0be0 n/a (n/a + 0x0)
>=20
> While fixing, provide a helper for any future `struct dirent' cloning.
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> Cc: qemu-stable@nongnu.org
> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Dmitry V. Levin <ldv@altlinux.org>
> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> ---
> Tested on x68-64 Linux with btrfs-progs tests and slow qos-test.
> Changes since v3:
> - Update commentary on qemu_dirent_dup logic.
> - Use g_memdup as suggested by Greg Kurz.
>=20

The synth driver should really be made compliant with the
_DIRENT_HAVE_D_* macros at some point, but this patch fixes
a crash and the comment is clear enough to understand the
sz =3D=3D 0 weirdness so I won't object any further.

Acked-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/codir.c      |  3 +--
>  include/qemu/osdep.h | 13 +++++++++++++
>  util/osdep.c         | 21 +++++++++++++++++++++
>  3 files changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 032cce04c4..c0873bde16 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -143,8 +143,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState=
 *fidp,
>          } else {
>              e =3D e->next =3D g_malloc0(sizeof(V9fsDirEnt));
>          }
> -        e->dent =3D g_malloc0(sizeof(struct dirent));
> -        memcpy(e->dent, dent, sizeof(struct dirent));
> +        e->dent =3D qemu_dirent_dup(dent);
> =20
>          /* perform a full stat() for directory entry if requested by cal=
ler */
>          if (dostat) {
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index d1660d67fa..ce12f64853 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -805,6 +805,19 @@ static inline int platform_does_not_support_system(c=
onst char *command)
>  }
>  #endif /* !HAVE_SYSTEM_FUNCTION */
> =20
> +/**
> + * Duplicate directory entry @dent.
> + *
> + * It is highly recommended to use this function instead of open coding
> + * duplication of @c dirent objects, because the actual @c struct @c dir=
ent
> + * size may be bigger or shorter than @c sizeof(struct dirent) and corre=
ct
> + * handling is platform specific (see gitlab issue #841).
> + *
> + * @dent - original directory entry to be duplicated
> + * @returns duplicated directory entry which should be freed with g_free=
()
> + */
> +struct dirent *qemu_dirent_dup(struct dirent *dent);
> +
>  #ifdef __cplusplus
>  }
>  #endif
> diff --git a/util/osdep.c b/util/osdep.c
> index 42a0a4986a..67fbf22778 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -33,6 +33,7 @@
>  extern int madvise(char *, size_t, int);
>  #endif
> =20
> +#include <dirent.h>
>  #include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "qemu/sockets.h"
> @@ -615,3 +616,23 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
>      return readv_writev(fd, iov, iov_cnt, true);
>  }
>  #endif
> +
> +struct dirent *
> +qemu_dirent_dup(struct dirent *dent)
> +{
> +    size_t sz =3D 0;
> +#if defined _DIRENT_HAVE_D_RECLEN
> +    /* Avoid use of strlen() if platform supports d_reclen. */
> +    sz =3D dent->d_reclen;
> +#endif
> +    /*
> +     * Test sz for zero even if d_reclen is available
> +     * because some drivers may set d_reclen to zero.
> +     */
> +    if (sz =3D=3D 0) {
> +        /* Fallback to the most portable way. */
> +        sz =3D offsetof(struct dirent, d_name) +
> +                      strlen(dent->d_name) + 1;
> +    }
> +    return g_memdup(dent, sz);
> +}


