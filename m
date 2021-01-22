Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F467300DF7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:45:26 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33J7-0004hI-CT
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l33Hw-0004Ga-Qt
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:44:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l33Ht-0002CX-ME
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOK+TVbmfP0HVikG2mLfqzz96s1qSsdI7ZjRzbaK3D0=;
 b=Cxwc96rylXrdNr0uax19OllaOBnK4wNkQpPHQ0oNhZ7eFqpf2m0AjpE4I4WfgPznp48cya
 3akWBKtzHpb0r1EoLW61dUBS5ei62kFuJvkhfSPha8wXK/+ElM2nY1dRpYJ1gSsSzEe/D2
 wfRofv3y29131977vJF/rmRwt67ZSRA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-KnZKnisdPT-gSe7Vv_W4rA-1; Fri, 22 Jan 2021 15:44:06 -0500
X-MC-Unique: KnZKnisdPT-gSe7Vv_W4rA-1
Received: by mail-pl1-f199.google.com with SMTP id t14so3709527plr.15
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SOK+TVbmfP0HVikG2mLfqzz96s1qSsdI7ZjRzbaK3D0=;
 b=hsXoPhbqGd1Qw9eZEYo2qWuTvLlgwWdAzewdVfh8EtL8RRCgsKIx+ACqa92xPgOjFQ
 tQpi58fmM1pX5CF0zTk2+whAppw6bwd724Id/NJxb+2coQMfWHmq0YhxQzBcWKGPGgc2
 inhtRl1GXfSHryS3UsWjavOcFlW11yMp/0CG4R6efePf1X9/ZIu7liWoaFEYLEPwBsL5
 JGg+ZjF3P7xKHAMtrnlZyfpzXAC9ZvD19UdULTQzV/gQKq8ZXKtiF36ydWw7J3ZTmixQ
 gRjBjD7E4mRLFgHfFbVd+Fv5WEfO2RGjwkr2SDT7c80dAtM6LT4HGwqYonuWMhGM5vWK
 WI6g==
X-Gm-Message-State: AOAM530tfp/iiUYE/NofzMo2gozAIjgcZ/LmOf/ooHkOlRePSYHRwLv1
 Lmws8bklA8DUc926eboKrA1BGz0Ug+7wCIwKnSgSx3Kg0aU8jZNyBWYFhjMatMmuVqD2EWC9FKJ
 M8kkzhzHuFWvXEH1iBYH32qggfqV+8tE=
X-Received: by 2002:a63:cb06:: with SMTP id p6mr6301746pgg.146.1611348245465; 
 Fri, 22 Jan 2021 12:44:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+T4P5/bni7VuDCsKFi4h0hSCpGb0YW2MAL2udEpKY+TFCl1O45UFNzhT6A1WKL3dB1d2a94+sP7m3NSxTZB8=
X-Received: by 2002:a63:cb06:: with SMTP id p6mr6301723pgg.146.1611348245188; 
 Fri, 22 Jan 2021 12:44:05 -0800 (PST)
MIME-Version: 1.0
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-9-pbonzini@redhat.com>
 <20210113103143.GA1568240@redhat.com>
 <50a309ed-64a3-6d17-9edb-6274abb4e498@redhat.com>
 <CAE2XoE9gag5J7reaQPaovto6HDvDPaGOJCSGeModiXVr5p7chg@mail.gmail.com>
In-Reply-To: <CAE2XoE9gag5J7reaQPaovto6HDvDPaGOJCSGeModiXVr5p7chg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 22 Jan 2021 21:43:53 +0100
Message-ID: <CABgObfa0A_q3_Hev49hT5SHPNvxaE1TrLJ4QPagM5n3g-8P5xw@mail.gmail.com>
Subject: Re: [PATCH 8/8] configure: automatically parse command line for meson
 -D options
To: Yonggang Luo <luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c3a40605b9833f23"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c3a40605b9833f23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 22 gen 2021, 09:00 =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <luoyon=
ggang@gmail.com> ha
scritto:

> Hi Paolo, as python and meson are required dependencies to building qemu
> now,
> can we detecting python/meson at the very begining of configure,
> even before the --help parameter.
>

We could and I did it in the first version. However it's ugly that the user
has to use --python on some setups in order to get a full help message.

Paolo


> On Wed, Jan 13, 2021 at 6:08 AM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> >
> > On 13/01/21 11:31, Daniel P. Berrang=C3=A9 wrote:
> > >>   meson-buildoptions.json                 | 717
> ++++++++++++++++++++++++
> > > I'm not a fan of seeing this file introduced as it has significant
> > > overlap with meson_options.txt.    I feel like the latter has enough
> > > information present to do an acceptable job for help output. After
> > > all that's sufficient if we were using meson directly.
> >
> > Sorry, I missed this remark.  meson-buildoptions.json is not
> > hand-written.  It is the result of Meson's own parsing meson_options.tx=
t
> > exported as JSON.
> >
> > In the commit message "because we parse command-line options before
> > meson is available, the introspection output is stored in the source
> > tree.  This is the reason for the unattractive diffstat; the number of
> > JSON lines added is higher than the number of configure lines removed.
> > Of course the latter are code that must be maintained manually and the
> > former is not".
> >
> > Paolo
> >
> >
>
>
> --
>          =E6=AD=A4=E8=87=B4
> =E7=A4=BC
> =E7=BD=97=E5=8B=87=E5=88=9A
> Yours
>     sincerely,
> Yonggang Luo
>

--000000000000c3a40605b9833f23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 22 gen 2021, 09:00 =E7=BD=97=E5=8B=87=E5=88=9A(=
Yonggang Luo) &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmai=
l.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Hi Paolo, as python and meson are required dependencies to buildin=
g qemu now,<div>can we detecting python/meson at the very begining of confi=
gure,</div><div>even before the --help parameter.<br></div></div></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">We could and I=
 did it in the first version. However it&#39;s ugly that the user has to us=
e --python on some setups in order to get a full help message.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div><br>On Wed, Jan 13, 2021 at 6:08 AM Paolo Bonzini=
 &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"norefe=
rrer">pbonzini@redhat.com</a>&gt; wrote:<br>&gt;<br>&gt; On 13/01/21 11:31,=
 Daniel P. Berrang=C3=A9 wrote:<br>&gt; &gt;&gt; =C2=A0 meson-buildoptions.=
json =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 717 ++++++++=
++++++++++++++++<br>&gt; &gt; I&#39;m not a fan of seeing this file introdu=
ced as it has significant<br>&gt; &gt; overlap with meson_options.txt. =C2=
=A0 =C2=A0I feel like the latter has enough<br>&gt; &gt; information presen=
t to do an acceptable job for help output. After<br>&gt; &gt; all that&#39;=
s sufficient if we were using meson directly.<br>&gt;<br>&gt; Sorry, I miss=
ed this remark. =C2=A0meson-buildoptions.json is not<br>&gt; hand-written.=
=C2=A0 It is the result of Meson&#39;s own parsing meson_options.txt<br>&gt=
; exported as JSON.<br>&gt;<br>&gt; In the commit message &quot;because we =
parse command-line options before<br>&gt; meson is available, the introspec=
tion output is stored in the source<br>&gt; tree.=C2=A0 This is the reason =
for the unattractive diffstat; the number of<br>&gt; JSON lines added is hi=
gher than the number of configure lines removed.<br>&gt; Of course the latt=
er are code that must be maintained manually and the<br>&gt; former is not&=
quot;.<br>&gt;<br>&gt; Paolo<br>&gt;<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=
=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>
</blockquote></div></div></div>

--000000000000c3a40605b9833f23--


