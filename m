Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EC6B3609
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 06:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paVBH-00079V-0H; Fri, 10 Mar 2023 00:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1paVBE-000764-Me
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 00:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1paVBD-00013N-1d
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 00:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678425634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2qBulGpGEmDN8lf/yUX657O/3r8KOkFgMxBOIILNYsE=;
 b=CwDRyL1PEGbsCMOZeeyP6GwOjPSFYAsfcKpimqdw95fKqepehrNxg3J+fD9zC49WQu2mgR
 Y0kapEhxUBqsPtWX+xiiqcDSHqTl5rIgppUndGCbPEIPlxg+315Srj3dZJSVBW2uSoGx2c
 7sk0im7LKXX7Atf1oXOZY+Ng3SnfPvE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-rcbmKRw0POm7yvQ5vunDUg-1; Fri, 10 Mar 2023 00:20:32 -0500
X-MC-Unique: rcbmKRw0POm7yvQ5vunDUg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z14-20020a05640235ce00b004e07ddbc2f8so5963168edc.7
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 21:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678425630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2qBulGpGEmDN8lf/yUX657O/3r8KOkFgMxBOIILNYsE=;
 b=EtNr4hHOycI8yUZ0LnBfRLExaYib8+S+WJFioDtyjLEwfRgsfJ57LO+fW0M0n0PT4F
 qo68jhn4z7ZKzmEF8owGUimy0zkc4JDQfcbdzqIr+o0KqgfQi+UgOyyxjjZrDplI9eJ5
 nxC+v4OuW6ZyiVY/WyaNN9wHcSurRb/+7VjeJw3GA4yJfhfjKEwiRIJUwKtMgxr4QvvZ
 mAKw8bTkGNDgwyX8GUBSobhu9K0/4aY2obdQxNawh0bW3JLsayAbfjK++B2r5u0Ai2n+
 SpHBiu28rKdKSu+Kjc4G+ODDlscgat7PnM/dhLzMdY02igMduQpNVEwY24UVEJGIgBDP
 dT1w==
X-Gm-Message-State: AO0yUKUlzW7nCdLI/CyqMlKad7KKwdkNI0/5BUqQECHG94ctsViZpend
 ZSkLIzGELMKJrFTVX37TQFDiMS/zMqaxuiP+9SzDJl7i4ZxR20FvpAD3ORvif5TUVEkwTpYjbRU
 Ov/HGcL+m2EKCfkaWQxKxgTymJldTU/EpBlV8W8FfUA==
X-Received: by 2002:a17:906:d041:b0:8b1:3298:c587 with SMTP id
 bo1-20020a170906d04100b008b13298c587mr12470857ejb.2.1678425630471; 
 Thu, 09 Mar 2023 21:20:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/qZ7RY8Q20fHBgVvORxwv1TsP263skSmPSJ5bWLQned7n0VcnWxXBohLcrxzyK7pafyRBWaq8Gm15LNO6zAgc=
X-Received: by 2002:a17:906:d041:b0:8b1:3298:c587 with SMTP id
 bo1-20020a170906d04100b008b13298c587mr12470851ejb.2.1678425630226; Thu, 09
 Mar 2023 21:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20230308162548.1766359-1-dhobsong@igel.co.jp>
 <20230308162548.1766359-2-dhobsong@igel.co.jp>
In-Reply-To: <20230308162548.1766359-2-dhobsong@igel.co.jp>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 10 Mar 2023 09:20:18 +0400
Message-ID: <CAMxuvaxej1ALDJy4jJvf8D8TucbW3ZNWNo3o1E0Bys3PdAaGMA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] gtk: Make sure widget is realized before updating
To: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, mst@redhat.com
Content-Type: multipart/alternative; boundary="00000000000078d18a05f684eb3b"
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

--00000000000078d18a05f684eb3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 8:26=E2=80=AFPM Damian Hobson-Garcia <dhobsong@igel.=
co.jp>
wrote:

> Check that a widget has a window before trying
> to update its contents.
> ---
>  ui/gtk.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index fd82e9b1ca..e4e0980323 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -340,6 +340,10 @@ static void gd_update_full_redraw(VirtualConsole *vc=
)
>  {
>      GtkWidget *area =3D vc->gfx.drawing_area;
>      int ww, wh;
> +
> +    if (!gtk_widget_get_realized(area)) {
> +        return;
> +    }
>      ww =3D gdk_window_get_width(gtk_widget_get_window(area));
>      wh =3D gdk_window_get_height(gtk_widget_get_window(area));
>  #if defined(CONFIG_OPENGL)
> --
> 2.25.1
>
>

--00000000000078d18a05f684eb3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 8, 2023 at 8:26=E2=80=AFP=
M Damian Hobson-Garcia &lt;<a href=3D"mailto:dhobsong@igel.co.jp">dhobsong@=
igel.co.jp</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Check that a widget has a window before trying<br>
to update its contents.<br>
---<br>
=C2=A0ui/gtk.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br></blockquote><div><br></div><div>R=
eviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@r=
edhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index fd82e9b1ca..e4e0980323 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -340,6 +340,10 @@ static void gd_update_full_redraw(VirtualConsole *vc)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GtkWidget *area =3D vc-&gt;gfx.drawing_area;<br>
=C2=A0 =C2=A0 =C2=A0int ww, wh;<br>
+<br>
+=C2=A0 =C2=A0 if (!gtk_widget_get_realized(area)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0ww =3D gdk_window_get_width(gtk_widget_get_window(area)=
);<br>
=C2=A0 =C2=A0 =C2=A0wh =3D gdk_window_get_height(gtk_widget_get_window(area=
));<br>
=C2=A0#if defined(CONFIG_OPENGL)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000078d18a05f684eb3b--


