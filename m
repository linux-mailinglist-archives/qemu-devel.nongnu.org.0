Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A76FC7E9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:30:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNQ9-0002Zl-Va; Tue, 09 May 2023 09:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pwNQ7-0002WV-DC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:30:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pwNQ5-0001Pm-KN
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683639020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4qBJkx/evb7ETu0xXign7JlG0HEFXx48fVec5jOVDo=;
 b=goWXUEJItOTqqX/Mg218c/ehFX71XB3rgaatYB0OqUWZymzV9Nfu8ZWETA6CT0MOELvwvr
 keVQpTmwBC4uJyDdSQ67dS1zGDcATgrpJpKr8rhCPgnAk+WV9jks/akC79xrRI2K1Nm3Su
 ouGqndbySNRd8j5b6zBR16ThG3vqW4M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-Ht2orhujNjuwUPPnibIRfQ-1; Tue, 09 May 2023 09:30:19 -0400
X-MC-Unique: Ht2orhujNjuwUPPnibIRfQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bc88edf7eso5620625a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683639018; x=1686231018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/4qBJkx/evb7ETu0xXign7JlG0HEFXx48fVec5jOVDo=;
 b=BD0Nip3isCQamc6lD0XkasYBkc6WebzbDXzP9UaXDuaSEiPRFjKRIetlCwVf4QqOGA
 s6SpPzLbi7tce3GNVmb/1tPCDuY3NnwLT46n5wjgQ1zlsu61E0Ms32aq0rnSBtHHAtTF
 ODyc9GucVNm8hsT2ksJuIgCL9jVr+Ab39TwsLuhr7rQFy6USIh5jCd+usPgiGP4tELQx
 +/IlI2l9BnKaGfuHKR2c+yG+8grrpiEErtxNWh/2anovsaZjOqlJUHNS5VgvLE++13U+
 AgFYxzh4+E+F4HJRBCV9Mp/588K1T+OXemndQl+9txHC1Dnd2se+lyk2VPCuNfBBpnZ9
 2Y3A==
X-Gm-Message-State: AC+VfDyQUFaK5KWTEN9+VO75FSnzbGUiGckbYgjzexyI2HQzc/Q4EGzG
 Su8WKE24Ekqnyh1cr3jU51u5ArPaStLliPnabddsZBnYRankWO0X/mstIA2BZa6ew93WmbchLgS
 KNtxDsQgVQ6H7HKnYSyFZIVAjBHVDcMw=
X-Received: by 2002:a17:907:1c19:b0:959:8cbe:63a5 with SMTP id
 nc25-20020a1709071c1900b009598cbe63a5mr14947620ejc.44.1683639018106; 
 Tue, 09 May 2023 06:30:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Ahov2kvtaHqMdMZMzj1K4Z6LJ/M/mZIUgyIPiaXlytrjjPI9wZx+ldB6jFXg11tPbT2GRe6ewfl4KOW+T+cM=
X-Received: by 2002:a17:907:1c19:b0:959:8cbe:63a5 with SMTP id
 nc25-20020a1709071c1900b009598cbe63a5mr14947589ejc.44.1683639017758; Tue, 09
 May 2023 06:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230502135548.2451309-1-peter.maydell@linaro.org>
 <CAMxuvayLKQAaRyZZXdgKvAJtgwRcxsFUnQ-S5yB8qBRvJrgrRg@mail.gmail.com>
 <CAFEAcA8OBka2yGWpktMRyW2fNaLjg7PtPd7F=+C6EGc6uKVetw@mail.gmail.com>
In-Reply-To: <CAFEAcA8OBka2yGWpktMRyW2fNaLjg7PtPd7F=+C6EGc6uKVetw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 9 May 2023 17:30:05 +0400
Message-ID: <CAMxuvayzgOxZ=ieYaRx1RD+eb_2i0ssXdYXhQfMsSu-wpSkFjg@mail.gmail.com>
Subject: Re: [PATCH] ui: Fix pixel colour channel order for PNG screenshots
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Kshitij Suri <kshitij.suri@nutanix.com>
Content-Type: multipart/alternative; boundary="00000000000095714505fb42c187"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--00000000000095714505fb42c187
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter

On Tue, May 9, 2023 at 5:12=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Tue, 2 May 2023 at 20:36, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> >
> >
> > On Tue, May 2, 2023 at 5:56=E2=80=AFPM Peter Maydell <peter.maydell@lin=
aro.org>
> wrote:
> >>
> >> When we take a PNG screenshot the ordering of the colour channels in
> >> the data is not correct, resulting in the image having weird
> >> colouring compared to the actual display.  (Specifically, on a
> >> little-endian host the blue and red channels are swapped; on
> >> big-endian everything is wrong.)
> >>
> >> This happens because the pixman idea of the pixel data and the libpng
> >> idea differ.  PIXMAN_a9r8g8b8 defines that pixels are 32-bit values,
> >> with A in bits 24-31, R in bits 16-23, G in bits 8-15 and B in bits
> >> 0-7.  This means that on little-endian systems the bytes in memory
> >> are
> >>    B G R A
> >> and on big-endian systems they are
> >>    A R G B
> >>
> >> libpng, on the other hand, thinks of pixels as being a series of
> >> values for each channel, so its format PNG_COLOR_TYPE_RGB_ALPHA
> >> always wants bytes in the order
> >>    R G B A
> >>
> >> This isn't the same as the pixman order for either big or little
> >> endian hosts.
> >>
> >> The alpha channel is also unnecessary bulk in the output PNG file,
> >> because there is no alpha information in a screenshot.
> >>
> >> To handle the endianness issue, we already define in ui/qemu-pixman.h
> >> various PIXMAN_BE_* and PIXMAN_LE_* values that give consistent
> >> byte-order pixel channel formats.  So we can use PIXMAN_BE_r8g8b8 and
> >> PNG_COLOR_TYPE_RGB, which both have an in-memory byte order of
> >>     R G B
> >> and 3 bytes per pixel.
> >>
> >> (PPM format screenshots get this right; they already use the
> >> PIXMAN_BE_r8g8b8 format.)
> >>
> >> Cc: qemu-stable@nongnu.org
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1622
> >> Fixes: 9a0a119a382867 ("Added parameter to take screenshot with
> screendump as PNG")
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Thanks; shall I take this via target-arm.next, or would you
> prefer to take it via the UI queue (with the commit message
> typo fixed) ?
>
>
feel free to take it, thanks

--00000000000095714505fb42c187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 5:12=
=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">p=
eter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, 2 May 2023 at 20:36, Marc-Andr=C3=A9 Lureau<=
br>
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, May 2, 2023 at 5:56=E2=80=AFPM Peter Maydell &lt;<a href=3D"ma=
ilto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</=
a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; When we take a PNG screenshot the ordering of the colour channels =
in<br>
&gt;&gt; the data is not correct, resulting in the image having weird<br>
&gt;&gt; colouring compared to the actual display.=C2=A0 (Specifically, on =
a<br>
&gt;&gt; little-endian host the blue and red channels are swapped; on<br>
&gt;&gt; big-endian everything is wrong.)<br>
&gt;&gt;<br>
&gt;&gt; This happens because the pixman idea of the pixel data and the lib=
png<br>
&gt;&gt; idea differ.=C2=A0 PIXMAN_a9r8g8b8 defines that pixels are 32-bit =
values,<br>
&gt;&gt; with A in bits 24-31, R in bits 16-23, G in bits 8-15 and B in bit=
s<br>
&gt;&gt; 0-7.=C2=A0 This means that on little-endian systems the bytes in m=
emory<br>
&gt;&gt; are<br>
&gt;&gt;=C2=A0 =C2=A0 B G R A<br>
&gt;&gt; and on big-endian systems they are<br>
&gt;&gt;=C2=A0 =C2=A0 A R G B<br>
&gt;&gt;<br>
&gt;&gt; libpng, on the other hand, thinks of pixels as being a series of<b=
r>
&gt;&gt; values for each channel, so its format PNG_COLOR_TYPE_RGB_ALPHA<br=
>
&gt;&gt; always wants bytes in the order<br>
&gt;&gt;=C2=A0 =C2=A0 R G B A<br>
&gt;&gt;<br>
&gt;&gt; This isn&#39;t the same as the pixman order for either big or litt=
le<br>
&gt;&gt; endian hosts.<br>
&gt;&gt;<br>
&gt;&gt; The alpha channel is also unnecessary bulk in the output PNG file,=
<br>
&gt;&gt; because there is no alpha information in a screenshot.<br>
&gt;&gt;<br>
&gt;&gt; To handle the endianness issue, we already define in ui/qemu-pixma=
n.h<br>
&gt;&gt; various PIXMAN_BE_* and PIXMAN_LE_* values that give consistent<br=
>
&gt;&gt; byte-order pixel channel formats.=C2=A0 So we can use PIXMAN_BE_r8=
g8b8 and<br>
&gt;&gt; PNG_COLOR_TYPE_RGB, which both have an in-memory byte order of<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0R G B<br>
&gt;&gt; and 3 bytes per pixel.<br>
&gt;&gt;<br>
&gt;&gt; (PPM format screenshots get this right; they already use the<br>
&gt;&gt; PIXMAN_BE_r8g8b8 format.)<br>
&gt;&gt;<br>
&gt;&gt; Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qe=
mu-stable@nongnu.org</a><br>
&gt;&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues=
/1622" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project=
/qemu/-/issues/1622</a><br>
&gt;&gt; Fixes: 9a0a119a382867 (&quot;Added parameter to take screenshot wi=
th screendump as PNG&quot;)<br>
&gt;&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Thanks; shall I take this via target-arm.next, or would you<br>
prefer to take it via the UI queue (with the commit message<br>
typo fixed) ?<br>
<br></blockquote><div>=C2=A0</div><div>feel free to take it, thanks<br></di=
v></div></div>

--00000000000095714505fb42c187--


