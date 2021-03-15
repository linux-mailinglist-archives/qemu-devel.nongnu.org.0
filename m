Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B512B33C6B0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:19:40 +0100 (CET)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLskd-0006b1-RC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lLsJe-0006NI-I5
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:51:46 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lLsJa-00042m-Pl
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:51:46 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h10so18555866edt.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8hGa1WZT3IRVbcAr8nby2MZF2hWby7QFZIvGcz/+QNA=;
 b=MKouHrIDm1oEm0PaXZnHgq4G59np6o5gkHDXmsj5kCPIgEoqfQ3k1aQI1qg7Z+eyV5
 JdF70j7efFiDd496aqMzY9QuOQJb7orIGMGdyMrCH+VSs53QEaDjLoytWpp/jli1TEyA
 IOA5Da2jWoVaUEGl18AnraqR91/Gp54Phn9jiUEO42UyRqY2F228EEaQRwuqgpk4oru7
 rAe4Njg244/w6wOMmSlOuKfBvOwJ2RQDkCv9qyOZ35MuGVl2bP1aM+947SjlxmcIMFO9
 wqHurbpWKgHVTstbSF5otpWkzDAkRN/whg8wHJnGwiJMotLyv9yLiDXeKyhWamuYWP6O
 lurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hGa1WZT3IRVbcAr8nby2MZF2hWby7QFZIvGcz/+QNA=;
 b=Il2z739I1Oe5MM+Ev1tdpVsZuYOn6DEoOI/KACTn3CCJWEFWKmjLPODbYim7zQdfRv
 f6XVrH9+SiNgOp9GvqUAfD3Vsf+DabvJZi21e043IzyKuxFxl8y0nMalMTx2i7ZE0HTU
 NoWP8mIpFTtKSGReCf6BhPS0q5/gPe7ZSrw8sQNAMSn8OwO+a+hwJjmPlIxMersVjfR9
 tH2eWaeVG2rMkqVnRtLt83AL4kmjSujhMwHQLTr4fuGJ4ObsKJXEIHVjazz5PT7lnz97
 kL3R9mLoOO+DSs2LgPtsmpz9fvtjZYWuQzLjv3crs7ow+6USt4LktgVth5Eog9NVtKGU
 Ivng==
X-Gm-Message-State: AOAM530y3ohFkEDJMqBsIQGFKUKkjkP8LVmb231MhlWs6uyWhR1Tb6Dd
 sf5n9cANrwM5Sj6XrfRFqWf0zPM5kzWNEJnlL6I=
X-Google-Smtp-Source: ABdhPJzmHb0AALIWw5i/c/QI8IaVbzx4ISlpHiYGBK8fpyAUGjp54bOnPgPdyXKU3fYfDjYPKxRV9VVQajYvjAGGzi8=
X-Received: by 2002:a50:ee05:: with SMTP id g5mr31543839eds.164.1615834300632; 
 Mon, 15 Mar 2021 11:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
In-Reply-To: <20210315170636.704201-1-zhlcindy@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 15 Mar 2021 22:51:27 +0400
Message-ID: <CAJ+F1CLbr7=9GF8LSZYC-LnJh=WjLehtHQ_Q3Ufwf+UnGBA+GA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
To: Li Zhang <zhlcindy@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000081529d05bd97bd9c"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000081529d05bd97bd9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 15, 2021 at 9:22 PM Li Zhang <zhlcindy@gmail.com> wrote:

> From: Li Zhang <li.zhang@cloud.ionos.com>
>
> When executing the QMP commands "chardev-change" to change the
> backend device to socket, it will cause a segment fault because
> it assumes chr->label as non-NULL in function yank_register_instance.
> The function qmp_chardev_change calls chardev_new, which label
> is NULL when creating a new chardev. The label will be passed to
> yank_register_instance which causes a segment fault. The callchain
> is as the following:
>         chardev_new ->
>             qemu_char_open ->
>                 cc->open ->
>                 qmp_chardev_open_socket ->
>                     yank_register_instance
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> ---
>  chardev/char-socket.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index c8bced76b7..26d5172682 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>      }
>
> -    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)=
)
> {
> -        return;
> +    if (chr->label) {
> +        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label),
> errp)) {
> +            return;
> +        }
> +        s->registered_yank =3D true;
>      }
> -    s->registered_yank =3D true;
>
>      /* be isn't opened until we get a connection */
>      *be_opened =3D false
>

Looks wrong to me, the new chardev will get the same label, and it should
still be possible to call the yank functions then. The registration logic
needs to be reworked during chardev-change.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000081529d05bd97bd9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 15, 2021 at 9:22 PM Li =
Zhang &lt;<a href=3D"mailto:zhlcindy@gmail.com">zhlcindy@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Li =
Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com" target=3D"_blank">li.=
zhang@cloud.ionos.com</a>&gt;<br>
<br>
When executing the QMP commands &quot;chardev-change&quot; to change the<br=
>
backend device to socket, it will cause a segment fault because<br>
it assumes chr-&gt;label as non-NULL in function yank_register_instance.<br=
>
The function qmp_chardev_change calls chardev_new, which label<br>
is NULL when creating a new chardev. The label will be passed to<br>
yank_register_instance which causes a segment fault. The callchain<br>
is as the following:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chardev_new -&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_char_open -&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc-&gt;open -&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_chardev_open_so=
cket -&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_=
register_instance<br>
<br>
Signed-off-by: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com" tar=
get=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
---<br>
=C2=A0chardev/char-socket.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index c8bced76b7..26d5172682 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -1421,10 +1421,12 @@ static void qmp_chardev_open_socket(Chardev *chr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_set_feature(chr, QEMU_CHAR_FEATU=
RE_FD_PASS);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr-&gt;la=
bel), errp)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 if (chr-&gt;label) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!yank_register_instance(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label), errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;registered_yank =3D true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 s-&gt;registered_yank =3D true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* be isn&#39;t opened until we get a connection */<br>
=C2=A0 =C2=A0 =C2=A0*be_opened =3D false<br clear=3D"all"></blockquote><div=
><br></div><div>Looks wrong to me, the new chardev will get the same label,=
 and it should still be possible to call the yank functions then. The regis=
tration logic needs to be reworked during chardev-change.<br></div></div><b=
r>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<=
br></div></div>

--00000000000081529d05bd97bd9c--

