Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A424F3032BC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 05:36:27 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4G5a-0005mz-On
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 23:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l4G4d-0005MJ-4q
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 23:35:27 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:37185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l4G4a-0006Kr-JY
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 23:35:26 -0500
Received: by mail-qk1-x735.google.com with SMTP id n7so3555520qkc.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 20:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FnHFoIFBHbp7MQBIBTsTEkYbQRBiLaSJzmgvB8zK7G8=;
 b=0DpNis40P1CTifBo6tjHyMMv8a0T/HTBwc6tcQyStHw5ev7cZSTtpPwXIsDwuSpHnn
 +jtLi6gmTTUe0jQqJU/K7/7xA5Dxk5HQLkF1yrwWHvfxVaMz96UraPIw0xzs74a2Q+bx
 IyzTvONiS3tDD+Fds+Zg1J1O/yCnEo6h5gRplDA5q/lRFH8UWKzizrdU/6/0NsQJPZsd
 kK9pMptqAjbb6gc4vOgYfcaIhNOqh1D7flFndN/5JdVHtzLJm2epOsR8ybzG7zv6lGdS
 ewy/Mv71EK8tYGzdHZnVmyuOS/ur+Gj5y1Uj/+YvZDeUxy6cpV4S2ZlC3KNZY/saXT5E
 cFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FnHFoIFBHbp7MQBIBTsTEkYbQRBiLaSJzmgvB8zK7G8=;
 b=Dzn2icYxn38LOVeTzou3hxhRQzuHfAqIcZ5uafrN1W8rVdSRz7mUH+RjBbHDEKDG9L
 2TkOikawC0lHkWfDwVF/CZFZIhScSXEqS41URXIm8008XAXbquL8isOVGrj/CjCk2M7o
 669jNkY3o8u7vn6ZdcFDfgwUAvMMuepIKZSl5Yuvj/8EjqQT6gxnp54aFTn4u5cftTTH
 Nz14fEQl40MyzvyT2rNbtF/0+z5A1extcr+9c9TAkQXuTgVrK3anhGIxoP7AfUqfGSg3
 oyFxhL8MmTe55lcD6fOfYzUmtKMYnBGkYF/dWYpL6j7wdh4hzoULw4K7NksrjAGTRlUV
 pVHg==
X-Gm-Message-State: AOAM531aJUsOvaeki+xYP5OQoFSWMCkXA7kzlHMarVjd7nFx4mNEoLIJ
 HydUzcpCDEsMDsLmXBglrMLMwPGs42jEBgo9x9QyYw==
X-Google-Smtp-Source: ABdhPJyXuKYd//YotZG7DOkJK9D9h89+xfM9LCglIdBXeOSuGnShAeeX+lAJ1avHBOeDMcNcV5DPBEILftFuidLO4MY=
X-Received: by 2002:a37:83c2:: with SMTP id f185mr3979660qkd.206.1611635722166; 
 Mon, 25 Jan 2021 20:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-4-j@getutm.app>
In-Reply-To: <20210126012457.39046-4-j@getutm.app>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 25 Jan 2021 21:35:11 -0700
Message-ID: <CANCZdfqcbb5r_BmsqCN6uymBghbJg6nd1aAr1qfNryVQmfdOwQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] configure: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>
Content-Type: multipart/alternative; boundary="000000000000ba365a05b9c62e12"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ba365a05b9c62e12
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 25, 2021 at 6:33 PM Joelle van Dyne <j@getutm.app> wrote:

> Some BSD platforms do not have this header.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  meson.build        | 1 +
>  block.c            | 2 +-
>  block/file-posix.c | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 27110075df..6818d97df5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1117,6 +1117,7 @@ config_host_data.set('HAVE_PTY_H',
> cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
> +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>
>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>  arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST',
> 'CONFIG_BDRV_RO_WHITELIST']
> diff --git a/block.c b/block.c
> index 8b9d457546..c4cf391dea 100644
> --- a/block.c
> +++ b/block.c
> @@ -54,7 +54,7 @@
>  #ifdef CONFIG_BSD
>  #include <sys/ioctl.h>
>  #include <sys/queue.h>
> -#ifndef __DragonFly__
> +#if defined(HAVE_SYS_DISK_H)
>  #include <sys/disk.h>
>  #endif
>  #endif
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 11d2021346..666d3e7504 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2320,7 +2320,7 @@ again:
>          }
>          if (size == 0)
>  #endif
> -#if defined(__APPLE__) && defined(__MACH__)
> +#if defined(HAVE_SYS_DISK_H) && defined(__APPLE__) && defined(__MACH__)
>

Why is this needed? __DragonFly__ doesn't define either __APPLE__ or
__MACH__

Warner


>          {
>              uint64_t sectors = 0;
>              uint32_t sector_size = 0;
> --
> 2.28.0
>
>
>

--000000000000ba365a05b9c62e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 25, 2021 at 6:33 PM Joell=
e van Dyne &lt;j@getutm.app&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Some BSD platforms do not have this header.<br>
<br>
Signed-off-by: Joelle van Dyne &lt;j@getutm.app&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0block/file-posix.c | 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 27110075df..6818d97df5 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1117,6 +1117,7 @@ config_host_data.set(&#39;HAVE_PTY_H&#39;, cc.has_hea=
der(&#39;pty.h&#39;))<br>
=C2=A0config_host_data.set(&#39;HAVE_SYS_IOCCOM_H&#39;, cc.has_header(&#39;=
sys/ioccom.h&#39;))<br>
=C2=A0config_host_data.set(&#39;HAVE_SYS_KCOV_H&#39;, cc.has_header(&#39;sy=
s/kcov.h&#39;))<br>
=C2=A0config_host_data.set(&#39;HAVE_HOST_BLOCK_DEVICE&#39;, have_host_bloc=
k_device)<br>
+config_host_data.set(&#39;HAVE_SYS_DISK_H&#39;, cc.has_header(&#39;sys/dis=
k.h&#39;))<br>
<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actually per-targ=
et<br>
=C2=A0arrays =3D [&#39;CONFIG_AUDIO_DRIVERS&#39;, &#39;CONFIG_BDRV_RW_WHITE=
LIST&#39;, &#39;CONFIG_BDRV_RO_WHITELIST&#39;]<br>
diff --git a/block.c b/block.c<br>
index 8b9d457546..c4cf391dea 100644<br>
--- a/block.c<br>
+++ b/block.c<br>
@@ -54,7 +54,7 @@<br>
=C2=A0#ifdef CONFIG_BSD<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &lt;sys/queue.h&gt;<br>
-#ifndef __DragonFly__<br>
+#if defined(HAVE_SYS_DISK_H)<br>
=C2=A0#include &lt;sys/disk.h&gt;<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
diff --git a/block/file-posix.c b/block/file-posix.c<br>
index 11d2021346..666d3e7504 100644<br>
--- a/block/file-posix.c<br>
+++ b/block/file-posix.c<br>
@@ -2320,7 +2320,7 @@ again:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0)<br>
=C2=A0#endif<br>
-#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
+#if defined(HAVE_SYS_DISK_H) &amp;&amp; defined(__APPLE__) &amp;&amp; defi=
ned(__MACH__)<br></blockquote><div><br></div><div>Why is this needed? __Dra=
gonFly__ doesn&#39;t define either __APPLE__ or __MACH__</div><div><br></di=
v><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t sectors =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t sector_size =3D 0;=
<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000ba365a05b9c62e12--

