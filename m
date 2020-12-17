Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8146F2DD29A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:09:02 +0100 (CET)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptxl-0006b8-II
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptv6-00050G-O6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptv2-00065E-Vk
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608213972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t1Wg/YG3QwbYTN9BKULTOXDCD4Zokzgi9bqGcjCAjJI=;
 b=LV/I6OvhVVMF75GAWN8s/R5fRC/ffLNSJcItvnFhhN8PPDitlx0kAotmmDIJ5mIepWe4Wt
 Rrj3yZnBoWhVT6rU4O+5X5MWedWwURzymqlxcFTeP80jck2aOfGOo4zzCUtcmJ19yd5KXy
 X70MCfehepCSMlfhJq/nYl8SBTh75wA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-2sdbJwtyOQW2FP3qzNUrfw-1; Thu, 17 Dec 2020 09:06:07 -0500
X-MC-Unique: 2sdbJwtyOQW2FP3qzNUrfw-1
Received: by mail-il1-f197.google.com with SMTP id f4so29109005ilu.15
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:06:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t1Wg/YG3QwbYTN9BKULTOXDCD4Zokzgi9bqGcjCAjJI=;
 b=CMf8yujT4Wh8nuVn9bGS2cBzovnK2ybBoajxf0fnNav7bws/5ZXOUsTtIc+rWYNMZ1
 Q/Sn5pLQLv4OYtzks5voRciQkAekhW1GtLsuHsC2b6ohYGZ9AIRsZckQn+mYB+pff/YB
 8MaKK4nzNwm/UyvL7J0qMG3rnuqgHtgzJsEKvrRL1Y4JikJiruyt4sqrBM3ikaoallDe
 S3hqN6aqEJaIE3vPXxYXVkUfsmy2kxmJfCs9dZacog4/2qmhqljX9CafzqbRqEH9iXSx
 tEkqTR42XHVS3pLMVp6/mEHYsROetnxhwFsZF38Xjz3j2aIkQjlwXWXmKrq+uvmXiufD
 z4UQ==
X-Gm-Message-State: AOAM533rP3LmLpfinw0IvisFCrI2NrWr4zUd8PVEidIMCiLjH0E4/yfF
 OBWvICo2BMTyyybRWUIVhEWE0eyJgLNOcVlZXPmgkWadkXK0jrYxij/3ZjR6gjo39h0qQ9VgZBI
 KEPqUe1iXWV4pVN8N2fD47gzhKhvOLQ8=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr43931950ild.165.1608213967046; 
 Thu, 17 Dec 2020 06:06:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp7JgmYT5Mlop/58T5KyJL8LVBF3P89iEpbT/CU4l/2ELZKDWG+wFzfvRVf+aHQ2/IYn2HuFdlewzu784Kung=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr43931920ild.165.1608213966696; 
 Thu, 17 Dec 2020 06:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-18-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-18-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 18:05:55 +0400
Message-ID: <CAMxuvawKTEAZ1AWVK+Xvwn3OpOBWAbBD7aktfxuY6Q_cx_mxZQ@mail.gmail.com>
Subject: Re: [PATCH 17/18] libattr: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000035570105b6a97eed"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

--00000000000035570105b6a97eed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 45 ++++-----------------------------------------
>  meson.build       | 38 +++++++++++++++++++++++++++++++++++---
>  meson_options.txt |  2 ++
>  3 files changed, 41 insertions(+), 44 deletions(-)
>
> diff --git a/configure b/configure
> index faee71612f..420663d69a 100755
> --- a/configure
> +++ b/configure
> @@ -332,8 +332,7 @@ xen_pci_passthrough=3D"auto"
>  linux_aio=3D"$default_feature"
>  linux_io_uring=3D"$default_feature"
>  cap_ng=3D"auto"
> -attr=3D"$default_feature"
> -libattr=3D"$default_feature"
> +attr=3D"auto"
>  xfs=3D"$default_feature"
>  tcg=3D"enabled"
>  membarrier=3D"$default_feature"
> @@ -1230,9 +1229,9 @@ for opt do
>    ;;
>    --enable-linux-io-uring) linux_io_uring=3D"yes"
>    ;;
> -  --disable-attr) attr=3D"no"
> +  --disable-attr) attr=3D"disabled"
>    ;;
> -  --enable-attr) attr=3D"yes"
> +  --enable-attr) attr=3D"enabled"
>    ;;
>    --disable-membarrier) membarrier=3D"no"
>    ;;
> @@ -3544,36 +3543,6 @@ elif test "$tpm" =3D "yes"; then
>    fi
>  fi
>
> -##########################################
> -# attr probe
> -
> -libattr_libs=3D
> -if test "$attr" !=3D "no" ; then
> -  cat > $TMPC <<EOF
> -#include <stdio.h>
> -#include <sys/types.h>
> -#ifdef CONFIG_LIBATTR
> -#include <attr/xattr.h>
> -#else
> -#include <sys/xattr.h>
> -#endif
> -int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL, NULL,
> NULL, 0, 0); return 0; }
> -EOF
> -  if compile_prog "" "" ; then
> -    attr=3Dyes
> -  # Older distros have <attr/xattr.h>, and need -lattr:
> -  elif compile_prog "-DCONFIG_LIBATTR" "-lattr" ; then
> -    attr=3Dyes
> -    libattr_libs=3D"-lattr"
> -    libattr=3Dyes
> -  else
> -    if test "$attr" =3D "yes" ; then
> -      feature_not_found "ATTR" "Install libc6 or libattr devel"
> -    fi
> -    attr=3Dno
> -  fi
> -fi
> -
>  ##########################################
>  # iovec probe
>  cat > $TMPC <<EOF
> @@ -5868,13 +5837,6 @@ if test "$linux_io_uring" =3D "yes" ; then
>    echo "LINUX_IO_URING_CFLAGS=3D$linux_io_uring_cflags" >> $config_host_=
mak
>    echo "LINUX_IO_URING_LIBS=3D$linux_io_uring_libs" >> $config_host_mak
>  fi
> -if test "$attr" =3D "yes" ; then
> -  echo "CONFIG_ATTR=3Dy" >> $config_host_mak
> -  echo "LIBATTR_LIBS=3D$libattr_libs" >> $config_host_mak
> -fi
> -if test "$libattr" =3D "yes" ; then
> -  echo "CONFIG_LIBATTR=3Dy" >> $config_host_mak
> -fi
>  if test "$vhost_scsi" =3D "yes" ; then
>    echo "CONFIG_VHOST_SCSI=3Dy" >> $config_host_mak
>  fi
> @@ -6536,6 +6498,7 @@ NINJA=3D$ninja $meson setup \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
>          -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy
> -Dlzfse=3D$lzfse \
>          -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=3D$virtfs -Dcap_ng=
=3D$cap_ng
> \
> +        -Dattr=3D$attr \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 56ab291d87..341eadaa5c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -324,10 +324,40 @@ if not get_option('libnfs').auto() or have_block
>                        required: get_option('libnfs'),
>                        method: 'pkg-config', static: enable_static)
>  endif
> +
> +libattr_test =3D '''
> +  #include <stddef.h>
> +  #include <sys/types.h>
> +  #ifdef CONFIG_LIBATTR
> +  #include <attr/xattr.h>
> +  #else
> +  #include <sys/xattr.h>
> +  #endif
> +  int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL, NULL,
> NULL, 0, 0); return 0; }'''
> +
>  libattr =3D not_found
> -if 'CONFIG_ATTR' in config_host
> -  libattr =3D declare_dependency(link_args:
> config_host['LIBATTR_LIBS'].split())
> +have_old_libattr =3D false
> +if not get_option('attr').disabled()
> +  if cc.links(libattr_test)
> +    libattr =3D declare_dependency()
> +  else
> +    libattr =3D cc.find_library('attr', has_headers: ['attr/xattr.h'],
> +                              required: get_option('attr'),
> +                              static: enable_static)
> +    if libattr.found() and not \
> +      cc.links(libattr_test, dependencies: libattr, args:
> '-DCONFIG_LIBATTR')
>

Most probably we can drop that libattr support now, it was added in qemu in
2011.

glibc supports attr since 2.3, that's from 2002-10-02...

Aaanyway,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


+      libattr =3D not_found
> +      if get_option('attr').enabled()
> +        error('could not link libattr')
> +      else
> +        warning('could not link libattr, disabling')
> +      endif
> +    else
> +      have_old_libattr =3D libattr.found()
> +    endif
> +  endif
>  endif
> +
>  seccomp =3D not_found
>  if not get_option('libiscsi').auto() or have_system or have_tools
>    seccomp =3D dependency('libseccomp', version: '>=3D2.3.0',
> @@ -1006,6 +1036,7 @@
> config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR',
> get_option('prefix') /
>  config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') /
> qemu_moddir)
>  config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') /
> get_option('sysconfdir'))
>
> +config_host_data.set('CONFIG_ATTR', libattr.found())
>  config_host_data.set('CONFIG_BRLAPI', brlapi.found())
>  config_host_data.set('CONFIG_COCOA', cocoa.found())
>  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
> @@ -1021,6 +1052,7 @@ config_host_data.set('CONFIG_GLUSTERFS_FALLOCATE',
> glusterfs.version().version_c
>  config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL',
> glusterfs.version().version_compare('>=3D6'))
>  config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT',
> glusterfs_ftruncate_has_stat)
>  config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT',
> glusterfs_iocb_has_stat)
> +config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
>  config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
>  config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>  config_host_data.set('CONFIG_LIBNFS', libnfs.found())
> @@ -2343,7 +2375,7 @@ summary_info +=3D {'vde support':
>  config_host.has_key('CONFIG_VDE')}
>  summary_info +=3D {'netmap support':
> config_host.has_key('CONFIG_NETMAP')}
>  summary_info +=3D {'Linux AIO support':
> config_host.has_key('CONFIG_LINUX_AIO')}
>  summary_info +=3D {'Linux io_uring support':
> config_host.has_key('CONFIG_LINUX_IO_URING')}
> -summary_info +=3D {'ATTR/XATTR support': config_host.has_key('CONFIG_ATT=
R')}
> +summary_info +=3D {'ATTR/XATTR support': libattr.found()}
>  summary_info +=3D {'Install blobs':     get_option('install_blobs')}
>  summary_info +=3D {'KVM support':       config_all.has_key('CONFIG_KVM')=
}
>  summary_info +=3D {'HAX support':       config_all.has_key('CONFIG_HAX')=
}
> diff --git a/meson_options.txt b/meson_options.txt
> index 12a1872f20..8fcec056cd 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -40,6 +40,8 @@ option('cfi', type: 'boolean', value: 'false',
>  option('cfi_debug', type: 'boolean', value: 'false',
>         description: 'Verbose errors in case of CFI violation')
>
> +option('attr', type : 'feature', value : 'auto',
> +       description: 'attr/xattr support')
>  option('brlapi', type : 'feature', value : 'auto',
>         description: 'brlapi character device driver')
>  option('bzip2', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--00000000000035570105b6a97eed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:41 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 ++++-----------------=
------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 ++++++++++++++++++++++++++=
+++++++++---<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 41 insertions(+), 44 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index faee71612f..420663d69a 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -332,8 +332,7 @@ xen_pci_passthrough=3D&quot;auto&quot;<br>
=C2=A0linux_aio=3D&quot;$default_feature&quot;<br>
=C2=A0linux_io_uring=3D&quot;$default_feature&quot;<br>
=C2=A0cap_ng=3D&quot;auto&quot;<br>
-attr=3D&quot;$default_feature&quot;<br>
-libattr=3D&quot;$default_feature&quot;<br>
+attr=3D&quot;auto&quot;<br>
=C2=A0xfs=3D&quot;$default_feature&quot;<br>
=C2=A0tcg=3D&quot;enabled&quot;<br>
=C2=A0membarrier=3D&quot;$default_feature&quot;<br>
@@ -1230,9 +1229,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-linux-io-uring) linux_io_uring=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-attr) attr=3D&quot;no&quot;<br>
+=C2=A0 --disable-attr) attr=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-attr) attr=3D&quot;yes&quot;<br>
+=C2=A0 --enable-attr) attr=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-membarrier) membarrier=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -3544,36 +3543,6 @@ elif test &quot;$tpm&quot; =3D &quot;yes&quot;; then=
<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# attr probe<br>
-<br>
-libattr_libs=3D<br>
-if test &quot;$attr&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt;EOF<br>
-#include &lt;stdio.h&gt;<br>
-#include &lt;sys/types.h&gt;<br>
-#ifdef CONFIG_LIBATTR<br>
-#include &lt;attr/xattr.h&gt;<br>
-#else<br>
-#include &lt;sys/xattr.h&gt;<br>
-#endif<br>
-int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL, NULL, NULL,=
 0, 0); return 0; }<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 attr=3Dyes<br>
-=C2=A0 # Older distros have &lt;attr/xattr.h&gt;, and need -lattr:<br>
-=C2=A0 elif compile_prog &quot;-DCONFIG_LIBATTR&quot; &quot;-lattr&quot; ;=
 then<br>
-=C2=A0 =C2=A0 attr=3Dyes<br>
-=C2=A0 =C2=A0 libattr_libs=3D&quot;-lattr&quot;<br>
-=C2=A0 =C2=A0 libattr=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$attr&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;ATTR&quot; &quot;Install libc=
6 or libattr devel&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 attr=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# iovec probe<br>
=C2=A0cat &gt; $TMPC &lt;&lt;EOF<br>
@@ -5868,13 +5837,6 @@ if test &quot;$linux_io_uring&quot; =3D &quot;yes&qu=
ot; ; then<br>
=C2=A0 =C2=A0echo &quot;LINUX_IO_URING_CFLAGS=3D$linux_io_uring_cflags&quot=
; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;LINUX_IO_URING_LIBS=3D$linux_io_uring_libs&quot; &g=
t;&gt; $config_host_mak<br>
=C2=A0fi<br>
-if test &quot;$attr&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_ATTR=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LIBATTR_LIBS=3D$libattr_libs&quot; &gt;&gt; $config_host=
_mak<br>
-fi<br>
-if test &quot;$libattr&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_LIBATTR=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
=C2=A0if test &quot;$vhost_scsi&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_SCSI=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0fi<br>
@@ -6536,6 +6498,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$=
lzo -Dsnappy=3D$snappy -Dlzfse=3D$lzfse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvir=
tfs=3D$virtfs -Dcap_ng=3D$cap_ng \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dattr=3D$attr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 56ab291d87..341eadaa5c 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -324,10 +324,40 @@ if not get_option(&#39;libnfs&#39;).auto() or have_bl=
ock<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0required: get_option(&#39;libnfs&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0method: &#39;pkg-config&#39;, static: enable_static)<br>
=C2=A0endif<br>
+<br>
+libattr_test =3D &#39;&#39;&#39;<br>
+=C2=A0 #include &lt;stddef.h&gt;<br>
+=C2=A0 #include &lt;sys/types.h&gt;<br>
+=C2=A0 #ifdef CONFIG_LIBATTR<br>
+=C2=A0 #include &lt;attr/xattr.h&gt;<br>
+=C2=A0 #else<br>
+=C2=A0 #include &lt;sys/xattr.h&gt;<br>
+=C2=A0 #endif<br>
+=C2=A0 int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL, NULL=
, NULL, 0, 0); return 0; }&#39;&#39;&#39;<br>
+<br>
=C2=A0libattr =3D not_found<br>
-if &#39;CONFIG_ATTR&#39; in config_host<br>
-=C2=A0 libattr =3D declare_dependency(link_args: config_host[&#39;LIBATTR_=
LIBS&#39;].split())<br>
+have_old_libattr =3D false<br>
+if not get_option(&#39;attr&#39;).disabled()<br>
+=C2=A0 if cc.links(libattr_test)<br>
+=C2=A0 =C2=A0 libattr =3D declare_dependency()<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 libattr =3D cc.find_library(&#39;attr&#39;, has_headers: [&#=
39;attr/xattr.h&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 required: get_option(&#39;attr&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static: enable_static)<br>
+=C2=A0 =C2=A0 if libattr.found() and not \<br>
+=C2=A0 =C2=A0 =C2=A0 cc.links(libattr_test, dependencies: libattr, args: &=
#39;-DCONFIG_LIBATTR&#39;)<br></blockquote><div><br></div><div>Most probabl=
y we can drop that libattr support now, it was added in qemu in 2011.</div>=
<div><br></div><div>glibc supports attr since 2.3, that&#39;s from 2002-10-=
02...</div><div><br></div><div>Aaanyway,</div><div>Reviewed-by: Marc-Andr=
=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.=
lureau@redhat.com</a>&gt; </div><div><br></div><div> <br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 libattr =3D not_found<br>
+=C2=A0 =C2=A0 =C2=A0 if get_option(&#39;attr&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&#39;could not link libattr&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warning(&#39;could not link libattr, disabling=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 endif<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 have_old_libattr =3D libattr.found()<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
+<br>
=C2=A0seccomp =3D not_found<br>
=C2=A0if not get_option(&#39;libiscsi&#39;).auto() or have_system or have_t=
ools<br>
=C2=A0 =C2=A0seccomp =3D dependency(&#39;libseccomp&#39;, version: &#39;&gt=
;=3D2.3.0&#39;,<br>
@@ -1006,6 +1036,7 @@ config_host_data.set_quoted(&#39;CONFIG_QEMU_LOCALSTA=
TEDIR&#39;, get_option(&#39;prefix&#39;) /<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_MODDIR&#39;, get_option(=
&#39;prefix&#39;) / qemu_moddir)<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_SYSCONFDIR&#39;, get_option(&=
#39;prefix&#39;) / get_option(&#39;sysconfdir&#39;))<br>
<br>
+config_host_data.set(&#39;CONFIG_ATTR&#39;, libattr.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_BRLAPI&#39;, brlapi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_COCOA&#39;, cocoa.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBUDEV&#39;, libudev.found())<br>
@@ -1021,6 +1052,7 @@ config_host_data.set(&#39;CONFIG_GLUSTERFS_FALLOCATE&=
#39;, glusterfs.version().version_c<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_ZEROFILL&#39;, glusterfs.v=
ersion().version_compare(&#39;&gt;=3D6&#39;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT&#39;, g=
lusterfs_ftruncate_has_stat)<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_IOCB_HAS_STAT&#39;, gluste=
rfs_iocb_has_stat)<br>
+config_host_data.set(&#39;CONFIG_LIBATTR&#39;, have_old_libattr)<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBCAP_NG&#39;, libcap_ng.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_LIBISCSI&#39;, libiscsi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBNFS&#39;, libnfs.found())<br>
@@ -2343,7 +2375,7 @@ summary_info +=3D {&#39;vde support&#39;:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0config_host.has_key(&#39;CONFIG_VDE&#39;)}<br>
=C2=A0summary_info +=3D {&#39;netmap support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_NETMAP&#39;)}<br>
=C2=A0summary_info +=3D {&#39;Linux AIO support&#39;: config_host.has_key(&=
#39;CONFIG_LINUX_AIO&#39;)}<br>
=C2=A0summary_info +=3D {&#39;Linux io_uring support&#39;: config_host.has_=
key(&#39;CONFIG_LINUX_IO_URING&#39;)}<br>
-summary_info +=3D {&#39;ATTR/XATTR support&#39;: config_host.has_key(&#39;=
CONFIG_ATTR&#39;)}<br>
+summary_info +=3D {&#39;ATTR/XATTR support&#39;: libattr.found()}<br>
=C2=A0summary_info +=3D {&#39;Install blobs&#39;:=C2=A0 =C2=A0 =C2=A0get_op=
tion(&#39;install_blobs&#39;)}<br>
=C2=A0summary_info +=3D {&#39;KVM support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_all.has_key(&#39;CONFIG_KVM&#39;)}<br>
=C2=A0summary_info +=3D {&#39;HAX support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_all.has_key(&#39;CONFIG_HAX&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 12a1872f20..8fcec056cd 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -40,6 +40,8 @@ option(&#39;cfi&#39;, type: &#39;boolean&#39;, value: &#3=
9;false&#39;,<br>
=C2=A0option(&#39;cfi_debug&#39;, type: &#39;boolean&#39;, value: &#39;fals=
e&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Verbose errors in case of CFI=
 violation&#39;)<br>
<br>
+option(&#39;attr&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;attr/xattr support&#39;)<br>
=C2=A0option(&#39;brlapi&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;brlapi character device drive=
r&#39;)<br>
=C2=A0option(&#39;bzip2&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--00000000000035570105b6a97eed--


