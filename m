Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86996A3CA3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:26:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYj2-0005Qp-1x; Mon, 27 Feb 2023 03:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pWYiw-0005Jw-S4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pWYiv-0007pC-1f
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677485943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+kM+bzjqHqTN/JFJTr9sYxNxSe//0ZeJVxoT/7jBOw=;
 b=B2KFeXvZxiriYOb7YZ85AsIDkGpnBkfW0lYX30h3iW2XLQrdGUxZw96KrcI69TC/Wo0D88
 sbyG69zh9AoyltRd/Aaps2RgosP4ata81QUYL5AyjDqUs09smn21tW0FBvWK9gavGYuVkf
 JaJcr06W0HkcLiKOd52J4z/9PLjHZV0=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-jzrXs97yPPuxl8M2gWtNCg-1; Mon, 27 Feb 2023 03:19:02 -0500
X-MC-Unique: jzrXs97yPPuxl8M2gWtNCg-1
Received: by mail-vs1-f71.google.com with SMTP id
 v13-20020a0561020f0d00b0041f24dc9c47so4950542vss.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+kM+bzjqHqTN/JFJTr9sYxNxSe//0ZeJVxoT/7jBOw=;
 b=0SE2p2v/iqczHIIweqze5jTHDWJHYo6H+rbc6+q/Q0q7RC6Nx2i7+M9tof7q8V+u3T
 takp667whSAGMeG6Q0lkoxCNi3OnDyhvqltKCQQx5q57t3Wu86T5oLx4qXqaGHbDMKsX
 HJj2cNhq/Ru24zlWWsROcAOyrET3xulz3MP5e6VdLrOPU3GfniuqmU775NxvcOncyhqy
 pb3j8uLyNl7UPyn1weOiYp30GJP+sIJ5rJwY+1DZA7I/7+zMbMN4+mSmI3EXN8Is8NIf
 Gjf25h7RUdSHZUkLj/VL9Mie4HeqhuzdaWCFTe9kpVMbb5NWipY6QjjLjPkW7DpWm0PG
 J1fA==
X-Gm-Message-State: AO0yUKVNNAp15YykAchtKqpTjdrr83wb9tAkLjhH33zl4ZLhr7jJ/14d
 xE/9efkAr4iOJhgX+x1aFr9w7vvgKsYPVCQbNxWAoHWqMfR0UDm61VqDbnQpGqTGnS2gs+8jsSB
 yHwOj5e+2QvvOrnuH/du1L8dgtaHBk3U=
X-Received: by 2002:a67:f3d0:0:b0:411:b8e8:a924 with SMTP id
 j16-20020a67f3d0000000b00411b8e8a924mr6985950vsn.7.1677485941544; 
 Mon, 27 Feb 2023 00:19:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+LDEtXpaPWrIBAi3+A94iYiruTYFSF15o15b3PuUIRcS6mtkL081TjuY21t1jKQSiq5/UajAlYPazBRRzHrNA=
X-Received: by 2002:a67:f3d0:0:b0:411:b8e8:a924 with SMTP id
 j16-20020a67f3d0000000b00411b8e8a924mr6985923vsn.7.1677485941218; Mon, 27 Feb
 2023 00:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20230221112157.418648-1-kkostiuk@redhat.com>
 <170a0ba8-d85c-4b31-557a-d85b12b88089@linaro.org>
In-Reply-To: <170a0ba8-d85c-4b31-557a-d85b12b88089@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 27 Feb 2023 10:18:50 +0200
Message-ID: <CAPMcbCrqgrBkABhtSxCUbroszpPhCCWJ=FXL7AJbSmxN2n-q+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] QGA installer fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>, 
 Yonggang Luo <luoyonggang@gmail.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, 
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, 
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Brian Wiltse <brian.wiltse@live.com>
Content-Type: multipart/alternative; boundary="000000000000a473a005f5aa2120"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000a473a005f5aa2120
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Tue, Feb 21, 2023 at 1:41 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 21/2/23 12:21, Konstantin Kostiuk wrote:
> > resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D2167423
> > fixes: CVE-2023-0664
> >
> > CVE Technical details: The cached installer for QEMU Guest Agent in
> c:\windows\installer
> > (https://github.com/qemu/qemu/blob/master/qga/installer/qemu-ga.wxs),
> > can be leveraged to begin a repair of the installation without validati=
on
> > that the repair is being performed by an administrative user. The MSI
> repair
> > custom action "RegisterCom" and "UnregisterCom" is not set for
> impersonation
> > which allows for the actions to occur as the SYSTEM account
> > (LINE 137 AND 145 of qemu-ga.wxs). The custom action also leverages
> cmd.exe
> > to run qemu-ga.exe in line 134 and 142 which causes an interactive
> command
> > shell to spawn even though the MSI is set to be non-interactive on line
> 53.
> >
> > v1:
> https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05661.html
>
> Per
>
> https://lore.kernel.org/qemu-devel/CAA8xKjUQFBVgDVJ059FvGoSjkv+kZ5jB1gfMN=
z+ao-twH7FDRg@mail.gmail.com/
> :
>
> Reported-by: Brian Wiltse <brian.wiltse@live.com>
>
> > v1 -> v2:
> >    Add explanation into commit messages
>
> Thanks, much appreciated!
>
> > Konstantin Kostiuk (2):
> >    qga/win32: Remove change action from MSI installer
> >    qga/win32: Use rundll for VSS installation
> >
> >   qga/installer/qemu-ga.wxs | 11 ++++++-----
> >   qga/vss-win32/install.cpp |  9 +++++++++
> >   qga/vss-win32/qga-vss.def |  2 ++
> >   3 files changed, 17 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1
> >
>
>

--000000000000a473a005f5aa2120
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 21, 2023 at 1:41 PM Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 21/2/23=
 12:21, Konstantin Kostiuk wrote:<br>
&gt; resolves: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D216=
7423" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show=
_bug.cgi?id=3D2167423</a><br>
&gt; fixes: CVE-2023-0664<br>
&gt; <br>
&gt; CVE Technical details: The cached installer for QEMU Guest Agent in c:=
\windows\installer<br>
&gt; (<a href=3D"https://github.com/qemu/qemu/blob/master/qga/installer/qem=
u-ga.wxs" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu=
/blob/master/qga/installer/qemu-ga.wxs</a>),<br>
&gt; can be leveraged to begin a repair of the installation without validat=
ion<br>
&gt; that the repair is being performed by an administrative user. The MSI =
repair<br>
&gt; custom action &quot;RegisterCom&quot; and &quot;UnregisterCom&quot; is=
 not set for impersonation<br>
&gt; which allows for the actions to occur as the SYSTEM account<br>
&gt; (LINE 137 AND 145 of qemu-ga.wxs). The custom action also leverages cm=
d.exe<br>
&gt; to run qemu-ga.exe in line 134 and 142 which causes an interactive com=
mand<br>
&gt; shell to spawn even though the MSI is set to be non-interactive on lin=
e 53.<br>
&gt; <br>
&gt; v1: <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2023-0=
2/msg05661.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.=
org/archive/html/qemu-devel/2023-02/msg05661.html</a><br>
<br>
Per <br>
<a href=3D"https://lore.kernel.org/qemu-devel/CAA8xKjUQFBVgDVJ059FvGoSjkv+k=
Z5jB1gfMNz+ao-twH7FDRg@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/qemu-devel/CAA8xKjUQFBVgDVJ059FvGoSjkv+kZ5jB1gfMN=
z+ao-twH7FDRg@mail.gmail.com/</a>:<br>
<br>
Reported-by: Brian Wiltse &lt;<a href=3D"mailto:brian.wiltse@live.com" targ=
et=3D"_blank">brian.wiltse@live.com</a>&gt;<br>
<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0 Add explanation into commit messages<br>
<br>
Thanks, much appreciated!<br>
<br>
&gt; Konstantin Kostiuk (2):<br>
&gt;=C2=A0 =C2=A0 qga/win32: Remove change action from MSI installer<br>
&gt;=C2=A0 =C2=A0 qga/win32: Use rundll for VSS installation<br>
&gt; <br>
&gt;=C2=A0 =C2=A0qga/installer/qemu-ga.wxs | 11 ++++++-----<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/install.cpp |=C2=A0 9 +++++++++<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/qga-vss.def |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A03 files changed, 17 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000a473a005f5aa2120--


