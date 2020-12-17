Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90682DD17B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:28:46 +0100 (CET)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsOi-0005f8-G2
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsKs-0003N1-Ry
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:24:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsKg-0005dI-Vf
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608207873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XbXl9R5g1Ej36PDxBBBonm1fh8A8okaGqmU1R6WE2Kc=;
 b=Pgfc130ToFoN7+p/HdsVS517UjwhNJebMqFufwgMB/KEsfCyhyuiD9SbzhwVUyrfenZQtY
 83u+VXzQl+g1UWUe6NeD3NpxiTc3RCc8/XuVAeIQhqaKzcRSDfq9Q+euL94niUXzhz4GR2
 ishGuV4cepvCKvBN1WGtEMOax4cJ/Og=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-S_NKaoC2NNWbeQWn5zt7gQ-1; Thu, 17 Dec 2020 07:24:31 -0500
X-MC-Unique: S_NKaoC2NNWbeQWn5zt7gQ-1
Received: by mail-il1-f199.google.com with SMTP id q2so31303483ilt.20
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbXl9R5g1Ej36PDxBBBonm1fh8A8okaGqmU1R6WE2Kc=;
 b=FuBnPAxu/70FVD8Z/RMjh32FFX9xUAYgprYv9Vr4lzN5DmcXYiHFphijT+tCHyBwLB
 A4C/5thvG084MEd1RktEnRTPOaWJm98nZry3k3+Y+3U8VMeR7XLKD3IM96ttofxEl694
 xqZ9E5bD9JVB/D2yQ2TF+IX90OLLpDtRox+V1tGTI90mLBgZcOx7xoA88hngpZkiLJ/l
 jRGUhgmYYsqjveBwwGlrZaXQ7j0LWWtVRK7FRcD0DIk1mHUqa7szyVE/N66X+LrH3UHp
 XgkoeYeMLlA3gfYBvCkDBXNnxomt9oitaHogG7xMq89xDtOmFNy5fAr4sOWxknp3kJD8
 BFwA==
X-Gm-Message-State: AOAM533CiyGXTlwZiuPBtRg2TcuR1wzW7NK2McMJkQACiUpuXBgaEvct
 ufl6FT+tHEOnhEYkQ8b8ezAGNsI+dQJcUrO8rtmLRRWC1dagnjMabE0GtfvnIWzB443Hb0xEYEb
 o+kHuQ+j/5UYD0fuoAQzEPp6uTugBHLk=
X-Received: by 2002:a02:ac03:: with SMTP id a3mr46210788jao.71.1608207871039; 
 Thu, 17 Dec 2020 04:24:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqX02onBVpMNQ8E5DrVem9F15twCKWTQ8Lx1NiwdLZ1Y82OxoeSNSXaTzeZnUPv/TfjBLUHnNwIoowatsUGiQ=
X-Received: by 2002:a02:ac03:: with SMTP id a3mr46210777jao.71.1608207870850; 
 Thu, 17 Dec 2020 04:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-6-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:24:19 +0400
Message-ID: <CAMxuvawfUzaJjhmHFXL_jxtT4TGjpKxbzbf8Mqb2uM2TjzSjBQ@mail.gmail.com>
Subject: Re: [PATCH 05/18] bzip2: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000de0dbf05b6a81279"
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

--000000000000de0dbf05b6a81279
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 31 ++++---------------------------
>  meson.build       | 18 +++++++++++++++---
>  meson_options.txt |  2 ++
>  3 files changed, 21 insertions(+), 30 deletions(-)
>
> diff --git a/configure b/configure
> index 5529ac4b32..082ac3bf35 100755
> --- a/configure
> +++ b/configure
> @@ -396,7 +396,7 @@ avx2_opt=3D"$default_feature"
>  capstone=3D"auto"
>  lzo=3D"$default_feature"
>  snappy=3D"$default_feature"
> -bzip2=3D"$default_feature"
> +bzip2=3D"auto"
>  lzfse=3D"$default_feature"
>  zstd=3D"$default_feature"
>  guest_agent=3D"$default_feature"
> @@ -1320,9 +1320,9 @@ for opt do
>    ;;
>    --enable-snappy) snappy=3D"yes"
>    ;;
> -  --disable-bzip2) bzip2=3D"no"
> +  --disable-bzip2) bzip2=3D"disabled"
>    ;;
> -  --enable-bzip2) bzip2=3D"yes"
> +  --enable-bzip2) bzip2=3D"enabled"
>    ;;
>    --enable-lzfse) lzfse=3D"yes"
>    ;;
> @@ -2496,24 +2496,6 @@ EOF
>      fi
>  fi
>
> -##########################################
> -# bzip2 check
> -
> -if test "$bzip2" !=3D "no" ; then
> -    cat > $TMPC << EOF
> -#include <bzlib.h>
> -int main(void) { BZ2_bzlibVersion(); return 0; }
> -EOF
> -    if compile_prog "" "-lbz2" ; then
> -        bzip2=3D"yes"
> -    else
> -        if test "$bzip2" =3D "yes"; then
> -            feature_not_found "libbzip2" "Install libbzip2 devel"
> -        fi
> -        bzip2=3D"no"
> -    fi
> -fi
> -
>  ##########################################
>  # lzfse check
>
> @@ -6238,11 +6220,6 @@ if test "$snappy" =3D "yes" ; then
>    echo "SNAPPY_LIBS=3D$snappy_libs" >> $config_host_mak
>  fi
>
> -if test "$bzip2" =3D "yes" ; then
> -  echo "CONFIG_BZIP2=3Dy" >> $config_host_mak
> -  echo "BZIP2_LIBS=3D-lbz2" >> $config_host_mak
> -fi
> -
>  if test "$lzfse" =3D "yes" ; then
>    echo "CONFIG_LZFSE=3Dy" >> $config_host_mak
>    echo "LZFSE_LIBS=3D-llzfse" >> $config_host_mak
> @@ -6825,7 +6802,7 @@ NINJA=3D$ninja $meson setup \
>          -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
> -Dvnc_png=3D$vnc_png \
>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
> -Dvirtiofsd=3D$virtiofsd \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
> -        -Dcurl=3D$curl -Dglusterfs=3D$glusterfs \
> +        -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2 \
>          -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=3D$libudev\
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
> diff --git a/meson.build b/meson.build
> index 409b958a7f..9ba8eecf37 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -654,8 +654,20 @@ if 'CONFIG_LIBSSH' in config_host
>                                link_args:
> config_host['LIBSSH_LIBS'].split())
>  endif
>  libbzip2 =3D not_found
> -if 'CONFIG_BZIP2' in config_host
> -  libbzip2 =3D declare_dependency(link_args:
> config_host['BZIP2_LIBS'].split())
> +if not get_option('bzip2').auto() or have_block
> +  libbzip2 =3D cc.find_library('bz2', has_headers: ['bzlib.h'],
> +                             required: get_option('bzip2'),
> +                             static: enable_static)
> +  if libbzip2.found() and not cc.links('''
> +     #include <bzlib.h>
> +     int main(void) { BZ2_bzlibVersion(); return 0; }''', dependencies:
> libbzip2)
> +    libbzip2 =3D not_found
> +    if get_option('bzip2').enabled()
> +      error('could not link libbzip2')
> +    else
> +      warning('could not link libbzip2, disabling')
> +    endif
>

sigh, they don't have pkg-config yet... oh well, the diff stat is still
looking good

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

+  endif
>  endif
>  liblzfse =3D not_found
>  if 'CONFIG_LZFSE' in config_host
> @@ -2298,7 +2310,7 @@ summary_info +=3D {'QOM debugging':
>  config_host.has_key('CONFIG_QOM_CAST_DEBUG
>  summary_info +=3D {'Live block migration':
> config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
>  summary_info +=3D {'lzo support':       config_host.has_key('CONFIG_LZO'=
)}
>  summary_info +=3D {'snappy support':
> config_host.has_key('CONFIG_SNAPPY')}
> -summary_info +=3D {'bzip2 support':     config_host.has_key('CONFIG_BZIP=
2')}
> +summary_info +=3D {'bzip2 support':     libbzip2.found()}
>  summary_info +=3D {'lzfse support':     config_host.has_key('CONFIG_LZFS=
E')}
>  summary_info +=3D {'zstd support':      config_host.has_key('CONFIG_ZSTD=
')}
>  summary_info +=3D {'NUMA host support': config_host.has_key('CONFIG_NUMA=
')}
> diff --git a/meson_options.txt b/meson_options.txt
> index b5d84bb88b..fd16f3b399 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -42,6 +42,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
>
>  option('brlapi', type : 'feature', value : 'auto',
>         description: 'brlapi character device driver')
> +option('bzip2', type : 'feature', value : 'auto',
> +       description: 'bzip2 support for DMG images')
>  option('cocoa', type : 'feature', value : 'auto',
>         description: 'Cocoa user interface (macOS only)')
>  option('curl', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000de0dbf05b6a81279
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
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++-----------------=
----------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++++++++++++---<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 21 insertions(+), 30 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 5529ac4b32..082ac3bf35 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -396,7 +396,7 @@ avx2_opt=3D&quot;$default_feature&quot;<br>
=C2=A0capstone=3D&quot;auto&quot;<br>
=C2=A0lzo=3D&quot;$default_feature&quot;<br>
=C2=A0snappy=3D&quot;$default_feature&quot;<br>
-bzip2=3D&quot;$default_feature&quot;<br>
+bzip2=3D&quot;auto&quot;<br>
=C2=A0lzfse=3D&quot;$default_feature&quot;<br>
=C2=A0zstd=3D&quot;$default_feature&quot;<br>
=C2=A0guest_agent=3D&quot;$default_feature&quot;<br>
@@ -1320,9 +1320,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-snappy) snappy=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-bzip2) bzip2=3D&quot;no&quot;<br>
+=C2=A0 --disable-bzip2) bzip2=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-bzip2) bzip2=3D&quot;yes&quot;<br>
+=C2=A0 --enable-bzip2) bzip2=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-lzfse) lzfse=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2496,24 +2496,6 @@ EOF<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# bzip2 check<br>
-<br>
-if test &quot;$bzip2&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;bzlib.h&gt;<br>
-int main(void) { BZ2_bzlibVersion(); return 0; }<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;-lbz2&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bzip2=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$bzip2&quot; =3D &quot;yes&quot;=
; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;libbzip2=
&quot; &quot;Install libbzip2 devel&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bzip2=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# lzfse check<br>
<br>
@@ -6238,11 +6220,6 @@ if test &quot;$snappy&quot; =3D &quot;yes&quot; ; th=
en<br>
=C2=A0 =C2=A0echo &quot;SNAPPY_LIBS=3D$snappy_libs&quot; &gt;&gt; $config_h=
ost_mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$bzip2&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_BZIP2=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;BZIP2_LIBS=3D-lbz2&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$lzfse&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_LZFSE=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0 =C2=A0echo &quot;LZFSE_LIBS=3D-llzfse&quot; &gt;&gt; $config_host_ma=
k<br>
@@ -6825,7 +6802,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc=
_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl -Dglusterfs=3D$glusterfs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip=
2=3D$bzip2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Diconv=3D$iconv -Dcurses=3D$curses -Dlib=
udev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
diff --git a/meson.build b/meson.build<br>
index 409b958a7f..9ba8eecf37 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -654,8 +654,20 @@ if &#39;CONFIG_LIBSSH&#39; in config_host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;LIBSSH_LI=
BS&#39;].split())<br>
=C2=A0endif<br>
=C2=A0libbzip2 =3D not_found<br>
-if &#39;CONFIG_BZIP2&#39; in config_host<br>
-=C2=A0 libbzip2 =3D declare_dependency(link_args: config_host[&#39;BZIP2_L=
IBS&#39;].split())<br>
+if not get_option(&#39;bzip2&#39;).auto() or have_block<br>
+=C2=A0 libbzip2 =3D cc.find_library(&#39;bz2&#39;, has_headers: [&#39;bzli=
b.h&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required: get_option(&#39;bzip2&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static: enable_static)<br>
+=C2=A0 if libbzip2.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0#include &lt;bzlib.h&gt;<br>
+=C2=A0 =C2=A0 =C2=A0int main(void) { BZ2_bzlibVersion(); return 0; }&#39;&=
#39;&#39;, dependencies: libbzip2)<br>
+=C2=A0 =C2=A0 libbzip2 =3D not_found<br>
+=C2=A0 =C2=A0 if get_option(&#39;bzip2&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;could not link libbzip2&#39;)<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 warning(&#39;could not link libbzip2, disabling&#39;)=
<br>
+=C2=A0 =C2=A0 endif<br></blockquote></div><div class=3D"gmail_quote"><div>=
<br></div><div>sigh, they don&#39;t have pkg-config yet... oh well, the dif=
f stat is still looking good<br></div><div><br></div><div>Reviewed-by: Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt; </div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+=C2=A0 endif<br>
=C2=A0endif<br>
=C2=A0liblzfse =3D not_found<br>
=C2=A0if &#39;CONFIG_LZFSE&#39; in config_host<br>
@@ -2298,7 +2310,7 @@ summary_info +=3D {&#39;QOM debugging&#39;:=C2=A0 =C2=
=A0 =C2=A0config_host.has_key(&#39;CONFIG_QOM_CAST_DEBUG<br>
=C2=A0summary_info +=3D {&#39;Live block migration&#39;: config_host.has_ke=
y(&#39;CONFIG_LIVE_BLOCK_MIGRATION&#39;)}<br>
=C2=A0summary_info +=3D {&#39;lzo support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host.has_key(&#39;CONFIG_LZO&#39;)}<br>
=C2=A0summary_info +=3D {&#39;snappy support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_SNAPPY&#39;)}<br>
-summary_info +=3D {&#39;bzip2 support&#39;:=C2=A0 =C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_BZIP2&#39;)}<br>
+summary_info +=3D {&#39;bzip2 support&#39;:=C2=A0 =C2=A0 =C2=A0libbzip2.fo=
und()}<br>
=C2=A0summary_info +=3D {&#39;lzfse support&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_LZFSE&#39;)}<br>
=C2=A0summary_info +=3D {&#39;zstd support&#39;:=C2=A0 =C2=A0 =C2=A0 config=
_host.has_key(&#39;CONFIG_ZSTD&#39;)}<br>
=C2=A0summary_info +=3D {&#39;NUMA host support&#39;: config_host.has_key(&=
#39;CONFIG_NUMA&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index b5d84bb88b..fd16f3b399 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -42,6 +42,8 @@ option(&#39;cfi_debug&#39;, type: &#39;boolean&#39;, valu=
e: &#39;false&#39;,<br>
<br>
=C2=A0option(&#39;brlapi&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;brlapi character device drive=
r&#39;)<br>
+option(&#39;bzip2&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;bzip2 support for DMG images&=
#39;)<br>
=C2=A0option(&#39;cocoa&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Cocoa user interface (macOS o=
nly)&#39;)<br>
=C2=A0option(&#39;curl&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000de0dbf05b6a81279--


