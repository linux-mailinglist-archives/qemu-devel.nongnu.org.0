Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DAB3DE71C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 09:16:19 +0200 (CEST)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAoew-0001KG-1s
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 03:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mAodL-0000cD-S7
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mAodJ-0002hi-3Q
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627974875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WCgz+yXdE6wuBfsAvr/snDJYT0PyRfO7ntGy/6zftHg=;
 b=TfVEftbBZdVh9P538DIiK2ZiRnkzwCrgwBKomhVqa8xXEW3ziABaReMllMFdeuQvi3EllY
 5TaA+wfc5BJpszdcaB0+bRn1uz+eg9pVskWdrxeLd0AfYwRmo5DeLsdVK0qqO+4fAFNwLK
 H2DU7XvQlHT9L4SiS+iCG0+HT+VOxV4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-2rPl9xgJNNmTiaqT4bT_ug-1; Tue, 03 Aug 2021 03:14:33 -0400
X-MC-Unique: 2rPl9xgJNNmTiaqT4bT_ug-1
Received: by mail-pj1-f70.google.com with SMTP id
 q63-20020a17090a17c5b02901774f4b30ebso16678797pja.1
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 00:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WCgz+yXdE6wuBfsAvr/snDJYT0PyRfO7ntGy/6zftHg=;
 b=SIQEi9NDD5ymUL3qbgwwk/Hf1tHHnL+Kgs8UU7jdOQWc3aGrs96pSyjNYbDdpYien7
 odB8gxWUF7Ec20B5ADozJTmO6O/4vquQpa/b5QgGiWI9qzCn0wL7v9Z4I//2Ax/vWMcH
 zYiHvOxljUVolnkV40d1ruDOtx2C/ywJRksEOdT4WY0apPpgKYKSxVL6bNoJkgwphywZ
 Y5ietpHvbaBIRhSaUuBc39J36AFARZqG0/ug6q4+lS5XiLTN+4OV3Ke6E0kJUPc0S52+
 9RMx0yOINDN0+OPjZyCSlKdDgQcAh6SHaxAebi1q+E5WCirukvZZZxggVPcYwLNtMyo9
 Z30g==
X-Gm-Message-State: AOAM5330No8c8u23VyjSUwyCuzESn4TGgHsZCwo8nVha/PmQP/pXfHkV
 YstBP35Qz/pD/6bBQiTSv8ewiAvxEJmwzmMc1rMKMc45Dbj08J1MdYKYaTwT4ZpHl87be6juy+L
 01aP4KYvqGgoDotIZSzlWO3G079weU5I=
X-Received: by 2002:aa7:8a56:0:b029:3c3:4df9:7370 with SMTP id
 n22-20020aa78a560000b02903c34df97370mr3357330pfa.42.1627974872856; 
 Tue, 03 Aug 2021 00:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL5e3Tijqxo71rgHNAfCGo2kjpRay7e68RsRdKpYSFG8gnNafEZktMm/RK/eba935fXZXctjw1bykl/R7scMs=
X-Received: by 2002:aa7:8a56:0:b029:3c3:4df9:7370 with SMTP id
 n22-20020aa78a560000b02903c34df97370mr3357320pfa.42.1627974872634; Tue, 03
 Aug 2021 00:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210803043536.1071251-1-michael.roth@amd.com>
In-Reply-To: <20210803043536.1071251-1-michael.roth@amd.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 3 Aug 2021 11:14:21 +0400
Message-ID: <CAMxuvawWykDVuY-SeAXv1-wKo0=vf9d9rt8HF=8kNE6ev4WLwA@mail.gmail.com>
Subject: Re: [PATCH for-6.1] qga-win/msi: fix missing libstdc++-6 DLL in MSI
 installer
To: Michael Roth <michael.roth@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fcb77d05c8a26f05"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kostiantyn Kostiuk <konstantin@daynix.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fcb77d05c8a26f05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 8:36 AM Michael Roth <michael.roth@amd.com> wrote:

> libstdc++ is required for the qga-vss.dll that provides fsfreeze
> functionality. Currently it is not provided by the MSI installer,
> resulting in fsfreeze being disabled in guest environments where it has
> not been installed by other means.
>
> In the future this would be better handled via gcc-cpp ComponentGroup
> provided by msitools, but that would be better handled with a general
> rework of DLL dependency handling in the installer build. Keep it
> simple for now to fix this regression.
>
> Tested with Fedora 34 mingw build environment.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Kostiantyn Kostiuk <konstantin@daynix.com>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  qga/installer/qemu-ga.wxs | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index ce7b25b5e1..0950e8c6be 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -84,6 +84,9 @@
>              <ServiceControl Id=3D"StartService" Start=3D"install" Stop=
=3D"both"
> Remove=3D"uninstall" Name=3D"QEMU-GA" Wait=3D"yes" />
>            </Component>
>            <?ifdef var.InstallVss?>
> +          <Component Id=3D"libstdc++_6_lib"
> Guid=3D"{55E737B5-9127-4A11-9FC3-A29367714574}">
> +            <File Id=3D"libstdc++-6.lib" Name=3D"libstdc++-6.dll"
> Source=3D"$(var.Mingw_bin)/libstdc++-6.dll" KeyPath=3D"yes" DiskId=3D"1"/=
>
> +          </Component>
>            <Component Id=3D"qga_vss_dll"
> Guid=3D"{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
>              <File Id=3D"qga_vss.dll" Name=3D"qga-vss.dll"
> Source=3D"$(env.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath=3D"yes"
> DiskId=3D"1"/>
>            </Component>
> @@ -164,6 +167,7 @@
>      <Feature Id=3D"QEMUFeature" Title=3D"QEMU Guest Agent" Level=3D"1">
>        <ComponentRef Id=3D"qemu_ga" />
>        <?ifdef var.InstallVss?>
> +      <ComponentRef Id=3D"libstdc++_6_lib" />
>        <ComponentRef Id=3D"qga_vss_dll" />
>        <ComponentRef Id=3D"qga_vss_tlb" />
>        <?endif?>
> --
> 2.25.1
>
>

--000000000000fcb77d05c8a26f05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 8:36 AM Michae=
l Roth &lt;<a href=3D"mailto:michael.roth@amd.com">michael.roth@amd.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">libs=
tdc++ is required for the qga-vss.dll that provides fsfreeze<br>
functionality. Currently it is not provided by the MSI installer,<br>
resulting in fsfreeze being disabled in guest environments where it has<br>
not been installed by other means.<br>
<br>
In the future this would be better handled via gcc-cpp ComponentGroup<br>
provided by msitools, but that would be better handled with a general<br>
rework of DLL dependency handling in the installer build. Keep it<br>
simple for now to fix this regression.<br>
<br>
Tested with Fedora 34 mingw build environment.<br>
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Cc: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com" target=
=3D"_blank">konstantin@daynix.com</a>&gt;<br>
Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Cc: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" ta=
rget=3D"_blank">philmd@redhat.com</a>&gt;<br>
Signed-off-by: Michael Roth &lt;<a href=3D"mailto:michael.roth@amd.com" tar=
get=3D"_blank">michael.roth@amd.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div=
><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/installer/qemu-ga.wxs | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index ce7b25b5e1..0950e8c6be 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -84,6 +84,9 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;ServiceControl Id=3D&qu=
ot;StartService&quot; Start=3D&quot;install&quot; Stop=3D&quot;both&quot; R=
emove=3D&quot;uninstall&quot; Name=3D&quot;QEMU-GA&quot; Wait=3D&quot;yes&q=
uot; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?ifdef var.InstallVss?&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;Component Id=3D&quot;libstdc++_6_li=
b&quot; Guid=3D&quot;{55E737B5-9127-4A11-9FC3-A29367714574}&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libstdc++-6.=
lib&quot; Name=3D&quot;libstdc++-6.dll&quot; Source=3D&quot;$(var.Mingw_bin=
)/libstdc++-6.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&g=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/Component&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;qga_vss_d=
ll&quot; Guid=3D&quot;{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;File Id=3D&quot;qga_vss=
.dll&quot; Name=3D&quot;qga-vss.dll&quot; Source=3D&quot;$(env.BUILD_DIR)/q=
ga/vss-win32/qga-vss.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&q=
uot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
@@ -164,6 +167,7 @@<br>
=C2=A0 =C2=A0 =C2=A0&lt;Feature Id=3D&quot;QEMUFeature&quot; Title=3D&quot;=
QEMU Guest Agent&quot; Level=3D&quot;1&quot;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;ComponentRef Id=3D&quot;qemu_ga&quot; /&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?ifdef var.InstallVss?&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;ComponentRef Id=3D&quot;libstdc++_6_lib&quot; /&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;ComponentRef Id=3D&quot;qga_vss_dll&quot; /&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;ComponentRef Id=3D&quot;qga_vss_tlb&quot; /&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;?endif?&gt;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000fcb77d05c8a26f05--


