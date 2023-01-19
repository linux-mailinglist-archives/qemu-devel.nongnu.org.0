Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE9673420
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIQK9-0004V4-Mh; Thu, 19 Jan 2023 03:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pIQK2-0004RO-A2
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:30:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pIQJz-0004xu-T9
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674117054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mnut1KI1Pbcw27ZibYrCBpXb5oxWfE6tmEhNho2BAX4=;
 b=h+ygCOfphgRbj6nHztzyWV0tL+BmII5BYqEynKZCWMtX05dJxCIXG6PgArIBRWUA9Rgi5u
 Us4YJDZ+nhOLo7iFFHbDI9kGzsd8fRogOSp2f871X2et0mW3PQnHrlxIewgW6g6wb/DDyT
 iCuKyprPvWm44qwxQfeVaH58wYT0xZ4=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-SLmNkkg_PAmHzXbpT8wB3g-1; Thu, 19 Jan 2023 03:30:52 -0500
X-MC-Unique: SLmNkkg_PAmHzXbpT8wB3g-1
Received: by mail-ua1-f71.google.com with SMTP id
 p44-20020a9f382f000000b0060ae73237b3so384257uad.14
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 00:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mnut1KI1Pbcw27ZibYrCBpXb5oxWfE6tmEhNho2BAX4=;
 b=dBn2/OhNBPq10/0gkzzb4MZIcvawgkRIuItg5n+l3W4JEfZY8KBxbLr+4ZSIRI3D6c
 hQwQ5ib2Emenqonr0UtJ0XzaEDC3VnzpvczdsCRsw2rZ7lXCNXWGizdsxf1os6Zcj1Oh
 ky9K+ZU77Chdh1573BiMPqHZNs9w0CJjH1AdtTASLalZu8fu55LeFOHrrlkMEKQp6klz
 gxgUfYaPjjOevSGAAz7cGpuRg1WkyH7n1pkKYFPaP2s8ZQqCy3aArfthBFk6GPNc1zCZ
 mlhdPJRCXqAo6MEIZVt7L2g0yUuK8+Mg/yptYl9tu3/3IWgg2Yz0FtqB0WrB4Qok9FPz
 VYrA==
X-Gm-Message-State: AFqh2koqWqYS4/HIaQ7sHkGmZOyCrKx/OLMM+gin0igeS4gEblChnGXI
 DpL7n8kdU4Jbx016TUczUfvCdT9OY/smD/FnU0XThuIHcFcDlnB9uzWBq2iNjP0GnTVKMsNDnuF
 HBxISObszWI9uHKpFuUWEm5xEDpQXv00=
X-Received: by 2002:a05:6102:3648:b0:3d3:d87d:4392 with SMTP id
 s8-20020a056102364800b003d3d87d4392mr1469779vsu.66.1674117051750; 
 Thu, 19 Jan 2023 00:30:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsi+QvjEXricxqaUL2TL4b43ZsRd/7NXkA+nEA5Nd3dqGFdtSlHnkSTKUB6kySsYnFQtX7wcYIXzQMsK1zevCE=
X-Received: by 2002:a05:6102:3648:b0:3d3:d87d:4392 with SMTP id
 s8-20020a056102364800b003d3d87d4392mr1469753vsu.66.1674117051463; Thu, 19 Jan
 2023 00:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-10-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-10-armbru@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 19 Jan 2023 10:30:40 +0200
Message-ID: <CAPMcbCrrhBWDfkAzNbBPB2tDFZG7B4a4-kt6vuK7Ug7XK075tg@mail.gmail.com>
Subject: Re: [PATCH v4 09/19] qga: Clean up includes
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, 
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me, 
 jasowang@redhat.com, jonathan.cameron@huawei.com, 
 kbastian@mail.uni-paderborn.de, quintela@redhat.com, dgilbert@redhat.com, 
 michael.roth@amd.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002a5aa505f299c022"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000002a5aa505f299c022
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>



On Thu, Jan 19, 2023 at 9:00 AM Markus Armbruster <armbru@redhat.com> wrote:

> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
>
> This commit was created with scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/cutils.h         | 2 --
>  qga/commands-posix.c | 1 -
>  qga/cutils.c         | 3 ++-
>  3 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/qga/cutils.h b/qga/cutils.h
> index f0f30a7d28..c1f2f4b17a 100644
> --- a/qga/cutils.h
> +++ b/qga/cutils.h
> @@ -1,8 +1,6 @@
>  #ifndef CUTILS_H_
>  #define CUTILS_H_
>
> -#include "qemu/osdep.h"
> -
>  int qga_open_cloexec(const char *name, int flags, mode_t mode);
>
>  #endif /* CUTILS_H_ */
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index ebd33a643c..079689d79a 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -51,7 +51,6 @@
>  #else
>  #include <net/ethernet.h>
>  #endif
> -#include <sys/types.h>
>  #ifdef CONFIG_SOLARIS
>  #include <sys/sockio.h>
>  #endif
> diff --git a/qga/cutils.c b/qga/cutils.c
> index b8e142ef64..b21bcf3683 100644
> --- a/qga/cutils.c
> +++ b/qga/cutils.c
> @@ -2,8 +2,9 @@
>   * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
>   * See the COPYING file in the top-level directory.
>   */
> -#include "cutils.h"
>
> +#include "qemu/osdep.h"
> +#include "cutils.h"
>  #include "qapi/error.h"
>
>  /**
> --
> 2.39.0
>
>

--0000000000002a5aa505f299c022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><br></div></div></div><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 19, 2023 at 9:00 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Clea=
n up includes so that osdep.h is included first and headers<br>
which it implies are not included manually.<br>
<br>
This commit was created with scripts/clean-includes.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/cutils.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0qga/commands-posix.c | 1 -<br>
=C2=A0qga/cutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A03 files changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/qga/cutils.h b/qga/cutils.h<br>
index f0f30a7d28..c1f2f4b17a 100644<br>
--- a/qga/cutils.h<br>
+++ b/qga/cutils.h<br>
@@ -1,8 +1,6 @@<br>
=C2=A0#ifndef CUTILS_H_<br>
=C2=A0#define CUTILS_H_<br>
<br>
-#include &quot;qemu/osdep.h&quot;<br>
-<br>
=C2=A0int qga_open_cloexec(const char *name, int flags, mode_t mode);<br>
<br>
=C2=A0#endif /* CUTILS_H_ */<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index ebd33a643c..079689d79a 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -51,7 +51,6 @@<br>
=C2=A0#else<br>
=C2=A0#include &lt;net/ethernet.h&gt;<br>
=C2=A0#endif<br>
-#include &lt;sys/types.h&gt;<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
=C2=A0#include &lt;sys/sockio.h&gt;<br>
=C2=A0#endif<br>
diff --git a/qga/cutils.c b/qga/cutils.c<br>
index b8e142ef64..b21bcf3683 100644<br>
--- a/qga/cutils.c<br>
+++ b/qga/cutils.c<br>
@@ -2,8 +2,9 @@<br>
=C2=A0 * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
-#include &quot;cutils.h&quot;<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;cutils.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
<br>
=C2=A0/**<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div>

--0000000000002a5aa505f299c022--


