Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8262DD191
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:40:08 +0100 (CET)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsZj-0004lu-Dd
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsWr-0003w0-RA
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsWc-0001g8-8j
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608208612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tqgPbmXUQJG+oqee7pTX03sITS/s3zJ9J0HSAwd1f1U=;
 b=WpKIJqtGqbHAJ6E0oWaTWbhYn8Yrp03yu9PKK0fHsTyIAUgKDaQiUHx0wjcLvrfBVpbWrv
 LLFPDQRyF0A9PBmlxjqkBzx+HlyjN/LCLSxJa3YF8AQDjGeVo4eF7TYXcGjCaxgthaG9cg
 Niqv1GEt7ejRRufXvtVFN3+N1ItbZiw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-RtUb3clUNN6lEsfxn6ka2g-1; Thu, 17 Dec 2020 07:36:49 -0500
X-MC-Unique: RtUb3clUNN6lEsfxn6ka2g-1
Received: by mail-il1-f197.google.com with SMTP id f2so31398704ils.6
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tqgPbmXUQJG+oqee7pTX03sITS/s3zJ9J0HSAwd1f1U=;
 b=YBCkXQGSd9sXYjkmZvg0ku/RIjluESD3C+g3BaFieUqxuRaosMxOuVyfYaPFV9ynOQ
 mxBSRkwALls8VQuEJ4qvfCbv/X1SkT9AYN/GvqHt6EU0dxjPOZHBDtEkaFMCIuufKY7g
 vSuexVN3pBPPaa/2p0893czRNB8qpr4jiMVRF7mcqDdtUQmPzgewEdVQixD5HRo9NTAh
 MEAukxRgfpZVbwYqwx4NYRsv8CZzzqAHfaWiofCvCFXpZFyYte7ZbgWDZyhgrgW/z0aA
 mmIGf6yGgCl+1QTlKG/QQBcBNDiddYHeivuHz6TnXSMOvT/N6m9WjBWJKXA3P7yEqSvD
 OS+w==
X-Gm-Message-State: AOAM5321vzqER07Tas7nzWamVZ8CF0FCbct8t0m2YcLzLK+Y3FrhTT0m
 +y7bz/fk/AAMgmE+imzZADaPHoxRwdACIOcmDjAk9HqlE7IWcqOejrs2n2sGOIXx8nuM5fMdZKe
 6Vm8K4KXkPqkE6BSSfFR1Ds3qLZza6QU=
X-Received: by 2002:a92:b694:: with SMTP id m20mr43087944ill.182.1608208609067; 
 Thu, 17 Dec 2020 04:36:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO9rttbwVXC5tas6NNg/O69sSi3XwOvWTW0EcqryJi4j2B7Zf8Y3jw/mYVusExeCkvF/miXOn6cwxnUdnvnqY=
X-Received: by 2002:a92:b694:: with SMTP id m20mr43087936ill.182.1608208608862; 
 Thu, 17 Dec 2020 04:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-10-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-10-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:36:37 +0400
Message-ID: <CAMxuvawj0=+K69ANYHwfYDBQ+dsWe-Bt6zK6aMrffpEN9qRdaw@mail.gmail.com>
Subject: Re: [PATCH 09/18] rbd: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000db3df405b6a83e34"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--000000000000db3df405b6a83e34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure         | 35 ++++-------------------------------
>  meson.build       | 22 +++++++++++++++++++---
>  meson_options.txt |  2 ++
>  3 files changed, 25 insertions(+), 34 deletions(-)
>
> diff --git a/configure b/configure
> index f3271381f1..e34885d505 100755
> --- a/configure
> +++ b/configure
> @@ -384,7 +384,7 @@ qom_cast_debug=3D"yes"
>  trace_backends=3D"log"
>  trace_file=3D"trace"
>  spice=3D"$default_feature"
> -rbd=3D"$default_feature"
> +rbd=3D"auto"
>  smartcard=3D"$default_feature"
>  u2f=3D"auto"
>  libusb=3D"$default_feature"
> @@ -1286,9 +1286,9 @@ for opt do
>    ;;
>    --enable-opengl) opengl=3D"yes"
>    ;;
> -  --disable-rbd) rbd=3D"no"
> +  --disable-rbd) rbd=3D"disabled"
>    ;;
> -  --enable-rbd) rbd=3D"yes"
> +  --enable-rbd) rbd=3D"enabled"
>    ;;
>    --disable-xfsctl) xfs=3D"no"
>    ;;
> @@ -3607,29 +3607,6 @@ if compile_prog "" "$pthread_lib" ; then
>    pthread_setname_np_wo_tid=3Dyes
>  fi
>
> -##########################################
> -# rbd probe
> -if test "$rbd" !=3D "no" ; then
> -  cat > $TMPC <<EOF
> -#include <stdio.h>
> -#include <rbd/librbd.h>
> -int main(void) {
> -    rados_t cluster;
> -    rados_create(&cluster, NULL);
> -    return 0;
> -}
> -EOF
> -  rbd_libs=3D"-lrbd -lrados"
> -  if compile_prog "" "$rbd_libs" ; then
> -    rbd=3Dyes
> -  else
> -    if test "$rbd" =3D "yes" ; then
> -      feature_not_found "rados block device" "Install librbd/ceph devel"
> -    fi
> -    rbd=3Dno
> -  fi
> -fi
> -
>  ##########################################
>  # linux-aio probe
>
> @@ -6184,10 +6161,6 @@ fi
>  if test "$qom_cast_debug" =3D "yes" ; then
>    echo "CONFIG_QOM_CAST_DEBUG=3Dy" >> $config_host_mak
>  fi
> -if test "$rbd" =3D "yes" ; then
> -  echo "CONFIG_RBD=3Dy" >> $config_host_mak
> -  echo "RBD_LIBS=3D$rbd_libs" >> $config_host_mak
> -fi
>
>  echo "CONFIG_COROUTINE_BACKEND=3D$coroutine" >> $config_host_mak
>  if test "$coroutine_pool" =3D "yes" ; then
> @@ -6726,7 +6699,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
> -        -Dlibssh=3D$libssh \
> +        -Dlibssh=3D$libssh -Drbd=3D$rbd \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 2d6660aa46..6fa80e2d7e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -612,9 +612,24 @@ else
>  endif
>
>  rbd =3D not_found
> -if 'CONFIG_RBD' in config_host
> -  rbd =3D declare_dependency(link_args: config_host['RBD_LIBS'].split())
> +if not get_option('rbd').auto() or have_block
> +  librados =3D cc.find_library('rados', required: get_option('rbd'),
> +                             static: enable_static)
> +  librbd =3D cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
> +                           required: get_option('rbd'),
> +                           static: enable_static)
> +  if librados.found() and librbd.found() and cc.links('''
> +    #include <stdio.h>
> +    #include <rbd/librbd.h>
> +    int main(void) {
> +      rados_t cluster;
> +      rados_create(&cluster, NULL);
> +      return 0;
> +    }''', dependencies: [librbd, librados])
> +    rbd =3D declare_dependency(dependencies: [librbd, librados])
> +  endif
>  endif
> +
>  glusterfs =3D not_found
>  glusterfs_ftruncate_has_stat =3D false
>  glusterfs_iocb_has_stat =3D false
> @@ -941,6 +956,7 @@ config_host_data.set('CONFIG_LIBISCSI',
> libiscsi.found())
>  config_host_data.set('CONFIG_LIBNFS', libnfs.found())
>  config_host_data.set('CONFIG_LIBSSH', libssh.found())
>  config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
> +config_host_data.set('CONFIG_RBD', rbd.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
> @@ -2290,7 +2306,7 @@ if
> config_host['TRACE_BACKENDS'].split().contains('simple')
>  endif
>  # TODO: add back protocol and server version
>  summary_info +=3D {'spice support':     config_host.has_key('CONFIG_SPIC=
E')}
> -summary_info +=3D {'rbd support':       config_host.has_key('CONFIG_RBD'=
)}
> +summary_info +=3D {'rbd support':       rbd.found()}
>  summary_info +=3D {'xfsctl support':    config_host.has_key('CONFIG_XFS'=
)}
>  summary_info +=3D {'smartcard support':
> config_host.has_key('CONFIG_SMARTCARD')}
>  summary_info +=3D {'U2F support':       u2f.found()}
> diff --git a/meson_options.txt b/meson_options.txt
> index 6466dc67f6..630c9dceb7 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -64,6 +64,8 @@ option('curses', type : 'feature', value : 'auto',
>         description: 'curses UI')
>  option('libudev', type : 'feature', value : 'auto',
>         description: 'Use libudev to enumerate host devices')
> +option('rbd', type : 'feature', value : 'auto',
> +       description: 'Ceph block device driver')
>  option('sdl', type : 'feature', value : 'auto',
>         description: 'SDL user interface')
>  option('sdl_image', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000db3df405b6a83e34
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
@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++-----------------=
--------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++++++++++---<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 25 insertions(+), 34 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index f3271381f1..e34885d505 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -384,7 +384,7 @@ qom_cast_debug=3D&quot;yes&quot;<br>
=C2=A0trace_backends=3D&quot;log&quot;<br>
=C2=A0trace_file=3D&quot;trace&quot;<br>
=C2=A0spice=3D&quot;$default_feature&quot;<br>
-rbd=3D&quot;$default_feature&quot;<br>
+rbd=3D&quot;auto&quot;<br>
=C2=A0smartcard=3D&quot;$default_feature&quot;<br>
=C2=A0u2f=3D&quot;auto&quot;<br>
=C2=A0libusb=3D&quot;$default_feature&quot;<br>
@@ -1286,9 +1286,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-opengl) opengl=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-rbd) rbd=3D&quot;no&quot;<br>
+=C2=A0 --disable-rbd) rbd=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-rbd) rbd=3D&quot;yes&quot;<br>
+=C2=A0 --enable-rbd) rbd=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-xfsctl) xfs=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -3607,29 +3607,6 @@ if compile_prog &quot;&quot; &quot;$pthread_lib&quot=
; ; then<br>
=C2=A0 =C2=A0pthread_setname_np_wo_tid=3Dyes<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# rbd probe<br>
-if test &quot;$rbd&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt;EOF<br>
-#include &lt;stdio.h&gt;<br>
-#include &lt;rbd/librbd.h&gt;<br>
-int main(void) {<br>
-=C2=A0 =C2=A0 rados_t cluster;<br>
-=C2=A0 =C2=A0 rados_create(&amp;cluster, NULL);<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-=C2=A0 rbd_libs=3D&quot;-lrbd -lrados&quot;<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;$rbd_libs&quot; ; then<br>
-=C2=A0 =C2=A0 rbd=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$rbd&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;rados block device&quot; &quo=
t;Install librbd/ceph devel&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 rbd=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# linux-aio probe<br>
<br>
@@ -6184,10 +6161,6 @@ fi<br>
=C2=A0if test &quot;$qom_cast_debug&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_QOM_CAST_DEBUG=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
=C2=A0fi<br>
-if test &quot;$rbd&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_RBD=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;RBD_LIBS=3D$rbd_libs&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
<br>
=C2=A0echo &quot;CONFIG_COROUTINE_BACKEND=3D$coroutine&quot; &gt;&gt; $conf=
ig_host_mak<br>
=C2=A0if test &quot;$coroutine_pool&quot; =3D &quot;yes&quot; ; then<br>
@@ -6726,7 +6699,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh -Drbd=3D$rbd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 2d6660aa46..6fa80e2d7e 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -612,9 +612,24 @@ else<br>
=C2=A0endif<br>
<br>
=C2=A0rbd =3D not_found<br>
-if &#39;CONFIG_RBD&#39; in config_host<br>
-=C2=A0 rbd =3D declare_dependency(link_args: config_host[&#39;RBD_LIBS&#39=
;].split())<br>
+if not get_option(&#39;rbd&#39;).auto() or have_block<br>
+=C2=A0 librados =3D cc.find_library(&#39;rados&#39;, required: get_option(=
&#39;rbd&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static: enable_static)<br>
+=C2=A0 librbd =3D cc.find_library(&#39;rbd&#39;, has_headers: [&#39;rbd/li=
brbd.h&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0required: get_option(&#39;rbd&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0static: enable_static)<br>
+=C2=A0 if librados.found() and librbd.found() and cc.links(&#39;&#39;&#39;=
<br>
+=C2=A0 =C2=A0 #include &lt;stdio.h&gt;<br>
+=C2=A0 =C2=A0 #include &lt;rbd/librbd.h&gt;<br>
+=C2=A0 =C2=A0 int main(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 rados_t cluster;<br>
+=C2=A0 =C2=A0 =C2=A0 rados_create(&amp;cluster, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }&#39;&#39;&#39;, dependencies: [librbd, librados])<br>
+=C2=A0 =C2=A0 rbd =3D declare_dependency(dependencies: [librbd, librados])=
<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
+<br>
=C2=A0glusterfs =3D not_found<br>
=C2=A0glusterfs_ftruncate_has_stat =3D false<br>
=C2=A0glusterfs_iocb_has_stat =3D false<br>
@@ -941,6 +956,7 @@ config_host_data.set(&#39;CONFIG_LIBISCSI&#39;, libiscs=
i.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBNFS&#39;, libnfs.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBSSH&#39;, libssh.found())<br>
=C2=A0config_host_data.set(&#39;HAVE_LIBSSH_0_8&#39;, have_libssh_0_8)<br>
+config_host_data.set(&#39;CONFIG_RBD&#39;, rbd.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
@@ -2290,7 +2306,7 @@ if config_host[&#39;TRACE_BACKENDS&#39;].split().cont=
ains(&#39;simple&#39;)<br>
=C2=A0endif<br>
=C2=A0# TODO: add back protocol and server version<br>
=C2=A0summary_info +=3D {&#39;spice support&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_SPICE&#39;)}<br>
-summary_info +=3D {&#39;rbd support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_RBD&#39;)}<br>
+summary_info +=3D {&#39;rbd support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0rbd.fo=
und()}<br>
=C2=A0summary_info +=3D {&#39;xfsctl support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_XFS&#39;)}<br>
=C2=A0summary_info +=3D {&#39;smartcard support&#39;: config_host.has_key(&=
#39;CONFIG_SMARTCARD&#39;)}<br>
=C2=A0summary_info +=3D {&#39;U2F support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0u=
2f.found()}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 6466dc67f6..630c9dceb7 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -64,6 +64,8 @@ option(&#39;curses&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;curses UI&#39;)<br>
=C2=A0option(&#39;libudev&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use libudev to enumerate host=
 devices&#39;)<br>
+option(&#39;rbd&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Ceph block device driver&#39;=
)<br>
=C2=A0option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SDL user interface&#39;)<br>
=C2=A0option(&#39;sdl_image&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000db3df405b6a83e34--


