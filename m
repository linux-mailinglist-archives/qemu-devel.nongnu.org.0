Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC512DD29B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:09:36 +0100 (CET)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptyJ-0007Ju-DQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptxI-0006Vq-6e
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:08:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptxG-0006kj-2m
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608214109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=02dIElbxaJC/6JGukoyNAACpV5L9zBJiaQ7lLzxjITE=;
 b=YcmkqPhUGddeYsMIPE+Gg4BHFALkXbCe19LI3eeVbzZRdayUiUwgcrszCVgoWpBQNBeMiC
 E9mfjDlT9TAqV/yS6P9FAFBdaLezsvFn1F819hKPdS8RaHTfwU9nUgm1rWhb4WXai6IEpq
 ybKxh+++1Iep5JEU6xIvnBt3MaB54H4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Y1BEE03KNb6yKNEQxNtNvA-1; Thu, 17 Dec 2020 09:08:27 -0500
X-MC-Unique: Y1BEE03KNb6yKNEQxNtNvA-1
Received: by mail-il1-f199.google.com with SMTP id j20so31678065ilk.0
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02dIElbxaJC/6JGukoyNAACpV5L9zBJiaQ7lLzxjITE=;
 b=DyOkflvRSJsdS7Z3+tXZOlTyiex0DIuBM0N4hZNiSKMfXzIF8DL0rd4zAxGYdhQ7+o
 K6HTUKFPrfVsIKBHSpWjPbNLRLhxtd3opGwv9gOhN1ef47lkNbyzP44NHqGydmWr2qkD
 rHQNU8hzOvtdE1kaPpFyBUFfbduF/89+ZjS6/5U7yxidPGB8QnODJEKvljvthWWNUyBL
 kkaPCn6nXQFNtKm0AkPax2hiOhNFgnv/J3m342T5Hpa+sEtDkgc/LvgtE//6Mq/sZkj9
 jc5tg3agxhYfpv0olWCm5OQ8wgEM66MZ+1Xp4mOnreK7HLI+XK6BgFJuD+2QhB1/Tx06
 UazQ==
X-Gm-Message-State: AOAM532BTwFo/UPVIa2Ne9EgOr6kc555GtqqqCXCtinuzZ9ncIXiVwSW
 fZcUJhjE3zwlijTdQMySdSI00GS//7u0x9ptkRZNFGV2YnSJ27E46fuBo4MVkMWpm8Gu7dz1qWf
 SM7BFdH8qfpwNF3Jh1eUuwqQk+ZfZljI=
X-Received: by 2002:a02:5e81:: with SMTP id h123mr47809549jab.36.1608214106389; 
 Thu, 17 Dec 2020 06:08:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdyORgMcpLMBeobCEFKDM2AK1IjNLBQhW+8eU6agBh48ZfaNvNV/VsH1x0cfBAceeojz4ey2kLvEDJ3prUBIk=
X-Received: by 2002:a02:5e81:: with SMTP id h123mr47809538jab.36.1608214106179; 
 Thu, 17 Dec 2020 06:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-19-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-19-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 18:08:15 +0400
Message-ID: <CAMxuvaxzi-5_TuhW9rVa4X4KPqh0zbTyFvgvJXjwffTiTLRzKQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] meson.build: convert --with-default-devices to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000085a23405b6a986e2"
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

--00000000000085a23405b6a986e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Pass the boolean option directly instead of writing
> CONFIG_MINIKCONF_MODE to config-host.mak.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure         | 13 ++++---------
>  meson.build       |  5 +++--
>  meson_options.txt |  2 ++
>  3 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/configure b/configure
> index 420663d69a..ab4b826755 100755
> --- a/configure
> +++ b/configure
> @@ -447,7 +447,7 @@ sheepdog=3D"no"
>  libxml2=3D"$default_feature"
>  debug_mutex=3D"no"
>  libpmem=3D"$default_feature"
> -default_devices=3D"yes"
> +default_devices=3D"true"
>  plugins=3D"no"
>  fuzzing=3D"no"
>  rng_none=3D"no"
> @@ -944,9 +944,9 @@ for opt do
>    ;;
>    --with-trace-file=3D*) trace_file=3D"$optarg"
>    ;;
> -  --with-default-devices) default_devices=3D"yes"
> +  --with-default-devices) default_devices=3D"true"
>    ;;
> -  --without-default-devices) default_devices=3D"no"
> +  --without-default-devices) default_devices=3D"false"
>    ;;
>    --without-default-features) # processed above
>    ;;
> @@ -5541,11 +5541,6 @@ echo "GIT_UPDATE=3D$git_update" >> $config_host_ma=
k
>
>  echo "ARCH=3D$ARCH" >> $config_host_mak
>
> -if test "$default_devices" =3D "yes" ; then
> -  echo "CONFIG_MINIKCONF_MODE=3D--defconfig" >> $config_host_mak
> -else
> -  echo "CONFIG_MINIKCONF_MODE=3D--allnoconfig" >> $config_host_mak
> -fi
>  if test "$debug_tcg" =3D "yes" ; then
>    echo "CONFIG_DEBUG_TCG=3Dy" >> $config_host_mak
>  fi
> @@ -6498,7 +6493,7 @@ NINJA=3D$ninja $meson setup \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
>          -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy
> -Dlzfse=3D$lzfse \
>          -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=3D$virtfs -Dcap_ng=
=3D$cap_ng
> \
> -        -Dattr=3D$attr \
> +        -Dattr=3D$attr -Ddefault_devices=3D$default_devices \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 341eadaa5c..4d331405e4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1276,7 +1276,8 @@ foreach target : target_dirs
>        output: config_devices_mak,
>        depfile: config_devices_mak + '.d',
>        capture: true,
> -      command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
> +      command: [minikconf,
> +                get_option('default_devices') ? '--defconfig' :
> '--allnoconfig',
>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
>                  host_kconfig, accel_kconfig])
>
> @@ -2469,7 +2470,7 @@ summary_info +=3D {'capstone':          capstone_op=
t
> =3D=3D 'disabled' ? false : capst
>  summary_info +=3D {'libpmem support':
>  config_host.has_key('CONFIG_LIBPMEM')}
>  summary_info +=3D {'libdaxctl support':
> config_host.has_key('CONFIG_LIBDAXCTL')}
>  summary_info +=3D {'libudev':           libudev.found()}
> -summary_info +=3D {'default devices':
>  config_host['CONFIG_MINIKCONF_MODE'] =3D=3D '--defconfig'}
> +summary_info +=3D {'default devices':   get_option('default_devices')}
>  summary_info +=3D {'plugin support':
> config_host.has_key('CONFIG_PLUGIN')}
>  summary_info +=3D {'fuzzing support':   config_host.has_key('CONFIG_FUZZ=
')}
>  if config_host.has_key('HAVE_GDB_BIN')
> diff --git a/meson_options.txt b/meson_options.txt
> index 8fcec056cd..1d4a71772e 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -7,6 +7,8 @@ option('qemu_firmwarepath', type : 'string', value : '',
>  option('sphinx_build', type : 'string', value : '',
>         description: 'Use specified sphinx-build [$sphinx_build] for
> building document (default to be empty)')
>
> +option('default_devices', type : 'boolean', value : true,
> +       description: 'Include a default selection of devices in emulators=
')
>  option('docs', type : 'feature', value : 'auto',
>         description: 'Documentations build support')
>  option('gettext', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>

--00000000000085a23405b6a986e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:41 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Pass=
 the boolean option directly instead of writing<br>
CONFIG_MINIKCONF_MODE to config-host.mak.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++---------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++--<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 9 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 420663d69a..ab4b826755 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -447,7 +447,7 @@ sheepdog=3D&quot;no&quot;<br>
=C2=A0libxml2=3D&quot;$default_feature&quot;<br>
=C2=A0debug_mutex=3D&quot;no&quot;<br>
=C2=A0libpmem=3D&quot;$default_feature&quot;<br>
-default_devices=3D&quot;yes&quot;<br>
+default_devices=3D&quot;true&quot;<br>
=C2=A0plugins=3D&quot;no&quot;<br>
=C2=A0fuzzing=3D&quot;no&quot;<br>
=C2=A0rng_none=3D&quot;no&quot;<br>
@@ -944,9 +944,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-trace-file=3D*) trace_file=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --with-default-devices) default_devices=3D&quot;yes&quot;<br>
+=C2=A0 --with-default-devices) default_devices=3D&quot;true&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --without-default-devices) default_devices=3D&quot;no&quot;<br>
+=C2=A0 --without-default-devices) default_devices=3D&quot;false&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--without-default-features) # processed above<br>
=C2=A0 =C2=A0;;<br>
@@ -5541,11 +5541,6 @@ echo &quot;GIT_UPDATE=3D$git_update&quot; &gt;&gt; $=
config_host_mak<br>
<br>
=C2=A0echo &quot;ARCH=3D$ARCH&quot; &gt;&gt; $config_host_mak<br>
<br>
-if test &quot;$default_devices&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_MINIKCONF_MODE=3D--defconfig&quot; &gt;&gt; $conf=
ig_host_mak<br>
-else<br>
-=C2=A0 echo &quot;CONFIG_MINIKCONF_MODE=3D--allnoconfig&quot; &gt;&gt; $co=
nfig_host_mak<br>
-fi<br>
=C2=A0if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_DEBUG_TCG=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
=C2=A0fi<br>
@@ -6498,7 +6493,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$=
lzo -Dsnappy=3D$snappy -Dlzfse=3D$lzfse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvir=
tfs=3D$virtfs -Dcap_ng=3D$cap_ng \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dattr=3D$attr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dattr=3D$attr -Ddefault_devices=3D$default_de=
vices \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 341eadaa5c..4d331405e4 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1276,7 +1276,8 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0output: config_devices_mak,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0depfile: config_devices_mak + &#39;.d&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0capture: true,<br>
-=C2=A0 =C2=A0 =C2=A0 command: [minikconf, config_host[&#39;CONFIG_MINIKCON=
F_MODE&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 command: [minikconf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_option(&#39;de=
fault_devices&#39;) ? &#39;--defconfig&#39; : &#39;--allnoconfig&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_device=
s_mak, &#39;@DEPFILE@&#39;, &#39;@INPUT@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_kconfig,=
 accel_kconfig])<br>
<br>
@@ -2469,7 +2470,7 @@ summary_info +=3D {&#39;capstone&#39;:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 capstone_opt =3D=3D &#39;disabled&#39; ? false : capst=
<br>
=C2=A0summary_info +=3D {&#39;libpmem support&#39;:=C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_LIBPMEM&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libdaxctl support&#39;: config_host.has_key(&=
#39;CONFIG_LIBDAXCTL&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libudev&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libudev.found()}<br>
-summary_info +=3D {&#39;default devices&#39;:=C2=A0 =C2=A0config_host[&#39=
;CONFIG_MINIKCONF_MODE&#39;] =3D=3D &#39;--defconfig&#39;}<br>
+summary_info +=3D {&#39;default devices&#39;:=C2=A0 =C2=A0get_option(&#39;=
default_devices&#39;)}<br>
=C2=A0summary_info +=3D {&#39;plugin support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_PLUGIN&#39;)}<br>
=C2=A0summary_info +=3D {&#39;fuzzing support&#39;:=C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_FUZZ&#39;)}<br>
=C2=A0if config_host.has_key(&#39;HAVE_GDB_BIN&#39;)<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 8fcec056cd..1d4a71772e 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -7,6 +7,8 @@ option(&#39;qemu_firmwarepath&#39;, type : &#39;string&#39;=
, value : &#39;&#39;,<br>
=C2=A0option(&#39;sphinx_build&#39;, type : &#39;string&#39;, value : &#39;=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use specified sphinx-build [$=
sphinx_build] for building document (default to be empty)&#39;)<br>
<br>
+option(&#39;default_devices&#39;, type : &#39;boolean&#39;, value : true,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Include a default selection o=
f devices in emulators&#39;)<br>
=C2=A0option(&#39;docs&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Documentations build support&=
#39;)<br>
=C2=A0option(&#39;gettext&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;,<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--00000000000085a23405b6a986e2--


