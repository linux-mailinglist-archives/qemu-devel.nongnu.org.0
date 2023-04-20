Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B498F6E9851
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:30:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWDu-0000IE-CE; Thu, 20 Apr 2023 11:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppWDq-0000I1-Bm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:29:22 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppWDn-0007ZM-Vw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:29:22 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5051abd03a7so938952a12.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1682004558; x=1684596558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xYqxJmlekUtbCz6HviYBx+xTKrMwwM0Fd4QdnDahdk0=;
 b=UwGZJdqHwhAb1PCiLA8LkHDKuI8cN++xEXl8mRNBAAiokvxHCjQbm7QYECEMnbgSSW
 LinPdbVlcuSTpjI96THklktt80Pr6veO9Q+iW+/n+GfZauI+s4eCCeC++G82yO8Wz/eq
 nrXJozpBA3eWMiZv0ANQNFYSPEl54TBT8OJQXaikiWJcHzBN5Aa3bDJlRvluRl/XLmba
 RYVC9nWGRzsG2kj5aDc1j1Kl5c+JHHijYOSNO+g27ozmThs7Y1phNljA/mpDyAPhN4/e
 Lem7ugwp6iHsWWLRFD5zp0aBlN/xfbX7OrLHtcBBboCKIegnVXJFpQ1QYEuZYHNizNLH
 HwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682004558; x=1684596558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xYqxJmlekUtbCz6HviYBx+xTKrMwwM0Fd4QdnDahdk0=;
 b=AEEmwxXbTKlmFmuft3iuxS/73ExgH3XVAYEjNKSB9hCCmPuOgp33fuiqCmpz7gjoxN
 tX+Ps+Y13km06z6CbbeO5FcPxh4SUyC3m8/NE0k3Z2wccDI0GKuXPzzgZTL04qgapR/i
 w1tNvO4rL66HJHSxh3L7Zx+89lBCEx5ihVGkCeo/7fcEYl5BIGSvZ5DUVjv7AttDiG2x
 jeMFyAbUDHD3y4qHq7+DmoueT/JCju4nOI6v0Ze7/p+X7r92NtlsyQLhn6K4+W+8i9i/
 Tsx2imyOWj2FRGapvBhHHURZgstxZ7eiG6lDSzAzlDjpilMEzRauwLb2xqiyF1CnfPBX
 rlEQ==
X-Gm-Message-State: AAQBX9c29DDh9lBn5tYkJWptsg9HiusQyuRPRUOpj9AaidWSSiJ04pCS
 gYUC/boB9pd6vvbypMNEOJlx7qB1PPHunnVoIbLj9A==
X-Google-Smtp-Source: AKy350YUin2sDRNBDQGbeLfvHJpSqejWzeHgFweGiEae1mLK1S3f0bQjiXSEF/01IFNLcRsOtQpy0RI1/XR+vOn1Nm8=
X-Received: by 2002:aa7:c689:0:b0:504:9a5a:7c93 with SMTP id
 n9-20020aa7c689000000b005049a5a7c93mr1776387edq.24.1682004557930; Thu, 20 Apr
 2023 08:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
 <20230420150009.1675181-2-alex.bennee@linaro.org>
In-Reply-To: <20230420150009.1675181-2-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 20 Apr 2023 09:29:06 -0600
Message-ID: <CANCZdfrRkP5d=yYv+fv9Rgf+nag_94sh_=j2DxcpptLoQmfdWw@mail.gmail.com>
Subject: Re: [PATCH 01/10] *-user: remove the guest_user_syscall tracepoints
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002fbe7c05f9c63431"
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000002fbe7c05f9c63431
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 9:00=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

> This is pure duplication now. Both bsd-user and linux-user have
> builtin strace support and we can also track syscalls via the plugins
> system.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/user/syscall-trace.h  |  4 ----
>  bsd-user/freebsd/os-syscall.c |  2 --
>  trace-events                  | 19 -------------------
>  3 files changed, 25 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

I've never used this stuff...  I am in the process of revamping bsd-user's
strace stuff, but
this won't interfere with that at all (and even if it did, it would be a
good change).

Warner


> diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
> index 90bda7631c..557f881a79 100644
> --- a/include/user/syscall-trace.h
> +++ b/include/user/syscall-trace.h
> @@ -26,9 +26,6 @@ static inline void record_syscall_start(void *cpu, int
> num,
>                                          abi_long arg5, abi_long arg6,
>                                          abi_long arg7, abi_long arg8)
>  {
> -    trace_guest_user_syscall(cpu, num,
> -                             arg1, arg2, arg3, arg4,
> -                             arg5, arg6, arg7, arg8);
>      qemu_plugin_vcpu_syscall(cpu, num,
>                               arg1, arg2, arg3, arg4,
>                               arg5, arg6, arg7, arg8);
> @@ -36,7 +33,6 @@ static inline void record_syscall_start(void *cpu, int
> num,
>
>  static inline void record_syscall_return(void *cpu, int num, abi_long re=
t)
>  {
> -    trace_guest_user_syscall_ret(cpu, num, ret);
>      qemu_plugin_vcpu_syscall_ret(cpu, num, ret);
>  }
>
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.=
c
> index c8f998ecec..b0ae43766f 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -531,7 +531,6 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>      CPUState *cpu =3D env_cpu(cpu_env);
>      abi_long ret;
>
> -    trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5,
> arg6, arg7, arg8);
>      if (do_strace) {
>          print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
>      }
> @@ -541,7 +540,6 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>      if (do_strace) {
>          print_freebsd_syscall_ret(num, ret);
>      }
> -    trace_guest_user_syscall_ret(cpu, num, ret);
>
>      return ret;
>  }
> diff --git a/trace-events b/trace-events
> index b6b84b175e..691c3533e4 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -85,22 +85,3 @@ vcpu guest_cpu_exit(void)
>  # Targets: all
>  vcpu guest_cpu_reset(void)
>
> -# include/user/syscall-trace.h
> -
> -# @num: System call number.
> -# @arg*: System call argument value.
> -#
> -# Start executing a guest system call in syscall emulation mode.
> -#
> -# Mode: user
> -# Targets: TCG(all)
> -vcpu guest_user_syscall(uint64_t num, uint64_t arg1, uint64_t arg2,
> uint64_t arg3, uint64_t arg4, uint64_t arg5, uint64_t arg6, uint64_t arg7=
,
> uint64_t arg8) "num=3D0x%016"PRIx64" arg1=3D0x%016"PRIx64" arg2=3D0x%016"=
PRIx64"
> arg3=3D0x%016"PRIx64" arg4=3D0x%016"PRIx64" arg5=3D0x%016"PRIx64"
> arg6=3D0x%016"PRIx64" arg7=3D0x%016"PRIx64" arg8=3D0x%016"PRIx64
> -
> -# @num: System call number.
> -# @ret: System call result value.
> -#
> -# Finish executing a guest system call in syscall emulation mode.
> -#
> -# Mode: user
> -# Targets: TCG(all)
> -vcpu guest_user_syscall_ret(uint64_t num, uint64_t ret)
> "num=3D0x%016"PRIx64" ret=3D0x%016"PRIx64
> --
> 2.39.2
>
>

--0000000000002fbe7c05f9c63431
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 20, 2023 at 9:00=E2=80=AF=
AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.benn=
ee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">This is pure duplication now. Both bsd-user and linux-user hav=
e<br>
builtin strace support and we can also track syscalls via the plugins<br>
system.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/user/syscall-trace.h=C2=A0 |=C2=A0 4 ----<br>
=C2=A0bsd-user/freebsd/os-syscall.c |=C2=A0 2 --<br>
=C2=A0trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 19 -------------------<br>
=C2=A03 files changed, 25 deletions(-)<br></blockquote><div><br></div><div>=
Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.c=
om</a>&gt;</div><div><br></div><div>I&#39;ve never used this stuff...=C2=A0=
 I am in the process of revamping bsd-user&#39;s strace stuff, but</div><di=
v>this won&#39;t interfere with that at all (and even if it did, it would b=
e a good change).</div><div><br></div><div>Warner</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h<br=
>
index 90bda7631c..557f881a79 100644<br>
--- a/include/user/syscall-trace.h<br>
+++ b/include/user/syscall-trace.h<br>
@@ -26,9 +26,6 @@ static inline void record_syscall_start(void *cpu, int nu=
m,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ab=
i_long arg5, abi_long arg6,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ab=
i_long arg7, abi_long arg8)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 trace_guest_user_syscall(cpu, num,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg1, arg2, arg3, arg4,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg5, arg6, arg7, arg8);<br>
=C2=A0 =C2=A0 =C2=A0qemu_plugin_vcpu_syscall(cpu, num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg1, arg2, arg3, arg4,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg5, arg6, arg7, arg8);<br>
@@ -36,7 +33,6 @@ static inline void record_syscall_start(void *cpu, int nu=
m,<br>
<br>
=C2=A0static inline void record_syscall_return(void *cpu, int num, abi_long=
 ret)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 trace_guest_user_syscall_ret(cpu, num, ret);<br>
=C2=A0 =C2=A0 =C2=A0qemu_plugin_vcpu_syscall_ret(cpu, num, ret);<br>
=C2=A0}<br>
<br>
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c<=
br>
index c8f998ecec..b0ae43766f 100644<br>
--- a/bsd-user/freebsd/os-syscall.c<br>
+++ b/bsd-user/freebsd/os-syscall.c<br>
@@ -531,7 +531,6 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi=
_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D env_cpu(cpu_env);<br>
=C2=A0 =C2=A0 =C2=A0abi_long ret;<br>
<br>
-=C2=A0 =C2=A0 trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, a=
rg5, arg6, arg7, arg8);<br>
=C2=A0 =C2=A0 =C2=A0if (do_strace) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_freebsd_syscall(num, arg1, arg2, ar=
g3, arg4, arg5, arg6);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -541,7 +540,6 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi=
_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0if (do_strace) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_freebsd_syscall_ret(num, ret);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 trace_guest_user_syscall_ret(cpu, num, ret);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/trace-events b/trace-events<br>
index b6b84b175e..691c3533e4 100644<br>
--- a/trace-events<br>
+++ b/trace-events<br>
@@ -85,22 +85,3 @@ vcpu guest_cpu_exit(void)<br>
=C2=A0# Targets: all<br>
=C2=A0vcpu guest_cpu_reset(void)<br>
<br>
-# include/user/syscall-trace.h<br>
-<br>
-# @num: System call number.<br>
-# @arg*: System call argument value.<br>
-#<br>
-# Start executing a guest system call in syscall emulation mode.<br>
-#<br>
-# Mode: user<br>
-# Targets: TCG(all)<br>
-vcpu guest_user_syscall(uint64_t num, uint64_t arg1, uint64_t arg2, uint64=
_t arg3, uint64_t arg4, uint64_t arg5, uint64_t arg6, uint64_t arg7, uint64=
_t arg8) &quot;num=3D0x%016&quot;PRIx64&quot; arg1=3D0x%016&quot;PRIx64&quo=
t; arg2=3D0x%016&quot;PRIx64&quot; arg3=3D0x%016&quot;PRIx64&quot; arg4=3D0=
x%016&quot;PRIx64&quot; arg5=3D0x%016&quot;PRIx64&quot; arg6=3D0x%016&quot;=
PRIx64&quot; arg7=3D0x%016&quot;PRIx64&quot; arg8=3D0x%016&quot;PRIx64<br>
-<br>
-# @num: System call number.<br>
-# @ret: System call result value.<br>
-#<br>
-# Finish executing a guest system call in syscall emulation mode.<br>
-#<br>
-# Mode: user<br>
-# Targets: TCG(all)<br>
-vcpu guest_user_syscall_ret(uint64_t num, uint64_t ret) &quot;num=3D0x%016=
&quot;PRIx64&quot; ret=3D0x%016&quot;PRIx64<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--0000000000002fbe7c05f9c63431--

