Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20FC530EA6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:25:41 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt780-0000pk-FM
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nt76F-000877-3l
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:23:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nt76C-0003Wh-4w
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653308627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJ4PiZdkh+UyXYHIsreTKHzoXoha8FBdOmXynjvO+j0=;
 b=Q8w6g57G2NUevA9XM9/k0GpA9pvaBBjcd++VQXSc2uzQXkNt8VuTWy6jmfmiHekT0EVhcw
 qJKaKAMgkYf5gp8ZqUTUdubCNX5WvS9UAaDRrnyB+xM30vhviVkPXyxWi/+56CujYLIHk6
 lo66BEec45dp4erIlKpSytFkg+VfIkI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-1QSfGJHENQGWD1txqSqksw-1; Mon, 23 May 2022 08:23:46 -0400
X-MC-Unique: 1QSfGJHENQGWD1txqSqksw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC75D3C92FC2;
 Mon, 23 May 2022 12:23:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9312D492C3B;
 Mon, 23 May 2022 12:23:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6CC9421E6906; Mon, 23 May 2022 14:23:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 01/15] include: move qemu_*_exec_dir() to cutils
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-2-marcandre.lureau@redhat.com>
Date: Mon, 23 May 2022 14:23:44 +0200
In-Reply-To: <20220513180821.905149-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 13 May 2022 20:08:07 +0200")
Message-ID: <87h75g8mjz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The function is required by get_relocated_path() (already in cutils),
> and used by qemu-ga and may be generally useful.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/cutils.h                |   7 ++
>  include/qemu/osdep.h                 |   8 --
>  qemu-io.c                            |   1 +
>  storage-daemon/qemu-storage-daemon.c |   1 +
>  tests/qtest/fuzz/fuzz.c              |   1 +
>  util/cutils.c                        | 108 +++++++++++++++++++++++++++
>  util/oslib-posix.c                   |  81 --------------------
>  util/oslib-win32.c                   |  36 ---------
>  8 files changed, 118 insertions(+), 125 deletions(-)
>
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 5c6572d444..40e10e19a7 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -193,6 +193,13 @@ int uleb128_decode_small(const uint8_t *in, uint32_t=
 *n);
>   */
>  int qemu_pstrcmp0(const char **str1, const char **str2);
>=20=20
> +/* Find program directory, and save it for later usage with
> + * qemu_get_exec_dir().
> + * Try OS specific API first, if not working, parse from argv0. */
> +void qemu_init_exec_dir(const char *argv0);
> +
> +/* Get the saved exec dir.  */
> +const char *qemu_get_exec_dir(void);
>=20=20
>  /**
>   * get_relocated_path:
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 1c1e7eca98..67cc465416 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -557,14 +557,6 @@ void qemu_set_cloexec(int fd);
>   */
>  char *qemu_get_local_state_dir(void);
>=20=20
> -/* Find program directory, and save it for later usage with
> - * qemu_get_exec_dir().
> - * Try OS specific API first, if not working, parse from argv0. */
> -void qemu_init_exec_dir(const char *argv0);
> -
> -/* Get the saved exec dir.  */
> -const char *qemu_get_exec_dir(void);
> -
>  /**
>   * qemu_getauxval:
>   * @type: the auxiliary vector key to lookup
> diff --git a/qemu-io.c b/qemu-io.c
> index d70d3dd4fd..2bd7bfb650 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -16,6 +16,7 @@
>  #endif
>=20=20
>  #include "qemu/help-texts.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "qemu-io.h"
>  #include "qemu/error-report.h"
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-s=
torage-daemon.c
> index 9b8b17f52e..c104817cdd 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -44,6 +44,7 @@
>=20=20
>  #include "qemu/help-texts.h"
>  #include "qemu-version.h"
> +#include "qemu/cutils.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
>  #include "qemu/help_option.h"
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index a7a5e14fa3..0ad4ba9e94 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -15,6 +15,7 @@
>=20=20
>  #include <wordexp.h>
>=20=20
> +#include "qemu/cutils.h"
>  #include "qemu/datadir.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
> diff --git a/util/cutils.c b/util/cutils.c
> index b2777210e7..6cc7cc8cde 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -931,6 +931,114 @@ static inline const char *next_component(const char=
 *dir, int *p_len)
>      return dir;
>  }
>=20=20
> +static const char *exec_dir;
> +
> +void qemu_init_exec_dir(const char *argv0)
> +{
> +#ifdef G_OS_WIN32
> +    char *p;
> +    char buf[MAX_PATH];
> +    DWORD len;
> +
> +    if (exec_dir) {
> +        return;
> +    }
> +
> +    len =3D GetModuleFileName(NULL, buf, sizeof(buf) - 1);
> +    if (len =3D=3D 0) {
> +        return;
> +    }
> +
> +    buf[len] =3D 0;
> +    p =3D buf + len - 1;
> +    while (p !=3D buf && *p !=3D '\\') {
> +        p--;
> +    }
> +    *p =3D 0;
> +    if (access(buf, R_OK) =3D=3D 0) {
> +        exec_dir =3D g_strdup(buf);
> +    } else {
> +        exec_dir =3D CONFIG_BINDIR;
> +    }
> +#else
> +    char *p =3D NULL;
> +    char buf[PATH_MAX];
> +
> +    if (exec_dir) {
> +        return;
> +    }
> +
> +#if defined(__linux__)
> +    {
> +        int len;
> +        len =3D readlink("/proc/self/exe", buf, sizeof(buf) - 1);
> +        if (len > 0) {
> +            buf[len] =3D 0;
> +            p =3D buf;
> +        }
> +    }
> +#elif defined(__FreeBSD__) \
> +      || (defined(__NetBSD__) && defined(KERN_PROC_PATHNAME))
> +    {
> +#if defined(__FreeBSD__)
> +        static int mib[4] =3D {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, =
-1};
> +#else
> +        static int mib[4] =3D {CTL_KERN, KERN_PROC_ARGS, -1, KERN_PROC_P=
ATHNAME};
> +#endif
> +        size_t len =3D sizeof(buf) - 1;
> +
> +        *buf =3D '\0';
> +        if (!sysctl(mib, ARRAY_SIZE(mib), buf, &len, NULL, 0) &&
> +            *buf) {
> +            buf[sizeof(buf) - 1] =3D '\0';
> +            p =3D buf;
> +        }
> +    }
> +#elif defined(__APPLE__)
> +    {
> +        char fpath[PATH_MAX];
> +        uint32_t len =3D sizeof(fpath);
> +        if (_NSGetExecutablePath(fpath, &len) =3D=3D 0) {
> +            p =3D realpath(fpath, buf);
> +            if (!p) {
> +                return;
> +            }
> +        }
> +    }
> +#elif defined(__HAIKU__)
> +    {
> +        image_info ii;
> +        int32_t c =3D 0;
> +
> +        *buf =3D '\0';
> +        while (get_next_image_info(0, &c, &ii) =3D=3D B_OK) {
> +            if (ii.type =3D=3D B_APP_IMAGE) {
> +                strncpy(buf, ii.name, sizeof(buf));
> +                buf[sizeof(buf) - 1] =3D 0;
> +                p =3D buf;
> +                break;
> +            }
> +        }
> +    }
> +#endif
> +    /* If we don't have any way of figuring out the actual executable
> +       location then try argv[0].  */
> +    if (!p && argv0) {
> +        p =3D realpath(argv0, buf);
> +    }
> +    if (p) {
> +        exec_dir =3D g_path_get_dirname(p);
> +    } else {
> +        exec_dir =3D CONFIG_BINDIR;
> +    }
> +#endif
> +}

Combines code moved from oslib-posix.c and oslib-win32.c with #if.
Sounds like a step backward, until you realize just how many #if there
already are.  Okay.

> +
> +const char *qemu_get_exec_dir(void)
> +{
> +    return exec_dir;
> +}
> +
>  char *get_relocated_path(const char *dir)
>  {
>      size_t prefix_len =3D strlen(CONFIG_PREFIX);

Keeping qemu_init_exec_dir() and qemu_get_exec_dir() next to
get_relocated_path() makes sense.  However, util/cutils.c is getting
rather long: almost 700 SLOC, and I feel the new code stretches its
"Simple C functions to supplement the C library" mandate.  Most of the
code there is string stuff.  Would you mind putting the file name stuff
into its own file?

Regardless,
Reviewed-by: Markus Armbruster <armbru@redhat.com>

[...]


