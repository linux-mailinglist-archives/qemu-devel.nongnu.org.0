Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E5651BC31
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:31:59 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXq2-0003WC-D4
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWqs-00054K-Pz
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:28:46 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:21565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWqq-00024m-6p
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qv+vEHqii89GWRHW+nWCXUra0xRQxmsF0lAsBG+aZfw=;
 b=hNIBkALNmGcpY9gibdorcP5rDMlpCxmVnmblUaqg1ekG+IA8c4ACuZXExRjb0dF0osoSxm
 q59W3pSFDI/svFMOPz0AaCiDzLLEKGABh7Mp/nV7sFMQygpIVlVSd29t2Wnk5sWHsslSBV
 qqPgaaqyBo725RedXfyt8e8IJZVirTA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-Fu-eWMAeOh6Hn3g3PikXtw-1; Thu, 05 May 2022 04:28:42 -0400
X-MC-Unique: Fu-eWMAeOh6Hn3g3PikXtw-1
Received: by mail-yb1-f199.google.com with SMTP id
 b6-20020a253406000000b006484c081280so3118553yba.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qv+vEHqii89GWRHW+nWCXUra0xRQxmsF0lAsBG+aZfw=;
 b=A0toE01sTxly66gQ33NlZZH6zlCAwygbIwKTSFOub1iBgah8+MzJrqLzK5E17atCjZ
 X8+FYV35GlWT5gA2LhlJ48xKi8ATlOwOoSunR2U/OKoLXKV1najx6/qUJ9D+RgmYSQ/c
 nrGeD8mtK0KsAyC7IdZ+Pw6alU47XBsJ54tf342fxlJtcvfLmbtGXOhQanJMpDUH4fQ4
 YLr4MKDhmjzv2TkqdDoxhUQr5kBHBhvKAjW2cFcyJ9WOMOqJU3o6sx54+wjfQcIUhf3E
 RjCWOhomTQdNsGWyLIxuu4NMLJBzZXB39EdKIboyw/5lUGIrtLfu7EsZx0PaHE0eJKN+
 hDYQ==
X-Gm-Message-State: AOAM5300PTIKnkCGLVy7cbWfAfYg2y5xhkjDru3pHi/2T4qsMR3iyJyF
 7HrczrqLAw0kRfxdMidAxNf5PznpXpjeGKykG+NO+SL9BYrLjx6BALe10X4fd6oR3rHJO2N8gZX
 QmHootgmh13+F8BPvTEnb/G6g5dj+BSI=
X-Received: by 2002:a81:9387:0:b0:2f7:eb1b:d25e with SMTP id
 k129-20020a819387000000b002f7eb1bd25emr14926185ywg.402.1651739321810; 
 Thu, 05 May 2022 01:28:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+5R4XQTMEBMqdBoKUoU/6N/8xBmQ7XAxEgtHwd6KvUCXW7ChIejnpJ0jwMmR98eIxxscZStP2wwW9Bpe0bWQ=
X-Received: by 2002:a81:9387:0:b0:2f7:eb1b:d25e with SMTP id
 k129-20020a819387000000b002f7eb1bd25emr14926171ywg.402.1651739321623; Thu, 05
 May 2022 01:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-15-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 5 May 2022 11:28:30 +0300
Message-ID: <CAPMcbCrVc49uDkEhTMyf1Qyn1oHUQzrBXzRQBRTH8Bk+718Tnw@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH
 with glib bindir
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
Content-Type: multipart/alternative; boundary="00000000000086f88605de3f87e2"
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

--00000000000086f88605de3f87e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, May 5, 2022 at 11:16 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Use more conventional variables to set the location of pre-built
> DLL/bin.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure                 |  9 ++++++---
>  meson.build               |  5 ++++-
>  qga/installer/qemu-ga.wxs | 24 ++++++++++++------------
>  qga/meson.build           |  2 +-
>  4 files changed, 23 insertions(+), 17 deletions(-)
>
> diff --git a/configure b/configure
> index 59c43bea05eb..616cd2d0e36c 100755
> --- a/configure
> +++ b/configure
> @@ -2023,6 +2023,11 @@ for i in $glib_modules; do
>      fi
>  done
>
> +glib_bindir=3D"$($pkg_config --variable=3Dbindir glib-2.0)"
> +if test -z "$glib_bindir" ; then
> +       glib_bindir=3D"$($pkg_config --variable=3Dprefix glib-2.0)"/bin
> +fi
> +
>  # This workaround is required due to a bug in pkg-config file for glib a=
s
> it
>  # doesn't define GLIB_STATIC_COMPILATION for pkg-config --static
>
> @@ -2430,8 +2435,6 @@ if test "$QEMU_GA_VERSION" =3D ""; then
>      QEMU_GA_VERSION=3D$(cat $source_path/VERSION)
>  fi
>
> -QEMU_GA_MSI_MINGW_BIN_PATH=3D"$($pkg_config --variable=3Dprefix glib-2.0=
)/bin"
> -
>  # Mac OS X ships with a broken assembler
>  roms=3D
>  if { test "$cpu" =3D "i386" || test "$cpu" =3D "x86_64"; } && \
> @@ -2518,7 +2521,6 @@ if test "$debug_tcg" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  echo "QEMU_GA_MSI_MINGW_BIN_PATH=3D${QEMU_GA_MSI_MINGW_BIN_PATH}" >>
> $config_host_mak
>    echo "QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}" >> $config_host_=
mak
>    echo "QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}" >> $config_host_mak
>    echo "QEMU_GA_VERSION=3D${QEMU_GA_VERSION}" >> $config_host_mak
> @@ -2639,6 +2641,7 @@ echo "QEMU_CXXFLAGS=3D$QEMU_CXXFLAGS" >>
> $config_host_mak
>  echo "QEMU_OBJCFLAGS=3D$QEMU_OBJCFLAGS" >> $config_host_mak
>  echo "GLIB_CFLAGS=3D$glib_cflags" >> $config_host_mak
>  echo "GLIB_LIBS=3D$glib_libs" >> $config_host_mak
> +echo "GLIB_BINDIR=3D$glib_bindir" >> $config_host_mak
>  echo "GLIB_VERSION=3D$(pkg-config --modversion glib-2.0)" >>
> $config_host_mak
>  echo "QEMU_LDFLAGS=3D$QEMU_LDFLAGS" >> $config_host_mak
>  echo "LD_I386_EMULATION=3D$ld_i386_emulation" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index c26aa442d40e..2f68b6cb8634 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -443,7 +443,10 @@
> add_project_arguments(config_host['GLIB_CFLAGS'].split(),
>                        native: false, language: ['c', 'cpp', 'objc'])
>  glib =3D declare_dependency(compile_args:
> config_host['GLIB_CFLAGS'].split(),
>                            link_args: config_host['GLIB_LIBS'].split(),
> -                          version: config_host['GLIB_VERSION'])
> +                          version: config_host['GLIB_VERSION'],
> +                          variables: {
> +                            'bindir': config_host['GLIB_BINDIR'],
> +                          })
>  # override glib dep with the configure results (for subprojects)
>  meson.override_dependency('glib-2.0', glib)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index e5b0958e1898..813d1c6ca6ae 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -58,7 +58,7 @@
>            </Component>
>            <?ifdef var.InstallVss?>
>            <Component Id=3D"libstdc++_6_lib"
> Guid=3D"{55E737B5-9127-4A11-9FC3-A29367714574}">
> -            <File Id=3D"libstdc++-6.lib" Name=3D"libstdc++-6.dll"
> Source=3D"$(var.Mingw_bin)/libstdc++-6.dll" KeyPath=3D"yes" DiskId=3D"1"/=
>
> +            <File Id=3D"libstdc++-6.lib" Name=3D"libstdc++-6.dll"
> Source=3D"$(var.BIN_DIR)/libstdc++-6.dll" KeyPath=3D"yes" DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"qga_vss_dll"
> Guid=3D"{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
>              <File Id=3D"qga_vss.dll" Name=3D"qga-vss.dll"
> Source=3D"$(var.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath=3D"yes"
> DiskId=3D"1"/>
> @@ -69,40 +69,40 @@
>            <?endif?>
>            <?if $(var.Arch) =3D "32"?>
>            <Component Id=3D"gspawn-helper-console"
> Guid=3D"{446185B3-87BE-43D2-96B8-0FEFD9E8696D}">
> -            <File Id=3D"gspawn-win32-helper-console.exe"
> Name=3D"gspawn-win32-helper-console.exe"
> Source=3D"$(var.Mingw_bin)/gspawn-win32-helper-console.exe" KeyPath=3D"ye=
s"
> DiskId=3D"1"/>
> +            <File Id=3D"gspawn-win32-helper-console.exe"
> Name=3D"gspawn-win32-helper-console.exe"
> Source=3D"$(var.BIN_DIR)/gspawn-win32-helper-console.exe" KeyPath=3D"yes"
> DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"gspawn-helper"
> Guid=3D"{CD67A5A3-2DB1-4DA1-A67A-8D71E797B466}">
> -            <File Id=3D"gspawn-win32-helper.exe"
> Name=3D"gspawn-win32-helper.exe"
> Source=3D"$(var.Mingw_bin)/gspawn-win32-helper-console.exe" KeyPath=3D"ye=
s"
> DiskId=3D"1"/>
> +            <File Id=3D"gspawn-win32-helper.exe"
> Name=3D"gspawn-win32-helper.exe"
> Source=3D"$(var.BIN_DIR)/gspawn-win32-helper-console.exe" KeyPath=3D"yes"
> DiskId=3D"1"/>
>            </Component>
>            <?endif?>
>            <?if $(var.Arch) =3D "64"?>
>            <Component Id=3D"gspawn-helper-console"
> Guid=3D"{9E615A9F-349A-4992-A5C2-C10BAD173660}">
> -            <File Id=3D"gspawn-win64-helper-console.exe"
> Name=3D"gspawn-win64-helper-console.exe"
> Source=3D"$(var.Mingw_bin)/gspawn-win64-helper-console.exe" KeyPath=3D"ye=
s"
> DiskId=3D"1"/>
> +            <File Id=3D"gspawn-win64-helper-console.exe"
> Name=3D"gspawn-win64-helper-console.exe"
> Source=3D"$(var.BIN_DIR)/gspawn-win64-helper-console.exe" KeyPath=3D"yes"
> DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"gspawn-helper"
> Guid=3D"{D201AD22-1846-4E4F-B6E1-C7A908ED2457}">
> -            <File Id=3D"gspawn-win64-helper.exe"
> Name=3D"gspawn-win64-helper.exe"
> Source=3D"$(var.Mingw_bin)/gspawn-win64-helper-console.exe" KeyPath=3D"ye=
s"
> DiskId=3D"1"/>
> +            <File Id=3D"gspawn-win64-helper.exe"
> Name=3D"gspawn-win64-helper.exe"
> Source=3D"$(var.BIN_DIR)/gspawn-win64-helper-console.exe" KeyPath=3D"yes"
> DiskId=3D"1"/>
>            </Component>
>            <?endif?>
>            <Component Id=3D"iconv"
> Guid=3D"{35EE3558-D34B-4F0A-B8BD-430FF0775246}">
> -            <File Id=3D"iconv.dll" Name=3D"iconv.dll"
> Source=3D"$(var.Mingw_bin)/iconv.dll" KeyPath=3D"yes" DiskId=3D"1"/>
> +            <File Id=3D"iconv.dll" Name=3D"iconv.dll"
> Source=3D"$(var.BIN_DIR)/iconv.dll" KeyPath=3D"yes" DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"libgcc_arch_lib"
> Guid=3D"{ADD4D07D-4515-4AB6-AF3E-C904961B4BB0}">
> -            <File Id=3D"libgcc_arch_lib" Name=3D"$(var.ArchLib)"
> Source=3D"$(var.Mingw_bin)/$(var.ArchLib)" KeyPath=3D"yes" DiskId=3D"1"/>
> +            <File Id=3D"libgcc_arch_lib" Name=3D"$(var.ArchLib)"
> Source=3D"$(var.BIN_DIR)/$(var.ArchLib)" KeyPath=3D"yes" DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"libglib"
> Guid=3D"{D31BFD83-2773-4B65-B45A-E0D2ADA58679}">
> -            <File Id=3D"libglib_2.0_0.dll" Name=3D"libglib-2.0-0.dll"
> Source=3D"$(var.Mingw_bin)/libglib-2.0-0.dll" KeyPath=3D"yes" DiskId=3D"1=
"/>
> +            <File Id=3D"libglib_2.0_0.dll" Name=3D"libglib-2.0-0.dll"
> Source=3D"$(var.BIN_DIR)/libglib-2.0-0.dll" KeyPath=3D"yes" DiskId=3D"1"/=
>
>            </Component>
>            <Component Id=3D"libintl"
> Guid=3D"{A641BC2D-A907-4A94-9149-F30ED430878F}">
> -            <File Id=3D"libintl_8.dll" Name=3D"libintl-8.dll"
> Source=3D"$(var.Mingw_bin)/libintl-8.dll" KeyPath=3D"yes" DiskId=3D"1"/>
> +            <File Id=3D"libintl_8.dll" Name=3D"libintl-8.dll"
> Source=3D"$(var.BIN_DIR)/libintl-8.dll" KeyPath=3D"yes" DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"libssp"
> Guid=3D"{7880087B-02B4-4EF6-A5D3-D18F8E3D90E1}">
> -            <File Id=3D"libssp_0.dll" Name=3D"libssp-0.dll"
> Source=3D"$(var.Mingw_bin)/libssp-0.dll" KeyPath=3D"yes" DiskId=3D"1"/>
> +            <File Id=3D"libssp_0.dll" Name=3D"libssp-0.dll"
> Source=3D"$(var.BIN_DIR)/libssp-0.dll" KeyPath=3D"yes" DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"libwinpthread"
> Guid=3D"{6C117C78-0F47-4B07-8F34-6BEE11643829}">
> -            <File Id=3D"libwinpthread_1.dll" Name=3D"libwinpthread-1.dll=
"
> Source=3D"$(var.Mingw_bin)/libwinpthread-1.dll" KeyPath=3D"yes" DiskId=3D=
"1"/>
> +            <File Id=3D"libwinpthread_1.dll" Name=3D"libwinpthread-1.dll=
"
> Source=3D"$(var.BIN_DIR)/libwinpthread-1.dll" KeyPath=3D"yes" DiskId=3D"1=
"/>
>            </Component>
>            <Component Id=3D"libpcre"
> Guid=3D"{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
> -            <File Id=3D"libpcre_1.dll" Name=3D"libpcre-1.dll"
> Source=3D"$(var.Mingw_bin)/libpcre-1.dll" KeyPath=3D"yes" DiskId=3D"1"/>
> +            <File Id=3D"libpcre_1.dll" Name=3D"libpcre-1.dll"
> Source=3D"$(var.BIN_DIR)/libpcre-1.dll" KeyPath=3D"yes" DiskId=3D"1"/>
>            </Component>
>            <Component Id=3D"registry_entries"
> Guid=3D"{D075D109-51CA-11E3-9F8B-000C29858960}">
>              <RegistryKey Root=3D"HKLM"
> diff --git a/qga/meson.build b/qga/meson.build
> index 3ad3bc0260cf..51b1e611b194 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -125,7 +125,7 @@ if targetos =3D=3D 'windows'
>                                qemu_ga_msi_arch[cpu],
>                                qemu_ga_msi_vss,
>                                '-D', 'BUILD_DIR=3D' + meson.build_root(),
> -                              '-D', 'Mingw_bin=3D' +
> config_host['QEMU_GA_MSI_MINGW_BIN_PATH'],
> +                              '-D', 'BIN_DIR=3D' +
> glib.get_variable('bindir'),
>                                '-D', 'QEMU_GA_VERSION=3D' +
> config_host['QEMU_GA_VERSION'],
>                                '-D', 'QEMU_GA_MANUFACTURER=3D' +
> config_host['QEMU_GA_MANUFACTURER'],
>                                '-D', 'QEMU_GA_DISTRO=3D' +
> config_host['QEMU_GA_DISTRO'],
> --
> 2.36.0.44.g0f828332d5ac
>
>

--00000000000086f88605de3f87e2
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
Use more conventional variables to set the location of pre-built<br>
DLL/bin.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 ++++++---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 5 ++++-<br>
=C2=A0qga/installer/qemu-ga.wxs | 24 ++++++++++++------------<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A04 files changed, 23 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 59c43bea05eb..616cd2d0e36c 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2023,6 +2023,11 @@ for i in $glib_modules; do<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0done<br>
<br>
+glib_bindir=3D&quot;$($pkg_config --variable=3Dbindir glib-2.0)&quot;<br>
+if test -z &quot;$glib_bindir&quot; ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0glib_bindir=3D&quot;$($pkg_config --variable=3D=
prefix glib-2.0)&quot;/bin<br>
+fi<br>
+<br>
=C2=A0# This workaround is required due to a bug in pkg-config file for gli=
b as it<br>
=C2=A0# doesn&#39;t define GLIB_STATIC_COMPILATION for pkg-config --static<=
br>
<br>
@@ -2430,8 +2435,6 @@ if test &quot;$QEMU_GA_VERSION&quot; =3D &quot;&quot;=
; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU_GA_VERSION=3D$(cat $source_path/VERSION)<br>
=C2=A0fi<br>
<br>
-QEMU_GA_MSI_MINGW_BIN_PATH=3D&quot;$($pkg_config --variable=3Dprefix glib-=
2.0)/bin&quot;<br>
-<br>
=C2=A0# Mac OS X ships with a broken assembler<br>
=C2=A0roms=3D<br>
=C2=A0if { test &quot;$cpu&quot; =3D &quot;i386&quot; || test &quot;$cpu&qu=
ot; =3D &quot;x86_64&quot;; } &amp;&amp; \<br>
@@ -2518,7 +2521,6 @@ if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; =
then<br>
=C2=A0fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 echo &quot;QEMU_GA_MSI_MINGW_BIN_PATH=3D${QEMU_GA_MSI_MINGW_BIN_PAT=
H}&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}&quot=
; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}&quot; &gt;&gt; $=
config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_VERSION=3D${QEMU_GA_VERSION}&quot; &gt;&gt;=
 $config_host_mak<br>
@@ -2639,6 +2641,7 @@ echo &quot;QEMU_CXXFLAGS=3D$QEMU_CXXFLAGS&quot; &gt;&=
gt; $config_host_mak<br>
=C2=A0echo &quot;QEMU_OBJCFLAGS=3D$QEMU_OBJCFLAGS&quot; &gt;&gt; $config_ho=
st_mak<br>
=C2=A0echo &quot;GLIB_CFLAGS=3D$glib_cflags&quot; &gt;&gt; $config_host_mak=
<br>
=C2=A0echo &quot;GLIB_LIBS=3D$glib_libs&quot; &gt;&gt; $config_host_mak<br>
+echo &quot;GLIB_BINDIR=3D$glib_bindir&quot; &gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;GLIB_VERSION=3D$(pkg-config --modversion glib-2.0)&quot; &=
gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;QEMU_LDFLAGS=3D$QEMU_LDFLAGS&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0echo &quot;LD_I386_EMULATION=3D$ld_i386_emulation&quot; &gt;&gt; $con=
fig_host_mak<br>
diff --git a/meson.build b/meson.build<br>
index c26aa442d40e..2f68b6cb8634 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -443,7 +443,10 @@ add_project_arguments(config_host[&#39;GLIB_CFLAGS&#39=
;].split(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0native: false, language: [&#39;c&#39;, &#39;cpp&#39;, &#39;objc&#=
39;])<br>
=C2=A0glib =3D declare_dependency(compile_args: config_host[&#39;GLIB_CFLAG=
S&#39;].split(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;GLIB_LIBS&#39;].split()=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 version: config_host[&#39;GLIB_VERSION&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 version: config_host[&#39;GLIB_VERSION&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 variables: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bindir&#39;: config_host[&#39;GLIB_BINDIR&#39=
;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 })<br>
=C2=A0# override glib dep with the configure results (for subprojects)<br>
=C2=A0meson.override_dependency(&#39;glib-2.0&#39;, glib)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index e5b0958e1898..813d1c6ca6ae 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -58,7 +58,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?ifdef var.InstallVss?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libstdc++=
_6_lib&quot; Guid=3D&quot;{55E737B5-9127-4A11-9FC3-A29367714574}&quot;&gt;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libstdc++-6.=
lib&quot; Name=3D&quot;libstdc++-6.dll&quot; Source=3D&quot;$(var.Mingw_bin=
)/libstdc++-6.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&g=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libstdc++-6.=
lib&quot; Name=3D&quot;libstdc++-6.dll&quot; Source=3D&quot;$(var.BIN_DIR)/=
libstdc++-6.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;qga_vss_d=
ll&quot; Guid=3D&quot;{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;File Id=3D&quot;qga_vss=
.dll&quot; Name=3D&quot;qga-vss.dll&quot; Source=3D&quot;$(var.BUILD_DIR)/q=
ga/vss-win32/qga-vss.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&q=
uot;/&gt;<br>
@@ -69,40 +69,40 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?endif?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?if $(var.Arch) =3D &quot;32&q=
uot;?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;gspawn-he=
lper-console&quot; Guid=3D&quot;{446185B3-87BE-43D2-96B8-0FEFD9E8696D}&quot=
;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win32=
-helper-console.exe&quot; Name=3D&quot;gspawn-win32-helper-console.exe&quot=
; Source=3D&quot;$(var.Mingw_bin)/gspawn-win32-helper-console.exe&quot; Key=
Path=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win32=
-helper-console.exe&quot; Name=3D&quot;gspawn-win32-helper-console.exe&quot=
; Source=3D&quot;$(var.BIN_DIR)/gspawn-win32-helper-console.exe&quot; KeyPa=
th=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;gspawn-he=
lper&quot; Guid=3D&quot;{CD67A5A3-2DB1-4DA1-A67A-8D71E797B466}&quot;&gt;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win32=
-helper.exe&quot; Name=3D&quot;gspawn-win32-helper.exe&quot; Source=3D&quot=
;$(var.Mingw_bin)/gspawn-win32-helper-console.exe&quot; KeyPath=3D&quot;yes=
&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win32=
-helper.exe&quot; Name=3D&quot;gspawn-win32-helper.exe&quot; Source=3D&quot=
;$(var.BIN_DIR)/gspawn-win32-helper-console.exe&quot; KeyPath=3D&quot;yes&q=
uot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?endif?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?if $(var.Arch) =3D &quot;64&q=
uot;?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;gspawn-he=
lper-console&quot; Guid=3D&quot;{9E615A9F-349A-4992-A5C2-C10BAD173660}&quot=
;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win64=
-helper-console.exe&quot; Name=3D&quot;gspawn-win64-helper-console.exe&quot=
; Source=3D&quot;$(var.Mingw_bin)/gspawn-win64-helper-console.exe&quot; Key=
Path=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win64=
-helper-console.exe&quot; Name=3D&quot;gspawn-win64-helper-console.exe&quot=
; Source=3D&quot;$(var.BIN_DIR)/gspawn-win64-helper-console.exe&quot; KeyPa=
th=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;gspawn-he=
lper&quot; Guid=3D&quot;{D201AD22-1846-4E4F-B6E1-C7A908ED2457}&quot;&gt;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win64=
-helper.exe&quot; Name=3D&quot;gspawn-win64-helper.exe&quot; Source=3D&quot=
;$(var.Mingw_bin)/gspawn-win64-helper-console.exe&quot; KeyPath=3D&quot;yes=
&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;gspawn-win64=
-helper.exe&quot; Name=3D&quot;gspawn-win64-helper.exe&quot; Source=3D&quot=
;$(var.BIN_DIR)/gspawn-win64-helper-console.exe&quot; KeyPath=3D&quot;yes&q=
uot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?endif?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;iconv&quo=
t; Guid=3D&quot;{35EE3558-D34B-4F0A-B8BD-430FF0775246}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;iconv.dll&qu=
ot; Name=3D&quot;iconv.dll&quot; Source=3D&quot;$(var.Mingw_bin)/iconv.dll&=
quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;iconv.dll&qu=
ot; Name=3D&quot;iconv.dll&quot; Source=3D&quot;$(var.BIN_DIR)/iconv.dll&qu=
ot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libgcc_ar=
ch_lib&quot; Guid=3D&quot;{ADD4D07D-4515-4AB6-AF3E-C904961B4BB0}&quot;&gt;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libgcc_arch_=
lib&quot; Name=3D&quot;$(var.ArchLib)&quot; Source=3D&quot;$(var.Mingw_bin)=
/$(var.ArchLib)&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libgcc_arch_=
lib&quot; Name=3D&quot;$(var.ArchLib)&quot; Source=3D&quot;$(var.BIN_DIR)/$=
(var.ArchLib)&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libglib&q=
uot; Guid=3D&quot;{D31BFD83-2773-4B65-B45A-E0D2ADA58679}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libglib_2.0_=
0.dll&quot; Name=3D&quot;libglib-2.0-0.dll&quot; Source=3D&quot;$(var.Mingw=
_bin)/libglib-2.0-0.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&qu=
ot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libglib_2.0_=
0.dll&quot; Name=3D&quot;libglib-2.0-0.dll&quot; Source=3D&quot;$(var.BIN_D=
IR)/libglib-2.0-0.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot=
;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libintl&q=
uot; Guid=3D&quot;{A641BC2D-A907-4A94-9149-F30ED430878F}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libintl_8.dl=
l&quot; Name=3D&quot;libintl-8.dll&quot; Source=3D&quot;$(var.Mingw_bin)/li=
bintl-8.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libintl_8.dl=
l&quot; Name=3D&quot;libintl-8.dll&quot; Source=3D&quot;$(var.BIN_DIR)/libi=
ntl-8.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libssp&qu=
ot; Guid=3D&quot;{7880087B-02B4-4EF6-A5D3-D18F8E3D90E1}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libssp_0.dll=
&quot; Name=3D&quot;libssp-0.dll&quot; Source=3D&quot;$(var.Mingw_bin)/libs=
sp-0.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libssp_0.dll=
&quot; Name=3D&quot;libssp-0.dll&quot; Source=3D&quot;$(var.BIN_DIR)/libssp=
-0.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libwinpth=
read&quot; Guid=3D&quot;{6C117C78-0F47-4B07-8F34-6BEE11643829}&quot;&gt;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libwinpthrea=
d_1.dll&quot; Name=3D&quot;libwinpthread-1.dll&quot; Source=3D&quot;$(var.M=
ingw_bin)/libwinpthread-1.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quo=
t;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libwinpthrea=
d_1.dll&quot; Name=3D&quot;libwinpthread-1.dll&quot; Source=3D&quot;$(var.B=
IN_DIR)/libwinpthread-1.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;=
1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libpcre&q=
uot; Guid=3D&quot;{7A86B45E-A009-489A-A849-CE3BACF03CD0}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libpcre_1.dl=
l&quot; Name=3D&quot;libpcre-1.dll&quot; Source=3D&quot;$(var.Mingw_bin)/li=
bpcre-1.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libpcre_1.dl=
l&quot; Name=3D&quot;libpcre-1.dll&quot; Source=3D&quot;$(var.BIN_DIR)/libp=
cre-1.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;registry_=
entries&quot; Guid=3D&quot;{D075D109-51CA-11E3-9F8B-000C29858960}&quot;&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryKey Root=3D&quo=
t;HKLM&quot;<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 3ad3bc0260cf..51b1e611b194 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -125,7 +125,7 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_arch[cpu],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_vss,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;BUILD_DIR=3D&#39; =
+ meson.build_root(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;Mingw_bin=3D&#39; + conf=
ig_host[&#39;QEMU_GA_MSI_MINGW_BIN_PATH&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;BIN_DIR=3D&#39; + glib.g=
et_variable(&#39;bindir&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;QEMU_GA_VERSION=3D=
&#39; + config_host[&#39;QEMU_GA_VERSION&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;QEMU_GA_MANUFACTUR=
ER=3D&#39; + config_host[&#39;QEMU_GA_MANUFACTURER&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;QEMU_GA_DISTRO=3D&=
#39; + config_host[&#39;QEMU_GA_DISTRO&#39;],<br>
-- <br>
2.36.0.44.g0f828332d5ac<br>
<br>
</blockquote></div>

--00000000000086f88605de3f87e2--


