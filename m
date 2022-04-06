Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091624F62AF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:13:30 +0200 (CEST)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7Lc-0000Bk-M4
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nc7KP-0007qF-HR
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:12:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nc7KM-0005Xp-Du
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649257929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QCpwan+z0tt4Sd2AfZw5TPgVV3+jgMWv5C+lU2AeGZc=;
 b=bPaHypzRvMIRg5ROIkHigwVwlgjeCg2BaRuQqg67Q1Nkj9EmH3aMTj0UJZ+Va4oC8FshKP
 sN305+tqD0oQFD+NBfzWKecduzT/DZsNMPT3+1oUUmHd/MIxEuCHBYqY3zgIH444XWx6d4
 7VCYqjAkbPxXBzrfxD0wOQ9i8786ccc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-k19F-V0KOSi4Smv_yFX69Q-1; Wed, 06 Apr 2022 11:12:06 -0400
X-MC-Unique: k19F-V0KOSi4Smv_yFX69Q-1
Received: by mail-ua1-f72.google.com with SMTP id
 l6-20020ab04386000000b0034c80915685so1274736ual.5
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCpwan+z0tt4Sd2AfZw5TPgVV3+jgMWv5C+lU2AeGZc=;
 b=SwmxxRLLt+uWVOk37NhNZrBF2RnhoVZniDGoepf4gSgeawTXlbUsLRTdG6zlh0eCuF
 cvlNhzHqgKec76aJ0Wxlf2slsKXRYLO2LNJLBFQ3XhUgFFRJWpR8mayTYgVx2rGS/VdN
 t+krj9qHvYJg4TaPPbCFGlywmAO4URB0ibuwSFyPeQQsNwWLmFjrYH53hM0i+scB0RRA
 clzAXOUZ0FsdN9WPXOQl8fuj7rsyS7doR9D6FDUzLshxYrn0In4kQGLUbCH8MXy3cqh5
 GuGXFaO3ST6ZeZISviz/cVB6Tm6SQiBV7brkJltglqhuvdkBSoohLIJtlVS1oxCMaIGj
 6tQQ==
X-Gm-Message-State: AOAM5308CLoOHPc8A8iU2J3dJDbfmcgpeLr/nE+Av6BLMdoM5vOnXVbT
 YENXtrOiiboJTwoKw0EBkxnoBGsdYtP1AF1e+F1ZnXKJNFJ6PNRuZZfld+/vyx1ui7XvPi5v/PA
 TV0T1wVE/TxyyMy6BCrDF0fcWEKfR8/0=
X-Received: by 2002:a05:6122:9a6:b0:33f:f23e:bde9 with SMTP id
 g38-20020a05612209a600b0033ff23ebde9mr3393994vkd.3.1649257925468; 
 Wed, 06 Apr 2022 08:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywpbgTFnIMLmfQAWX18qoGlswbi4linqPbIIOHasczbsmYIUqbtPd0nbUq9QEVZMcoNpNGPuOese8MeMyM1kg=
X-Received: by 2002:a05:6122:9a6:b0:33f:f23e:bde9 with SMTP id
 g38-20020a05612209a600b0033ff23ebde9mr3393984vkd.3.1649257925165; Wed, 06 Apr
 2022 08:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <1c4fd757-5d08-0099-b842-4295c430a176@suse.de>
 <32ff3a63-fb50-8038-3f2e-5bfd70b01344@suse.de>
 <37635a04-b717-b7c6-88a0-1b3cecc0c4f5@suse.de>
 <8a898f41-98e1-5a02-4cd8-a697bcb6d9a1@redhat.com>
 <7a952654-c163-00c9-8538-e07afef47ca8@suse.de>
 <CAFn=p-aKWCQM29qEB6YRK6A_6DwcaMPbVTyLLbLnCZ1zG7cBtQ@mail.gmail.com>
 <CAFn=p-bvbpP=tMFDYiJaEhiAtETYnx-PAqCDGaPZ-wVU5ej7LQ@mail.gmail.com>
 <91ee90b0-05b1-3df8-e2d1-9da2b11bcefc@suse.de>
In-Reply-To: <91ee90b0-05b1-3df8-e2d1-9da2b11bcefc@suse.de>
From: John Snow <jsnow@redhat.com>
Date: Wed, 6 Apr 2022 11:11:54 -0400
Message-ID: <CAFn=p-ZaUXZQTyhSHJk7tFZat_mWFhVSC1iXVGYMfaxN-bCJww@mail.gmail.com>
Subject: Re: iotest40 problem
To: Li Zhang <lizhang@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c5dc9005dbfdc81f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5dc9005dbfdc81f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 6, 2022, 10:53 AM Li Zhang <lizhang@suse.de> wrote:

> On 3/31/22 16:46, John Snow wrote:
> >
> >
> > On Thu, Mar 31, 2022, 10:37 AM John Snow <jsnow@redhat.com
> > <mailto:jsnow@redhat.com>> wrote:
> >
> >
> >
> >     On Thu, Mar 31, 2022, 6:47 AM Li Zhang <lizhang@suse.de
> >     <mailto:lizhang@suse.de>> wrote:
> >
> >         On 3/31/22 08:10, Hanna Reitz wrote:
> >          > On 29.03.22 18:49, Li Zhang wrote:
> >          >> Update what I observed.
> >          >>
> >          >> It seems that aqmp is not stable when running test cases.
> >          >> So I revert the patches as the following, iotest40/41 test
> >         cases work
> >          >> well.
> >          >
> >          > Thanks for bisecting.  I haven=E2=80=99t seen this problem b=
efore, so
> >         I didn=E2=80=99t
> >          > look into it; CC-ing John, perhaps he figures something.
> >          >
> >         Thanks a lot.
> >         It happens occassionally. I didn't find a way to reproduce it
> >         manually.
> >
> >
> >     Sorry for the instability.
> >
> >     A few questions then:
> >
> >     - what operating system and version
> >     - kernel version
> >     - architecture (looks like x86 and others?)
> >     - what commit/version of QEMU are you testing?
> >     - what python version are you using to run iotests?
> >
> >
> > I'll also point out these patchsets, because we're in different
> > timezones and if I'm lucky it will be the answer:
> >
> > [1] https://patchew.org/QEMU/20220201041134.1237016-1-jsnow@redhat.com/
> > <https://patchew.org/QEMU/20220201041134.1237016-1-jsnow@redhat.com/>
> >
> > [2] https://patchew.org/QEMU/20220225205948.3693480-1-jsnow@redhat.com/
> > <https://patchew.org/QEMU/20220225205948.3693480-1-jsnow@redhat.com/>
>
> Thanks a lot.
>
> I backport aqmp related patches, it looks good to run the cases
> iotest040/041.
>

Excellent, thanks for reporting back!

--000000000000c5dc9005dbfdc81f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Apr 6, 2022, 10:53 AM Li Zhang &lt;<a href=3D"=
mailto:lizhang@suse.de">lizhang@suse.de</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On 3/31/22 16:46, John Snow wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Mar 31, 2022, 10:37 AM John Snow &lt;<a href=3D"mailto:jsnow@r=
edhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=
=3D"noreferrer">jsnow@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Mar 31, 2022, 6:47 AM Li Zhang &lt;<a href=
=3D"mailto:lizhang@suse.de" target=3D"_blank" rel=3D"noreferrer">lizhang@su=
se.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:lizhang@suse.de" targe=
t=3D"_blank" rel=3D"noreferrer">lizhang@suse.de</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 3/31/22 08:10, Hanna Reitz wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On 29.03.22 18:49, Li Zhang wro=
te:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; Update what I observed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; It seems that aqmp is not s=
table when running test cases.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; So I revert the patches as =
the following, iotest40/41 test<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cases work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Thanks for bisecting.=C2=A0 I h=
aven=E2=80=99t seen this problem before, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I didn=E2=80=99t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; look into it; CC-ing John, perh=
aps he figures something.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks a lot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It happens occassionally. I didn&#39;=
t find a way to reproduce it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manually.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Sorry for the instability.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0A few questions then:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- what operating system and version<br>
&gt;=C2=A0 =C2=A0 =C2=A0- kernel version<br>
&gt;=C2=A0 =C2=A0 =C2=A0- architecture (looks like x86 and others?)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- what commit/version of QEMU are you testing?<br>
&gt;=C2=A0 =C2=A0 =C2=A0- what python version are you using to run iotests?=
<br>
&gt; <br>
&gt; <br>
&gt; I&#39;ll also point out these patchsets, because we&#39;re in differen=
t <br>
&gt; timezones and if I&#39;m lucky it will be the answer:<br>
&gt; <br>
&gt; [1] <a href=3D"https://patchew.org/QEMU/20220201041134.1237016-1-jsnow=
@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patch=
ew.org/QEMU/20220201041134.1237016-1-jsnow@redhat.com/</a> <br>
&gt; &lt;<a href=3D"https://patchew.org/QEMU/20220201041134.1237016-1-jsnow=
@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patch=
ew.org/QEMU/20220201041134.1237016-1-jsnow@redhat.com/</a>&gt;<br>
&gt; <br>
&gt; [2] <a href=3D"https://patchew.org/QEMU/20220225205948.3693480-1-jsnow=
@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patch=
ew.org/QEMU/20220225205948.3693480-1-jsnow@redhat.com/</a> <br>
&gt; &lt;<a href=3D"https://patchew.org/QEMU/20220225205948.3693480-1-jsnow=
@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patch=
ew.org/QEMU/20220225205948.3693480-1-jsnow@redhat.com/</a>&gt;<br>
<br>
Thanks a lot.<br>
<br>
I backport aqmp related patches, it looks good to run the cases <br>
iotest040/041.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Excellent, thanks for reporting back!</div></div>

--000000000000c5dc9005dbfdc81f--


