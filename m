Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85DA69DB6F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNN0-0000ds-Fu; Tue, 21 Feb 2023 02:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pUNMv-0000de-ID
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pUNMt-0008Ns-IT
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676965636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vRSCOToTkfZNupb+YawTultCxEkodzL1oAZvcIyX0lo=;
 b=jV0z2aE/fSqqzh/ukLi1aBk7nBa7quc3MIxEt6GibsxrLhdcsfL1uOYCZyWGHKqo3tvM1Z
 BRuD7F7yiX2jLyEN6tmWEBg/TYtWRXVrQNiBLRNiK7aU5CC30OUodTljp2t8gqtslkmqya
 Vwg5g8GzlRa6xuexJPfpdRODs53QV3c=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-9gR9LJ9jMx-_lNZ25wZmcw-1; Tue, 21 Feb 2023 02:47:14 -0500
X-MC-Unique: 9gR9LJ9jMx-_lNZ25wZmcw-1
Received: by mail-vs1-f70.google.com with SMTP id
 v3-20020a67ff83000000b004124fe134e1so419203vsq.23
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vRSCOToTkfZNupb+YawTultCxEkodzL1oAZvcIyX0lo=;
 b=TQ7NjNqZF/9ZLsNlZAElAO6ZBlV3Tc1mZwjhfiQoQQ6rgZAHEAsH4Z83pZblrwayGp
 b5e3/zzB7pJVrtdLL2UGQgBagSI2d3XztZZ1dH0/DnJ3Kbo9jhxnMUPyycaahs75tz59
 Cc1eZiEFUYg2oN3ZoCld0sy1NXGAZ3pqLKC/74A+AxIZgIsCxkMq5awUmtYtL6JJaKhM
 Kt1dHf02fh0+6CbHn5pNEPjNQmwN7bMkRDl59mhwM3IYU+tkgZBt1pNIWOOOG7wvcIRr
 fQ/XgQwFuD6TFHwnbdFAtL7wDmyL4xR/JmGsXHSeLnDYk/Mqr58e+8ZvsbqJqEVMeK6w
 8cew==
X-Gm-Message-State: AO0yUKVk81UAbTaAflg7FQbmttuWZtNUzJq+e8mrYOHOe6MfxSTvM3Hx
 9TYl18iUgDxDwzgX/zNW46HGqq53Hn1KHl992XgTpnLniDOuFI6feufSg+j6IjI01cY1bwbMi/K
 Zk7oMw9dXPHhwgIKq2/DvtCbFnTg6vsA=
X-Received: by 2002:a67:f408:0:b0:416:f6b4:ff4e with SMTP id
 p8-20020a67f408000000b00416f6b4ff4emr460280vsn.37.1676965634477; 
 Mon, 20 Feb 2023 23:47:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/mbIZJ1YnehbncU+rA3ndEHvL8dVhdNIyg4SrNrrUM3a+wTZNjjc6TMC0lBralWwKIwda9thrEc5ogHj7CQuA=
X-Received: by 2002:a67:f408:0:b0:416:f6b4:ff4e with SMTP id
 p8-20020a67f408000000b00416f6b4ff4emr460274vsn.37.1676965634222; Mon, 20 Feb
 2023 23:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20230220174142.240393-1-kkostiuk@redhat.com>
 <20230220174142.240393-3-kkostiuk@redhat.com>
In-Reply-To: <20230220174142.240393-3-kkostiuk@redhat.com>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Tue, 21 Feb 2023 09:47:02 +0200
Message-ID: <CAGoVJZx1vHo5um8ohyNzdb2+wwmGjUh7pZOeB_KFvC6CGPCGGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] qga/win32: Use rundll for VSS installation
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Yan Vugenfirer <yvugenfi@redhat.com>


On Mon, Feb 20, 2023 at 7:41 PM Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> Add specific an entry points for rundll which is
> just a wrapper for COMRegister/COMUnregister functions.
>
> resolves: rhbz#2167436
> fixes: CVE-2023-0664
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>  qga/installer/qemu-ga.wxs | 10 +++++-----
>  qga/vss-win32/install.cpp |  9 +++++++++
>  qga/vss-win32/qga-vss.def |  2 ++
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index feb629ec47..46ae9e7a13 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -127,22 +127,22 @@
>        </Directory>
>      </Directory>
>
> -    <Property Id="cmd" Value="cmd.exe"/>
> +    <Property Id="rundll" Value="rundll32.exe"/>
>      <Property Id="REINSTALLMODE" Value="amus"/>
>
>      <?ifdef var.InstallVss?>
>      <CustomAction Id="RegisterCom"
> -              ExeCommand='/c "[qemu_ga_directory]qemu-ga.exe" -s vss-install'
> +              ExeCommand='"[qemu_ga_directory]qga-vss.dll",DLLCOMRegister'
>                Execute="deferred"
> -              Property="cmd"
> +              Property="rundll"
>                Impersonate="no"
>                Return="check"
>                >
>      </CustomAction>
>      <CustomAction Id="UnRegisterCom"
> -              ExeCommand='/c "[qemu_ga_directory]qemu-ga.exe" -s vss-uninstall'
> +              ExeCommand='"[qemu_ga_directory]qga-vss.dll",DLLCOMUnregister'
>                Execute="deferred"
> -              Property="cmd"
> +              Property="rundll"
>                Impersonate="no"
>                Return="check"
>                >
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index b57508fbe0..68662a6dfc 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -357,6 +357,15 @@ out:
>      return hr;
>  }
>
> +STDAPI_(void) CALLBACK DLLCOMRegister(HWND, HINSTANCE, LPSTR, int)
> +{
> +    COMRegister();
> +}
> +
> +STDAPI_(void) CALLBACK DLLCOMUnregister(HWND, HINSTANCE, LPSTR, int)
> +{
> +    COMUnregister();
> +}
>
>  static BOOL CreateRegistryKey(LPCTSTR key, LPCTSTR value, LPCTSTR data)
>  {
> diff --git a/qga/vss-win32/qga-vss.def b/qga/vss-win32/qga-vss.def
> index 927782c31b..ee97a81427 100644
> --- a/qga/vss-win32/qga-vss.def
> +++ b/qga/vss-win32/qga-vss.def
> @@ -1,6 +1,8 @@
>  LIBRARY      "QGA-PROVIDER.DLL"
>
>  EXPORTS
> +       DLLCOMRegister
> +       DLLCOMUnregister
>         COMRegister             PRIVATE
>         COMUnregister           PRIVATE
>         DllCanUnloadNow         PRIVATE
> --
> 2.25.1
>


