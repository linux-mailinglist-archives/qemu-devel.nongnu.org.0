Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE62C25F9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:46:56 +0100 (CET)
Received: from localhost ([::1]:46864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXih-0000aJ-AY
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khXge-00085Y-Pq
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:44:48 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:40725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khXgd-0001n6-3d
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:44:48 -0500
Received: by mail-ej1-x641.google.com with SMTP id oq3so28282369ejb.7
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 04:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oZ0h65k/dyVQanlSZaTSsOmVWs2CXLMK9YT4ouLf4AY=;
 b=B/NBwhSuFFCSgQ24QXviRuI9aKW5y+Qte+ECq/XUpsennB/wjnthV9ymw04RcM0YWB
 cj+72Dx93nGVpsOL7YrpkT53/uDACPtyUqqyhW1Sa17fdH/SbzNoYvZsSyiM1LmgCumx
 wXJmLX4JP5gUjHT2z+Gfrwg+JFmknV2uygKGBqUd5WLqaei08R85uGUTY3M2HXC/Hhe7
 IIGZbTnjBK58xtBL20I3zdd7QWXQMHX7uHu7kHe7afEzCoYP8rLqjbrsMSkN6pXTp39H
 hww/cKHVmKkLnaK2AIsx6GpXKVwLxU+gCVxLtXZTcPIpY3uiSf8bPNSj8MGtAa6dU01g
 XwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oZ0h65k/dyVQanlSZaTSsOmVWs2CXLMK9YT4ouLf4AY=;
 b=gpZPZ0ESYmSyiVxeKcY2jZggOkee4TyxspxdHdTsclSiPmKO9UZTfxT7CE8Ri2zggN
 BhCj1Hfs9HRzFN3z5oLe8cY+rHkhfIxhWKG17xqfrWaF0ZS5t5zFfWbj1+qcIAfSB3Fn
 9JZWzerzC+GMsCL74nEcuiAOEEFLK3uGoGiZ6R98RB+hKlqBrh/eHuTsXEh54KWfjqt2
 jFv/QB2lqZOXzdvpFBPtlPu+Hu4OxwTlxDf87ivdGqJCSMm3ynoqru49xj+pMvN57I2E
 IdMeh2e63Hy6GdhIsr3baIfcK5ITouypluWvzOXeIyDKeR2VozE5VOUR+28jcZERmCJ5
 k2Dg==
X-Gm-Message-State: AOAM533WiCfXsuKxcws/u7kkPVUUERkaWYPXsfVw1tKHFv3GbCIGMq0Y
 x9ahfozb7r+LIWWF+cTmjCtKaei3Jn3KLlfAxts=
X-Google-Smtp-Source: ABdhPJxy1Oq6BMMJJyGBDYHCZ6y6S1rXv3Go7CkQE5mjcxT1ak26KSEdiTbUqbs4pC3BtogtHoDKDlgalz5Q3NUWmRI=
X-Received: by 2002:a17:906:3ac4:: with SMTP id
 z4mr3893540ejd.92.1606221885137; 
 Tue, 24 Nov 2020 04:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20201124122936.30588-1-kraxel@redhat.com>
In-Reply-To: <20201124122936.30588-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Nov 2020 16:44:33 +0400
Message-ID: <CAJ+F1C+jYFM+_UwE+5cwp9GHgNgwNJKe2Jnqgyvj3LpxrnFYCQ@mail.gmail.com>
Subject: Re: [PATCH] qxl: fix segfault
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e4e83705b4d9ac77"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
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

--000000000000e4e83705b4d9ac77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Nov 24, 2020 at 4:30 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Add missing sanity check.
> Reproducer: run qemu with "-device qxl" but without "-spice ..."
>
> Fixes: 0d9b90ce5c73 ("console: make QMP/HMP screendump run in coroutine")
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/console.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index e07d2c380df7..53dee8e26b17 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -264,7 +264,9 @@ static void gui_setup_refresh(DisplayState *ds)
>
>  void graphic_hw_update_done(QemuConsole *con)
>  {
> -    qemu_co_queue_restart_all(&con->dump_queue);
> +    if (con) {
> +        qemu_co_queue_restart_all(&con->dump_queue);
> +    }
>  }
>
>  void graphic_hw_update(QemuConsole *con)
> --
> 2.27.0
>
>
>
Interesting case...
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e4e83705b4d9ac77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 4:30 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add mi=
ssing sanity check.<br>
Reproducer: run qemu with &quot;-device qxl&quot; but without &quot;-spice =
...&quot;<br>
<br>
Fixes: 0d9b90ce5c73 (&quot;console: make QMP/HMP screendump run in coroutin=
e&quot;)<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/console.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index e07d2c380df7..53dee8e26b17 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -264,7 +264,9 @@ static void gui_setup_refresh(DisplayState *ds)<br>
<br>
=C2=A0void graphic_hw_update_done(QemuConsole *con)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_co_queue_restart_all(&amp;con-&gt;dump_queue);<br>
+=C2=A0 =C2=A0 if (con) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_co_queue_restart_all(&amp;con-&gt;dump_qu=
eue);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0void graphic_hw_update(QemuConsole *con)<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><div><br></div><div>Interesting case...<br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div><div><br></div><div=
>thanks<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc=
-Andr=C3=A9 Lureau<br></div></div>

--000000000000e4e83705b4d9ac77--

