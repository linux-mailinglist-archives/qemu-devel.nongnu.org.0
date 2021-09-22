Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE55415180
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:38:49 +0200 (CEST)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT90x-0005bR-QH
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT8zt-0004vm-Vf
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT8zr-0003pz-1i
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632343058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DT+18n5ZF/lkHlQHJ5DXna0eSwYfTq2CbpD3ecMuATQ=;
 b=SRpNvhw2fz9ae0TwK0BvPUe57tM7XZJLJMAj7XxX7LaidlJ5YCvhMYbo8mKqy8FIvRdcee
 rU4Lq8rhi5iraO9Bm/pNouEJyX67I6MD610DVhUR8f8sQHTQCMVdbj+JVVoTqX/jGDSOIB
 fjO3slxz8NLWhsJod1kdjxCfZua0o8Y=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-yQJJ1aGKOUekVzjmv1o51Q-1; Wed, 22 Sep 2021 16:37:35 -0400
X-MC-Unique: yQJJ1aGKOUekVzjmv1o51Q-1
Received: by mail-oo1-f69.google.com with SMTP id
 d6-20020a4a8806000000b0029acf18dcffso2424104ooi.11
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 13:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DT+18n5ZF/lkHlQHJ5DXna0eSwYfTq2CbpD3ecMuATQ=;
 b=rSoUO3VI3qfJInSv1RrTRst209lUquoxbV5TqHyQdRttKBdxaqli/4G3RD7hFLr6fx
 vset8UtsGr0M2XDawUyz1h7Tj2jx1Q3XDz0Q+pNUndvIg+e/8M6MV5tO1V5dJSwbnsb1
 oU82SYYSv1DX8wf40qkOWB0qwYnXScsQBAJRyrgHga/F+vGDOQprJ/w5R1n5F+NjQfqv
 8lcvMJO7wUsOrYiaMjFGuV7i136d0261uEq/V5IQVz3jfrubCxggpzUVEFxs7Fj9s4tB
 1WgTaKfPrdHXWpBTS3yDswgy3V8+SABfT1KqxZr6Szt9g1lzKUY6OfBJN42+vHGXhbMD
 T4vw==
X-Gm-Message-State: AOAM532hoPI8CuTvOT7Wg/W0xvRtpCVoiZPyTpOHhrBVQ2w9gXV9ode8
 ++oJGu0vOg0qzzy9AfhcqCGpkOTqLE34nsKjBC/G6rNwr5HR7vpA0Jpdv8ws3aaQbfwDUww3r2q
 scWjChNCj4zUSpVxruQKTE1dMkdYfxvM=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr983426otj.129.1632343054432;
 Wed, 22 Sep 2021 13:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQMflsvGKX55lijvmahI8t7Dpr8L00ygz/8lqRbNCy6AHGFQ7Odn5pcjqgHnlOw+IZem3ZCcezWx/hvQkGQBw=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr983417otj.129.1632343054229;
 Wed, 22 Sep 2021 13:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-15-jsnow@redhat.com>
 <78ba9506-5c79-8018-3f73-a2701d313429@redhat.com>
In-Reply-To: <78ba9506-5c79-8018-3f73-a2701d313429@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 16:37:23 -0400
Message-ID: <CAFn=p-aAVq6MEHtrsfw3aV0y5eQzN8OpLWJjtZZ6RGXH1geTUQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] iotests/linters: Add workaround for mypy bug
 #9852
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e6367e05cc9b7bb6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

--000000000000e6367e05cc9b7bb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 7:16 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 16.09.21 06:09, John Snow wrote:
> > This one is insidious: if you use the invocation
> > "from {namespace} import {subpackage}" as mirror-top-perms does,
> > mypy will fail on every-other invocation *if* the package being
> > imported is a package.
> >
> > Now, I could just edit mirror-top-perms to avoid this invocation, but
> > since I tripped on a landmine, I might as well head it off at the pass
> > and make sure nobody else trips on the same landmine.
> >
> > It seems to have something to do with the order in which files are
> > checked as well, meaning the random order in which set(os.listdir())
> > produces the list of files to test will cause problems intermittently.
> >
> > mypy >=3D 0.920 isn't released yet, so add this workaround for now.
> >
> > See also:
> >   https://github.com/python/mypy/issues/11010
> >   https://github.com/python/mypy/issues/9852
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/linters.py | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/tests/qemu-iotests/linters.py
> b/tests/qemu-iotests/linters.py
> > index 4df062a973..9c97324e87 100755
> > --- a/tests/qemu-iotests/linters.py
> > +++ b/tests/qemu-iotests/linters.py
> > @@ -100,6 +100,9 @@ def run_linters(
> >                   '--warn-unused-ignores',
> >                   '--no-implicit-reexport',
> >                   '--namespace-packages',
> > +                # Until we can use mypy >=3D 0.920, see
> > +                # https://github.com/python/mypy/
> <https://github.com/python/mypy/issues/9852>issues
> <https://github.com/python/mypy/issues/9852>/9852
> <https://github.com/python/mypy/issues/9852>
> > +                '--no-incremental',
> >                   filename,
> >               ),
>
> I=E2=80=99m afraid I still don=E2=80=99t really understand this, but I=E2=
=80=99m happy with this
> given as the reported workaround and you saying it works.
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
> Question is, when =E2=80=9Ccan we use=E2=80=9D mypy >=3D 0.920?  Should w=
e check the
> version string and append this switch as required?
>
>
The answer to that question depends on how the block maintainers feel about
what environments they expect this test to be runnable under. I lightly
teased kwolf once about an "ancient" version of pylint they were running,
but felt kind of bad about it in retrospect: the tests I write should "just
work" for everyone without them needing to really know anything about
python or setting up or managing their dependencies, environments, etc.

(1) We can use it the very moment it is released if you're OK with running
'make check-dev' from the python/ directory. That script sets up its own
virtual environment and manages its own dependencies. If I set a new
minimum version, it will always use it. (Same story for 'make check-tox',
or 'make check-pipenv'. The differences between the tests are primarily on
what other dependencies they have on your environment -- the details are
boring, see python/Makefile for further reading if desired.)

(2) Otherwise, it depends on how people feel about being able to run this
test directly from iotests and what versions of mypy/pylint they are using.
Fedora 33 for instance has 0.782-2.fc33 still, so I can't really "expect"
people to have a bleeding-edge version of mypy unless they went out of
their way to install one themselves. (pip3 install --user --upgrade mypy,
by the way.) Since people are used to running these python scripts
*outside* of a managed environment (using their OS packages directly), I
have largely made every effort to support versions as old as I reasonably
can -- to avoid disruption whenever I possibly can.

So, basically, it kind of depends on if you want to keep 297 or not.
Keeping it implies some additional cost for the sake of maximizing
compatibility. If we ditch it, you can let the scripts in ./python do their
thing and set up their own environments to run tests that should probably
"just work" for everyone.297 could even just be updated to a bash script
that just hopped over to ./python and ran a special avocado command that
ran /only/ the iotest linters, if you wanted. I just felt that step #1 was
to change as little as possible, prove the new approach worked, and then
when folks were comfortable with it drop the old approach.


> Hanna
>
>

--000000000000e6367e05cc9b7bb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 7:16 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16.09.2=
1 06:09, John Snow wrote:<br>
&gt; This one is insidious: if you use the invocation<br>
&gt; &quot;from {namespace} import {subpackage}&quot; as mirror-top-perms d=
oes,<br>
&gt; mypy will fail on every-other invocation *if* the package being<br>
&gt; imported is a package.<br>
&gt;<br>
&gt; Now, I could just edit mirror-top-perms to avoid this invocation, but<=
br>
&gt; since I tripped on a landmine, I might as well head it off at the pass=
<br>
&gt; and make sure nobody else trips on the same landmine.<br>
&gt;<br>
&gt; It seems to have something to do with the order in which files are<br>
&gt; checked as well, meaning the random order in which set(os.listdir())<b=
r>
&gt; produces the list of files to test will cause problems intermittently.=
<br>
&gt;<br>
&gt; mypy &gt;=3D 0.920 isn&#39;t released yet, so add this workaround for =
now.<br>
&gt;<br>
&gt; See also:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/python/mypy/issues/11010" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/python/mypy/issues/11=
010</a><br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/python/mypy/issues/9852" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/python/mypy/issues/985=
2</a><br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linter=
s.py<br>
&gt; index 4df062a973..9c97324e87 100755<br>
&gt; --- a/tests/qemu-iotests/linters.py<br>
&gt; +++ b/tests/qemu-iotests/linters.py<br>
&gt; @@ -100,6 +100,9 @@ def run_linters(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;--warn-unused-ignores&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;--no-implicit-reexport&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;--namespace-packages&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Until we ca=
n use mypy &gt;=3D 0.920, see<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"=
https://github.com/python/mypy/issues/9852" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/python/mypy/</a><a href=3D"https://github.com/pyth=
on/mypy/issues/9852" rel=3D"noreferrer" target=3D"_blank">issues</a><a href=
=3D"https://github.com/python/mypy/issues/9852" rel=3D"noreferrer" target=
=3D"_blank">/9852</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--no-inc=
remental&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
lename,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0),<br>
<br>
I=E2=80=99m afraid I still don=E2=80=99t really understand this, but I=E2=
=80=99m happy with this <br>
given as the reported workaround and you saying it works.<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br>
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
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Hanna<br>
<br></blockquote><div><br></div><div><br></div></div></div>

--000000000000e6367e05cc9b7bb6--


