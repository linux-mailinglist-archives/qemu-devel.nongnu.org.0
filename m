Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B852CED20
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:37:11 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9Og-0002qr-MM
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9MM-0001Ez-Cf
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:34:47 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9MI-0003AY-61
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:34:45 -0500
Received: by mail-ed1-x543.google.com with SMTP id ck29so5463672edb.8
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEONu3zEs/SygpUTtJeawdSid2+X0mD/5YIIaB5uVbo=;
 b=HKOsUJ+xDOhMd9JQ5TDPEcFnmWDrB9GNODv//9V6eIsW1aYpqcvjHXSVqvz8xil6pU
 9VPqrOscBS8ikWkWfEFb0gQpZxPpd/7CFPMvYP32Pvs5jb5aLGCoGHKIOiCRPhFF0Z+p
 /ymXoJm8cLXDDJAuMir3AxreEX4Lsp7ojb2w41x1g9aDQuMJDvs2WT0Q316k5eMomi/H
 oii2/1JsUWT7pkUfDudY8BDVfOpuxDyZtBArz7ugCB6+F/tZGbIVrQ2q1BAhCcF8n7w5
 hoEj+qRrq3waUxR1a+52D1KQGwDbG/nF6A7IaWoBqdphDlsnH5BeWX4v6w+D+uqa81VI
 mm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEONu3zEs/SygpUTtJeawdSid2+X0mD/5YIIaB5uVbo=;
 b=pUAiX4m/5XDZ6kImzkbTbIIXX5th9ezARyAxeTDtLY4apkxZwIBvpzdznYgsSYlBM/
 dWZqr0IUGUfMY8nH/l6OcssmtLWBmd+f+iZN+5nbtW6Jd5qcIgfJTs2kbltTPfdED/cP
 /N7H+51wSh4Pu24kJ3DqyKJi/9pw5RH5XV3sRvzssE1zONQwvQ+9xWOXSoVgHf+HBsTB
 CDmeSoNqvSNxgd0VWaDcwe9bTC6npChr3EjkzTdJPncNtZa32kxoCbGuzcIo5wcqnndN
 MBe2hBBq5/VmEGjV9tQJNGFk329RtKACOKCE+pjU9+Qwv8GCIyJT8f/TfO119dVjQnI4
 eVKw==
X-Gm-Message-State: AOAM531+4tZ18A72iqGOu96P0O/2kdq/vyYnO9niP8ZRfsaVGm2Khuhb
 7tPB+lCfSLK6PNffohhmp6V8PySVGtFJFXoQ7WY=
X-Google-Smtp-Source: ABdhPJyBPJqg2+e0T9LNC22pxO47YC0bTBVj57EErpRkaGcDpQpP1lBW3rAtwo0rNqZoScV5qOTnwLZolNXQ9cxp2qc=
X-Received: by 2002:a50:a245:: with SMTP id 63mr7009740edl.314.1607081680156; 
 Fri, 04 Dec 2020 03:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-6-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-6-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 15:34:28 +0400
Message-ID: <CAJ+F1CLoj7wjmiBT6v1pQ2zU=YWdhKdkSZkZMT=KGhSu7KB0=g@mail.gmail.com>
Subject: Re: [PATCH 5/9] vnc: add pseudo encodings
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000abbbc705b5a1dc96"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000abbbc705b5a1dc96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 3, 2020 at 3:15 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Add #defines for two new pseudo encodings:
>  * cursor with alpha channel.
>  * extended desktop resize.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

It might be worth documenting somewhere where those values come from.

My understanding is that the official document is
https://tools.ietf.org/html/rfc6143, and the community maintained version
is https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/vnc.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index a7fd38a82075..6f5006da3593 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -411,6 +411,8 @@ enum {
>  #define VNC_ENCODING_AUDIO                0XFFFFFEFD /* -259 */
>  #define VNC_ENCODING_TIGHT_PNG            0xFFFFFEFC /* -260 */
>  #define VNC_ENCODING_LED_STATE            0XFFFFFEFB /* -261 */
> +#define VNC_ENCODING_DESKTOP_RESIZE_EXT   0XFFFFFECC /* -308 */
> +#define VNC_ENCODING_ALPHA_CURSOR         0XFFFFFEC6 /* -314 */
>  #define VNC_ENCODING_WMVi                 0x574D5669
>
>
>  /***********************************************************************=
******
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000abbbc705b5a1dc96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:15 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add #defi=
nes for two new pseudo encodings:<br>
=C2=A0* cursor with alpha channel.<br>
=C2=A0* extended desktop resize.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
It might be worth documenting somewhere where those values come from.</div>=
<div><br></div><div>My understanding is that the official document is <a hr=
ef=3D"https://tools.ietf.org/html/rfc6143">https://tools.ietf.org/html/rfc6=
143</a>, and the community maintained version is <a href=3D"https://github.=
com/rfbproto/rfbproto/blob/master/rfbproto.rst">https://github.com/rfbproto=
/rfbproto/blob/master/rfbproto.rst</a></div><div><br></div><div>Reviewed-by=
: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com"=
>marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vnc.h | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/ui/vnc.h b/ui/vnc.h<br>
index a7fd38a82075..6f5006da3593 100644<br>
--- a/ui/vnc.h<br>
+++ b/ui/vnc.h<br>
@@ -411,6 +411,8 @@ enum {<br>
=C2=A0#define VNC_ENCODING_AUDIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0XFFFFFEFD /* -259 */<br>
=C2=A0#define VNC_ENCODING_TIGHT_PNG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0xFFFFFEFC /* -260 */<br>
=C2=A0#define VNC_ENCODING_LED_STATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0XFFFFFEFB /* -261 */<br>
+#define VNC_ENCODING_DESKTOP_RESIZE_EXT=C2=A0 =C2=A00XFFFFFECC /* -308 */<=
br>
+#define VNC_ENCODING_ALPHA_CURSOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00XFFFFF=
EC6 /* -314 */<br>
=C2=A0#define VNC_ENCODING_WMVi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x574D5669<br>
<br>
=C2=A0/********************************************************************=
*********<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000abbbc705b5a1dc96--

