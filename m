Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F12375584
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:21:05 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leesC-00032W-Rt
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leeo6-00069V-Sz
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:16:52 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leenz-0005g4-UE
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:16:50 -0400
Received: by mail-qk1-x735.google.com with SMTP id 76so4997849qkn.13
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qrsW51zOkrM7kQuZGu554O6tEF+pmRN3LMKQd/Lw3HE=;
 b=fEiIee/q5vrcfTZTUqHI0d7Jtl17Qie9uo15vSlH1tPJ5NkQtVB57ZoW7XVDU9PL48
 bqwxjYlz0NHA+K56TExXcnBefFDLdjp1tdKh0h0MWhMiLvnC01DOKQ5hJsUM/6u9mQ8D
 Mq22gCyk3dz1PyPTRTInIWrvZtBavN2ZJx6mL31rr0GHxDFNjqXRGAlVQwDPeVBBUgy2
 La39NX3NPij4ugOC4hW2oJt0Ii5X80NCCXaQ1Uko8oVezTfsdH6MrNdWf4ryFpn4uBEx
 SehfmpURHE0dIO2r54uC4CSxgGtWgTKzC9MtXDzlCH10L1filSqnysouy7FrVZWiEYsC
 BMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qrsW51zOkrM7kQuZGu554O6tEF+pmRN3LMKQd/Lw3HE=;
 b=N/pyzZdGHjl7AFSqgoHfdbuDrlcRWq+XV1vWje+0VIw6HG6KvToidkevytO87JEBtJ
 fuHICFfTnnKARSoma6fqJjWxzph5PLTZqs13ymgJuFmVNLxDKLqelGBWagPqThFY6Zhl
 zM6cHwEsWgUkSVhI/24uBLeZ+KNpECp8UcXDymZyVsSRm4gDbrcmkojClQXpIeHHE9H2
 W4mZmjrqMn+fB2qIQ+V6hIWN6CV8aIndzTjA25ufEIQTMDyyb5ETpnMdusEDix/pJJiT
 DIi6I1pVoAJ++P4S++HAj3Y0jcNvkWb1xFOVGAx85Sl5QbSTMC15ZhlmsRpcVhYEmJnC
 P2IQ==
X-Gm-Message-State: AOAM530bR4syq7XFhDUiKlgtfUiWlQ5i7Zf6RAE3QulSDtj5jC6htXWZ
 1qbNHG7jp3mqQn1/WQA1UlruswvlIjUZv1VVQ72wsQ==
X-Google-Smtp-Source: ABdhPJwS3c2eBBOuTQUKHgbw78cl1LI3YGWqPNniUgUGgJUaNw5468VEjlK7l+VJaxi27hbQTRuN4j1Z0uej96SXBQQ=
X-Received: by 2002:a05:620a:24c5:: with SMTP id
 m5mr4177309qkn.195.1620310602750; 
 Thu, 06 May 2021 07:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
In-Reply-To: <20210506133758.1749233-5-philmd@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:16:30 -0600
Message-ID: <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e733e705c1a9f591"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e733e705c1a9f591
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> The ALLOCA(3) man-page mentions its "use is discouraged".
>
> Replace it by a g_new() call.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  bsd-user/syscall.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 4abff796c76..dbee0385ceb 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>      case TARGET_FREEBSD_NR_writev:
>          {
>              int count =3D arg3;
> -            struct iovec *vec;
> +            g_autofree struct iovec *vec =3D g_new(struct iovec, count);
>

Where is this freed? Also, alloca just moves a stack pointer, where malloc
has complex interactions. Are you sure that's a safe change here?

Warner

-            vec =3D alloca(count * sizeof(struct iovec));
>              if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
>                  goto efault;
>              ret =3D get_errno(writev(arg1, vec, count));
> --
> 2.26.3
>
>

--000000000000e733e705c1a9f591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The ALLOCA(3) man-page mentions =
its &quot;use is discouraged&quot;.<br>
<br>
Replace it by a g_new() call.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/syscall.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
index 4abff796c76..dbee0385ceb 100644<br>
--- a/bsd-user/syscall.c<br>
+++ b/bsd-user/syscall.c<br>
@@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi=
_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0case TARGET_FREEBSD_NR_writev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int count =3D arg3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree struct iovec *vec =3D=
 g_new(struct iovec, count);<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Where is this freed? Also, alloca just moves a =
stack pointer, where malloc has complex interactions. Are you sure that&#39=
;s a safe change here?</div><div dir=3D"auto"><br></div><div dir=3D"auto">W=
arner</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vec =3D alloca(count * sizeof(st=
ruct iovec));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lock_iovec(VERIFY_READ,=
 vec, arg2, count, 1) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto efault;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_errno(writev(ar=
g1, vec, count));<br>
-- <br>
2.26.3<br>
<br>
</blockquote></div></div></div>

--000000000000e733e705c1a9f591--

