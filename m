Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7062D595
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovafZ-0001Ky-FX; Thu, 17 Nov 2022 03:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovafO-0001IG-3m
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:54:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovafL-0007Rp-Bu
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668675273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=535f4ELHsrUpM7xjQCT3Gl+XJ9xDjs7whDbTSmkhrV0=;
 b=FSpoyjWSejvieOIZG5QdvP5LNnUGZfLWc2kpKXYngLILnBichtSI0CMwozceq8PYb9ZKz1
 lnGu6qpl1Qfzj30+nhKwr4BO5BoePywTZybtiGDSJ4Xuxfv0AuFnZUbhh62hosAQ2sEj+q
 6AUts19k2QcBapYs8wZIPz7CS4+t1fI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-zXNZSxgrNPi0MMU_BNyKEQ-1; Thu, 17 Nov 2022 03:54:31 -0500
X-MC-Unique: zXNZSxgrNPi0MMU_BNyKEQ-1
Received: by mail-io1-f69.google.com with SMTP id
 j17-20020a5d93d1000000b006bcdc6b49cbso586326ioo.22
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=535f4ELHsrUpM7xjQCT3Gl+XJ9xDjs7whDbTSmkhrV0=;
 b=XETO6QVwMzv1FFuGyKXrET84K27uWN+2WbdZ9Z3Ei720zwEo0HLQMXIZvjejf/oQ/T
 yvF8JwCLrgXyKweIJoivZ4tOnu4bTGAq+V0IMLhlDnaONp+SXKTn1bkPHsGcFumzDI9q
 znFO2X4wbYnJRacnMFF8xHSy8DpVOzDiest3C6klmeebz2NrVaDn9/FiN4D1vmSV8qPW
 Ib7qLFsaw4Y7SQJ0lYuc+GUFnnqZ0NMVymXpxhg8SsC54EosA8XGZEVuVenT3HNkfqdk
 wb55aix2T2k+5e14YrCQ4ErOqg7dvFbgM8KwMJLxh0BGAY0jRbpNOhb5X94F+W5rH21L
 9Bow==
X-Gm-Message-State: ANoB5plcMIIQmMtfgAOi5wX/gZohs6Qz4ouyGgqttP7FcMsKJVif0AUp
 mQimor0QoczAStytoelRaQta0WpfrTkTfa3GxwghsbPjdVAG0Xi4c9wycMySiiPbWrYiI5J3o6+
 gNBWzjIOb75ropaq+I+f0HODOUwidlG0=
X-Received: by 2002:a92:870f:0:b0:302:501a:a25d with SMTP id
 m15-20020a92870f000000b00302501aa25dmr757903ild.311.1668675270986; 
 Thu, 17 Nov 2022 00:54:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf79iGZ1g+Xa6Lx369MrPffdLkXhoekvE64xae7AleeOfBm8GG3xP6ElPMn+OzSX5QAzxLVyrmnSxYrcRPRSll4=
X-Received: by 2002:a92:870f:0:b0:302:501a:a25d with SMTP id
 m15-20020a92870f000000b00302501aa25dmr757900ild.311.1668675270762; Thu, 17
 Nov 2022 00:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20221115184600.747961-1-alexander.ivanov@virtuozzo.com>
 <20221115184600.747961-2-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221115184600.747961-2-alexander.ivanov@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 17 Nov 2022 10:54:19 +0200
Message-ID: <CAPMcbCrrzK97JTnrXtK_Y+CN4uEH47j+YhK0e4mOfwUK1_YGDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] qga: Move FS TRIM code to commands-linux.c
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 marcandre.lureau@gmail.com
Content-Type: multipart/alternative; boundary="000000000000c278ab05eda6bc54"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000c278ab05eda6bc54
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Tue, Nov 15, 2022 at 8:46 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> In the next patch ZFS TRIM support for FreeBSD will be added. Move
> Linux-specific TRIM code to commands-linux.c file.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-linux.c | 73 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-posix.c | 72 -------------------------------------------
>  2 files changed, 73 insertions(+), 72 deletions(-)
>
> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
> index 214e408fcd..fb01114153 100644
> --- a/qga/commands-linux.c
> +++ b/qga/commands-linux.c
> @@ -13,6 +13,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qga-qapi-commands.h"
>  #include "commands-common.h"
>  #include "cutils.h"
>  #include <mntent.h>
> @@ -284,3 +285,75 @@ int qmp_guest_fsfreeze_do_thaw(Error **errp)
>      return i;
>  }
>  #endif /* CONFIG_FSFREEZE */
> +
> +#if defined(CONFIG_FSTRIM)
> +/*
> + * Walk list of mounted file systems in the guest, and trim them.
> + */
> +GuestFilesystemTrimResponse *
> +qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
> +{
> +    GuestFilesystemTrimResponse *response;
> +    GuestFilesystemTrimResult *result;
> +    int ret = 0;
> +    FsMountList mounts;
> +    struct FsMount *mount;
> +    int fd;
> +    struct fstrim_range r;
> +
> +    slog("guest-fstrim called");
> +
> +    QTAILQ_INIT(&mounts);
> +    if (!build_fs_mount_list(&mounts, errp)) {
> +        return NULL;
> +    }
> +
> +    response = g_malloc0(sizeof(*response));
> +
> +    QTAILQ_FOREACH(mount, &mounts, next) {
> +        result = g_malloc0(sizeof(*result));
> +        result->path = g_strdup(mount->dirname);
> +
> +        QAPI_LIST_PREPEND(response->paths, result);
> +
> +        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> +        if (fd == -1) {
> +            result->error = g_strdup_printf("failed to open: %s",
> +                                            strerror(errno));
> +            result->has_error = true;
> +            continue;
> +        }
> +
> +        /* We try to cull filesystems we know won't work in advance, but
> other
> +         * filesystems may not implement fstrim for less obvious reasons.
> +         * These will report EOPNOTSUPP; while in some other cases ENOTTY
> +         * will be reported (e.g. CD-ROMs).
> +         * Any other error means an unexpected error.
> +         */
> +        r.start = 0;
> +        r.len = -1;
> +        r.minlen = has_minimum ? minimum : 0;
> +        ret = ioctl(fd, FITRIM, &r);
> +        if (ret == -1) {
> +            result->has_error = true;
> +            if (errno == ENOTTY || errno == EOPNOTSUPP) {
> +                result->error = g_strdup("trim not supported");
> +            } else {
> +                result->error = g_strdup_printf("failed to trim: %s",
> +                                                strerror(errno));
> +            }
> +            close(fd);
> +            continue;
> +        }
> +
> +        result->has_minimum = true;
> +        result->minimum = r.minlen;
> +        result->has_trimmed = true;
> +        result->trimmed = r.len;
> +        close(fd);
> +    }
> +
> +    free_fs_mount_list(&mounts);
> +    return response;
> +}
> +#endif /* CONFIG_FSTRIM */
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 32493d6383..b2a6d8b227 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1607,78 +1607,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error
> **errp)
>  }
>  #endif /* CONFIG_FSFREEZE */
>
> -#if defined(CONFIG_FSTRIM)
> -/*
> - * Walk list of mounted file systems in the guest, and trim them.
> - */
> -GuestFilesystemTrimResponse *
> -qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
> -{
> -    GuestFilesystemTrimResponse *response;
> -    GuestFilesystemTrimResult *result;
> -    int ret = 0;
> -    FsMountList mounts;
> -    struct FsMount *mount;
> -    int fd;
> -    struct fstrim_range r;
> -
> -    slog("guest-fstrim called");
> -
> -    QTAILQ_INIT(&mounts);
> -    if (!build_fs_mount_list(&mounts, errp)) {
> -        return NULL;
> -    }
> -
> -    response = g_malloc0(sizeof(*response));
> -
> -    QTAILQ_FOREACH(mount, &mounts, next) {
> -        result = g_malloc0(sizeof(*result));
> -        result->path = g_strdup(mount->dirname);
> -
> -        QAPI_LIST_PREPEND(response->paths, result);
> -
> -        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> -        if (fd == -1) {
> -            result->error = g_strdup_printf("failed to open: %s",
> -                                            strerror(errno));
> -            result->has_error = true;
> -            continue;
> -        }
> -
> -        /* We try to cull filesystems we know won't work in advance, but
> other
> -         * filesystems may not implement fstrim for less obvious reasons.
> -         * These will report EOPNOTSUPP; while in some other cases ENOTTY
> -         * will be reported (e.g. CD-ROMs).
> -         * Any other error means an unexpected error.
> -         */
> -        r.start = 0;
> -        r.len = -1;
> -        r.minlen = has_minimum ? minimum : 0;
> -        ret = ioctl(fd, FITRIM, &r);
> -        if (ret == -1) {
> -            result->has_error = true;
> -            if (errno == ENOTTY || errno == EOPNOTSUPP) {
> -                result->error = g_strdup("trim not supported");
> -            } else {
> -                result->error = g_strdup_printf("failed to trim: %s",
> -                                                strerror(errno));
> -            }
> -            close(fd);
> -            continue;
> -        }
> -
> -        result->has_minimum = true;
> -        result->minimum = r.minlen;
> -        result->has_trimmed = true;
> -        result->trimmed = r.len;
> -        close(fd);
> -    }
> -
> -    free_fs_mount_list(&mounts);
> -    return response;
> -}
> -#endif /* CONFIG_FSTRIM */
> -
>
>  #define LINUX_SYS_STATE_FILE "/sys/power/state"
>  #define SUSPEND_SUPPORTED 0
> --
> 2.34.1
>
>

--000000000000c278ab05eda6bc54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 1=
5, 2022 at 8:46 PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@=
virtuozzo.com">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">In the next patch ZFS TRIM sup=
port for FreeBSD will be added. Move<br>
Linux-specific TRIM code to commands-linux.c file.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-linux.c | 73 +++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/commands-posix.c | 72 -------------------------------------------=
<br>
=C2=A02 files changed, 73 insertions(+), 72 deletions(-)<br>
<br>
diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
index 214e408fcd..fb01114153 100644<br>
--- a/qga/commands-linux.c<br>
+++ b/qga/commands-linux.c<br>
@@ -13,6 +13,7 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
+#include &quot;qga-qapi-commands.h&quot;<br>
=C2=A0#include &quot;commands-common.h&quot;<br>
=C2=A0#include &quot;cutils.h&quot;<br>
=C2=A0#include &lt;mntent.h&gt;<br>
@@ -284,3 +285,75 @@ int qmp_guest_fsfreeze_do_thaw(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return i;<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
+<br>
+#if defined(CONFIG_FSTRIM)<br>
+/*<br>
+ * Walk list of mounted file systems in the guest, and trim them.<br>
+ */<br>
+GuestFilesystemTrimResponse *<br>
+qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestFilesystemTrimResponse *response;<br>
+=C2=A0 =C2=A0 GuestFilesystemTrimResult *result;<br>
+=C2=A0 =C2=A0 int ret =3D 0;<br>
+=C2=A0 =C2=A0 FsMountList mounts;<br>
+=C2=A0 =C2=A0 struct FsMount *mount;<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 struct fstrim_range r;<br>
+<br>
+=C2=A0 =C2=A0 slog(&quot;guest-fstrim called&quot;);<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
+=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 response =3D g_malloc0(sizeof(*response));<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D g_malloc0(sizeof(*result));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;path =3D g_strdup(mount-&gt;dirname=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(response-&gt;paths, result);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strdup_pr=
intf(&quot;failed to open: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We try to cull filesystems we know won&#39;=
t work in advance, but other<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implement fstrim f=
or less obvious reasons.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* These will report EOPNOTSUPP; while in=
 some other cases ENOTTY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will be reported (e.g. CD-ROMs).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Any other error means an unexpected er=
ror.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.start =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.len =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.minlen =3D has_minimum ? minimum : 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FITRIM, &amp;r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOTTY || errno=
 =3D=3D EOPNOTSUPP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup(&quot;trim not supported&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup_printf(&quot;failed to trim: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_minimum =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;minimum =3D r.minlen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_trimmed =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;trimmed =3D r.len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
+=C2=A0 =C2=A0 return response;<br>
+}<br>
+#endif /* CONFIG_FSTRIM */<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 32493d6383..b2a6d8b227 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -1607,78 +1607,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error =
**errp)<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
<br>
-#if defined(CONFIG_FSTRIM)<br>
-/*<br>
- * Walk list of mounted file systems in the guest, and trim them.<br>
- */<br>
-GuestFilesystemTrimResponse *<br>
-qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestFilesystemTrimResponse *response;<br>
-=C2=A0 =C2=A0 GuestFilesystemTrimResult *result;<br>
-=C2=A0 =C2=A0 int ret =3D 0;<br>
-=C2=A0 =C2=A0 FsMountList mounts;<br>
-=C2=A0 =C2=A0 struct FsMount *mount;<br>
-=C2=A0 =C2=A0 int fd;<br>
-=C2=A0 =C2=A0 struct fstrim_range r;<br>
-<br>
-=C2=A0 =C2=A0 slog(&quot;guest-fstrim called&quot;);<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
-=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, errp)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 response =3D g_malloc0(sizeof(*response));<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D g_malloc0(sizeof(*result));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;path =3D g_strdup(mount-&gt;dirname=
);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(response-&gt;paths, result);=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strdup_pr=
intf(&quot;failed to open: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We try to cull filesystems we know won&#39;=
t work in advance, but other<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implement fstrim f=
or less obvious reasons.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* These will report EOPNOTSUPP; while in=
 some other cases ENOTTY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will be reported (e.g. CD-ROMs).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Any other error means an unexpected er=
ror.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.start =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.len =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.minlen =3D has_minimum ? minimum : 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FITRIM, &amp;r);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOTTY || errno=
 =3D=3D EOPNOTSUPP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup(&quot;trim not supported&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup_printf(&quot;failed to trim: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_minimum =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;minimum =3D r.minlen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_trimmed =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;trimmed =3D r.len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
-=C2=A0 =C2=A0 return response;<br>
-}<br>
-#endif /* CONFIG_FSTRIM */<br>
-<br>
<br>
=C2=A0#define LINUX_SYS_STATE_FILE &quot;/sys/power/state&quot;<br>
=C2=A0#define SUSPEND_SUPPORTED 0<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000c278ab05eda6bc54--


