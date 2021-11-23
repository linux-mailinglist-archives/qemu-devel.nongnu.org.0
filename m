Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AD745A3DF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:36:12 +0100 (CET)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpVxy-0000vv-La
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:36:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mpVt6-0006ul-PM
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:31:08 -0500
Received: from [2a00:1450:4864:20::42a] (port=40462
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mpVt1-0001Ls-UF
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:31:08 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r8so38916238wra.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lU0tq5ALFM3S1rLOtkmUzuIr7oX82LMYwFJMeLbxWzk=;
 b=I7xqtSdSF5wfoi3ZGSlZihrQRwNyNLutRt9Mh/aL0JK0cmL2ihg9ZGumyXRBXGNt7+
 SI7i0tcG1ByciOgPrWoksv7vL1SKejkmF4xk+3iwdtkZX9/Xf8fVe5qCNnwosq4vZonV
 FxhH9+5mohwpamfatPJoJ9/KVALqYX0u7PdM6ksZeHQy60qVkAPja17Lf+IwW2ypHp9I
 kaBxnpAFaoKoviptmD+fR6sa6XgoUM7cpzuGFlqRcuBGVzLnVzVF8Uh4Adn962U4u92b
 QtAWj5JTeStlo8G4dA4lqS5hEvDYALPGynxVeDJ9umbrXm4w82SEgb0YaDxKLEk101Kp
 uW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lU0tq5ALFM3S1rLOtkmUzuIr7oX82LMYwFJMeLbxWzk=;
 b=cZ25dgHIILwaGx/z0D+MXCl/g/Y3vjQpXwp9SEoUK7U4bGd6cCweyIdXQlwHANExM/
 HeWaqoGln0Q85dWQJ92TaQ5wc+DK084fIpNbkxDlGtzxi1ZdKDqQ8qq8XEO/aJCTsXAd
 ronBazWoStB52xXW0XXF4iLFtq7Suy3WQ0IOOdVJQzyBuplbpnoZtCv5VN5wIZwSxm82
 CLd3rjL4yOyC//t3Fs//L6zSy1XawMyK9AjbTIHLx7TVxh26St7j1Ra/8elvDaqPrGRr
 A3zeK+DGakbDgKKzGo4bVh6hM1tLZ5MhY9n7sRpuBPuGZIRcRfUG0SgUuzcorLX1tFwi
 2jUA==
X-Gm-Message-State: AOAM531W4C3/CVECDvbgbvPNFl8h2wmJAjZVLAgbuwgzurTR/kY9mkKh
 yM5raN0lfv/icqjpCwNnfSZzM+OoayCIVl0ITxI=
X-Google-Smtp-Source: ABdhPJxBySm54AZLQGJ64I36vfl+CCmndfRukhMAQNEHDgKfKDQ/j4vubTYPCgJQISZc+a1xnnN1VAgFSxMrnJVG6CU=
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr7545742wrs.374.1637674261877; 
 Tue, 23 Nov 2021 05:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20211123130915.390848-1-pbonzini@redhat.com>
In-Reply-To: <20211123130915.390848-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 23 Nov 2021 17:30:49 +0400
Message-ID: <CAJ+F1CLGHEo4+seD0dMXKRKOfx8Ti1GF35hQwzjxPQ66c0F=XQ@mail.gmail.com>
Subject: Re: [PATCH] chardev: delete QemuOpts when a chardev is removed
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a318de05d174c03f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a318de05d174c03f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 5:11 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> QEMU cannot add a chardev with the same id as a previously unplugged
> device.
> The root cause of this issue is that the QemuOpts is still registered,
> causing qemu_opts_create to fail.  Remove the QemuOpts when a character
> device is removed.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 0169d8dde4..d46b307830 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -277,6 +277,20 @@ static void char_init(Object *obj)
>
>  }
>
> +static void chr_unparent(Object *obj)
> +{
> +    const char *id;
> +    QemuOpts *opts;
> +
> +    if (obj->parent =3D=3D get_chardevs_root()) {
> +        id =3D object_get_canonical_path_component(obj);
> +        opts =3D qemu_opts_find(qemu_find_opts("chardev"), id);
> +        if (opts) {
> +            qemu_opts_del(opts);
> +        }
> +    }
> +}
> +
>  static int null_chr_write(Chardev *chr, const uint8_t *buf, int len)
>  {
>      return len;
> @@ -286,6 +300,7 @@ static void char_class_init(ObjectClass *oc, void
> *data)
>  {
>      ChardevClass *cc =3D CHARDEV_CLASS(oc);
>
> +    oc->unparent =3D chr_unparent;
>      cc->chr_write =3D null_chr_write;
>      cc->chr_be_event =3D chr_be_event;
>  }
> --
> 2.33.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a318de05d174c03f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 23, 2021 at 5:11 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">QEMU=
 cannot add a chardev with the same id as a previously unplugged device.<br=
>
The root cause of this issue is that the QemuOpts is still registered,<br>
causing qemu_opts_create to fail.=C2=A0 Remove the QemuOpts when a characte=
r<br>
device is removed.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char.c | 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 0169d8dde4..d46b307830 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -277,6 +277,20 @@ static void char_init(Object *obj)<br>
<br>
=C2=A0}<br>
<br>
+static void chr_unparent(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 const char *id;<br>
+=C2=A0 =C2=A0 QemuOpts *opts;<br>
+<br>
+=C2=A0 =C2=A0 if (obj-&gt;parent =3D=3D get_chardevs_root()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 id =3D object_get_canonical_path_component(obj=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 opts =3D qemu_opts_find(qemu_find_opts(&quot;c=
hardev&quot;), id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (opts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_del(opts);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static int null_chr_write(Chardev *chr, const uint8_t *buf, int len)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return len;<br>
@@ -286,6 +300,7 @@ static void char_class_init(ObjectClass *oc, void *data=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ChardevClass *cc =3D CHARDEV_CLASS(oc);<br>
<br>
+=C2=A0 =C2=A0 oc-&gt;unparent =3D chr_unparent;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_write =3D null_chr_write;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_be_event =3D chr_be_event;<br>
=C2=A0}<br>
-- <br>
2.33.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a318de05d174c03f--

