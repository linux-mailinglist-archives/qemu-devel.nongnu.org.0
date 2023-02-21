Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A1069DCF7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:35:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUP1p-0001mY-Iq; Tue, 21 Feb 2023 04:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pUP1l-0001mJ-J5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:33:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pUP1j-0003F5-Ja
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676972014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cN207Pntn9lyNQdTAimbxDVoD2zCAb6qRNagjzFzwa8=;
 b=TrElzWejYjGJl6gnRfyrddd3Xi3mD2AQ7a0gyLpySk8mM/yUpj05YL/zPG3Fs80X54E+p3
 G14DKqXMn198zDvPuiKzXrKKfhtteBjNG09AXKuWXIud7fNt4Uvq2khYSHqpMjjotcbOty
 2UFEz7cpMJ5H0n/G4bYiVH1F1YaKq1I=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-eLhEWyBMMfKBReqxULFTNg-1; Tue, 21 Feb 2023 04:33:33 -0500
X-MC-Unique: eLhEWyBMMfKBReqxULFTNg-1
Received: by mail-ua1-f72.google.com with SMTP id
 d1-20020ab02101000000b0068eddc91250so1718686ual.20
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cN207Pntn9lyNQdTAimbxDVoD2zCAb6qRNagjzFzwa8=;
 b=jQ+2K+sP1VXQ1Wqp8er5dSzhqqOrjjV6QEIV6NWit3tPpNkMapusj4iggglGlZeyCA
 AUTsSiiyuoPqwEfnuxOq9+oruSguRvMqorQSZK9Ev8La+KAPPUmc/l1WNZI6tgmsStI7
 z/Uv4OtqaKF1wSCztLybeJ5vYVBClhYo3cTp8NYEU3XLn7a74DZwTq5jRdpmt77FncLS
 tQbXT/EbswIqPru0snlpxW197uZ7Uf16PoWOiQLFxZ1K6vdwUPmTvE9KoAlc3s4x0Hcy
 IV+VIh1yVk24I4GCvBqELrzjBBme29NguUzJKEZ9yekl58tNmdtd7lYXSxXpjGGV9GM2
 6w0g==
X-Gm-Message-State: AO0yUKX8cQQ8iI4HGS0M8mTHvj1p8Cl2AngTR9VAwxqAwc7ARxfkhZok
 uV3IgfPUwDPgNDtzGOQei15BQPuQtNdgN+HwWNuB5KClfaDUlEvZUj+AJNpm2nMlR/p0bWZD/H/
 Qj2sDOz1W0aZGQBgebEK2uASZhosLNuc=
X-Received: by 2002:a1f:a251:0:b0:3e9:fd3b:692e with SMTP id
 l78-20020a1fa251000000b003e9fd3b692emr663279vke.38.1676972012600; 
 Tue, 21 Feb 2023 01:33:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/pTqWD6GhTouzTatFejYY4GcpZLjITUgadxbdi4q0hX3yDapWFfEaOetQyTxn2Qe6JcvBedwctiAGtpQ0BaiE=
X-Received: by 2002:a1f:a251:0:b0:3e9:fd3b:692e with SMTP id
 l78-20020a1fa251000000b003e9fd3b692emr663265vke.38.1676972012419; Tue, 21 Feb
 2023 01:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20230220174142.240393-1-kkostiuk@redhat.com>
 <20230220174142.240393-2-kkostiuk@redhat.com>
 <790be50d-9a52-6f92-f053-ee9a4eec0a31@linaro.org>
In-Reply-To: <790be50d-9a52-6f92-f053-ee9a4eec0a31@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 21 Feb 2023 11:33:21 +0200
Message-ID: <CAPMcbCpAmAxGN1jefQuBDfEVb+g06+WLUfM9ghx4z8M0pi=qUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] qga/win32: Remove change action from MSI installer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>, Yonggang Luo <luoyonggang@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, 
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, 
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, brian.wiltse@live.com
Content-Type: multipart/alternative; boundary="00000000000019534c05f5327951"
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

--00000000000019534c05f5327951
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:15 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org>
wrote:

> On 20/2/23 18:41, Konstantin Kostiuk wrote:
> > resolves: rhbz#2167436
>
> "You are not authorized to access bug #2167436."
>
> > fixes: CVE-2023-0664
>
> This commit description is rather scarce...
>
> I understand you are trying to fix a CVE, but we shouldn't play
> the "security by obscurity" card. How can the community and
> distributions know this security fix is enough with the bare
> "Remove change action from MSI installer" justification?
> Can't we do better?
>

This patch is part of the fix. I remove the 'change' button because
the installer has no components to choose from and the installer
always installs everything.

The second patch removes the interactive command shell.


>
> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > ---
> >   qga/installer/qemu-ga.wxs | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> > index 51340f7ecc..feb629ec47 100644
> > --- a/qga/installer/qemu-ga.wxs
> > +++ b/qga/installer/qemu-ga.wxs
> > @@ -31,6 +31,7 @@
> >         />
> >       <Media Id=3D"1" Cabinet=3D"qemu_ga.$(var.QEMU_GA_VERSION).cab"
> EmbedCab=3D"yes" />
> >       <Property Id=3D"WHSLogo">1</Property>
> > +    <Property Id=3D"ARPNOMODIFY" Value=3D"yes" Secure=3D"yes" />
> >       <MajorUpgrade
> >         DowngradeErrorMessage=3D"Error: A newer version of QEMU guest
> agent is already installed."
> >         />
> > --
> > 2.25.1
> >
> >
>
>

--00000000000019534c05f5327951
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 202=
3 at 10:15 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lina=
ro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 20/2/23 18:41, Konstantin Kostiuk wrote:<br>
&gt; resolves: rhbz#2167436<br>
<br>
&quot;You are not authorized to access bug #2167436.&quot;<br>
<br>
&gt; fixes: CVE-2023-0664<br>
<br>
This commit description is rather scarce...<br>
<br>
I understand you are trying to fix a CVE, but we shouldn&#39;t play<br>
the &quot;security by obscurity&quot; card. How can the community and<br>
distributions know this security fix is enough with the bare<br>
&quot;Remove change action from MSI installer&quot; justification?<br>
Can&#39;t we do better?<br></blockquote><div><br></div><div>This patch is p=
art of the fix. I remove the &#39;change&#39; button because</div><div>the =
installer has no components to choose from and the installer</div><div>alwa=
ys installs everything. <br><br>The second patch removes the interactive co=
mmand shell.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qga/installer/qemu-ga.wxs | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
&gt; index 51340f7ecc..feb629ec47 100644<br>
&gt; --- a/qga/installer/qemu-ga.wxs<br>
&gt; +++ b/qga/installer/qemu-ga.wxs<br>
&gt; @@ -31,6 +31,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Media Id=3D&quot;1&quot; Cabinet=3D&quot=
;qemu_ga.$(var.QEMU_GA_VERSION).cab&quot; EmbedCab=3D&quot;yes&quot; /&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Property Id=3D&quot;WHSLogo&quot;&gt;1&l=
t;/Property&gt;<br>
&gt; +=C2=A0 =C2=A0 &lt;Property Id=3D&quot;ARPNOMODIFY&quot; Value=3D&quot=
;yes&quot; Secure=3D&quot;yes&quot; /&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;MajorUpgrade<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DowngradeErrorMessage=3D&quot;Error: =
A newer version of QEMU guest agent is already installed.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000019534c05f5327951--


