Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310A12DD249
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:40:38 +0100 (CET)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptWH-0000OI-8t
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptUz-0008N8-Ro
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptUx-0005VV-ER
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608212354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+kOBBKowNp7+6+yKVxl7VfYSyIAr/aY45bLqfCJay0k=;
 b=MN5EhXOWvw8+MicxgtSeeywZr05hjjRgOr5sNd/J6Cpx4/UE1OhswvdkxOxpCqW6/grpTH
 GPoxNNrr8EWQ4R6GOcYUHWP3pkrvVq3bVmrbidFROhkir0dbkvC1Sh1l6WHJ451EWgKaDw
 7Mg2rqAFCTD6OVFcUH4qkiIZ/OxNGp8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-a-D3zVDlPfK9UuwNig_EJA-1; Thu, 17 Dec 2020 08:39:10 -0500
X-MC-Unique: a-D3zVDlPfK9UuwNig_EJA-1
Received: by mail-io1-f72.google.com with SMTP id y197so27288336iof.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kOBBKowNp7+6+yKVxl7VfYSyIAr/aY45bLqfCJay0k=;
 b=ZdE3tMEd8g/VHyEqQ7TitP8DZDqrI85tMON1R7oJHlvLhcNxKr41X6AeOSPuOVgpSw
 4FmQ1/M/WTPz0bhRoxiu75aCYI8beY0IuDvtqlQgfOX5rTZz/LeP/eBF86wwDb4rc3lg
 +ihBxUhIUyVDlYRGlOcPeYnwEl7dX83e9XGvmUNSBUI3f8hhVHSkY5vaJn11p7Vep9fr
 sJjF2GSU1UEDvptOp+8I4BfTwfTLKzNUvoMzaGpb6nTyOGbm4G2otLH2GKjtKK7Xi26D
 Vdm0M5X4JUWSTw84VEqqZ1nFqwjbauEAQKggVhy5jyLtI1kgVOCZl9GD8MUM42upbfir
 sXQw==
X-Gm-Message-State: AOAM533Rlszt1YE6kbRdlPZaeFkH211F6gSh4qHgZ44FC4s6z2YE0RED
 gqW8EbnZ4UwnRdyYIn4qjzRgVkTbrzsc40w7WYejHrykHbY+g6ABaS6Gf9RlMWP0xQMHQCjLxTv
 am0T7IqHs6QTRypCL37+xr4rQUZiwbso=
X-Received: by 2002:a92:4101:: with SMTP id o1mr50868754ila.82.1608212350085; 
 Thu, 17 Dec 2020 05:39:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxj/XQ5BIKPHkw0OTqxRF1S3KpCQSR0gHfgcxPVLu2LM5Vsl5DVc6rTdj89fXeduxqlJgr7L+kMqWPDiTchCA=
X-Received: by 2002:a92:4101:: with SMTP id o1mr50868736ila.82.1608212349859; 
 Thu, 17 Dec 2020 05:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-16-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-16-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 17:38:58 +0400
Message-ID: <CAMxuvay9d+cxbNY2gLyAAouoxNwubDDkA4OhkYeV5p63mhctRw@mail.gmail.com>
Subject: Re: [PATCH 15/18] virtfs: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d64e1405b6a91dda"
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

--000000000000d64e1405b6a91dda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure         | 29 ++++-------------------------
>  meson.build       | 24 ++++++++++++++++++++++--
>  meson_options.txt | 11 +++++++----
>  3 files changed, 33 insertions(+), 31 deletions(-)
>
> diff --git a/configure b/configure
> index 00c2d61a96..11d6f40f92 100755
> --- a/configure
> +++ b/configure
> @@ -316,7 +316,7 @@ netmap=3D"no"
>  sdl=3D"auto"
>  sdl_image=3D"auto"
>  virtiofsd=3D"auto"
> -virtfs=3D"$default_feature"
> +virtfs=3D"auto"
>  libudev=3D"auto"
>  mpath=3D"auto"
>  vnc=3D"enabled"
> @@ -1005,9 +1005,9 @@ for opt do
>    ;;
>    --enable-qom-cast-debug) qom_cast_debug=3D"yes"
>    ;;
> -  --disable-virtfs) virtfs=3D"no"
> +  --disable-virtfs) virtfs=3D"disabled"
>    ;;
> -  --enable-virtfs) virtfs=3D"yes"
> +  --enable-virtfs) virtfs=3D"enabled"
>    ;;
>    --disable-libudev) libudev=3D"disabled"
>    ;;
> @@ -5445,24 +5445,6 @@ if [ "$eventfd" =3D "yes" ]; then
>    ivshmem=3Dyes
>  fi
>
> -if test "$softmmu" =3D yes ; then
> -  if test "$linux" =3D yes; then
> -    if test "$virtfs" !=3D no && test "$cap_ng" =3D yes && test "$attr" =
=3D yes
> ; then
> -      virtfs=3Dyes
> -    else
> -      if test "$virtfs" =3D yes; then
> -        error_exit "VirtFS requires libcap-ng devel and libattr devel"
> -      fi
> -      virtfs=3Dno
> -    fi
> -  else
> -    if test "$virtfs" =3D yes; then
> -      error_exit "VirtFS is supported only on Linux"
> -    fi
> -    virtfs=3Dno
> -  fi
> -fi
> -
>  # Probe for guest agent support/options
>
>  if [ "$guest_agent" !=3D "no" ]; then
> @@ -5919,9 +5901,6 @@ fi
>  if test "$libattr" =3D "yes" ; then
>    echo "CONFIG_LIBATTR=3Dy" >> $config_host_mak
>  fi
> -if test "$virtfs" =3D "yes" ; then
> -  echo "CONFIG_VIRTFS=3Dy" >> $config_host_mak
> -fi
>  if test "$vhost_scsi" =3D "yes" ; then
>    echo "CONFIG_VHOST_SCSI=3Dy" >> $config_host_mak
>  fi
> @@ -6582,7 +6561,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
>          -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy
> -Dlzfse=3D$lzfse \
> -        -Dzstd=3D$zstd -Dseccomp=3D$seccomp \
> +        -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=3D$virtfs \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index a0132730d7..08d3586df5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -959,6 +959,25 @@ endif
>  # config-host.h #
>  #################
>
> +have_virtfs =3D (targetos =3D=3D 'linux' and
> +    have_system and
> +    libattr.found() and
> +    libcap_ng.found())
> +
> +if get_option('virtfs').enabled()
> +  if not have_virtfs
> +    if targetos !=3D 'linux'
> +      error('virtio-9p (virtfs) requires Linux')
> +    elif not libcap_ng.found() or not libattr.found()
> +      error('virtio-9p (virtfs) requires libcap-ng-devel and
> libattr-devel')
> +    elif not have_system
> +      error('virtio-9p (virtfs) needs system emulation support')
> +    endif
> +  endif
> +elif get_option('virtfs').disabled()
> +  have_virtfs =3D false
> +endif
> +
>  config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') /
> get_option('bindir'))
>  config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
>  config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') =
/
> qemu_confdir)
> @@ -1001,6 +1020,7 @@ config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
>  config_host_data.set('CONFIG_VNC_PNG', png.found())
>  config_host_data.set('CONFIG_VNC_SASL', sasl.found())
> +config_host_data.set('CONFIG_VIRTFS', have_virtfs)
>  config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
>  config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
>  config_host_data.set('CONFIG_GETTID', has_gettid)
> @@ -1099,7 +1119,7 @@ host_kconfig =3D \
>    ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=3Dy'] : []) =
+ \
>    ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=3Dy'] : []) =
+ \
>    ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=3Dy'] : =
[])
> + \
> -  ('CONFIG_VIRTFS' in config_host ? ['CONFIG_VIRTFS=3Dy'] : []) + \
> +  (have_virtfs ? ['CONFIG_VIRTFS=3Dy'] : []) + \
>    ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=3Dy'] : []) + \
>    ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=3Dy'] : [])
>
> @@ -2287,7 +2307,7 @@ summary_info +=3D {'mingw32 support':   targetos =
=3D=3D
> 'windows'}
>  summary_info +=3D {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVER=
S']}
>  summary_info +=3D {'Block whitelist (rw)':
> config_host['CONFIG_BDRV_RW_WHITELIST']}
>  summary_info +=3D {'Block whitelist (ro)':
> config_host['CONFIG_BDRV_RO_WHITELIST']}
> -summary_info +=3D {'VirtFS support':
> config_host.has_key('CONFIG_VIRTFS')}
> +summary_info +=3D {'VirtFS support':    have_virtfs}
>  summary_info +=3D {'build virtiofs daemon': have_virtiofsd}
>  summary_info +=3D {'Multipath support': mpathpersist.found()}
>  summary_info +=3D {'VNC support':       vnc.found()}
> diff --git a/meson_options.txt b/meson_options.txt
> index 1854a9639f..59a8a50e5b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -90,10 +90,6 @@ option('vnc_sasl', type : 'feature', value : 'auto',
>         description: 'SASL authentication for VNC server')
>  option('xkbcommon', type : 'feature', value : 'auto',
>         description: 'xkbcommon support')
> -option('virtiofsd', type: 'feature', value: 'auto',
> -       description: 'build virtiofs daemon (virtiofsd)')
> -option('vhost_user_blk_server', type: 'feature', value: 'auto',
> -       description: 'build vhost-user-blk server')
>  option('zstd', type : 'feature', value : 'auto',
>         description: 'zstd compression support')
>  option('fuse', type: 'feature', value: 'auto',
> @@ -101,6 +97,13 @@ option('fuse', type: 'feature', value: 'auto',
>  option('fuse_lseek', type : 'feature', value : 'auto',
>         description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
>
> +option('vhost_user_blk_server', type: 'feature', value: 'auto',
> +       description: 'build vhost-user-blk server')
> +option('virtfs', type: 'feature', value: 'auto',
> +       description: 'virtio-9p support')
> +option('virtiofsd', type: 'feature', value: 'auto',
> +       description: 'build virtiofs daemon (virtiofsd)')
> +
>  option('capstone', type: 'combo', value: 'auto',
>         choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
>         description: 'Whether and how to find the capstone library')
> --
> 2.29.2
>
>
>

--000000000000d64e1405b6a91dda
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
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++-----------------=
--------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++++++++++++++--<b=
r>
=C2=A0meson_options.txt | 11 +++++++----<br>
=C2=A03 files changed, 33 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 00c2d61a96..11d6f40f92 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -316,7 +316,7 @@ netmap=3D&quot;no&quot;<br>
=C2=A0sdl=3D&quot;auto&quot;<br>
=C2=A0sdl_image=3D&quot;auto&quot;<br>
=C2=A0virtiofsd=3D&quot;auto&quot;<br>
-virtfs=3D&quot;$default_feature&quot;<br>
+virtfs=3D&quot;auto&quot;<br>
=C2=A0libudev=3D&quot;auto&quot;<br>
=C2=A0mpath=3D&quot;auto&quot;<br>
=C2=A0vnc=3D&quot;enabled&quot;<br>
@@ -1005,9 +1005,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-qom-cast-debug) qom_cast_debug=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-virtfs) virtfs=3D&quot;no&quot;<br>
+=C2=A0 --disable-virtfs) virtfs=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-virtfs) virtfs=3D&quot;yes&quot;<br>
+=C2=A0 --enable-virtfs) virtfs=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-libudev) libudev=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -5445,24 +5445,6 @@ if [ &quot;$eventfd&quot; =3D &quot;yes&quot; ]; the=
n<br>
=C2=A0 =C2=A0ivshmem=3Dyes<br>
=C2=A0fi<br>
<br>
-if test &quot;$softmmu&quot; =3D yes ; then<br>
-=C2=A0 if test &quot;$linux&quot; =3D yes; then<br>
-=C2=A0 =C2=A0 if test &quot;$virtfs&quot; !=3D no &amp;&amp; test &quot;$c=
ap_ng&quot; =3D yes &amp;&amp; test &quot;$attr&quot; =3D yes ; then<br>
-=C2=A0 =C2=A0 =C2=A0 virtfs=3Dyes<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 if test &quot;$virtfs&quot; =3D yes; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;VirtFS requires libcap-ng dev=
el and libattr devel&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 virtfs=3Dno<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$virtfs&quot; =3D yes; then<br>
-=C2=A0 =C2=A0 =C2=A0 error_exit &quot;VirtFS is supported only on Linux&qu=
ot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 virtfs=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0# Probe for guest agent support/options<br>
<br>
=C2=A0if [ &quot;$guest_agent&quot; !=3D &quot;no&quot; ]; then<br>
@@ -5919,9 +5901,6 @@ fi<br>
=C2=A0if test &quot;$libattr&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_LIBATTR=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0fi<br>
-if test &quot;$virtfs&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VIRTFS=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
=C2=A0if test &quot;$vhost_scsi&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_SCSI=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0fi<br>
@@ -6582,7 +6561,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$=
lzo -Dsnappy=3D$snappy -Dlzfse=3D$lzfse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$seccomp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=
=3D$virtfs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index a0132730d7..08d3586df5 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -959,6 +959,25 @@ endif<br>
=C2=A0# config-host.h #<br>
=C2=A0#################<br>
<br>
+have_virtfs =3D (targetos =3D=3D &#39;linux&#39; and<br>
+=C2=A0 =C2=A0 have_system and<br>
+=C2=A0 =C2=A0 libattr.found() and<br>
+=C2=A0 =C2=A0 libcap_ng.found())<br>
+<br>
+if get_option(&#39;virtfs&#39;).enabled()<br>
+=C2=A0 if not have_virtfs<br>
+=C2=A0 =C2=A0 if targetos !=3D &#39;linux&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires Linux&#39;)<br=
>
+=C2=A0 =C2=A0 elif not libcap_ng.found() or not libattr.found()<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires libcap-ng-deve=
l and libattr-devel&#39;)<br>
+=C2=A0 =C2=A0 elif not have_system<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) needs system emulation =
support&#39;)<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endif<br>
+elif get_option(&#39;virtfs&#39;).disabled()<br>
+=C2=A0 have_virtfs =3D false<br>
+endif<br>
+<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_BINDIR&#39;, get_option(&#39;=
prefix&#39;) / get_option(&#39;bindir&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_PREFIX&#39;, get_option(&#39;=
prefix&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_CONFDIR&#39;, get_option=
(&#39;prefix&#39;) / qemu_confdir)<br>
@@ -1001,6 +1020,7 @@ config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found(=
))<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC_JPEG&#39;, jpeg.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC_PNG&#39;, png.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC_SASL&#39;, sasl.found())<br>
+config_host_data.set(&#39;CONFIG_VIRTFS&#39;, have_virtfs)<br>
=C2=A0config_host_data.set(&#39;CONFIG_XKBCOMMON&#39;, xkbcommon.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_KEYUTILS&#39;, keyutils.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_GETTID&#39;, has_gettid)<br>
@@ -1099,7 +1119,7 @@ host_kconfig =3D \<br>
=C2=A0 =C2=A0(&#39;CONFIG_VHOST_USER&#39; in config_host ? [&#39;CONFIG_VHO=
ST_USER=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_VHOST_VDPA&#39; in config_host ? [&#39;CONFIG_VHO=
ST_VDPA=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_VHOST_KERNEL&#39; in config_host ? [&#39;CONFIG_V=
HOST_KERNEL=3Dy&#39;] : []) + \<br>
-=C2=A0 (&#39;CONFIG_VIRTFS&#39; in config_host ? [&#39;CONFIG_VIRTFS=3Dy&#=
39;] : []) + \<br>
+=C2=A0 (have_virtfs ? [&#39;CONFIG_VIRTFS=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_LINUX&#39; in config_host ? [&#39;CONFIG_LINUX=3D=
y&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_PVRDMA&#39; in config_host ? [&#39;CONFIG_PVRDMA=
=3Dy&#39;] : [])<br>
<br>
@@ -2287,7 +2307,7 @@ summary_info +=3D {&#39;mingw32 support&#39;:=C2=A0 =
=C2=A0targetos =3D=3D &#39;windows&#39;}<br>
=C2=A0summary_info +=3D {&#39;Audio drivers&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host[&#39;CONFIG_AUDIO_DRIVERS&#39;]}<br>
=C2=A0summary_info +=3D {&#39;Block whitelist (rw)&#39;: config_host[&#39;C=
ONFIG_BDRV_RW_WHITELIST&#39;]}<br>
=C2=A0summary_info +=3D {&#39;Block whitelist (ro)&#39;: config_host[&#39;C=
ONFIG_BDRV_RO_WHITELIST&#39;]}<br>
-summary_info +=3D {&#39;VirtFS support&#39;:=C2=A0 =C2=A0 config_host.has_=
key(&#39;CONFIG_VIRTFS&#39;)}<br>
+summary_info +=3D {&#39;VirtFS support&#39;:=C2=A0 =C2=A0 have_virtfs}<br>
=C2=A0summary_info +=3D {&#39;build virtiofs daemon&#39;: have_virtiofsd}<b=
r>
=C2=A0summary_info +=3D {&#39;Multipath support&#39;: mpathpersist.found()}=
<br>
=C2=A0summary_info +=3D {&#39;VNC support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0v=
nc.found()}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 1854a9639f..59a8a50e5b 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -90,10 +90,6 @@ option(&#39;vnc_sasl&#39;, type : &#39;feature&#39;, val=
ue : &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SASL authentication for VNC s=
erver&#39;)<br>
=C2=A0option(&#39;xkbcommon&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;xkbcommon support&#39;)<br>
-option(&#39;virtiofsd&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;build virtiofs daemon (virtio=
fsd)&#39;)<br>
-option(&#39;vhost_user_blk_server&#39;, type: &#39;feature&#39;, value: &#=
39;auto&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;build vhost-user-blk server&#=
39;)<br>
=C2=A0option(&#39;zstd&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;zstd compression support&#39;=
)<br>
=C2=A0option(&#39;fuse&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
@@ -101,6 +97,13 @@ option(&#39;fuse&#39;, type: &#39;feature&#39;, value: =
&#39;auto&#39;,<br>
=C2=A0option(&#39;fuse_lseek&#39;, type : &#39;feature&#39;, value : &#39;a=
uto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SEEK_HOLE/SEEK_DATA support f=
or FUSE exports&#39;)<br>
<br>
+option(&#39;vhost_user_blk_server&#39;, type: &#39;feature&#39;, value: &#=
39;auto&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;build vhost-user-blk server&#=
39;)<br>
+option(&#39;virtfs&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;virtio-9p support&#39;)<br>
+option(&#39;virtiofsd&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;build virtiofs daemon (virtio=
fsd)&#39;)<br>
+<br>
=C2=A0option(&#39;capstone&#39;, type: &#39;combo&#39;, value: &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 choices: [&#39;disabled&#39;, &#39;enabled&#39;=
, &#39;auto&#39;, &#39;system&#39;, &#39;internal&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Whether and how to find the c=
apstone library&#39;)<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000d64e1405b6a91dda--


