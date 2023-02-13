Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BD694C85
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZf-0004tg-TM; Mon, 13 Feb 2023 11:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pRbZY-0004hu-Hb
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pRbZW-000803-M6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676305253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=enXnX4966R4PdwppK3JzdIqdruCE65BeqaVQIOsbPiU=;
 b=JG4E0NLBZCw3tHskcxLeu0r2jI9KkBy1V8N5kBtnquB3yorscBWpDPV7NqNeXq+ixDi3EO
 9trGWGQOqI0i38OS6pEK+VUq9dON/AUTsOvevRo1tH5lpO+SqjiHr6D5hEB38muzIUFVEB
 4b+wnzmlcqMnze9mpOETHrRfGmDhTgE=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-ybwgCVx1MdOuTjGBoxEOIA-1; Mon, 13 Feb 2023 11:20:49 -0500
X-MC-Unique: ybwgCVx1MdOuTjGBoxEOIA-1
Received: by mail-vk1-f200.google.com with SMTP id
 x197-20020a1f7cce000000b00401684aa41aso1676334vkc.17
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676305249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=enXnX4966R4PdwppK3JzdIqdruCE65BeqaVQIOsbPiU=;
 b=hAfeDSqATN2Knn5ehDa9aotUigK5m2ssrw6Pnnph40nemauQrvcJaXBji020vPJYUs
 /LScwkGoR3uv8W4yhJzNpPB/YGShuL+bji5j70KdjgAQtkY1H2aZFjwXc/5px3jqQ798
 fRJDu9M7u0qHHIoUPYhO34UrEpy9Nog1M29N6egJEH+ndAXtzF8Cje+EDrCjUPJm4bK0
 WAjUIEJ/h/VtEYpnpNn4N1ZqMKkZdaHvRzK0TzZ4Jl05Zz7pvNYZH1qDlKqtoJr2vL7G
 8CScnrTOJsFA9kV3sDlGk9UI2NHU5rt1oFauYwLGuJXt03UFUFe1RDo1w/alnhoQzNCc
 vpSQ==
X-Gm-Message-State: AO0yUKUFONyYYAT5VoNabBlrt0cx5vt1GcSRxNirv0eWROD1VY/wZ9BG
 13yBPQZ9drKZA8xfuC2FIMiy6ZVgZTgCWSTGCY5l3KiHtWkWYjaDy5L0/2hGWaueWRjk5/F0ZuV
 Rewnr/bozMOUYvi7uhD2UAAS/xnP+StU=
X-Received: by 2002:a05:6102:2417:b0:411:b12d:af4b with SMTP id
 j23-20020a056102241700b00411b12daf4bmr3810502vsi.42.1676305248919; 
 Mon, 13 Feb 2023 08:20:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+uTCNk3J5VFfFQRu88wOax7P8MDmlXMCh1DJFygp6YMaEdv9lW7JCm2Hl6BwNN1RuckQ5fljs++pKV3chak7c=
X-Received: by 2002:a05:6102:2417:b0:411:b12d:af4b with SMTP id
 j23-20020a056102241700b00411b12daf4bmr3810496vsi.42.1676305248714; Mon, 13
 Feb 2023 08:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-4-pierrick.bouvier@linaro.org>
In-Reply-To: <20230213161352.17199-4-pierrick.bouvier@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 13 Feb 2023 18:20:37 +0200
Message-ID: <CAPMcbCqZEVZ5JxCx2MFVKy-dKdOdNUhTN2Ry0NuuJ5sW4Z+Zhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] qga/vss-win32: fix warning for clang++-15
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, clg@kaod.org, 
 richard.henderson@linaro.org, alex.bennee@linaro.org
Content-Type: multipart/alternative; boundary="000000000000e294c505f4973a76"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000e294c505f4973a76
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>



On Mon, Feb 13, 2023 at 6:14 PM Pierrick Bouvier <
pierrick.bouvier@linaro.org> wrote:

> Reported when compiling with clang-windows-arm64.
>
> ../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used
> uninitialized whenever 'if' condition is false
> [-Werror,-Wsometimes-uninitialized]
>     if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here
>     return hr;
>            ^~
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  qga/vss-win32/install.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index b57508fbe0..b8087e5baa 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -518,7 +518,7 @@ namespace _com_util
>  /* Stop QGA VSS provider service using Winsvc API  */
>  STDAPI StopService(void)
>  {
> -    HRESULT hr;
> +    HRESULT hr = S_OK;
>      SC_HANDLE manager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
>      SC_HANDLE service = NULL;
>
> --
> 2.30.2
>
>

--000000000000e294c505f4973a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><br></div></div></div><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 13, 2023 at 6:14 PM Pierr=
ick Bouvier &lt;<a href=3D"mailto:pierrick.bouvier@linaro.org">pierrick.bou=
vier@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Reported when compiling with clang-windows-arm64.<br>
<br>
../qga/vss-win32/install.cpp:537:9: error: variable &#39;hr&#39; is used un=
initialized whenever &#39;if&#39; condition is false [-Werror,-Wsometimes-u=
ninitialized]<br>
=C2=A0 =C2=A0 if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~<br>
../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here<br=
>
=C2=A0 =C2=A0 return hr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
Signed-off-by: Pierrick Bouvier &lt;<a href=3D"mailto:pierrick.bouvier@lina=
ro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/install.cpp | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp<br>
index b57508fbe0..b8087e5baa 100644<br>
--- a/qga/vss-win32/install.cpp<br>
+++ b/qga/vss-win32/install.cpp<br>
@@ -518,7 +518,7 @@ namespace _com_util<br>
=C2=A0/* Stop QGA VSS provider service using Winsvc API=C2=A0 */<br>
=C2=A0STDAPI StopService(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 HRESULT hr;<br>
+=C2=A0 =C2=A0 HRESULT hr =3D S_OK;<br>
=C2=A0 =C2=A0 =C2=A0SC_HANDLE manager =3D OpenSCManager(NULL, NULL, SC_MANA=
GER_ALL_ACCESS);<br>
=C2=A0 =C2=A0 =C2=A0SC_HANDLE service =3D NULL;<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000e294c505f4973a76--


