Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2B31B5C0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 08:54:30 +0100 (CET)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBYiD-0003by-3i
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 02:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lBYgy-0003CY-7m
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 02:53:12 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lBYgw-0006ES-HD
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 02:53:12 -0500
Received: by mail-ej1-x633.google.com with SMTP id w1so9552649ejf.11
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 23:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qiBoAslfUKM3vkwV/6tTVqg4sEx7MfTBRH6OD0m5vqw=;
 b=YRrBBhR1CQ6+ru5tLhY3dQ3TowyGXjfHZfRWJQwfnsw7NUpWYfhigQlgO0j+PSHN8G
 XEtGzi7vvoz/hmthEVWrlcIecB5As0DKvvWit1FeUAsX+aKDKreF2x1NEtWRu6u9VyVd
 Q31tDZbzXlTAqG+i5ynoXgkE34CYZPeyECl3WgJmRVPhtxWyZAPOc+3915QGfJvtZbRO
 o4OT3AXwQV+PTGD5unMwkxRqtaq1jKSyYIDpB0ubEtGURema4l3l92j9ybUr5nHxpcaZ
 dT7ykUQ7Kiu8yu4a2v89BOwoIWI8YuI2nZncxaxmRumgcYlCax/h0bwcdIljMTxYa1V0
 UyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qiBoAslfUKM3vkwV/6tTVqg4sEx7MfTBRH6OD0m5vqw=;
 b=Qm5PCKbQywtgVmyLMRZLcgyQIJAJreW71OCVgEhuSkXxHDqjY/2mXtvl2sDqLDLdXJ
 tDc4NARoBaIiEkBE8bngX3QH4wZlLGC9ud8pJ/1BKqXfHeufudj41y382SCBSthgTetC
 MSkC8cZygwb/2dvp1NZiSJQr376ZB3nxB3Pw1ICc0CmhJ5GnPWC1bCr8vY86OZnxtWKJ
 lu/3N+SYVhvbMlRkiiDdoqLtTuSq+PhRHt4lM4FBqy8aqwNHfNoXL1HRlnqakkLaNG5f
 YyGXFGoVa83aWAoWU97C2MAhSUfxShRvG42Tjxd9ZGDM3OYEcyy36KOIDgMiXsEAMDmA
 oDyw==
X-Gm-Message-State: AOAM530WqziBBfCZw4tL16SmnG5qA+q3mtsPmkKYk+mgxZ/YLhtCDJfr
 cC5sMUOjruk3rOgdFi57wDbuNGS6u2043IMHmDM=
X-Google-Smtp-Source: ABdhPJyBIrSJRTVSGfv7HuKgeCIDVnLwxxOX1xXQcckd9DWklYvylhpHZdSCcBL+rLJ70pTFpqbxuKqNI+CVybh7dKk=
X-Received: by 2002:a17:906:a00e:: with SMTP id
 p14mr14386770ejy.532.1613375588927; 
 Sun, 14 Feb 2021 23:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20210213032318.346093-1-brogers@suse.com>
In-Reply-To: <20210213032318.346093-1-brogers@suse.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 15 Feb 2021 11:52:57 +0400
Message-ID: <CAJ+F1CJ4R5Cv_qG8Xd5Q37RWVadfs2z1S_bKDdFBt3VkoNGMyw@mail.gmail.com>
Subject: Re: [PATCH] spice-app: avoid crash when core spice module doesn't
 loaded
To: Bruce Rogers <brogers@suse.com>
Content-Type: multipart/alternative; boundary="000000000000de0da005bb5b4637"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000de0da005bb5b4637
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 13, 2021 at 7:24 AM Bruce Rogers <brogers@suse.com> wrote:

> When qemu is built with modules, but a given module doesn't load
> qemu should handle that gracefully. When ui-spice-core.so isn't
> able to be loaded and qemu is invoked with -display spice-app or
> -spice, qemu will dereference a null pointer. With this change we
> check the pointer before dereferencing and error out in a normal
> way.
>
> Signed-off-by: Bruce Rogers <brogers@suse.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/spice-app.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/ui/spice-app.c b/ui/spice-app.c
> index 026124ef56..4325ac2d9c 100644
> --- a/ui/spice-app.c
> +++ b/ui/spice-app.c
> @@ -129,6 +129,7 @@ static void spice_app_atexit(void)
>  static void spice_app_display_early_init(DisplayOptions *opts)
>  {
>      QemuOpts *qopts;
> +    QemuOptsList *list;
>      GError *err =3D NULL;
>
>      if (opts->has_full_screen) {
> @@ -159,11 +160,16 @@ static void
> spice_app_display_early_init(DisplayOptions *opts)
>              exit(1);
>          }
>      }
> +    list =3D qemu_find_opts("spice");
> +    if (list =3D=3D NULL) {
> +        error_report("spice-app missing spice support");
> +        exit(1);
> +    }
>
>      type_register(&char_vc_type_info);
>
>      sock_path =3D g_strjoin("", app_dir, "/", "spice.sock", NULL);
> -    qopts =3D qemu_opts_create(qemu_find_opts("spice"), NULL, 0,
> &error_abort);
> +    qopts =3D qemu_opts_create(list, NULL, 0, &error_abort);
>      qemu_opt_set(qopts, "disable-ticketing", "on", &error_abort);
>      qemu_opt_set(qopts, "unix", "on", &error_abort);
>      qemu_opt_set(qopts, "addr", sock_path, &error_abort);
> --
> 2.30.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000de0da005bb5b4637
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 13, 2021 at 7:24 AM Bruce=
 Rogers &lt;<a href=3D"mailto:brogers@suse.com">brogers@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When qemu i=
s built with modules, but a given module doesn&#39;t load<br>
qemu should handle that gracefully. When ui-spice-core.so isn&#39;t<br>
able to be loaded and qemu is invoked with -display spice-app or<br>
-spice, qemu will dereference a null pointer. With this change we<br>
check the pointer before dereferencing and error out in a normal<br>
way.<br>
<br>
Signed-off-by: Bruce Rogers &lt;<a href=3D"mailto:brogers@suse.com" target=
=3D"_blank">brogers@suse.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/spice-app.c | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ui/spice-app.c b/ui/spice-app.c<br>
index 026124ef56..4325ac2d9c 100644<br>
--- a/ui/spice-app.c<br>
+++ b/ui/spice-app.c<br>
@@ -129,6 +129,7 @@ static void spice_app_atexit(void)<br>
=C2=A0static void spice_app_display_early_init(DisplayOptions *opts)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QemuOpts *qopts;<br>
+=C2=A0 =C2=A0 QemuOptsList *list;<br>
=C2=A0 =C2=A0 =C2=A0GError *err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (opts-&gt;has_full_screen) {<br>
@@ -159,11 +160,16 @@ static void spice_app_display_early_init(DisplayOptio=
ns *opts)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 list =3D qemu_find_opts(&quot;spice&quot;);<br>
+=C2=A0 =C2=A0 if (list =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;spice-app missing spice sup=
port&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0type_register(&amp;char_vc_type_info);<br>
<br>
=C2=A0 =C2=A0 =C2=A0sock_path =3D g_strjoin(&quot;&quot;, app_dir, &quot;/&=
quot;, &quot;spice.sock&quot;, NULL);<br>
-=C2=A0 =C2=A0 qopts =3D qemu_opts_create(qemu_find_opts(&quot;spice&quot;)=
, NULL, 0, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qopts =3D qemu_opts_create(list, NULL, 0, &amp;error_abort);=
<br>
=C2=A0 =C2=A0 =C2=A0qemu_opt_set(qopts, &quot;disable-ticketing&quot;, &quo=
t;on&quot;, &amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0qemu_opt_set(qopts, &quot;unix&quot;, &quot;on&quot;, &=
amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0qemu_opt_set(qopts, &quot;addr&quot;, sock_path, &amp;e=
rror_abort);<br>
-- <br>
2.30.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000de0da005bb5b4637--

