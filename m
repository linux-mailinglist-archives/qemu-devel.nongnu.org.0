Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EABB51C227
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:16:32 +0200 (CEST)
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmcHP-0001AS-Ha
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmcEd-0005iG-3K
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:13:39 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:23394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmcEb-0003ZL-H8
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651760016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UG0vrolYaXw+IuL4G0IN7oIr+F1pT0t2IrMcf41xrw4=;
 b=G2Keq3m1rV3cUsDpp26UKf5oyS6UR34CDXHBhxFmmdyIUCTowVyYDL1vj0+7r3VOqxA9JY
 PZD97XHzMLjipi1njHwZvFvDKflqdB53pTMGbJQpMteOh7/oPgWZrl/RNrUQSuuJNvDYdm
 7M7kKnr2CybMjVyH0M1xHdKmgJF1wC8=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-X8cVsqqeNNOA_QVb6BgT1Q-1; Thu, 05 May 2022 10:13:33 -0400
X-MC-Unique: X8cVsqqeNNOA_QVb6BgT1Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 125-20020a1f1683000000b0034dbcda9c6aso439578vkw.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 07:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UG0vrolYaXw+IuL4G0IN7oIr+F1pT0t2IrMcf41xrw4=;
 b=zKMtc15emtW2ygmHbUH07px8cBUTVMFq5CZny7faAEI4AmcI+YibFh5+14bhdyjBZZ
 7kX7VQA6i5R8+XHNZ1T814QKIqXAU9I3W2fCoDobfZ3P7D+0R72UTRdTgTeW6u+2n4VH
 /hzG8KaxKTsVDIGH5RWp+Ka2Dl8o+Ad45ziYD3msKMWziI8TKQqh6uC5cIEdVJ0H5wJZ
 KP8Kqnh23VhsGAELGWHTYN8q+3mHrr2hhOAwTpKjg8QD6z+tjBxOklNdld5Mir8pg86C
 BCkDfr6KOAm5I9vth2puCxMsLuWK497U51imf3+7nS6esfHH0x/vlTzy4/IMDzHzTYOI
 rIGQ==
X-Gm-Message-State: AOAM531Svj458DBcHt4lk+IR7RffUeoM308pB/kZaa0ZRf8S7cNjSg5r
 uEMrNkiWJvj55GkTKiZHQYujHS494/Zb8AUbFLFCtxoR3+525LxymkIzrWwEPtAhSvwEKPicFbX
 Jwpy2NQ3546LIOyArp7KXq3s3QfmFaQQ=
X-Received: by 2002:a05:6102:418e:b0:32d:4291:d708 with SMTP id
 cd14-20020a056102418e00b0032d4291d708mr5645808vsb.61.1651760012806; 
 Thu, 05 May 2022 07:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6774RZXLZfh6KKhKf1qU5xoUF4p6lraJDDlbefhLVU5wbTQvjGvYM/UvDjbJib4hjndcGwjJrXpMb+Lwwqd8=
X-Received: by 2002:a05:6102:418e:b0:32d:4291:d708 with SMTP id
 cd14-20020a056102418e00b0032d4291d708mr5645781vsb.61.1651760012522; Thu, 05
 May 2022 07:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
 <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
 <YnPEGrwa9KVyup6T@redhat.com>
 <CAFn=p-ZpoJvoZSnk9gN+uiaas=h-tvZqBCZw2kJf88=rq_5LYQ@mail.gmail.com>
 <07a829c2-4eb8-01e3-0c8c-691c1420f51a@redhat.com>
In-Reply-To: <07a829c2-4eb8-01e3-0c8c-691c1420f51a@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 May 2022 10:13:22 -0400
Message-ID: <CAFn=p-Zfonw462fKT=TBKCRLbZ2xPUwsK-SeRJhgfxYwNRJEsg@mail.gmail.com>
Subject: Re: iotests and python dependencies
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cd120105de445874"
Received-SPF: pass client-ip=170.10.129.74; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cd120105de445874
Content-Type: text/plain; charset="UTF-8"

On Thu, May 5, 2022, 9:16 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/5/22 15:10, John Snow wrote:
> >
> >      > Hm, do we need iotests during an rpm build? Is it because of
> >     "make check"?
> >
> >     Yes, and this is good, because it prevents us from outputting an
> >     RPM build that has a broken QEMU in it.
> >
> > Guess this means I need to make a Fedora package too, though. My hubris.
>
> I would rather keep python/qemu/qmp as a submodule for a longer time,
> and still go through a virtual environment that installs it together
> with its pip dependencies.
>

A small headache relating fixes to both locations, but if you'd like to see
it to prove that the installation mechanism works in general, then OK. I'm
willing to deal with the pain until the next release to let us go through a
testing cycle. Reluctantly. Maybe.

I'm assuming you mean as a subpackage and not a [git] submodule. If you do
mean git, then ... uh. That might be messy.

--000000000000cd120105de445874
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 5, 2022, 9:16 AM Paolo Bonzini &lt;<a href=
=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 5/5/22 15:10, John Snow wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hm, do we need iotests during an rpm build? I=
s it because of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;make check&quot;?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes, and this is good, because it prevents us from =
outputting an<br>
&gt;=C2=A0 =C2=A0 =C2=A0RPM build that has a broken QEMU in it.<br>
&gt; <br>
&gt; Guess this means I need to make a Fedora package too, though. My hubri=
s.<br>
<br>
I would rather keep python/qemu/qmp as a submodule for a longer time, <br>
and still go through a virtual environment that installs it together <br>
with its pip dependencies.<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">A small headache relating fixes to both locations=
, but if you&#39;d like to see it to prove that the installation mechanism =
works in general, then OK. I&#39;m willing to deal with the pain until the =
next release to let us go through a testing cycle. Reluctantly. Maybe.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m assuming you mean as=
 a subpackage and not a [git] submodule. If you do mean git, then ... uh. T=
hat might be messy.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000cd120105de445874--


