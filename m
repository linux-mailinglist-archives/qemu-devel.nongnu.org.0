Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1103374ABF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:42:24 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePHj-000495-Pc
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leP3V-0002zG-N6; Wed, 05 May 2021 17:27:41 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leP3U-000500-1e; Wed, 05 May 2021 17:27:41 -0400
Received: by mail-ej1-x635.google.com with SMTP id gx5so5050853ejb.11;
 Wed, 05 May 2021 14:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dXBkKKd+m6tu8qUnC9WZa5slYUNEIVTt4LsyJPz79YE=;
 b=Jy+G/COwEoalNAdnZZJ+/lREXcNTIhFU+een1rGJnffdQX63shkJ4DvpKofx0FpcAx
 W8yvF67+osf47gythctVciIK/YrgJmk8kKFzWHEo4SvGba1R4yGku+OU/p4j9fR074O8
 7XQfczKJlTdvXorCEWzAZFYe75IW1/kiCj/TLidsB1zBtZWgpICfkEW5GRoTgzptJfrY
 8MMY638HsUcpK0jSYhNnury1/TYiysT8q3Dt4xjtFmPuxj9rKGLwoYnsZdRFqjWQUWMx
 k6HB/UuI8Ca+cXpQeM0AZmekHWp/roMIxwn3ExklclojOSE3uVjY3oHYrgb+SVtQS0No
 Wirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dXBkKKd+m6tu8qUnC9WZa5slYUNEIVTt4LsyJPz79YE=;
 b=KsyvlOYQl7wHiZ5yTfqtmyL7nNXul3zIz1Mt70ctVGx2naYJV0AL4568rHuvufrqcz
 OIV+5lwYybUC614Q8WxQMlCMsRGt1iRuNYEMIEzZvVY80VSCV+vknEhUGwvnm1OrFqfe
 sqRCJGAzp0nrv69FChJnh/wKFaew5y9sS3AQfGzysPksVb6gMgNzyHGD7+bVnZC7aeqs
 S6CB3tt/Z/EoJktokNnt2+MwkbIW4sGokoSKauA94+G4wlOjiTvLPvCp9N6jInkI/Vxi
 AuY+kjOPcOWVT14O+25AYRFsOBVRm0EUMhXEA4ZTMjXyx52s6NT0Ouqe/3pGWvZWZIXU
 HCdg==
X-Gm-Message-State: AOAM533sditY6+NR6laK/MraRCFFUX/Xe1K6fu1S4pdAOB2s+/Qq+2E7
 f/+hHM81y9045X+ohgJqhsxojf506BbpwmXB4JPeqOgDg9g=
X-Google-Smtp-Source: ABdhPJyJpmt3CbSHS67kNtc6MvGj0zO51nIM9zwOCIOIvm2GWOSvU6gU3Ydoy5x6eSV0Jsc7FApfJSYSUrfGIsku+yc=
X-Received: by 2002:a17:906:7e51:: with SMTP id
 z17mr839225ejr.92.1620250057369; 
 Wed, 05 May 2021 14:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-4-philmd@redhat.com>
In-Reply-To: <20210505211047.1496765-4-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 May 2021 01:27:25 +0400
Message-ID: <CAJ+F1C+TE-RsG+S5KUYAh5Hc6AUHKa2w9-Ug8GPvKZpsqCGu8A@mail.gmail.com>
Subject: Re: [PATCH 03/23] chardev/baum: Use definitions to avoid dynamic
 stack allocation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001deb9305c19bddc4"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001deb9305c19bddc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 1:14 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> We know 'x * y' will be at most 'X_MAX * Y_MAX' (which is not
> a big value, it is actually 84). Instead of having the compiler
> use variable-length array, declare an array able to hold the
> maximum 'x * y'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/baum.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/chardev/baum.c b/chardev/baum.c
> index adc3d7b3b56..0822e9ed5f3 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -383,9 +383,9 @@ static int baum_eat_packet(BaumChardev *baum, const
> uint8_t *buf, int len)
>      switch (req) {
>      case BAUM_REQ_DisplayData:
>      {
> -        uint8_t cells[baum->x * baum->y], c;
> -        uint8_t text[baum->x * baum->y];
> -        uint8_t zero[baum->x * baum->y];
> +        uint8_t cells[X_MAX * Y_MAX], c;
> +        uint8_t text[X_MAX * Y_MAX];
> +        uint8_t zero[X_MAX * Y_MAX];
>          int cursor =3D BRLAPI_CURSOR_OFF;
>          int i;
>
> @@ -408,7 +408,7 @@ static int baum_eat_packet(BaumChardev *baum, const
> uint8_t *buf, int len)
>          }
>          timer_del(baum->cellCount_timer);
>
> -        memset(zero, 0, sizeof(zero));
> +        memset(zero, 0, baum->x * baum->y);
>

eh, I would have left the sizeof(zero)..


>          brlapi_writeArguments_t wa =3D {
>              .displayNumber =3D BRLAPI_DISPLAY_DEFAULT,
> --
> 2.26.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001deb9305c19bddc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 1:14 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_b=
lank">philmd@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">We know &#39;x * y&#39; will be at most &#39;X_MAX *=
 Y_MAX&#39; (which is not<br>
a big value, it is actually 84). Instead of having the compiler<br>
use variable-length array, declare an array able to hold the<br>
maximum &#39;x * y&#39;.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>=
&gt;</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
---<br>
=C2=A0chardev/baum.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/chardev/baum.c b/chardev/baum.c<br>
index adc3d7b3b56..0822e9ed5f3 100644<br>
--- a/chardev/baum.c<br>
+++ b/chardev/baum.c<br>
@@ -383,9 +383,9 @@ static int baum_eat_packet(BaumChardev *baum, const uin=
t8_t *buf, int len)<br>
=C2=A0 =C2=A0 =C2=A0switch (req) {<br>
=C2=A0 =C2=A0 =C2=A0case BAUM_REQ_DisplayData:<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t cells[baum-&gt;x * baum-&gt;y], c;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t text[baum-&gt;x * baum-&gt;y];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t zero[baum-&gt;x * baum-&gt;y];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t cells[X_MAX * Y_MAX], c;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t text[X_MAX * Y_MAX];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t zero[X_MAX * Y_MAX];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cursor =3D BRLAPI_CURSOR_OFF;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
@@ -408,7 +408,7 @@ static int baum_eat_packet(BaumChardev *baum, const uin=
t8_t *buf, int len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_del(baum-&gt;cellCount_timer);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(zero, 0, sizeof(zero));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(zero, 0, baum-&gt;x * baum-&gt;y);<br><=
/blockquote><div><br></div><div>eh, I would have left the sizeof(zero)..</d=
iv><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0brlapi_writeArguments_t wa =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.displayNumber =3D BRLAPI_D=
ISPLAY_DEFAULT,<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000001deb9305c19bddc4--

