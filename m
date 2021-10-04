Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992BA421795
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 21:31:46 +0200 (CEST)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXTgf-00049r-3t
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 15:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXTbf-0000qY-Uu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXTbb-0005L9-QR
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633375589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=It0YEufLOdOUDuQsoRen1K1DpeAKtoB6tmSdNFuoqWE=;
 b=Mr3OOr2886HCZCv7ZC9X7t1+419BevswBS3GWP4/N+jDzbOzT1lLxxNhKSvfivw7hQYwpH
 dhZIUgdX5ZhiQO60a6WYRB7WU29rJF3pna5VRrZr2eGdrOMOPjDWD0sMXxFusIFGWuRjG6
 C7LfzstKvyFHNz3w71mhbEBwHkp5Ir4=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-zawnakEANnGg9OVnatOlTQ-1; Mon, 04 Oct 2021 15:26:27 -0400
X-MC-Unique: zawnakEANnGg9OVnatOlTQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 f14-20020a1f1f0e000000b0029bc44e6863so4050372vkf.16
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 12:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=It0YEufLOdOUDuQsoRen1K1DpeAKtoB6tmSdNFuoqWE=;
 b=g8GsBttBS6ALOAnJVoi/2D1DCN2RqLoVBajIu0H3zV6mlbZLb1/CrUabo6pO6B4Lev
 Lv9OVrkNiDGGIVys5yKIkDBEjys8i7unm8k/VNmSzCwIJfyRJ+gnKePpSI9BpkjCeHMP
 0HdN5xQa/kUjacVGUYU22MVxMa6YEPvKIW1g2jeOQeSU1f1N6jPBi+b9H8Q7FKo1M2pk
 KsPXCDY6NyQCLlCoXQS3jycNwUe6/0GlnKfv7oW24iIf8UCUwZz7imM+6hTT8OVapHxn
 2f9y5Phk8SOIfmqYZEsuN3zkQyCHzOcGrw382JyJeeh5OnrcP+SVI9l1+HHwOiliz8Mj
 +Dvg==
X-Gm-Message-State: AOAM533im49K2e7dqLdfos+llJWTzB+jVwyQpsmI7/8JYdIafwDa9nue
 OeFRpOV4HCniI5wyZGPzb3fIjaFm120ebhZfJ6deq5NH2BTBSZj5RkJrVRgo8JN1SEhxD8lxf6x
 i/cOdGV3gtrdl0pO8Stv9aPrx/3PdmSE=
X-Received: by 2002:a05:6102:2004:: with SMTP id
 p4mr14864471vsr.27.1633375586811; 
 Mon, 04 Oct 2021 12:26:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycqVIthk5UC9g63Fnp4bKbiYJ7eBteerBWHDSsDSKJqGKYvftTK814+REZ7AOn693WxvUBHb6IJ6USefvRcdg=
X-Received: by 2002:a05:6102:2004:: with SMTP id
 p4mr14864444vsr.27.1633375586547; 
 Mon, 04 Oct 2021 12:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-12-jsnow@redhat.com>
 <f3d43e69-4719-d0b9-79c1-03a7732839ed@redhat.com>
 <CAFn=p-ZXxKDQUxUtupC+arC7_faMFvoJm9XxwxSPDxGRC2Ku=Q@mail.gmail.com>
 <f5004230-4295-61eb-6a0a-25719a545db3@redhat.com>
In-Reply-To: <f5004230-4295-61eb-6a0a-25719a545db3@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 4 Oct 2021 15:26:15 -0400
Message-ID: <CAFn=p-aVHFq6XvsyyeS5UO1kE2WoHrnBL9ouJZ3qmFcf+GFZLw@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] iotests/297: return error code from run_linters()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009f0c1405cd8be3f4"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000009f0c1405cd8be3f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2021 at 3:45 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 22.09.21 22:18, John Snow wrote:
> >
> >
> > On Fri, Sep 17, 2021 at 7:00 AM Hanna Reitz <hreitz@redhat.com
> > <mailto:hreitz@redhat.com>> wrote:
>
> [...]
>
> >
> >     As you say, run_linters() to me seems very iotests-specific still: =
It
> >     emits a specific output that is compared against a reference output=
.
> >     Fine for 297, but not fine for a function provided by a
> >     linters.py, I=E2=80=99d say.
> >
>
>     I=E2=80=99d prefer run_linters() to return something like a Map[str,
> >     Optional[str]], that would map a tool to its output in case of erro=
r,
> >     i.e. ideally:
> >
> >     `{'pylint': None, 'mypy': None}`
> >
>
>
> > Splitting the test apart into two sub-tests is completely reasonable.
> > Python CI right now has individual tests for pylint, mypy, etc.
> >
> >     297 could format it something like
> >
> >     ```
> >     for tool, output in run_linters().items():
> >          print(f'=3D=3D=3D {tool} =3D=3D=3D')
> >          if output is not None:
> >              print(output)
> >     ```
> >
> >     Or something.
> >
> >     To check for error, you could put a Python script in python/tests
> >     that
> >     checks `any(output is not None for output in
> >     run_linters().values())` or
> >     something (and on error print the output).
> >
> >
> >     Pulling out run_linters() into an external file and having it print
> >     something to stdout just seems too iotests-centric to me.  I
> >     suppose as
> >     long as the return code is right (which this patch is for) it shoul=
d
> >     work for Avocado=E2=80=99s simple tests, too (which I don=E2=80=99t=
 like very much
> >     either, by the way, because they too seem archaic to me), but,
> >     well.  It
> >     almost seems like the Avocado test should just run ./check then.
> >
> >
> > Yeh. Ideally, we'd just have a mypy.ini and a pylintrc that configures
> > the tests adequately, and then 297 (or whomever else) would just call
> > the linters which would in turn read the same configuration. This
> > series is somewhat of a stop-gap to measure the temperature of the
> > room to see how important it was to leave 297 inside of iotests. So, I
> > did the conservative thing that's faster to review even if it now
> > looks *slightly* fishy.
> >
> > As for things being archaic or not ... possibly, but why involve extra
> > complexity if it isn't warranted?
>
> My opinion is that I find an interface of =E2=80=9Cprints something to st=
dout
> and returns an integer status code=E2=80=9D to be non-intuitive and thus =
rather
> complex actually.  That=E2=80=99s why I=E2=80=99d prefer different comple=
xity, namely
> one which has a more intuitive interface.
>
>
I'm not sure I follow, though, because ultimately what we're trying to do
is run terminal commands as part of a broader test suite. Returning status
codes and printing output is what they do. We can't escape that paradigm,
so is it really necessary to abstract away from it?


> I=E2=80=99m also not sure where the extra complexity would be for a
> `run_linters() -> Map[str, Optional[str]]`, because 297 just needs the
> loop suggested above over `run_linters().items()`, and as for the
> Avocado test...
>
> > a simple pass/fail works perfectly well.
>
> I don=E2=80=99t find `any(error_msg for error_msg in run_linters().values=
())`
> much more complex than pass/fail.
>
> (Note: Above, I called it `output`.  Probably should have called it
> `error_msg` like I did now to clarify that it=E2=80=99s `None` in case of
> success and a string otherwise.)
>
> > (And the human can read the output to understand WHY it failed.) If
> > you want more rigorous analytics for some reason, we can discuss the
> > use cases and figure out how to represent that information, but that's
> > definitely a bit beyond scope here.
>
> [...]
>
> >     Like, can=E2=80=99t we have a Python script in python/tests that im=
ports
> >     linters.py, invokes run_linters() and sensibly checks the output? O=
r,
> >     you know, at the very least not have run_linters() print anything t=
o
> >     stdout and not have it return an integer code. linters.py:main()
> >     can do
> >     that conversion.
> >
> >
> > Well, I certainly don't want to bother parsing output from python
> > tools and trying to make sure that it works sensibly cross-version and
> > cross-distro. The return code being 0/non-zero is vastly simpler. Let
> > the human read the output log on failure cases to get a sense of what
> > exactly went wrong. Is there some reason why parsing the output would
> > be beneficial to anyone?
>
> Perhaps there was a misunderstanding here, because there=E2=80=99s no nee=
d to
> parse the output in my suggestion.  `run_linters() -> Map[str,
> Optional[str]]` would map a tool name to its potential error output; if
> the tool exited successfully (exit code 0), then that `Optional[str]`
> error output would be `None`.  It would only be something if there was
> an error.
>
>
Misunderstood based on "checks the output." I might still be approaching
this from the standpoint of "I don't see a reason to capture the output" --
beyond letting iotests use it for the diff phase at the end, but I don't
think I need to encapsulate it in a return value anywhere for that to
happen -- I can just let it print to sys.[stdout|stderr] and let the diff
handle the rest, right?

Is there specific value in replicating that 'diff' feature ourselves? We
already don't do that, so is it really necessary for me to begin doing it?


> > (The Python GitLab CI hooks don't even bother printing output to the
> > console unless it returns non-zero, and then it will just print
> > whatever it saw. Seems to work well in practice.)
> >
> >
> >     Or, something completely different, perhaps my problem is that you
> >     put
> >     linters.py as a fully standalone test into the iotests directory,
> >     without it being an iotest.  So, I think I could also agree on
> >     putting
> >     linters.py into python/tests, and then having 297 execute that.
> >     Or you
> >     know, we just drop 297 altogether, as you suggest in patch 13 =E2=
=80=93 if
> >     that=E2=80=99s what it takes, then so be it.
> >
> >
> > I can definitely drop 297 if you'd like, and work on making the linter
> > configuration more declarative. I erred on the side of less movement
> > instead of more so that disruption would be minimal. It might take me
> > some extra time to work out how to un-scriptify the test, though. I'd
> > like to get a quick temperature check from kwolf on this before I put
> > the work in.
>
> So since we seem to want to keep 297, would it be possible to have 297
> run a linters.py that=E2=80=99s in python/tests?
>
>
Maybe ... I felt like maybe that'd be a bad idea, though, because it puts
an iotest-related thing quite far away from the iotests directory. I didn't
want anyone to have to hunt for this stuff. I try to explain my case for
this a bit better in the commit messages for v2.

I'm sympathetic to the dislike of having something "test-like, but isn't an
iotest" in the folder, though, and tried to address that in v2, but I'm not
confident it'll be to your satisfaction.


> >     Hanna
> >
> >
> >     PS: Also, summing up processes=E2=80=99 return codes makes me feel =
not good.
> >
> >
> > That's the part Vladimir didn't like. There was no real reason for it,
> > other than it was "easy".
>
> I very much don=E2=80=99t find it easy, because it=E2=80=99s semantically=
 wrong and thus
> comparatively hard to understand.
>
> > I can make it a binary 0/1 return instead, if that'd grease the wheels.
>
> Well, while I consider it necessary, it doesn=E2=80=99t really make the p=
atch
> more palatable to me.
>
>
OK, I am going to send a V2 that may-or-may-not precisely address your core
critique, but I think it's quite a bit tidier and goes quite a bit further
than what I did here in V1. I think I am still misunderstanding a core
complaint here, but I tried to address the things I thought I grokked:
Separate mypy and pylint tests, no funky return code manipulation, no
iotest prints inside of linters.py, etc. If it's still untenable for you,
I'll just have to go from there.

--js

--0000000000009f0c1405cd8be3f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 4, 2021 at 3:45 AM Hanna =
Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22.09.21=
 22:18, John Snow wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Sep 17, 2021 at 7:00 AM Hanna Reitz &lt;<a href=3D"mailto:hrei=
tz@redhat.com" target=3D"_blank">hreitz@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hrei=
tz@redhat.com</a>&gt;&gt; wrote:<br>
<br>
[...]<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0As you say, run_linters() to me seems very iotests-=
specific still: It<br>
&gt;=C2=A0 =C2=A0 =C2=A0emits a specific output that is compared against a =
reference output.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Fine for 297, but not fine for a function provided =
by a<br>
&gt;=C2=A0 =C2=A0 =C2=A0linters.py, I=E2=80=99d say.<br>
&gt;<br></blockquote><div></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0I=E2=80=99d prefer run_linters() to return somethin=
g like a Map[str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Optional[str]], that would map a tool to its output=
 in case of error,<br>
&gt;=C2=A0 =C2=A0 =C2=A0i.e. ideally:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0`{&#39;pylint&#39;: None, &#39;mypy&#39;: None}`<br=
>
&gt;<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Splitting the test apart into two sub-tests is completely reasonable. =
<br>
&gt; Python CI right now has individual tests for pylint, mypy, etc.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0297 could format it something like<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0for tool, output in run_linters().items():<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print(f&#39;=3D=3D=3D {too=
l} =3D=3D=3D&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if output is not None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
int(output)<br>
&gt;=C2=A0 =C2=A0 =C2=A0```<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Or something.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0To check for error, you could put a Python script i=
n python/tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0that<br>
&gt;=C2=A0 =C2=A0 =C2=A0checks `any(output is not None for output in<br>
&gt;=C2=A0 =C2=A0 =C2=A0run_linters().values())` or<br>
&gt;=C2=A0 =C2=A0 =C2=A0something (and on error print the output).<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Pulling out run_linters() into an external file and=
 having it print<br>
&gt;=C2=A0 =C2=A0 =C2=A0something to stdout just seems too iotests-centric =
to me.=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0suppose as<br>
&gt;=C2=A0 =C2=A0 =C2=A0long as the return code is right (which this patch =
is for) it should<br>
&gt;=C2=A0 =C2=A0 =C2=A0work for Avocado=E2=80=99s simple tests, too (which=
 I don=E2=80=99t like very much<br>
&gt;=C2=A0 =C2=A0 =C2=A0either, by the way, because they too seem archaic t=
o me), but,<br>
&gt;=C2=A0 =C2=A0 =C2=A0well.=C2=A0 It<br>
&gt;=C2=A0 =C2=A0 =C2=A0almost seems like the Avocado test should just run =
./check then.<br>
&gt;<br>
&gt;<br>
&gt; Yeh. Ideally, we&#39;d just have a mypy.ini and a pylintrc that config=
ures <br>
&gt; the tests adequately, and then 297 (or whomever else) would just call =
<br>
&gt; the linters which would in turn read the same configuration. This <br>
&gt; series is somewhat of a stop-gap to measure the temperature of the <br=
>
&gt; room to see how important it was to leave 297 inside of iotests. So, I=
 <br>
&gt; did the conservative thing that&#39;s faster to review even if it now =
<br>
&gt; looks *slightly* fishy.<br>
&gt;<br>
&gt; As for things being archaic or not ... possibly, but why involve extra=
 <br>
&gt; complexity if it isn&#39;t warranted?<br>
<br>
My opinion is that I find an interface of =E2=80=9Cprints something to stdo=
ut <br>
and returns an integer status code=E2=80=9D to be non-intuitive and thus ra=
ther <br>
complex actually.=C2=A0 That=E2=80=99s why I=E2=80=99d prefer different com=
plexity, namely <br>
one which has a more intuitive interface.<br>
<br></blockquote><div><br></div><div>I&#39;m not sure I follow, though, bec=
ause ultimately what we&#39;re trying to do is run terminal commands as par=
t of a broader test suite. Returning status codes and printing output is wh=
at they do. We can&#39;t escape that paradigm, so is it really necessary to=
 abstract away from it?<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
I=E2=80=99m also not sure where the extra complexity would be for a <br>
`run_linters() -&gt; Map[str, Optional[str]]`, because 297 just needs the <=
br>
loop suggested above over `run_linters().items()`, and as for the <br>
Avocado test...<br>
<br>
&gt; a simple pass/fail works perfectly well.<br>
<br>
I don=E2=80=99t find `any(error_msg for error_msg in run_linters().values()=
)` <br>
much more complex than pass/fail.<br>
<br>
(Note: Above, I called it `output`.=C2=A0 Probably should have called it <b=
r>
`error_msg` like I did now to clarify that it=E2=80=99s `None` in case of <=
br>
success and a string otherwise.)<br>
<br>
&gt; (And the human can read the output to understand WHY it failed.) If <b=
r>
&gt; you want more rigorous analytics for some reason, we can discuss the <=
br>
&gt; use cases and figure out how to represent that information, but that&#=
39;s <br>
&gt; definitely a bit beyond scope here.<br>
<br>
[...]<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Like, can=E2=80=99t we have a Python script in pyth=
on/tests that imports<br>
&gt;=C2=A0 =C2=A0 =C2=A0linters.py, invokes run_linters() and sensibly chec=
ks the output? Or,<br>
&gt;=C2=A0 =C2=A0 =C2=A0you know, at the very least not have run_linters() =
print anything to<br>
&gt;=C2=A0 =C2=A0 =C2=A0stdout and not have it return an integer code. lint=
ers.py:main()<br>
&gt;=C2=A0 =C2=A0 =C2=A0can do<br>
&gt;=C2=A0 =C2=A0 =C2=A0that conversion.<br>
&gt;<br>
&gt;<br>
&gt; Well, I certainly don&#39;t want to bother parsing output from python =
<br>
&gt; tools and trying to make sure that it works sensibly cross-version and=
 <br>
&gt; cross-distro. The return code being 0/non-zero is vastly simpler. Let =
<br>
&gt; the human read the output log on failure cases to get a sense of what =
<br>
&gt; exactly went wrong. Is there some reason why parsing the output would =
<br>
&gt; be beneficial to anyone?<br>
<br>
Perhaps there was a misunderstanding here, because there=E2=80=99s no need =
to <br>
parse the output in my suggestion.=C2=A0 `run_linters() -&gt; Map[str, <br>
Optional[str]]` would map a tool name to its potential error output; if <br=
>
the tool exited successfully (exit code 0), then that `Optional[str]` <br>
error output would be `None`.=C2=A0 It would only be something if there was=
 <br>
an error.<br>
<br></blockquote><div><br></div><div>Misunderstood based on &quot;checks th=
e output.&quot; I might still be approaching this from the standpoint of &q=
uot;I don&#39;t see a reason to capture the output&quot; -- beyond letting =
iotests use it for the diff phase at the end, but I don&#39;t think I need =
to encapsulate it in a return value anywhere for that to happen -- I can ju=
st let it print to sys.[stdout|stderr] and let the diff handle the rest, ri=
ght?</div><div><br></div><div>Is there specific value in replicating that &=
#39;diff&#39; feature ourselves? We already don&#39;t do that, so is it rea=
lly necessary for me to begin doing it?<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; (The Python GitLab CI hooks don&#39;t even bother printing output to t=
he <br>
&gt; console unless it returns non-zero, and then it will just print <br>
&gt; whatever it saw. Seems to work well in practice.)<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Or, something completely different, perhaps my prob=
lem is that you<br>
&gt;=C2=A0 =C2=A0 =C2=A0put<br>
&gt;=C2=A0 =C2=A0 =C2=A0linters.py as a fully standalone test into the iote=
sts directory,<br>
&gt;=C2=A0 =C2=A0 =C2=A0without it being an iotest.=C2=A0 So, I think I cou=
ld also agree on<br>
&gt;=C2=A0 =C2=A0 =C2=A0putting<br>
&gt;=C2=A0 =C2=A0 =C2=A0linters.py into python/tests, and then having 297 e=
xecute that.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Or you<br>
&gt;=C2=A0 =C2=A0 =C2=A0know, we just drop 297 altogether, as you suggest i=
n patch 13 =E2=80=93 if<br>
&gt;=C2=A0 =C2=A0 =C2=A0that=E2=80=99s what it takes, then so be it.<br>
&gt;<br>
&gt;<br>
&gt; I can definitely drop 297 if you&#39;d like, and work on making the li=
nter <br>
&gt; configuration more declarative. I erred on the side of less movement <=
br>
&gt; instead of more so that disruption would be minimal. It might take me =
<br>
&gt; some extra time to work out how to un-scriptify the test, though. I&#3=
9;d <br>
&gt; like to get a quick temperature check from kwolf on this before I put =
<br>
&gt; the work in.<br>
<br>
So since we seem to want to keep 297, would it be possible to have 297 <br>
run a linters.py that=E2=80=99s in python/tests?<br>
<br></blockquote><div><br></div><div>Maybe ... I felt like maybe that&#39;d=
 be a bad idea, though, because it puts an iotest-related thing quite far a=
way from the iotests directory. I didn&#39;t want anyone to have to hunt fo=
r this stuff. I try to explain my case for this a bit better in the commit =
messages for v2.</div><div><br></div><div>I&#39;m sympathetic to the dislik=
e of having something &quot;test-like, but isn&#39;t an iotest&quot; in the=
 folder, though, and tried to address that in v2, but I&#39;m not confident=
 it&#39;ll be to your satisfaction.<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0Hanna<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0PS: Also, summing up processes=E2=80=99 return code=
s makes me feel not good.<br>
&gt;<br>
&gt;<br>
&gt; That&#39;s the part Vladimir didn&#39;t like. There was no real reason=
 for it, <br>
&gt; other than it was &quot;easy&quot;.<br>
<br>
I very much don=E2=80=99t find it easy, because it=E2=80=99s semantically w=
rong and thus <br>
comparatively hard to understand.<br>
<br>
&gt; I can make it a binary 0/1 return instead, if that&#39;d grease the wh=
eels.<br>
<br>
Well, while I consider it necessary, it doesn=E2=80=99t really make the pat=
ch <br>
more palatable to me.<br>
<br></blockquote><div><br></div><div>OK, I am going to send a V2 that may-o=
r-may-not precisely address your core critique, but I think it&#39;s quite =
a bit tidier and goes quite a bit further than what I did here in V1. I thi=
nk I am still misunderstanding a core complaint here, but I tried to addres=
s the things I thought I grokked: Separate mypy and pylint tests, no funky =
return code manipulation, no iotest prints inside of linters.py, etc. If it=
&#39;s still untenable for you, I&#39;ll just have to go from there.<br></d=
iv><div><br></div><div>--js<br></div></div></div>

--0000000000009f0c1405cd8be3f4--


