Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BF454AF2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:29:30 +0100 (CET)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNoP-0001yH-9h
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:29:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNkL-0006je-2X
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:25:18 -0500
Received: from [2607:f8b0:4864:20::936] (port=43933
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNkI-0006gr-Fz
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:25:16 -0500
Received: by mail-ua1-x936.google.com with SMTP id v3so7084682uam.10
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkN/yDxORp/KdHgV30+tQKPcbF7a3TeZqGBAp5bAhUM=;
 b=T+5z8QejFoee9vtYf5ZyWGIPobbBmJJGW8KCDBX8lBqjyNVs0Qh2SS7Fj6QH/pQFeE
 pavqQ55Gvo9p4iwFeuRSu5+gpDADl/EeAqflsdG8mZnUuUwCRE/rtZywFLbl2mf2v5Ye
 v2v8e/cw25LgxYWvRRtWoU7ZedARfucgsskcv/QeV3oCMfL+1dSZbVU1hlaFdQNuvqxg
 I/2SFcukzP+4zwHARcfm9uixFkhDyZwzuL0W03JZ7bz6OnddOu3wZoSvxUIyByBfND6p
 14q/Am8bAWGyluQk5deEM3pkkncJCGyIxxdE8tXvRtGI9xCmEig8zKjxWphBnjaACwmp
 WR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkN/yDxORp/KdHgV30+tQKPcbF7a3TeZqGBAp5bAhUM=;
 b=4+meMYnPpi4A74my2PCk/22gSwOXH1feVORYrMTHM4CFV0QW4q1YsgRbb0fCnM418V
 yyuqbqH6I0zUcrEm4JCQyMXQJFi71fIVBeDOMADakfmU+SSko3ZVca3Od5W8HzkFeilF
 dM1JhVoG3T1b9Mzm8+bJfQLos+LJ1zQZEoSwMsv0Xzn/Vm567sQNJgEff1RKLeNtJBO8
 KydVpMc4FdLUKG3gR2jw3McyCpPJvgZVYeew5q9la4rThGu+y/glRVYnbsYDmwCcwomA
 GNNr2/Wf+TfmnA7c/gj8cRzkm5MMdXa7L+U1swGTZidYfEM6U0OAZmNkrDwofE1EHMHa
 g2Dw==
X-Gm-Message-State: AOAM532q/HMRzQV9FafLSgkuXCxjgMo9EvtTy5RUX2q8zHpWMd9LTeZ2
 oxoYSux8P1IXBdj8lH9jp8pUT5jJGaC0mvOHpxogqA==
X-Google-Smtp-Source: ABdhPJzpbiL2jxyImzgnLhsNoD6NZbnMwUNVmck/6oNc2GTiVBvbw8dpSWDux1ff2j9jmw1sxssypUqgoniqvXQYSoY=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr25458398uat.85.1637166313519; 
 Wed, 17 Nov 2021 08:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-4-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-4-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:25:03 -0700
Message-ID: <CANCZdfrac6pX5i6qL=x4pihFxAnv7QGT8vSjF9h2Rc=+HahGDg@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] linux-user/safe-syscall.inc.S: Move to
 common-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008e4c9605d0fe7cd4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008e4c9605d0fe7cd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> Move all the safe_syscall.inc.S files to common-user. They are almost
> identical between linux-user and bsd-user to re-use.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20211113045603.60391-4-imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                                                 | 2 ++
>  {linux-user =3D> common-user}/host/aarch64/hostdep.h          | 0
>  {linux-user =3D> common-user}/host/arm/hostdep.h              | 0
>  {linux-user =3D> common-user}/host/i386/hostdep.h             | 0
>  {linux-user =3D> common-user}/host/ppc64/hostdep.h            | 0
>  {linux-user =3D> common-user}/host/riscv/hostdep.h            | 0
>  {linux-user =3D> common-user}/host/s390x/hostdep.h            | 0
>  {linux-user =3D> common-user}/host/x86_64/hostdep.h           | 0
>  {linux-user =3D> common-user}/host/aarch64/safe-syscall.inc.S | 0
>  {linux-user =3D> common-user}/host/arm/safe-syscall.inc.S     | 0
>  {linux-user =3D> common-user}/host/i386/safe-syscall.inc.S    | 0
>  {linux-user =3D> common-user}/host/ppc64/safe-syscall.inc.S   | 0
>  {linux-user =3D> common-user}/host/riscv/safe-syscall.inc.S   | 0
>  {linux-user =3D> common-user}/host/s390x/safe-syscall.inc.S   | 0
>  {linux-user =3D> common-user}/host/x86_64/safe-syscall.inc.S  | 0
>  15 files changed, 2 insertions(+)
>  rename {linux-user =3D> common-user}/host/aarch64/hostdep.h (100%)
>  rename {linux-user =3D> common-user}/host/arm/hostdep.h (100%)
>  rename {linux-user =3D> common-user}/host/i386/hostdep.h (100%)
>  rename {linux-user =3D> common-user}/host/ppc64/hostdep.h (100%)
>  rename {linux-user =3D> common-user}/host/riscv/hostdep.h (100%)
>  rename {linux-user =3D> common-user}/host/s390x/hostdep.h (100%)
>  rename {linux-user =3D> common-user}/host/x86_64/hostdep.h (100%)
>  rename {linux-user =3D> common-user}/host/aarch64/safe-syscall.inc.S (10=
0%)
>  rename {linux-user =3D> common-user}/host/arm/safe-syscall.inc.S (100%)
>  rename {linux-user =3D> common-user}/host/i386/safe-syscall.inc.S (100%)
>  rename {linux-user =3D> common-user}/host/ppc64/safe-syscall.inc.S (100%=
)
>  rename {linux-user =3D> common-user}/host/riscv/safe-syscall.inc.S (100%=
)
>  rename {linux-user =3D> common-user}/host/s390x/safe-syscall.inc.S (100%=
)
>  rename {linux-user =3D> common-user}/host/x86_64/safe-syscall.inc.S (100=
%)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/meson.build b/meson.build
> index e2d38a43e6..c58abf0d0d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2878,10 +2878,12 @@ foreach target : target_dirs
>      if 'CONFIG_LINUX_USER' in config_target
>        base_dir =3D 'linux-user'
>        target_inc +=3D include_directories('linux-user/host/' /
> config_host['ARCH'])
> +      target_inc +=3D include_directories('common-user/host/' /
> config_host['ARCH'])
>      endif
>      if 'CONFIG_BSD_USER' in config_target
>        base_dir =3D 'bsd-user'
>        target_inc +=3D include_directories('bsd-user/' / targetos)
> +      target_inc +=3D include_directories('common-user/host/' /
> config_host['ARCH'])
>        dir =3D base_dir / abi
>        arch_srcs +=3D files(dir / 'target_arch_cpu.c')
>      endif
> diff --git a/linux-user/host/aarch64/hostdep.h
> b/common-user/host/aarch64/hostdep.h
> similarity index 100%
> rename from linux-user/host/aarch64/hostdep.h
> rename to common-user/host/aarch64/hostdep.h
> diff --git a/linux-user/host/arm/hostdep.h b/common-user/host/arm/hostdep=
.h
> similarity index 100%
> rename from linux-user/host/arm/hostdep.h
> rename to common-user/host/arm/hostdep.h
> diff --git a/linux-user/host/i386/hostdep.h
> b/common-user/host/i386/hostdep.h
> similarity index 100%
> rename from linux-user/host/i386/hostdep.h
> rename to common-user/host/i386/hostdep.h
> diff --git a/linux-user/host/ppc64/hostdep.h
> b/common-user/host/ppc64/hostdep.h
> similarity index 100%
> rename from linux-user/host/ppc64/hostdep.h
> rename to common-user/host/ppc64/hostdep.h
> diff --git a/linux-user/host/riscv/hostdep.h
> b/common-user/host/riscv/hostdep.h
> similarity index 100%
> rename from linux-user/host/riscv/hostdep.h
> rename to common-user/host/riscv/hostdep.h
> diff --git a/linux-user/host/s390x/hostdep.h
> b/common-user/host/s390x/hostdep.h
> similarity index 100%
> rename from linux-user/host/s390x/hostdep.h
> rename to common-user/host/s390x/hostdep.h
> diff --git a/linux-user/host/x86_64/hostdep.h
> b/common-user/host/x86_64/hostdep.h
> similarity index 100%
> rename from linux-user/host/x86_64/hostdep.h
> rename to common-user/host/x86_64/hostdep.h
> diff --git a/linux-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/aarch64/safe-syscall.inc.S
> rename to common-user/host/aarch64/safe-syscall.inc.S
> diff --git a/linux-user/host/arm/safe-syscall.inc.S
> b/common-user/host/arm/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/arm/safe-syscall.inc.S
> rename to common-user/host/arm/safe-syscall.inc.S
> diff --git a/linux-user/host/i386/safe-syscall.inc.S
> b/common-user/host/i386/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/i386/safe-syscall.inc.S
> rename to common-user/host/i386/safe-syscall.inc.S
> diff --git a/linux-user/host/ppc64/safe-syscall.inc.S
> b/common-user/host/ppc64/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/ppc64/safe-syscall.inc.S
> rename to common-user/host/ppc64/safe-syscall.inc.S
> diff --git a/linux-user/host/riscv/safe-syscall.inc.S
> b/common-user/host/riscv/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/riscv/safe-syscall.inc.S
> rename to common-user/host/riscv/safe-syscall.inc.S
> diff --git a/linux-user/host/s390x/safe-syscall.inc.S
> b/common-user/host/s390x/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/s390x/safe-syscall.inc.S
> rename to common-user/host/s390x/safe-syscall.inc.S
> diff --git a/linux-user/host/x86_64/safe-syscall.inc.S
> b/common-user/host/x86_64/safe-syscall.inc.S
> similarity index 100%
> rename from linux-user/host/x86_64/safe-syscall.inc.S
> rename to common-user/host/x86_64/safe-syscall.inc.S
> --
> 2.25.1
>
>

--0000000000008e4c9605d0fe7cd4
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
Move all the safe_syscall.inc.S files to common-user. They are almost<br>
identical between linux-user and bsd-user to re-use.<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20211113045603.60391-4-imp@bsdimp.com" ta=
rget=3D"_blank">20211113045603.60391-4-imp@bsdimp.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0{linux-user =3D&gt; common-user}/host/aarch64/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/arm/hostdep.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/i386/hostdep.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/ppc64/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/riscv/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/s390x/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/x86_64/hostdep.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/aarch64/safe-syscall.inc.S | 0<=
br>
=C2=A0{linux-user =3D&gt; common-user}/host/arm/safe-syscall.inc.S=C2=A0 =
=C2=A0 =C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/i386/safe-syscall.inc.S=C2=A0 =
=C2=A0 | 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/ppc64/safe-syscall.inc.S=C2=A0 =
=C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/riscv/safe-syscall.inc.S=C2=A0 =
=C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/s390x/safe-syscall.inc.S=C2=A0 =
=C2=A0| 0<br>
=C2=A0{linux-user =3D&gt; common-user}/host/x86_64/safe-syscall.inc.S=C2=A0=
 | 0<br>
=C2=A015 files changed, 2 insertions(+)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/aarch64/hostdep.h (100%)=
<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/arm/hostdep.h (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/i386/hostdep.h (100%)<br=
>
=C2=A0rename {linux-user =3D&gt; common-user}/host/ppc64/hostdep.h (100%)<b=
r>
=C2=A0rename {linux-user =3D&gt; common-user}/host/riscv/hostdep.h (100%)<b=
r>
=C2=A0rename {linux-user =3D&gt; common-user}/host/s390x/hostdep.h (100%)<b=
r>
=C2=A0rename {linux-user =3D&gt; common-user}/host/x86_64/hostdep.h (100%)<=
br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/aarch64/safe-syscall.inc=
.S (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/arm/safe-syscall.inc.S (=
100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/i386/safe-syscall.inc.S =
(100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/ppc64/safe-syscall.inc.S=
 (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/riscv/safe-syscall.inc.S=
 (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/s390x/safe-syscall.inc.S=
 (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/x86_64/safe-syscall.inc.=
S (100%)<br></blockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<=
a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meson.build b/meson.build<br>
index e2d38a43e6..c58abf0d0d 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2878,10 +2878,12 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0if &#39;CONFIG_LINUX_USER&#39; in config_target<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0base_dir =3D &#39;linux-user&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_inc +=3D include_directories(&#39;linux-u=
ser/host/&#39; / config_host[&#39;ARCH&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 target_inc +=3D include_directories(&#39;common-user/=
host/&#39; / config_host[&#39;ARCH&#39;])<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0 =C2=A0if &#39;CONFIG_BSD_USER&#39; in config_target<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0base_dir =3D &#39;bsd-user&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_inc +=3D include_directories(&#39;bsd-use=
r/&#39; / targetos)<br>
+=C2=A0 =C2=A0 =C2=A0 target_inc +=3D include_directories(&#39;common-user/=
host/&#39; / config_host[&#39;ARCH&#39;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dir =3D base_dir / abi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0arch_srcs +=3D files(dir / &#39;target_arch_cpu.=
c&#39;)<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
diff --git a/linux-user/host/aarch64/hostdep.h b/common-user/host/aarch64/h=
ostdep.h<br>
similarity index 100%<br>
rename from linux-user/host/aarch64/hostdep.h<br>
rename to common-user/host/aarch64/hostdep.h<br>
diff --git a/linux-user/host/arm/hostdep.h b/common-user/host/arm/hostdep.h=
<br>
similarity index 100%<br>
rename from linux-user/host/arm/hostdep.h<br>
rename to common-user/host/arm/hostdep.h<br>
diff --git a/linux-user/host/i386/hostdep.h b/common-user/host/i386/hostdep=
.h<br>
similarity index 100%<br>
rename from linux-user/host/i386/hostdep.h<br>
rename to common-user/host/i386/hostdep.h<br>
diff --git a/linux-user/host/ppc64/hostdep.h b/common-user/host/ppc64/hostd=
ep.h<br>
similarity index 100%<br>
rename from linux-user/host/ppc64/hostdep.h<br>
rename to common-user/host/ppc64/hostdep.h<br>
diff --git a/linux-user/host/riscv/hostdep.h b/common-user/host/riscv/hostd=
ep.h<br>
similarity index 100%<br>
rename from linux-user/host/riscv/hostdep.h<br>
rename to common-user/host/riscv/hostdep.h<br>
diff --git a/linux-user/host/s390x/hostdep.h b/common-user/host/s390x/hostd=
ep.h<br>
similarity index 100%<br>
rename from linux-user/host/s390x/hostdep.h<br>
rename to common-user/host/s390x/hostdep.h<br>
diff --git a/linux-user/host/x86_64/hostdep.h b/common-user/host/x86_64/hos=
tdep.h<br>
similarity index 100%<br>
rename from linux-user/host/x86_64/hostdep.h<br>
rename to common-user/host/x86_64/hostdep.h<br>
diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/common-user/host/=
aarch64/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/aarch64/safe-syscall.inc.S<br>
rename to common-user/host/aarch64/safe-syscall.inc.S<br>
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/=
safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/arm/safe-syscall.inc.S<br>
rename to common-user/host/arm/safe-syscall.inc.S<br>
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/common-user/host/i38=
6/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/i386/safe-syscall.inc.S<br>
rename to common-user/host/i386/safe-syscall.inc.S<br>
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/common-user/host/pp=
c64/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/ppc64/safe-syscall.inc.S<br>
rename to common-user/host/ppc64/safe-syscall.inc.S<br>
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/common-user/host/ri=
scv/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/riscv/safe-syscall.inc.S<br>
rename to common-user/host/riscv/safe-syscall.inc.S<br>
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/common-user/host/s3=
90x/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/s390x/safe-syscall.inc.S<br>
rename to common-user/host/s390x/safe-syscall.inc.S<br>
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x=
86_64/safe-syscall.inc.S<br>
similarity index 100%<br>
rename from linux-user/host/x86_64/safe-syscall.inc.S<br>
rename to common-user/host/x86_64/safe-syscall.inc.S<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000008e4c9605d0fe7cd4--

