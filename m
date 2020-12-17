Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BEA2DD14B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:19:09 +0100 (CET)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsFP-00088C-Hh
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsCW-0007Ic-5P
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:16:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsCR-0002wz-8s
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608207361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5xozBUlgyHGtEYKIVkrzLA8qUfuIS9he5Je91bk87w=;
 b=LU8E1Qp6MCcgC8+5zPc+UEsiA+AyUBNrckUU6CCgmbxCIiDOXpRSEw5LbrFloaqCNTehtb
 SfrC44aazBl5vBBmRobuu/MqSK/OjJbGXGQDM3XxTm9dl3AJlznOLEvjV/6Dl21yAN2DU3
 Xy7hF0Wak3+6pVtpi/FjL19eaY9OUyk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-hFWmypiaMb2kunQRMT0qJQ-1; Thu, 17 Dec 2020 07:15:56 -0500
X-MC-Unique: hFWmypiaMb2kunQRMT0qJQ-1
Received: by mail-io1-f71.google.com with SMTP id l5so27044687ioj.17
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5xozBUlgyHGtEYKIVkrzLA8qUfuIS9he5Je91bk87w=;
 b=pviHdxutLCf5HWok00BXsiDnUyqCWpMvjUmsUiZxpuGgoWR2rkCEidyaNzadq1p8jy
 YPIR5woDVnspX52pWIs7c4p50+YJzLesmJINjJjOcs/m+QLmWERlWxM88QP5Bi5FvVsy
 DNwEmh2NmpgjH0eoaDXawrMRc18cOUr2r5nwnokIh4H5Zx0b2kUVS1EeFgeie1uh/NQP
 uOsNjS3VA2Hmvb4V24UuUu1vSPt8MSdMfif3nSHj2Aaji9UofRjhMD9GDlx+CLyJlnEH
 5V2Y72rBOl/vEoVKY8CqaNl0p7OPY//8i570icmuKZXMgBvdNBH/kEXEiA32MtAXq/p3
 s8OQ==
X-Gm-Message-State: AOAM533RWrjYRMkU1YV5cK7z+WUcU+vj7RhEXWSlJ0pxMBCyNfZKVAAJ
 TcobhhY0b1Dlfren7tDywFIp+vo+8Bi9nyA6LAb1SaKIM9Av0g0MBqPUtL3XipmV8y1B4j4UIai
 ymru+qCzDBZOgDvQQ53GRf4Ec8rw7sEA=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr43536722ild.165.1608207356038; 
 Thu, 17 Dec 2020 04:15:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoICh2hdbTVZAU9xxbGFW0L/hl+dOOB+8iuqkRVE4Cnr7AcdRMf/Mr2uqsP843GOcNvUgWL7HL6Pafy8EILDs=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr43536709ild.165.1608207355833; 
 Thu, 17 Dec 2020 04:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-5-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:15:44 +0400
Message-ID: <CAMxuvaxu0mUDvTgZCQBTWqC7Q9eC6e4HkFFcuB7fdVkne36JEg@mail.gmail.com>
Subject: Re: [PATCH 04/18] glusterfs: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002b8c7805b6a7f403"
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

--0000000000002b8c7805b6a7f403
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 102 ++--------------------------------------------
>  meson.build       |  46 +++++++++++++++++++--
>  meson_options.txt |   2 +
>  3 files changed, 48 insertions(+), 102 deletions(-)
>
> diff --git a/configure b/configure
> index 71196b1fe7..5529ac4b32 100755
> --- a/configure
> +++ b/configure
> @@ -415,13 +415,7 @@ crypto_afalg=3D"no"
>  cfi=3D"false"
>  cfi_debug=3D"false"
>  seccomp=3D"$default_feature"
> -glusterfs=3D"$default_feature"
> -glusterfs_xlator_opt=3D"no"
> -glusterfs_discard=3D"no"
> -glusterfs_fallocate=3D"no"
> -glusterfs_zerofill=3D"no"
> -glusterfs_ftruncate_has_stat=3D"no"
> -glusterfs_iocb_has_stat=3D"no"
> +glusterfs=3D"auto"
>  gtk=3D"$default_feature"
>  gtk_gl=3D"no"
>  tls_priority=3D"NORMAL"
> @@ -1366,7 +1360,7 @@ for opt do
>    ;;
>    --disable-seccomp) seccomp=3D"no"
>    ;;
> -  --disable-glusterfs) glusterfs=3D"no"
> +  --disable-glusterfs) glusterfs=3D"disabled"
>    ;;
>    --disable-avx2) avx2_opt=3D"no"
>    ;;
> @@ -1377,7 +1371,7 @@ for opt do
>    --enable-avx512f) avx512f_opt=3D"yes"
>    ;;
>
> -  --enable-glusterfs) glusterfs=3D"yes"
> +  --enable-glusterfs) glusterfs=3D"enabled"
>    ;;
>    --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
>        echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&=
2
> @@ -3871,64 +3865,6 @@ if test "$libxml2" !=3D "no" ; then
>      fi
>  fi
>
> -##########################################
> -# glusterfs probe
> -if test "$glusterfs" !=3D "no" ; then
> -  if $pkg_config --atleast-version=3D3 glusterfs-api; then
> -    glusterfs=3D"yes"
> -    glusterfs_cflags=3D$($pkg_config --cflags glusterfs-api)
> -    glusterfs_libs=3D$($pkg_config --libs glusterfs-api)
> -    if $pkg_config --atleast-version=3D4 glusterfs-api; then
> -      glusterfs_xlator_opt=3D"yes"
> -    fi
> -    if $pkg_config --atleast-version=3D5 glusterfs-api; then
> -      glusterfs_discard=3D"yes"
> -    fi
> -    if $pkg_config --atleast-version=3D6 glusterfs-api; then
> -      glusterfs_fallocate=3D"yes"
> -      glusterfs_zerofill=3D"yes"
> -    fi
> -    cat > $TMPC << EOF
> -#include <glusterfs/api/glfs.h>
> -
> -int
> -main(void)
> -{
> -       /* new glfs_ftruncate() passes two additional args */
> -       return glfs_ftruncate(NULL, 0, NULL, NULL);
> -}
> -EOF
> -    if compile_prog "$glusterfs_cflags" "$glusterfs_libs" ; then
> -      glusterfs_ftruncate_has_stat=3D"yes"
> -    fi
> -    cat > $TMPC << EOF
> -#include <glusterfs/api/glfs.h>
> -
> -/* new glfs_io_cbk() passes two additional glfs_stat structs */
> -static void
> -glusterfs_iocb(glfs_fd_t *fd, ssize_t ret, struct glfs_stat *prestat,
> struct glfs_stat *poststat, void *data)
> -{}
> -
> -int
> -main(void)
> -{
> -       glfs_io_cbk iocb =3D &glusterfs_iocb;
> -       iocb(NULL, 0 , NULL, NULL, NULL);
> -       return 0;
> -}
> -EOF
> -    if compile_prog "$glusterfs_cflags" "$glusterfs_libs" ; then
> -      glusterfs_iocb_has_stat=3D"yes"
> -    fi
> -  else
> -    if test "$glusterfs" =3D "yes" ; then
> -      feature_not_found "GlusterFS backend support" \
> -          "Install glusterfs-api devel >=3D 3"
> -    fi
> -    glusterfs=3D"no"
> -  fi
> -fi
> -
>  # Check for inotify functions when we are building linux-user
>  # emulator.  This is done because older glibc versions don't
>  # have syscall stubs for these implemented.  In that case we
> @@ -6415,36 +6351,6 @@ if test "$getauxval" =3D "yes" ; then
>    echo "CONFIG_GETAUXVAL=3Dy" >> $config_host_mak
>  fi
>
> -if test "$glusterfs" =3D "yes" ; then
> -  echo "CONFIG_GLUSTERFS=3Dy" >> $config_host_mak
> -  echo "GLUSTERFS_CFLAGS=3D$glusterfs_cflags" >> $config_host_mak
> -  echo "GLUSTERFS_LIBS=3D$glusterfs_libs" >> $config_host_mak
> -fi
> -
> -if test "$glusterfs_xlator_opt" =3D "yes" ; then
> -  echo "CONFIG_GLUSTERFS_XLATOR_OPT=3Dy" >> $config_host_mak
> -fi
> -
> -if test "$glusterfs_discard" =3D "yes" ; then
> -  echo "CONFIG_GLUSTERFS_DISCARD=3Dy" >> $config_host_mak
> -fi
> -
> -if test "$glusterfs_fallocate" =3D "yes" ; then
> -  echo "CONFIG_GLUSTERFS_FALLOCATE=3Dy" >> $config_host_mak
> -fi
> -
> -if test "$glusterfs_zerofill" =3D "yes" ; then
> -  echo "CONFIG_GLUSTERFS_ZEROFILL=3Dy" >> $config_host_mak
> -fi
> -
> -if test "$glusterfs_ftruncate_has_stat" =3D "yes" ; then
> -  echo "CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT=3Dy" >> $config_host_mak
> -fi
> -
> -if test "$glusterfs_iocb_has_stat" =3D "yes" ; then
> -  echo "CONFIG_GLUSTERFS_IOCB_HAS_STAT=3Dy" >> $config_host_mak
> -fi
> -
>  if test "$libssh" =3D "yes" ; then
>    echo "CONFIG_LIBSSH=3Dy" >> $config_host_mak
>    echo "LIBSSH_CFLAGS=3D$libssh_cflags" >> $config_host_mak
> @@ -6919,7 +6825,7 @@ NINJA=3D$ninja $meson setup \
>          -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
> -Dvnc_png=3D$vnc_png \
>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
> -Dvirtiofsd=3D$virtiofsd \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
> -        -Dcurl=3D$curl \
> +        -Dcurl=3D$curl -Dglusterfs=3D$glusterfs \
>          -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=3D$libudev\
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
> diff --git a/meson.build b/meson.build
> index 83dbc61acd..409b958a7f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -613,9 +613,40 @@ if 'CONFIG_RBD' in config_host
>    rbd =3D declare_dependency(link_args: config_host['RBD_LIBS'].split())
>  endif
>  glusterfs =3D not_found
> -if 'CONFIG_GLUSTERFS' in config_host
> -  glusterfs =3D declare_dependency(compile_args:
> config_host['GLUSTERFS_CFLAGS'].split(),
> -                                 link_args:
> config_host['GLUSTERFS_LIBS'].split())
> +glusterfs_ftruncate_has_stat =3D false
> +glusterfs_iocb_has_stat =3D false
> +if not get_option('glusterfs').auto() or have_block
> +  glusterfs =3D dependency('glusterfs-api', version: '>=3D3',
> +                         required: get_option('glusterfs'),
> +                         method: 'pkg-config', static: enable_static)
> +  if glusterfs.found()
> +    glusterfs_ftruncate_has_stat =3D cc.links('''
> +      #include <glusterfs/api/glfs.h>
> +
> +      int
> +      main(void)
> +      {
> +          /* new glfs_ftruncate() passes two additional args */
> +          return glfs_ftruncate(NULL, 0, NULL, NULL);
> +      }
> +    ''', dependencies: glusterfs)
> +    glusterfs_iocb_has_stat =3D cc.links('''
> +      #include <glusterfs/api/glfs.h>
> +
> +      /* new glfs_io_cbk() passes two additional glfs_stat structs */
> +      static void
> +      glusterfs_iocb(glfs_fd_t *fd, ssize_t ret, struct glfs_stat
> *prestat, struct glfs_stat *poststat, void *data)
> +      {}
> +
> +      int
> +      main(void)
> +      {
> +          glfs_io_cbk iocb =3D &glusterfs_iocb;
> +          iocb(NULL, 0 , NULL, NULL, NULL);
> +          return 0;
> +      }
> +    ''', dependencies: glusterfs)
> +  endif
>  endif
>  libssh =3D not_found
>  if 'CONFIG_LIBSSH' in config_host
> @@ -876,6 +907,13 @@ config_host_data.set('CONFIG_MPATH',
> mpathpersist.found())
>  config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
>  config_host_data.set('CONFIG_CURL', curl.found())
>  config_host_data.set('CONFIG_CURSES', curses.found())
> +config_host_data.set('CONFIG_GLUSTERFS', glusterfs.found())
> +config_host_data.set('CONFIG_GLUSTERFS_XLATOR_OPT',
> glusterfs.version().version_compare('>=3D4'))
> +config_host_data.set('CONFIG_GLUSTERFS_DISCARD',
> glusterfs.version().version_compare('>=3D5'))
> +config_host_data.set('CONFIG_GLUSTERFS_FALLOCATE',
> glusterfs.version().version_compare('>=3D6'))
> +config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL',
> glusterfs.version().version_compare('>=3D6'))
> +config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT',
> glusterfs_ftruncate_has_stat)
> +config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT',
> glusterfs_iocb_has_stat)
>


Since the header doesn't seem to export the version, we could have a
CONFIG_GLUSTERFS_VERSION with the major version instead.. for a future
cleanup eventually

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

 config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
> @@ -2252,7 +2290,7 @@ summary_info +=3D {'coroutine pool':
> config_host['CONFIG_COROUTINE_POOL'] =3D=3D '1
>  summary_info +=3D {'debug stack usage':
> config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
>  summary_info +=3D {'mutex debugging':
>  config_host.has_key('CONFIG_DEBUG_MUTEX')}
>  summary_info +=3D {'crypto afalg':
> config_host.has_key('CONFIG_AF_ALG')}
> -summary_info +=3D {'GlusterFS support':
> config_host.has_key('CONFIG_GLUSTERFS')}
> +summary_info +=3D {'GlusterFS support': glusterfs.found()}
>  summary_info +=3D {'gcov':              get_option('b_coverage')}
>  summary_info +=3D {'TPM support':       config_host.has_key('CONFIG_TPM'=
)}
>  summary_info +=3D {'libssh support':
> config_host.has_key('CONFIG_LIBSSH')}
> diff --git a/meson_options.txt b/meson_options.txt
> index 2b845ac62b..b5d84bb88b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -46,6 +46,8 @@ option('cocoa', type : 'feature', value : 'auto',
>         description: 'Cocoa user interface (macOS only)')
>  option('curl', type : 'feature', value : 'auto',
>         description: 'CURL block device driver')
> +option('glusterfs', type : 'feature', value : 'auto',
> +       description: 'Glusterfs block device driver')
>  option('mpath', type : 'feature', value : 'auto',
>         description: 'Multipath persistent reservation passthrough')
>  option('iconv', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--0000000000002b8c7805b6a7f403
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:40 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 102 ++------------------=
--------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 46 +++++++++++++++++++-=
-<br>
=C2=A0meson_options.txt |=C2=A0 =C2=A02 +<br>
=C2=A03 files changed, 48 insertions(+), 102 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 71196b1fe7..5529ac4b32 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -415,13 +415,7 @@ crypto_afalg=3D&quot;no&quot;<br>
=C2=A0cfi=3D&quot;false&quot;<br>
=C2=A0cfi_debug=3D&quot;false&quot;<br>
=C2=A0seccomp=3D&quot;$default_feature&quot;<br>
-glusterfs=3D&quot;$default_feature&quot;<br>
-glusterfs_xlator_opt=3D&quot;no&quot;<br>
-glusterfs_discard=3D&quot;no&quot;<br>
-glusterfs_fallocate=3D&quot;no&quot;<br>
-glusterfs_zerofill=3D&quot;no&quot;<br>
-glusterfs_ftruncate_has_stat=3D&quot;no&quot;<br>
-glusterfs_iocb_has_stat=3D&quot;no&quot;<br>
+glusterfs=3D&quot;auto&quot;<br>
=C2=A0gtk=3D&quot;$default_feature&quot;<br>
=C2=A0gtk_gl=3D&quot;no&quot;<br>
=C2=A0tls_priority=3D&quot;NORMAL&quot;<br>
@@ -1366,7 +1360,7 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-seccomp) seccomp=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-glusterfs) glusterfs=3D&quot;no&quot;<br>
+=C2=A0 --disable-glusterfs) glusterfs=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-avx2) avx2_opt=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -1377,7 +1371,7 @@ for opt do<br>
=C2=A0 =C2=A0--enable-avx512f) avx512f_opt=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
<br>
-=C2=A0 --enable-glusterfs) glusterfs=3D&quot;yes&quot;<br>
+=C2=A0 --enable-glusterfs) glusterfs=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$0: $opt is obsolete, virtio-blk data=
-plane is always on&quot; &gt;&amp;2<br>
@@ -3871,64 +3865,6 @@ if test &quot;$libxml2&quot; !=3D &quot;no&quot; ; t=
hen<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# glusterfs probe<br>
-if test &quot;$glusterfs&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 if $pkg_config --atleast-version=3D3 glusterfs-api; then<br>
-=C2=A0 =C2=A0 glusterfs=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 glusterfs_cflags=3D$($pkg_config --cflags glusterfs-api)<br>
-=C2=A0 =C2=A0 glusterfs_libs=3D$($pkg_config --libs glusterfs-api)<br>
-=C2=A0 =C2=A0 if $pkg_config --atleast-version=3D4 glusterfs-api; then<br>
-=C2=A0 =C2=A0 =C2=A0 glusterfs_xlator_opt=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 if $pkg_config --atleast-version=3D5 glusterfs-api; then<br>
-=C2=A0 =C2=A0 =C2=A0 glusterfs_discard=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 if $pkg_config --atleast-version=3D6 glusterfs-api; then<br>
-=C2=A0 =C2=A0 =C2=A0 glusterfs_fallocate=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 glusterfs_zerofill=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;glusterfs/api/glfs.h&gt;<br>
-<br>
-int<br>
-main(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* new glfs_ftruncate() passes two additional a=
rgs */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return glfs_ftruncate(NULL, 0, NULL, NULL);<br>
-}<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;$glusterfs_cflags&quot; &quot;$gluster=
fs_libs&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 glusterfs_ftruncate_has_stat=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;glusterfs/api/glfs.h&gt;<br>
-<br>
-/* new glfs_io_cbk() passes two additional glfs_stat structs */<br>
-static void<br>
-glusterfs_iocb(glfs_fd_t *fd, ssize_t ret, struct glfs_stat *prestat, stru=
ct glfs_stat *poststat, void *data)<br>
-{}<br>
-<br>
-int<br>
-main(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0glfs_io_cbk iocb =3D &amp;glusterfs_iocb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iocb(NULL, 0 , NULL, NULL, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;$glusterfs_cflags&quot; &quot;$gluster=
fs_libs&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 glusterfs_iocb_has_stat=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$glusterfs&quot; =3D &quot;yes&quot; ; then<br=
>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;GlusterFS backend support&quo=
t; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Install glusterfs-api devel &gt;=
=3D 3&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 glusterfs=3D&quot;no&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0# Check for inotify functions when we are building linux-user<br>
=C2=A0# emulator.=C2=A0 This is done because older glibc versions don&#39;t=
<br>
=C2=A0# have syscall stubs for these implemented.=C2=A0 In that case we<br>
@@ -6415,36 +6351,6 @@ if test &quot;$getauxval&quot; =3D &quot;yes&quot; ;=
 then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GETAUXVAL=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
=C2=A0fi<br>
<br>
-if test &quot;$glusterfs&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_GLUSTERFS=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;GLUSTERFS_CFLAGS=3D$glusterfs_cflags&quot; &gt;&gt; $con=
fig_host_mak<br>
-=C2=A0 echo &quot;GLUSTERFS_LIBS=3D$glusterfs_libs&quot; &gt;&gt; $config_=
host_mak<br>
-fi<br>
-<br>
-if test &quot;$glusterfs_xlator_opt&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_GLUSTERFS_XLATOR_OPT=3Dy&quot; &gt;&gt; $config_h=
ost_mak<br>
-fi<br>
-<br>
-if test &quot;$glusterfs_discard&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_GLUSTERFS_DISCARD=3Dy&quot; &gt;&gt; $config_host=
_mak<br>
-fi<br>
-<br>
-if test &quot;$glusterfs_fallocate&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_GLUSTERFS_FALLOCATE=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
-fi<br>
-<br>
-if test &quot;$glusterfs_zerofill&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_GLUSTERFS_ZEROFILL=3Dy&quot; &gt;&gt; $config_hos=
t_mak<br>
-fi<br>
-<br>
-if test &quot;$glusterfs_ftruncate_has_stat&quot; =3D &quot;yes&quot; ; th=
en<br>
-=C2=A0 echo &quot;CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT=3Dy&quot; &gt;&gt; $=
config_host_mak<br>
-fi<br>
-<br>
-if test &quot;$glusterfs_iocb_has_stat&quot; =3D &quot;yes&quot; ; then<br=
>
-=C2=A0 echo &quot;CONFIG_GLUSTERFS_IOCB_HAS_STAT=3Dy&quot; &gt;&gt; $confi=
g_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$libssh&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_LIBSSH=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
=C2=A0 =C2=A0echo &quot;LIBSSH_CFLAGS=3D$libssh_cflags&quot; &gt;&gt; $conf=
ig_host_mak<br>
@@ -6919,7 +6825,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc=
_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl -Dglusterfs=3D$glusterfs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Diconv=3D$iconv -Dcurses=3D$curses -Dlib=
udev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
diff --git a/meson.build b/meson.build<br>
index 83dbc61acd..409b958a7f 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -613,9 +613,40 @@ if &#39;CONFIG_RBD&#39; in config_host<br>
=C2=A0 =C2=A0rbd =3D declare_dependency(link_args: config_host[&#39;RBD_LIB=
S&#39;].split())<br>
=C2=A0endif<br>
=C2=A0glusterfs =3D not_found<br>
-if &#39;CONFIG_GLUSTERFS&#39; in config_host<br>
-=C2=A0 glusterfs =3D declare_dependency(compile_args: config_host[&#39;GLU=
STERFS_CFLAGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;GL=
USTERFS_LIBS&#39;].split())<br>
+glusterfs_ftruncate_has_stat =3D false<br>
+glusterfs_iocb_has_stat =3D false<br>
+if not get_option(&#39;glusterfs&#39;).auto() or have_block<br>
+=C2=A0 glusterfs =3D dependency(&#39;glusterfs-api&#39;, version: &#39;&gt=
;=3D3&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0required: get_option(&#39;glusterfs&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0method: &#39;pkg-config&#39;, static: enable_static)<br>
+=C2=A0 if glusterfs.found()<br>
+=C2=A0 =C2=A0 glusterfs_ftruncate_has_stat =3D cc.links(&#39;&#39;&#39;<br=
>
+=C2=A0 =C2=A0 =C2=A0 #include &lt;glusterfs/api/glfs.h&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 int<br>
+=C2=A0 =C2=A0 =C2=A0 main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* new glfs_ftruncate() passes two addi=
tional args */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return glfs_ftruncate(NULL, 0, NULL, NU=
LL);<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 &#39;&#39;&#39;, dependencies: glusterfs)<br>
+=C2=A0 =C2=A0 glusterfs_iocb_has_stat =3D cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 #include &lt;glusterfs/api/glfs.h&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 /* new glfs_io_cbk() passes two additional glfs_stat =
structs */<br>
+=C2=A0 =C2=A0 =C2=A0 static void<br>
+=C2=A0 =C2=A0 =C2=A0 glusterfs_iocb(glfs_fd_t *fd, ssize_t ret, struct glf=
s_stat *prestat, struct glfs_stat *poststat, void *data)<br>
+=C2=A0 =C2=A0 =C2=A0 {}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 int<br>
+=C2=A0 =C2=A0 =C2=A0 main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glfs_io_cbk iocb =3D &amp;glusterfs_ioc=
b;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iocb(NULL, 0 , NULL, NULL, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 &#39;&#39;&#39;, dependencies: glusterfs)<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
=C2=A0libssh =3D not_found<br>
=C2=A0if &#39;CONFIG_LIBSSH&#39; in config_host<br>
@@ -876,6 +907,13 @@ config_host_data.set(&#39;CONFIG_MPATH&#39;, mpathpers=
ist.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH_NEW_API&#39;, mpathpersist_new=
_api)<br>
=C2=A0config_host_data.set(&#39;CONFIG_CURL&#39;, curl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_CURSES&#39;, curses.found())<br>
+config_host_data.set(&#39;CONFIG_GLUSTERFS&#39;, glusterfs.found())<br>
+config_host_data.set(&#39;CONFIG_GLUSTERFS_XLATOR_OPT&#39;, glusterfs.vers=
ion().version_compare(&#39;&gt;=3D4&#39;))<br>
+config_host_data.set(&#39;CONFIG_GLUSTERFS_DISCARD&#39;, glusterfs.version=
().version_compare(&#39;&gt;=3D5&#39;))<br>
+config_host_data.set(&#39;CONFIG_GLUSTERFS_FALLOCATE&#39;, glusterfs.versi=
on().version_compare(&#39;&gt;=3D6&#39;))<br>
+config_host_data.set(&#39;CONFIG_GLUSTERFS_ZEROFILL&#39;, glusterfs.versio=
n().version_compare(&#39;&gt;=3D6&#39;))<br>
+config_host_data.set(&#39;CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT&#39;, gluste=
rfs_ftruncate_has_stat)<br>
+config_host_data.set(&#39;CONFIG_GLUSTERFS_IOCB_HAS_STAT&#39;, glusterfs_i=
ocb_has_stat)<br></blockquote><div><br></div><br><div>Since the header does=
n&#39;t seem to export the version, we could have a CONFIG_GLUSTERFS_VERSIO=
N with the major version instead.. for a future cleanup eventually</div><di=
v><br></div><div>lgtm<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com=
</a>&gt; </div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
@@ -2252,7 +2290,7 @@ summary_info +=3D {&#39;coroutine pool&#39;:=C2=A0 =
=C2=A0 config_host[&#39;CONFIG_COROUTINE_POOL&#39;] =3D=3D &#39;1<br>
=C2=A0summary_info +=3D {&#39;debug stack usage&#39;: config_host.has_key(&=
#39;CONFIG_DEBUG_STACK_USAGE&#39;)}<br>
=C2=A0summary_info +=3D {&#39;mutex debugging&#39;:=C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_DEBUG_MUTEX&#39;)}<br>
=C2=A0summary_info +=3D {&#39;crypto afalg&#39;:=C2=A0 =C2=A0 =C2=A0 config=
_host.has_key(&#39;CONFIG_AF_ALG&#39;)}<br>
-summary_info +=3D {&#39;GlusterFS support&#39;: config_host.has_key(&#39;C=
ONFIG_GLUSTERFS&#39;)}<br>
+summary_info +=3D {&#39;GlusterFS support&#39;: glusterfs.found()}<br>
=C2=A0summary_info +=3D {&#39;gcov&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 get_option(&#39;b_coverage&#39;)}<br>
=C2=A0summary_info +=3D {&#39;TPM support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host.has_key(&#39;CONFIG_TPM&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libssh support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_LIBSSH&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 2b845ac62b..b5d84bb88b 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -46,6 +46,8 @@ option(&#39;cocoa&#39;, type : &#39;feature&#39;, value :=
 &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Cocoa user interface (macOS o=
nly)&#39;)<br>
=C2=A0option(&#39;curl&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;CURL block device driver&#39;=
)<br>
+option(&#39;glusterfs&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Glusterfs block device driver=
&#39;)<br>
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

--0000000000002b8c7805b6a7f403--


