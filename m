Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0AD44E352
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 09:35:48 +0100 (CET)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlS2F-0006l8-HZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 03:35:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mlS0l-0005JE-Sl; Fri, 12 Nov 2021 03:34:15 -0500
Received: from [2a00:1450:4864:20::529] (port=37696
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mlS0k-0003Mo-5s; Fri, 12 Nov 2021 03:34:15 -0500
Received: by mail-ed1-x529.google.com with SMTP id f8so34923005edy.4;
 Fri, 12 Nov 2021 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L3nIHK4dZymNrDEdGJJgKuKTK5CWB8GpctHS/f2nfDA=;
 b=o4PuLFTChSHeWfCxE84RdsVOQkP7z0zQB3CpmSwzaM9xAsJroIWfmpJ4kFNlpeUU2a
 bsQ6FBqjUR4SJ4IJqCcL4jWvAN4/8xTo1Wj6v/+l77IQmBapIsEangLJ5dn7imPOVP69
 7IbAzJSkI2INt/1BHyLgquxgMtOHec2qDMe2ppVrZxz6P1a9oQB4alyYd9uKoelqjpw0
 vA9+wgLyMJEA97IpQ9Gws+IG0RlfbMKNhScC4dQ9c9lm2uL6d1JZsZeBO6Bq9cq99I9b
 Vm59TC3i4ZuP5EsjBKpRB406soXiaOmqREkMm0wuMp6QAZ+Gb9aUsTk9PkRtCg2ncrak
 OnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L3nIHK4dZymNrDEdGJJgKuKTK5CWB8GpctHS/f2nfDA=;
 b=vuYZMLbaNbtVUYxGKcfmK+R+T4mcR84bFR3qWh0HEV2lwlhbbr/p8E8sqjItAA5byc
 /qSibjJ1DyDXjy5Jml7Gsh/sSKOfendDuUfaHhARtTsgfn2W2oDMcmMedvNEbITQLF4A
 EIRaurOLaCA3tNKm6obq5Nt1FoXZDAcyn8XAlG8IZRLWvuXsC5gL3Hd+jSMbersWKiaU
 +XBH8gAd8wJt9gKgH6S/32Cc3mdsHSKyjAN7qKJ3jdtS1m2cdvFH8+7UA1ysPLZXHppP
 viw1/pCxHndgkbLPrcjsVJk1QY+LTsW0aveBonWH6p261Kk8wpQV897k7YuWtstm2E5E
 zy3Q==
X-Gm-Message-State: AOAM532ek4HfVYZtHLgMxYXOSG3GARu4pRlq9FbDXenxjM1m4/cTYxhI
 PbEgA+hifPfCYGYxBN6eBaiTsDwbDyJSiv7NEm96BtpV
X-Google-Smtp-Source: ABdhPJxdrfbVB4nv6y/gGd+13UL5RUQnInWlsD9xJU3CdUIXNYwjelfvBbsI8s7Po7hTbHnQxjStHsQ40o3fsP4S84Q=
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr16917974wrr.143.1636705708443; 
 Fri, 12 Nov 2021 00:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-4-rvkagan@yandex-team.ru>
In-Reply-To: <20211111153354.18807-4-rvkagan@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Nov 2021 12:28:16 +0400
Message-ID: <CAJ+F1CKj=S-XFQOqYFkgE=G7i_Sw1qV9LaM-UgwzQ4PFnv3s6g@mail.gmail.com>
Subject: Re: [PATCH 03/10] chardev/char-socket: tcp_chr_sync_read: don't
 clobber errno
To: Roman Kagan <rvkagan@yandex-team.ru>
Content-Type: multipart/alternative; boundary="0000000000005a8c4f05d0933e12"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005a8c4f05d0933e12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 7:36 PM Roman Kagan <rvkagan@yandex-team.ru> wrote:

> After the return from tcp_chr_recv, tcp_chr_sync_read calls into a
> function which eventually makes a system call and may clobber errno.
>
> Make a copy of errno right after tcp_chr_recv and restore the errno on
> return from tcp_chr_sync_read.
>
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char-socket.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 90054ce58c..cf7f2ba65a 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -581,6 +581,7 @@ static int tcp_chr_sync_read(Chardev *chr, const
> uint8_t *buf, int len)
>  {
>      SocketChardev *s =3D SOCKET_CHARDEV(chr);
>      int size;
> +    int saved_errno;
>
>      if (s->state !=3D TCP_CHARDEV_STATE_CONNECTED) {
>          return 0;
> @@ -588,6 +589,7 @@ static int tcp_chr_sync_read(Chardev *chr, const
> uint8_t *buf, int len)
>
>      qio_channel_set_blocking(s->ioc, true, NULL);
>      size =3D tcp_chr_recv(chr, (void *) buf, len);
> +    saved_errno =3D errno;
>      if (s->state !=3D TCP_CHARDEV_STATE_DISCONNECTED) {
>          qio_channel_set_blocking(s->ioc, false, NULL);
>      }
> @@ -596,6 +598,7 @@ static int tcp_chr_sync_read(Chardev *chr, const
> uint8_t *buf, int len)
>          tcp_chr_disconnect(chr);
>      }
>
> +    errno =3D saved_errno;
>      return size;
>  }
>
> --
> 2.33.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005a8c4f05d0933e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 11, 2021 at 7:36 PM Roman=
 Kagan &lt;<a href=3D"mailto:rvkagan@yandex-team.ru">rvkagan@yandex-team.ru=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
After the return from tcp_chr_recv, tcp_chr_sync_read calls into a<br>
function which eventually makes a system call and may clobber errno.<br>
<br>
Make a copy of errno right after tcp_chr_recv and restore the errno on<br>
return from tcp_chr_sync_read.<br>
<br>
Signed-off-by: Roman Kagan &lt;<a href=3D"mailto:rvkagan@yandex-team.ru" ta=
rget=3D"_blank">rvkagan@yandex-team.ru</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char-socket.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index 90054ce58c..cf7f2ba65a 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -581,6 +581,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_=
t *buf, int len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>
=C2=A0 =C2=A0 =C2=A0int size;<br>
+=C2=A0 =C2=A0 int saved_errno;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;state !=3D TCP_CHARDEV_STATE_CONNECTED) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
@@ -588,6 +589,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_=
t *buf, int len)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qio_channel_set_blocking(s-&gt;ioc, true, NULL);<br>
=C2=A0 =C2=A0 =C2=A0size =3D tcp_chr_recv(chr, (void *) buf, len);<br>
+=C2=A0 =C2=A0 saved_errno =3D errno;<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;state !=3D TCP_CHARDEV_STATE_DISCONNECTED) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_channel_set_blocking(s-&gt;ioc, false=
, NULL);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -596,6 +598,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_=
t *buf, int len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_disconnect(chr);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 errno =3D saved_errno;<br>
=C2=A0 =C2=A0 =C2=A0return size;<br>
=C2=A0}<br>
<br>
-- <br>
2.33.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005a8c4f05d0933e12--

