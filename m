Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679072C5869
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:42:52 +0100 (CET)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJQ3-0001Xb-0I
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kiJOZ-00017I-NZ
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:41:19 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kiJOX-0007m4-5T
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:41:19 -0500
Received: by mail-ej1-x642.google.com with SMTP id bo9so3449002ejb.13
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CjkXY+E9qXYdR4Dynj+0pdBCVRlvsBr5X14DwYYwJrk=;
 b=bXQxcemsKCtOyBvYOjEWRCkpFvb3xVZvEkEFW2ChTPFS7eCdmH3pZZiPdrURonC1m6
 6B+8eLRXhUbB7+6UJHjm5oQEDpsW1U1HDGgSRbT6SbRg2MiuFswpq2wneJk6yGGPH0Vj
 AjaYSrasvdImmruo1JbZxwrLsxw5R8XDJG/LXQt1JhjPy4Oaro2QA6HE+4oiKwyNK7ao
 rnKE0wLA2O/xsTvmQweg19O9YG419Y1qBqXGKGmIj6mPPbCr0OHjGjvqaJrPfGJYPFOL
 VBvPeQonYgSmDig6FFzmeaukjufuSGxUVS17hrdbVbe0PYicXdQp082hZH5CZRLLOPER
 v06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CjkXY+E9qXYdR4Dynj+0pdBCVRlvsBr5X14DwYYwJrk=;
 b=ZW7yduwZl46Ydwrsd/gK/asNk06Zv33EY0QS0nHR23Yt5Pb/QvjQyhyyX1SIZhUBr9
 jtArn0kbbAQhFpoO/8P7ZGjz98ef2lMymeiM1aDNiP8z4/ip86qK/l5qfK7VGRDirFLo
 Br+QSP3m2C5xX0l6FveKtZKkiBjOuCLLEPTbaaF2KBqVvYa3evuZ+hdzQMaVMFScV+jY
 HpA4nY+t5oh9PqYQQYE6qXy/y19yI/LkqDO7ekHTiV6/SHh99k2OhgExmMC3OSgfgkWh
 EKldBTox5WUwjyzTc4j/YS6FS3zNuaqJq1/avCn7cOmlpPcNcxyjpXP9Nr5dNih4lIxI
 yDWg==
X-Gm-Message-State: AOAM532B0xLeE6l7ZQZgb/wt16bM80oPQXU3ljlphGyV2HWE9y3MpLpC
 /ueM/CQ7H0ATrvLSR3jVZqcXT11T3ZpYyxUl7l4=
X-Google-Smtp-Source: ABdhPJyVZDQl193QJbdsYRPSCymWmuP0s9Evogudg/dzrnEqLO+ePTXj8u6jsFyFMryTdKwH0BtuuOXD4/Q0X7GmV6g=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr2181733ejb.532.1606405274199; 
 Thu, 26 Nov 2020 07:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20201124122936.30588-1-kraxel@redhat.com>
In-Reply-To: <20201124122936.30588-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 Nov 2020 19:40:58 +0400
Message-ID: <CAJ+F1CJYeO9fGcSOZEEJmYvFwAxXe32rKGv81sfG8Dz=nCiGog@mail.gmail.com>
Subject: Re: [PATCH] qxl: fix segfault
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bbeca405b5045f36"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bbeca405b5045f36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Nov 24, 2020 at 4:30 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Add missing sanity check.
> Reproducer: run qemu with "-device qxl" but without "-spice ..."
>
> Fixes: 0d9b90ce5c73 ("console: make QMP/HMP screendump run in coroutine")
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

It would be nice to include this regression fix in the release. Anyone
taking the patch to PR?

---
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

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bbeca405b5045f36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 4:30 PM Gerd Hoffmann=
 &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add missing sani=
ty check.<br>
Reproducer: run qemu with &quot;-device qxl&quot; but without &quot;-spice =
...&quot;<br>
<br>
Fixes: 0d9b90ce5c73 (&quot;console: make QMP/HMP screendump run in coroutin=
e&quot;)<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
It would be nice to include this regression fix in the release. Anyone taki=
ng the patch to PR?<br></div><div> <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bbeca405b5045f36--

