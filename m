Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6A68E934
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 08:43:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPf5q-0004BO-V3; Wed, 08 Feb 2023 02:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pPf5T-0004Ay-FS
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pPf5P-0000Qc-3C
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675842105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VVnyAPLW7YaLDKPKR0EMEzm/HU4nVXdUvGC9vhqUoy8=;
 b=M8ND/xPY0Uwn5iw8BgoA/N0PB9kwN+9aJoDraz8TQTJGP37w+QEj6Ojwc1hDaScbN8JYhG
 Hp1vTTHWzSrAkbA3qcxmh+mddTwPJYWRGdb1LjIEBkPCOnB9J9bG3+JP/gHv6B8hII+ixq
 oIUcTVHCx2kJSIxzXWfp3GqrSpGdCgk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-aKFc1BvtOla6D3byq5AH7g-1; Wed, 08 Feb 2023 02:41:44 -0500
X-MC-Unique: aKFc1BvtOla6D3byq5AH7g-1
Received: by mail-ua1-f72.google.com with SMTP id
 g4-20020ab01304000000b0060d5bfd73b5so7649279uae.16
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 23:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VVnyAPLW7YaLDKPKR0EMEzm/HU4nVXdUvGC9vhqUoy8=;
 b=xpRyqpgLp1EZj3Jj7ggK9RJHWiIQNCC3ftoxUg4bYpYRSBIUaI0iurAA6reiStZ2z3
 YWNyYcybGiyLV3HJwl5B7T/UlbiGXo8vP7XV8a4wpy/JuPlaB6dSQdKEXyB0O6+c06TY
 cx/uP9x1o9yWUI5FoEPEranFJ8bm74M9F41wTGKDrHYzJA+FLRPxEZCZiecRHclP0n+1
 7+2Fn0QeXSWzBO1CW8jRgNH3PwXWDpMeXBz9UKiZyDm3LFrGyEnvTrqGbtDu0n5nIepJ
 G7kHFgL3Vkwu6BrktbptBhQh2vB2GYIgwaSZlp7CJXWG8u5orRwBBOyue1fU1KDY5aOt
 r6EQ==
X-Gm-Message-State: AO0yUKXftwk98dKqDx1EfbO+24ZdeZv/URv4StVxtnUtdMIWQrv0qlB4
 iPWu+ECiFHf74YfpuR4zqRge1/Lb+i8cppMOH6+VdyADfH8nP79xZ6TUdlU2xyKBkHsI3nXdvVn
 C2ka9B9eRTwZogOlSmqup2m8CYHJKEF2Spo1OVUc=
X-Received: by 2002:a1f:5a02:0:b0:3ea:8029:d3e3 with SMTP id
 o2-20020a1f5a02000000b003ea8029d3e3mr1361315vkb.4.1675842103328; 
 Tue, 07 Feb 2023 23:41:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/gZdKuXQG3ZhNbuXuZYu/VREvEx3y/4hNUmpiLLVgT81z5WuvVw+Szprs2Z1kPzuOx6NyMU8J79rPZPRWf2pk=
X-Received: by 2002:a1f:5a02:0:b0:3ea:8029:d3e3 with SMTP id
 o2-20020a1f5a02000000b003ea8029d3e3mr1361310vkb.4.1675842103067; Tue, 07 Feb
 2023 23:41:43 -0800 (PST)
MIME-Version: 1.0
References: <BLAPR05MB73459DB71B55CA0ACBD88304C8D89@BLAPR05MB7345.namprd05.prod.outlook.com>
 <b3de26d8-4992-df8a-8b31-4c7a07704195@linaro.org>
In-Reply-To: <b3de26d8-4992-df8a-8b31-4c7a07704195@linaro.org>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Wed, 8 Feb 2023 09:41:31 +0200
Message-ID: <CAGoVJZywT2xMMfujMCKKZrXFE6cxPJt4hgCkirbMiHjn_curMg@mail.gmail.com>
Subject: Re: Porting the QEMU build architecture to Visual Studio
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Andrew Numrich <anumrich@hotmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000040daf005f42b659e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000040daf005f42b659e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I created a Visual Studio project a long time ago for qemu-ga. It is an
ugly unsustainable hack that was done in the time before QEMU moved to
meson and I had to deal with GCC extension that MS compiler couldn't handle=
.
Today I would experiment with meson that should be able to create VS
projects: https://mesonbuild.com/Using-with-Visual-Studio.html and use
clang on Windows (info in the same link).

Best regards,
Yan.


On Wed, Feb 8, 2023 at 8:57 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg>
wrote:

> Hi Andrew,
>
> On 8/2/23 05:56, Andrew Numrich wrote:
> > Hello, I=E2=80=99m looking to experiment with QEMU in a Windows specifi=
c
> > environment. For that I=E2=80=99ll need to build QEMU=E2=80=99s source =
code in Visual
> > Studio 2017.
> >
> > I=E2=80=99m seeing that QEMU=E2=80=99s sources calls for a `config-host=
.h` file
> > generated by a `create_config` script. I don=E2=80=99t see said script =
anywhere
> > in the source tree.
> >
> > By googling I can see various creations of both these files in random
> > forks of QEMU around the internet, but I couldn=E2=80=99t be sure to us=
e any of
> > them.
> >
> > I=E2=80=99m guessing these are somehow created by meson or ninja, but I=
 don=E2=80=99t
> > have those easily on hand, being on Windows.
> >
> > Is there anyone that can point me in the right direction
>
> Paolo posted a patch to adapt QEMU build system to VSCode few
> years ago:
>
> https://lore.kernel.org/qemu-devel/20210512100906.621504-1-pbonzini@redha=
t.com/
>
> > or explain how
> > this is generated?
> >
> > Thanks
> >
> >   * Andrew Numrich
> >
> > http://github.com/toastmod
> >
>
>
>

--00000000000040daf005f42b659e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<div><br></div><div>I created a Visual Studio pr=
oject a long=C2=A0time ago for qemu-ga. It is an ugly unsustainable hack th=
at was done in the time before QEMU moved to meson and I had to deal with=
=C2=A0GCC extension that MS compiler=C2=A0couldn&#39;t handle.</div><div>To=
day I would experiment with meson that should be able to create VS projects=
:=C2=A0<a href=3D"https://mesonbuild.com/Using-with-Visual-Studio.html">htt=
ps://mesonbuild.com/Using-with-Visual-Studio.html</a> and use clang on Wind=
ows (info in the same link).</div><div><br></div><div>Best regards,</div><d=
iv>Yan.</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 8:57 AM Philippe Mathi=
eu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex">Hi Andrew,<br>
<br>
On 8/2/23 05:56, Andrew Numrich wrote:<br>
&gt; Hello, I=E2=80=99m looking to experiment with QEMU in a Windows specif=
ic <br>
&gt; environment. For that I=E2=80=99ll need to build QEMU=E2=80=99s source=
 code in Visual <br>
&gt; Studio 2017.<br>
&gt; <br>
&gt; I=E2=80=99m seeing that QEMU=E2=80=99s sources calls for a `config-hos=
t.h` file <br>
&gt; generated by a `create_config` script. I don=E2=80=99t see said script=
 anywhere <br>
&gt; in the source tree.<br>
&gt; <br>
&gt; By googling I can see various creations of both these files in random =
<br>
&gt; forks of QEMU around the internet, but I couldn=E2=80=99t be sure to u=
se any of <br>
&gt; them.<br>
&gt; <br>
&gt; I=E2=80=99m guessing these are somehow created by meson or ninja, but =
I don=E2=80=99t <br>
&gt; have those easily on hand, being on Windows.<br>
&gt; <br>
&gt; Is there anyone that can point me in the right direction<br>
<br>
Paolo posted a patch to adapt QEMU build system to VSCode few<br>
years ago:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20210512100906.621504-1-pbonz=
ini@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.o=
rg/qemu-devel/20210512100906.621504-1-pbonzini@redhat.com/</a><br>
<br>
&gt; or explain how <br>
&gt; this is generated?<br>
&gt; <br>
&gt; Thanks<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Andrew Numrich<br>
&gt; <br>
&gt; <a href=3D"http://github.com/toastmod" rel=3D"noreferrer" target=3D"_b=
lank">http://github.com/toastmod</a><br>
&gt; <br>
<br>
<br>
</blockquote></div>

--00000000000040daf005f42b659e--


