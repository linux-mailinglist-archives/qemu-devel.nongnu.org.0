Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA05508ACD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:29:50 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBL3-0005c1-TN
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhAhk-0000WL-Fs
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhAhh-000086-BJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650462547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2kz3XVWekH4W2kN/oFcPPYqcKJXox7sDVHHVaUhMLpE=;
 b=Fl6QQ5sMoSaHdS4relFXqBI6bxbdk/6Du++2u28xQM9F03PhltniaXD79ii4HkmzrynTJ9
 2uI8tGJ1tkbMO1UjnC3ZCN/rtHUjTBYDO3TrSo+lZYsiDZaTyrVBvHp6m7urznFOn5Mqof
 On7w5vr31ZJsbv4GyW4WCFjLk/y42tk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-DKbFAWVePL-KnLU2tBcpcw-1; Wed, 20 Apr 2022 09:49:05 -0400
X-MC-Unique: DKbFAWVePL-KnLU2tBcpcw-1
Received: by mail-yb1-f200.google.com with SMTP id
 n10-20020a25da0a000000b0064149e56ecaso1512143ybf.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 06:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2kz3XVWekH4W2kN/oFcPPYqcKJXox7sDVHHVaUhMLpE=;
 b=2Ti2EX8qswvh0gWHgLiFEi4wva4RtBiEc+KXMAht7wxXJG8Jh4oRYFDkwa/TgBS2iJ
 x/1WRLESHqdK2QY1kS6rYCjbEvUka6s+qt2y5hPCFBNIe3CNzmbM6Q7NKGLhkcuxsLaP
 vBQrqHC5N7sdymelxwbbNQJt7s5U1peWzFAFOtEf7o+EnHSF7egUIjZvDAxisidXZBRX
 IVD8BpkaBFrSsJu00gPDrcGIUEXHPSf+9Ao+Xv3TY3wewddnJ2+QiSZZXktdMePCV7m/
 yP1iEfkxrYc9Jxc4hdkZU6GTMRsKGJPJpyhb4a76Jka88FIHd7Zs2cKzuQF6d5/HWpjq
 wBwQ==
X-Gm-Message-State: AOAM530kXUrHyH7wN53reWLi3tofQbq1qTloZilEiQ5QYCigu27iQOzE
 rf5Ea3gVjYSFOImXNp30V5Zc5qe3ZewCPuOemsBbzE9zKy5GhTi0XWYDAvEuIabPU+mnMCbgfBj
 PHjpnKiSYDqEuJN20tRM/A3LlF1MRLlI=
X-Received: by 2002:a81:5d09:0:b0:2ea:f17a:15c1 with SMTP id
 r9-20020a815d09000000b002eaf17a15c1mr20547845ywb.481.1650462545118; 
 Wed, 20 Apr 2022 06:49:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyBN3eIXvYkcX5+WkgsNAyu78N7Ry2g5IPCIhVI1W4CfXpmGj7QM4zTr+HMcf0tAZGaCCN8EH9i2pty4iNZB0=
X-Received: by 2002:a81:5d09:0:b0:2ea:f17a:15c1 with SMTP id
 r9-20020a815d09000000b002eaf17a15c1mr20547830ywb.481.1650462544854; Wed, 20
 Apr 2022 06:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-9-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 20 Apr 2022 16:48:54 +0300
Message-ID: <CAPMcbCrg9fqKcCPPCdWQc+oSgUKbZP2mZGqnefaY4RoGDFj3rw@mail.gmail.com>
Subject: Re: [PATCH 08/41] build-sys: simplify MSI's QEMU_GA_MANUFACTURER
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Yan Vugenfirer <yvugenfi@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b3911a05dd164132"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3911a05dd164132
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9 and Yan,

Currently, we use this for the mingw-qemu-ga-win package in CentOS Stream 9
and RHEL.
https://gitlab.com/redhat/centos-stream/rpms/mingw-qemu-ga-win/-/blob/c9s/b=
uild_configure.sh

Yan, do we need this feature or not?

Best Regards,
Konstantin Kostiuk.


On Wed, Apr 20, 2022 at 4:27 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> If there is any reason to allow customization of this variable, we
> should provide a proper configure option.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure                 |  4 ----
>  qga/installer/qemu-ga.wxs | 10 ++++------
>  qga/meson.build           |  1 -
>  3 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/configure b/configure
> index 8cbe55ac82e8..5ac653b21351 100755
> --- a/configure
> +++ b/configure
> @@ -2694,9 +2694,6 @@ fi
>
>  # Guest agent Windows MSI package
>
> -if test "$QEMU_GA_MANUFACTURER" =3D ""; then
> -  QEMU_GA_MANUFACTURER=3DQEMU
> -fi
>  if test "$QEMU_GA_DISTRO" =3D ""; then
>    QEMU_GA_DISTRO=3DLinux
>  fi
> @@ -2790,7 +2787,6 @@ if test "$debug_tcg" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  echo "QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}" >> $config_host_=
mak
>    echo "QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}" >> $config_host_mak
>    echo "QEMU_GA_VERSION=3D${QEMU_GA_VERSION}" >> $config_host_mak
>  else
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 0950e8c6becc..53d836c06a96 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -8,9 +8,7 @@
>      <?error Environment variable QEMU_GA_DISTRO undefined?>
>    <?endif?>
>
> -  <?ifndef env.QEMU_GA_MANUFACTURER ?>
> -    <?error Environment variable QEMU_GA_MANUFACTURER undefined?>
> -  <?endif?>
> +  <?define QEMU_GA_MANUFACTURER =3D "QEMU" ?>
>
>    <?ifndef var.Arch?>
>      <?error Define Arch to 32 or 64?>
> @@ -43,14 +41,14 @@
>      Name=3D"QEMU guest agent"
>      Id=3D"*"
>      UpgradeCode=3D"{EB6B8302-C06E-4BEC-ADAC-932C68A3A98D}"
> -    Manufacturer=3D"$(env.QEMU_GA_MANUFACTURER)"
> +    Manufacturer=3D"$(var.QEMU_GA_MANUFACTURER)"
>      Version=3D"$(env.QEMU_GA_VERSION)"
>      Language=3D"1033">
>      <?if $(var.Arch) =3D 32 ?>
>      <Condition Message=3D"Error: 32-bit version of Qemu GA can not be
> installed on 64-bit Windows.">NOT VersionNT64</Condition>
>      <?endif?>
>      <Package
> -      Manufacturer=3D"$(env.QEMU_GA_MANUFACTURER)"
> +      Manufacturer=3D"$(var.QEMU_GA_MANUFACTURER)"
>        InstallerVersion=3D"200"
>        Languages=3D"1033"
>        Compressed=3D"yes"
> @@ -133,7 +131,7 @@
>            </Component>
>            <Component Id=3D"registry_entries"
> Guid=3D"{D075D109-51CA-11E3-9F8B-000C29858960}">
>              <RegistryKey Root=3D"HKLM"
> -
>  Key=3D"Software\$(env.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\=
QemuGA">
> +
>  Key=3D"Software\$(var.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\=
QemuGA">
>                <RegistryValue Type=3D"string" Name=3D"ProductID"
> Value=3D"fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
>                <RegistryValue Type=3D"string" Name=3D"Version"
> Value=3D"$(env.QEMU_GA_VERSION)" />
>              </RegistryKey>
> diff --git a/qga/meson.build b/qga/meson.build
> index da5e5efb19e8..6e57de430d29 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -123,7 +123,6 @@ if targetos =3D=3D 'windows'
>                              command: [
>                                find_program('env'),
>                                'QEMU_GA_VERSION=3D' +
> config_host['QEMU_GA_VERSION'],
> -                              'QEMU_GA_MANUFACTURER=3D' +
> config_host['QEMU_GA_MANUFACTURER'],
>                                'QEMU_GA_DISTRO=3D' +
> config_host['QEMU_GA_DISTRO'],
>                                'BUILD_DIR=3D' + meson.build_root(),
>                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
> --
> 2.35.1.693.g805e0a68082a
>
>

--000000000000b3911a05dd164132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Marc-Andr=C3=A9 and Yan,</div><div><br></div><div>=
Currently, we use this for the mingw-qemu-ga-win package in CentOS Stream 9=
 and RHEL.</div><div><a href=3D"https://gitlab.com/redhat/centos-stream/rpm=
s/mingw-qemu-ga-win/-/blob/c9s/build_configure.sh">https://gitlab.com/redha=
t/centos-stream/rpms/mingw-qemu-ga-win/-/blob/c9s/build_configure.sh</a></d=
iv><div><br></div><div>Yan, do we need this feature or not? <br></div><div>=
<br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konsta=
ntin Kostiuk.</div></div></div></div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 4:27=
 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
If there is any reason to allow customization of this variable, we<br>
should provide a proper configure option.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ----<br>
=C2=A0qga/installer/qemu-ga.wxs | 10 ++++------<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<b=
r>
=C2=A03 files changed, 4 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 8cbe55ac82e8..5ac653b21351 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2694,9 +2694,6 @@ fi<br>
<br>
=C2=A0# Guest agent Windows MSI package<br>
<br>
-if test &quot;$QEMU_GA_MANUFACTURER&quot; =3D &quot;&quot;; then<br>
-=C2=A0 QEMU_GA_MANUFACTURER=3DQEMU<br>
-fi<br>
=C2=A0if test &quot;$QEMU_GA_DISTRO&quot; =3D &quot;&quot;; then<br>
=C2=A0 =C2=A0QEMU_GA_DISTRO=3DLinux<br>
=C2=A0fi<br>
@@ -2790,7 +2787,6 @@ if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; =
then<br>
=C2=A0fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 echo &quot;QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}&quot; &gt=
;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}&quot; &gt;&gt; $=
config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_VERSION=3D${QEMU_GA_VERSION}&quot; &gt;&gt;=
 $config_host_mak<br>
=C2=A0else<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index 0950e8c6becc..53d836c06a96 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -8,9 +8,7 @@<br>
=C2=A0 =C2=A0 =C2=A0&lt;?error Environment variable QEMU_GA_DISTRO undefine=
d?&gt;<br>
=C2=A0 =C2=A0&lt;?endif?&gt;<br>
<br>
-=C2=A0 &lt;?ifndef env.QEMU_GA_MANUFACTURER ?&gt;<br>
-=C2=A0 =C2=A0 &lt;?error Environment variable QEMU_GA_MANUFACTURER undefin=
ed?&gt;<br>
-=C2=A0 &lt;?endif?&gt;<br>
+=C2=A0 &lt;?define QEMU_GA_MANUFACTURER =3D &quot;QEMU&quot; ?&gt;<br>
<br>
=C2=A0 =C2=A0&lt;?ifndef var.Arch?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?error Define Arch to 32 or 64?&gt;<br>
@@ -43,14 +41,14 @@<br>
=C2=A0 =C2=A0 =C2=A0Name=3D&quot;QEMU guest agent&quot;<br>
=C2=A0 =C2=A0 =C2=A0Id=3D&quot;*&quot;<br>
=C2=A0 =C2=A0 =C2=A0UpgradeCode=3D&quot;{EB6B8302-C06E-4BEC-ADAC-932C68A3A9=
8D}&quot;<br>
-=C2=A0 =C2=A0 Manufacturer=3D&quot;$(env.QEMU_GA_MANUFACTURER)&quot;<br>
+=C2=A0 =C2=A0 Manufacturer=3D&quot;$(var.QEMU_GA_MANUFACTURER)&quot;<br>
=C2=A0 =C2=A0 =C2=A0Version=3D&quot;$(env.QEMU_GA_VERSION)&quot;<br>
=C2=A0 =C2=A0 =C2=A0Language=3D&quot;1033&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?if $(var.Arch) =3D 32 ?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;Condition Message=3D&quot;Error: 32-bit version of =
Qemu GA can not be installed on 64-bit Windows.&quot;&gt;NOT VersionNT64&lt=
;/Condition&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?endif?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;Package<br>
-=C2=A0 =C2=A0 =C2=A0 Manufacturer=3D&quot;$(env.QEMU_GA_MANUFACTURER)&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 Manufacturer=3D&quot;$(var.QEMU_GA_MANUFACTURER)&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0InstallerVersion=3D&quot;200&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Languages=3D&quot;1033&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Compressed=3D&quot;yes&quot;<br>
@@ -133,7 +131,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;registry_=
entries&quot; Guid=3D&quot;{D075D109-51CA-11E3-9F8B-000C29858960}&quot;&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryKey Root=3D&quo=
t;HKLM&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Key=3D&quot;Software\$(env.QEMU_GA_MANUFACTURER)\$(env.QEM=
U_GA_DISTRO)\Tools\QemuGA&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Key=3D&quot;Software\$(var.QEMU_GA_MANUFACTURER)\$(env.QEM=
U_GA_DISTRO)\Tools\QemuGA&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryValue Ty=
pe=3D&quot;string&quot; Name=3D&quot;ProductID&quot; Value=3D&quot;fb0a0d66=
-c7fb-4e2e-a16b-c4a3bfe8d13b&quot; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryValue Ty=
pe=3D&quot;string&quot; Name=3D&quot;Version&quot; Value=3D&quot;$(env.QEMU=
_GA_VERSION)&quot; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/RegistryKey&gt;<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index da5e5efb19e8..6e57de430d29 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -123,7 +123,6 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0find_program(&#39;env&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;QEMU_GA_VERSION=3D&#39; + config=
_host[&#39;QEMU_GA_VERSION&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;QEMU_GA_MANUFACTURER=3D&#39; + config_=
host[&#39;QEMU_GA_MANUFACTURER&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;QEMU_GA_DISTRO=3D&#39; + config_=
host[&#39;QEMU_GA_DISTRO&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;BUILD_DIR=3D&#39; + meson.build_=
root(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wixl, &#39;-o&#39;, &#39;@OUTPUT0@&#3=
9;, &#39;@INPUT0@&#39;,<br>
-- <br>
2.35.1.693.g805e0a68082a<br>
<br>
</blockquote></div>

--000000000000b3911a05dd164132--


