Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D71374AC1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:44:21 +0200 (CEST)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePJc-0006Ap-Dh
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leP5L-0006At-AF; Wed, 05 May 2021 17:29:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leP5G-00061R-QC; Wed, 05 May 2021 17:29:34 -0400
Received: by mail-ej1-x629.google.com with SMTP id f24so5081974ejc.6;
 Wed, 05 May 2021 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k4s4sl2YG0PlCYw6VyRUyQSybnnnjiOcUXnTUhSKQ0Y=;
 b=XQG8ycJn0wKxDMRqifyAzSoNlzV1Y2U6h59MKCMEnsMY1J3Y+bOs8MpFP5dpOkq2R1
 fKjnbappEsbC4U4dAvRzz0TpfU6dHcJXKo0MkiDp5KFMMv4szSn7FUJ98gm000Wb/UOa
 h6meMfSCbmirhxhueq47nyjmzghjZ0MrVUKJuzgI7kbvhr8vIsCyiHHJUvSMN0xM/05k
 735fOpV/8dUniQl4jzW/Rw01KBxoUjtBR81Y6Md9C2iB5RaAVtX1Wx6Wh1ioCiTqMC/a
 NHshXWgNTN7apxlnVodq6gwczEYdDivgl+CvcNme/5W80t2+I2wpm+jQkiyrHMtV0vn4
 jrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k4s4sl2YG0PlCYw6VyRUyQSybnnnjiOcUXnTUhSKQ0Y=;
 b=ikfsW0JGWg0vBQuY0cMkzXHPG+2oCs38gXEQA1HmO5uBrkYEyEMSlyn/KUVuxCyKZQ
 Z6JE0seZTrl3AT5U1Yq6J9FYT0SYE1MMbZx7KRufXBMurXZvJfU0RXoUizdPWsaeIjeZ
 A44jBBzHK/sqgevsovXl/4eO26ck4a03ITbfqTvFPzH9XCxcbk6M0/4nxMG7VDvGgMEH
 KWXzNxCzc37J1IwD3+9rrJ33UC3/3sYEDk807vaUXhDenMzSdT738B6EnzRK+eLvdUox
 w7LEzIkAbk6jv3dQklZf8MvlL4MqBhcEhJ2V8oUJcUA+080WBBDLh0OFAp+7zyOgyP3U
 cR9Q==
X-Gm-Message-State: AOAM532gsyTr4LXPToZeH3qsKHJ0uwFvZpdHZPMT531NcLvta0fFCF14
 ZZR8DXzKhx7kjsIz1znXHsz2fU82zY7z6U4ZzqU=
X-Google-Smtp-Source: ABdhPJxlbM5uTLgeniyvrqeggAd42PTch6tujbkBzgE8HVrsyQrLq8sd3iiC+6zCdMVXH2YdGitiuSMdqCTBbUJGAiE=
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr779302ejs.105.1620250168520; 
 Wed, 05 May 2021 14:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-5-philmd@redhat.com>
In-Reply-To: <20210505211047.1496765-5-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 May 2021 01:29:16 +0400
Message-ID: <CAJ+F1CLe9vPf39U3mmBsWwEOgLPApnQaO0BrjC_9sNKEQBrEmQ@mail.gmail.com>
Subject: Re: [PATCH 04/23] chardev/baum: Avoid dynamic stack allocation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bdf30605c19be3c8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x629.google.com
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

--000000000000bdf30605c19be3c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 1:15 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Use autofree heap allocation instead of variable-length
> array on the stack.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/baum.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/baum.c b/chardev/baum.c
> index 0822e9ed5f3..bc09cda3471 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -299,7 +299,8 @@ static void baum_chr_accept_input(struct Chardev *chr=
)
>  static void baum_write_packet(BaumChardev *baum, const uint8_t *buf, int
> len)
>  {
>      Chardev *chr =3D CHARDEV(baum);
> -    uint8_t io_buf[1 + 2 * len], *cur =3D io_buf;
> +    g_autofree uint8_t *io_buf =3D g_malloc(1 + 2 * len);
>

fwiw, for non-bottleneck code, I would simply use g_malloc0() everywhere,
ymmv

+    uint8_t *cur =3D io_buf;
>      int room;
>      *cur++ =3D ESC;
>      while (len--)
> --
> 2.26.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bdf30605c19be3c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 1:15 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Use autofree heap allocation instead of variable-length<br>
array on the stack.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/baum.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/chardev/baum.c b/chardev/baum.c<br>
index 0822e9ed5f3..bc09cda3471 100644<br>
--- a/chardev/baum.c<br>
+++ b/chardev/baum.c<br>
@@ -299,7 +299,8 @@ static void baum_chr_accept_input(struct Chardev *chr)<=
br>
=C2=A0static void baum_write_packet(BaumChardev *baum, const uint8_t *buf, =
int len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr =3D CHARDEV(baum);<br>
-=C2=A0 =C2=A0 uint8_t io_buf[1 + 2 * len], *cur =3D io_buf;<br>
+=C2=A0 =C2=A0 g_autofree uint8_t *io_buf =3D g_malloc(1 + 2 * len);<br></b=
lockquote><div><br></div><div>fwiw, for non-bottleneck code, I would simply=
 use g_malloc0() everywhere, ymmv</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 uint8_t *cur =3D io_buf;<br>
=C2=A0 =C2=A0 =C2=A0int room;<br>
=C2=A0 =C2=A0 =C2=A0*cur++ =3D ESC;<br>
=C2=A0 =C2=A0 =C2=A0while (len--)<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bdf30605c19be3c8--

