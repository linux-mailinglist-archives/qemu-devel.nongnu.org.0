Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A826532B27
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 15:21:31 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntUTa-0005MJ-B7
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 09:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntUPh-0003Uh-AQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntUPf-0003yB-6Q
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653398246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vcn2E9B8LewD6NIuXTkS1aY2PjPVcsXCbjeM2nepacU=;
 b=PWmU1boLDVcPOZeNU2WwHnHxpLJa4WVOHcVgX7SnIkGc8D8OhoAkejvCi4PeEsif8eNUKN
 NO/cIH0s5Y2Se3vVrlPc58zGNqKFMzcb19EIJX5MUsi5R9h3gldLPdzij8ccgFzix0XpJN
 +jIF1uwOSeQVolG+xgr+e6dUJuAG3xU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-Q-nd2WC3OgWFX5FA63X7LQ-1; Tue, 24 May 2022 09:17:22 -0400
X-MC-Unique: Q-nd2WC3OgWFX5FA63X7LQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-30026cf9af8so19040917b3.3
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 06:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vcn2E9B8LewD6NIuXTkS1aY2PjPVcsXCbjeM2nepacU=;
 b=KF8g4O8IRk8/0A/Te5gadAku9uV8jAZvOzwri8G1j8hKmkoF7qyB9zwMySVDJuRmnV
 dIPj6SAuU6o/Tea4JqxjkGs96bH8OWfvymnPH+yAbyORkugUUJX7UpDBmkBK56b3mnd8
 oSkxE3CRasZ/KMHYm9BTM/YsNyPMpS07/w1j6R9f9yXHhfwCg4exZZGmsf5Ue8GsmLbB
 XIuQJWjPcrRlemnNTyRmvRWpdY/5JcNUIr7b/eDOolTehNe+8gFkNu7/mKad2B5j8gRc
 0F3ilaIcwUuhNC2X8pLDOrTzEKnzM2j8LYuZXH/yOhkzg+NEEQFIx91WzCcJkrUdVHUP
 ARAw==
X-Gm-Message-State: AOAM533cQnqT/tWbPCRd7jR3fVcT7sbMxh4Ii0JqtxmrpZ0nCsg8N1XX
 aolYOQzTDH96Gozl6n9tPMfBOzbof3Jmn9Q13v59lh6WTauTLvejeQzeBg7WfarRutKK4xjyptY
 38Sv4OTFXOwJAl5MXAgePbYyp/JJRpB0=
X-Received: by 2002:a81:5fd6:0:b0:2fe:c5d2:74e2 with SMTP id
 t205-20020a815fd6000000b002fec5d274e2mr27727764ywb.471.1653398242333; 
 Tue, 24 May 2022 06:17:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPoDDQ1Dr1oJisG11YW5IAITz2lTsIUlxhTUy7QGERCNzAJjpNQAn7l3jjXcm2A3n+LIv9bEC7yu10d9y2QLI=
X-Received: by 2002:a81:5fd6:0:b0:2fe:c5d2:74e2 with SMTP id
 t205-20020a815fd6000000b002fec5d274e2mr27727753ywb.471.1653398242154; Tue, 24
 May 2022 06:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
 <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
 <CAPMcbCr8_zgYcMQ9Q0GSQL-TgvOGY-q16sMoVNxBpvwG4JDEng@mail.gmail.com>
 <449f117b-32c9-e066-55dd-1208313bce3f@redhat.com>
In-Reply-To: <449f117b-32c9-e066-55dd-1208313bce3f@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 24 May 2022 16:17:11 +0300
Message-ID: <CAPMcbCpgyNnggdMTY9K3=nv_BBF8Fbsp_MoAQ6ubeUEA5-aL=A@mail.gmail.com>
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e5707105dfc1c604"
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

--000000000000e5707105dfc1c604
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 4:13 PM Thomas Huth <thuth@redhat.com> wrote:

> On 24/05/2022 15.00, Konstantin Kostiuk wrote:
> >
> >
> >
> >
> > On Tue, May 24, 2022 at 1:24 PM Thomas Huth <thuth@redhat.com
> > <mailto:thuth@redhat.com>> wrote:
> >
> >     On 24/05/2022 12.14, Marc-Andr=C3=A9 Lureau wrote:
> >      > Hi
> >      >
> >      > On Tue, May 24, 2022 at 12:02 PM Konstantin Kostiuk
> >     <kkostiuk@redhat.com <mailto:kkostiuk@redhat.com>> wrote:
> >      >>
> >      >> Hi Richard and Marc-Andr=C3=A9
> >      >>
> >      >> I looked into the compilation problem and have 2 solutions:
> >      >> 1. We can add some conditions to the win2qemu definition and
> >      >> skip NVME support when old mingw-headers are used.
> >      >> 2. We can bump the version of the Fedora docker image to 36 or =
37
> >      >> that is used for cross-compilation tests.
> >      >>
> >      >> I think the second option is more valuable because we remove
> >      >> pregenerated qga-vss.tlb file and now we can check VSS build on=
ly
> >      >> at Fedora 37.
> >      >>
> >      >> What do you think?
> >      >
> >      > I'd try to do both: fix compilation with older headers, and bump
> our
> >      > CI to f36. I don't know if our windows build environment has
> strict
> >      > requirements like the unix/distro (build on old-stable for 2y).
> >
> >     See
> https://www.qemu.org/docs/master/about/build-platforms.html#windows
> >     <https://www.qemu.org/docs/master/about/build-platforms.html#window=
s>
> :
> >
> >     "The project supports building QEMU with current versions of the
> MinGW
> >     toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on
> Windows."
> >
> >     Since Fedora 35 is still a supported build host, I think you should
> make
> >     sure that it works with the MinGW toolchain from that distro, too.
> >
> >
> > Currently, CI uses Fedora 33 which is already EOL. Fedora 35 has update=
d
> > mingw-headers and the current version of code compiles without any
> errors.
> > So if we want to support only Fedora 35+, we can just bump the CI docke=
r
> image.
>
> Ah, right, I was looking at the wrong file. So yes, in that case, please
> simply update the docker image.
>
> What about Debian (since this is mentioned on the support page, too)? I
> think we don't have to worry about Debian 10 anymore, since Debian 10 wil=
l
> already be EOL once we release QEMU 7.1 ... but what about Debian 11? Do
> the
> MinGW packages there contain the updated headers, too?
>

As I know we do not test cross-compilation at Debian. Debian does not have
even mingw-glib2. Debian only has the mingw-gcc toolkit.


>
>   Thomas
>
>

--000000000000e5707105dfc1c604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 24, 2022 at 4:13 PM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 24/05/202=
2 15.00, Konstantin Kostiuk wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Tue, May 24, 2022 at 1:24 PM Thomas Huth &lt;<a href=3D"mailto:thut=
h@redhat.com" target=3D"_blank">thuth@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 24/05/2022 12.14, Marc-Andr=C3=A9 Lureau wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Tue, May 24, 2022 at 12:02 PM Konstantin K=
ostiuk<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:kkostiuk@redhat.com" target=
=3D"_blank">kkostiuk@redhat.com</a> &lt;mailto:<a href=3D"mailto:kkostiuk@r=
edhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Hi Richard and Marc-Andr=C3=A9<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I looked into the compilation problem and=
 have 2 solutions:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 1. We can add some conditions to the win2=
qemu definition and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; skip NVME support when old mingw-headers =
are used.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 2. We can bump the version of the Fedora =
docker image to 36 or 37<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; that is used for cross-compilation tests.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I think the second option is more valuabl=
e because we remove<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; pregenerated qga-vss.tlb file and now we =
can check VSS build only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; at Fedora 37.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; What do you think?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;d try to do both: fix compilation with =
older headers, and bump our<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; CI to f36. I don&#39;t know if our windows bu=
ild environment has strict<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; requirements like the unix/distro (build on o=
ld-stable for 2y).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0See <a href=3D"https://www.qemu.org/docs/master/abo=
ut/build-platforms.html#windows" rel=3D"noreferrer" target=3D"_blank">https=
://www.qemu.org/docs/master/about/build-platforms.html#windows</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.qemu.org/docs/master/abo=
ut/build-platforms.html#windows" rel=3D"noreferrer" target=3D"_blank">https=
://www.qemu.org/docs/master/about/build-platforms.html#windows</a>&gt; :<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;The project supports building QEMU with curre=
nt versions of the MinGW<br>
&gt;=C2=A0 =C2=A0 =C2=A0toolchain, either hosted on Linux (Debian/Fedora) o=
r via MSYS2 on Windows.&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Since Fedora 35 is still a supported build host, I =
think you should make<br>
&gt;=C2=A0 =C2=A0 =C2=A0sure that it works with the MinGW toolchain from th=
at distro, too.<br>
&gt; <br>
&gt; <br>
&gt; Currently, CI uses Fedora 33 which is already EOL. Fedora 35 has updat=
ed<br>
&gt; mingw-headers and the current version of code compiles without any err=
ors.<br>
&gt; So if we want to support only Fedora 35+, we can just bump the CI dock=
er image.<br>
<br>
Ah, right, I was looking at the wrong file. So yes, in that case, please <b=
r>
simply update the docker image.<br>
<br>
What about Debian (since this is mentioned on the support page, too)? I <br=
>
think we don&#39;t have to worry about Debian 10 anymore, since Debian 10 w=
ill <br>
already be EOL once we release QEMU 7.1 ... but what about Debian 11? Do th=
e <br>
MinGW packages there contain the updated headers, too?<br></blockquote><div=
><br></div><div>As I know we do not test cross-compilation at Debian. Debia=
n does not have</div><div>even mingw-glib2. Debian only has the mingw-gcc t=
oolkit.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div>

--000000000000e5707105dfc1c604--


