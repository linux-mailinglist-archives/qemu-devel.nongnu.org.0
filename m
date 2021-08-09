Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBF43E46C5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:37:03 +0200 (CEST)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Sg-0001fH-Vb
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mD5QQ-0007B0-54
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:34:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mD5QO-0000bA-K3
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:34:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id b7so24651272edu.3
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOHDac7RhAgitTUc++ZiGRbYkUZbMTn33uFkNg/oFd8=;
 b=u0PmYbetVcWKjVHV1vN7+RHE+LofOYB1f8QRCKDvvZyQIFdV13rb2q84e8C/U2joQY
 AKtl9n07AGZZMyaL4sPQQFebwWSe7XtQBnW6Q5gQ+pRQWDlr/4mPx3MwcYpi4Yik+EBM
 +oBsZTy5CRJdlolfDZ6iGbTOXi3k59dcG/EsHxiOmGxnaZv3tj7ptu4t+f6qntI8z3cZ
 GcUn3rqHU+h+4KdfsDXZ8mJyZjoZeT28+WiXRGlaFkbQXFe/RnQQswiRQac1A+b5e5rS
 xDtKHj4V2JUbqn7NgACh0BWr0fqLeQ+AG2jTx41aRAfnGi2V4HUfDMfmaTI5N5yyqN7q
 aPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOHDac7RhAgitTUc++ZiGRbYkUZbMTn33uFkNg/oFd8=;
 b=pEp0QIM5kfxPwk39FMqOvofbGGGzrv1iLncLimBd2tdQS9yoGfmDGa0/UeWEWri0ik
 pzpPiMz29YTQZWYCWzgew9zuH+dfa3Kekpd6rgGfy6A/j6WAao6QGvALiHaIUsHh+CAv
 3IXkolXRvNtBNdFCuy9EJ1fQs2uBTNUM1u+TnXtC9RwV5kNWktY7jyacL5p1sWtlRrFH
 x4kWBxiWjCogh3O5s7K3P6oG0OGfENXOY7qrxGD7GLA3k+AczGis2g6gK2Gwi6gffIhU
 6esQ3dgGyZ+Lv0lIxriylsEHz64dcD6arAs0LUvP31xD28ysO6azCWCgyjJxeS37tVkM
 lCOA==
X-Gm-Message-State: AOAM532fElFQUWhqeRus55Le7zV4JE9DuppcqQlk+6wz1kcLb6gJXfFd
 otFug/yP58QXatyowPe67fK3J9In4NXlajB+jHg=
X-Google-Smtp-Source: ABdhPJwjCmsjjM991l8J0aqi3nDOchmXd2XfX7iiHf1WjGZzyWDZbK9r5lcFL8M9pn4ExN4AyAcPbWCq2ZU4ihFqkAA=
X-Received: by 2002:a05:6402:2547:: with SMTP id
 l7mr29509442edb.314.1628516079202; 
 Mon, 09 Aug 2021 06:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210809131029.3759267-1-berrange@redhat.com>
In-Reply-To: <20210809131029.3759267-1-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 9 Aug 2021 17:34:27 +0400
Message-ID: <CAJ+F1CJqs=K3PcHYm_BBea-kCcAzhsgWpD0Ni-Zwb7cwW8TjHA@mail.gmail.com>
Subject: Re: [PATCH] qga: fix leak of base64 decoded data on command error
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000069773105c920727f"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000069773105c920727f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2021 at 5:11 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> If the guest command fails to be spawned, then we would leak the decoded
> base64 input used for the command's stdin feed.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  qga/commands.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands.c b/qga/commands.c
> index a6491d2cf8..80501e4a73 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -402,7 +402,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      GIOChannel *in_ch, *out_ch, *err_ch;
>      GSpawnFlags flags;
>      bool has_output =3D (has_capture_output && capture_output);
> -    uint8_t *input =3D NULL;
> +    g_autofree uint8_t *input =3D NULL;
>      size_t ninput =3D 0;
>
>      arglist.value =3D (char *)path;
> @@ -441,7 +441,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      g_child_watch_add(pid, guest_exec_child_watch, gei);
>
>      if (has_input_data) {
> -        gei->in.data =3D input;
> +        gei->in.data =3D g_steal_pointer(&input);
>          gei->in.size =3D ninput;
>  #ifdef G_OS_WIN32
>          in_ch =3D g_io_channel_win32_new_fd(in_fd);
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000069773105c920727f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 9, 2021 at 5:11 PM Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">If the guest command fails to be spawned, then we would leak the decod=
ed<br>
base64 input used for the command&#39;s stdin feed.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/commands.c b/qga/commands.c<br>
index a6491d2cf8..80501e4a73 100644<br>
--- a/qga/commands.c<br>
+++ b/qga/commands.c<br>
@@ -402,7 +402,7 @@ GuestExec *qmp_guest_exec(const char *path,<br>
=C2=A0 =C2=A0 =C2=A0GIOChannel *in_ch, *out_ch, *err_ch;<br>
=C2=A0 =C2=A0 =C2=A0GSpawnFlags flags;<br>
=C2=A0 =C2=A0 =C2=A0bool has_output =3D (has_capture_output &amp;&amp; capt=
ure_output);<br>
-=C2=A0 =C2=A0 uint8_t *input =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree uint8_t *input =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0size_t ninput =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0arglist.value =3D (char *)path;<br>
@@ -441,7 +441,7 @@ GuestExec *qmp_guest_exec(const char *path,<br>
=C2=A0 =C2=A0 =C2=A0g_child_watch_add(pid, guest_exec_child_watch, gei);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0if (has_input_data) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gei-&gt;in.data =3D input;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gei-&gt;in.data =3D g_steal_pointer(&amp;input=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gei-&gt;in.size =3D ninput;<br>
=C2=A0#ifdef G_OS_WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in_ch =3D g_io_channel_win32_new_fd(in_fd=
);<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000069773105c920727f--

