Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5C43E67D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:47:34 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8Yv-0008PE-Bu
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mg8GI-000620-6E
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:28:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mg8GD-0003D6-Id
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635438492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zBESVfEvErcpPDdLgkLcxavecODSXLkAiKD33NTGrLg=;
 b=TJVMz8dDJU5Jw/hA5/CAnCp4iufOFJamORY3/LV1bdPaK1n32Hgi8fdiMqJmKQwnvqrd1U
 wEmCq8aaQCqLYxof8YTBw8DdRGkfENcAJ5AscOwi2tYqghE5Z6fM8A45517a0tRopJnJU+
 gUpdV6Ij6kiihlo56tT7CdoYieJ3qzs=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-vsrzAmYWOByTGccgMfx6-g-1; Thu, 28 Oct 2021 12:28:09 -0400
X-MC-Unique: vsrzAmYWOByTGccgMfx6-g-1
Received: by mail-vk1-f197.google.com with SMTP id
 z128-20020a1f9786000000b002dc4d61e86bso2341655vkd.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBESVfEvErcpPDdLgkLcxavecODSXLkAiKD33NTGrLg=;
 b=3MAcuGdgqfYcBuar7xY4O3h9D2ciBoXO/OFmG6BnnNnHF6iPPUrJRVdTJ8e8014E1l
 9Yaw0ONQW+3Sro95N+hSwvXdx9AGQ8k0j6Pe1wLBU9bEEhAAWD9Hck8VH+wrmELkOY4E
 wQ20MzZYEYGLwfNm9ED+qIfBGOuMHma0jx5NFH3DiTkl7IBUlzL0YF3PQoYnyKHuclQR
 78vwrOFzu0hv+KhLO6bEz01fKgLYALHpN+NMB/nExTPMGcv5p1WEnFXmDQbmtlaUG/GO
 FzJfYtOQR0jQnW1ghTz2QhiWy9lOT5+91HCHPzO9WZKcqzDy2YRnfP3AZbWTWh4QAdbQ
 Uwiw==
X-Gm-Message-State: AOAM533YcO9B4mPhG1r9GeTdSN7cL1ceTMkrIejpNBuHQ90CslVaYhMv
 tB0rWmm9xuRtgP6Becx0FToBlWFXKw7O2xeiG4KdvGstOtEF80bJzthdN80SAL5uLBwvts+yLZB
 XGsm6XYuvQGAGyDE+qFEXlVIrGnzTl3U=
X-Received: by 2002:a67:33ce:: with SMTP id z197mr5947162vsz.13.1635438488833; 
 Thu, 28 Oct 2021 09:28:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1NBy8EVjMoZ73Y0Xq11hnUlyP8J7tBXvFZ724Wagj6VYh1cvYYXH3r6G9TohaPDBPjPEfthHOMg9UEWXA1do=
X-Received: by 2002:a67:33ce:: with SMTP id z197mr5947124vsz.13.1635438488633; 
 Thu, 28 Oct 2021 09:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-12-jsnow@redhat.com>
 <ebded478-63ee-a2d2-7b90-d6d6926d9291@redhat.com>
 <CAFn=p-agMGtbryADMxgiG5OLFSXyZd+Zf9YrJyyyRVXgN2UGgA@mail.gmail.com>
 <f9dd697b-02ef-7f67-32ff-595e9f2d9457@redhat.com>
In-Reply-To: <f9dd697b-02ef-7f67-32ff-595e9f2d9457@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 28 Oct 2021 12:27:59 -0400
Message-ID: <CAFn=p-YJgm8n5cPvnDFqKvxLDTvkh8-YZ3KCUXQTpkXaOcUXyQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] iotests: split linters.py out from 297
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002ad5aa05cf6c3205"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002ad5aa05cf6c3205
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021, 6:34 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 26.10.21 20:30, John Snow wrote:
> >
> >
> > On Tue, Oct 26, 2021 at 6:51 AM Hanna Reitz <hreitz@redhat.com> wrote:
> >
> >     On 19.10.21 16:49, John Snow wrote:
> >     > Now, 297 is just the iotests-specific incantations and
> >     linters.py is as
> >     > minimal as I can think to make it. The only remaining element in
> >     here
> >     > that ought to be configuration and not code is the list of skip
> >     files,
> >     > but they're still numerous enough that repeating them for mypy an=
d
> >     > pylint configurations both would be ... a hassle.
> >     >
> >     > Signed-off-by: John Snow <jsnow@redhat.com>
> >     > ---
> >     >   tests/qemu-iotests/297        | 72
> >     +++++----------------------------
> >     >   tests/qemu-iotests/linters.py | 76
> >     +++++++++++++++++++++++++++++++++++
> >     >   2 files changed, 87 insertions(+), 61 deletions(-)
> >     >   create mode 100644 tests/qemu-iotests/linters.py
> >
> >     Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> >
> >
> > Thanks!
> >
> >     I wonder about `check_linter()`, though.  By not moving it to
> >     linters.py, we can=E2=80=99t use it in its entry point, and so the =
Python
> >     test
> >     infrastructure will have a strong dependency on these linters. Thou=
gh
> >     then again, it probably already does, and I suppose that=E2=80=99s =
one of the
> >     points hindering us from running this from make check?
> >
> >
> > That one is left behind because it uses iotests API to skip a test.
> > Environment setup that guarantees we won't *need* to skip the test is
> > handled by the virtual environment setup magic in qemu/python/Makefile.
> >
> >     Hanna
> >
> >
> > More info than you require:
> >
> > There's maybe about four ways you could run the python tests that
> > might make sense depending on who you are and what you're trying to
> > accomplish; they're documented in "make help" and again in
> > qemu/python/README.rst;
> >
> > (1) make check-dev -- makes a venv with whatever python you happen to
> > have, installs the latest packages, runs the tests
> > (2) make check-pipenv -- requires python 3.6 specifically, installs
> > the *oldest* packages, runs the tests
> > (3) make check-tox -- requires python 3.6 through 3.10, installs the
> > newest packages, runs the tests per each python version
> > (4) make check -- perform no setup at all, just run the tests in the
> > current environment. (Used directly by all three prior invocations)
>
> AFAIU these are all to be run in build/python?  Isn=E2=80=99t any of them=
 hooked
> up to the global `make check` in build?  Because...
>

None of them are on make check, correct. Not yet. I'll try to make that
happen soon to drop 297.

They run out of the source tree directly, since they're checks on the
source and aren't actually related to a build of QEMU in any way.

(Y'know, yet. I'm not saying never.)


> In general, I assume that human beings that aren't working on Python
> > stuff actively will be using (1) at their interactive console, if they
> > decide to run any of these at all.
>
> ...I=E2=80=99m just running `make check` in the build directory.
>

Yeah, that's OK. I mean, I don't expect you to run them unless you were
submitting a series to specifically me.

("If they decide to run any of these at all" - I'm aware that very few
people would or are doing so. I consider the CI to be mostly for me as the
maintainer to make sure nothing regressed.)


> I would have hoped that this is hooked up to something that won=E2=80=99t=
 fail
> because I don=E2=80=99t have some necessary tools installed or perhaps ev=
en
> because I have the wrong version of some tools installed (although the
> latter would be kind of questionable...).  Would be nice if the global
> `make check` had a summary on what was skipped...
>


I mean. These targets shouldn't fail unless you're missing some really
basic requirements. They're just not hooked in to the big "make check" yet.

In terms of environment probing and skipping the tests, though, I do need
another layer somewhere to manage that. Stuff I'll need to put in
configure/meson etc. I have to look into it.


> > It imposes the least pre-requirements while still endeavoring to be a
> > target that will "just work".
> > Options (2) and (3) are what power the CI tests 'check-python-pipenv'
> > and 'check-python-tox', respectively; with(2) being the one that
> > actually gates the CI.
> > Option (4) is only really a convenience for bypassing the venv-setup
> > stuff if you want to construct your own (or not use one at all). So
> > the tests just assume that the tools they have available will work.
> > It's kind of a 'power user' target.
> >
> > The way the CI works at the moment is that it uses a "fedora:latest"
> > base image and installs python interpreters 3.6 through 3.10
> > inclusive, pipenv, and tox. From there, it has enough juice to run the
> > makefile targets which take care of all of the actual linting
> > dependencies and their different versions to get a wider matrix on the
> > version testing to ensure we're still keeping compatibility with the
> > 3.6 platform while also checking for new problems that show up on the
> > bleeding edge.
>
> Perhaps it=E2=80=99s unreasonable, but I=E2=80=99d prefer if a local `mak=
e check` would
> already run most tests in some form or another and that I don=E2=80=99t h=
ave to
> push to gitlab and wait for the CI there.
>

Yep, understand. That's a requirement for me as well in order to drop 297.
On the list, I promise.


> I mean, I can of course also integrate a `cd python && make check-dev`
> invocation into my test scripts, but it doesn=E2=80=99t feel right to
> special-case one test area.
>

Don't worry, I don't expect that. It just took a lot of work to standardize
even that much of the test, so I went for the smaller thing instead of the
perfect thing. I'm still inching along to the perfect thing, but considered
the iotest cleanups I've done a requisite on that path.



> > iotests 297 right now doesn't do any python environment setup at all,
> > so we can't guarantee that the linters are present, so we decide to
> > allow the test to be skipped. My big hesitation of adding this test
> > directly into 'make check' is that I will need to do some environment
> > probing to make sure that the 'pylint' version isn't too old -- or
> > otherwise set up a venv in the build directory that can be used to run
> > tests. I know we already set one up for the acceptance tests, so maybe
> > there's an opportunity to re-use that venv, but I need to make sure
> > that the dependencies between the two sets of tests are aligned. I
> > don't know if they agree, currently.
>
> I see.
>
> > I think I probably want to minimize the number of different virtual
> > python environments we create during the build, so I will look into
> > what problems might exist in re-purposing the acceptance test venv. If
> > that can get squared away easily, there's likely no real big barrier
> > to adding more tests that rely on a python venv to get cooking during
> > the normal build/check process, including iotest 297.
>
> OK, thanks for the explanation!
>
> Hanna
>

Yep. I'll start trying to integrate this into make check and see where the
problems are. It should be safe to do during soft freeze, I think, since
it's just testing ...

--0000000000002ad5aa05cf6c3205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Oct 28, 2021, 6:34 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 26.10.21 20:30, John Snow wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 26, 2021 at 6:51 AM Hanna Reitz &lt;<a href=3D"mailto:hrei=
tz@redhat.com" target=3D"_blank" rel=3D"noreferrer">hreitz@redhat.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 19.10.21 16:49, John Snow wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Now, 297 is just the iotests-specific incantat=
ions and<br>
&gt;=C2=A0 =C2=A0 =C2=A0linters.py is as<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; minimal as I can think to make it. The only re=
maining element in<br>
&gt;=C2=A0 =C2=A0 =C2=A0here<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; that ought to be configuration and not code is=
 the list of skip<br>
&gt;=C2=A0 =C2=A0 =C2=A0files,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; but they&#39;re still numerous enough that rep=
eating them for mypy and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; pylint configurations both would be ... a hass=
le.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto=
:jsnow@redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0tests/qemu-iotests/297=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 72<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++----------------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 76=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A02 files changed, 87 insertions(+),=
 61 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 tests/qemu-iote=
sts/linters.py<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hrei=
tz@redhat.com" target=3D"_blank" rel=3D"noreferrer">hreitz@redhat.com</a>&g=
t;<br>
&gt;<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I wonder about `check_linter()`, though.=C2=A0 By n=
ot moving it to<br>
&gt;=C2=A0 =C2=A0 =C2=A0linters.py, we can=E2=80=99t use it in its entry po=
int, and so the Python<br>
&gt;=C2=A0 =C2=A0 =C2=A0test<br>
&gt;=C2=A0 =C2=A0 =C2=A0infrastructure will have a strong dependency on the=
se linters. Though<br>
&gt;=C2=A0 =C2=A0 =C2=A0then again, it probably already does, and I suppose=
 that=E2=80=99s one of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0points hindering us from running this from make che=
ck?<br>
&gt;<br>
&gt;<br>
&gt; That one is left behind because it uses iotests API to skip a test. <b=
r>
&gt; Environment setup that guarantees we won&#39;t *need* to skip the test=
 is <br>
&gt; handled by the virtual environment setup magic in qemu/python/Makefile=
.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hanna<br>
&gt;<br>
&gt;<br>
&gt; More info than you require:<br>
&gt;<br>
&gt; There&#39;s maybe about four ways you could run the python tests that =
<br>
&gt; might make sense depending on who you are and what you&#39;re trying t=
o <br>
&gt; accomplish; they&#39;re documented in &quot;make help&quot; and again =
in <br>
&gt; qemu/python/README.rst;<br>
&gt;<br>
&gt; (1) make check-dev -- makes a venv with whatever python you happen to =
<br>
&gt; have, installs the latest packages, runs the tests<br>
&gt; (2) make check-pipenv -- requires python 3.6 specifically, installs <b=
r>
&gt; the *oldest* packages, runs the tests<br>
&gt; (3) make check-tox -- requires python 3.6 through 3.10, installs the <=
br>
&gt; newest packages, runs the tests per each python version<br>
&gt; (4) make check -- perform no setup at all, just run the tests in the <=
br>
&gt; current environment. (Used directly by all three prior invocations)<br=
>
<br>
AFAIU these are all to be run in build/python?=C2=A0 Isn=E2=80=99t any of t=
hem hooked <br>
up to the global `make check` in build?=C2=A0 Because...<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">None of them are on=
 make check, correct. Not yet. I&#39;ll try to make that happen soon to dro=
p 297.</div><div dir=3D"auto"><br></div><div dir=3D"auto">They run out of t=
he source tree directly, since they&#39;re checks on the source and aren&#3=
9;t actually related to a build of QEMU in any way.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">(Y&#39;know, yet. I&#39;m not saying never.)</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; In general=
, I assume that human beings that aren&#39;t working on Python <br>
&gt; stuff actively will be using (1) at their interactive console, if they=
 <br>
&gt; decide to run any of these at all.<br>
<br>
...I=E2=80=99m just running `make check` in the build directory.<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah, that&=
#39;s OK. I mean, I don&#39;t expect you to run them unless you were submit=
ting a series to specifically me.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">(&quot;If they decide to run any of these at all&quot; - I&#39;m =
aware that very few people would or are doing so. I consider the CI to be m=
ostly for me as the maintainer to make sure nothing regressed.)</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
I would have hoped that this is hooked up to something that won=E2=80=99t f=
ail <br>
because I don=E2=80=99t have some necessary tools installed or perhaps even=
 <br>
because I have the wrong version of some tools installed (although the <br>
latter would be kind of questionable...).=C2=A0 Would be nice if the global=
 <br>
`make check` had a summary on what was skipped...<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I mean. These targets shouldn&#39;t fail unless you&#39;re missing some r=
eally basic requirements. They&#39;re just not hooked in to the big &quot;m=
ake check&quot; yet.</div><div dir=3D"auto"><br></div><div dir=3D"auto">In =
terms of environment probing and skipping the tests, though, I do need anot=
her layer somewhere to manage that. Stuff I&#39;ll need to put in configure=
/meson etc. I have to look into it.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; It imposes the least pre-requirements while still endeavoring to be a =
<br>
&gt; target that will &quot;just work&quot;.<br>
&gt; Options (2) and (3) are what power the CI tests &#39;check-python-pipe=
nv&#39; <br>
&gt; and &#39;check-python-tox&#39;, respectively; with(2) being the one th=
at <br>
&gt; actually gates the CI.<br>
&gt; Option (4) is only really a convenience for bypassing the venv-setup <=
br>
&gt; stuff if you want to construct your own (or not use one at all). So <b=
r>
&gt; the tests just assume that the tools they have available will work. <b=
r>
&gt; It&#39;s kind of a &#39;power user&#39; target.<br>
&gt;<br>
&gt; The way the CI works at the moment is that it uses a &quot;fedora:late=
st&quot; <br>
&gt; base image and installs python interpreters 3.6 through 3.10 <br>
&gt; inclusive, pipenv, and tox. From there, it has enough juice to run the=
 <br>
&gt; makefile targets which take care of all of the actual linting <br>
&gt; dependencies and their different versions to get a wider matrix on the=
 <br>
&gt; version testing to ensure we&#39;re still keeping compatibility with t=
he <br>
&gt; 3.6 platform while also checking for new problems that show up on the =
<br>
&gt; bleeding edge.<br>
<br>
Perhaps it=E2=80=99s unreasonable, but I=E2=80=99d prefer if a local `make =
check` would <br>
already run most tests in some form or another and that I don=E2=80=99t hav=
e to <br>
push to gitlab and wait for the CI there.<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Yep, understand. That&#39;s a requ=
irement for me as well in order to drop 297. On the list, I promise.=C2=A0<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
I mean, I can of course also integrate a `cd python &amp;&amp; make check-d=
ev` <br>
invocation into my test scripts, but it doesn=E2=80=99t feel right to <br>
special-case one test area.<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Don&#39;t worry, I don&#39;t expect that. It jus=
t took a lot of work to standardize even that much of the test, so I went f=
or the smaller thing instead of the perfect thing. I&#39;m still inching al=
ong to the perfect thing, but considered the iotest cleanups I&#39;ve done =
a requisite on that path.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; iotests 297 right now doesn&#39;t do any python environment setup at a=
ll, <br>
&gt; so we can&#39;t guarantee that the linters are present, so we decide t=
o <br>
&gt; allow the test to be skipped. My big hesitation of adding this test <b=
r>
&gt; directly into &#39;make check&#39; is that I will need to do some envi=
ronment <br>
&gt; probing to make sure that the &#39;pylint&#39; version isn&#39;t too o=
ld -- or <br>
&gt; otherwise set up a venv in the build directory that can be used to run=
 <br>
&gt; tests. I know we already set one up for the acceptance tests, so maybe=
 <br>
&gt; there&#39;s an opportunity to re-use that venv, but I need to make sur=
e <br>
&gt; that the dependencies between the two sets of tests are aligned. I <br=
>
&gt; don&#39;t know if they agree, currently.<br>
<br>
I see.<br>
<br>
&gt; I think I probably want to minimize the number of different virtual <b=
r>
&gt; python environments we create during the build, so I will look into <b=
r>
&gt; what problems might exist in re-purposing the acceptance test venv. If=
 <br>
&gt; that can get squared away easily, there&#39;s likely no real big barri=
er <br>
&gt; to adding more tests that rely on a python venv to get cooking during =
<br>
&gt; the normal build/check process, including iotest 297.<br>
<br>
OK, thanks for the explanation!<br>
<br>
Hanna<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Yep. I&#39;ll start trying to integrate this into make check and see w=
here the problems are. It should be safe to do during soft freeze, I think,=
 since it&#39;s just testing ...</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"></blockquote></div></div></div>

--0000000000002ad5aa05cf6c3205--


