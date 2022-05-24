Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4D1532AD4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 15:07:34 +0200 (CEST)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntUG4-000351-Rk
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 09:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntU9T-0000wl-IX
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntU9M-0008Sd-4A
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653397234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rs2PA6n7+ljZRHyqaOmBttkMizJHJskhDScY9hiIO3o=;
 b=ZyvoDr36hA/LLh5oMUCPVL3PJ3CdQ14yj2Rqryq8S/GsZ7wnoScbtEE2uPhRwNNlxQFOUl
 E6PVp9M2RP8U++69LHV/XE+QCowoGJqETs8I9JTeOUVAdMGCD/j47GRUL7FOlvfR477zHy
 5kbF3qlfPPy+rZcUB7HLHWHBuQMBQyc=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-6jpCFRlQNcq1bILtLEBrUg-1; Tue, 24 May 2022 09:00:32 -0400
X-MC-Unique: 6jpCFRlQNcq1bILtLEBrUg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2ff37db94e8so150841557b3.16
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 06:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rs2PA6n7+ljZRHyqaOmBttkMizJHJskhDScY9hiIO3o=;
 b=LCpLhStgKARrX92nbvXJAlM/OtpNqCLmDZXjod7zvGSmsINlJob76HJx0uUt3oNDhg
 jYawD2BJp4ok246JDFXsF08AK1v44P2KY6wHVPFgAt07SwLPS72H2Dwx+eouwLApq2VX
 I9FTl+zRehRWCdpQGIuoGFv71K45m5C0wdRLeGbPw1fg5N9OtupHY6M3ce7LnwkrF6JG
 vXoOTu6t4IVDXwYyZ+5lBLUzMyAFbY/12iGu2YdSSELWubr45RHrGdyEkY1Zl2XcUKbv
 zNJkkg7DCHrR4LjjsDEej/dWx2UlSuE4N57kVtY1XCHoU/JRoEbbg5JImzMcgR7Cmuqc
 yC7g==
X-Gm-Message-State: AOAM533+DbEaH3ltcggs4GiWba0IkHL9AEYp69tJ+EKbymbJSU3/RWET
 KnB1UQNeTvTTzXmoikC8QHaL67JU24qLVPTlxlryyHELY/0YDAn/yycb5SLr2U9JmeVHZbltSjG
 etd4mQ9bwwTsbSjS5o05Pljtz1EjR0Ys=
X-Received: by 2002:a81:9387:0:b0:2f7:eb1b:d25e with SMTP id
 k129-20020a819387000000b002f7eb1bd25emr29134310ywg.402.1653397231622; 
 Tue, 24 May 2022 06:00:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMvPvRtKDyST4N09WQUBZrfSxTvjV540UtI3NaKU8mN+YBVB7CLok+7dW6r/2I40g5jcRb8K4nS44EJaIdvnU=
X-Received: by 2002:a81:9387:0:b0:2f7:eb1b:d25e with SMTP id
 k129-20020a819387000000b002f7eb1bd25emr29134261ywg.402.1653397231259; Tue, 24
 May 2022 06:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
 <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
In-Reply-To: <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 24 May 2022 16:00:20 +0300
Message-ID: <CAPMcbCr8_zgYcMQ9Q0GSQL-TgvOGY-q16sMoVNxBpvwG4JDEng@mail.gmail.com>
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a4662705dfc18a1d"
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

--000000000000a4662705dfc18a1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 1:24 PM Thomas Huth <thuth@redhat.com> wrote:

> On 24/05/2022 12.14, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, May 24, 2022 at 12:02 PM Konstantin Kostiuk <kkostiuk@redhat.co=
m>
> wrote:
> >>
> >> Hi Richard and Marc-Andr=C3=A9
> >>
> >> I looked into the compilation problem and have 2 solutions:
> >> 1. We can add some conditions to the win2qemu definition and
> >> skip NVME support when old mingw-headers are used.
> >> 2. We can bump the version of the Fedora docker image to 36 or 37
> >> that is used for cross-compilation tests.
> >>
> >> I think the second option is more valuable because we remove
> >> pregenerated qga-vss.tlb file and now we can check VSS build only
> >> at Fedora 37.
> >>
> >> What do you think?
> >
> > I'd try to do both: fix compilation with older headers, and bump our
> > CI to f36. I don't know if our windows build environment has strict
> > requirements like the unix/distro (build on old-stable for 2y).
>
> See https://www.qemu.org/docs/master/about/build-platforms.html#windows :
>
> "The project supports building QEMU with current versions of the MinGW
> toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows=
."
>
> Since Fedora 35 is still a supported build host, I think you should make
> sure that it works with the MinGW toolchain from that distro, too.
>

Currently, CI uses Fedora 33 which is already EOL. Fedora 35 has updated
mingw-headers and the current version of code compiles without any errors.
So if we want to support only Fedora 35+, we can just bump the CI docker
image.


>
>   Thomas
>
>

--000000000000a4662705dfc18a1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><br></div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, May 24, 2022 at 1:24 PM Thomas Huth &=
lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 24/05/2022 12.14,=
 Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Tue, May 24, 2022 at 12:02 PM Konstantin Kostiuk &lt;<a href=3D"mai=
lto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; Hi Richard and Marc-Andr=C3=A9<br>
&gt;&gt;<br>
&gt;&gt; I looked into the compilation problem and have 2 solutions:<br>
&gt;&gt; 1. We can add some conditions to the win2qemu definition and<br>
&gt;&gt; skip NVME support when old mingw-headers are used.<br>
&gt;&gt; 2. We can bump the version of the Fedora docker image to 36 or 37<=
br>
&gt;&gt; that is used for cross-compilation tests.<br>
&gt;&gt;<br>
&gt;&gt; I think the second option is more valuable because we remove<br>
&gt;&gt; pregenerated qga-vss.tlb file and now we can check VSS build only<=
br>
&gt;&gt; at Fedora 37.<br>
&gt;&gt;<br>
&gt;&gt; What do you think?<br>
&gt; <br>
&gt; I&#39;d try to do both: fix compilation with older headers, and bump o=
ur<br>
&gt; CI to f36. I don&#39;t know if our windows build environment has stric=
t<br>
&gt; requirements like the unix/distro (build on old-stable for 2y).<br>
<br>
See <a href=3D"https://www.qemu.org/docs/master/about/build-platforms.html#=
windows" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/mas=
ter/about/build-platforms.html#windows</a> :<br>
<br>
&quot;The project supports building QEMU with current versions of the MinGW=
 <br>
toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.&=
quot;<br>
<br>
Since Fedora 35 is still a supported build host, I think you should make <b=
r>
sure that it works with the MinGW toolchain from that distro, too.<br></blo=
ckquote><div><br></div><div>Currently, CI uses Fedora 33 which is already E=
OL. Fedora 35 has updated</div><div>mingw-headers and the current version o=
f code compiles without any errors.</div><div>So if we want to support only=
 Fedora 35+, we can just bump the CI docker image.<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div>

--000000000000a4662705dfc18a1d--


