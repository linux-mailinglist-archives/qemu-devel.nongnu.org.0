Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91462DD185
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:34:02 +0100 (CET)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsTq-0000iI-0F
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsM8-0004cr-3l
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsM1-0006CB-5Q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608207956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Unc/EUUG+9AQsiWEVnUNJji2JTqbieQ7nM4934sAzAU=;
 b=NnLqEQGKNBn6M4yN62xrb+q99mvypIE2t/1XWEPfFRTZiLDgdl7oifMRbbOf0fts2mAlIF
 6iMgXkLuEZfDDLa/o/ogSZ+ZewzivtmlHKzlcgB5CFxghUSLo7xU0V0eJkZJ5ovane6de7
 U4rdRzB4dBJPVANJAWZLUyRgjT3y4tY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-cE2Ylj7-PmWkORxwH4aVqA-1; Thu, 17 Dec 2020 07:25:54 -0500
X-MC-Unique: cE2Ylj7-PmWkORxwH4aVqA-1
Received: by mail-io1-f70.google.com with SMTP id l18so27008197iok.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Unc/EUUG+9AQsiWEVnUNJji2JTqbieQ7nM4934sAzAU=;
 b=awZtYRLmXS7M4Z9y0fuanzMQGXfnkYY4JiW8hBLiRi9EbKYY+eEBWFLy370mXJTDaY
 0Um9aZJhYz1iECPwhyHGwPiBiO/B7LCR4ilhBhy2noqdJ9LqxOjEqwR3z691ftG0V3el
 2javq/tl5kQDRu6KcmSLGLqZwyRrIM1uLBii6RIbC/dWLfQXHx06/rghm8bZmIr2vZYA
 YbZV+MC0Xf+Sc8jemrHaR6IIvmsZdeYuCRS/JV6aY/q4XvA9BDwOoqsQvFr67lNTCJEv
 18sATxHoRAvFNWvVw2Qxgwu4H2BMlQeXpicAKdHokSXVIHLMlPWHsRm3NJNcPFvlWo98
 Rc4A==
X-Gm-Message-State: AOAM532nREFRxj3L8F5d1saPKZH5SVd7hNGAjuBDvIgiKY08T/eEu5ip
 eoY6orVDrnwAw3EfkbWwHiXkOeapptZC+RSKllVe2o5IeJegHeA/Le/f/x9lF1QzRpGSM7h7qen
 7dXlnvSxjsEskUDssEUvOTYRfd5ZkqJ8=
X-Received: by 2002:a02:5e81:: with SMTP id h123mr47430110jab.36.1608207953341; 
 Thu, 17 Dec 2020 04:25:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvU/aNkWMfhzrDskP2BZbkLGRmZPKCeTTg9YYxQhx0jNbka+cvWUCl8+HLO1BlAFd8JF40yOsqKX1C5xVy+50=
X-Received: by 2002:a02:5e81:: with SMTP id h123mr47430099jab.36.1608207953157; 
 Thu, 17 Dec 2020 04:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-7-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-7-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:25:41 +0400
Message-ID: <CAMxuvayJETJpyhz6-JFGP+5ThjzXzXKfCa06KuJUedRZdswkBA@mail.gmail.com>
Subject: Re: [PATCH 06/18] libiscsi: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c5f7e805b6a81774"
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

--000000000000c5f7e805b6a81774
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  block/meson.build                   |  2 +-
>  configure                           | 29 ++++-------------------------
>  contrib/vhost-user-scsi/meson.build |  2 +-
>  meson.build                         | 10 ++++++----
>  meson_options.txt                   |  2 ++
>  5 files changed, 14 insertions(+), 31 deletions(-)
>
> diff --git a/block/meson.build b/block/meson.build
> index b02cb14aad..134034abb4 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -59,7 +59,7 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
>  block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'], if_true:
> files('parallels.c'))
>  block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c',
> 'win32-aio.c'))
>  block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'),
> coref, iokit])
> -block_ss.add(when: 'CONFIG_LIBISCSI', if_true: files('iscsi-opts.c'))
> +block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
>  block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
>  block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c')=
)
>  block_ss.add(when: 'CONFIG_SHEEPDOG', if_true: files('sheepdog.c'))
> diff --git a/configure b/configure
> index 082ac3bf35..e22c56e8f6 100755
> --- a/configure
> +++ b/configure
> @@ -406,7 +406,7 @@ guest_agent_msi=3D"$default_feature"
>  vss_win32_sdk=3D"$default_feature"
>  win_sdk=3D"no"
>  want_tools=3D"$default_feature"
> -libiscsi=3D"$default_feature"
> +libiscsi=3D"auto"
>  libnfs=3D"$default_feature"
>  coroutine=3D""
>  coroutine_pool=3D"$default_feature"
> @@ -1139,9 +1139,9 @@ for opt do
>    ;;
>    --enable-spice) spice=3D"yes"
>    ;;
> -  --disable-libiscsi) libiscsi=3D"no"
> +  --disable-libiscsi) libiscsi=3D"disabled"
>    ;;
> -  --enable-libiscsi) libiscsi=3D"yes"
> +  --enable-libiscsi) libiscsi=3D"enabled"
>    ;;
>    --disable-libnfs) libnfs=3D"no"
>    ;;
> @@ -4315,21 +4315,6 @@ if compile_prog "" "" ; then
>    bswap_h=3Dyes
>  fi
>
> -##########################################
> -# Do we have libiscsi >=3D 1.9.0
> -if test "$libiscsi" !=3D "no" ; then
> -  if $pkg_config --atleast-version=3D1.9.0 libiscsi; then
> -    libiscsi=3D"yes"
> -    libiscsi_cflags=3D$($pkg_config --cflags libiscsi)
> -    libiscsi_libs=3D$($pkg_config --libs libiscsi)
> -  else
> -    if test "$libiscsi" =3D "yes" ; then
> -      feature_not_found "libiscsi" "Install libiscsi >=3D 1.9.0"
> -    fi
> -    libiscsi=3D"no"
> -  fi
> -fi
> -
>  ##########################################
>  # Do we need librt
>  # uClibc provides 2 versions of clock_gettime(), one with realtime
> @@ -6231,12 +6216,6 @@ if test "$zstd" =3D "yes" ; then
>    echo "ZSTD_LIBS=3D$zstd_libs" >> $config_host_mak
>  fi
>
> -if test "$libiscsi" =3D "yes" ; then
> -  echo "CONFIG_LIBISCSI=3Dy" >> $config_host_mak
> -  echo "LIBISCSI_CFLAGS=3D$libiscsi_cflags" >> $config_host_mak
> -  echo "LIBISCSI_LIBS=3D$libiscsi_libs" >> $config_host_mak
> -fi
> -
>  if test "$libnfs" =3D "yes" ; then
>    echo "CONFIG_LIBNFS=3Dy" >> $config_host_mak
>    echo "LIBNFS_LIBS=3D$libnfs_libs" >> $config_host_mak
> @@ -6802,7 +6781,7 @@ NINJA=3D$ninja $meson setup \
>          -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
> -Dvnc_png=3D$vnc_png \
>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
> -Dvirtiofsd=3D$virtiofsd \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
> -        -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2 \
> +        -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=3D$libudev\
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
> diff --git a/contrib/vhost-user-scsi/meson.build
> b/contrib/vhost-user-scsi/meson.build
> index 044c50bf43..cc893f6f20 100644
> --- a/contrib/vhost-user-scsi/meson.build
> +++ b/contrib/vhost-user-scsi/meson.build
> @@ -1,4 +1,4 @@
> -if 'CONFIG_LIBISCSI' in config_host
> +if libiscsi.found()
>    executable('vhost-user-scsi', files('vhost-user-scsi.c'),
>               dependencies: [qemuutil, libiscsi, vhost_user],
>               build_by_default: targetos =3D=3D 'linux',
> diff --git a/meson.build b/meson.build
> index 9ba8eecf37..3f53a7f1b2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -372,9 +372,10 @@ if 'CONFIG_PLUGIN' in config_host
>    libdl =3D cc.find_library('dl', required: true)
>  endif
>  libiscsi =3D not_found
> -if 'CONFIG_LIBISCSI' in config_host
> -  libiscsi =3D declare_dependency(compile_args:
> config_host['LIBISCSI_CFLAGS'].split(),
> -                                link_args:
> config_host['LIBISCSI_LIBS'].split())
> +if not get_option('libiscsi').auto() or have_block
> +  libiscsi =3D dependency('libiscsi', version: '>=3D1.9.0',
> +                         required: get_option('libiscsi'),
> +                         method: 'pkg-config', static: enable_static)
>  endif
>  zstd =3D not_found
>  if 'CONFIG_ZSTD' in config_host
> @@ -926,6 +927,7 @@ config_host_data.set('CONFIG_GLUSTERFS_FALLOCATE',
> glusterfs.version().version_c
>  config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL',
> glusterfs.version().version_compare('>=3D6'))
>  config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT',
> glusterfs_ftruncate_has_stat)
>  config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT',
> glusterfs_iocb_has_stat)
> +config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
> @@ -2283,7 +2285,7 @@ summary_info +=3D {'libusb':
> config_host.has_key('CONFIG_USB_LIBUSB')}
>  summary_info +=3D {'usb net redir':
>  config_host.has_key('CONFIG_USB_REDIR')}
>  summary_info +=3D {'OpenGL support':
> config_host.has_key('CONFIG_OPENGL')}
>  summary_info +=3D {'OpenGL dmabufs':
> config_host.has_key('CONFIG_OPENGL_DMABUF')}
> -summary_info +=3D {'libiscsi support':
> config_host.has_key('CONFIG_LIBISCSI')}
> +summary_info +=3D {'libiscsi support':  libiscsi.found()}
>  summary_info +=3D {'libnfs support':
> config_host.has_key('CONFIG_LIBNFS')}
>  summary_info +=3D {'build guest agent':
> config_host.has_key('CONFIG_GUEST_AGENT')}
>  if targetos =3D=3D 'windows'
> diff --git a/meson_options.txt b/meson_options.txt
> index fd16f3b399..b562d4f1a6 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -50,6 +50,8 @@ option('curl', type : 'feature', value : 'auto',
>         description: 'CURL block device driver')
>  option('glusterfs', type : 'feature', value : 'auto',
>         description: 'Glusterfs block device driver')
> +option('libiscsi', type : 'feature', value : 'auto',
> +       description: 'libiscsi userspace initiator')
>  option('mpath', type : 'feature', value : 'auto',
>         description: 'Multipath persistent reservation passthrough')
>  option('iconv', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000c5f7e805b6a81774
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:40 PM Paolo=
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
=C2=A0block/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++-------------------------<br=
>
=C2=A0contrib/vhost-user-scsi/meson.build |=C2=A0 2 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++----<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A05 files changed, 14 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/block/meson.build b/block/meson.build<br>
index b02cb14aad..134034abb4 100644<br>
--- a/block/meson.build<br>
+++ b/block/meson.build<br>
@@ -59,7 +59,7 @@ block_ss.add(when: &#39;CONFIG_QED&#39;, if_true: files(<=
br>
=C2=A0block_ss.add(when: [libxml2, &#39;CONFIG_PARALLELS&#39;], if_true: fi=
les(&#39;parallels.c&#39;))<br>
=C2=A0block_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(&#39;file-w=
in32.c&#39;, &#39;win32-aio.c&#39;))<br>
=C2=A0block_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: [files(&#39;file-=
posix.c&#39;), coref, iokit])<br>
-block_ss.add(when: &#39;CONFIG_LIBISCSI&#39;, if_true: files(&#39;iscsi-op=
ts.c&#39;))<br>
+block_ss.add(when: libiscsi, if_true: files(&#39;iscsi-opts.c&#39;))<br>
=C2=A0block_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;nvme.c=
&#39;))<br>
=C2=A0block_ss.add(when: &#39;CONFIG_REPLICATION&#39;, if_true: files(&#39;=
replication.c&#39;))<br>
=C2=A0block_ss.add(when: &#39;CONFIG_SHEEPDOG&#39;, if_true: files(&#39;she=
epdog.c&#39;))<br>
diff --git a/configure b/configure<br>
index 082ac3bf35..e22c56e8f6 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -406,7 +406,7 @@ guest_agent_msi=3D&quot;$default_feature&quot;<br>
=C2=A0vss_win32_sdk=3D&quot;$default_feature&quot;<br>
=C2=A0win_sdk=3D&quot;no&quot;<br>
=C2=A0want_tools=3D&quot;$default_feature&quot;<br>
-libiscsi=3D&quot;$default_feature&quot;<br>
+libiscsi=3D&quot;auto&quot;<br>
=C2=A0libnfs=3D&quot;$default_feature&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0coroutine_pool=3D&quot;$default_feature&quot;<br>
@@ -1139,9 +1139,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-spice) spice=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-libiscsi) libiscsi=3D&quot;no&quot;<br>
+=C2=A0 --disable-libiscsi) libiscsi=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-libiscsi) libiscsi=3D&quot;yes&quot;<br>
+=C2=A0 --enable-libiscsi) libiscsi=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-libnfs) libnfs=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -4315,21 +4315,6 @@ if compile_prog &quot;&quot; &quot;&quot; ; then<br>
=C2=A0 =C2=A0bswap_h=3Dyes<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# Do we have libiscsi &gt;=3D 1.9.0<br>
-if test &quot;$libiscsi&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 if $pkg_config --atleast-version=3D1.9.0 libiscsi; then<br>
-=C2=A0 =C2=A0 libiscsi=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 libiscsi_cflags=3D$($pkg_config --cflags libiscsi)<br>
-=C2=A0 =C2=A0 libiscsi_libs=3D$($pkg_config --libs libiscsi)<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$libiscsi&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;libiscsi&quot; &quot;Install =
libiscsi &gt;=3D 1.9.0&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 libiscsi=3D&quot;no&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# Do we need librt<br>
=C2=A0# uClibc provides 2 versions of clock_gettime(), one with realtime<br=
>
@@ -6231,12 +6216,6 @@ if test &quot;$zstd&quot; =3D &quot;yes&quot; ; then=
<br>
=C2=A0 =C2=A0echo &quot;ZSTD_LIBS=3D$zstd_libs&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$libiscsi&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_LIBISCSI=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LIBISCSI_CFLAGS=3D$libiscsi_cflags&quot; &gt;&gt; $confi=
g_host_mak<br>
-=C2=A0 echo &quot;LIBISCSI_LIBS=3D$libiscsi_libs&quot; &gt;&gt; $config_ho=
st_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$libnfs&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_LIBNFS=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
=C2=A0 =C2=A0echo &quot;LIBNFS_LIBS=3D$libnfs_libs&quot; &gt;&gt; $config_h=
ost_mak<br>
@@ -6802,7 +6781,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc=
_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip=
2=3D$bzip2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip=
2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Diconv=3D$iconv -Dcurses=3D$curses -Dlib=
udev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
diff --git a/contrib/vhost-user-scsi/meson.build b/contrib/vhost-user-scsi/=
meson.build<br>
index 044c50bf43..cc893f6f20 100644<br>
--- a/contrib/vhost-user-scsi/meson.build<br>
+++ b/contrib/vhost-user-scsi/meson.build<br>
@@ -1,4 +1,4 @@<br>
-if &#39;CONFIG_LIBISCSI&#39; in config_host<br>
+if libiscsi.found()<br>
=C2=A0 =C2=A0executable(&#39;vhost-user-scsi&#39;, files(&#39;vhost-user-sc=
si.c&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [qemuutil, l=
ibiscsi, vhost_user],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_by_default: targetos=
 =3D=3D &#39;linux&#39;,<br>
diff --git a/meson.build b/meson.build<br>
index 9ba8eecf37..3f53a7f1b2 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -372,9 +372,10 @@ if &#39;CONFIG_PLUGIN&#39; in config_host<br>
=C2=A0 =C2=A0libdl =3D cc.find_library(&#39;dl&#39;, required: true)<br>
=C2=A0endif<br>
=C2=A0libiscsi =3D not_found<br>
-if &#39;CONFIG_LIBISCSI&#39; in config_host<br>
-=C2=A0 libiscsi =3D declare_dependency(compile_args: config_host[&#39;LIBI=
SCSI_CFLAGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;LIBISCSI=
_LIBS&#39;].split())<br>
+if not get_option(&#39;libiscsi&#39;).auto() or have_block<br>
+=C2=A0 libiscsi =3D dependency(&#39;libiscsi&#39;, version: &#39;&gt;=3D1.=
9.0&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0required: get_option(&#39;libiscsi&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0method: &#39;pkg-config&#39;, static: enable_static)<br>
=C2=A0endif<br>
=C2=A0zstd =3D not_found<br>
=C2=A0if &#39;CONFIG_ZSTD&#39; in config_host<br>
@@ -926,6 +927,7 @@ config_host_data.set(&#39;CONFIG_GLUSTERFS_FALLOCATE&#3=
9;, glusterfs.version().version_c<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_ZEROFILL&#39;, glusterfs.v=
ersion().version_compare(&#39;&gt;=3D6&#39;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT&#39;, g=
lusterfs_ftruncate_has_stat)<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_IOCB_HAS_STAT&#39;, gluste=
rfs_iocb_has_stat)<br>
+config_host_data.set(&#39;CONFIG_LIBISCSI&#39;, libiscsi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
@@ -2283,7 +2285,7 @@ summary_info +=3D {&#39;libusb&#39;:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 config_host.has_key(&#39;CONFIG_USB_LIBUSB&#39;)}<=
br>
=C2=A0summary_info +=3D {&#39;usb net redir&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_USB_REDIR&#39;)}<br>
=C2=A0summary_info +=3D {&#39;OpenGL support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_OPENGL&#39;)}<br>
=C2=A0summary_info +=3D {&#39;OpenGL dmabufs&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_OPENGL_DMABUF&#39;)}<br>
-summary_info +=3D {&#39;libiscsi support&#39;:=C2=A0 config_host.has_key(&=
#39;CONFIG_LIBISCSI&#39;)}<br>
+summary_info +=3D {&#39;libiscsi support&#39;:=C2=A0 libiscsi.found()}<br>
=C2=A0summary_info +=3D {&#39;libnfs support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_LIBNFS&#39;)}<br>
=C2=A0summary_info +=3D {&#39;build guest agent&#39;: config_host.has_key(&=
#39;CONFIG_GUEST_AGENT&#39;)}<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index fd16f3b399..b562d4f1a6 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -50,6 +50,8 @@ option(&#39;curl&#39;, type : &#39;feature&#39;, value : =
&#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;CURL block device driver&#39;=
)<br>
=C2=A0option(&#39;glusterfs&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Glusterfs block device driver=
&#39;)<br>
+option(&#39;libiscsi&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;libiscsi userspace initiator&=
#39;)<br>
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

--000000000000c5f7e805b6a81774--


