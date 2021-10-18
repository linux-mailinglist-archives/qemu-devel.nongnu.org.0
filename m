Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9016B431F71
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:24:14 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTYj-000563-Mg
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mcTVZ-00087S-Kq
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:20:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mcTVX-00038Q-OX
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:20:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t2so41800917wrb.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IV+aRg6G07GqB6twbwTd3xH/S9KPGPIgkZhFuNfOCdw=;
 b=IcrdnppVKtBMjPmJIQc9N0bgacmghW2Ao6m6uJaXH/1uo+2wQiWNKxQdVeiRUA+7ER
 fBruyo5p9FG9fjGeTGl8jsa5Hs8SbX+ATKc+nzUYR/+6QfRTS/uNIjSs/QlGwr+KB/BH
 9+PUZm+5ehtGvhcsXuzH/bIzovVjpOuZiqyNhgSr6y2f4avOvy9sFIqg7tLNUUW1no4H
 OSKfgISWZ5rm80wAvZ5yMhygJZhMaI+M3Vx2BttArDL8wZuFaqe0R3nfDRAXu1YMbQkC
 nBKIp685kgfSp1YrowNCrcBJLz/t1LVT/GAbHfdukylqHmHceO/bMaY0Y3e6P5qWZA5Q
 85rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV+aRg6G07GqB6twbwTd3xH/S9KPGPIgkZhFuNfOCdw=;
 b=zEVYZhWakpXK730tZEkbH/1RvrZCwDRSyheo7cluoU0XBoSZw4Xi0r/bOdn/ZtN3BT
 O+RXwfl0NLcVEYaakuIEzZ2fq4qu4V4FGZidscRD12qKgqD8kXbmvdRj94wRVdcSFI6U
 LdG3AiyrIQTGT/9pDUo0hgvLb0ZRISYnPQmOfaSXjkzJk4uuRPsgcbeW1NJpVQyfIOc7
 ooU5sMQW7MVh0/IQIZX7uoF+5llE/t3p8rGZUK134EBVLyCtnEgnA5yy37YMUaGBnUEV
 l5SUz8Af5PDm5eMEYTSOiAgiqKQx5WSY/jfuMO60nMbG+QpZ8WfICzFVJRvIo9IuNTT3
 HY4g==
X-Gm-Message-State: AOAM530iSsQ0CLxN9T8d41CRDAYkA0NkoOQcofEeGddGNtnmL/gbs4vB
 eHX1ALYqaUU2UxLCI2A6xFeX4yKheCH1bOordRU=
X-Google-Smtp-Source: ABdhPJwQia4J1YMT9WlbYhwPaXNhorgl0gk/rXf0Ja8Xsvb9JKMY30/bwkUF5VtWVvJqwfwyWYzd0PR2m3urdsfwyzI=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr35360730wru.239.1634566852824; 
 Mon, 18 Oct 2021 07:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211018140226.838137-1-alex.bennee@linaro.org>
In-Reply-To: <20211018140226.838137-1-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 18 Oct 2021 18:20:41 +0400
Message-ID: <CAJ+F1CJx2gLnVD1kuVj2EOMu_1YKFhV5x6oxvRbJynwq3Kh_3w@mail.gmail.com>
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009fd15c05cea140a1"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.junger@greensocs.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009fd15c05cea140a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 6:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> While there are a number of uses in the code-base of the exit(0)
> pattern it gets in the way of clean exit which can do all of it's
> house-keeping. In particular it was reported that you can crash
> plugins this way because TCG can still be running on other threads
> when the atexit callback is called.
>
> Use qemu_system_shutdown_request() instead. I did a gentle rename of
> the runstate stub seeing as it now contains two functions.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reported-by: Lukas J=C3=BCnger <lukas.junger@greensocs.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/char-mux.c                     | 3 ++-
>  stubs/{runstate-check.c =3D> runstate.c} | 5 +++++
>  stubs/meson.build                      | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>  rename stubs/{runstate-check.c =3D> runstate.c} (64%)
>
> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
> index ada0c6866f..a46897fcd5 100644
> --- a/chardev/char-mux.c
> +++ b/chardev/char-mux.c
> @@ -28,6 +28,7 @@
>  #include "qemu/option.h"
>  #include "chardev/char.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/runstate.h"
>  #include "chardev-internal.h"
>
>  /* MUX driver for serial I/O splitting */
> @@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d,
> int ch)
>              {
>                   const char *term =3D  "QEMU: Terminated\n\r";
>                   qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
> -                 exit(0);
> +
>  qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>                   break;
>              }
>          case 's':
> diff --git a/stubs/runstate-check.c b/stubs/runstate.c
> similarity index 64%
> rename from stubs/runstate-check.c
> rename to stubs/runstate.c
> index 2ccda2b70f..f47dbcd3e0 100644
> --- a/stubs/runstate-check.c
> +++ b/stubs/runstate.c
> @@ -5,3 +5,8 @@ bool runstate_check(RunState state)
>  {
>      return state =3D=3D RUN_STATE_PRELAUNCH;
>  }
> +
> +void qemu_system_shutdown_request(ShutdownCause reason)
> +{
> +    return;
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index f6aa3aa94f..8f6a9f17e5 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -35,7 +35,7 @@ stub_ss.add(files('qtest.c'))
>  stub_ss.add(files('ram-block.c'))
>  stub_ss.add(files('ramfb.c'))
>  stub_ss.add(files('replay.c'))
> -stub_ss.add(files('runstate-check.c'))
> +stub_ss.add(files('runstate.c'))
>  stub_ss.add(files('sysbus.c'))
>  stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009fd15c05cea140a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 18, 2021 at 6:06 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">While there are a number of uses in the code-base of the exit(0)<br>
pattern it gets in the way of clean exit which can do all of it&#39;s<br>
house-keeping. In particular it was reported that you can crash<br>
plugins this way because TCG can still be running on other threads<br>
when the atexit callback is called.<br>
<br>
Use qemu_system_shutdown_request() instead. I did a gentle rename of<br>
the runstate stub seeing as it now contains two functions.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Reported-by: Lukas J=C3=BCnger &lt;<a href=3D"mailto:lukas.junger@greensocs=
.com" target=3D"_blank">lukas.junger@greensocs.com</a>&gt;<br></blockquote>=
<div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mail=
to:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char-mux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0stubs/{runstate-check.c =3D&gt; runstate.c} | 5 +++++<br>
=C2=A0stubs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A03 files changed, 8 insertions(+), 2 deletions(-)<br>
=C2=A0rename stubs/{runstate-check.c =3D&gt; runstate.c} (64%)<br>
<br>
diff --git a/chardev/char-mux.c b/chardev/char-mux.c<br>
index ada0c6866f..a46897fcd5 100644<br>
--- a/chardev/char-mux.c<br>
+++ b/chardev/char-mux.c<br>
@@ -28,6 +28,7 @@<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
=C2=A0#include &quot;chardev-internal.h&quot;<br>
<br>
=C2=A0/* MUX driver for serial I/O splitting */<br>
@@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, i=
nt ch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
term =3D=C2=A0 &quot;QEMU: Terminated\n\r&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_wri=
te_all(chr, (uint8_t *)term, strlen(term));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_=
shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;s&#39;:<br>
diff --git a/stubs/runstate-check.c b/stubs/runstate.c<br>
similarity index 64%<br>
rename from stubs/runstate-check.c<br>
rename to stubs/runstate.c<br>
index 2ccda2b70f..f47dbcd3e0 100644<br>
--- a/stubs/runstate-check.c<br>
+++ b/stubs/runstate.c<br>
@@ -5,3 +5,8 @@ bool runstate_check(RunState state)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return state =3D=3D RUN_STATE_PRELAUNCH;<br>
=C2=A0}<br>
+<br>
+void qemu_system_shutdown_request(ShutdownCause reason)<br>
+{<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
diff --git a/stubs/meson.build b/stubs/meson.build<br>
index f6aa3aa94f..8f6a9f17e5 100644<br>
--- a/stubs/meson.build<br>
+++ b/stubs/meson.build<br>
@@ -35,7 +35,7 @@ stub_ss.add(files(&#39;qtest.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;ram-block.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;ramfb.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;replay.c&#39;))<br>
-stub_ss.add(files(&#39;runstate-check.c&#39;))<br>
+stub_ss.add(files(&#39;runstate.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;sysbus.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;target-get-monitor-def.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;target-monitor-defs.c&#39;))<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009fd15c05cea140a1--

