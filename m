Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1365B37E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 15:46:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCM3O-0000k2-7R; Mon, 02 Jan 2023 09:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pCM3H-0000jW-K9
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 09:44:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pCM36-0001iP-1a
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 09:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672670662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wO1z84+XEn3E7xKmLXcNMsvlf6CkK4s9VZgibUAdOUM=;
 b=Jl6qFb51bkoeuu3eLqMZDwydT8d7XOgrOzTqzMIU6oS22I/tXPxiEB9YOZuJ4Tl/XmVDU6
 qDQ2r79cIissvfUR7yG5rD9eFR+rT4idxHcpecP/dOmb0vvEW/kc6EEOhY51MozPhZqFZH
 cBwTT784+28m84MDcHOMz6M+ukakrGA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-6MkKB1tRMESDZW6DlaXFDw-1; Mon, 02 Jan 2023 09:44:21 -0500
X-MC-Unique: 6MkKB1tRMESDZW6DlaXFDw-1
Received: by mail-ed1-f71.google.com with SMTP id
 q10-20020a056402518a00b0048e5bc8cb74so1465802edd.5
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 06:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wO1z84+XEn3E7xKmLXcNMsvlf6CkK4s9VZgibUAdOUM=;
 b=BL3jNSJ5mCDPiuNQAp3S77qj550PknhSTRg2oaNpISRS4SNTIfxRny/iefH+AnUSg9
 lyYuCHk4edIEOmfYaclO1sK0HUxZB8cjlJF02ObrrliALGoiKNYTfbNKSiNfJ2b5Whzh
 cCQtdZWRFiAaiFML2oxE3fIkIoLtvDbFHyMOCiSBO4O8Nqn413Osj3N3HF8gipaCc2GX
 uEt96Hbgloerv7jU3alAPa0juzXZzhCiZBzspvCMoHzeX34S6v4uhlqSkcvVApMQ1qrB
 zqlGOz74+6DCFycV5o/FAzFWK3JfQ75HDcE7+swLn3oTEzHpH3mx6puZUjRf/4aIlsRD
 wCow==
X-Gm-Message-State: AFqh2kpsl49mOHROGRsh2eVoLmVY+20x/BiUQW68hQWosBW/FHfxNEhS
 dk+n9Hjj4d2rz6V7TO26S3tYLttuq8i3iGYQS/hZgFe0GgOKRjEl3OFLiR4dIv68tNPwuhD/OGO
 KENYkFX80jyrVvcLVvyAIzNWaAI9pjKk=
X-Received: by 2002:a17:907:1a56:b0:79a:101a:7e57 with SMTP id
 mf22-20020a1709071a5600b0079a101a7e57mr4314350ejc.368.1672670658947; 
 Mon, 02 Jan 2023 06:44:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuWiaXne48Rj/aljKxcR24fO9zgfGFGaaqsQraDAzVrlAT6e8SWdDoUydybkdRmkophAUUs5+4rW0+mHcM/riA=
X-Received: by 2002:a17:907:1a56:b0:79a:101a:7e57 with SMTP id
 mf22-20020a1709071a5600b0079a101a7e57mr4314347ejc.368.1672670658678; Mon, 02
 Jan 2023 06:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20221114132206.97081-1-marcandre.lureau@redhat.com>
In-Reply-To: <20221114132206.97081-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 2 Jan 2023 18:44:07 +0400
Message-ID: <CAMxuvazM5mRz4R9dRJTp6P0tdqTvsoHGaxdznZ-DsH_mQ=OaPQ@mail.gmail.com>
Subject: Re: [PATCH] ccid-card-emulated: fix cast warning
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com
Content-Type: multipart/alternative; boundary="0000000000006febd105f148fc20"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006febd105f148fc20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 5:22 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ../hw/usb/ccid-card-emulated.c: In function 'handle_apdu_thread':
> ../hw/usb/ccid-card-emulated.c:251:24: error: cast from pointer to intege=
r
> of different size [-Werror=3Dpointer-to-int-cast]
>   251 |                 assert((unsigned long)event > 1000);
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

ping


> ---
>  hw/usb/ccid-card-emulated.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
> index ee41a81801..c328660075 100644
> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -248,7 +248,7 @@ static void *handle_apdu_thread(void* arg)
>          WITH_QEMU_LOCK_GUARD(&card->vreader_mutex) {
>              while (!QSIMPLEQ_EMPTY(&card->guest_apdu_list)) {
>                  event =3D QSIMPLEQ_FIRST(&card->guest_apdu_list);
> -                assert((unsigned long)event > 1000);
> +                assert(event !=3D NULL);
>                  QSIMPLEQ_REMOVE_HEAD(&card->guest_apdu_list, entry);
>                  if (event->p.data.type !=3D EMUL_GUEST_APDU) {
>                      DPRINTF(card, 1, "unexpected message in
> handle_apdu_thread\n");
> --
> 2.38.1
>
>

--0000000000006febd105f148fc20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 14, 2022 at 5:22 PM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
../hw/usb/ccid-card-emulated.c: In function &#39;handle_apdu_thread&#39;:<b=
r>
../hw/usb/ccid-card-emulated.c:251:24: error: cast from pointer to integer =
of different size [-Werror=3Dpointer-to-int-cast]<br>
=C2=A0 251 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=
ssert((unsigned long)event &gt; 1000);<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bl=
ockquote><div><br></div><div>ping</div><div>=C2=A0<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/usb/ccid-card-emulated.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c<br>
index ee41a81801..c328660075 100644<br>
--- a/hw/usb/ccid-card-emulated.c<br>
+++ b/hw/usb/ccid-card-emulated.c<br>
@@ -248,7 +248,7 @@ static void *handle_apdu_thread(void* arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_QEMU_LOCK_GUARD(&amp;card-&gt;vreade=
r_mutex) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (!QSIMPLEQ_EMPTY(&amp=
;card-&gt;guest_apdu_list)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D QSI=
MPLEQ_FIRST(&amp;card-&gt;guest_apdu_list);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert((unsigned l=
ong)event &gt; 1000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(event !=3D =
NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QSIMPLEQ_REMO=
VE_HEAD(&amp;card-&gt;guest_apdu_list, entry);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (event-&gt=
;p.data.type !=3D EMUL_GUEST_APDU) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DPRINTF(card, 1, &quot;unexpected message in handle_apdu_thread\n&quot;)=
;<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div></div>

--0000000000006febd105f148fc20--


