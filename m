Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C487C64F4BE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 00:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Jos-0004li-Ec; Fri, 16 Dec 2022 18:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6Jop-0004lU-FT
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:08:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6JoW-0002cK-UP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671232102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mxKWUmsbURuQkN1wTd2KNzDlZjCX6lnSp7c00JtdSP0=;
 b=NYLa4CXbDfIfgy3POHvMGEd37Xf5uHStJtgIJZYbW6jeP5IJItqJCkwHPr1TAAqvppsUMx
 qbr6i/0e4pxlFmeGNQGGWlT2zSkWOw9Jv87ZpFS2NePYzQophHmaCl15zqf2IPjqC256/M
 boBXvrPyTMR4isE424eU5nAgHcRPTm8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-AlL-iHYuML24V53pcn86HQ-1; Fri, 16 Dec 2022 18:08:20 -0500
X-MC-Unique: AlL-iHYuML24V53pcn86HQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 g27-20020ab0105b000000b0043464bada19so1482258uab.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mxKWUmsbURuQkN1wTd2KNzDlZjCX6lnSp7c00JtdSP0=;
 b=v0vF0/IwXehQtIDUHFDofzaYo+t3wcbGbZvZoUx9zg3KcWUafrGQTW+g4MI23En/T8
 te+LEJsEGtJPzujtPw0QQekM8zYfA1yspfd36UMiQOs0TvMNxVJbR6ULymVvaS6SaevR
 q41Flk/P9ls8SzRlU9K7psirVn6JhnNmpCKB4m3L9JE3x5VFhkG8V1yQxyOLOTf3Yit+
 TE13q6WQ0PRQlFrxrGs39UzNoGjr6y4XBy/m23D5rg/o4PtG3uKG6eLH4yjdq5fLZd9U
 Pwb+KIcxnPWiWG5Xa8aOVtOc0Iduu6ispoKKMhwJq2a+TgVyW/l7y05zEhXNW7NtsXlM
 0FLg==
X-Gm-Message-State: AFqh2kqvMygie+pl31BcHL01BjGYqV9OGuE8FFOIFl+8xSPFmdIGdD/O
 Md0s+6BLNDsV6qKEI090RCtyJ13+KW+oiA5P7U63aSq9Zm6H4+NTsTv4608Mua29DAC5hYje66c
 YB6ZJSed4kcx0meo0X3cbcheg3S/Vx1w=
X-Received: by 2002:a05:6102:150c:b0:3b5:2762:568b with SMTP id
 f12-20020a056102150c00b003b52762568bmr1622070vsv.62.1671232099928; 
 Fri, 16 Dec 2022 15:08:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvm+saJOqR1PGWNfDhW9n+nJ7Chw9kmr1vpXLmoJ68B3nqArXgm3Eziia08POSnLW5bRNeuAiJo/5DTlgL8Pno=
X-Received: by 2002:a05:6102:150c:b0:3b5:2762:568b with SMTP id
 f12-20020a056102150c00b003b52762568bmr1622067vsv.62.1671232099620; Fri, 16
 Dec 2022 15:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20221204015123.362726-1-richard.henderson@linaro.org>
 <20221204015123.362726-3-richard.henderson@linaro.org>
In-Reply-To: <20221204015123.362726-3-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 17 Dec 2022 00:08:08 +0100
Message-ID: <CABgObfbS3BkDJ=wx38LyJJFs+__07MntKSHb2ZNUo3zo-_=Sjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] meson: Set avx512f option to auto
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Tom Stellard <tstellar@redhat.com>, 
 "P. Berrange, Daniel" <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a2b5fb05effa0bbc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--000000000000a2b5fb05effa0bbc
Content-Type: text/plain; charset="UTF-8"

Because that's what configure used to do (
https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg00650.html)...

It can surely be changed but AVX512 is known to limit processor frequency.
I am not sure if the limitation is per core or extends to multiple cores,
and it would be a pity if guests were slowed down even further during
migration.

Especially after the bulk phase buffer_is_zero performance matters a lot
less so you'd pay the price of AVX512 for little gain. After the bulk phase
it may even make sense to just use SSE, since even AVX requires a voltage
transition[1] from what I saw at
https://travisdowns.github.io/blog/2020/01/17/avxfreq1.html.

Paolo

[1] voltage transitions slow down the processor during the transition

Il dom 4 dic 2022, 02:51 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> I'm not sure why this option wasn't set the same as avx2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson_options.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson_options.txt b/meson_options.txt
> index 4b749ca549..f98ee101e2 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -102,7 +102,7 @@ option('membarrier', type: 'feature', value:
> 'disabled',
>
>  option('avx2', type: 'feature', value: 'auto',
>         description: 'AVX2 optimizations')
> -option('avx512f', type: 'feature', value: 'disabled',
> +option('avx512f', type: 'feature', value: 'auto',
>         description: 'AVX512F optimizations')
>  option('keyring', type: 'feature', value: 'auto',
>         description: 'Linux keyring support')
> --
> 2.34.1
>
>

--000000000000a2b5fb05effa0bbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Because that&#39;s what configure used to do (<a href=3D"=
https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg00650.html).">h=
ttps://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg00650.html).</a>=
..<div dir=3D"auto"><br></div><div dir=3D"auto">It can surely be changed bu=
t AVX512 is known to limit processor frequency. I am not sure if the limita=
tion is per core or extends to multiple cores, and it would be a pity if gu=
ests were slowed down even further during migration.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Especially after the bulk phase buffer_is_zero=
 performance matters a lot less so you&#39;d pay the price of AVX512 for li=
ttle gain. After the bulk phase it may even make sense to just use SSE, sin=
ce even AVX requires a voltage transition[1] from what I saw at=C2=A0<a hre=
f=3D"https://travisdowns.github.io/blog/2020/01/17/avxfreq1.html">https://t=
ravisdowns.github.io/blog/2020/01/17/avxfreq1.html</a>.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">[1] voltage transitions slow down the processor during the tr=
ansition</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Il dom 4 dic 2022, 02:51 Richard Henderson &lt;<a href=3D"m=
ailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; ha=
 scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;m not sure why this=
 option wasn&#39;t set the same as avx2.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org=
</a>&gt;<br>
---<br>
=C2=A0meson_options.txt | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 4b749ca549..f98ee101e2 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -102,7 +102,7 @@ option(&#39;membarrier&#39;, type: &#39;feature&#39;, v=
alue: &#39;disabled&#39;,<br>
<br>
=C2=A0option(&#39;avx2&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;AVX2 optimizations&#39;)<br>
-option(&#39;avx512f&#39;, type: &#39;feature&#39;, value: &#39;disabled&#3=
9;,<br>
+option(&#39;avx512f&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;AVX512F optimizations&#39;)<b=
r>
=C2=A0option(&#39;keyring&#39;, type: &#39;feature&#39;, value: &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Linux keyring support&#39;)<b=
r>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000a2b5fb05effa0bbc--


