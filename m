Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF82F3302
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:35:41 +0100 (CET)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKlo-0008WR-H8
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kzKfM-0004jK-Bi
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:29:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kzKfI-00040G-Ng
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610461733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxUgJpYX3fV1Gb1eYSd7ZE7EOmeQpiXeQKIRAilSL+o=;
 b=gxiTi8PXtrpvEryKW77cI/zIsmzIOP/8tnNchK9Fy3XZurKaGQrchANG+3D+U1NkJ947DK
 g3U9C3O2LelVyDQSH5+WDXVXdYJlo8ZpOtB6PXd44wvSX8xOlD+LEFYgYTadjSXevfFX41
 laeAC0oK4J5RdEURD2WmFJi7ZtJvEMk=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-QSFDJVVAMyyyVGcNMsnSHA-1; Tue, 12 Jan 2021 09:28:50 -0500
X-MC-Unique: QSFDJVVAMyyyVGcNMsnSHA-1
Received: by mail-io1-f69.google.com with SMTP id y197so3191916iof.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 06:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qxUgJpYX3fV1Gb1eYSd7ZE7EOmeQpiXeQKIRAilSL+o=;
 b=a9o/pamPVC0I8bn3PSJ5fYHglLY+G0Wt88hSmGpNic58MOX9tAC77+MIkv0sRCBrDR
 07W9BZSSV7DAydY8MPLhygIZhrqhFPpwW+g2dqpqYhYMA7OUdH8ETHeW9NXrEQB0xDBI
 Yn2jHjGbNiZJR8TxGG8v5n+V02ujcvYu9hHx/EwcAxAKUniTs2kGhcMvFl9S7YooTwC3
 kUu/YiQuQCgn6geJhxXCnDvgrTvTAp1XCns0SZXaH3gaPq0MmbjhL2JoeoF7xB+LnbR0
 eUmtTyT3INGjnTbHo+BgYunOOIZAFxvs9URRTmMd37mNua+FGx5C2PEdPPL4A4uGJOoC
 cA7A==
X-Gm-Message-State: AOAM532vV/dsXDXtvgbBKf1bBnNUxcEMNhXYAO83bIrzoCwu+xJRGzlB
 sIO4+F3ozswYnIwnbzHP5P58JEhvQ7lFYpsxKPVF1WTGHfxSdIf8pMVvGiLdKPzD6PjnCTS8VMO
 CKRw2iJ1TF1qODa2qv+PQ/RbpApz6Yf4=
X-Received: by 2002:a02:3213:: with SMTP id j19mr4379058jaa.79.1610461729820; 
 Tue, 12 Jan 2021 06:28:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3CMm6ZJYIPxaB4bheYBowXeyLBx8PVX/NkDkYOhc109fQ7FScwvm5jvARky4gi22aPb/FODBO+Evi54B1NBo=
X-Received: by 2002:a02:3213:: with SMTP id j19mr4379048jaa.79.1610461729665; 
 Tue, 12 Jan 2021 06:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20210112134120.2031837-1-kraxel@redhat.com>
 <20210112134120.2031837-2-kraxel@redhat.com>
In-Reply-To: <20210112134120.2031837-2-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 12 Jan 2021 18:28:38 +0400
Message-ID: <CAMxuvaw7+p-oy1itYCWZnK-PEi9QBxxwS67aAy2Sdr5fnGyr-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] vnc: move check into vnc_cursor_define
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005254f105b8b4d722"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005254f105b8b4d722
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 5:41 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Move the check whenever a cursor exists into the vnc_cursor_define()
> function so callers don't have to do it.
>
> Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

thanks
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/vnc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 7452ac7df2ce..84c4972b895b 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -792,9 +792,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl=
,
>      QTAILQ_FOREACH(vs, &vd->clients, next) {
>          vnc_colordepth(vs);
>          vnc_desktop_resize(vs);
> -        if (vs->vd->cursor) {
> -            vnc_cursor_define(vs);
> -        }
> +        vnc_cursor_define(vs);
>          memset(vs->dirty, 0x00, sizeof(vs->dirty));
>          vnc_set_area_dirty(vs->dirty, vd, 0, 0,
>                             vnc_width(vd),
> @@ -928,6 +926,10 @@ static int vnc_cursor_define(VncState *vs)
>      QEMUCursor *c =3D vs->vd->cursor;
>      int isize;
>
> +    if (!vs->vd->cursor) {
> +        return -1;
> +    }
> +
>      if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {
>          vnc_lock_output(vs);
>          vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
> @@ -2137,9 +2139,7 @@ static void set_encodings(VncState *vs, int32_t
> *encodings, size_t n_encodings)
>      vnc_desktop_resize(vs);
>      check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
>      vnc_led_state_change(vs);
> -    if (vs->vd->cursor) {
> -        vnc_cursor_define(vs);
> -    }
> +    vnc_cursor_define(vs);
>  }
>
>  static void set_pixel_conversion(VncState *vs)
> --
> 2.29.2
>
>

--0000000000005254f105b8b4d722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 12, 2021 at 5:41 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Move the=
 check whenever a cursor exists into the vnc_cursor_define()<br>
function so callers don&#39;t have to do it.<br>
<br>
Suggested-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
thanks<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mai=
lto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.=
com</a>&gt;</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
---<br>
=C2=A0ui/vnc.c | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 7452ac7df2ce..84c4972b895b 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -792,9 +792,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,<=
br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(vs, &amp;vd-&gt;clients, next) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_colordepth(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_desktop_resize(vs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vs-&gt;vd-&gt;cursor) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_cursor_define(vs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_cursor_define(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(vs-&gt;dirty, 0x00, sizeof(vs-&gt;=
dirty));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_set_area_dirty(vs-&gt;dirty, vd, 0, 0=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 vnc_width(vd),<br>
@@ -928,6 +926,10 @@ static int vnc_cursor_define(VncState *vs)<br>
=C2=A0 =C2=A0 =C2=A0QEMUCursor *c =3D vs-&gt;vd-&gt;cursor;<br>
=C2=A0 =C2=A0 =C2=A0int isize;<br>
<br>
+=C2=A0 =C2=A0 if (!vs-&gt;vd-&gt;cursor) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs,=C2=A0 VNC_MSG_SERVER_FRA=
MEBUFFER_UPDATE);<br>
@@ -2137,9 +2139,7 @@ static void set_encodings(VncState *vs, int32_t *enco=
dings, size_t n_encodings)<br>
=C2=A0 =C2=A0 =C2=A0vnc_desktop_resize(vs);<br>
=C2=A0 =C2=A0 =C2=A0check_pointer_type_change(&amp;vs-&gt;mouse_mode_notifi=
er, NULL);<br>
=C2=A0 =C2=A0 =C2=A0vnc_led_state_change(vs);<br>
-=C2=A0 =C2=A0 if (vs-&gt;vd-&gt;cursor) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_cursor_define(vs);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 vnc_cursor_define(vs);<br>
=C2=A0}<br>
<br>
=C2=A0static void set_pixel_conversion(VncState *vs)<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--0000000000005254f105b8b4d722--


