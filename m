Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771BB525371
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:21:00 +0200 (CEST)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCUl-0000KI-2p
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npCKW-00047I-JV
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npCKT-0002ik-Tn
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652375420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3Tg7yyDWay+OGFm13gtLJrW4A1x4BcuwiGqDIKkAk0=;
 b=eOxpTA35e2xPAVnhZI1T1FcqMgDdPWoXCHV3PLj5oFWkDRNfOtfEZmPWIqxfh1oIny0Jf9
 NYgtU/LatjrOu/z3jIJEq1Y0jvU496Wak78D4F5M9n0MRdTVJMZtIId+jP8QQCTFe0nYKF
 Bo4x+RGEGxc/Gz5dryADtLLqDUgs5to=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-PULMP_-XN1Sg5AbBauuTdA-1; Thu, 12 May 2022 13:10:19 -0400
X-MC-Unique: PULMP_-XN1Sg5AbBauuTdA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2f7dbceab08so50040537b3.10
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3Tg7yyDWay+OGFm13gtLJrW4A1x4BcuwiGqDIKkAk0=;
 b=ie8xq6/DPaqD7MKQjskTO5yY2BittMuPQelckewP4YXPXX4A5Kwtse7FfNCXKYR4ng
 hsmhuxY05EdiXB8c0DYln5DCpW8qH093EErPxs8z4EZSMoHA4YjICSMiEiaUSPzvzRM6
 12cm0YRmF08EcDqzMtgIiTScT3YGGrGLxg9twIW7tT8pHfmWKRTSHDI0PDjjeodR2e2L
 ZE839nX/gapIWHNinKlfyGqUjwXJ12A02b0VsWSWy+huFJpZeme389h82WGH2/lq+xq5
 4aEKLD5hmfukubzmmqEw4/G100MEIq4e61YQr11Uz5oLS+eJcTeVlqpkwjZHiat/ppHb
 JfPA==
X-Gm-Message-State: AOAM533fAbVCZHWmcHHSxc46jz6qt0bfFyWx7vR/CXCijuyL467GmFcq
 MAs99dfI/zry+DM0feh6u5J1UQtXOJgR0UJ+cXm6GSvNwNhH2Ll53FlVhc1648aWgrcOpo/kDA+
 ppMPlHKpir/CGhFkcCzc3mj8SuIof67o=
X-Received: by 2002:a25:e20b:0:b0:64a:49ca:c53f with SMTP id
 h11-20020a25e20b000000b0064a49cac53fmr787871ybe.599.1652375418739; 
 Thu, 12 May 2022 10:10:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycfVQ/SOjFEvw3gRPVMpCTJbw6/kshKJDX9yxbKPTXG1EPi7yHfPpA/0W+uY5sTn8Y/oqZXPvmUCjnlksUVVE=
X-Received: by 2002:a25:e20b:0:b0:64a:49ca:c53f with SMTP id
 h11-20020a25e20b000000b0064a49cac53fmr787852ybe.599.1652375418552; Thu, 12
 May 2022 10:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220512154906.331399-1-kkostiuk@redhat.com>
 <CAMxuvaxsrPNdS928KtKghoFOHGi4nC3x7pRjN0v=LS5p4G0ADQ@mail.gmail.com>
In-Reply-To: <CAMxuvaxsrPNdS928KtKghoFOHGi4nC3x7pRjN0v=LS5p4G0ADQ@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 12 May 2022 20:10:07 +0300
Message-ID: <CAPMcbCr+dOeWTwmeAnaA_Lbjp6j3muNOoYpqLE1U=vKFeDw2Cg@mail.gmail.com>
Subject: Re: [PATCH] qga-vss: Add auto generated headers to dependencies
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000dbdd3c05ded3a1ce"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

--000000000000dbdd3c05ded3a1ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 12, 2022 at 8:00 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Thu, May 12, 2022 at 5:49 PM Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
> >
> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > ---
> >  qga/vss-win32/meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> > index 26c5dd6e0e..9483ccd3b8 100644
> > --- a/qga/vss-win32/meson.build
> > +++ b/qga/vss-win32/meson.build
> > @@ -7,7 +7,7 @@ link_args =3D cc.get_supported_link_arguments([
> >
> >  qga_vss =3D shared_module(
> >    'qga-vss',
> > -  ['requester.cpp', 'provider.cpp', 'install.cpp'],
> > +  ['requester.cpp', 'provider.cpp', 'install.cpp', genh],
>
> Looks fine, but could you tell which file was needed? (not qapi or
> trace files, I suppose, so what else?)
>

During the CI build I got the next error

[176/701] Compiling C++ object qga/vss-win32/qga-vss.dll.p/provider.cpp.obj
FAILED: qga/vss-win32/qga-vss.dll.p/provider.cpp.obj
fatal error: config-poison.h: No such file or directory


[180/701] Generating config-poison.h with a custom command (wrapped by
meson to capture output)


>
> >    name_prefix: '',
> >    cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor',
> '-Wno-non-virtual-dtor'],
> >    link_args: link_args,
> > --
> > 2.25.1
> >
>
>

--000000000000dbdd3c05ded3a1ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 12, 2022 at 8:00 PM Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marc=
andre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi<br>
<br>
On Thu, May 12, 2022 at 5:49 PM Konstantin Kostiuk &lt;<a href=3D"mailto:kk=
ostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qga/vss-win32/meson.build | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
&gt; index 26c5dd6e0e..9483ccd3b8 100644<br>
&gt; --- a/qga/vss-win32/meson.build<br>
&gt; +++ b/qga/vss-win32/meson.build<br>
&gt; @@ -7,7 +7,7 @@ link_args =3D cc.get_supported_link_arguments([<br>
&gt;<br>
&gt;=C2=A0 qga_vss =3D shared_module(<br>
&gt;=C2=A0 =C2=A0 &#39;qga-vss&#39;,<br>
&gt; -=C2=A0 [&#39;requester.cpp&#39;, &#39;provider.cpp&#39;, &#39;install=
.cpp&#39;],<br>
&gt; +=C2=A0 [&#39;requester.cpp&#39;, &#39;provider.cpp&#39;, &#39;install=
.cpp&#39;, genh],<br>
<br>
Looks fine, but could you tell which file was needed? (not qapi or<br>
trace files, I suppose, so what else?)<br></blockquote><div><br></div><div>=
During the CI build I got the next error<br><br>[176/701] Compiling C++ obj=
ect qga/vss-win32/qga-vss.dll.p/provider.cpp.obj<br>FAILED: qga/vss-win32/q=
ga-vss.dll.p/provider.cpp.obj<br>fatal error: config-poison.h: No such file=
 or directory<br><br><br>[180/701] Generating config-poison.h with a custom=
 command (wrapped by meson to capture output)</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 name_prefix: &#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 cpp_args: [&#39;-Wno-unknown-pragmas&#39;, &#39;-Wno-dele=
te-non-virtual-dtor&#39;, &#39;-Wno-non-virtual-dtor&#39;],<br>
&gt;=C2=A0 =C2=A0 link_args: link_args,<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000dbdd3c05ded3a1ce--


