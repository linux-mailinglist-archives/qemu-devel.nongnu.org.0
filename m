Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B4A454B70
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:54:30 +0100 (CET)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOCb-0006UA-I1
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:54:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnO30-0001u0-2L
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:44:34 -0500
Received: from [2607:f8b0:4864:20::a31] (port=39887
 helo=mail-vk1-xa31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnO2x-0001LU-IP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:44:33 -0500
Received: by mail-vk1-xa31.google.com with SMTP id 84so2026722vkc.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4rKEUuYba1NpqiU1gw5bn1ADQse5rIJ4TjG4jKZ/a0=;
 b=z3AEFsezeHKKWFu9z55SdWtyyB7RiS699r683LuVrdDkU8Rig/cIfPtrbkg+OgT8Li
 E57TbKVWCP1PrzEP2Xhcn1qratQ8qLTP55T7lGRvGeo2Qs5Z4eLjla900NwR3bSyyb+O
 UMvK74rXouA9EpeKJerryk7jOUmYAslo8k9e/oltRhKKQaOB8mabwbno4y96y8Bq8SJm
 hDy2AgVYmeL3rC9frPUnKSG8iVhYqXfGd9dSElxyVCkA7EZapgokEVhXo0lB+/xxryqq
 hvcxWMzYdPcBIm52jqW5mJzJkdUMgJFyzcdyKp3jCMzG9GLRhxZ6VDnovbRQLtWZwuaS
 JxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4rKEUuYba1NpqiU1gw5bn1ADQse5rIJ4TjG4jKZ/a0=;
 b=tgR/h6GKxOHsJBgFZBi3rzTw9J2I6nBL4ynV9mIp5JVLNGxEU+xU7ArUjqDq+J/7KK
 f8gLkcBhPKEsLt5ZMPDubBVvKsarmPx5mwkqzPqYBwFtSk/prDRbHNV+XACtiKVfMrjM
 2A67ZEOdyLn+DK0rLHJtD633SE3dczczWX9opyBG4VNcqa/teHFNu/QnwFbWPbTh1w/a
 1ZHK+Q6y/+Ur44hsOmvi2Qz5L8SYxImPXuAA/OwD7WtehS0P4putla7aRxpjvvmo4YIq
 lNMol3310+7Y7Iry314//+foNW5Lg5jTu9fMv7/tFNAuRTpWWqR3wITzTfTG028gjKZR
 BOvQ==
X-Gm-Message-State: AOAM533Jkr4V8Fs/AZxQROvHvgnCioVCj7QX/dq/vTuB+B6w6CI1O+xB
 WXMELnOEI+Y/n+xcvBY83GQyys6AOFLYfPXupPmHug==
X-Google-Smtp-Source: ABdhPJwAXlD107x5V+X1EBeDlyyk+MENZ4zOA9pIQ/gVr4xvqdRFGZtNCE4PTFusFQoDO8HhXAeawAfxQDP+xIUaahg=
X-Received: by 2002:a1f:2591:: with SMTP id l139mr91614635vkl.5.1637167469581; 
 Wed, 17 Nov 2021 08:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-9-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-9-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:44:19 -0700
Message-ID: <CANCZdfr4zOC7eSW7tEBOjz_oHJfiPo41QSfjixuPfBLBwfnKxA@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] common-user: Adjust system call return on FreeBSD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000766c5d05d0fec16c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa31.google.com
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

--000000000000766c5d05d0fec16c
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> FreeBSD system calls return positive errno.  On the 4 hosts for
> which we have support, error is indicated by the C bit set or clear.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> [rth: Rebase on new safe_syscall_base api; add #error check.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-
>  common-user/host/arm/safe-syscall.inc.S     | 11 +++++++++++
>  common-user/host/i386/safe-syscall.inc.S    | 10 ++++++++++
>  common-user/host/x86_64/safe-syscall.inc.S  | 10 ++++++++++
>  4 files changed, 42 insertions(+), 1 deletion(-)
>

Reviewed by: Warner Losh <imp@bsdimp.com>


> diff --git a/common-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
> index 95c60d8609..d3f065cdef 100644
> --- a/common-user/host/aarch64/safe-syscall.inc.S
> +++ b/common-user/host/aarch64/safe-syscall.inc.S
> @@ -65,12 +65,22 @@ safe_syscall_start:
>  safe_syscall_end:
>
>         /* code path for having successfully executed the syscall */
> -       cmn     x0, #4095
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
> +       cmn     x0, #4096
> +       b.hi    0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
>         b.cs    1f
> +#else
> +#error "unsupported os"
> +#endif
>         ret
>
>         /* code path setting errno */
> +#ifdef __linux__
>  0:     neg     w0, w0                  /* create positive errno */
> +#endif
>  1:     str     w0, [x11]               /* store errno */
>         mov     x0, #-1
>         ret
> diff --git a/common-user/host/arm/safe-syscall.inc.S
> b/common-user/host/arm/safe-syscall.inc.S
> index 17839c6486..328299021d 100644
> --- a/common-user/host/arm/safe-syscall.inc.S
> +++ b/common-user/host/arm/safe-syscall.inc.S
> @@ -82,12 +82,23 @@ safe_syscall_start:
>  safe_syscall_end:
>
>         /* code path for having successfully executed the syscall */
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
>         cmp     r0, #-4096
>         bhi     0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
> +       bcs     1f
>

I believe this is OK. On FreeBSD, this will get the proper location for
errno and store
it there based on the current thread's local storage. Since the rest of the
code
extracts the errno directly, and we use that correctly w/o relying on errno
to
evaluate to the error associated with the last system call in this thread
in bsd-user,
I believe this adjustment is fine (also, a prior version seems to work,
this version
isn't yet in the github mirror, so I've not tried it).

This comment applies to all FreeBSD archs, except aarch64 which does a
similar thing,
but in a different way.

Warner

+#else
> +#error "unsupported os"
> +#endif
> +
>  9:     pop     { r4, r5, r6, r7, r8, r9, r10, pc }
>
>         /* code path setting errno */
> +#ifdef __linux__
>  0:     neg     r0, r0          /* create positive errno */
> +#endif
>  1:     str     r0, [r9]        /* store errno */
>         mov     r0, #-1
>         b       9b
> diff --git a/common-user/host/i386/safe-syscall.inc.S
> b/common-user/host/i386/safe-syscall.inc.S
> index ad89521783..c27207492a 100644
> --- a/common-user/host/i386/safe-syscall.inc.S
> +++ b/common-user/host/i386/safe-syscall.inc.S
> @@ -76,8 +76,16 @@ safe_syscall_start:
>  safe_syscall_end:
>
>         /* code path for having successfully executed the syscall */
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
>         cmp     $-4095, %eax
>         jae     0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
> +       jc      1f
> +#else
> +#error "unsupported os"
> +#endif
>
>  9:     pop     %ebx
>         .cfi_remember_state
> @@ -97,7 +105,9 @@ safe_syscall_end:
>         .cfi_restore_state
>
>         /* code path setting errno */
> +#ifdef __linux__
>  0:     neg     %eax                    /* create positive errno */
> +#endif
>  1:     mov     8+16(%esp), %ebx        /* load errno pointer */
>         mov     %eax, (%ebx)            /* store errno */
>         mov     $-1, %eax
> diff --git a/common-user/host/x86_64/safe-syscall.inc.S
> b/common-user/host/x86_64/safe-syscall.inc.S
> index 9a0c4c93b4..e3f920fa5c 100644
> --- a/common-user/host/x86_64/safe-syscall.inc.S
> +++ b/common-user/host/x86_64/safe-syscall.inc.S
> @@ -75,8 +75,16 @@ safe_syscall_start:
>  safe_syscall_end:
>
>          /* code path for having successfully executed the syscall */
> +#if defined(__linux__)
> +       /* Linux kernel returns (small) negative errno. */
>          cmp    $-4095, %rax
>          jae    0f
> +#elif defined(__FreeBSD__)
> +       /* FreeBSD kernel returns positive errno and C bit set. */
> +       jc      1f
> +#else
> +#error "unsupported os"
> +#endif
>
>  9:      pop     %rbp
>          .cfi_remember_state
> @@ -86,7 +94,9 @@ safe_syscall_end:
>          .cfi_restore_state
>
>          /* code path setting errno */
> +#ifdef __linux__
>  0:      neg    %eax                    /* create positive errno */
> +#endif
>  1:      mov    %eax, (%rbp)            /* store errno */
>          mov    $-1, %rax
>          jmp    9b
> --
> 2.25.1
>
>

--000000000000766c5d05d0fec16c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" t=
arget=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
FreeBSD system calls return positive errno.=C2=A0 On the 4 hosts for<br>
which we have support, error is indicated by the C bit set or clear.<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
[rth: Rebase on new safe_syscall_base api; add #error check.]<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-<br>
=C2=A0common-user/host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0| 11 +++++=
++++++<br>
=C2=A0common-user/host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 | 10 ++++++++++=
<br>
=C2=A0common-user/host/x86_64/safe-syscall.inc.S=C2=A0 | 10 ++++++++++<br>
=C2=A04 files changed, 42 insertions(+), 1 deletion(-)<br></blockquote><div=
><br></div><div>Reviewed by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host=
/aarch64/safe-syscall.inc.S<br>
index 95c60d8609..d3f065cdef 100644<br>
--- a/common-user/host/aarch64/safe-syscall.inc.S<br>
+++ b/common-user/host/aarch64/safe-syscall.inc.S<br>
@@ -65,12 +65,22 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path for having successfully executed t=
he syscall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmn=C2=A0 =C2=A0 =C2=A0x0, #4095<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmn=C2=A0 =C2=A0 =C2=A0x0, #4096<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b.hi=C2=A0 =C2=A0 0f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b.cs=C2=A0 =C2=A0 1f<br>
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0neg=C2=A0 =C2=A0 =C2=A0w0, w0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno */<b=
r>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0w0, [x11]=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0x0, #-1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm=
/safe-syscall.inc.S<br>
index 17839c6486..328299021d 100644<br>
--- a/common-user/host/arm/safe-syscall.inc.S<br>
+++ b/common-user/host/arm/safe-syscall.inc.S<br>
@@ -82,12 +82,23 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path for having successfully executed t=
he syscall */<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0r0, #-4096<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bhi=C2=A0 =C2=A0 =C2=A00f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bcs=C2=A0 =C2=A0 =C2=A01f<br></blockquote><div>=
<br></div><div>I believe this is OK. On FreeBSD, this will get the proper l=
ocation for errno and store</div><div>it there based on the current thread&=
#39;s local storage. Since the rest of the code</div><div>extracts the errn=
o directly, and we use that correctly w/o relying on errno to</div><div>eva=
luate to the error associated with the last system call in this thread in b=
sd-user,</div><div>I believe this adjustment is fine (also, a prior version=
 seems to work, this version</div><div>isn&#39;t yet in the github mirror, =
so I&#39;ve not tried it).</div><div><br></div><div>This comment applies to=
 all FreeBSD archs, except aarch64 which does a similar thing,</div><div>bu=
t in a different way.</div><div><br></div><div>Warner</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
+<br>
=C2=A09:=C2=A0 =C2=A0 =C2=A0pop=C2=A0 =C2=A0 =C2=A0{ r4, r5, r6, r7, r8, r9=
, r10, pc }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0neg=C2=A0 =C2=A0 =C2=A0r0, r0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* create positive errno */<br>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0r0, [r9]=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0r0, #-1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A09b<br>
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i3=
86/safe-syscall.inc.S<br>
index ad89521783..c27207492a 100644<br>
--- a/common-user/host/i386/safe-syscall.inc.S<br>
+++ b/common-user/host/i386/safe-syscall.inc.S<br>
@@ -76,8 +76,16 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path for having successfully executed t=
he syscall */<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0$-4095, %eax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 jae=C2=A0 =C2=A0 =C2=A00f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jc=C2=A0 =C2=A0 =C2=A0 1f<br>
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
<br>
=C2=A09:=C2=A0 =C2=A0 =C2=A0pop=C2=A0 =C2=A0 =C2=A0%ebx<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_remember_state<br>
@@ -97,7 +105,9 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore_state<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0neg=C2=A0 =C2=A0 =C2=A0%eax=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno =
*/<br>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A08+16(%esp), %ebx=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* load errno pointer */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0%eax, (%ebx)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$-1, %eax<br>
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/=
x86_64/safe-syscall.inc.S<br>
index 9a0c4c93b4..e3f920fa5c 100644<br>
--- a/common-user/host/x86_64/safe-syscall.inc.S<br>
+++ b/common-user/host/x86_64/safe-syscall.inc.S<br>
@@ -75,8 +75,16 @@ safe_syscall_start:<br>
=C2=A0safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully exec=
uted the syscall */<br>
+#if defined(__linux__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux kernel returns (small) negative errno.=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp=C2=A0 =C2=A0 $-4095, %rax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jae=C2=A0 =C2=A0 0f<br>
+#elif defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FreeBSD kernel returns positive errno and C =
bit set. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jc=C2=A0 =C2=A0 =C2=A0 1f<br>
+#else<br>
+#error &quot;unsupported os&quot;<br>
+#endif<br>
<br>
=C2=A09:=C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%rbp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_remember_state<br>
@@ -86,7 +94,9 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_restore_state<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path setting errno */<br>
+#ifdef __linux__<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 %eax=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno */<b=
r>
+#endif<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %eax, (%rbp)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* store errno */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 $-1, %rax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jmp=C2=A0 =C2=A0 9b<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000766c5d05d0fec16c--

