Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DF351BBA7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:14:06 +0200 (CEST)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXYj-0005AJ-5J
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWo6-0002an-8X
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:25:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:41114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWo3-0001X0-Ot
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kd/9z55GN9SxgvATcD9ygwJV0M9E2WT2z6q/BW1h6BQ=;
 b=YkGr4dzEN6tUmI0844xQslM938u8UGQeQqScGdJXfepoASWF1tlxSTqRBpUXNxIOdombFV
 x8wWntzVuBxisV4ocfvdWCxOflXyZWCvprbTO2piggH8iO3lRnZq7AIXnfVjOyEOiNfnqN
 c2M9olpBhBL0/FawJaQR+9ou0Ks7tBE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-tahSf8u1NeGKtpZlIl57jQ-1; Thu, 05 May 2022 04:25:46 -0400
X-MC-Unique: tahSf8u1NeGKtpZlIl57jQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 h14-20020a25e20e000000b006484e4a1da2so3114595ybe.9
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kd/9z55GN9SxgvATcD9ygwJV0M9E2WT2z6q/BW1h6BQ=;
 b=ZAL6QCYL+OUg/Y5kY0fAa9cVjpFnEH7n2YonBNJVRd0WsspU1lwMydbI1vaBi8lqs0
 U8QRDpONgY2MDUtibowuUoBEQoFz4E8QTo5zpI/wtMEaVp4kuNgo9i9vLZmvATwWYP6R
 mS1p1RqyaW75jgtF5oZlKyBjQjxgnINdwmDGN84M1i7+6HIa/hJXFreMVoqYhSPlrTce
 urXV93+idbbhjsPe2eQiYcoU9CceEAmc8Y8VXKwx3DTkmHHs5Ql/IKxPC5uw7tABFc9Z
 S9eaV4iowIaTJo2w07JgNZcaJl6mjykS/nIXjvbZXTE7CKe/YckeN8Nu+DkXSOhL9U4D
 yX+w==
X-Gm-Message-State: AOAM530i3O3NOd0tvgimufguDZZ0PCvPht6Ihij06gKZnDkAiUKuIgxC
 bM9HOTy5PzeliBRZVC16FsoomMI9Siu5NCDWYCHSC9mDtSxQWngXYX4cuuN3e1ZWi3ZtDD86cLm
 jeqtk+yd3g0E1kTFLmus52Y86AOzZCrA=
X-Received: by 2002:a05:690c:113:b0:2ef:260b:3801 with SMTP id
 bd19-20020a05690c011300b002ef260b3801mr25821739ywb.49.1651739145780; 
 Thu, 05 May 2022 01:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMcRccxSyWO+z+3+KpbQwu6HQFVvhd1nCMppAlCTJ0BUGFLR8iopQPAYG+KWHcA5Xv4BKCDC3uIYN1eeQdY9E=
X-Received: by 2002:a05:690c:113:b0:2ef:260b:3801 with SMTP id
 bd19-20020a05690c011300b002ef260b3801mr25821724ywb.49.1651739145571; Thu, 05
 May 2022 01:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-12-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 5 May 2022 11:25:34 +0300
Message-ID: <CAPMcbCqnAr96cU_X21Nh_g_8uXtcCgxvB4bB-ooANMuqeB-SOQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] qga/wixl: prefer variables over environment
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000089d4505de3f7d05"
Received-SPF: pass client-ip=170.10.129.74; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000089d4505de3f7d05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, May 5, 2022 at 11:16 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> No need to setup an environment or to check if the variable is undefined
> manually.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/installer/qemu-ga.wxs | 30 +++++++++---------------------
>  qga/meson.build           |  9 ++++-----
>  2 files changed, 13 insertions(+), 26 deletions(-)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 0950e8c6becc..8a19aa165651 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -1,17 +1,5 @@
>  <?xml version=3D"1.0" encoding=3D"UTF-8"?>
>  <Wix xmlns=3D"http://schemas.microsoft.com/wix/2006/wi">
> -  <?ifndef env.QEMU_GA_VERSION ?>
> -    <?error Environment variable QEMU_GA_VERSION undefined?>
> -  <?endif?>
> -
> -  <?ifndef env.QEMU_GA_DISTRO ?>
> -    <?error Environment variable QEMU_GA_DISTRO undefined?>
> -  <?endif?>
> -
> -  <?ifndef env.QEMU_GA_MANUFACTURER ?>
> -    <?error Environment variable QEMU_GA_MANUFACTURER undefined?>
> -  <?endif?>
> -
>    <?ifndef var.Arch?>
>      <?error Define Arch to 32 or 64?>
>    <?endif?>
> @@ -43,20 +31,20 @@
>      Name=3D"QEMU guest agent"
>      Id=3D"*"
>      UpgradeCode=3D"{EB6B8302-C06E-4BEC-ADAC-932C68A3A98D}"
> -    Manufacturer=3D"$(env.QEMU_GA_MANUFACTURER)"
> -    Version=3D"$(env.QEMU_GA_VERSION)"
> +    Manufacturer=3D"$(var.QEMU_GA_MANUFACTURER)"
> +    Version=3D"$(var.QEMU_GA_VERSION)"
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
>        InstallScope=3D"perMachine"
>        />
> -    <Media Id=3D"1" Cabinet=3D"qemu_ga.$(env.QEMU_GA_VERSION).cab"
> EmbedCab=3D"yes" />
> +    <Media Id=3D"1" Cabinet=3D"qemu_ga.$(var.QEMU_GA_VERSION).cab"
> EmbedCab=3D"yes" />
>      <Property Id=3D"WHSLogo">1</Property>
>      <MajorUpgrade
>        DowngradeErrorMessage=3D"Error: A newer version of QEMU guest agen=
t
> is already installed."
> @@ -66,7 +54,7 @@
>        <Directory Id=3D"$(var.GaProgramFilesFolder)" Name=3D"QEMU Guest A=
gent">
>          <Directory Id=3D"qemu_ga_directory" Name=3D"Qemu-ga">
>            <Component Id=3D"qemu_ga"
> Guid=3D"{908B7199-DE2A-4DC6-A8D0-27A5AE444FEA}">
> -            <File Id=3D"qemu_ga.exe" Name=3D"qemu-ga.exe"
> Source=3D"$(env.BUILD_DIR)/qga/qemu-ga.exe" KeyPath=3D"yes" DiskId=3D"1"/=
>
> +            <File Id=3D"qemu_ga.exe" Name=3D"qemu-ga.exe"
> Source=3D"$(var.BUILD_DIR)/qga/qemu-ga.exe" KeyPath=3D"yes" DiskId=3D"1"/=
>
>              <ServiceInstall
>                Id=3D"ServiceInstaller"
>                Type=3D"ownProcess"
> @@ -88,10 +76,10 @@
>              <File Id=3D"libstdc++-6.lib" Name=3D"libstdc++-6.dll"
> Source=3D"$(var.Mingw_bin)/libstdc++-6.dll" KeyPath=3D"yes" DiskId=3D"1"/=
>
>            </Component>
>            <Component Id=3D"qga_vss_dll"
> Guid=3D"{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
> -            <File Id=3D"qga_vss.dll" Name=3D"qga-vss.dll"
> Source=3D"$(env.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath=3D"yes"
> DiskId=3D"1"/>
> +            <File Id=3D"qga_vss.dll" Name=3D"qga-vss.dll"
> Source=3D"$(var.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath=3D"yes"
> DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"qga_vss_tlb"
> Guid=3D"{D8D584B1-59C2-4FB7-A91F-636FF7BFA66E}">
> -            <File Id=3D"qga_vss.tlb" Name=3D"qga-vss.tlb"
> Source=3D"$(env.BUILD_DIR)/qga/vss-win32/qga-vss.tlb" KeyPath=3D"yes"
> DiskId=3D"1"/>
> +            <File Id=3D"qga_vss.tlb" Name=3D"qga-vss.tlb"
> Source=3D"$(var.BUILD_DIR)/qga/vss-win32/qga-vss.tlb" KeyPath=3D"yes"
> DiskId=3D"1"/>
>            </Component>
>            <?endif?>
>            <?if $(var.Arch) =3D "32"?>
> @@ -133,9 +121,9 @@
>            </Component>
>            <Component Id=3D"registry_entries"
> Guid=3D"{D075D109-51CA-11E3-9F8B-000C29858960}">
>              <RegistryKey Root=3D"HKLM"
> -
>  Key=3D"Software\$(env.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\=
QemuGA">
> +
>  Key=3D"Software\$(var.QEMU_GA_MANUFACTURER)\$(var.QEMU_GA_DISTRO)\Tools\=
QemuGA">
>                <RegistryValue Type=3D"string" Name=3D"ProductID"
> Value=3D"fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
> -              <RegistryValue Type=3D"string" Name=3D"Version"
> Value=3D"$(env.QEMU_GA_VERSION)" />
> +              <RegistryValue Type=3D"string" Name=3D"Version"
> Value=3D"$(var.QEMU_GA_VERSION)" />
>              </RegistryKey>
>            </Component>
>          </Directory>
> diff --git a/qga/meson.build b/qga/meson.build
> index 6d9f39bb321b..3ad3bc0260cf 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -121,15 +121,14 @@ if targetos =3D=3D 'windows'
>                              output: 'qemu-ga-@0@.msi'.format(host_arch),
>                              depends: deps,
>                              command: [
> -                              find_program('env'),
> -                              'QEMU_GA_VERSION=3D' +
> config_host['QEMU_GA_VERSION'],
> -                              'QEMU_GA_MANUFACTURER=3D' +
> config_host['QEMU_GA_MANUFACTURER'],
> -                              'QEMU_GA_DISTRO=3D' +
> config_host['QEMU_GA_DISTRO'],
> -                              'BUILD_DIR=3D' + meson.build_root(),
>                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>                                qemu_ga_msi_arch[cpu],
>                                qemu_ga_msi_vss,
> +                              '-D', 'BUILD_DIR=3D' + meson.build_root(),
>                                '-D', 'Mingw_bin=3D' +
> config_host['QEMU_GA_MSI_MINGW_BIN_PATH'],
> +                              '-D', 'QEMU_GA_VERSION=3D' +
> config_host['QEMU_GA_VERSION'],
> +                              '-D', 'QEMU_GA_MANUFACTURER=3D' +
> config_host['QEMU_GA_MANUFACTURER'],
> +                              '-D', 'QEMU_GA_DISTRO=3D' +
> config_host['QEMU_GA_DISTRO'],
>                              ])
>      all_qga +=3D [qga_msi]
>      alias_target('msi', qga_msi)
> --
> 2.36.0.44.g0f828332d5ac
>
>

--000000000000089d4505de3f7d05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5=
, 2022 at 11:16 AM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
>&gt;<br>
<br>
No need to setup an environment or to check if the variable is undefined<br=
>
manually.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/installer/qemu-ga.wxs | 30 +++++++++---------------------<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++=
+-----<br>
=C2=A02 files changed, 13 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index 0950e8c6becc..8a19aa165651 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -1,17 +1,5 @@<br>
=C2=A0&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<=
br>
=C2=A0&lt;Wix xmlns=3D&quot;<a href=3D"http://schemas.microsoft.com/wix/200=
6/wi" rel=3D"noreferrer" target=3D"_blank">http://schemas.microsoft.com/wix=
/2006/wi</a>&quot;&gt;<br>
-=C2=A0 &lt;?ifndef env.QEMU_GA_VERSION ?&gt;<br>
-=C2=A0 =C2=A0 &lt;?error Environment variable QEMU_GA_VERSION undefined?&g=
t;<br>
-=C2=A0 &lt;?endif?&gt;<br>
-<br>
-=C2=A0 &lt;?ifndef env.QEMU_GA_DISTRO ?&gt;<br>
-=C2=A0 =C2=A0 &lt;?error Environment variable QEMU_GA_DISTRO undefined?&gt=
;<br>
-=C2=A0 &lt;?endif?&gt;<br>
-<br>
-=C2=A0 &lt;?ifndef env.QEMU_GA_MANUFACTURER ?&gt;<br>
-=C2=A0 =C2=A0 &lt;?error Environment variable QEMU_GA_MANUFACTURER undefin=
ed?&gt;<br>
-=C2=A0 &lt;?endif?&gt;<br>
-<br>
=C2=A0 =C2=A0&lt;?ifndef var.Arch?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?error Define Arch to 32 or 64?&gt;<br>
=C2=A0 =C2=A0&lt;?endif?&gt;<br>
@@ -43,20 +31,20 @@<br>
=C2=A0 =C2=A0 =C2=A0Name=3D&quot;QEMU guest agent&quot;<br>
=C2=A0 =C2=A0 =C2=A0Id=3D&quot;*&quot;<br>
=C2=A0 =C2=A0 =C2=A0UpgradeCode=3D&quot;{EB6B8302-C06E-4BEC-ADAC-932C68A3A9=
8D}&quot;<br>
-=C2=A0 =C2=A0 Manufacturer=3D&quot;$(env.QEMU_GA_MANUFACTURER)&quot;<br>
-=C2=A0 =C2=A0 Version=3D&quot;$(env.QEMU_GA_VERSION)&quot;<br>
+=C2=A0 =C2=A0 Manufacturer=3D&quot;$(var.QEMU_GA_MANUFACTURER)&quot;<br>
+=C2=A0 =C2=A0 Version=3D&quot;$(var.QEMU_GA_VERSION)&quot;<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0InstallScope=3D&quot;perMachine&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0/&gt;<br>
-=C2=A0 =C2=A0 &lt;Media Id=3D&quot;1&quot; Cabinet=3D&quot;qemu_ga.$(env.Q=
EMU_GA_VERSION).cab&quot; EmbedCab=3D&quot;yes&quot; /&gt;<br>
+=C2=A0 =C2=A0 &lt;Media Id=3D&quot;1&quot; Cabinet=3D&quot;qemu_ga.$(var.Q=
EMU_GA_VERSION).cab&quot; EmbedCab=3D&quot;yes&quot; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;Property Id=3D&quot;WHSLogo&quot;&gt;1&lt;/Property=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;MajorUpgrade<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DowngradeErrorMessage=3D&quot;Error: A newer ver=
sion of QEMU guest agent is already installed.&quot;<br>
@@ -66,7 +54,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Directory Id=3D&quot;$(var.GaProgramFilesFol=
der)&quot; Name=3D&quot;QEMU Guest Agent&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Directory Id=3D&quot;qemu_ga_director=
y&quot; Name=3D&quot;Qemu-ga&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;qemu_ga&q=
uot; Guid=3D&quot;{908B7199-DE2A-4DC6-A8D0-27A5AE444FEA}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;qemu_ga.exe&=
quot; Name=3D&quot;qemu-ga.exe&quot; Source=3D&quot;$(env.BUILD_DIR)/qga/qe=
mu-ga.exe&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;qemu_ga.exe&=
quot; Name=3D&quot;qemu-ga.exe&quot; Source=3D&quot;$(var.BUILD_DIR)/qga/qe=
mu-ga.exe&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;ServiceInstall<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Id=3D&quot;ServiceIn=
staller&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Type=3D&quot;ownProc=
ess&quot;<br>
@@ -88,10 +76,10 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;File Id=3D&quot;libstdc=
++-6.lib&quot; Name=3D&quot;libstdc++-6.dll&quot; Source=3D&quot;$(var.Ming=
w_bin)/libstdc++-6.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quo=
t;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;qga_vss_d=
ll&quot; Guid=3D&quot;{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;qga_vss.dll&=
quot; Name=3D&quot;qga-vss.dll&quot; Source=3D&quot;$(env.BUILD_DIR)/qga/vs=
s-win32/qga-vss.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/=
&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;qga_vss.dll&=
quot; Name=3D&quot;qga-vss.dll&quot; Source=3D&quot;$(var.BUILD_DIR)/qga/vs=
s-win32/qga-vss.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;qga_vss_t=
lb&quot; Guid=3D&quot;{D8D584B1-59C2-4FB7-A91F-636FF7BFA66E}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;qga_vss.tlb&=
quot; Name=3D&quot;qga-vss.tlb&quot; Source=3D&quot;$(env.BUILD_DIR)/qga/vs=
s-win32/qga-vss.tlb&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/=
&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;qga_vss.tlb&=
quot; Name=3D&quot;qga-vss.tlb&quot; Source=3D&quot;$(var.BUILD_DIR)/qga/vs=
s-win32/qga-vss.tlb&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?endif?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?if $(var.Arch) =3D &quot;32&q=
uot;?&gt;<br>
@@ -133,9 +121,9 @@<br>
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
=A0 =C2=A0 =C2=A0Key=3D&quot;Software\$(var.QEMU_GA_MANUFACTURER)\$(var.QEM=
U_GA_DISTRO)\Tools\QemuGA&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryValue Ty=
pe=3D&quot;string&quot; Name=3D&quot;ProductID&quot; Value=3D&quot;fb0a0d66=
-c7fb-4e2e-a16b-c4a3bfe8d13b&quot; /&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;RegistryValue Type=3D=
&quot;string&quot; Name=3D&quot;Version&quot; Value=3D&quot;$(env.QEMU_GA_V=
ERSION)&quot; /&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;RegistryValue Type=3D=
&quot;string&quot; Name=3D&quot;Version&quot; Value=3D&quot;$(var.QEMU_GA_V=
ERSION)&quot; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/RegistryKey&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Directory&gt;<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 6d9f39bb321b..3ad3bc0260cf 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -121,15 +121,14 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;qemu-ga-@0@.msi&#39;.format(hos=
t_arch),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends: deps,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find_program(&#39;env&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;QEMU_GA_VERSION=3D&#39; + config_host[=
&#39;QEMU_GA_VERSION&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;QEMU_GA_MANUFACTURER=3D&#39; + config_=
host[&#39;QEMU_GA_MANUFACTURER&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;QEMU_GA_DISTRO=3D&#39; + config_host[&=
#39;QEMU_GA_DISTRO&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;BUILD_DIR=3D&#39; + meson.build_root()=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wixl, &#39;-o&#39;, &#39;@OUTPUT0@&#3=
9;, &#39;@INPUT0@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_arch[cpu],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_vss,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;BUILD_DIR=3D&#39; + meso=
n.build_root(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;Mingw_bin=3D&#39; =
+ config_host[&#39;QEMU_GA_MSI_MINGW_BIN_PATH&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;QEMU_GA_VERSION=3D&#39; =
+ config_host[&#39;QEMU_GA_VERSION&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;QEMU_GA_MANUFACTURER=3D&=
#39; + config_host[&#39;QEMU_GA_MANUFACTURER&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;QEMU_GA_DISTRO=3D&#39; +=
 config_host[&#39;QEMU_GA_DISTRO&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
=C2=A0 =C2=A0 =C2=A0all_qga +=3D [qga_msi]<br>
=C2=A0 =C2=A0 =C2=A0alias_target(&#39;msi&#39;, qga_msi)<br>
-- <br>
2.36.0.44.g0f828332d5ac<br>
<br>
</blockquote></div>

--000000000000089d4505de3f7d05--


