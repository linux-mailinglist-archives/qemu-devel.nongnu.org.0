Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B20454BF1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:27:16 +0100 (CET)
Received: from localhost ([::1]:49822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOiI-0003D0-Pz
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:27:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOfF-0007RI-LZ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:24:05 -0500
Received: from [2607:f8b0:4864:20::a33] (port=39582
 helo=mail-vk1-xa33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOfD-0007Rc-4U
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:24:05 -0500
Received: by mail-vk1-xa33.google.com with SMTP id 84so2102307vkc.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8ROAbyxBQ7HhFlJ3EVCuw5TdKYaoqOln6a2ZTjiKTI=;
 b=CD9XkgHBp/FAJqRSG+eI6FghvbrtnaOETuhAy9FiRIJ4DVDhBJXsZsJwrFSsIuqy45
 8Is5M4xfub8QJOKmGaCKjN4v15QxIxOfhH6+uXYFZxEuLOB3AVN/ZYpiLahGx+kb+ozA
 7orrREfMddK7iopZyDQi4oQtBuYdUbEapiN6vbXvJgq4lgXWCgIJjSKcBYpMWidOxAJ7
 ZN4nw8o54qQu4uBr5QqxPbkdYsZsGu0ukJHAJaHSd073e0fP5iaRF50vMDJCyjYuVFIE
 cnjf13nxgx2xaxlt9zY7+AtUVb/NATDe8f2YBpz0jpjIc/+V4q0gEcP7GwKvv15d3bmY
 FGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8ROAbyxBQ7HhFlJ3EVCuw5TdKYaoqOln6a2ZTjiKTI=;
 b=u0TCSxeuj+baHcVpoE09VPw59u7WIkuGCoJhtG5hyjSFFBXRevNq+vnU9MzNuqGz7m
 w5NggHtK+dtmHy7SwJzCN03Ags5opuxokMXWBggESqxX1JxWr4QVHoKIYR4TR62pUe3v
 +1GNhcqXhSMwR3zIrFUkcM3Y+B6KX4t+r6BXddFMf7UirR4nQT2NY/Y426A5Pqn2+BXf
 o2+2+pIhgTkLk4c5DRGqrjpfQyL4Autk2xlQ6jOUxEWG/mFLIRNu4YXloWtRsesQ3HnP
 jpDAEVsQ9qp2fQy+PtIbqfjywmaKwX57GxmY7SakCx/B8UvfiKDh7gCzj0l17IzFt44y
 Wv6Q==
X-Gm-Message-State: AOAM530X6oE6ZZiyDPUQaCiJppTF3+m0c50xMLR1kb2TXpF/eGryiKhh
 7un2zN84/STftfUlnLOWfOKxQgs6J1BzAXMuSR0xfA==
X-Google-Smtp-Source: ABdhPJylzyBOcSpfQSGsMDGkFWDAt64B/zI0BAMJqD8I5+p+S/TtHSO2VxhO+1Rfmm/xbvAHnL/3Jwj7S+lZm04RLVA=
X-Received: by 2002:a05:6122:114c:: with SMTP id
 p12mr91255505vko.21.1637169842092; 
 Wed, 17 Nov 2021 09:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-15-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-15-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:23:52 -0700
Message-ID: <CANCZdfrprQmrSg-n+SRihVJXs=n8PR1PYtZRSr21Joc7f8S=6g@mail.gmail.com>
Subject: Re: [PATCH v5 14/17] common-user: Move safe-syscall.* from linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e019c305d0ff4e71"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a33;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e019c305d0ff4e71
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Move linux-user/safe-syscall.S to common-user so that bsd-user
> can also use it.  Also move safe-syscall.h to include/user/.
> Since there is nothing here that is related to the guest, as
> opposed to the host, build it once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  {linux-user => include/user}/safe-syscall.h | 0
>  linux-user/signal.c                         | 2 +-
>  linux-user/syscall.c                        | 2 +-
>  common-user/meson.build                     | 2 ++
>  {linux-user => common-user}/safe-syscall.S  | 0
>  linux-user/meson.build                      | 1 -
>  6 files changed, 4 insertions(+), 3 deletions(-)
>  rename {linux-user => include/user}/safe-syscall.h (100%)
>  rename {linux-user => common-user}/safe-syscall.S (100%)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/safe-syscall.h b/include/user/safe-syscall.h
> similarity index 100%
> rename from linux-user/safe-syscall.h
> rename to include/user/safe-syscall.h
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 12b1705287..510db73c34 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -31,7 +31,7 @@
>  #include "trace.h"
>  #include "signal-common.h"
>  #include "host-signal.h"
> -#include "safe-syscall.h"
> +#include "user/safe-syscall.h"
>
>  static struct target_sigaction sigact_table[TARGET_NSIG];
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 33d342157d..53deb887ca 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -132,7 +132,7 @@
>  #include "signal-common.h"
>  #include "loader.h"
>  #include "user-mmap.h"
> -#include "safe-syscall.h"
> +#include "user/safe-syscall.h"
>  #include "qemu/guest-random.h"
>  #include "qemu/selfmap.h"
>  #include "user/syscall-trace.h"
> diff --git a/common-user/meson.build b/common-user/meson.build
> index 4f5c0f2f88..c02b5d9cc2 100644
> --- a/common-user/meson.build
> +++ b/common-user/meson.build
> @@ -1 +1,3 @@
>  common_user_inc += include_directories('host/' / config_host['ARCH'])
> +
> +common_user_ss.add(files('safe-syscall.S'))
> diff --git a/linux-user/safe-syscall.S b/common-user/safe-syscall.S
> similarity index 100%
> rename from linux-user/safe-syscall.S
> rename to common-user/safe-syscall.S
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index d6fa4f4d74..bf9d945504 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -12,7 +12,6 @@ linux_user_ss.add(files(
>    'linuxload.c',
>    'main.c',
>    'mmap.c',
> -  'safe-syscall.S',
>    'signal.c',
>    'strace.c',
>    'syscall.c',
> --
> 2.25.1
>
>

--000000000000e019c305d0ff4e71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Move linux-user/safe-syscall.S to common-user so that bsd=
-user<br>
can also use it.=C2=A0 Also move safe-syscall.h to include/user/.<br>
Since there is nothing here that is related to the guest, as<br>
opposed to the host, build it once.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0{linux-user =3D&gt; include/user}/safe-syscall.h | 0<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0common-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0{linux-user =3D&gt; common-user}/safe-syscall.S=C2=A0 | 0<br>
=C2=A0linux-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A06 files changed, 4 insertions(+), 3 deletions(-)<br>
=C2=A0rename {linux-user =3D&gt; include/user}/safe-syscall.h (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/safe-syscall.S (100%)<br></bl=
ockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto=
:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/safe-syscall.h b/include/user/safe-syscall.h<br>
similarity index 100%<br>
rename from linux-user/safe-syscall.h<br>
rename to include/user/safe-syscall.h<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index 12b1705287..510db73c34 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -31,7 +31,7 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;signal-common.h&quot;<br>
=C2=A0#include &quot;host-signal.h&quot;<br>
-#include &quot;safe-syscall.h&quot;<br>
+#include &quot;user/safe-syscall.h&quot;<br>
<br>
=C2=A0static struct target_sigaction sigact_table[TARGET_NSIG];<br>
<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index 33d342157d..53deb887ca 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -132,7 +132,7 @@<br>
=C2=A0#include &quot;signal-common.h&quot;<br>
=C2=A0#include &quot;loader.h&quot;<br>
=C2=A0#include &quot;user-mmap.h&quot;<br>
-#include &quot;safe-syscall.h&quot;<br>
+#include &quot;user/safe-syscall.h&quot;<br>
=C2=A0#include &quot;qemu/guest-random.h&quot;<br>
=C2=A0#include &quot;qemu/selfmap.h&quot;<br>
=C2=A0#include &quot;user/syscall-trace.h&quot;<br>
diff --git a/common-user/meson.build b/common-user/meson.build<br>
index 4f5c0f2f88..c02b5d9cc2 100644<br>
--- a/common-user/meson.build<br>
+++ b/common-user/meson.build<br>
@@ -1 +1,3 @@<br>
=C2=A0common_user_inc +=3D include_directories(&#39;host/&#39; / config_hos=
t[&#39;ARCH&#39;])<br>
+<br>
+common_user_ss.add(files(&#39;safe-syscall.S&#39;))<br>
diff --git a/linux-user/safe-syscall.S b/common-user/safe-syscall.S<br>
similarity index 100%<br>
rename from linux-user/safe-syscall.S<br>
rename to common-user/safe-syscall.S<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index d6fa4f4d74..bf9d945504 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -12,7 +12,6 @@ linux_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;linuxload.c&#39;,<br>
=C2=A0 =C2=A0&#39;main.c&#39;,<br>
=C2=A0 =C2=A0&#39;mmap.c&#39;,<br>
-=C2=A0 &#39;safe-syscall.S&#39;,<br>
=C2=A0 =C2=A0&#39;signal.c&#39;,<br>
=C2=A0 =C2=A0&#39;strace.c&#39;,<br>
=C2=A0 =C2=A0&#39;syscall.c&#39;,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e019c305d0ff4e71--

