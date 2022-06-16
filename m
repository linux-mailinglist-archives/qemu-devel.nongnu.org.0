Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E46854E51C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:41:22 +0200 (CEST)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qgT-0007CZ-Ht
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qbO-00047g-Pw; Thu, 16 Jun 2022 10:36:06 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:38547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qbM-0001XV-Lx; Thu, 16 Jun 2022 10:36:05 -0400
Received: by mail-lj1-x22f.google.com with SMTP id g2so1710881ljk.5;
 Thu, 16 Jun 2022 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lw3nYykeF4EYiU+dF5fyoplQKMgpIKRwFpjBH86rRko=;
 b=g40FULPyUyfhiTUsltpj90myNW/jkNn3qNRXE211BTDgerYnvOOUNzKkbEK6gI8sbx
 AYmEoTsVEuCxPite5lw3SZLBrcgWx2Rov3RmK/U5QlpMp1xB8Xwukye6Ot8ezKBAlU3L
 KdVJ6lLLRmHwl0olJzwO6alzuT7M4ccSt3k0EAzHGRIfSQwopWuLyxa97AS8oL9li79w
 0tCyh/MgxQDiYBgrff/+7GJOZcQv2udb7q590cYfqZmtTBrWG1ldKaYIbKWJ+CqVdojS
 BY01Jr7KHLb+R1DJyyNXccov4DJ+wHUEA+r/8QeFqxkpK8EuZLtQtUIIFMn+ybF3G62D
 qpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lw3nYykeF4EYiU+dF5fyoplQKMgpIKRwFpjBH86rRko=;
 b=rMoFslmqG9jNchJm+8Dwb2yGFCvfC4dj8Wq3yPpdFNCF7WPEEh0SwaCMqz73HQVt/q
 u24sfADwPwkQxDUK7YNRcMuLttWOeoKWDAzprKpG6Dc6vQCh8QYBZ2f9YJEv5lbV72Q0
 /r2FyhWX/EgY37TGmr0du8MbF0bp7qDTxasrwPFlBcLOOeW/BL6T7Z1B0Fmugdj/lLL4
 uuKh2h0uTelWAp2y8L0tlvspIvvzG9fmfbHPUk/ihBVH5ZCg+0ZuGyxKOkIuFtHX3sqt
 y8kDQweNq0NFu6p74rruLXaKYJFK5Vl+kxo4DqdZAt+KLmGDkDWjP58cSygZRjCRFzzK
 Uvvw==
X-Gm-Message-State: AJIora8Z0idq5U3UWStga6XV8vPbHa0ECeCElGLcybT87vCa6gS2yUtm
 kisDaoL5JxSEmPbIog+bToYrVz+6CtQO49DR76g=
X-Google-Smtp-Source: AGRyM1vcKJRrDgEMbRhfgNf5RZLczEH8JhLQOQdayhKdD+wMu6B/wTF1WGSWvguflzAcSY57mLUrxqY0RxVaqRquDtY=
X-Received: by 2002:a2e:8881:0:b0:255:7790:25e6 with SMTP id
 k1-20020a2e8881000000b00255779025e6mr2641831lji.525.1655390156060; Thu, 16
 Jun 2022 07:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-4-jsnow@redhat.com>
In-Reply-To: <20220616142659.3184115-4-jsnow@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 18:35:44 +0400
Message-ID: <CAJ+F1C+iHv-RvnbvUikD431tNN8PJ+Z=EO0Hgi8Dht-sX1OKBQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] qga: treat get-guest-fsinfo as "best effort"
To: John Snow <jsnow@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000377f4a05e1918eca"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

--000000000000377f4a05e1918eca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jun 16, 2022 at 6:27 PM John Snow <jsnow@redhat.com> wrote:

> In some container environments, there may be references to block devices
> witnessable from a container through /proc/self/mountinfo that reference
> devices we simply don't have access to in the container, and could not
> provide information about.
>
> Instead of failing the entire fsinfo command, return stub information
> for these failed lookups.
>
> This allows test-qga to pass under docker tests, which are in turn used
> by the CentOS VM tests.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qga/commands-posix.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0469dc409d4..5989d4dca9d 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(char
> const *devpath,
>
>      syspath =3D realpath(devpath, NULL);
>      if (!syspath) {
> -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> +        if (errno =3D=3D ENOENT) {
> +            /* This devpath may not exist because of container config,
> etc. */
> +            fprintf(stderr, "realpath(%s) returned NULL/ENOENT\n",
> devpath);
>

qga uses g_critical() (except for some win32 code paths atm)


> +            fs->name =3D g_strdup("??\?-ENOENT");
>

Hmm, maybe we should make the field optional instead.


> +        } else {
> +            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
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

--000000000000377f4a05e1918eca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 16, 2022 at 6:27 PM Joh=
n Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In some cont=
ainer environments, there may be references to block devices<br>
witnessable from a container through /proc/self/mountinfo that reference<br=
>
devices we simply don&#39;t have access to in the container, and could not<=
br>
provide information about.<br>
<br>
Instead of failing the entire fsinfo command, return stub information<br>
for these failed lookups.<br>
<br>
This allows test-qga to pass under docker tests, which are in turn used<br>
by the CentOS VM tests.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 0469dc409d4..5989d4dca9d 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(char const=
 *devpath,<br>
<br>
=C2=A0 =C2=A0 =C2=A0syspath =3D realpath(devpath, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (!syspath) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;realpath(\=
&quot;%s\&quot;)&quot;, devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This devpath may not exist be=
cause of container config, etc. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;realpath(%=
s) returned NULL/ENOENT\n&quot;, devpath);<br></blockquote><div><br></div><=
div>qga uses g_critical() (except for some win32 code paths atm)<br></div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D g_strdup(&quot;?=
?\?-ENOENT&quot;);<br></blockquote><div><br></div><div>Hmm, maybe we should=
 make the field optional instead.</div><div>=C2=A0<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;realpath(\&quot;%s\&quot;)&quot;, devpath);<br>
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

--000000000000377f4a05e1918eca--

