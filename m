Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4537E526608
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:26:58 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXBw-0004LR-Re
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXAi-0003PY-1X
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXAe-0005Lk-KC
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652455535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1sBwbFef93k3hALU1ZS025aivluJ34iv+BJ0l39wlmc=;
 b=C/hKRPowNMcYV7JqnR3IoYj5mDtgplb58K6epRY4OlposlHdxVnKU8nK5bzpjJxGEdOxKd
 gTtzUbZsivHVGmuHkAZdwlVDmj4wpHiizQUVfOCtZO2L3P3/s50isJKRP/DjSDic4Om6PA
 7Vbw7znQm75fwR2GyZ9kvlz7Z5ojf+8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-7D6NAUeAMHOdU7tb_JWTNQ-1; Fri, 13 May 2022 11:25:34 -0400
X-MC-Unique: 7D6NAUeAMHOdU7tb_JWTNQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 c19-20020ab023d3000000b003627f7c63d4so3886995uan.13
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1sBwbFef93k3hALU1ZS025aivluJ34iv+BJ0l39wlmc=;
 b=EVPsu1RavyIIaZkRITwCppnMofywFBDQDW1ZTc9cLdpZjm3LETo+0qHKgNVkuiFd0n
 sZzdJWiGSycTBiGBbppkhqsR9KNHUVoBVcRJ5Znv2fYWUlSg/iURJLwuJNCc4g6c6Y9u
 a70lo/4/pGXunKDXdY40TcK6eGLtd5MO0mpi6T+HNJcAEAeL4g+RQIAc1+j3iPDJycon
 UcmNk1Zn4hWDTzMaSbM9co3xdTC1PICEtsKSxCPxGj16s4mfDNGKrg9K0TNd7Pdta1LT
 vQuCcQo/G4xgXpKY7HLex1Bxtgelts7aJdeKNUdqcEm1PGVWRyfAgggJWCstjlW7iif4
 X5/Q==
X-Gm-Message-State: AOAM533bf/JkeY+uz20jW4H/bqT7fadCVQ6DZCrNUFykhyMj6h3ATiOj
 st7LcUQmtHIUVCRqG62H4lbgm7Eu5uZ+b9Ap5LX/67Pr+qhtdFH0UvYk7BDgj1Ridiq3YinIw9C
 tPljZ78ac2xx2GUNhXvMPlRPt7l012vI=
X-Received: by 2002:a1f:ce46:0:b0:34e:b018:c8a4 with SMTP id
 e67-20020a1fce46000000b0034eb018c8a4mr2405954vkg.26.1652455533648; 
 Fri, 13 May 2022 08:25:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI3+Wtm9Wzq1S32YPRoarG9zgaHgXJOebDc4BiDjZzvDwths7SnpUuMf8Gz71WSdjLzLUpP/N2+H2zubqEJ48=
X-Received: by 2002:a1f:ce46:0:b0:34e:b018:c8a4 with SMTP id
 e67-20020a1fce46000000b0034eb018c8a4mr2405942vkg.26.1652455533369; Fri, 13
 May 2022 08:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <Yn4YS1FpgtCZMMx6@redhat.com>
In-Reply-To: <Yn4YS1FpgtCZMMx6@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 11:25:22 -0400
Message-ID: <CAFn=p-b3V4d4R9cVdrVOrdG3EdufcWC815q+pk3tkMyFsUxXUw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000012f9af05dee64908"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

--00000000000012f9af05dee64908
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022, 4:35 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Thu, May 12, 2022 at 08:06:00PM -0400, John Snow wrote:
> > RFC: This is a very early, crude attempt at switching over to an
> > external Python package dependency for QMP. This series does not
> > actually make the switch in and of itself, but instead just switches to
> > the paradigm of using a venv in general to install the QEMU python
> > packages instead of using PYTHONPATH to load them from the source tree.
> >
> > (By installing the package, we can process dependencies.)
> >
> > I'm sending it to the list so I can show you some of what's ugly so far
> > and my notes on how I might make it less ugly.
> >
> > (1) This doesn't trigger venv creation *from* iotests, it merely prints
> > a friendly error message if "make check-venv" has not been run
> > first. Not the greatest.
>
> So if we run the sequence
>
>   mkdir build
>   cd build
>   ../configure
>   make
>   ./tests/qemu-iotests/check 001
>
> It won't work anymore, until we 'make check-venv' (or simply
> 'make check') ?
>

In this RFC as-is, that's correct. I want to fix that, because I dislike it
too.

Several ways to go about that.

I'm somewhat inclined to say that venv should be created
> unconditionally by default. ie a plain 'make' should always
> everything needed to be able to invoke the tests directly.
>

I'm leaning to agree with you, but I see Kevin has some doubts. My #1 goal
for Python refactoring is usually minimizing interruption to the block
maintainers. I do like the idea of just having it always available and
always taken care of, though.

(This would be useful for making sure that any python scripts or utilities
that need access to qmp/machine can be made to work, too. We can discuss
this problem a little later - the scripts/qmp/ folder needs some work. It
will come up in the full series to make the switch.)

OTOH, A concern about unconditionally building the test venv is that it
might introduce new dependencies for lots of downstreams that don't even
run the tests yet. I think I am partial to having it install on-demand,
because then the dependencies are opt-in. mjt told me that Debian does not
run make check as part of its build yet, for example.

I guess I can see it working either way. I think in the very immediate term
I'm motivated to have it be on-demand, but long term I think "as part of
make" is the eventual goal.


> > (2) This isn't acceptable for SRPM builds, because it uses PyPI to fetc=
h
> > packages just-in-time. My thought is to use an environment variable lik=
e
> > QEMU_CHECK_NO_INTERNET that changes the behavior of the venv setup
> > process. We can use "--system-site-packages" as an argument to venv
> > creation and "--no-index" as an argument to pip installation to achieve
> > good behavior in SRPM building scenarios. It'd be up to the spec-writer
> > to opt into that behavior.
>
> I think I'd expect --system-site-packages to be the default behaviour.
> We expect QEMU to be compatible with the packages available in the
> distros that we're targetting. So if the dev has the python packages
> installed from their distro, we should be using them preferentially.
>
> This is similar to how we bundle slirp/capstone/etc, but will
> preferentially use the distro version if it is available.
>

If you think that behavior should apply to tests as well, then OK. I shied
away from having it as the default because it's somewhat unusual to "cede
control" in a venv like this - the mere presence of certain packages in the
system environment may change behavior of certain python libraries. It is a
less well defined environment inherently.

I'll do some testing and I can try having it always do this. I'm curious
about cases where I might require "exactly mypy 0.780" and the user has
mypy 0.770 installed, or maybe even the other way around.

It may be surprising as to when the system packages get used and when they
don't - instinctively I like things that are less dynamic, but I see the
argument for wanting to prefer system packages when possible. At least for
the sake of downstream.

(I kind of feel like upstream should likewise prefer the upstream python
packages too, but ... You've got a lot more packaging experience than me,
so I'm willing to trust you on this point, but I'm personally a little
uncertain.)


> > (3) Using one venv for *all* tests means that avocado comes as a pre-re=
q
> > for iotests -- which adds avocado as a BuildRequires for the Fedora
> > SRPM. That's probably not ideal. It may be better to model the test ven=
v
> > as something that can be created in stages: the "core" venv first, and
> > the avocado packages only when needed.
> >
> > You can see in these patches that I wasn't really sure how to tie the
> > check-venv step as a dependency of 'check' or 'check-block', and it
> > winds up feeling kind of hacky and fragile as a result.
>
> See above, I'm inclined to say the venv should be created unconditionally
>
> > (Patches 6 and 7 feel particularly fishy.)
> >
> > What I think I would like to do is replace the makefile logic with a
> > Python bootstrapping script. This will allow me to add in environment
> > variable logic to accommodate #2 pretty easily. It will also allow
> > iotests to call into the bootstrap script whenever it detects the venv
> > isn't set up, which it needed to do anyway in order to print a
> > user-friendly error message. Lastly, it will make it easier to create a
> > "tiered" venv that layers in the avocado dependencies only as-needed,
> > which avoids us having to bloat the SRPM build dependencies.
>
> The tests is an area where we still have too much taking place in
> Makefiles, as opposed to meson. Can we put a rule in
> tests/meson.build to trigger the ven creation ? Gets us closer to
> being able to run ninja without using make as a wrapper.
>

Paolo has written a lot about this now, and he had some suggestions on
patches 6-8. I'll experiment with that and see if it feels less fragile.


> > In the end, I think that approach will:
> >
> > - Allow us to run iotests without having to run a manual prep step
> > - Keep additional SRPM deps to a minimum
> > - Keep makefile hacks to a minimum
> >
> > The only downside I am really frowning at is that I will have to
> > replicate some "update the venv if it's outdated" logic that is usually
> > handled by the Make system in the venv bootstrapper. Still, I think it'=
s
> > probably the only way to hit all of the requirements here without tryin=
g
> > to concoct a fairly complex Makefile.
>
> The only reason we need to update the venv is if a python dependancy
> changes right ? If we're using system packages by default that's
> a non-issue. If we're using the python-qemu.qmp as a git submodule,
> we presumably only need to re-create the venv if we see that the
> git submodule hash has changed. IOW, we don't need to worry about
> tracking whether individual python deps are outdated.
>

The venv should probably not need to be updated very often, but it may
happen occasionally.

If tests/requirements.txt changes it should be updated, and if
python/setup.cfg|py changes it *might* need to be updated. (e.g. new or
removed subpackages, dependency updates, etc. An obvious one coming up is
the removal of qemu.qmp from in-tree and having that dependency be added to
setup.cfg.)

Using the editable installation mode, we won't need to reinstall the venv
if you edit any of the in-tree python modules (e.g. you add some debugging
prints to machine.py)

Even if we use system packages, we need to check that the version
requirements are fulfilled which involves at least re-running pip (not
necessarily recreating the whole venv) and allowing it the chance to fetch
new deps.

I have no plans to use git submodules.

With regards,
> Daniel
>

Thanks! I appreciate the feedback.

--js

--00000000000012f9af05dee64908
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 4:35 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, May 12, 2022 at 08:06:00=
PM -0400, John Snow wrote:<br>
&gt; RFC: This is a very early, crude attempt at switching over to an<br>
&gt; external Python package dependency for QMP. This series does not<br>
&gt; actually make the switch in and of itself, but instead just switches t=
o<br>
&gt; the paradigm of using a venv in general to install the QEMU python<br>
&gt; packages instead of using PYTHONPATH to load them from the source tree=
.<br>
&gt; <br>
&gt; (By installing the package, we can process dependencies.)<br>
&gt; <br>
&gt; I&#39;m sending it to the list so I can show you some of what&#39;s ug=
ly so far<br>
&gt; and my notes on how I might make it less ugly.<br>
&gt; <br>
&gt; (1) This doesn&#39;t trigger venv creation *from* iotests, it merely p=
rints<br>
&gt; a friendly error message if &quot;make check-venv&quot; has not been r=
un<br>
&gt; first. Not the greatest.<br>
<br>
So if we run the sequence<br>
<br>
=C2=A0 mkdir build<br>
=C2=A0 cd build<br>
=C2=A0 ../configure<br>
=C2=A0 make<br>
=C2=A0 ./tests/qemu-iotests/check 001<br>
<br>
It won&#39;t work anymore, until we &#39;make check-venv&#39; (or simply<br=
>
&#39;make check&#39;) ?<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">In this RFC as-is, that&#39;s correct. I want to fix=
 that, because I dislike it too.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Several ways to go about that.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
I&#39;m somewhat inclined to say that venv should be created<br>
unconditionally by default. ie a plain &#39;make&#39; should always<br>
everything needed to be able to invoke the tests directly.<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m leaning t=
o agree with you, but I see Kevin has some doubts. My #1 goal for Python re=
factoring is usually minimizing interruption to the block maintainers. I do=
 like the idea of just having it always available and always taken care of,=
 though.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(This would be =
useful for making sure that any python scripts or utilities that need acces=
s to qmp/machine can be made to work, too. We can discuss this problem a li=
ttle later - the scripts/qmp/ folder needs some work. It will come up in th=
e full series to make the switch.)</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">OTOH, A concern about unconditionally building the test venv is =
that it might introduce new dependencies for lots of downstreams that don&#=
39;t even run the tests yet. I think I am partial to having it install on-d=
emand, because then the dependencies are opt-in. mjt told me that Debian do=
es not run make check as part of its build yet, for example.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I guess I can see it working either w=
ay. I think in the very immediate term I&#39;m motivated to have it be on-d=
emand, but long term I think &quot;as part of make&quot; is the eventual go=
al.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
&gt; (2) This isn&#39;t acceptable for SRPM builds, because it uses PyPI to=
 fetch<br>
&gt; packages just-in-time. My thought is to use an environment variable li=
ke<br>
&gt; QEMU_CHECK_NO_INTERNET that changes the behavior of the venv setup<br>
&gt; process. We can use &quot;--system-site-packages&quot; as an argument =
to venv<br>
&gt; creation and &quot;--no-index&quot; as an argument to pip installation=
 to achieve<br>
&gt; good behavior in SRPM building scenarios. It&#39;d be up to the spec-w=
riter<br>
&gt; to opt into that behavior.<br>
<br>
I think I&#39;d expect --system-site-packages to be the default behaviour.<=
br>
We expect QEMU to be compatible with the packages available in the<br>
distros that we&#39;re targetting. So if the dev has the python packages<br=
>
installed from their distro, we should be using them preferentially.<br>
<br>
This is similar to how we bundle slirp/capstone/etc, but will<br>
preferentially use the distro version if it is available.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">If you think that =
behavior should apply to tests as well, then OK. I shied away from having i=
t as the default because it&#39;s somewhat unusual to &quot;cede control&qu=
ot; in a venv like this - the mere presence of certain packages in the syst=
em environment may change behavior of certain python libraries. It is a les=
s well defined environment inherently.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I&#39;ll do some testing and I can try having it always do t=
his. I&#39;m curious about cases where I might require &quot;exactly mypy 0=
.780&quot; and the user has mypy 0.770 installed, or maybe even the other w=
ay around.</div><div dir=3D"auto"><br></div><div dir=3D"auto">It may be sur=
prising as to when the system packages get used and when they don&#39;t - i=
nstinctively I like things that are less dynamic, but I see the argument fo=
r wanting to prefer system packages when possible. At least for the sake of=
 downstream.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(I kind of =
feel like upstream should likewise prefer the upstream python packages too,=
 but ... You&#39;ve got a lot more packaging experience than me, so I&#39;m=
 willing to trust you on this point, but I&#39;m personally a little uncert=
ain.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; (3) Using one venv for *all* tests means that avocado comes as a pre-r=
eq<br>
&gt; for iotests -- which adds avocado as a BuildRequires for the Fedora<br=
>
&gt; SRPM. That&#39;s probably not ideal. It may be better to model the tes=
t venv<br>
&gt; as something that can be created in stages: the &quot;core&quot; venv =
first, and<br>
&gt; the avocado packages only when needed.<br>
&gt; <br>
&gt; You can see in these patches that I wasn&#39;t really sure how to tie =
the<br>
&gt; check-venv step as a dependency of &#39;check&#39; or &#39;check-block=
&#39;, and it<br>
&gt; winds up feeling kind of hacky and fragile as a result.<br>
<br>
See above, I&#39;m inclined to say the venv should be created unconditional=
ly<br>
<br>
&gt; (Patches 6 and 7 feel particularly fishy.)<br>
&gt; <br>
&gt; What I think I would like to do is replace the makefile logic with a<b=
r>
&gt; Python bootstrapping script. This will allow me to add in environment<=
br>
&gt; variable logic to accommodate #2 pretty easily. It will also allow<br>
&gt; iotests to call into the bootstrap script whenever it detects the venv=
<br>
&gt; isn&#39;t set up, which it needed to do anyway in order to print a<br>
&gt; user-friendly error message. Lastly, it will make it easier to create =
a<br>
&gt; &quot;tiered&quot; venv that layers in the avocado dependencies only a=
s-needed,<br>
&gt; which avoids us having to bloat the SRPM build dependencies.<br>
<br>
The tests is an area where we still have too much taking place in<br>
Makefiles, as opposed to meson. Can we put a rule in<br>
tests/meson.build to trigger the ven creation ? Gets us closer to<br>
being able to run ninja without using make as a wrapper.<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo has written a=
 lot about this now, and he had some suggestions on patches 6-8. I&#39;ll e=
xperiment with that and see if it feels less fragile.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; In the end, I think that approach will:<br>
&gt; <br>
&gt; - Allow us to run iotests without having to run a manual prep step<br>
&gt; - Keep additional SRPM deps to a minimum<br>
&gt; - Keep makefile hacks to a minimum<br>
&gt; <br>
&gt; The only downside I am really frowning at is that I will have to<br>
&gt; replicate some &quot;update the venv if it&#39;s outdated&quot; logic =
that is usually<br>
&gt; handled by the Make system in the venv bootstrapper. Still, I think it=
&#39;s<br>
&gt; probably the only way to hit all of the requirements here without tryi=
ng<br>
&gt; to concoct a fairly complex Makefile.<br>
<br>
The only reason we need to update the venv is if a python dependancy<br>
changes right ? If we&#39;re using system packages by default that&#39;s<br=
>
a non-issue. If we&#39;re using the python-qemu.qmp as a git submodule,<br>
we presumably only need to re-create the venv if we see that the<br>
git submodule hash has changed. IOW, we don&#39;t need to worry about<br>
tracking whether individual python deps are outdated.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">The venv should probab=
ly not need to be updated very often, but it may happen occasionally.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">If tests/requirements.txt cha=
nges it should be updated, and if python/setup.cfg|py changes it *might* ne=
ed to be updated. (e.g. new or removed subpackages, dependency updates, etc=
. An obvious one coming up is the removal of qemu.qmp from in-tree and havi=
ng that dependency be added to setup.cfg.)</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Using the editable installation mode, we won&#39;t need =
to reinstall the venv if you edit any of the in-tree python modules (e.g. y=
ou add some debugging prints to machine.py)</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Even if we use system packages, we need to check that t=
he version requirements are fulfilled which involves at least re-running pi=
p (not necessarily recreating the whole venv) and allowing it the chance to=
 fetch new deps.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have =
no plans to use git submodules.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">With re=
gards,<br>
Daniel<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Thanks! I appreciate the feedback.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">--js</div></div>

--00000000000012f9af05dee64908--


