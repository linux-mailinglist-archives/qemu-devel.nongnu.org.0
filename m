Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CED4DC967
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:57:31 +0100 (CET)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrZC-0005I8-U3
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:57:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUr27-0001Qb-Pw
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:23:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUr24-0007rX-Na
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647526995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D2pmiTpuQ78zXev+aanicXMu/A+tNSDKGbdJpgRStog=;
 b=cnMQpcse2swvcXZahmTpqwwshCU4lFv8x/PqABL+BwcTo9eVcpCTRopTG+YAICU3zridkk
 PEj5MtA3nYryw3OXVfOSFWAGrW3AD9oBtsDF14MVhBi5t8aHyOKbb+tcRbFQ33aHfWbDug
 l8spNCicZ0Kh50rXizhgOk6Fpnpr4ww=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-tU4DMczOOCGbXezQ7Gz3_g-1; Thu, 17 Mar 2022 10:23:12 -0400
X-MC-Unique: tU4DMczOOCGbXezQ7Gz3_g-1
Received: by mail-vk1-f199.google.com with SMTP id
 a188-20020a1f66c5000000b0033e52f60923so530056vkc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 07:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2pmiTpuQ78zXev+aanicXMu/A+tNSDKGbdJpgRStog=;
 b=HZ4rMg2dl5ayV+/Xm5M5000DTmLlE7ClMZIO8SSm6f3KyKzNSS7rU/gpLrLxqBnrFY
 gzz+XkjhxFANF215zAry1jk4eQQExMOTX3wDxZlPvFyA5J/Oa0/80ojbioARuYvaE3Na
 X1XDDBCsbG6/E5MXWy/i3ru9uFe1uBN3QhDXdopae8uNyuHbS280qdfTGhWf00G4XJ//
 bjKE00euGXERYAHVutcLiSHNwM7ZosyyVw30f7UBbNnFMO9HD7F0671nOIOFwkM4Htuc
 VScBJnIuSdDKU2HEd1GVyyAmO8qU9Cj48FqScaE6ndoWAQ1YBxfoiGn0A944t6v4iOCt
 KSmQ==
X-Gm-Message-State: AOAM530x66qgfFelgow0URMFxlzvT0fUNiJvRsYyCT38DXwbo8hzzvCX
 RJsO8QBRIvd+3u9Pi3GTOseYTCeDHYgGe3OI/H5nf4GfehJ3OitdajGyuRwlv+UdqiZuIgnV8dT
 qTbWWy9tJBPcBnGiZ2wymPhG6hLzsZcE=
X-Received: by 2002:a67:e8d5:0:b0:320:b8d1:cfa2 with SMTP id
 y21-20020a67e8d5000000b00320b8d1cfa2mr1966898vsn.61.1647526991932; 
 Thu, 17 Mar 2022 07:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIPaiTNn23DoaES4c35QGHkRFE7pPONeMIRl20MubgEtpqk+WyzMEVilZuUtpgl19rNbORzGTSmYnnaZuIchg=
X-Received: by 2002:a67:e8d5:0:b0:320:b8d1:cfa2 with SMTP id
 y21-20020a67e8d5000000b00320b8d1cfa2mr1966885vsn.61.1647526991687; Thu, 17
 Mar 2022 07:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-5-jsnow@redhat.com>
 <e9b98326-1d20-b9fa-0756-42d0ab7f8466@redhat.com>
 <647ef14d-7c41-956b-1dcf-691407594a0b@redhat.com>
In-Reply-To: <647ef14d-7c41-956b-1dcf-691407594a0b@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 10:23:02 -0400
Message-ID: <CAFn=p-YST4b-h_Cvy0VTgs2PoiORo0NYx2xpgh4bD+yNCQB4Ww@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] iotests: make qemu_img raise on non-zero rc by
 default
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000191d3605da6ac5d7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000191d3605da6ac5d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022, 6:41 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.03.22 11:25, Hanna Reitz wrote:
> > On 08.03.22 02:57, John Snow wrote:
> >> re-write qemu_img() as a function that will by default raise a
> >> VerboseProcessException (extended from CalledProcessException) on
> >> non-zero return codes. This will produce a stack trace that will show
> >> the command line arguments and return code from the failed process run=
.
> >
> > Why not qemu_img_pipe_and_status() as the central function where all
> > qemu-img calls go through?
>
> OK, I see that your follow-up series effectively does this.  Still
> wondering why this patch here doesn=E2=80=99t touch qemu_img_pipe_and_sta=
tus()
> instead.
>

Just a bad habit, I guess. It's the way I wrote this series: add a new
thing, then move the old things over to use it gradually.

This patchset (and the next) is pretty much the order I actually wrote it
in.

I do prefer the shorter name qemu_img() for this fn, tho.

(I struggle a lot with the order I write not being the order most people
prefer for reading. I feel like I've never quite gotten that correct. I
suppose I like to work backwards: start at the code I want and work
backwards until it works again.)


> > It seems like this makes qemu_img() a second version of
> > qemu_img_pipe_and_status(), which is a bit weird.
> >
> > (Or perhaps it should actually be qemu_tool_pipe_and_status() that
> > receives this treatment, with qemu-io functions just passing
> > check=3DFalse by default.)
>
> (And perhaps this, but I guess qemu-io is the only other real user of
> qemu_tool_pipe_and_status(), so if it doesn=E2=80=99t care, then there=E2=
=80=99s no real
> reason to change that function.)
>

Similar reasoning: I'm not actually sure I can justify the change
everywhere yet. I worked through all of qemu-io, but calls to qemu-nbd and
qemu itself are not yet audited.

In the end, that's the goal. Working my way backwards until replacing all
of these functions, yes.

Sorry for my backwards brain, maybe. I felt doing it this way got us the
most benefit the quickest.


> Hanna
>
>

--000000000000191d3605da6ac5d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 17, 2022, 6:41 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 17.03.22 11:25, Hanna Reitz wrote:<br>
&gt; On 08.03.22 02:57, John Snow wrote:<br>
&gt;&gt; re-write qemu_img() as a function that will by default raise a<br>
&gt;&gt; VerboseProcessException (extended from CalledProcessException) on<=
br>
&gt;&gt; non-zero return codes. This will produce a stack trace that will s=
how<br>
&gt;&gt; the command line arguments and return code from the failed process=
 run.<br>
&gt;<br>
&gt; Why not qemu_img_pipe_and_status() as the central function where all <=
br>
&gt; qemu-img calls go through?<br>
<br>
OK, I see that your follow-up series effectively does this.=C2=A0 Still <br=
>
wondering why this patch here doesn=E2=80=99t touch qemu_img_pipe_and_statu=
s() <br>
instead.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Just a bad habit, I guess. It&#39;s the way I wrote this series: =
add a new thing, then move the old things over to use it gradually.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">This patchset (and the next) is=
 pretty much the order I actually wrote it in.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">I do prefer the shorter name qemu_img() for this fn,=
 tho.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(I struggle a lot =
with the order I write not being the order most people prefer for reading. =
I feel like I&#39;ve never quite gotten that correct. I suppose I like to w=
ork backwards: start at the code I want and work backwards until it works a=
gain.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
&gt; It seems like this makes qemu_img() a second version of <br>
&gt; qemu_img_pipe_and_status(), which is a bit weird.<br>
&gt;<br>
&gt; (Or perhaps it should actually be qemu_tool_pipe_and_status() that <br=
>
&gt; receives this treatment, with qemu-io functions just passing <br>
&gt; check=3DFalse by default.)<br>
<br>
(And perhaps this, but I guess qemu-io is the only other real user of <br>
qemu_tool_pipe_and_status(), so if it doesn=E2=80=99t care, then there=E2=
=80=99s no real <br>
reason to change that function.)<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Similar reasoning: I&#39;m not actually sur=
e I can justify the change everywhere yet. I worked through all of qemu-io,=
 but calls to qemu-nbd and qemu itself are not yet audited.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">In the end, that&#39;s the goal. Work=
ing my way backwards until replacing all of these functions, yes.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Sorry for my backwards brain, may=
be. I felt doing it this way got us the most benefit the quickest.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
Hanna<br>
<br>
</blockquote></div></div></div>

--000000000000191d3605da6ac5d7--


