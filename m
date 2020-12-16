Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4932DC506
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:06:43 +0100 (CET)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaGB-000587-1H
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa4e-0007MS-H9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:54:48 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa4b-00038C-So
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:54:48 -0500
Received: by mail-ej1-x629.google.com with SMTP id q22so15991227eja.2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cc19q53i28JFA8Lurfnu2VkIAuESOJ7qu18Twrjf4Y4=;
 b=bRQpbejdIXh4wt9akt1CACO9gzfUXpoQFsd7VmZ6Z9QzfogcOtWF6fEphfIIYmGUsH
 GizsRaOsT9R3QTWGmsYQ+Eqvplf9iffqaUyQepqo3iP/Q/kJ3B+TxbxvImTqybI0hzQ9
 FWspi76Pih8dpwRnAPeuTrX5lFIGxKH2VyyDE91Leum4eb9UWJEG8zWKYBC36yTV7/7k
 d8NCHgd+0d2vUncnJQ486boWllxXaICSRD6cy4Hk/aB+AA0SExelb5UDH5KAPVqUzl8K
 cYSznMqdKlKc39Cqxlok55dMfWF2Sy1wX8Vmdql8RWGd3KaRiNqd/Gx/iSufIPrNk/5/
 cQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cc19q53i28JFA8Lurfnu2VkIAuESOJ7qu18Twrjf4Y4=;
 b=XXDZoUWtK9g6xp+qzUOJLyIlKPpGg1Wwv5v72wwgz1dXhJxWYWCovy+W3Kw7HVK3xf
 ksQOlFQk2DV/2vIune50Wv7vsapuU2K5liZWMXowvmnYHTv8p5oArEuB8xO4hwhilZLC
 omoyZpSa3zs5CJ/FKEcTeeZyer98tfW5T4e+h7lS+UCffeTb6pVJKdxw6a0fuZVH0VZN
 jnXDupXuN5sv+g5VAZoA/l4ghIfeOYs3JjOmWo+ZbCa7SJpeuGXf1uMnvlMADcgSl/24
 /t2UlIpiaYe57Cj/DPNxa/LaEfM8BRucm1Jnrl2Rw5pSDJMvWQrh5nAKAzpo4JSTOSNO
 tliw==
X-Gm-Message-State: AOAM531f6g8E6s9JKSUM+W1sw2xyzDRkfp3TqjFb8LiQn3O7D/zMu7Fp
 0O2dCEPkWBer8Oc4kxru0hZW9AgPui5GRIPhi8qstYFJmfmw+w==
X-Google-Smtp-Source: ABdhPJxcQtGsF1SJuFzueXk/SkYb0ikde0wp+XVv4DQGSzjaNg/9CblR4kd+kACMtb8xUVIv8DyXPijl8s8Y7XhqVDk=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr22986657ejj.105.1608137684123; 
 Wed, 16 Dec 2020 08:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20201216162006.433850-1-pbonzini@redhat.com>
 <20201216162006.433850-5-pbonzini@redhat.com>
In-Reply-To: <20201216162006.433850-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 20:54:32 +0400
Message-ID: <CAJ+F1CJFHpFMKyLeV-T0VGVefJFwf57nNqtFUkaA+yamSV7mBw@mail.gmail.com>
Subject: Re: [PATCH 4/7] meson: fix detection of curses with pkgconfig
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000069836705b697bb7a"
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000069836705b697bb7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 8:22 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 39fc9b7143..ab622ae8bd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -500,16 +500,16 @@ if have_system and not
> get_option('curses').disabled()
>      endif
>    endforeach
>    msg =3D get_option('curses').enabled() ? 'curses library not found' : =
''
> +  curses_compile_args =3D ['-DNCURSES_WIDECHAR']
>    if curses.found()
> -    if cc.links(curses_test, dependencies: [curses])
> -      curses =3D declare_dependency(compile_args: '-DNCURSES_WIDECHAR',
> dependencies: [curses])
> +    if cc.links(curses_test, args: curses_compile_args, dependencies:
> [curses])
> +      curses =3D declare_dependency(compile_args: curses_compile_args,
> dependencies: [curses])
>      else
>        msg =3D 'curses package not usable'
>        curses =3D not_found
>      endif
>    endif
>    if not curses.found()
> -    curses_compile_args =3D ['-DNCURSES_WIDECHAR']
>      has_curses_h =3D cc.has_header('curses.h', args: curses_compile_args=
)
>      if targetos !=3D 'windows' and not has_curses_h
>        message('Trying with /usr/include/ncursesw')
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000069836705b697bb7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 8:22 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 39fc9b7143..ab622ae8bd 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -500,16 +500,16 @@ if have_system and not get_option(&#39;curses&#39;).d=
isabled()<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0endforeach<br>
=C2=A0 =C2=A0msg =3D get_option(&#39;curses&#39;).enabled() ? &#39;curses l=
ibrary not found&#39; : &#39;&#39;<br>
+=C2=A0 curses_compile_args =3D [&#39;-DNCURSES_WIDECHAR&#39;]<br>
=C2=A0 =C2=A0if curses.found()<br>
-=C2=A0 =C2=A0 if cc.links(curses_test, dependencies: [curses])<br>
-=C2=A0 =C2=A0 =C2=A0 curses =3D declare_dependency(compile_args: &#39;-DNC=
URSES_WIDECHAR&#39;, dependencies: [curses])<br>
+=C2=A0 =C2=A0 if cc.links(curses_test, args: curses_compile_args, dependen=
cies: [curses])<br>
+=C2=A0 =C2=A0 =C2=A0 curses =3D declare_dependency(compile_args: curses_co=
mpile_args, dependencies: [curses])<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &#39;curses package not usable&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0curses =3D not_found<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0if not curses.found()<br>
-=C2=A0 =C2=A0 curses_compile_args =3D [&#39;-DNCURSES_WIDECHAR&#39;]<br>
=C2=A0 =C2=A0 =C2=A0has_curses_h =3D cc.has_header(&#39;curses.h&#39;, args=
: curses_compile_args)<br>
=C2=A0 =C2=A0 =C2=A0if targetos !=3D &#39;windows&#39; and not has_curses_h=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0message(&#39;Trying with /usr/include/ncursesw&#=
39;)<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000069836705b697bb7a--

