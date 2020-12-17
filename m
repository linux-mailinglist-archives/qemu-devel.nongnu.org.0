Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D922DD18C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:37:09 +0100 (CET)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsWq-0003aw-Hr
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsVY-0002mf-Cs
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:35:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsVS-0001FW-Lc
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608208541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q3ot8FrGo6ybMUEB4eWb9RGfM2Nob3Ex2rioWubNla0=;
 b=jU+Mkt9IElGfHy0XLYcxGN7urXZCpTMG85rA24uSuHHHFu43QO9qfIYnkxce6CVh+hoJSl
 qkmixlYB5QxhzxZSPfYi/ghDhUjvbnowa59XN9xvfrpGSZjKa+3aNQNDbic1ryfHkKBHvo
 JTvTf8qrKxbZ8Kvd5ZnTobmdohp02Cc=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-a0tLVdhpNzyc0MhHR9ZiRg-1; Thu, 17 Dec 2020 07:35:39 -0500
X-MC-Unique: a0tLVdhpNzyc0MhHR9ZiRg-1
Received: by mail-io1-f70.google.com with SMTP id y197so27125092iof.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3ot8FrGo6ybMUEB4eWb9RGfM2Nob3Ex2rioWubNla0=;
 b=fXXpiD5UiYzO6Q1Zd5dmoc3En/GdEfaDNhaeWng4nr6G5oWkOIAwZmQXDx/G0qQRvi
 NOH5aPUTDs2TmjrXpreCybUZ8XbrSsdg3+6XOZIQ50tkQQXSZ+9Bi6Ft/nkg5GLv8GPE
 i2veRcl/J20+23EOEeZYboSMyhR2dJRZXe/tWWxY3uF8ri1oOjAuwxqjGINLFLapL8C1
 wtX9zm2Ics4BbLiwwDpXWgUFoAZqQLcYCJ345hNzD7HhIWsNLJ/+T5IYfcM01mbqGi72
 1FvOIeJ1V2CzBpYn2E0aZRnirg81sJaUeh8Se5CBira7SOgW+qSlvoXxRLi9rPBMPdgf
 8+Kw==
X-Gm-Message-State: AOAM532Gdp28UyEEXN6Wxis7OYfitOiZmWUPZWPrOSrd/6FZofneboX2
 X4R2RIsqZ6NOIjlI+X7dpdukZALd8Y1xqMGmY37tgA6DiVwJzTM6/77oElO1AreOzr9Kv2jhKsp
 j9tPdJ5NnMkazKXIYUFmQQQnhuTP/MCk=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr50235948ilm.161.1608208538330; 
 Thu, 17 Dec 2020 04:35:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwQFpYyLHmm6sr/CIte0a/PVraOmN4lWn3vp+JsuZdLVyX459WMsEx+6QN2LIQ8uDKA3Tk+qD1WTOXb2jq2Vc=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr50235933ilm.161.1608208538155; 
 Thu, 17 Dec 2020 04:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-9-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-9-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:35:27 +0400
Message-ID: <CAMxuvawQHEghsAU2g5jzViMUANB94C_AbBxdcqAMW4N-=c5r3g@mail.gmail.com>
Subject: Re: [PATCH 08/18] libssh: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>, Pino Toscano <ptoscano@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a453e605b6a83a9a"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000a453e605b6a83a9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 45 ++++-----------------------------------------
>  meson.build       | 18 ++++++++++++++----
>  meson_options.txt |  2 ++
>  3 files changed, 20 insertions(+), 45 deletions(-)
>
> diff --git a/configure b/configure
> index c404252b17..f3271381f1 100755
> --- a/configure
> +++ b/configure
> @@ -430,7 +430,7 @@ auth_pam=3D"$default_feature"
>  vte=3D"$default_feature"
>  virglrenderer=3D"$default_feature"
>  tpm=3D"$default_feature"
> -libssh=3D"$default_feature"
> +libssh=3D"auto"
>  live_block_migration=3D${default_feature:-yes}
>  numa=3D"$default_feature"
>  tcmalloc=3D"no"
> @@ -1424,9 +1424,9 @@ for opt do
>    ;;
>    --enable-tpm) tpm=3D"yes"
>    ;;
> -  --disable-libssh) libssh=3D"no"
> +  --disable-libssh) libssh=3D"disabled"
>    ;;
> -  --enable-libssh) libssh=3D"yes"
> +  --enable-libssh) libssh=3D"enabled"
>    ;;
>    --disable-live-block-migration) live_block_migration=3D"no"
>    ;;
> @@ -3630,38 +3630,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# libssh probe
> -if test "$libssh" !=3D "no" ; then
> -  if $pkg_config --exists libssh; then
> -    libssh_cflags=3D$($pkg_config libssh --cflags)
> -    libssh_libs=3D$($pkg_config libssh --libs)
> -    libssh=3Dyes
> -  else
> -    if test "$libssh" =3D "yes" ; then
> -      error_exit "libssh required for --enable-libssh"
> -    fi
> -    libssh=3Dno
> -  fi
> -fi
> -
> -##########################################
> -# Check for libssh 0.8
> -# This is done like this instead of using the LIBSSH_VERSION_* and
> -# SSH_VERSION_* macros because some distributions in the past shipped
> -# snapshots of the future 0.8 from Git, and those snapshots did not
> -# have updated version numbers (still referring to 0.7.0).
> -
> -if test "$libssh" =3D "yes"; then
> -  cat > $TMPC <<EOF
> -#include <libssh/libssh.h>
> -int main(void) { return ssh_get_server_publickey(NULL, NULL); }
> -EOF
> -  if compile_prog "$libssh_cflags" "$libssh_libs"; then
> -    libssh_cflags=3D"-DHAVE_LIBSSH_0_8 $libssh_cflags"
> -  fi
> -fi
> -
>  ##########################################
>  # linux-aio probe
>
> @@ -6288,12 +6256,6 @@ if test "$getauxval" =3D "yes" ; then
>    echo "CONFIG_GETAUXVAL=3Dy" >> $config_host_mak
>  fi
>
> -if test "$libssh" =3D "yes" ; then
> -  echo "CONFIG_LIBSSH=3Dy" >> $config_host_mak
> -  echo "LIBSSH_CFLAGS=3D$libssh_cflags" >> $config_host_mak
> -  echo "LIBSSH_LIBS=3D$libssh_libs" >> $config_host_mak
> -fi
> -
>  if test "$live_block_migration" =3D "yes" ; then
>    echo "CONFIG_LIVE_BLOCK_MIGRATION=3Dy" >> $config_host_mak
>  fi
> @@ -6764,6 +6726,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
> +        -Dlibssh=3D$libssh \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 0b8c9c5917..2d6660aa46 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -652,9 +652,17 @@ if not get_option('glusterfs').auto() or have_block
>    endif
>  endif
>  libssh =3D not_found
> -if 'CONFIG_LIBSSH' in config_host
> -  libssh =3D declare_dependency(compile_args:
> config_host['LIBSSH_CFLAGS'].split(),
> -                              link_args:
> config_host['LIBSSH_LIBS'].split())
> +have_libssh_0_8 =3D false
> +if not get_option('libssh').auto() or have_block
> +  libssh =3D dependency('libssh',
> +                      required: get_option('libssh'),
> +                      method: 'pkg-config', static: enable_static)
> +  if libssh.found()
> +    have_libssh_0_8 =3D cc.links('''
> +      #include <libssh/libssh.h>
> +      int main(void) { return ssh_get_server_publickey(NULL, NULL); }
> +    ''', dependencies: libssh)
> +  endif
>

You dropped the comment about  LIBSSH_VERSION_*,  I think it's worth
keeping. Eventually, we should set an expectation when this can be dropped.
(presumably when debian old stable with 0.7.3 support is dropped, Pino?)

otherwise
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

 endif
>  libbzip2 =3D not_found
>  if not get_option('bzip2').auto() or have_block
> @@ -931,6 +939,8 @@
> config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT',
> glusterfs_ftruncate_
>  config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT',
> glusterfs_iocb_has_stat)
>  config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>  config_host_data.set('CONFIG_LIBNFS', libnfs.found())
> +config_host_data.set('CONFIG_LIBSSH', libssh.found())
> +config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
> @@ -2310,7 +2320,7 @@ summary_info +=3D {'crypto afalg':
> config_host.has_key('CONFIG_AF_ALG')}
>  summary_info +=3D {'GlusterFS support': glusterfs.found()}
>  summary_info +=3D {'gcov':              get_option('b_coverage')}
>  summary_info +=3D {'TPM support':       config_host.has_key('CONFIG_TPM'=
)}
> -summary_info +=3D {'libssh support':
> config_host.has_key('CONFIG_LIBSSH')}
> +summary_info +=3D {'libssh support':    libssh.found()}
>  summary_info +=3D {'QOM debugging':
>  config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
>  summary_info +=3D {'Live block migration':
> config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
>  summary_info +=3D {'lzo support':       config_host.has_key('CONFIG_LZO'=
)}
> diff --git a/meson_options.txt b/meson_options.txt
> index 4535bc4dc2..6466dc67f6 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -54,6 +54,8 @@ option('libiscsi', type : 'feature', value : 'auto',
>         description: 'libiscsi userspace initiator')
>  option('libnfs', type : 'feature', value : 'auto',
>         description: 'libnfs block device driver')
> +option('libssh', type : 'feature', value : 'auto',
> +       description: 'libssh block device driver')
>  option('mpath', type : 'feature', value : 'auto',
>         description: 'Multipath persistent reservation passthrough')
>  option('iconv', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000a453e605b6a83a9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini=
 &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-b=
y: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blan=
k">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 ++++-----------------=
------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++----<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 20 insertions(+), 45 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index c404252b17..f3271381f1 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -430,7 +430,7 @@ auth_pam=3D&quot;$default_feature&quot;<br>
=C2=A0vte=3D&quot;$default_feature&quot;<br>
=C2=A0virglrenderer=3D&quot;$default_feature&quot;<br>
=C2=A0tpm=3D&quot;$default_feature&quot;<br>
-libssh=3D&quot;$default_feature&quot;<br>
+libssh=3D&quot;auto&quot;<br>
=C2=A0live_block_migration=3D${default_feature:-yes}<br>
=C2=A0numa=3D&quot;$default_feature&quot;<br>
=C2=A0tcmalloc=3D&quot;no&quot;<br>
@@ -1424,9 +1424,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-tpm) tpm=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-libssh) libssh=3D&quot;no&quot;<br>
+=C2=A0 --disable-libssh) libssh=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-libssh) libssh=3D&quot;yes&quot;<br>
+=C2=A0 --enable-libssh) libssh=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-live-block-migration) live_block_migration=3D&quot;n=
o&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -3630,38 +3630,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# libssh probe<br>
-if test &quot;$libssh&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 if $pkg_config --exists libssh; then<br>
-=C2=A0 =C2=A0 libssh_cflags=3D$($pkg_config libssh --cflags)<br>
-=C2=A0 =C2=A0 libssh_libs=3D$($pkg_config libssh --libs)<br>
-=C2=A0 =C2=A0 libssh=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$libssh&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 error_exit &quot;libssh required for --enable-libssh&=
quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 libssh=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
-##########################################<br>
-# Check for libssh 0.8<br>
-# This is done like this instead of using the LIBSSH_VERSION_* and<br>
-# SSH_VERSION_* macros because some distributions in the past shipped<br>
-# snapshots of the future 0.8 from Git, and those snapshots did not<br>
-# have updated version numbers (still referring to 0.7.0).<br>
-<br>
-if test &quot;$libssh&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt;EOF<br>
-#include &lt;libssh/libssh.h&gt;<br>
-int main(void) { return ssh_get_server_publickey(NULL, NULL); }<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;$libssh_cflags&quot; &quot;$libssh_libs&quot;=
; then<br>
-=C2=A0 =C2=A0 libssh_cflags=3D&quot;-DHAVE_LIBSSH_0_8 $libssh_cflags&quot;=
<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# linux-aio probe<br>
<br>
@@ -6288,12 +6256,6 @@ if test &quot;$getauxval&quot; =3D &quot;yes&quot; ;=
 then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GETAUXVAL=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
=C2=A0fi<br>
<br>
-if test &quot;$libssh&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_LIBSSH=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LIBSSH_CFLAGS=3D$libssh_cflags&quot; &gt;&gt; $config_ho=
st_mak<br>
-=C2=A0 echo &quot;LIBSSH_LIBS=3D$libssh_libs&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$live_block_migration&quot; =3D &quot;yes&quot; ; then<=
br>
=C2=A0 =C2=A0echo &quot;CONFIG_LIVE_BLOCK_MIGRATION=3Dy&quot; &gt;&gt; $con=
fig_host_mak<br>
=C2=A0fi<br>
@@ -6764,6 +6726,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 0b8c9c5917..2d6660aa46 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -652,9 +652,17 @@ if not get_option(&#39;glusterfs&#39;).auto() or have_=
block<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
=C2=A0libssh =3D not_found<br>
-if &#39;CONFIG_LIBSSH&#39; in config_host<br>
-=C2=A0 libssh =3D declare_dependency(compile_args: config_host[&#39;LIBSSH=
_CFLAGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;LIBSSH_LIBS&#39=
;].split())<br>
+have_libssh_0_8 =3D false<br>
+if not get_option(&#39;libssh&#39;).auto() or have_block<br>
+=C2=A0 libssh =3D dependency(&#39;libssh&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;libssh&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 method: &#39;pkg-config&#39;, static: enable_static)<br>
+=C2=A0 if libssh.found()<br>
+=C2=A0 =C2=A0 have_libssh_0_8 =3D cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 #include &lt;libssh/libssh.h&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 int main(void) { return ssh_get_server_publickey(NULL=
, NULL); }<br>
+=C2=A0 =C2=A0 &#39;&#39;&#39;, dependencies: libssh)<br>
+=C2=A0 endif<br></blockquote><div><br></div><div>You dropped the comment a=
bout=C2=A0  LIBSSH_VERSION_*,=C2=A0 I think it&#39;s worth keeping. Eventua=
lly, we should set an expectation when this can be dropped. (presumably whe=
n debian old stable with 0.7.3 support is dropped, Pino?)<br></div><div><br=
></div><div>otherwise</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a =
href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>=
&gt; <br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0endif<br>
=C2=A0libbzip2 =3D not_found<br>
=C2=A0if not get_option(&#39;bzip2&#39;).auto() or have_block<br>
@@ -931,6 +939,8 @@ config_host_data.set(&#39;CONFIG_GLUSTERFS_FTRUNCATE_HA=
S_STAT&#39;, glusterfs_ftruncate_<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_IOCB_HAS_STAT&#39;, gluste=
rfs_iocb_has_stat)<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBISCSI&#39;, libiscsi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBNFS&#39;, libnfs.found())<br>
+config_host_data.set(&#39;CONFIG_LIBSSH&#39;, libssh.found())<br>
+config_host_data.set(&#39;HAVE_LIBSSH_0_8&#39;, have_libssh_0_8)<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
@@ -2310,7 +2320,7 @@ summary_info +=3D {&#39;crypto afalg&#39;:=C2=A0 =C2=
=A0 =C2=A0 config_host.has_key(&#39;CONFIG_AF_ALG&#39;)}<br>
=C2=A0summary_info +=3D {&#39;GlusterFS support&#39;: glusterfs.found()}<br=
>
=C2=A0summary_info +=3D {&#39;gcov&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 get_option(&#39;b_coverage&#39;)}<br>
=C2=A0summary_info +=3D {&#39;TPM support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host.has_key(&#39;CONFIG_TPM&#39;)}<br>
-summary_info +=3D {&#39;libssh support&#39;:=C2=A0 =C2=A0 config_host.has_=
key(&#39;CONFIG_LIBSSH&#39;)}<br>
+summary_info +=3D {&#39;libssh support&#39;:=C2=A0 =C2=A0 libssh.found()}<=
br>
=C2=A0summary_info +=3D {&#39;QOM debugging&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_QOM_CAST_DEBUG&#39;)}<br>
=C2=A0summary_info +=3D {&#39;Live block migration&#39;: config_host.has_ke=
y(&#39;CONFIG_LIVE_BLOCK_MIGRATION&#39;)}<br>
=C2=A0summary_info +=3D {&#39;lzo support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host.has_key(&#39;CONFIG_LZO&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 4535bc4dc2..6466dc67f6 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -54,6 +54,8 @@ option(&#39;libiscsi&#39;, type : &#39;feature&#39;, valu=
e : &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;libiscsi userspace initiator&=
#39;)<br>
=C2=A0option(&#39;libnfs&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;libnfs block device driver&#3=
9;)<br>
+option(&#39;libssh&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;libssh block device driver&#3=
9;)<br>
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

--000000000000a453e605b6a83a9a--


