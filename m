Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C251BBB6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:16:34 +0200 (CEST)
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXb7-0001N0-Kt
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWog-0003LC-EF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:26:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:59273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nmWod-0001bd-Ly
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGETtUFUPMvK7Xgk10CcyxQ6ahAIX6jWZM4XDZxbBEM=;
 b=N9uenLMg2XktS9+rhvAt1PcLXL1jXczmMFhzIzz6PUBNed+kYuNTPDZpSRkD2WM/2o6XbU
 IWH0+D0Cy30mEae+dzAgVCe7khL8qMT/VGfgLn9GFsfGLkXYbW26IsVIrpzgKzy53usB24
 DUZZy933WZKDMY1jf+51rrAzOfIC4Bo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-QvSJ0DTUOO-G8RvjrDVAOw-1; Thu, 05 May 2022 04:26:23 -0400
X-MC-Unique: QvSJ0DTUOO-G8RvjrDVAOw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2f7c5767f0fso33058957b3.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VGETtUFUPMvK7Xgk10CcyxQ6ahAIX6jWZM4XDZxbBEM=;
 b=yAgca2zm9CEOZedh/2JDsXtETFo3le3CTSdDKjnmoPvOyxfguSsRbEh3lzmfbgRWsP
 vd+qm+F7n41vFEDxHzZWHCtpm9fYZsSdiNVadL5dBYMTk5LZfMIVo/eeWM/yjP7rZK+7
 MrOjo4cLHVpZdd2bhEOkZIxS2WidNIa103c03gRGGzCT2zgpgJbEhU4AukTYoLGK/yYO
 dx57Xk1HJ+5Y4/ZDDfNf1zDiUyEop+CjYBVl1rOA98NCpaX149fld2jvBzeEWpGGIPqT
 xuunqj8iqFRk28xC+V8VqvDysogi4gJEj3t4nMS96r1jS6k8L3QL9IqMDdJMaX3gU6ri
 6wnw==
X-Gm-Message-State: AOAM530BE+WGIriAEl/j+aVqBy0ZzV/yRmdONOUBete5oGdbssjWbOlg
 y/vAJ0lLh3NzraZ6YxAYXYJOMDQRfrLNWclVZtoitX1GKWj4QMSN9iZPdGwcwOmsRHD9Sv5BEKw
 LiG8BlUjKEMWvZQK32pVBS3N+jPfbMsk=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr22797715ywk.27.1651739182716; 
 Thu, 05 May 2022 01:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQC/Lk2/DKKVXuChqc5l/k74v5zMQQMPEt4Utc6KGWrt8Az8OYLhoCXzVSmbP+yt45nd4kSh2c/9EKwAzSHUg=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr22797701ywk.27.1651739182533; Thu, 05
 May 2022 01:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-13-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 5 May 2022 11:26:11 +0300
Message-ID: <CAPMcbCrm=-Awb7HeDkzPY2Z7F5fxvz67H6kCoMYCum7ES9OkGQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] qga/wixl: require Mingw_bin
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
Content-Type: multipart/alternative; boundary="0000000000003c9ff405de3f7fba"
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

--0000000000003c9ff405de3f7fba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, May 5, 2022 at 11:16 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> No clear reason to make guesses here.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/installer/qemu-ga.wxs | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 8a19aa165651..651db6e51cda 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -4,15 +4,6 @@
>      <?error Define Arch to 32 or 64?>
>    <?endif?>
>
> -  <?ifndef var.Mingw_bin?>
> -    <?if $(var.Arch) =3D "64"?>
> -      <?define Mingw_bin=3D/usr/x86_64-w64-mingw32/sys-root/mingw/bin ?>
> -    <?endif?>
> -    <?if $(var.Arch) =3D "32"?>
> -      <?define Mingw_bin=3D/usr/i686-w64-mingw32/sys-root/mingw/bin ?>
> -    <?endif?>
> -  <?endif?>
> -
>    <?if $(var.Arch) =3D "64"?>
>      <?define ArchLib=3Dlibgcc_s_seh-1.dll?>
>      <?define GaProgramFilesFolder=3D"ProgramFiles64Folder" ?>
> --
> 2.36.0.44.g0f828332d5ac
>
>

--0000000000003c9ff405de3f7fba
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
No clear reason to make guesses here.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/installer/qemu-ga.wxs | 9 ---------<br>
=C2=A01 file changed, 9 deletions(-)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index 8a19aa165651..651db6e51cda 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -4,15 +4,6 @@<br>
=C2=A0 =C2=A0 =C2=A0&lt;?error Define Arch to 32 or 64?&gt;<br>
=C2=A0 =C2=A0&lt;?endif?&gt;<br>
<br>
-=C2=A0 &lt;?ifndef var.Mingw_bin?&gt;<br>
-=C2=A0 =C2=A0 &lt;?if $(var.Arch) =3D &quot;64&quot;?&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 &lt;?define Mingw_bin=3D/usr/x86_64-w64-mingw32/sys-r=
oot/mingw/bin ?&gt;<br>
-=C2=A0 =C2=A0 &lt;?endif?&gt;<br>
-=C2=A0 =C2=A0 &lt;?if $(var.Arch) =3D &quot;32&quot;?&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 &lt;?define Mingw_bin=3D/usr/i686-w64-mingw32/sys-roo=
t/mingw/bin ?&gt;<br>
-=C2=A0 =C2=A0 &lt;?endif?&gt;<br>
-=C2=A0 &lt;?endif?&gt;<br>
-<br>
=C2=A0 =C2=A0&lt;?if $(var.Arch) =3D &quot;64&quot;?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?define ArchLib=3Dlibgcc_s_seh-1.dll?&gt;<br>
=C2=A0 =C2=A0 =C2=A0&lt;?define GaProgramFilesFolder=3D&quot;ProgramFiles64=
Folder&quot; ?&gt;<br>
-- <br>
2.36.0.44.g0f828332d5ac<br>
<br>
</blockquote></div>

--0000000000003c9ff405de3f7fba--


