Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B942DD0B7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:47:26 +0100 (CET)
Received: from localhost ([::1]:53508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprkj-0000XF-1l
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprZV-0005UT-9r
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprZS-0006Ru-A6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608204939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MteYcfFp9rtNX9eV53TOuzGgon4hK832LhRpbj1LbVY=;
 b=fgP+elP9aLp+LR8gerA7ejc0az1UzmY3Yf+AHHM9oVshpzKp7HjKljB/1yEdDJx/F5waYI
 RV5+P6cSNPwmkIVlPhK9EXOnQjITPBsJ5IPqpXooz2ynb82q12IHjeB5dL27pGOBDGE6Ku
 AUvj1CwmeWMA6F6+eYzcP1sdnfcor2I=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-QJlhbm1uN5qtR8UPq81j-A-1; Thu, 17 Dec 2020 06:35:35 -0500
X-MC-Unique: QJlhbm1uN5qtR8UPq81j-A-1
Received: by mail-io1-f69.google.com with SMTP id n9so26845208iog.6
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 03:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MteYcfFp9rtNX9eV53TOuzGgon4hK832LhRpbj1LbVY=;
 b=Y4GPEcMncJffn1ZynsjjmcHdKUvNdTxImZrX1bkMz3hgPMyAdLofEpzGGMBKhSkJLd
 7JqwDmlCFsPU6zP3njtXZCNjyJbkQF/VJXZ6q7R9ed97hEvt5Rig5JZWl77S1JEDPNxC
 IpzW5lqb1Sg4MwhnhO7yhfsRCdCa4FpU5z0X6WzguRVRqixiIyzeyOpfftryGstFf0yj
 PMh/cZL+zBN4lnYcA+f/g5NQKFWKTl7Et70CRICux3H7BsfQaderoHhEX2ex0+1EVera
 i2vmIPcr/yUU49JU4/uhuPq1JO6J9xGqh150SK/3d8HyK5p5+TNRCwLDUxq4gwLCDWbg
 caLQ==
X-Gm-Message-State: AOAM532FLRp+Q0jgtTldX2tHU79CRhiLdfOjK6KLd3zFI5G52NdzdCLD
 hEYWS3uk2njDrvC0wS2qLrTE31PJEMuZOODmV49SKnZ1biVcutd07PeZsTMaeI8qwGjQcLTnqaW
 aGwJjkf4SKVqv4uMbuVJ0q8Dy4z/gGTA=
X-Received: by 2002:a02:ac03:: with SMTP id a3mr46045177jao.71.1608204935338; 
 Thu, 17 Dec 2020 03:35:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyI6foBpoqC9tvFr85JuTqQoXrLSpXTSEqCS9dY+3QLLb+rqPf3RVzBXypwVJOcNB9maB1Oi1vUttj+5IG28tU=
X-Received: by 2002:a02:ac03:: with SMTP id a3mr46045167jao.71.1608204935184; 
 Thu, 17 Dec 2020 03:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-2-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 15:35:24 +0400
Message-ID: <CAMxuvaxNZtbcEacJx_RcKRpKj++RsoddOMPOfv+CTAc5CANGsQ@mail.gmail.com>
Subject: Re: [PATCH 01/18] brlapi: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e358e205b6a76326"
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

--000000000000e358e205b6a76326
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/meson.build |  2 +-
>  configure           | 32 ++++----------------------------
>  meson.build         | 20 +++++++++++++++++---
>  meson_options.txt   |  2 ++
>  4 files changed, 24 insertions(+), 32 deletions(-)
>
> diff --git a/chardev/meson.build b/chardev/meson.build
> index 4e19722c5e..32377af383 100644
> --- a/chardev/meson.build
> +++ b/chardev/meson.build
> @@ -29,7 +29,7 @@ softmmu_ss.add(files('msmouse.c', 'wctablet.c',
> 'testdev.c'))
>
>  chardev_modules =3D {}
>
> -if config_host.has_key('CONFIG_BRLAPI')
> +if brlapi.found()
>    module_ss =3D ss.source_set()
>    module_ss.add(when: [brlapi], if_true: [files('baum.c'), pixman])
>    chardev_modules +=3D { 'baum': module_ss }
> diff --git a/configure b/configure
> index 74eebfd692..42b39544d4 100755
> --- a/configure
> +++ b/configure
> @@ -306,7 +306,7 @@ for opt do
>    esac
>  done
>
> -brlapi=3D"$default_feature"
> +brlapi=3D"auto"
>  curl=3D"$default_feature"
>  iconv=3D"auto"
>  curses=3D"auto"
> @@ -1105,9 +1105,9 @@ for opt do
>    ;;
>    --enable-xen-pci-passthrough) xen_pci_passthrough=3D"enabled"
>    ;;
> -  --disable-brlapi) brlapi=3D"no"
> +  --disable-brlapi) brlapi=3D"disabled"
>    ;;
> -  --enable-brlapi) brlapi=3D"yes"
> +  --enable-brlapi) brlapi=3D"enabled"
>    ;;
>    --disable-kvm) kvm=3D"disabled"
>    ;;
> @@ -3425,26 +3425,6 @@ for drv in $audio_drv_list; do
>      esac
>  done
>
> -##########################################
> -# BrlAPI probe
> -
> -if test "$brlapi" !=3D "no" ; then
> -  brlapi_libs=3D"-lbrlapi"
> -  cat > $TMPC << EOF
> -#include <brlapi.h>
> -#include <stddef.h>
> -int main( void ) { return brlapi__openConnection (NULL, NULL, NULL); }
> -EOF
> -  if compile_prog "" "$brlapi_libs" ; then
> -    brlapi=3Dyes
> -  else
> -    if test "$brlapi" =3D "yes" ; then
> -      feature_not_found "brlapi" "Install brlapi devel"
> -    fi
> -    brlapi=3Dno
> -  fi
> -fi
> -
>  ##########################################
>  # curl probe
>  if test "$curl" !=3D "no" ; then
> @@ -6134,10 +6114,6 @@ if test "$curl" =3D "yes" ; then
>    echo "CURL_CFLAGS=3D$curl_cflags" >> $config_host_mak
>    echo "CURL_LIBS=3D$curl_libs" >> $config_host_mak
>  fi
> -if test "$brlapi" =3D "yes" ; then
> -  echo "CONFIG_BRLAPI=3Dy" >> $config_host_mak
> -  echo "BRLAPI_LIBS=3D$brlapi_libs" >> $config_host_mak
> -fi
>  if test "$gtk" =3D "yes" ; then
>    echo "CONFIG_GTK=3Dy" >> $config_host_mak
>    echo "GTK_CFLAGS=3D$gtk_cflags" >> $config_host_mak
> @@ -6971,7 +6947,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcocoa=3D$cocoa -Dmpath=3D$mpath -Dsdl=3D$sdl -Dsdl_image=3D$sd=
l_image \
>          -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
> -Dvnc_png=3D$vnc_png \
>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
> -Dvirtiofsd=3D$virtiofsd \
> -        -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt \
> +        -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
>          -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=3D$libudev\
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
> diff --git a/meson.build b/meson.build
> index bb198f792a..70f81121d7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -570,8 +570,21 @@ if have_system and not get_option('curses').disabled=
()
>  endif
>
>  brlapi =3D not_found
> -if 'CONFIG_BRLAPI' in config_host
> -  brlapi =3D declare_dependency(link_args:
> config_host['BRLAPI_LIBS'].split())
> +if not get_option('brlapi').auto() or have_system
>

with some new legit conditional check, ok


> +  brlapi =3D cc.find_library('brlapi', has_headers: ['brlapi.h'],
> +                         required: get_option('brlapi'),
> +                         static: enable_static)
> +  if brlapi.found() and not cc.links('''
> +     #include <brlapi.h>
> +     #include <stddef.h>
> +     int main(void) { return brlapi__openConnection (NULL, NULL, NULL);
> }''', dependencies: brlapi)
> +    brlapi =3D not_found
> +    if get_option('brlapi').enabled()
> +      error('could not link brlapi')
> +    else
> +      warning('could not link brlapi, disabling')
> +    endif
> +  endif
>  endif
>
>  sdl =3D not_found
> @@ -854,6 +867,7 @@
> config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR',
> get_option('prefix') /
>  config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') /
> qemu_moddir)
>  config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') /
> get_option('sysconfdir'))
>
> +config_host_data.set('CONFIG_BRLAPI', brlapi.found())
>  config_host_data.set('CONFIG_COCOA', cocoa.found())
>  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
>  config_host_data.set('CONFIG_MPATH', mpathpersist.found())
> @@ -2164,7 +2178,7 @@ summary_info +=3D {'xen support':
>  config_host.has_key('CONFIG_XEN_BACKEND')}
>  if config_host.has_key('CONFIG_XEN_BACKEND')
>    summary_info +=3D {'xen ctrl version':
> config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
>  endif
> -summary_info +=3D {'brlapi support':
> config_host.has_key('CONFIG_BRLAPI')}
> +summary_info +=3D {'brlapi support':    brlapi.found()}
>  summary_info +=3D {'Documentation':     build_docs}
>  summary_info +=3D {'PIE':               get_option('b_pie')}
>  summary_info +=3D {'vde support':       config_host.has_key('CONFIG_VDE'=
)}
> diff --git a/meson_options.txt b/meson_options.txt
> index 242e0769fb..62efe96a91 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -40,6 +40,8 @@ option('cfi', type: 'boolean', value: 'false',
>  option('cfi_debug', type: 'boolean', value: 'false',
>         description: 'Verbose errors in case of CFI violation')
>
> +option('brlapi', type : 'feature', value : 'auto',
> +       description: 'brlapi character device driver')
>  option('cocoa', type : 'feature', value : 'auto',
>         description: 'Cocoa user interface (macOS only)')
>  option('mpath', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000e358e205b6a76326
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
=C2=A0chardev/meson.build |=C2=A0 2 +-<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++----------=
------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 +++++++++++++++++--=
-<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A04 files changed, 24 insertions(+), 32 deletions(-)<br>
<br>
diff --git a/chardev/meson.build b/chardev/meson.build<br>
index 4e19722c5e..32377af383 100644<br>
--- a/chardev/meson.build<br>
+++ b/chardev/meson.build<br>
@@ -29,7 +29,7 @@ softmmu_ss.add(files(&#39;msmouse.c&#39;, &#39;wctablet.c=
&#39;, &#39;testdev.c&#39;))<br>
<br>
=C2=A0chardev_modules =3D {}<br>
<br>
-if config_host.has_key(&#39;CONFIG_BRLAPI&#39;)<br>
+if brlapi.found()<br>
=C2=A0 =C2=A0module_ss =3D ss.source_set()<br>
=C2=A0 =C2=A0module_ss.add(when: [brlapi], if_true: [files(&#39;baum.c&#39;=
), pixman])<br>
=C2=A0 =C2=A0chardev_modules +=3D { &#39;baum&#39;: module_ss }<br>
diff --git a/configure b/configure<br>
index 74eebfd692..42b39544d4 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -306,7 +306,7 @@ for opt do<br>
=C2=A0 =C2=A0esac<br>
=C2=A0done<br>
<br>
-brlapi=3D&quot;$default_feature&quot;<br>
+brlapi=3D&quot;auto&quot;<br>
=C2=A0curl=3D&quot;$default_feature&quot;<br>
=C2=A0iconv=3D&quot;auto&quot;<br>
=C2=A0curses=3D&quot;auto&quot;<br>
@@ -1105,9 +1105,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-xen-pci-passthrough) xen_pci_passthrough=3D&quot;enab=
led&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-brlapi) brlapi=3D&quot;no&quot;<br>
+=C2=A0 --disable-brlapi) brlapi=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-brlapi) brlapi=3D&quot;yes&quot;<br>
+=C2=A0 --enable-brlapi) brlapi=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-kvm) kvm=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -3425,26 +3425,6 @@ for drv in $audio_drv_list; do<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0done<br>
<br>
-##########################################<br>
-# BrlAPI probe<br>
-<br>
-if test &quot;$brlapi&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 brlapi_libs=3D&quot;-lbrlapi&quot;<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;brlapi.h&gt;<br>
-#include &lt;stddef.h&gt;<br>
-int main( void ) { return brlapi__openConnection (NULL, NULL, NULL); }<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;$brlapi_libs&quot; ; then<br>
-=C2=A0 =C2=A0 brlapi=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$brlapi&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;brlapi&quot; &quot;Install br=
lapi devel&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 brlapi=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# curl probe<br>
=C2=A0if test &quot;$curl&quot; !=3D &quot;no&quot; ; then<br>
@@ -6134,10 +6114,6 @@ if test &quot;$curl&quot; =3D &quot;yes&quot; ; then=
<br>
=C2=A0 =C2=A0echo &quot;CURL_CFLAGS=3D$curl_cflags&quot; &gt;&gt; $config_h=
ost_mak<br>
=C2=A0 =C2=A0echo &quot;CURL_LIBS=3D$curl_libs&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
-if test &quot;$brlapi&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_BRLAPI=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;BRLAPI_LIBS=3D$brlapi_libs&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
=C2=A0if test &quot;$gtk&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GTK=3Dy&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;GTK_CFLAGS=3D$gtk_cflags&quot; &gt;&gt; $config_hos=
t_mak<br>
@@ -6971,7 +6947,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcocoa=3D$cocoa -Dmpath=3D$mpath -Dsdl=
=3D$sdl -Dsdl_image=3D$sdl_image \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc=
_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=
=3D$fdt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=
=3D$fdt -Dbrlapi=3D$brlapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Diconv=3D$iconv -Dcurses=3D$curses -Dlib=
udev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
diff --git a/meson.build b/meson.build<br>
index bb198f792a..70f81121d7 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -570,8 +570,21 @@ if have_system and not get_option(&#39;curses&#39;).di=
sabled()<br>
=C2=A0endif<br>
<br>
=C2=A0brlapi =3D not_found<br>
-if &#39;CONFIG_BRLAPI&#39; in config_host<br>
-=C2=A0 brlapi =3D declare_dependency(link_args: config_host[&#39;BRLAPI_LI=
BS&#39;].split())<br>
+if not get_option(&#39;brlapi&#39;).auto() or have_system<br></blockquote>=
<div><br></div><div>with some new legit conditional check, ok<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 brlapi =3D cc.find_library(&#39;brlapi&#39;, has_headers: [&#39;brl=
api.h&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0required: get_option(&#39;brlapi&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0static: enable_static)<br>
+=C2=A0 if brlapi.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0#include &lt;brlapi.h&gt;<br>
+=C2=A0 =C2=A0 =C2=A0#include &lt;stddef.h&gt;<br>
+=C2=A0 =C2=A0 =C2=A0int main(void) { return brlapi__openConnection (NULL, =
NULL, NULL); }&#39;&#39;&#39;, dependencies: brlapi)<br>
+=C2=A0 =C2=A0 brlapi =3D not_found<br>
+=C2=A0 =C2=A0 if get_option(&#39;brlapi&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;could not link brlapi&#39;)<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 warning(&#39;could not link brlapi, disabling&#39;)<b=
r>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
<br>
=C2=A0sdl =3D not_found<br>
@@ -854,6 +867,7 @@ config_host_data.set_quoted(&#39;CONFIG_QEMU_LOCALSTATE=
DIR&#39;, get_option(&#39;prefix&#39;) /<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_MODDIR&#39;, get_option(=
&#39;prefix&#39;) / qemu_moddir)<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_SYSCONFDIR&#39;, get_option(&=
#39;prefix&#39;) / get_option(&#39;sysconfdir&#39;))<br>
<br>
+config_host_data.set(&#39;CONFIG_BRLAPI&#39;, brlapi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_COCOA&#39;, cocoa.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBUDEV&#39;, libudev.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH&#39;, mpathpersist.found())<br=
>
@@ -2164,7 +2178,7 @@ summary_info +=3D {&#39;xen support&#39;:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0config_host.has_key(&#39;CONFIG_XEN_BACKEND&#39;)}<br>
=C2=A0if config_host.has_key(&#39;CONFIG_XEN_BACKEND&#39;)<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;xen ctrl version&#39;:=C2=A0 config_ho=
st[&#39;CONFIG_XEN_CTRL_INTERFACE_VERSION&#39;]}<br>
=C2=A0endif<br>
-summary_info +=3D {&#39;brlapi support&#39;:=C2=A0 =C2=A0 config_host.has_=
key(&#39;CONFIG_BRLAPI&#39;)}<br>
+summary_info +=3D {&#39;brlapi support&#39;:=C2=A0 =C2=A0 brlapi.found()}<=
br>
=C2=A0summary_info +=3D {&#39;Documentation&#39;:=C2=A0 =C2=A0 =C2=A0build_=
docs}<br>
=C2=A0summary_info +=3D {&#39;PIE&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0get_option(&#39;b_pie&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vde support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host.has_key(&#39;CONFIG_VDE&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 242e0769fb..62efe96a91 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -40,6 +40,8 @@ option(&#39;cfi&#39;, type: &#39;boolean&#39;, value: &#3=
9;false&#39;,<br>
=C2=A0option(&#39;cfi_debug&#39;, type: &#39;boolean&#39;, value: &#39;fals=
e&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Verbose errors in case of CFI=
 violation&#39;)<br>
<br>
+option(&#39;brlapi&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;brlapi character device drive=
r&#39;)<br>
=C2=A0option(&#39;cocoa&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Cocoa user interface (macOS o=
nly)&#39;)<br>
=C2=A0option(&#39;mpath&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000e358e205b6a76326--


