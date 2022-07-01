Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2FF562A35
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 06:14:40 +0200 (CEST)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o783D-0004Uf-8h
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 00:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o7804-0002Wc-6o
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 00:11:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o7800-0007wF-KP
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 00:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656648677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcE4HKUS/zGPU3V1uco9o/HdjFxdl7qgPAB2/4abOs8=;
 b=fo9c/fki8IqqwlRRX9jeSwHEj5ld3POACDfKrKa7h7Y4h4yyW40a5ogkVJ7RSAEpmTNtzo
 CVVrIq6OxhchBITcWmr+HPRuAcaxZbtvkh7Fsh4qwTtCmPK7zYm1hCUOVzFeXS77Bm6YK9
 Fnm2DmqTfWD4xg0JRzEaCsJeT+n3Y+A=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-ivi7zH6HN5CjIRQI2pjSLw-1; Fri, 01 Jul 2022 00:11:14 -0400
X-MC-Unique: ivi7zH6HN5CjIRQI2pjSLw-1
Received: by mail-pg1-f200.google.com with SMTP id
 h13-20020a63e14d000000b0040df75eaa2eso674503pgk.21
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 21:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcE4HKUS/zGPU3V1uco9o/HdjFxdl7qgPAB2/4abOs8=;
 b=Lg8PovisJ1BCHEHke17tSWfc6v6Cn3DCDvIW9+71R+1k9Tj1cni3GJl3vqBVPcbhmn
 bbZmqXc6KgoabH5ea/pB8YxCTuvS/CTRncw9bqB/XhDolRJsgVWImhSclwTXwhDMigq3
 DH2eYuohu8svpPuLR0txbzsI+lPj8Me5ugIDWQ4JOHv3l8wTKHAWzNFBAOG6FBJm0Mx0
 mPxBBkqtVqB7kVLmsiQzzfDCKZBIjLR+jU+u865lrbzJtLNOTx/E3zNddLG0WEBL+8o2
 LjTTJUR1QBfuA+I67fUCl+wwM+r30x/PmxHtMn/d0KqDA0k2/l7dDSSIMQSzOfGDKueo
 J9kQ==
X-Gm-Message-State: AJIora92TyheyMAAcIuAb217O1IEjkYxvUvKTfpWWbB1VKituj0g7XS1
 F1qSNIxzDItbEmtVQi0tmugYdL7kIa5JzvMBIf8Cgg9tJrRNdml18UBz/Diji42EREcdmDj9yc6
 4sDUr1zQ0K/mQ6hc/zFIb4g+n5zVbq1k=
X-Received: by 2002:a17:90b:3e89:b0:1ee:195e:abaf with SMTP id
 rj9-20020a17090b3e8900b001ee195eabafmr16553249pjb.112.1656648672971; 
 Thu, 30 Jun 2022 21:11:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uD5s1OAkdsAPrJucS7I5SPZR88UvzBU6JiHvzlhQ+StlEL3NVbo0fkhbuQY9FB3mG1yULRgT+s7qR3KoD8t6I=
X-Received: by 2002:a17:90b:3e89:b0:1ee:195e:abaf with SMTP id
 rj9-20020a17090b3e8900b001ee195eabafmr16553228pjb.112.1656648672698; Thu, 30
 Jun 2022 21:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220624082730.246924-1-pbonzini@redhat.com>
 <9d4d83cc-d4e5-6b8e-2ed9-00cefb534082@linaro.org>
 <CABgObfa+RqJigqdzq1CJjVyCOh2GUT9CH4YJfDxobXPDi87n5Q@mail.gmail.com>
 <CAFEAcA_g3shtZ-AzzYh=Cie4X-0p5=ngx=SMQ1JUHSXPZNs=WA@mail.gmail.com>
 <ddfe5685-83c3-a402-46c8-0c759cf008cf@linaro.org>
In-Reply-To: <ddfe5685-83c3-a402-46c8-0c759cf008cf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 1 Jul 2022 06:11:00 +0200
Message-ID: <CABgObfY3EcP_8LUOA1LwPUbBUteRdamOvTnV23i3+nQV6FO5Ag@mail.gmail.com>
Subject: Re: [PULL 00/14] (Mostly) build system changes for 2022-06-24
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a77f3105e2b6936a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000a77f3105e2b6936a
Content-Type: text/plain; charset="UTF-8"

Il ven 1 lug 2022, 02:26 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> >> Does that mean that Ubuntu installs GCC without a 32-bit libgcc.a?
> >
> > I think they package it in a separate package, eg lib32gcc-9-dev
> > (adjust package name to suit gcc version).
>
> It's there, as Peter says, but it's not installed with the build-essential
> meta-package,
> and the crossbuild-essential-i386 package installs a different libgcc.
>

Ok I will try using ld -r to detect the presence of libgcc.

Paolo


>
> r~
>
>

--000000000000a77f3105e2b6936a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 1 lug 2022, 02:26 Richard Henderson &lt;<a href=
=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;&gt; Does that m=
ean that Ubuntu installs GCC without a 32-bit libgcc.a?<br>
&gt; <br>
&gt; I think they package it in a separate package, eg lib32gcc-9-dev<br>
&gt; (adjust package name to suit gcc version).<br>
<br>
It&#39;s there, as Peter says, but it&#39;s not installed with the build-es=
sential meta-package, <br>
and the crossbuild-essential-i386 package installs a different libgcc.<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ok I =
will try using ld -r to detect the presence of libgcc.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--000000000000a77f3105e2b6936a--


