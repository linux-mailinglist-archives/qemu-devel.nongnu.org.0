Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36A621B41
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 18:56:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osSph-00032c-BV; Tue, 08 Nov 2022 12:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1osSpd-00031p-S4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1osSpb-0007to-Mp
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667930174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f7gGRxmpVQesiTpTIh7e9lOawMYASsWy2NB6U4J2EZ0=;
 b=Pv2yAnzoC6VL2ZXY/YIF/A/lXDqhGliBtBXuzu/I7mgAWTQMsvSm6VsjdGuXrLhrlRq/KN
 Y0wae1ZF2CgtZef6fKzqBg33r6wwdSfrvr8kiCBNGgHTUqEOp8ywmOslprmzAGOPrK2157
 JIkTsOEdE/z8WllCK/TMH32c2yAAIyU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-q0nmOi4KNzKariAY514ETA-1; Tue, 08 Nov 2022 12:56:13 -0500
X-MC-Unique: q0nmOi4KNzKariAY514ETA-1
Received: by mail-oo1-f69.google.com with SMTP id
 a29-20020a4a9b1d000000b00480db71d44bso3956080ook.7
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 09:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f7gGRxmpVQesiTpTIh7e9lOawMYASsWy2NB6U4J2EZ0=;
 b=Q2iQ6cXyd3ZQ7msH9VkRq/6KHJLkad9ercYlABIBdrs8PMrhE1gG0IQpEoM81T4PeK
 Brqpgs14C2MnrpVtWAy49yWOI7m/+HikTmDh//YqvKWXc2U3J95OTcfK3KdvOhkcb+r6
 J25UulJVwbzemaw5YOqhNQXlPMjZJASzTP97DO8fruuzJlaNUcuWixgaKFe6G1EIOPy/
 tL3rQ2l6xSxnR5iRLsAnuPfD22ks5hwo5OnTxhaoRyqplCkE/LAJvvtsNHPvRYtBC43e
 fGvKx+PMoDv4QkA92KZ0DzahqYDD4STxXMuRcPIwpvKNup1yqiSRkwY3yj1dzpysTtrr
 cWWg==
X-Gm-Message-State: ACrzQf1wzMYr1BM7fmCiw3Z5SUkIelGXcJBXzxtP7YKSyMyLJZnZozX1
 2sb6Lj70AMlTnc+ZUPouxVVuS2cIkZxXOge6u2baIQEq6H7r0l98DzTgBNgGDE3lUw/REeWX1q6
 cesLqwBJH6FNBP22T1RlAc6EnGp3P6BA=
X-Received: by 2002:a9d:74da:0:b0:66c:7172:a71e with SMTP id
 a26-20020a9d74da000000b0066c7172a71emr19152356otl.332.1667930172106; 
 Tue, 08 Nov 2022 09:56:12 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6/eimlrdVmmds4ivQWVPU38k7BQQPZsEGLxYPHEYJI8Et3gu3w0faz+Jn/VKRluwNIyh47aF0NZ3R/K4Z7dP8=
X-Received: by 2002:a9d:74da:0:b0:66c:7172:a71e with SMTP id
 a26-20020a9d74da000000b0066c7172a71emr19152351otl.332.1667930171903; Tue, 08
 Nov 2022 09:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20221030222841.42377-1-philmd@linaro.org>
 <CAFEAcA-d=GrGNm9vhc6Q-UnQAQt+RLnwRj=dbif=iMKTRAabpQ@mail.gmail.com>
 <ed6dcb59-a936-e254-4786-0630cbe80f0e@linaro.org>
 <6a8ecf61-e6c6-62fb-60e1-d4bf9fcf67e3@redhat.com>
 <80cb567b-cd68-42e4-6408-523c96909695@linaro.org>
In-Reply-To: <80cb567b-cd68-42e4-6408-523c96909695@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Nov 2022 19:56:00 +0200
Message-ID: <CAPMcbCocAh4W=rx8NEBDLnF6Z1_sK3OKmg7WZr2RDY6Jo93rBg@mail.gmail.com>
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>, 
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, 
 Stefan Pejic <stefan.pejic@syrmia.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000068219e05ecf94185"
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

--00000000000068219e05ecf94185
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2022 at 5:23 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg>
wrote:

> On 8/11/22 16:09, Thomas Huth wrote:
> > On 08/11/2022 15.23, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 8/11/22 14:59, Peter Maydell wrote:
>
> >>> Was this the last use of C++ in the tree, or am I forgetting
> >>> some other part that still needs the C++ compiler?
> >>>
> >>> If it is the last thing, we should put in the "Build Dependencies"
> >>> part of the release notes that a C++ compiler is no longer required
> >>> and mention that the configure options to specify it will go away in
> >>> a future release.
> >>
> >> I guess the last use is from the Guest Agent on Windows...
> >>
> >> $ git ls-files | fgrep .cpp
> >> qga/vss-win32/install.cpp
> >> qga/vss-win32/provider.cpp
> >> qga/vss-win32/requester.cpp
> >
> > Yes, I think the c++ configure options are still required for that
> > Windows stuff ... but IIRC Paolo once mentioned that we could simplify
> > the linker logic in configure or meson.build once the nanomips stuff ha=
s
> > been converted, since we now do not have to mix C and C++ linkage
> anymore?
>
> Oh I guess I got it, we only need to link qga.exe as a standalone binary
> unrelated to the qemu-system/user binaries, so we can simplify most of
> the linkage?
>
>
Hi All,

Currently, we need C++ only for the VSS part of Windows Guest Agent.
Anyway, the VSS source is fully based on Windows API, so in general,
we can rewrite it to C.

Best Regards,
Konstantin Kostiuk.

--00000000000068219e05ecf94185
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 8, 2022 at 5:23 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 8/11/22 16:09, Thomas Huth wrote:<br>
&gt; On 08/11/2022 15.23, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; On 8/11/22 14:59, Peter Maydell wrote:<br>
<br>
&gt;&gt;&gt; Was this the last use of C++ in the tree, or am I forgetting<b=
r>
&gt;&gt;&gt; some other part that still needs the C++ compiler?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If it is the last thing, we should put in the &quot;Build Depe=
ndencies&quot;<br>
&gt;&gt;&gt; part of the release notes that a C++ compiler is no longer req=
uired<br>
&gt;&gt;&gt; and mention that the configure options to specify it will go a=
way in<br>
&gt;&gt;&gt; a future release.<br>
&gt;&gt;<br>
&gt;&gt; I guess the last use is from the Guest Agent on Windows...<br>
&gt;&gt;<br>
&gt;&gt; $ git ls-files | fgrep .cpp<br>
&gt;&gt; qga/vss-win32/install.cpp<br>
&gt;&gt; qga/vss-win32/provider.cpp<br>
&gt;&gt; qga/vss-win32/requester.cpp<br>
&gt; <br>
&gt; Yes, I think the c++ configure options are still required for that <br=
>
&gt; Windows stuff ... but IIRC Paolo once mentioned that we could simplify=
 <br>
&gt; the linker logic in configure or meson.build once the nanomips stuff h=
as <br>
&gt; been converted, since we now do not have to mix C and C++ linkage anym=
ore?<br>
<br>
Oh I guess I got it, we only need to link qga.exe as a standalone binary<br=
>
unrelated to the qemu-system/user binaries, so we can simplify most of<br>
the linkage?<br>
<br></blockquote><div><br></div><div><div>Hi All,</div><div><br></div><div>=
Currently, we need C++ only for the VSS part of Windows Guest Agent.</div><=
div>Anyway, the VSS source is fully based on Windows API, so in general, <b=
r>we can rewrite it to C.</div><div><br></div><div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konst=
antin Kostiuk.</div></div></div></div></div></div><div>=C2=A0</div></div></=
div>

--00000000000068219e05ecf94185--


