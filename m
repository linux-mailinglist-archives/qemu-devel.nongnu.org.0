Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5152C204
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 20:23:02 +0200 (CEST)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrOK4-0007vL-QD
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 14:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nrOIX-00074M-Gr
 for qemu-devel@nongnu.org; Wed, 18 May 2022 14:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nrOIV-00074d-Bb
 for qemu-devel@nongnu.org; Wed, 18 May 2022 14:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652898082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FxtRKMmXZ5FlHq7L0wqsSZOzwXNYe0cwrWfv4bxSpgc=;
 b=iNFekLQsP9OPnEOlOkwwN78q04m+JYZy7GwA5h+HaLiUfHQ9qZft9+iI/iYaFUmgPm71VM
 AUgWGEPPTPGSJg7rB1JcQLwI+A/mjp5TfeymgjXfYt7tKHKSX5H02egYa0R1EJ7chf23FJ
 xgrmzupQCymYus9h2aUFtlfyUs6GZus=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-pfoXPrt_NYmFkLATkfqr_Q-1; Wed, 18 May 2022 14:21:19 -0400
X-MC-Unique: pfoXPrt_NYmFkLATkfqr_Q-1
Received: by mail-ua1-f69.google.com with SMTP id
 k40-20020ab059eb000000b00364ef6b085bso1371107uad.0
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 11:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FxtRKMmXZ5FlHq7L0wqsSZOzwXNYe0cwrWfv4bxSpgc=;
 b=zJwS55N0L0dTAdodLur1S2U4aHa5rqoGKB5jzwwWU5YQd8QFcmXpcphenwV6GK4g8/
 rbyx1wqYCHmYj2LX+vGkzhgjOKYrgNJ1wyRa4ywBOaTD342wR5C20S18+GXXJxQK705L
 Re1jcRHQUc6xwrF4dp9lGrbCwYmhU0s3ZBCOUPMg5+3UdDrisQWQ1DNAiWaX9IJuxG3W
 GLJe+zREPND98dxCW8BUOmBvgqBisu8o8derIqnspulVOythHV5GMpyySdP5LOQcEHVt
 aNLleKt3baWVyoPIeKKhiP6BPnenoK3ZO2W0jnNZjlvtcpyHqdn3RWAjEFel3EsViebq
 q36A==
X-Gm-Message-State: AOAM531wShB1GIhSXBfbxNJHe2BvRCosH0bGpMwKrLzYCFn2ujCvpnuR
 EVTIqRll/YFJXIVhhohhlulfud3DdShS2pxp2Z/Ts2QBpW90vyVasMVsGxcwgWnpMRkYghf6mm/
 dEyXxjR0+IPolAUJiiVx2MpKE8dtCZmE=
X-Received: by 2002:ac5:c925:0:b0:34e:3e84:75b8 with SMTP id
 u5-20020ac5c925000000b0034e3e8475b8mr366120vkl.3.1652898078490; 
 Wed, 18 May 2022 11:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhEbi8DX89ZF05JWNIyU2oDbaXZprrg1e8gfKxU5YTwAVRTAfUIARnP2DDn7uOHl/1DQUZfKM710Wh7xe6Hs8=
X-Received: by 2002:ac5:c925:0:b0:34e:3e84:75b8 with SMTP id
 u5-20020ac5c925000000b0034e3e8475b8mr366105vkl.3.1652898078200; Wed, 18 May
 2022 11:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-aEc=uWyGi2758wDwJF=St4ZThkvuDqVXoxTtcHLFZkhA@mail.gmail.com>
 <YoUgufuA8/pjYwTE@redhat.com>
In-Reply-To: <YoUgufuA8/pjYwTE@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 18 May 2022 14:21:08 -0400
Message-ID: <CAFn=p-YUQm-spxrbOgv8xKB3wDMWdTRfSVB6oVOiYh=Eqw=sfA@mail.gmail.com>
Subject: Re: The fate of iotest 297
To: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cd297905df4d521e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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

--000000000000cd297905df4d521e
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022, 12:37 PM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 18.05.2022 um 01:28 hat John Snow geschrieben:
> > Hi Kevin,
> >
> > I remember that you wanted some minimum Niceness threshold in order to
> > agree to me removing iotest 297.
> >
> > I've already moved it onto GitLab CI in the form of the
> > check-python-pipenv job, but I recall you wanted to be able to run it
> > locally as well before agreeing to axe 297. I remember that you didn't
> > think that running "make check-pipenv" from the python directory was
> > sufficiently Nice enough.
> >
> > Do you need it to be part of "make check", or are you OK with
> > something like "make check-python" from the build directory?
> >
> > I have a bit more work to do if you want it to be part of 'make check'
> > (if you happen to have the right packages installed), but it's pretty
> > easy right now to give you a 'make check-python' (where I just
> > forcibly install those packages to the testing venv.)
>
> Hm, what is the reason for 'make check-python' not being part of 'make
> check'?
>

Oh, it just needs more logic so that it performs correctly in RPM building
environments. As a manual test, I'm free to just grab stuff from PyPI and
build a venv to some precise specification and automate it. This is how
"check-pipenv" and "check-tox" work. The RPM environment can't dial out to
PyPI, so it shouldn't try any venv-based tests by default.

To wire it up to "make check" by *default*, I believe I need to expand the
configure script to poll for certain requisites and then create some
wrapper script of some kind that only engages the python tests if the
requisites were met ... and I lose some control over the mypy/pylint
versioning windows. I have to tolerate a wider versioning, or it'll never
get run in practice.

I have some reluctance to doing this, because pylint and mypy change so
frequently that I don't want "make check" to fail spuriously in the future.

(In practice, these failures occur 100% of the time when I am on vacation.)

The gitlab ci job check-python-tox pulls whatever the latest and greatest
are, and these jobs fail so constantly we had to mark the job as optional.
The check-pipenv job by contrast is extremely stable (its still must-pass)
because it can concoct its own lil' universe.

So, I can add something to make check by default but it needs some
scaffolding to skip the test based on environment, and I have some
reliability concerns.

Ultimately, I don't believe tolerating a wide matrix for mypy/pylint really
adds any value to 297; it only really matters if a specific environment
comes up green, and that a developer like you or I can replicate that test
locally and quickly.

That said ... maybe I can add a controlled venv version of "check-python"
and just have a --disable-check-python or something that spec files can opt
into. Maybe that will work well enough?

i.e. maybe configure can check for the presence of pip, the python venv
module (debian doesnt ship it standard...), and PyPI connectivity and if
so, enables the test. Otherwise, we skip it.

Something like that.



> I'm currently running two things locally, 'make check' (which is the
> generic one that everyone should run) and iotests (for which it is
> reasonable enough that I need to run it separately because it's the
> special thing for my own subsystem).
>

Pretty much exactly what I do. (Except I run the python tests these days,
too.)


> Now adding a third one 'make check-python' certainly isn't the end of
> the world, but it's not really something that is tied to my subsystem
> any more. Having to run test cases separately for other subsystems
> doesn't really scale for me, so I would prefer not to start doing that.
> I can usually get away with not running the more special tests of other
> subsystems before the pull request because I'm unlikely to break things
> in other subsystems, but Python style warnings are easy to get.
>

Reasonable. I already forget to run things like avocado and vm tests, and I
am sympathetic to not wanting to expand the list of manually run tests.

(What avocado and vm tests have in common is that they need to fetch stuff
from the internet, which I am learning makes them unsuitable for make
check, which must work without internet. """Coincidentally""", tests that
require internet seem to break an awful lot more often because they are
getting run a lot less and in fewer places.)


> If we're going to have 'make check-python' separate, but CI checks it,
> we'll get pull requests that don't pass it and would then only be caught
> by CI after a long test run, requiring a v2 pull request. I feel for
> something that checks things like style (and will fail frequently on
> code where nobody ran the check before), that's a bit too unfriendly.
>
> Kevin
>

Got it. I'll see what I can come up with that checks the boxes for
everyone, thanks for clarifying yours.

I want to make everything "just work" but I'm also afraid of writing too
much magic crap that could break and frustrate people who have no desire to
understand python packaging junk, so I'm trying to balance that.

(Parting thought: the python ecosystem mantra of "just use a venv!"
unfortunately influences a lot of upstream developer attitude which is then
increasingly hard to square with environments in which I cannot count on
internet or the ability to spin up a venv, and thus my headache.
Overwhelmingly, it seems to be the expectation that you'd just pin or
vendor things like pylint/mypy, because they're not usually runtime deps
for Python packages. Urgh, blegh.)

--js

>

--000000000000cd297905df4d521e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, May 18, 2022, 12:37 PM Kevin Wolf &lt;<a href=
=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Am 18.05.2022 um 01:28 hat John Snow geschrieben:=
<br>
&gt; Hi Kevin,<br>
&gt; <br>
&gt; I remember that you wanted some minimum Niceness threshold in order to=
<br>
&gt; agree to me removing iotest 297.<br>
&gt; <br>
&gt; I&#39;ve already moved it onto GitLab CI in the form of the<br>
&gt; check-python-pipenv job, but I recall you wanted to be able to run it<=
br>
&gt; locally as well before agreeing to axe 297. I remember that you didn&#=
39;t<br>
&gt; think that running &quot;make check-pipenv&quot; from the python direc=
tory was<br>
&gt; sufficiently Nice enough.<br>
&gt; <br>
&gt; Do you need it to be part of &quot;make check&quot;, or are you OK wit=
h<br>
&gt; something like &quot;make check-python&quot; from the build directory?=
<br>
&gt; <br>
&gt; I have a bit more work to do if you want it to be part of &#39;make ch=
eck&#39;<br>
&gt; (if you happen to have the right packages installed), but it&#39;s pre=
tty<br>
&gt; easy right now to give you a &#39;make check-python&#39; (where I just=
<br>
&gt; forcibly install those packages to the testing venv.)<br>
<br>
Hm, what is the reason for &#39;make check-python&#39; not being part of &#=
39;make<br>
check&#39;?<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Oh, it just needs more logic so that it performs correctly in RP=
M building environments. As a manual test, I&#39;m free to just grab stuff =
from PyPI and build a venv to some precise specification and automate it. T=
his is how &quot;check-pipenv&quot; and &quot;check-tox&quot; work. The RPM=
 environment can&#39;t dial out to PyPI, so it shouldn&#39;t try any venv-b=
ased tests by default.</div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
o wire it up to &quot;make check&quot; by *default*, I believe I need to ex=
pand the configure script to poll for certain requisites and then create so=
me wrapper script of some kind that only engages the python tests if the re=
quisites were met ... and I lose some control over the mypy/pylint versioni=
ng windows. I have to tolerate a wider versioning, or it&#39;ll never get r=
un in practice.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have s=
ome reluctance to doing this, because pylint and mypy change so frequently =
that I don&#39;t want &quot;make check&quot; to fail spuriously in the futu=
re.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(In practice, these =
failures occur 100% of the time when I am on vacation.)</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">The gitlab ci job check-python-tox pulls wh=
atever the latest and greatest are, and these jobs fail so constantly we ha=
d to mark the job as optional. The check-pipenv job by contrast is extremel=
y stable (its still must-pass) because it can concoct its own lil&#39; univ=
erse.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So, I can add some=
thing to make check by default but it needs some scaffolding to skip the te=
st based on environment, and I have some reliability concerns.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Ultimately, I don&#39;t believe tole=
rating a wide matrix for mypy/pylint really adds any value to 297; it only =
really matters if a specific environment comes up green, and that a develop=
er like you or I can replicate that test locally and quickly.<br></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">That said ... maybe I can add a c=
ontrolled venv version of &quot;check-python&quot; and just have a --disabl=
e-check-python or something that spec files can opt into. Maybe that will w=
ork well enough?</div><div dir=3D"auto"><br></div><div dir=3D"auto">i.e. ma=
ybe configure can check for the presence of pip, the python venv module (de=
bian doesnt ship it standard...), and PyPI connectivity and if so, enables =
the test. Otherwise, we skip it.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Something like that.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
I&#39;m currently running two things locally, &#39;make check&#39; (which i=
s the<br>
generic one that everyone should run) and iotests (for which it is<br>
reasonable enough that I need to run it separately because it&#39;s the<br>
special thing for my own subsystem).<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Pretty much exactly what I do. (Excep=
t I run the python tests these days, too.)</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Now adding a third one &#39;make check-python&#39; certainly isn&#39;t the =
end of<br>
the world, but it&#39;s not really something that is tied to my subsystem<b=
r>
any more. Having to run test cases separately for other subsystems<br>
doesn&#39;t really scale for me, so I would prefer not to start doing that.=
<br>
I can usually get away with not running the more special tests of other<br>
subsystems before the pull request because I&#39;m unlikely to break things=
<br>
in other subsystems, but Python style warnings are easy to get.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Reasonable. =
I already forget to run things like avocado and vm tests, and I am sympathe=
tic to not wanting to expand the list of manually run tests.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">(What avocado and vm tests have in co=
mmon is that they need to fetch stuff from the internet, which I am learnin=
g makes them unsuitable for make check, which must work without internet. &=
quot;&quot;&quot;Coincidentally&quot;&quot;&quot;, tests that require inter=
net seem to break an awful lot more often because they are getting run a lo=
t less and in fewer places.)</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
If we&#39;re going to have &#39;make check-python&#39; separate, but CI che=
cks it,<br>
we&#39;ll get pull requests that don&#39;t pass it and would then only be c=
aught<br>
by CI after a long test run, requiring a v2 pull request. I feel for<br>
something that checks things like style (and will fail frequently on<br>
code where nobody ran the check before), that&#39;s a bit too unfriendly.<b=
r>
<br>
Kevin<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Got it. I&#39;ll see what I can come up with that checks the boxes for=
 everyone, thanks for clarifying yours.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I want to make everything &quot;just work&quot; but I&#39;m=
 also afraid of writing too much magic crap that could break and frustrate =
people who have no desire to understand python packaging junk, so I&#39;m t=
rying to balance that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(=
Parting thought: the python ecosystem mantra of &quot;just use a venv!&quot=
; unfortunately influences a lot of upstream developer attitude which is th=
en increasingly hard to square with environments in which I cannot count on=
 internet or the ability to spin up a venv, and thus my headache. Overwhelm=
ingly, it seems to be the expectation that you&#39;d just pin or vendor thi=
ngs like pylint/mypy, because they&#39;re not usually runtime deps for Pyth=
on packages. Urgh, blegh.)</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">--js</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"></blockquote></div></div></div>

--000000000000cd297905df4d521e--


