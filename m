Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE555EE949
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 00:21:19 +0200 (CEST)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odfQc-0006nm-5w
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 18:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odfNu-00045p-39
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odfNr-00088F-2V
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664403506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H/6aqaEEZwBIby5B2Dk4AxckHvdL76aNmTyupSrLiWs=;
 b=L3NcIgwRdrHyZiGxSthS1fvxo87up/8i7pi+K2OmxCHSr346I+9K8rJWTfnle42YsrtNPZ
 hf1VRbYx9IGAt1Hrez9hmRmAEc4F5oJeoxvUlv6cMMLzC+htXvu9Lo9dCA89xYyn1fabN8
 BT5aqH5N5MYyx9T+vTq0NYQHnaA4zpk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-Tb9wTMNNN9yAkVa3Jex1TA-1; Wed, 28 Sep 2022 18:18:24 -0400
X-MC-Unique: Tb9wTMNNN9yAkVa3Jex1TA-1
Received: by mail-ua1-f69.google.com with SMTP id
 e20-20020ab031d4000000b003bef9338964so3759002uan.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 15:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=H/6aqaEEZwBIby5B2Dk4AxckHvdL76aNmTyupSrLiWs=;
 b=z9g7C5zTMG9oWRsHBR7IJPur3zBhLnRurYayZ9MEDR2rx2FQeqdKPI37hg2ByEf1/C
 CTFKva19lVLJrV1slAUbb/yQuMRGnHPw9nD81b8eXfQPYfRBkBALrNoDRYPCxuT9E7Dx
 F0QFrdwy4ilKaDwU0j0CWBu7Dpll3uZIp0MrsfsD3+vsgko1PqAbjMOc9w/QTUo5Fw/S
 Dq8MSvdHRma4UlHfGsqvS2s8R5GHZ1QBKK7v1uUiXzWWwZE9as1KGtjlCXKHz+hvweTw
 6eQZvr5NOA6v9ufiBXHELN6LsxnH7OhvF6RgVdiS/jeHr1VFRU3LuqzyngFG0bA+uyRh
 sl1Q==
X-Gm-Message-State: ACrzQf3Mo9KKdAuIa0DdMV2Vnk0SJR8AIFtlo2DmbxxDlACsoUKUGzt4
 cOyy/D9zl4a7/18k9uPC+lJdR32vgcHFzrv5PSzYrhQJ1WebHkNvG+VS1klZs2U81P4A4THAbLl
 JC1m9acb2kffEzFo9xkjQXGGhg2IRo8c=
X-Received: by 2002:a1f:a90c:0:b0:3a2:ddcd:a0d5 with SMTP id
 s12-20020a1fa90c000000b003a2ddcda0d5mr15801764vke.19.1664403503984; 
 Wed, 28 Sep 2022 15:18:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DVfNfmhzj+6/rFE2hMVGI5onk4zYF6Isg/ngUjpEmP5EktUiloH3uJcuiMxrD6OG54hWIoYgYmwfnBedlNwY=
X-Received: by 2002:a1f:a90c:0:b0:3a2:ddcd:a0d5 with SMTP id
 s12-20020a1fa90c000000b003a2ddcda0d5mr15801749vke.19.1664403503763; Wed, 28
 Sep 2022 15:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220927213501.4069117-1-alex.bennee@linaro.org>
In-Reply-To: <20220927213501.4069117-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 29 Sep 2022 00:18:13 +0200
Message-ID: <CABgObfbKdvFggwWde1NSupJ6HS-Um0dOpq-7fT-YSa+bFNRzeQ@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009ae6ad05e9c42332"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009ae6ad05e9c42332
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 27 set 2022, 23:35 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> It seems the depth of path we need to


With s/path/stack/,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

 support can vary depending on

the order of the init constructors getting called. It seems
> --enable-lto shuffles things around just enough to push you over the
> limit.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
> ---
>  tests/qtest/libqos/qgraph.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
> index 6e94824d09..5c0046e989 100644
> --- a/tests/qtest/libqos/qgraph.h
> +++ b/tests/qtest/libqos/qgraph.h
> @@ -24,7 +24,7 @@
>  #include "libqos-malloc.h"
>
>  /* maximum path length */
> -#define QOS_PATH_MAX_ELEMENT_SIZE 50
> +#define QOS_PATH_MAX_ELEMENT_SIZE 64
>
>  typedef struct QOSGraphObject QOSGraphObject;
>  typedef struct QOSGraphNode QOSGraphNode;
> --
> 2.34.1
>
>

--0000000000009ae6ad05e9c42332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 27 set 2022, 23:35 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">It seems the depth of path we ne=
ed to</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">With s/path/stack/,</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Acked-by: Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt;</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">=C2=A0support can vary depending on</blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
the order of the init constructors getting called. It seems<br>
--enable-lto shuffles things around just enough to push you over the<br>
limit.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br>
Fixes: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1186" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/1186</a><br>
---<br>
=C2=A0tests/qtest/libqos/qgraph.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h<br>
index 6e94824d09..5c0046e989 100644<br>
--- a/tests/qtest/libqos/qgraph.h<br>
+++ b/tests/qtest/libqos/qgraph.h<br>
@@ -24,7 +24,7 @@<br>
=C2=A0#include &quot;libqos-malloc.h&quot;<br>
<br>
=C2=A0/* maximum path length */<br>
-#define QOS_PATH_MAX_ELEMENT_SIZE 50<br>
+#define QOS_PATH_MAX_ELEMENT_SIZE 64<br>
<br>
=C2=A0typedef struct QOSGraphObject QOSGraphObject;<br>
=C2=A0typedef struct QOSGraphNode QOSGraphNode;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div></div>

--0000000000009ae6ad05e9c42332--


