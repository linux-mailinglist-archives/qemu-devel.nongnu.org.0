Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5808B425DF1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:47:56 +0200 (CEST)
Received: from localhost ([::1]:40258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaJ1-0004oh-DO
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDV-0005kk-0u
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDP-00066c-Pe
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id u18so22913610wrg.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2CI6QWAbwKftk3YSwKnzvDfthaIwjF1vy8WLPgztgyA=;
 b=URYWx04zVHHXrVmBavQDciQafOrqgPVLKCufgSYOpbcXjvM87wX6FDeA3Udew4RiSg
 6FGZ30Apj9US5svDxL/eIdgeDmHqfE8zxfxHGOMVg2IDzY1w63MjnXHch8adgaTInLb1
 COuJoTaoDoVr9P6ZFLbusboNc3ubzsc7luatz3DtlvrMrfDy/jcljKPCmA7b014TLyXB
 Qx2vZ4lfyoUwVaHMjSYtK+d0KpiOVb8q5ZkjNckiEcPn5pqGmNVXLds6psapDSLJIJxq
 /67fz5HLnDi/jMgaz4U3WV6Fy3W93Gbyq8VOVzSc5umZjNaqrNhAm7tLZVpqzSabPXrk
 8NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2CI6QWAbwKftk3YSwKnzvDfthaIwjF1vy8WLPgztgyA=;
 b=ExKwzXqPflFxUyXHlofo8Pbd8upAfcHGxYcVBVsFZKSW48IsKECWh83DlYTKGEuNUy
 IaN/v8lTzWMZr7Yo6KHFbLEcaEjyD1b3lDJq2ON9mi533m9wcT5bDnk4dcyIYjX4EenT
 xR4pIMH7WREqGewumyIeX+sOBDnEuPtXjQFGHxDSU8Kf9AkaxnsUPoKflDqETsmHGHnP
 J/hXgNll5rlO4Ij5Rt6gabmbnpdYgfiIysQRsziqkQtewyG4lKJzFMeXqMuEqvD1Xrdd
 jXkRQR7xMBSjwrwBDXao3ZZfjgKpVdINm7Wc3ryR29NTVUwVUP4Mf6l+o0EVlbkRaLyj
 1UNQ==
X-Gm-Message-State: AOAM531GlF/xhK8w05P6VAs6YSrApdjb87ra34hcCx9xOA7laE/T0sbX
 VVqo5Gp8rfVkZ4aTCepaGptNMv4qbCyzSwQZtD0=
X-Google-Smtp-Source: ABdhPJzjz6ROt28HU3zIhjsfVp+FoPFahK2OY6RVRWejb2PJIW/Yg2aitvUmcy8fwgDxgDy9N/uihoKC+EEax2mNMrQ=
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr11411240wme.42.1633639326564; 
 Thu, 07 Oct 2021 13:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-6-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:51 +0400
Message-ID: <CAJ+F1C+2FG39iudt42_cS9xOBHmHDjXvVuZo=-xLfM_8T0MN3Q@mail.gmail.com>
Subject: Re: [PATCH 11/24] configure, meson: get HOST_WORDS_BIGENDIAN via the
 machine object
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c0465405cdc94bb4"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x433.google.com
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

--000000000000c0465405cdc94bb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:14 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> No need to pass it in config-host.mak.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Or we could eventually use G_BYTE_ORDER, I guess.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure   | 4 ----
>  meson.build | 3 ++-
>  2 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/configure b/configure
> index f91b8e1f0d..35e25bb960 100755
> --- a/configure
> +++ b/configure
> @@ -347,7 +347,6 @@ tsan=3D"no"
>  fortify_source=3D"$default_feature"
>  strip_opt=3D"yes"
>  tcg_interpreter=3D"false"
> -bigendian=3D"no"
>  mingw32=3D"no"
>  gcov=3D"no"
>  EXESUF=3D""
> @@ -4262,9 +4261,6 @@ fi
>  if test "$strip_opt" =3D "yes" ; then
>    echo "STRIP=3D${strip}" >> $config_host_mak
>  fi
> -if test "$bigendian" =3D "yes" ; then
> -  echo "HOST_WORDS_BIGENDIAN=3Dy" >> $config_host_mak
> -fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
>    if test "$guest_agent_with_vss" =3D "yes" ; then
> diff --git a/meson.build b/meson.build
> index 6842402a60..9bb443387a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1465,6 +1465,7 @@ config_host_data.set('QEMU_VERSION_MICRO',
> meson.project_version().split('.')[2]
>
>  config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
> +config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() =3D=
=3D
> 'big')
>
>  # has_header
>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
> @@ -1625,7 +1626,7 @@ foreach k, v: config_host
>      config_host_data.set('HOST_' + v.to_upper(), 1)
>    elif strings.contains(k)
>      config_host_data.set_quoted(k, v)
> -  elif k.startswith('CONFIG_') or k.startswith('HAVE_') or
> k.startswith('HOST_')
> +  elif k.startswith('CONFIG_') or k.startswith('HAVE_')
>      config_host_data.set(k, v =3D=3D 'y' ? 1 : v)
>    endif
>  endforeach
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c0465405cdc94bb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:14 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">No need to pass it in config-host.mak.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Or we could eventually use G_BYTE_ORDER, I guess.</div><div><div><br></=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div><div><br></div> </div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
---<br>
=C2=A0configure=C2=A0 =C2=A0| 4 ----<br>
=C2=A0meson.build | 3 ++-<br>
=C2=A02 files changed, 2 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index f91b8e1f0d..35e25bb960 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -347,7 +347,6 @@ tsan=3D&quot;no&quot;<br>
=C2=A0fortify_source=3D&quot;$default_feature&quot;<br>
=C2=A0strip_opt=3D&quot;yes&quot;<br>
=C2=A0tcg_interpreter=3D&quot;false&quot;<br>
-bigendian=3D&quot;no&quot;<br>
=C2=A0mingw32=3D&quot;no&quot;<br>
=C2=A0gcov=3D&quot;no&quot;<br>
=C2=A0EXESUF=3D&quot;&quot;<br>
@@ -4262,9 +4261,6 @@ fi<br>
=C2=A0if test &quot;$strip_opt&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;STRIP=3D${strip}&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0fi<br>
-if test &quot;$bigendian&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;HOST_WORDS_BIGENDIAN=3Dy&quot; &gt;&gt; $config_host_mak=
<br>
-fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0 =C2=A0if test &quot;$guest_agent_with_vss&quot; =3D &quot;yes&quot; =
; then<br>
diff --git a/meson.build b/meson.build<br>
index 6842402a60..9bb443387a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1465,6 +1465,7 @@ config_host_data.set(&#39;QEMU_VERSION_MICRO&#39;, me=
son.project_version().split(&#39;.&#39;)[2]<br>
<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_HOST_DSOSUF&#39;, host_dsosuf=
)<br>
=C2=A0config_host_data.set(&#39;HAVE_HOST_BLOCK_DEVICE&#39;, have_host_bloc=
k_device)<br>
+config_host_data.set(&#39;HOST_WORDS_BIGENDIAN&#39;, host_machine.endian()=
 =3D=3D &#39;big&#39;)<br>
<br>
=C2=A0# has_header<br>
=C2=A0config_host_data.set(&#39;CONFIG_EPOLL&#39;, cc.has_header(&#39;sys/e=
poll.h&#39;))<br>
@@ -1625,7 +1626,7 @@ foreach k, v: config_host<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(&#39;HOST_&#39; + v.to_upper(), 1)=
<br>
=C2=A0 =C2=A0elif strings.contains(k)<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set_quoted(k, v)<br>
-=C2=A0 elif k.startswith(&#39;CONFIG_&#39;) or k.startswith(&#39;HAVE_&#39=
;) or k.startswith(&#39;HOST_&#39;)<br>
+=C2=A0 elif k.startswith(&#39;CONFIG_&#39;) or k.startswith(&#39;HAVE_&#39=
;)<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(k, v =3D=3D &#39;y&#39; ? 1 : v)<b=
r>
=C2=A0 =C2=A0endif<br>
=C2=A0endforeach<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000c0465405cdc94bb4--

