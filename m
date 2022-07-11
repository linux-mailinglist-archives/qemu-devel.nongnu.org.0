Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072156D4C8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 08:36:16 +0200 (CEST)
Received: from localhost ([::1]:58102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAn1i-0006Va-Um
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 02:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oAmwR-0003IB-Gj; Mon, 11 Jul 2022 02:30:48 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:37852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oAmwL-0003IE-R0; Mon, 11 Jul 2022 02:30:44 -0400
Received: by mail-lf1-x12c.google.com with SMTP id e28so3483021lfj.4;
 Sun, 10 Jul 2022 23:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ehu+6sneuVdo/4IevbK3kItC3TJnHLy9EBCJPqM4Rq0=;
 b=HiSJnd/wtpQ5Xj31DOW0eeD3m+R3r3J3IZogRyjbO/LP7ZTLTHxgCvLIIf4GRUWrEa
 +40Qj/U574a5sqeU4NjsCCkyk9ZirDP4OMD37Sw61XY5bDaj8X5eM8hb5WHWLV/ehf3C
 crMOlYZXkGHvIJSUJuh8W6ZdxMSnm5EoCBNXL0Q2fNZ0m+wSQTRsYBbcZMZtuz4e8CfU
 DXKVBhHQiSJAr+cpX+9hy1iMU4/RgYCRkgi1u+T9uARsLQPgXjgxicJlZdQpyxe06pSO
 k3cBiBk3RVWvTHKYgNnZbFWTwC1gUrbtn830ntvQ32nus642pQRb07wApbiVOH3lFxFA
 4MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ehu+6sneuVdo/4IevbK3kItC3TJnHLy9EBCJPqM4Rq0=;
 b=qKY+JvR76pIJMuKkRATnWVpJcMSOuSMQPjFonlPMSaHg2zwOYOcFw7PjUsVt78TgXz
 OHgx17QXCmSriOdRhnMY32HOURMiq2YXGrepRUp8FFvREThqlXml9Uufqn6xWy4/hr+o
 x5zeoh6iw6Gt5IVNGXD9Q1ut3IhK/mLSbFdLzVo2BaB8egzUdA8ulATAG6eQTlA0g8M0
 BRK1dCC0K2hVyuAEH0ixRonqIYVw1/gNcn17czDd2oRWRPYXBobVcd18nyaK7IxmhbAF
 nzeyrGQypuNi2cIn7NRJhzx9eO1gVoNjRNRy/Ld776ddOERs6R2V4iGhEW2gtL5ShAc6
 fJVg==
X-Gm-Message-State: AJIora8Ob/Mhm1dC3OILvVY7QU/ZW84Sk+18wzYGuibsIN7RR1gKPR33
 eDvoBXpmxdFPwH/WLUfosAtAhBgIIkcZeb8W7tI=
X-Google-Smtp-Source: AGRyM1tAZQNwrQ5ANGFaT1StOQqeHOwuZCjFSIEizuBTQjnlqY/CDWrG/aZQw0joN48xTqYVv4DFQ/LGtSyvGwBRt8s=
X-Received: by 2002:a05:6512:31d1:b0:489:cfee:3600 with SMTP id
 j17-20020a05651231d100b00489cfee3600mr5877861lfe.432.1657521036489; Sun, 10
 Jul 2022 23:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-2-jsnow@redhat.com>
In-Reply-To: <20220708153503.18864-2-jsnow@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 11 Jul 2022 10:30:25 +0400
Message-ID: <CAJ+F1C+AiUyw1Xb9uQsMeaHa9D5=LDk4vwCKv9Op69YL-yjVkg@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] qga: treat get-guest-fsinfo as "best effort"
To: John Snow <jsnow@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009679c205e381b07b"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009679c205e381b07b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2022 at 8:16 PM John Snow <jsnow@redhat.com> wrote:

> In some container environments, there may be references to block devices
> witnessable from a container through /proc/self/mountinfo that reference
> devices we simply don't have access to in the container, and cannot
> provide information about.
>
> Instead of failing the entire fsinfo command, return stub information
> for these failed lookups.
>
> This allows test-qga to pass under docker tests, which are in turn used
> by the CentOS VM tests.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-posix.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0469dc409d4..355de050a1c 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1207,7 +1207,15 @@ static void build_guest_fsinfo_for_device(char
> const *devpath,
>
>      syspath =3D realpath(devpath, NULL);
>      if (!syspath) {
> -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> +        if (errno !=3D ENOENT) {
> +            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> +            return;
> +        }
> +
> +        /* ENOENT: This devpath may not exist because of container confi=
g
> */
> +        if (!fs->name) {
> +            fs->name =3D g_path_get_basename(devpath);
> +        }
>          return;
>      }
>
> --
> 2.34.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009679c205e381b07b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 8, 2022 at 8:16 PM John S=
now &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In some contain=
er environments, there may be references to block devices<br>
witnessable from a container through /proc/self/mountinfo that reference<br=
>
devices we simply don&#39;t have access to in the container, and cannot<br>
provide information about.<br>
<br>
Instead of failing the entire fsinfo command, return stub information<br>
for these failed lookups.<br>
<br>
This allows test-qga to pass under docker tests, which are in turn used<br>
by the CentOS VM tests.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Review=
ed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat=
.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-posix.c | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 0469dc409d4..355de050a1c 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -1207,7 +1207,15 @@ static void build_guest_fsinfo_for_device(char const=
 *devpath,<br>
<br>
=C2=A0 =C2=A0 =C2=A0syspath =3D realpath(devpath, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (!syspath) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;realpath(\=
&quot;%s\&quot;)&quot;, devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;realpath(\&quot;%s\&quot;)&quot;, devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ENOENT: This devpath may not exist because =
of container config */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fs-&gt;name) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D g_path_get_basen=
ame(devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.34.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009679c205e381b07b--

