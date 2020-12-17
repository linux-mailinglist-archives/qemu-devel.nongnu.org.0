Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACCD2DD1AF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:49:08 +0100 (CET)
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsiR-0007Br-C5
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpshR-0006l6-Qn
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpshP-000514-GN
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608209282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MA4QpWZcC5d8RZF7R97EFBJyqFk5AaEfqjnSBt5UggU=;
 b=ghZl/Xn+OBnMnsCue/I7fe93pAoUOYstclnckajaT3mV/YGlbfzu5zCePLPmYfcvbdG3E7
 Lx/A/TEYx6H6UkYgtt1UzYToJB/x2ngrBTBz5q1HSKzRW7UnnBXWuHtfpeZLYfjhOEoWbL
 ZhNYbKXYDJKTlX7Pq3lxv2kBtYI3R18=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-KN0VIv2oMJClBG5jzHUsAA-1; Thu, 17 Dec 2020 07:47:59 -0500
X-MC-Unique: KN0VIv2oMJClBG5jzHUsAA-1
Received: by mail-io1-f70.google.com with SMTP id 191so26931890iob.15
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MA4QpWZcC5d8RZF7R97EFBJyqFk5AaEfqjnSBt5UggU=;
 b=V66tdZ7VnHzuwtE8DZ2daZEEGjdFMY+xNKdOo6Bs5znUKzAsFgvAlvVn7hqkFJiFU2
 cC26bD9a7SanbhFaRusQDDJLhYj38xy25RFr27CPViwqaG6drRU7bmxIUzCsX/pq3LmB
 izJ/i+CMsnsM+8zKv39Q7yK1ITvTUbwA2bxWs30c+nEJjkleIdXUQ0d135mZFde9mNiM
 uXrUZMWQAvZtoEELzTW39sBFXWMtxjkQp7oINWErHo9Qo6hYbaP9+Ex02AeC8ndASJCw
 w/yiLDWdpF4x8ZUix7dJjpnM95oBBqu2sNdcWdhJbHa4idZ0GS0cZuStM4z3oA12QTVn
 Z2zA==
X-Gm-Message-State: AOAM532ii2r5OKC3lBjFvXx/0pKnUFdYX/2NVjSEGkI/O3iFIPHjejuX
 zfx9+MNRjD49DMkTd9VhdtRCYpCkejT3JUFz1qKzEgKoKWlzM/xK3qBfbFXUALJNJnjmDabAHI1
 LSJVg3YK5Q4wE+YVgwg4AxguV8PicxCk=
X-Received: by 2002:a92:b694:: with SMTP id m20mr43126431ill.182.1608209278616; 
 Thu, 17 Dec 2020 04:47:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD53thzOrZeQfdM08a93hXn60E0YeXu9f/9uSfFV3PftEbz/yN6YARTMY6toTTBdDQgpc2Pqoe+5ysNuoiWbE=
X-Received: by 2002:a92:b694:: with SMTP id m20mr43126418ill.182.1608209278486; 
 Thu, 17 Dec 2020 04:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-12-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-12-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:47:47 +0400
Message-ID: <CAMxuvayrX8CWZ9PCJ5oD+xcRSR_oBUUz2c9NOJ0BXGh+hp_BAg@mail.gmail.com>
Subject: Re: [PATCH 11/18] snappy: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c4d9c605b6a8669b"
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

--000000000000c4d9c605b6a8669b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure         | 32 ++++----------------------------
>  meson.build       | 19 +++++++++++++++----
>  meson_options.txt |  2 ++
>  3 files changed, 21 insertions(+), 32 deletions(-)
>
> diff --git a/configure b/configure
> index f52f04d0e3..aee27d9cdd 100755
> --- a/configure
> +++ b/configure
> @@ -395,7 +395,7 @@ cpuid_h=3D"no"
>  avx2_opt=3D"$default_feature"
>  capstone=3D"auto"
>  lzo=3D"auto"
> -snappy=3D"$default_feature"
> +snappy=3D"auto"
>  bzip2=3D"auto"
>  lzfse=3D"$default_feature"
>  zstd=3D"$default_feature"
> @@ -1316,9 +1316,9 @@ for opt do
>    ;;
>    --enable-lzo) lzo=3D"enabled"
>    ;;
> -  --disable-snappy) snappy=3D"no"
> +  --disable-snappy) snappy=3D"disabled"
>    ;;
> -  --enable-snappy) snappy=3D"yes"
> +  --enable-snappy) snappy=3D"enabled"
>    ;;
>    --disable-bzip2) bzip2=3D"disabled"
>    ;;
> @@ -2458,25 +2458,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# snappy check
> -
> -if test "$snappy" !=3D "no" ; then
> -    cat > $TMPC << EOF
> -#include <snappy-c.h>
> -int main(void) { snappy_max_compressed_length(4096); return 0; }
> -EOF
> -    if compile_prog "" "-lsnappy" ; then
> -        snappy_libs=3D'-lsnappy'
> -        snappy=3D"yes"
> -    else
> -        if test "$snappy" =3D "yes"; then
> -            feature_not_found "libsnappy" "Install libsnappy devel"
> -        fi
> -        snappy=3D"no"
> -    fi
> -fi
> -
>  ##########################################
>  # lzfse check
>
> @@ -6107,11 +6088,6 @@ if test "$avx512f_opt" =3D "yes" ; then
>    echo "CONFIG_AVX512F_OPT=3Dy" >> $config_host_mak
>  fi
>
> -if test "$snappy" =3D "yes" ; then
> -  echo "CONFIG_SNAPPY=3Dy" >> $config_host_mak
> -  echo "SNAPPY_LIBS=3D$snappy_libs" >> $config_host_mak
> -fi
> -
>  if test "$lzfse" =3D "yes" ; then
>    echo "CONFIG_LZFSE=3Dy" >> $config_host_mak
>    echo "LZFSE_LIBS=3D-llzfse" >> $config_host_mak
> @@ -6675,7 +6651,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
> -        -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo \
> +        -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy =
\
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 0310d6d89a..9f6ea65626 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -749,9 +749,19 @@ if get_option('vnc').enabled()
>                                compile_args: '-DSTRUCT_IOVEC_DEFINED')
>    endif
>  endif
> -snappy =3D not_found
> -if 'CONFIG_SNAPPY' in config_host
> -  snappy =3D declare_dependency(link_args:
> config_host['SNAPPY_LIBS'].split())
> +
> +snappy =3D cc.find_library('snappy', has_headers: ['snappy-c.h'],
> +                      required: get_option('snappy'),
> +                      static: enable_static)
> +if snappy.found() and not cc.links('''
> +   #include <snappy-c.h>
> +   int main(void) { snappy_max_compressed_length(4096); return 0; }''',
> dependencies: snappy)
> +  snappy =3D not_found
> +  if get_option('snappy').enabled()
> +    error('could not link libsnappy')
> +  else
> +    warning('could not link libsnappy, disabling')
> +  endif
>  endif
>

fwiw, .pc file is provided since 1.1.4, released about 4y ago (in debian
oldstable, but not centos7..)


>  lzo =3D cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
> @@ -971,6 +981,7 @@ config_host_data.set('HAVE_LIBSSH_0_8',
> have_libssh_0_8)
>  config_host_data.set('CONFIG_RBD', rbd.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
> +config_host_data.set('CONFIG_SNAPPY', snappy.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> @@ -2352,7 +2363,7 @@ summary_info +=3D {'libssh support':    libssh.foun=
d()}
>  summary_info +=3D {'QOM debugging':
>  config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
>  summary_info +=3D {'Live block migration':
> config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
>  summary_info +=3D {'lzo support':       lzo.found()}
> -summary_info +=3D {'snappy support':
> config_host.has_key('CONFIG_SNAPPY')}
> +summary_info +=3D {'snappy support':    snappy.found()}
>  summary_info +=3D {'bzip2 support':     libbzip2.found()}
>  summary_info +=3D {'lzfse support':     config_host.has_key('CONFIG_LZFS=
E')}
>  summary_info +=3D {'zstd support':      config_host.has_key('CONFIG_ZSTD=
')}
> diff --git a/meson_options.txt b/meson_options.txt
> index 00a5ec55bd..e2b7e23887 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -72,6 +72,8 @@ option('sdl', type : 'feature', value : 'auto',
>         description: 'SDL user interface')
>  option('sdl_image', type : 'feature', value : 'auto',
>         description: 'SDL Image support for icons')
> +option('snappy', type : 'feature', value : 'auto',
> +       description: 'snappy compression support')
>  option('u2f', type : 'feature', value : 'auto',
>         description: 'U2F emulation support')
>  option('vnc', type : 'feature', value : 'enabled',
> --
> 2.29.2
>
>
>

--000000000000c4d9c605b6a8669b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:41 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com">marcandre.lureau@redhat.com</a>&gt; </div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++-----------------=
-----------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++----<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 21 insertions(+), 32 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index f52f04d0e3..aee27d9cdd 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -395,7 +395,7 @@ cpuid_h=3D&quot;no&quot;<br>
=C2=A0avx2_opt=3D&quot;$default_feature&quot;<br>
=C2=A0capstone=3D&quot;auto&quot;<br>
=C2=A0lzo=3D&quot;auto&quot;<br>
-snappy=3D&quot;$default_feature&quot;<br>
+snappy=3D&quot;auto&quot;<br>
=C2=A0bzip2=3D&quot;auto&quot;<br>
=C2=A0lzfse=3D&quot;$default_feature&quot;<br>
=C2=A0zstd=3D&quot;$default_feature&quot;<br>
@@ -1316,9 +1316,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-lzo) lzo=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-snappy) snappy=3D&quot;no&quot;<br>
+=C2=A0 --disable-snappy) snappy=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-snappy) snappy=3D&quot;yes&quot;<br>
+=C2=A0 --enable-snappy) snappy=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-bzip2) bzip2=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2458,25 +2458,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# snappy check<br>
-<br>
-if test &quot;$snappy&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;snappy-c.h&gt;<br>
-int main(void) { snappy_max_compressed_length(4096); return 0; }<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;-lsnappy&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 snappy_libs=3D&#39;-lsnappy&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 snappy=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$snappy&quot; =3D &quot;yes&quot=
;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;libsnapp=
y&quot; &quot;Install libsnappy devel&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 snappy=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# lzfse check<br>
<br>
@@ -6107,11 +6088,6 @@ if test &quot;$avx512f_opt&quot; =3D &quot;yes&quot;=
 ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_AVX512F_OPT=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$snappy&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_SNAPPY=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;SNAPPY_LIBS=3D$snappy_libs&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$lzfse&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_LZFSE=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0 =C2=A0echo &quot;LZFSE_LIBS=3D-llzfse&quot; &gt;&gt; $config_host_ma=
k<br>
@@ -6675,7 +6651,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -=
Dsnappy=3D$snappy \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 0310d6d89a..9f6ea65626 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -749,9 +749,19 @@ if get_option(&#39;vnc&#39;).enabled()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compile_args: &#39;-DSTRUCT_IOVEC_DEF=
INED&#39;)<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
-snappy =3D not_found<br>
-if &#39;CONFIG_SNAPPY&#39; in config_host<br>
-=C2=A0 snappy =3D declare_dependency(link_args: config_host[&#39;SNAPPY_LI=
BS&#39;].split())<br>
+<br>
+snappy =3D cc.find_library(&#39;snappy&#39;, has_headers: [&#39;snappy-c.h=
&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;snappy&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 static: enable_static)<br>
+if snappy.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0#include &lt;snappy-c.h&gt;<br>
+=C2=A0 =C2=A0int main(void) { snappy_max_compressed_length(4096); return 0=
; }&#39;&#39;&#39;, dependencies: snappy)<br>
+=C2=A0 snappy =3D not_found<br>
+=C2=A0 if get_option(&#39;snappy&#39;).enabled()<br>
+=C2=A0 =C2=A0 error(&#39;could not link libsnappy&#39;)<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 warning(&#39;could not link libsnappy, disabling&#39;)<br>
+=C2=A0 endif<br>
=C2=A0endif<br></blockquote><div><br></div><div>fwiw, .pc file is provided =
since 1.1.4, released about 4y ago (in debian oldstable, but not centos7..)=
<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
=C2=A0lzo =3D cc.find_library(&#39;lzo2&#39;, has_headers: [&#39;lzo/lzo1x.=
h&#39;],<br>
@@ -971,6 +981,7 @@ config_host_data.set(&#39;HAVE_LIBSSH_0_8&#39;, have_li=
bssh_0_8)<br>
=C2=A0config_host_data.set(&#39;CONFIG_RBD&#39;, rbd.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
+config_host_data.set(&#39;CONFIG_SNAPPY&#39;, snappy.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC_JPEG&#39;, jpeg.found())<br>
@@ -2352,7 +2363,7 @@ summary_info +=3D {&#39;libssh support&#39;:=C2=A0 =
=C2=A0 libssh.found()}<br>
=C2=A0summary_info +=3D {&#39;QOM debugging&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_QOM_CAST_DEBUG&#39;)}<br>
=C2=A0summary_info +=3D {&#39;Live block migration&#39;: config_host.has_ke=
y(&#39;CONFIG_LIVE_BLOCK_MIGRATION&#39;)}<br>
=C2=A0summary_info +=3D {&#39;lzo support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0l=
zo.found()}<br>
-summary_info +=3D {&#39;snappy support&#39;:=C2=A0 =C2=A0 config_host.has_=
key(&#39;CONFIG_SNAPPY&#39;)}<br>
+summary_info +=3D {&#39;snappy support&#39;:=C2=A0 =C2=A0 snappy.found()}<=
br>
=C2=A0summary_info +=3D {&#39;bzip2 support&#39;:=C2=A0 =C2=A0 =C2=A0libbzi=
p2.found()}<br>
=C2=A0summary_info +=3D {&#39;lzfse support&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_LZFSE&#39;)}<br>
=C2=A0summary_info +=3D {&#39;zstd support&#39;:=C2=A0 =C2=A0 =C2=A0 config=
_host.has_key(&#39;CONFIG_ZSTD&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 00a5ec55bd..e2b7e23887 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -72,6 +72,8 @@ option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &=
#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SDL user interface&#39;)<br>
=C2=A0option(&#39;sdl_image&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SDL Image support for icons&#=
39;)<br>
+option(&#39;snappy&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;snappy compression support&#3=
9;)<br>
=C2=A0option(&#39;u2f&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;U2F emulation support&#39;)<b=
r>
=C2=A0option(&#39;vnc&#39;, type : &#39;feature&#39;, value : &#39;enabled&=
#39;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000c4d9c605b6a8669b--


