Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB73D1F43
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:48:48 +0200 (CEST)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6TRn-00048K-LL
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6TQr-0003TE-6f
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:47:49 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6TQp-0005VE-IF
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:47:48 -0400
Received: by mail-ej1-x636.google.com with SMTP id go30so7023152ejc.8
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTYcjMI8xwAVlb53vxrvMzKRwj2B80ait8IMUQI1aQE=;
 b=jmbWxZ0FHipjwBqu1t7TcDidmGOFumfRNgh2IGiALKdQbb0AUaCErppzUyvvFX+K69
 rrVIklQlhupNBhpy7T6Yyk9Zvk8B2W1iAC3OPKWc/CVEpv2Lf/xbV9nL7xHthgijXfb8
 mDqYqiZ7Udqp5M/Od4Ms1IKaJhJDM932QHDLfDHW27MyNaN0LClT/LXfHAi8fVza+K0G
 KHu02YjAfOpVUsH2WOu6RoJLiKkOD+Yt6PipCyh1+1L4Z587zCfWrbUKliqGp01GyRB2
 OKqJPS/pE2Zied6h5q3S4NXTn3ouU/mtqUt0GlvhBdVGpikxx3iaDX7jzTTTALZovw1q
 7oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTYcjMI8xwAVlb53vxrvMzKRwj2B80ait8IMUQI1aQE=;
 b=cgo03UsXUjWePl9pyL0Snu3TzdblVvBhSAcx3ZBQVqZVNdi2uofHSf85Au+NTaD78L
 Wc8kKX6WUaVBCruxSKNiHQSM9ri7EL/jRuIwDGHVypQoCth6FwssUynVbT1l/uh3ea1h
 VvyaFiIbZPtiF5gvbpIQW16yETt4MXtHxzl2LTwTZLTI8SqZyQ1l8jBALtimY7AaROOC
 T19opTU0RCBv03ZC/O4ofa9+1DIpTGDY6tBJx2HSIPK36i0ZTV6cW76iyfnkEVgKa/3P
 kF3oCdRsHKP9j6O36PHV1X+vumlM6Fv/FbQvjMtrAtTbF6o4EnuSxRwIEhVQMt1Mvhw2
 dHFw==
X-Gm-Message-State: AOAM533VbbJ2eWC/EwJQ/4gRvHby6TFT7qd7GKJsRkT8B/R+XxJ29Ivu
 8iEVfp4C7KHLh6tRr95f3RmfJywqtL8sYIbHWGk=
X-Google-Smtp-Source: ABdhPJx0HFtiQAZhi9NQnTwyyLjCcgFkV+1xZWbzk7Yakdl6+M7h+XJlUgnYrWHwzulounxBojm4YtzfU23wr41qXYY=
X-Received: by 2002:a17:906:c013:: with SMTP id
 e19mr35059882ejz.389.1626940060329; 
 Thu, 22 Jul 2021 00:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210722072756.647673-1-kraxel@redhat.com>
In-Reply-To: <20210722072756.647673-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Jul 2021 11:47:28 +0400
Message-ID: <CAJ+F1CKmca2qdiJm3t-g7cwSv0p4kRRQw4YCgJvP_r11pnQOVA@mail.gmail.com>
Subject: Re: [PATCH] usbredir: fix free call
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005de8cc05c7b18067"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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

--0000000000005de8cc05c7b18067
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 22, 2021 at 11:28 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> data might point into the middle of a larger buffer, there is a separate
> free_on_destroy pointer passed into bufp_alloc() to handle that.  It is
> only used in the normal workflow though, not when dropping packets due
> to the queue being full.  Fix that.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/491
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/usb/redirect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 4ec9326e0582..1ec909a63a80 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t
> *data, uint16_t len,
>      if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
>          if (dev->endpoint[EP2I(ep)].bufpq_size >
>                  dev->endpoint[EP2I(ep)].bufpq_target_size) {
> -            free(data);
> +            free(free_on_destroy);
>              return -1;
>          }
>          dev->endpoint[EP2I(ep)].bufpq_dropping_packets =3D 0;
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005de8cc05c7b18067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 11:28 AM Ge=
rd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">data =
might point into the middle of a larger buffer, there is a separate<br>
free_on_destroy pointer passed into bufp_alloc() to handle that.=C2=A0 It i=
s<br>
only used in the normal workflow though, not when dropping packets due<br>
to the queue being full.=C2=A0 Fix that.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/491" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/491</a><br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/usb/redirect.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c<br>
index 4ec9326e0582..1ec909a63a80 100644<br>
--- a/hw/usb/redirect.c<br>
+++ b/hw/usb/redirect.c<br>
@@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *dat=
a, uint16_t len,<br>
=C2=A0 =C2=A0 =C2=A0if (dev-&gt;endpoint[EP2I(ep)].bufpq_dropping_packets) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dev-&gt;endpoint[EP2I(ep)].bufpq_size=
 &gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;endpo=
int[EP2I(ep)].bufpq_target_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(free_on_destroy);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;endpoint[EP2I(ep)].bufpq_dropping=
_packets =3D 0;<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005de8cc05c7b18067--

