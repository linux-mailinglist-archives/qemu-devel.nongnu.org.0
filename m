Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C8641518A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:41:02 +0200 (CEST)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT937-0007qz-L1
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT91O-00072E-65
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT91L-0004mp-Fq
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632343150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/RyheuYt28HIjYf2A2+mGG3vczJPtI8jz0/U/MewSP8=;
 b=dIIzsEWOskeUR3cckvLL8ObjQiJxVxyqtgWybmRy2kOdQ2irkbj4TjQnJyFXMqtefpVT3h
 ipyotCToXzKDAdtZtZDxRTHZnuUAeEHHeVmeK+zy+ly1kibx3mz/BnATfj1ykXH2GSZX6N
 gK+7lNLvQBt6mkQAeiKzVhAh5XdrY24=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-_IDqjKwYO82BtWO5cOCX8g-1; Wed, 22 Sep 2021 16:39:08 -0400
X-MC-Unique: _IDqjKwYO82BtWO5cOCX8g-1
Received: by mail-oo1-f72.google.com with SMTP id
 w21-20020a4ae9f5000000b0029116e62638so2444151ooc.4
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 13:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/RyheuYt28HIjYf2A2+mGG3vczJPtI8jz0/U/MewSP8=;
 b=PIXDri5V6/QHElQ6TgbknoaVOsbitE9qp4kh3bshk/6h6F1zyvk47+BrGQhQvqXFGb
 PC15pirpGzgejRV4lhNmeCdOWmyivmr042NNwqqXKtEcYQH41iJ2jRaQJFTLVmu3IMkK
 z/WpGx21SvJZtefcxR8vfWSmXwZDsI1weiusqKvTyvqIAS1FiqPTrU2nwtChquVOCXJx
 4OXVgpCycV8T8Tt0U641JGVwA0Cvk0Mvl94aCGZO/PHj0lbGRFN3e5wJwczoLE/aDz3q
 dqv4U1sPfBVqmV/bD0144PJrDWXrn+kmas7ITntNI6YLKJVyz0c37hdbG4CsAb6cB4j0
 j0/Q==
X-Gm-Message-State: AOAM533Ch/qet4Yow1rImu0wJpGjBsYfIR1J5UacS+yKHdQTu9W270y9
 Swio1dmcJH57kGBmFuqGH2sxGPQk1PE5/58aYZncAm2S2in+8sa84hRFL4qkusbOVBUxQR/tjVG
 qf7ixkbVgBJ3bRD1YvC4bL/nuwL3XVg0=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr976981otq.374.1632343147895; 
 Wed, 22 Sep 2021 13:39:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcd41zaMdlS+W95DOt71mgbu0GwsICsdz5/1tGmBmNdKcM47+ShqT56To+sG54J7rW3HbQHhJo9mnxnLIMimM=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr976965otq.374.1632343147747; 
 Wed, 22 Sep 2021 13:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-15-jsnow@redhat.com>
 <78ba9506-5c79-8018-3f73-a2701d313429@redhat.com>
 <CAFn=p-aAVq6MEHtrsfw3aV0y5eQzN8OpLWJjtZZ6RGXH1geTUQ@mail.gmail.com>
In-Reply-To: <CAFn=p-aAVq6MEHtrsfw3aV0y5eQzN8OpLWJjtZZ6RGXH1geTUQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 16:38:57 -0400
Message-ID: <CAFn=p-a910VFGYeoDQpVxTwhpVJKz3Tym9cvaZ17SVyuvWbwpQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] iotests/linters: Add workaround for mypy bug
 #9852
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000792f4205cc9b815d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000792f4205cc9b815d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 4:37 PM John Snow <jsnow@redhat.com> wrote:

>
> On Fri, Sep 17, 2021 at 7:16 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>>
>> Question is, when =E2=80=9Ccan we use=E2=80=9D mypy >=3D 0.920?  Should =
we check the
>> version string and append this switch as required?
>>
>>
> The answer to that question depends on how the block maintainers feel
> about what environments they expect this test to be runnable under. I
> lightly teased kwolf once about an "ancient" version of pylint they were
> running, but felt kind of bad about it in retrospect: the tests I write
> should "just work" for everyone without them needing to really know
> anything about python or setting up or managing their dependencies,
> environments, etc.
>
> (1) We can use it the very moment it is released if you're OK with runnin=
g
> 'make check-dev' from the python/ directory. That script sets up its own
> virtual environment and manages its own dependencies. If I set a new
> minimum version, it will always use it. (Same story for 'make check-tox',
> or 'make check-pipenv'. The differences between the tests are primarily o=
n
> what other dependencies they have on your environment -- the details are
> boring, see python/Makefile for further reading if desired.)
>
> (2) Otherwise, it depends on how people feel about being able to run this
> test directly from iotests and what versions of mypy/pylint they are usin=
g.
> Fedora 33 for instance has 0.782-2.fc33 still, so I can't really "expect"
> people to have a bleeding-edge version of mypy unless they went out of
> their way to install one themselves. (pip3 install --user --upgrade mypy,
> by the way.) Since people are used to running these python scripts
> *outside* of a managed environment (using their OS packages directly), I
> have largely made every effort to support versions as old as I reasonably
> can -- to avoid disruption whenever I possibly can.
>
> So, basically, it kind of depends on if you want to keep 297 or not.
> Keeping it implies some additional cost for the sake of maximizing
> compatibility. If we ditch it, you can let the scripts in ./python do the=
ir
> thing and set up their own environments to run tests that should probably
> "just work" for everyone.297 could even just be updated to a bash script
> that just hopped over to ./python and ran a special avocado command that
> ran /only/ the iotest linters, if you wanted. I just felt that step #1 wa=
s
> to change as little as possible, prove the new approach worked, and then
> when folks were comfortable with it drop the old approach.
>
>

Oh, uh, and to answer your more concrete question: Nah, we don't need to
conditionally append this workaround. The speed lost from making the check
incremental is made up for by not invoking the tool 20 times, so it's OK to
just unconditionally add it for now.

--000000000000792f4205cc9b815d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 4:37 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, Sep 17, 2021 at 7:16 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Question is, when =E2=80=9Ccan we use=E2=80=9D mypy &gt;=3D 0.920?=C2=A0 Sh=
ould we check the <br>
version string and append this switch as required?<br>
<br></blockquote><div><br></div><div><div>The answer to that question depen=
ds on how the block maintainers feel about what environments they expect th=
is test to be runnable under. I lightly teased kwolf once about an &quot;an=
cient&quot; version of pylint they were running, but felt kind of bad about=
 it in retrospect: the tests I write should &quot;just work&quot; for every=
one without them needing to really know anything about python or setting up=
 or managing their dependencies, environments, etc.<br></div><div><br></div=
><div>(1) We can use it the very moment it is released if you&#39;re OK wit=
h running &#39;make check-dev&#39; from the python/ directory. That script =
sets up its own virtual environment and manages its own dependencies. If I =
set a new minimum version, it will always use it. (Same story for &#39;make=
 check-tox&#39;, or &#39;make check-pipenv&#39;. The differences between th=
e tests are primarily on what other dependencies they have on your environm=
ent -- the details are boring, see python/Makefile for further reading if d=
esired.)<br></div><div><br></div><div>(2) Otherwise, it depends on how peop=
le feel about being able to run this test directly from iotests and what ve=
rsions of mypy/pylint they are using. Fedora 33 for instance has 0.782-2.fc=
33 still, so I can&#39;t really &quot;expect&quot; people to have a bleedin=
g-edge version of mypy unless they went out of their way to install one the=
mselves. (pip3 install --user --upgrade mypy, by the way.) Since people are=
 used to running these python scripts *outside* of a=20
managed environment (using their OS packages directly), I have largely=20
made every effort to support versions as old as I reasonably can -- to=20
avoid disruption whenever I possibly can.</div><div><br></div><div>So, basi=
cally, it kind of depends on if you want to keep 297 or not. Keeping it imp=
lies some additional cost for the sake of maximizing compatibility. If we d=
itch it, you can let the scripts in ./python do their thing and set up thei=
r own environments to run tests that should probably &quot;just work&quot; =
for everyone.297 could even just be updated to a bash script that just hopp=
ed over to ./python and ran a special avocado command that ran /only/ the i=
otest linters, if you wanted. I just felt that step #1 was to change as lit=
tle as possible, prove the new approach worked, and then when folks were co=
mfortable with it drop the old approach.<br> </div></div><div>=C2=A0</div><=
/div></div></blockquote><div><br></div><div>Oh, uh, and to answer your more=
 concrete question: Nah, we don&#39;t need to conditionally append this wor=
karound. The speed lost from making the check incremental is made up for by=
 not invoking the tool 20 times, so it&#39;s OK to just unconditionally add=
 it for now.<br></div></div></div>

--000000000000792f4205cc9b815d--


