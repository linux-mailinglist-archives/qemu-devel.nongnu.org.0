Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C433564A307
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jdH-000853-1L; Mon, 12 Dec 2022 09:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p4jdC-00081T-OK
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:18:11 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p4jdA-0003nj-KU
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:18:10 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3b48b139b46so147276537b3.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=78YtnV0yQkEkcEH4e9BV1TSTWxbOUI0O/RrrZlrQcsg=;
 b=rSmE6BFKkGLFjNp1teoCK+64XzPcF31dQIysMz2NhYxObtuec8AGV5Ghgn0SugE0uz
 WR1UYdypnYneGts/p5noKjv7GsAg/EV/Y7pYDhYaUlN5G6bIxAc6PynBksLmTVsqH7+w
 LlRnxm6HvxvHu3WrqZ++cawWStJLLlgwOLyWaCx6UCZrV9yEOncArBru5BjceyIX88UT
 F8/wIF5qVqZP/Qt+I0TAu1hoXN4MX9TcUEvEXlH9YKn19EgUeBhxYX18uRlljpHSLEWM
 Dy5kUki7a2iOpZxN3cxpKSgFuygEQfGp75IrmLanc9SKkiB3t4BFd9DrGxchEhKwvksZ
 6uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=78YtnV0yQkEkcEH4e9BV1TSTWxbOUI0O/RrrZlrQcsg=;
 b=fOL2D8hLaqyeKVWZ0RFjpK5giHYF29hLN9nfyLeeYa8FOxoSdsucvT/31WQUmZGoIq
 PFO64zdmSu6HTxBAUvhTbEceB6h2YHYUtqHbCcnB8Ii6lgIYV/SRM9+AnZ6GzVKS5bVN
 jF1UJfnGWD5haK7Ozp309upJy6Zz4JYQiQKKi6vu+BeQ6QfBvG0RMDdFQ7VmXtDjTVCL
 cv19eHBOkaVDqYydEZkFRh8DGFdaXlgz1856jKXU/YqcuxETxZANveyVOMBCp2dPmwmX
 FoQhsOC0TDbm/u1D5MeykaaqjlhS4vpXAtAeCuOBue22HXGWeG5udVpp0HMf7OJzo58t
 x0jg==
X-Gm-Message-State: ANoB5plx2J9T9C6KPsCbbs3NI+IUkJ16t0xUnurCy8ROrdWIKDBAhLbA
 X9CFtgjSO7IxKa1+dLbloVhmwm9dCNl+lS0ERYdzwg==
X-Google-Smtp-Source: AA0mqf4RMtRbCQhWGEZ35q24B0Wx1E7tNdgWXbsCCjah3UT9gKZzghtQGtg0a4wWDyXRhvx2uLxl4dk8BqrFl1MMRiA=
X-Received: by 2002:a0d:d401:0:b0:3d7:65c:576b with SMTP id
 w1-20020a0dd401000000b003d7065c576bmr35000842ywd.8.1670854683474; Mon, 12 Dec
 2022 06:18:03 -0800 (PST)
MIME-Version: 1.0
References: <CAG7Es24cbb24S1k7=XyA+N7uXCghQT6mt_QkJW4zcO7_usbmjw@mail.gmail.com>
 <F0A77EF0-ED2D-43E0-91D7-B4D70B9E575F@flygoat.com>
 <CAG7Es25r-pY2y+V2GP6Hba4qPos5uN5oeBKQ81gaWctt-jd4Rg@mail.gmail.com>
 <47336F08-8917-43A6-981A-2D2019AD9E1A@flygoat.com>
 <CAFEAcA9JhwjPaX3TEFnEDtos5Q7sfROUGjSFyvc1QfUYpsCtFQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9JhwjPaX3TEFnEDtos5Q7sfROUGjSFyvc1QfUYpsCtFQ@mail.gmail.com>
From: Christopher Wrogg <cwrogg@umich.edu>
Date: Mon, 12 Dec 2022 09:17:52 -0500
Message-ID: <CAG7Es26J0HfWSC0-ggG5PPHnUV8dy7yHK_0G-A0HmxNtreB74g@mail.gmail.com>
Subject: Re: CVMSEG Emulation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan via <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000e14e1505efa22b1a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=cwrogg@umich.edu; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e14e1505efa22b1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am getting the 48 bits value on 64 bit hosts. Having said that, I still
have the two problems above with the suggested fixes.

On Mon, Dec 12, 2022 at 7:03 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 9 Dec 2022 at 21:03, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> >
> >
> > > 2022=E5=B9=B412=E6=9C=889=E6=97=A5 17:44=EF=BC=8CChristopher Wrogg <c=
wrogg@umich.edu> =E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > I tried both.
> > >
> > > Option 1
> > >     What I did:
> > >         #undef TARGET_VIRT_ADDR_SPACE_BITS and #define
> TARGET_VIRT_ADDR_SPACE_BITS 64
> > >     The Result:
> > >         perror reports "Cannot allocate memory"
> > > Option 2:
> > >     What I did:
> > >         TARGET_VIRT_ADDR_SPACE_BITS for me is 30 so I masked by
> 0x3FFFFFFF
> > >     The Result:
> > >         The segfault persists and gdb reports the memory as
> inaccessible.
> >
> > Hmm this looks wired for me, by no chance TARGET_VIRT_ADDR_SPACE_BITS
> for MIPS
> > can be 30, on N64 ABI build it should be 48 and 32 for N32 or O32 build=
.
> >
> > It is defined in target/mips/cpu-param.h .
>
> For 32-bit user-mode we currently set it to 31, on the theory that
> userspace
> only gets access to the bottom half of the address space.
>
> -- PMM
>

--000000000000e14e1505efa22b1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am getting the 48 bits value on 64 bit hosts. Having sai=
d that, I still have the two problems above with the suggested fixes.<br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Dec 12, 2022 at 7:03 AM Peter Maydell &lt;<a href=3D"mailto:peter.may=
dell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Fri, 9 Dec 2022 at 21:03, Jiaxu=
n Yang &lt;<a href=3D"mailto:jiaxun.yang@flygoat.com" target=3D"_blank">jia=
xun.yang@flygoat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; 2022=E5=B9=B412=E6=9C=889=E6=97=A5 17:44=EF=BC=8CChristopher Wrog=
g &lt;<a href=3D"mailto:cwrogg@umich.edu" target=3D"_blank">cwrogg@umich.ed=
u</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br>
&gt; &gt;<br>
&gt; &gt; I tried both.<br>
&gt; &gt;<br>
&gt; &gt; Option 1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0What I did:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#undef TARGET_VIRT_ADDR_SPACE_BI=
TS and #define TARGET_VIRT_ADDR_SPACE_BITS 64<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The Result:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror reports &quot;Cannot allo=
cate memory&quot;<br>
&gt; &gt; Option 2:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0What I did:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_VIRT_ADDR_SPACE_BITS for =
me is 30 so I masked by 0x3FFFFFFF<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The Result:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The segfault persists and gdb re=
ports the memory as inaccessible.<br>
&gt;<br>
&gt; Hmm this looks wired for me, by no chance TARGET_VIRT_ADDR_SPACE_BITS =
for MIPS<br>
&gt; can be 30, on N64 ABI build it should be 48 and 32 for N32 or O32 buil=
d.<br>
&gt;<br>
&gt; It is defined in target/mips/cpu-param.h .<br>
<br>
For 32-bit user-mode we currently set it to 31, on the theory that userspac=
e<br>
only gets access to the bottom half of the address space.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000e14e1505efa22b1a--

