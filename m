Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA12DD100
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:01:58 +0100 (CET)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprym-0000U0-Ef
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprwP-0007hy-Ho
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprwM-0005uQ-0y
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608206365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hFzxl0vFDHTLw0bSRva3gSou2Vwi5Aps9FMJP8/KxXc=;
 b=dinEriwHKqWgm0ymSI7H0mySMxAwMG904ua6y2GCpMdFrjZoou6nDYVbkT+MoCjPUWo+ao
 3AKFYSN+fgb/u+g7pQB3ET46jV4YNCscu3xpdo1wksjhEEaQbiwgt1bvZcP6kUS+AXc5GL
 BYWIFVEJc5VVW3yf18qo6OzEzPEcTeY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-7PHzEVkuPyG4y0H-u8l21w-1; Thu, 17 Dec 2020 06:59:23 -0500
X-MC-Unique: 7PHzEVkuPyG4y0H-u8l21w-1
Received: by mail-il1-f200.google.com with SMTP id h4so31389092ilq.19
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 03:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFzxl0vFDHTLw0bSRva3gSou2Vwi5Aps9FMJP8/KxXc=;
 b=kbKAli24x0K/HnOjMOoFyLN3eh4HC+CLNsu1IRFSNz/PB3OsmUB/CkLj2Cd/X3I8NR
 FPRZVckFn3mJa1fs7g2tR5BUVIPI4PsRXCz09nZaMWnv2OfSrtMa/yg3KHypzf/Y+9UC
 ri+RmsWIICk3we14f0R+p5EPXmGvmSKrDiP/GGXqKYsS0GFYcwNl53tc4MkkD3q6t72W
 9XZq2kQRq5EJ1y9iiHkZL2u4Lx/YVk6WSd1KHAmf2OIap0jLUl6r8brayMLp/c9yqZTG
 RqQHkXn2rjw8De0awpCYChQHx4PSqHwRoPwqhE97p1it/06kqvuXsgo5LpPYOEFfM+qh
 IraA==
X-Gm-Message-State: AOAM533yZB8P3UbVWB+PbA90OkBwO8XAAt3GXB0h/Jiy6+y6GMgseYoF
 PddPCdBivsBUgAzwQmbsgmDP+AmUDBzdc4/QP8ifnSt1J3cdPonmf84/rFGwtc7ZUiGymXX4D8x
 UhFqVBKiJ6JPrucScpRYnHafkif6ws7Y=
X-Received: by 2002:a02:5e81:: with SMTP id h123mr47327393jab.36.1608206362537; 
 Thu, 17 Dec 2020 03:59:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0Tmj7jkkyt37iU784/a+WXljKC6wmC7O1DOAkkbMnY+1DXIC4beC3goi9Tqf0hnDOfWftQYE7JcWEaM2WYK8=
X-Received: by 2002:a02:5e81:: with SMTP id h123mr47327389jab.36.1608206362349; 
 Thu, 17 Dec 2020 03:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-4-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 15:59:11 +0400
Message-ID: <CAMxuvayRJiJNP7xS9BXaSpvfdYBiAbJcTjRJB-Q+wsLM=PPoVA@mail.gmail.com>
Subject: Re: [PATCH 03/18] curl: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f4275f05b6a7b87f"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

--000000000000f4275f05b6a7b87f
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
---
>  configure                   | 31 ++++---------------------------
>  contrib/elf2dmp/meson.build |  2 +-
>  meson.build                 | 11 +++++++----
>  meson_options.txt           |  2 ++
>  4 files changed, 14 insertions(+), 32 deletions(-)
>
> diff --git a/configure b/configure
> index c0a3e1556b..71196b1fe7 100755
> --- a/configure
> +++ b/configure
> @@ -307,7 +307,7 @@ for opt do
>  done
>
>  brlapi="auto"
> -curl="$default_feature"
> +curl="auto"
>

What about default_feature=no ?

 iconv="auto"
>  curses="auto"
>  docs="auto"
> @@ -1216,9 +1216,9 @@ for opt do
>    ;;
>    --enable-iconv) iconv="enabled"
>    ;;
> -  --disable-curl) curl="no"
> +  --disable-curl) curl="disabled"
>    ;;
> -  --enable-curl) curl="yes"
> +  --enable-curl) curl="enabled"
>    ;;
>    --disable-fdt) fdt="disabled"
>    ;;
> @@ -3425,25 +3425,6 @@ for drv in $audio_drv_list; do
>      esac
>  done
>
> -##########################################
> -# curl probe
> -if test "$curl" != "no" ; then
> -  cat > $TMPC << EOF
> -#include <curl/curl.h>
> -int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
> -EOF
> -  curl_cflags=$($pkg_config libcurl --cflags 2>/dev/null)
> -  curl_libs=$($pkg_config libcurl --libs 2>/dev/null)
> -  if compile_prog "$curl_cflags" "$curl_libs" ; then
> -    curl=yes
> -  else
> -    if test "$curl" = "yes" ; then
> -      feature_not_found "curl" "Install libcurl devel"
> -    fi
> -    curl=no
> -  fi
> -fi # test "$curl"
> -
>  ##########################################
>  # glib support probe
>
> @@ -6104,11 +6085,6 @@ fi
>  if test "$bswap_h" = "yes" ; then
>    echo "CONFIG_MACHINE_BSWAP_H=y" >> $config_host_mak
>  fi
> -if test "$curl" = "yes" ; then
> -  echo "CONFIG_CURL=y" >> $config_host_mak
> -  echo "CURL_CFLAGS=$curl_cflags" >> $config_host_mak
> -  echo "CURL_LIBS=$curl_libs" >> $config_host_mak
> -fi
>  if test "$gtk" = "yes" ; then
>    echo "CONFIG_GTK=y" >> $config_host_mak
>    echo "GTK_CFLAGS=$gtk_cflags" >> $config_host_mak
> @@ -6943,6 +6919,7 @@ NINJA=$ninja $meson setup \
>          -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg
> -Dvnc_png=$vnc_png \
>          -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f
> -Dvirtiofsd=$virtiofsd \
>          -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
> +        -Dcurl=$curl \
>          -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>          -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>          -Dvhost_user_blk_server=$vhost_user_blk_server \
> diff --git a/contrib/elf2dmp/meson.build b/contrib/elf2dmp/meson.build
> index b3de173316..4d86cb390a 100644
> --- a/contrib/elf2dmp/meson.build
> +++ b/contrib/elf2dmp/meson.build
> @@ -1,4 +1,4 @@
> -if 'CONFIG_CURL' in config_host
> +if curl.found()
>    executable('elf2dmp', files('main.c', 'addrspace.c', 'download.c',
> 'pdb.c', 'qemu_elf.c'),
>               dependencies: [glib, curl],
>               install: true)
> diff --git a/meson.build b/meson.build
> index 70f81121d7..83dbc61acd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -392,9 +392,11 @@ if 'CONFIG_VIRGL' in config_host
>                               link_args: config_host['VIRGL_LIBS'].split())
>  endif
>  curl = not_found
> -if 'CONFIG_CURL' in config_host
> -  curl = declare_dependency(compile_args:
> config_host['CURL_CFLAGS'].split(),
> -                            link_args: config_host['CURL_LIBS'].split())
> +if not get_option('curl').auto() or have_block
> +  curl = dependency('libcurl', version: '>=7.29.0',
> +                    method: 'pkg-config',
> +                    required: get_option('curl'),
> +                    static: enable_static)
>  endif
>  libudev = not_found
>  if targetos == 'linux' and (have_system or have_tools)
> @@ -872,6 +874,7 @@ config_host_data.set('CONFIG_COCOA', cocoa.found())
>  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
>  config_host_data.set('CONFIG_MPATH', mpathpersist.found())
>  config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
> +config_host_data.set('CONFIG_CURL', curl.found())
>  config_host_data.set('CONFIG_CURSES', curses.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
> @@ -2160,7 +2163,7 @@ summary_info += {'iconv support':     iconv.found()}
>  summary_info += {'curses support':    curses.found()}
>  # TODO: add back version
>  summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
> -summary_info += {'curl support':      config_host.has_key('CONFIG_CURL')}
> +summary_info += {'curl support':      curl.found()}
>  summary_info += {'mingw32 support':   targetos == 'windows'}
>  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
>  summary_info += {'Block whitelist (rw)':
> config_host['CONFIG_BDRV_RW_WHITELIST']}
> diff --git a/meson_options.txt b/meson_options.txt
> index 62efe96a91..2b845ac62b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -44,6 +44,8 @@ option('brlapi', type : 'feature', value : 'auto',
>         description: 'brlapi character device driver')
>  option('cocoa', type : 'feature', value : 'auto',
>         description: 'Cocoa user interface (macOS only)')
> +option('curl', type : 'feature', value : 'auto',
> +       description: 'CURL block device driver')
>  option('mpath', type : 'feature', value : 'auto',
>         description: 'Multipath persistent reservation passthrough')
>  option('iconv', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000f4275f05b6a7b87f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini=
 &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-b=
y: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blan=
k">pbonzini@redhat.com</a>&gt;<br></blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 31 ++++---------------------------<br>
=C2=A0contrib/elf2dmp/meson.build |=C2=A0 2 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 11 +++++++----<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
+<br>
=C2=A04 files changed, 14 insertions(+), 32 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index c0a3e1556b..71196b1fe7 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -307,7 +307,7 @@ for opt do<br>
=C2=A0done<br>
<br>
=C2=A0brlapi=3D&quot;auto&quot;<br>
-curl=3D&quot;$default_feature&quot;<br>
+curl=3D&quot;auto&quot;<br></blockquote><div><br></div><div>What about def=
ault_feature=3Dno ?</div><div> <br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
=C2=A0iconv=3D&quot;auto&quot;<br>
=C2=A0curses=3D&quot;auto&quot;<br>
=C2=A0docs=3D&quot;auto&quot;<br>
@@ -1216,9 +1216,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-iconv) iconv=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-curl) curl=3D&quot;no&quot;<br>
+=C2=A0 --disable-curl) curl=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-curl) curl=3D&quot;yes&quot;<br>
+=C2=A0 --enable-curl) curl=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-fdt) fdt=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -3425,25 +3425,6 @@ for drv in $audio_drv_list; do<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0done<br>
<br>
-##########################################<br>
-# curl probe<br>
-if test &quot;$curl&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;curl/curl.h&gt;<br>
-int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }=
<br>
-EOF<br>
-=C2=A0 curl_cflags=3D$($pkg_config libcurl --cflags 2&gt;/dev/null)<br>
-=C2=A0 curl_libs=3D$($pkg_config libcurl --libs 2&gt;/dev/null)<br>
-=C2=A0 if compile_prog &quot;$curl_cflags&quot; &quot;$curl_libs&quot; ; t=
hen<br>
-=C2=A0 =C2=A0 curl=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$curl&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;curl&quot; &quot;Install libc=
url devel&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 curl=3Dno<br>
-=C2=A0 fi<br>
-fi # test &quot;$curl&quot;<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# glib support probe<br>
<br>
@@ -6104,11 +6085,6 @@ fi<br>
=C2=A0if test &quot;$bswap_h&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MACHINE_BSWAP_H=3Dy&quot; &gt;&gt; $config_h=
ost_mak<br>
=C2=A0fi<br>
-if test &quot;$curl&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_CURL=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;CURL_CFLAGS=3D$curl_cflags&quot; &gt;&gt; $config_host_m=
ak<br>
-=C2=A0 echo &quot;CURL_LIBS=3D$curl_libs&quot; &gt;&gt; $config_host_mak<b=
r>
-fi<br>
=C2=A0if test &quot;$gtk&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GTK=3Dy&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;GTK_CFLAGS=3D$gtk_cflags&quot; &gt;&gt; $config_hos=
t_mak<br>
@@ -6943,6 +6919,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc=
_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Diconv=3D$iconv -Dcurses=3D$curses -Dlib=
udev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
diff --git a/contrib/elf2dmp/meson.build b/contrib/elf2dmp/meson.build<br>
index b3de173316..4d86cb390a 100644<br>
--- a/contrib/elf2dmp/meson.build<br>
+++ b/contrib/elf2dmp/meson.build<br>
@@ -1,4 +1,4 @@<br>
-if &#39;CONFIG_CURL&#39; in config_host<br>
+if curl.found()<br>
=C2=A0 =C2=A0executable(&#39;elf2dmp&#39;, files(&#39;main.c&#39;, &#39;add=
rspace.c&#39;, &#39;download.c&#39;, &#39;pdb.c&#39;, &#39;qemu_elf.c&#39;)=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [glib, curl]=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true)<br>
diff --git a/meson.build b/meson.build<br>
index 70f81121d7..83dbc61acd 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -392,9 +392,11 @@ if &#39;CONFIG_VIRGL&#39; in config_host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;VIRGL_LIBS&#39;=
].split())<br>
=C2=A0endif<br>
=C2=A0curl =3D not_found<br>
-if &#39;CONFIG_CURL&#39; in config_host<br>
-=C2=A0 curl =3D declare_dependency(compile_args: config_host[&#39;CURL_CFL=
AGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;CURL_LIBS&#39;].split(=
))<br>
+if not get_option(&#39;curl&#39;).auto() or have_block<br>
+=C2=A0 curl =3D dependency(&#39;libcurl&#39;, version: &#39;&gt;=3D7.29.0&=
#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meth=
od: &#39;pkg-config&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requ=
ired: get_option(&#39;curl&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
ic: enable_static)<br>
=C2=A0endif<br>
=C2=A0libudev =3D not_found<br>
=C2=A0if targetos =3D=3D &#39;linux&#39; and (have_system or have_tools)<br=
>
@@ -872,6 +874,7 @@ config_host_data.set(&#39;CONFIG_COCOA&#39;, cocoa.foun=
d())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBUDEV&#39;, libudev.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH&#39;, mpathpersist.found())<br=
>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH_NEW_API&#39;, mpathpersist_new=
_api)<br>
+config_host_data.set(&#39;CONFIG_CURL&#39;, curl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_CURSES&#39;, curses.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
@@ -2160,7 +2163,7 @@ summary_info +=3D {&#39;iconv support&#39;:=C2=A0 =C2=
=A0 =C2=A0iconv.found()}<br>
=C2=A0summary_info +=3D {&#39;curses support&#39;:=C2=A0 =C2=A0 curses.foun=
d()}<br>
=C2=A0# TODO: add back version<br>
=C2=A0summary_info +=3D {&#39;virgl support&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_VIRGL&#39;)}<br>
-summary_info +=3D {&#39;curl support&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_CURL&#39;)}<br>
+summary_info +=3D {&#39;curl support&#39;:=C2=A0 =C2=A0 =C2=A0 curl.found(=
)}<br>
=C2=A0summary_info +=3D {&#39;mingw32 support&#39;:=C2=A0 =C2=A0targetos =
=3D=3D &#39;windows&#39;}<br>
=C2=A0summary_info +=3D {&#39;Audio drivers&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host[&#39;CONFIG_AUDIO_DRIVERS&#39;]}<br>
=C2=A0summary_info +=3D {&#39;Block whitelist (rw)&#39;: config_host[&#39;C=
ONFIG_BDRV_RW_WHITELIST&#39;]}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 62efe96a91..2b845ac62b 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -44,6 +44,8 @@ option(&#39;brlapi&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;brlapi character device drive=
r&#39;)<br>
=C2=A0option(&#39;cocoa&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Cocoa user interface (macOS o=
nly)&#39;)<br>
+option(&#39;curl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;CURL block device driver&#39;=
)<br>
=C2=A0option(&#39;mpath&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Multipath persistent reservat=
ion passthrough&#39;)<br>
=C2=A0option(&#39;iconv&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000f4275f05b6a7b87f--


