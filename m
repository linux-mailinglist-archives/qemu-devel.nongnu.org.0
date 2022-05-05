Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553D51BEB1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:58:02 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nma7N-0000F0-74
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nma56-0005MR-PQ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:55:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:57058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nma52-0002RZ-Sh
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651751735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=na02PaHA9ZlYb59XiBDVeanHG61SISNzSx7OfF1dTGw=;
 b=XeosmE+v61vK5+4AOvKmB4M25IvdQLImfUU9gzOK5dP10qlfcRtKVUjAoQuZ3nCLLBzVev
 WcNmV2AraCTFnPdYdL60Of02fhSnoqgW9bs3eQnNDWe5ACfTMqtaaJC9WVBhZiQDns8891
 uHW/h6xsklUKLTrCl9a70O2C/vEfS1c=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-OH8mt6kOPViPdezRcneABQ-1; Thu, 05 May 2022 07:55:34 -0400
X-MC-Unique: OH8mt6kOPViPdezRcneABQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 v17-20020ab06591000000b003602b03dbfeso1771737uam.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 04:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=na02PaHA9ZlYb59XiBDVeanHG61SISNzSx7OfF1dTGw=;
 b=6/f3hy2MrAiSUwSUAHrMB8NQAmurLrFJv/iY5qY7J9KrKKx6dmkXlOE1HU9/VwDa/j
 sCxgguRAaIvltTrwQ9mPnlD0+4QXALm/lTmOm6vwEtW4k5ASXlPjrcSbjEjYiCC6kAr5
 9pTnht0Bo7W8D1aYScUVUZc6xefiaplGXa2Sy8xp5W9uBdcfTtIKHv2YEMg1AuNwQAXj
 DvfdKx8Ryf0XQxw6TLg7vhidpPV03YwoisAG6/4/7cJeBfzKgBcQNJawtIS/gAi9igRO
 3nKTMbIR4PXd/Z4UD+Jgc+A0v0kMXH055nVcxupjBI9JWeqErOhGDg/oJd41xsmD57te
 tn3Q==
X-Gm-Message-State: AOAM530nO/q0Zgwcve7wsBgBbWj4KEO3rfSuUQJdS8Z4tIjOxAI63pu8
 6SfPkOfHxOprsnUwvuFiXwIqwSJDFS8mS0EIQW/3/m0lxJcsn2WYcqKiTSz/Cxg3KWlb13k5RP8
 GUBoAf3gsPZmQEJIYaM/BPyshPWgpDq4=
X-Received: by 2002:a05:6102:320c:b0:32c:ffc1:ff1c with SMTP id
 r12-20020a056102320c00b0032cffc1ff1cmr7891579vsf.35.1651751733594; 
 Thu, 05 May 2022 04:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5qWOA0nWWnIDsu8U7+kQSN6kVUHY+QTNIXaHVGmS7vrXD3FTEWKfO+ojlaZhJ2i5aXwbMcJnc+ak1591R3ow=
X-Received: by 2002:a05:6102:320c:b0:32c:ffc1:ff1c with SMTP id
 r12-20020a056102320c00b0032cffc1ff1cmr7891572vsf.35.1651751733414; Thu, 05
 May 2022 04:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOQAP1J94zH1pEK@redhat.com>
In-Reply-To: <YnOQAP1J94zH1pEK@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 May 2022 07:55:22 -0400
Message-ID: <CAFn=p-adLFUCLvFgKtrKv3wzqWGTMJLUaE9v9_h-fBCbEddqwg@mail.gmail.com>
Subject: Re: iotests and python dependencies
To: Kevin Wolf <kwolf@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000053e48b05de426b17"
Received-SPF: pass client-ip=170.10.129.74; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000053e48b05de426b17
Content-Type: text/plain; charset="UTF-8"

On Thu, May 5, 2022, 4:51 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 04.05.2022 um 21:38 hat John Snow geschrieben:
> > Howdy!
> >
> > So, I want to finally delete python/qemu/qmp from qemu.git, and this
> > creates a small problem -- namely, iotests needs access to it in order
> > to run the python-based tests.
> >
> > What I think needs to happen is that we create a virtual environment
> > that installs python/qemu/. The reason this cannot be done with
> > PYTHONPATH alone anymore is because the qmp package itself won't be
> > there anymore, we need an installer like `pip` to actually fetch it
> > for us and put it somewhere. (i.e., we need to process the
> > dependencies of python/qemu now and can't treat it as a pre-installed
> > location.)
> >
> > Avocado tests are already creating a venv for the purposes of
> > installing and running Avocado. We can amend e.g. "../../python" to
> > tests/requirements.txt and the Avocado environment is A-OK good-to-go.
> > The Makefile magic for avocado tests creates a venv-per-build.
>
> "per build" sounded pretty bad, because I thought it meant building a
> new venv every time I run either 'make' or the tests. This would
> obviously be very noticable for short-running tests like some iotests.
> But fortunately this is not what it does, it keeps the venv around in
> the build directory. So it's only per build directory really, which I
> guess is fine.
>

Whoops, yeah. I meant per build directory. In contrast to the Python unit
tests themselves, which create some test venvs tied directly to the source
directory and are build-agnostic.


> > It seems to work well enough. One thing to note here is that the
> > supported invocation for avocado tests is only through the Makefile,
> > which handles creating and entering the venv to make the command
> > seamless.
> >
> > iotests, however, manages its own execution environment with
> > testenv.py, and we support running iotests from outside of the
> > Makefile, for example by going to $build/tests/qemu-iotests and
> > running ./check.
>
> Yes, and I agree that this is important.
>

Figured as much. Not plotting to take this away, I promise. Just getting my
requirements straight before I spend time concocting something.


> > Now ... I could update testenv.py to be smart enough to create and
> > enter a python venv, and have even prototyped this. It seems to work
> > pretty well! This approach seemed like the least invasive to how
> > iotests are expected to be run and used. But a downside with this
> > approach is that now avocado tests and iotests are each managing their
> > own python venv. Worse, vm-tests and device-crash-test are still
> > unhandled entirely.
>
> Is there a reason why testenv.py couldn't enter just the shared venv in
> build/tests/venv?
>

It can, but it'd have to be made first so it can enter it. I figured this
would only happen "on-demand", like how check-avocado works, so I'd need
some way for iotests and the Makefile to share the venv creation code,
which is certainly an option.


> If not, I guess it would be enough if iotests just checks that the venv
> exists and all of the dependencies are there in the right version and
> error out if not, telling the user to run 'make check-venv'.
>

I will spend unreasonable engineering hours avoiding this, if only for
pride. I want everything to be as seamless and easy as it's always been.


> Or actually, it could just unconditionally run 'make check-venv' by
> itself, which is probably easier to implement than checking the
> dependencies and more convenient for the user, too.
>

Oh, that's one way to get them to share the venv-creation pathway. Hadn't
occurred to me, but this might be easy to do.


> (One more detail: 'make check-venv GIT_SUBMODULES_ACTION=ignore' seems
> to make it pretty much instantaneous if the venv is current, but leaving
> the submodule mechanism enabled adds a noticable delay.)
>

Noted.


> > I'd like to find a solution where I create a unified python testing
> > venv tied to the build shared by avocado, iotests, vm-tests and
> > device-crash-test. I'm not completely sure how exactly I'll manage
> > that right now, but I wanted to throw this out there in case there are
> > some requirements I might be overlooking.
> >
> > I think vm-tests and avocado-tests can both have a venv created for
> > them and activated before the test runs. device-crash-test I believe
> > will need a script change in the gitlab ci yaml. iotests is somewhat
> > unique in that it needs to run both by manual invocation and from
> > makefile invocations. If I want a shared VM between all of these, I'll
> > need to isolate the create-and-enter-venv logic somewhere where it can
> > be shared both inside and outside of a Makefile.
>
> If just calling 'make' isn't an option, then moving that part out into a
> separate script probably wouldn't be too hard either. But 'make' has the
> advantage that it already contains the check if the venv is already
> there and requirements.txt hasn't changed, which you would have to
> replicate otherwise.
>

Yeah, exactly.


> Kevin
>

Thanks for the ideas!

As of now, I've got a branch where I've moved vm-tests over onto the same
venv with avocado-tests. If I can bridge the gap to iotests, I'll be pretty
happy.

--00000000000053e48b05de426b17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 5, 2022, 4:51 AM Kevin Wolf &lt;<a href=3D=
"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Am 04.05.2022 um 21:38 hat John Snow geschrieben:<br=
>
&gt; Howdy!<br>
&gt; <br>
&gt; So, I want to finally delete python/qemu/qmp from qemu.git, and this<b=
r>
&gt; creates a small problem -- namely, iotests needs access to it in order=
<br>
&gt; to run the python-based tests.<br>
&gt; <br>
&gt; What I think needs to happen is that we create a virtual environment<b=
r>
&gt; that installs python/qemu/. The reason this cannot be done with<br>
&gt; PYTHONPATH alone anymore is because the qmp package itself won&#39;t b=
e<br>
&gt; there anymore, we need an installer like `pip` to actually fetch it<br=
>
&gt; for us and put it somewhere. (i.e., we need to process the<br>
&gt; dependencies of python/qemu now and can&#39;t treat it as a pre-instal=
led<br>
&gt; location.)<br>
&gt; <br>
&gt; Avocado tests are already creating a venv for the purposes of<br>
&gt; installing and running Avocado. We can amend e.g. &quot;../../python&q=
uot; to<br>
&gt; tests/requirements.txt and the Avocado environment is A-OK good-to-go.=
<br>
&gt; The Makefile magic for avocado tests creates a venv-per-build.<br>
<br>
&quot;per build&quot; sounded pretty bad, because I thought it meant buildi=
ng a<br>
new venv every time I run either &#39;make&#39; or the tests. This would<br=
>
obviously be very noticable for short-running tests like some iotests.<br>
But fortunately this is not what it does, it keeps the venv around in<br>
the build directory. So it&#39;s only per build directory really, which I<b=
r>
guess is fine.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Whoops, yeah. I meant per build directory. In contrast to the=
 Python unit tests themselves, which create some test venvs tied directly t=
o the source directory and are build-agnostic.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
<br>
&gt; It seems to work well enough. One thing to note here is that the<br>
&gt; supported invocation for avocado tests is only through the Makefile,<b=
r>
&gt; which handles creating and entering the venv to make the command<br>
&gt; seamless.<br>
&gt; <br>
&gt; iotests, however, manages its own execution environment with<br>
&gt; testenv.py, and we support running iotests from outside of the<br>
&gt; Makefile, for example by going to $build/tests/qemu-iotests and<br>
&gt; running ./check.<br>
<br>
Yes, and I agree that this is important.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Figured as much. Not plotting to ta=
ke this away, I promise. Just getting my requirements straight before I spe=
nd time concocting something.=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Now ... I could update testenv.py to be smart enough to create and<br>
&gt; enter a python venv, and have even prototyped this. It seems to work<b=
r>
&gt; pretty well! This approach seemed like the least invasive to how<br>
&gt; iotests are expected to be run and used. But a downside with this<br>
&gt; approach is that now avocado tests and iotests are each managing their=
<br>
&gt; own python venv. Worse, vm-tests and device-crash-test are still<br>
&gt; unhandled entirely.<br>
<br>
Is there a reason why testenv.py couldn&#39;t enter just the shared venv in=
<br>
build/tests/venv?<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">It can, but it&#39;d have to be made first so it can enter=
 it. I figured this would only happen &quot;on-demand&quot;, like how check=
-avocado works, so I&#39;d need some way for iotests and the Makefile to sh=
are the venv creation code, which is certainly an option.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
If not, I guess it would be enough if iotests just checks that the venv<br>
exists and all of the dependencies are there in the right version and<br>
error out if not, telling the user to run &#39;make check-venv&#39;.<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I will =
spend unreasonable engineering hours avoiding this, if only for pride. I wa=
nt everything to be as seamless and easy as it&#39;s always been.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
Or actually, it could just unconditionally run &#39;make check-venv&#39; by=
<br>
itself, which is probably easier to implement than checking the<br>
dependencies and more convenient for the user, too.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Oh, that&#39;s one way t=
o get them to share the venv-creation pathway. Hadn&#39;t occurred to me, b=
ut this might be easy to do.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
(One more detail: &#39;make check-venv GIT_SUBMODULES_ACTION=3Dignore&#39; =
seems<br>
to make it pretty much instantaneous if the venv is current, but leaving<br=
>
the submodule mechanism enabled adds a noticable delay.)<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Noted.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
&gt; I&#39;d like to find a solution where I create a unified python testin=
g<br>
&gt; venv tied to the build shared by avocado, iotests, vm-tests and<br>
&gt; device-crash-test. I&#39;m not completely sure how exactly I&#39;ll ma=
nage<br>
&gt; that right now, but I wanted to throw this out there in case there are=
<br>
&gt; some requirements I might be overlooking.<br>
&gt; <br>
&gt; I think vm-tests and avocado-tests can both have a venv created for<br=
>
&gt; them and activated before the test runs. device-crash-test I believe<b=
r>
&gt; will need a script change in the gitlab ci yaml. iotests is somewhat<b=
r>
&gt; unique in that it needs to run both by manual invocation and from<br>
&gt; makefile invocations. If I want a shared VM between all of these, I&#3=
9;ll<br>
&gt; need to isolate the create-and-enter-venv logic somewhere where it can=
<br>
&gt; be shared both inside and outside of a Makefile.<br>
<br>
If just calling &#39;make&#39; isn&#39;t an option, then moving that part o=
ut into a<br>
separate script probably wouldn&#39;t be too hard either. But &#39;make&#39=
; has the<br>
advantage that it already contains the check if the venv is already<br>
there and requirements.txt hasn&#39;t changed, which you would have to<br>
replicate otherwise.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Yeah, exactly.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Kevin<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Thanks for the ideas!</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">As of now, I&#39;ve got a branch where I&#39;ve moved vm-tests over onto=
 the same venv with avocado-tests. If I can bridge the gap to iotests, I&#3=
9;ll be pretty happy.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
</blockquote></div></div></div>

--00000000000053e48b05de426b17--


