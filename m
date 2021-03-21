Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3273433D6
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:45:50 +0100 (CET)
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO297-0004uT-H0
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lO26v-0004IF-Cv
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:43:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lO26p-0000a8-FM
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616348606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eYl8txpYyrbTkyfDbBJrcwr4ZhztxhucjonWvKGQg9E=;
 b=gsbiwl9QJFMaRpjBgajiGJAyI3FB0qps0LSQUkLdJkzSfEZE2ZAlx5ni/sKq4oooRS/Afn
 eH2GopfBhwDPee0D7GcQgEdqoF5ltditBcJ396eSNhVJTuo7tFU0AbclyHo0epSCn9+MqK
 OHlSnen4WnVRvnnrKkHvokno0qa02vM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-TQPHSVJNNuW4R7AMSTAafg-1; Sun, 21 Mar 2021 13:43:22 -0400
X-MC-Unique: TQPHSVJNNuW4R7AMSTAafg-1
Received: by mail-pl1-f197.google.com with SMTP id n12so23391448plf.12
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 10:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYl8txpYyrbTkyfDbBJrcwr4ZhztxhucjonWvKGQg9E=;
 b=MGuQRqmyt+Yg4uevr7fuOLT/3fVcUkKd9x2dJUaJMgE2RpHPeiOxVGPpINOxOy2HPL
 BXReIYqqLdiNLC06Te9lnjInB6Dmngn3oj3wU5gH57tp9T3gQbppkTLWmsU6iCTMtdhZ
 IzRRNQ6FkhZh3MzebJATg0bGy+WWdO+rxsY1bqR5NEvbIhtDeY/TZOuTHVVOh5JfebRm
 mA0baiy2/H1ictn0PeVwHxk7otdu3uXnWOTGxAQ5/pZd5nQHkvVjkPMEbUBu8F+YGhor
 MPyzb0Xim5YMe7DqujUj+nJjtb04yzh8vpJn7UOCworZKB+kz0pdVS6+DPtTL7dp1Ddy
 /tNw==
X-Gm-Message-State: AOAM530tO1wjvfz4Ryou1XCvp2ZKEBcjWmRpaE75TDkgBRLO0y/fA5dG
 WqR5f9mAZbH4lnnCd8UgbXE8h7FjwGBviw4f+IGuLHfjWjBlB4PskAR+KL1jJkJjIMioBWEsOmZ
 BpV8ETguyHPaXgwDgzTunR7Ozsojiw9A=
X-Received: by 2002:a17:902:e74f:b029:e5:fedb:92b9 with SMTP id
 p15-20020a170902e74fb02900e5fedb92b9mr23101504plf.67.1616348601158; 
 Sun, 21 Mar 2021 10:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW5LNxpu0pGsuU2TMe0YnNrv4qnymx1/+E5dtLNCHMGT2n1UG+oGPdkuYX4m5PveKbPHl0q1omTkFItgaI1nE=
X-Received: by 2002:a17:902:e74f:b029:e5:fedb:92b9 with SMTP id
 p15-20020a170902e74fb02900e5fedb92b9mr23101485plf.67.1616348600912; Sun, 21
 Mar 2021 10:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
 <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
In-Reply-To: <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 21 Mar 2021 18:43:08 +0100
Message-ID: <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000030e55e05be0f7c3b"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gavin Shan <gshan@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030e55e05be0f7c3b
Content-Type: text/plain; charset="UTF-8"

Il dom 21 mar 2021, 18:34 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> On 3/21/21 10:50 AM, Paolo Bonzini wrote:
> >     Another workaround may be to avoid compiling exec-vary.c with
> -flto.  I'm not
> >     sure that my meson fu is up to that.  Paolo?
> >
> > You would have to define a static library.
>
> Ok.  With an extra -fno-lto flag, or can I somehow remove -flto from the
> library's cflags?  Or unset the meson b_lto variable?
>

-fno-lto should work, yes. b_lto tries to cater to other compilers, but we
don't support anything but gcc-like drivers.

>     I have filed a gcc bug report:
> >
> >     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
> >
> >     Hopefully someone can address that before gcc 11 gets released.  At
> which
> >     point we need do nothing in qemu.  Aldy?
>
> So, I've reproduced the testcase failure with gcc 9.3 (ubuntu 20.04) as
> well.
> Which means that there are at least two releases for which this has not
> worked.
>
> I think Gavin's runtime test is unnecessary.  We don't have to check the
> runtime results, we can just [ "$lto" = true ], and we fairly well know
> it'll fail.
>

Yeah, if anything the test can be used to re-enable attribute((alias)) once
we know there are some fixed compilers. (Though it's quite ugly to have
worse compilation when cross-compiling).

Paolo


>
> r~
>
>

--00000000000030e55e05be0f7c3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il dom 21 mar 2021, 18:34 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 3/21/21 10:50 AM=
, Paolo Bonzini wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Another workaround may be to avoid compiling exec-v=
ary.c with -flto.=C2=A0 I&#39;m not<br>
&gt;=C2=A0 =C2=A0 =C2=A0sure that my meson fu is up to that.=C2=A0 Paolo?<b=
r>
&gt; <br>
&gt; You would have to define a static library.<br>
<br>
Ok.=C2=A0 With an extra -fno-lto flag, or can I somehow remove -flto from t=
he <br>
library&#39;s cflags?=C2=A0 Or unset the meson b_lto variable?<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">-fno-lto shou=
ld work, yes. b_lto tries to cater to other compilers, but we don&#39;t sup=
port anything but gcc-like drivers.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;=
=C2=A0 =C2=A0 =C2=A0I have filed a gcc bug report:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cg=
i?id=3D99696" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gcc.g=
nu.org/bugzilla/show_bug.cgi?id=3D99696</a><br>&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hopefully someone can address that before gcc 11 ge=
ts released.=C2=A0 At which<br>
&gt;=C2=A0 =C2=A0 =C2=A0point we need do nothing in qemu.=C2=A0 Aldy?<br><b=
r>
So, I&#39;ve reproduced the testcase failure with gcc 9.3 (ubuntu 20.04) as=
 well. <br>
Which means that there are at least two releases for which this has not wor=
ked.<br>
<br>
I think Gavin&#39;s runtime test is unnecessary.=C2=A0 We don&#39;t have to=
 check the <br>
runtime results, we can just [ &quot;$lto&quot; =3D true ], and we fairly w=
ell know it&#39;ll fail.<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Yeah, if anything the test can be used to re-enable=
 attribute((alias)) once we know there are some fixed compilers. (Though it=
&#39;s quite ugly to have worse compilation when cross-compiling).</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--00000000000030e55e05be0f7c3b--


