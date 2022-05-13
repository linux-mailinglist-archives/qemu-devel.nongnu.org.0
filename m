Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A785266B3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:02:19 +0200 (CEST)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXkA-0006FV-4d
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXde-00070w-1Y
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXdc-0001vI-3G
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l8yItWAAqqIlGEaosbDRzOqQ+I0YkpSvxZOiH7YQppA=;
 b=EMbCY1P8olyPccsBrcDUlC1d4h7yATajLNAWGelAibEd6/hy8n01eX84WEemtftDqmPvYy
 +0haHYXNhZMHgJBN46qGiXMcwEsc/KkpSC56XECgIsnHTLeQNrm45nh+CjlASwXt2Ij4Ij
 599i/vLWishaiGUiM69t1HhbIo2cfDE=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-G13OZz7NMoye8a6L-8AjDA-1; Fri, 13 May 2022 11:55:29 -0400
X-MC-Unique: G13OZz7NMoye8a6L-8AjDA-1
Received: by mail-ua1-f70.google.com with SMTP id
 w16-20020ab067d0000000b0035ceb645456so3931569uar.10
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l8yItWAAqqIlGEaosbDRzOqQ+I0YkpSvxZOiH7YQppA=;
 b=D+DXQ9BKp9RsCrYUqJZsVI+iTdLVzwOJ/gI7X7xgoHo98KkPryDCsCXV2P+Q0LvqKi
 uLU9IkQ6KhQrM+6Kclp9XfLkSY+gJCPq/vD1XGtJI9XgC61HL17qdT4sANsVgoB4C9Om
 6P17nXrNkIp6ZYd4JVp3w/cbArt6ubXhdTS7uS8OhBhn+lTaktMqNjqg40bFeHwgC7hP
 FJQ/WYCowi/dS6/FTYzaCnTQW0pmDwDxlprJgblVobNumhrwJQOz3kxZInabb9GSfBrx
 jsvMF7W1klhzXjaPqSug+C7Mu6YgR47NE1zgeiLfTBpIBWku2Li43nM7OEAyM6POpTyq
 Qn5w==
X-Gm-Message-State: AOAM531qbzd0xg9UvxZ61om5ntXlqBJZ1b/W0YexOvAIOpvrPKWmyMM+
 G6T32GJopB4Et4DcR3QDudGo7oaZOZ7OEtMuqwuOlXE8QyjuNVyA9R2LyaQanudQi5v38Yy8xBj
 X+E5ds1Twpc9V5sPnI77L1h2WYY38jCM=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr2701553vsr.11.1652457329085; 
 Fri, 13 May 2022 08:55:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuRIPL51TDlEoDHl+iGzGKQXY03QvmN/2MjqWlKLOPQfAEMIui66FDMpm8Ii2QwB8f2LiXHaH+whvfRLzdhlo=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr2701544vsr.11.1652457328907; Fri, 13
 May 2022 08:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <Yn4YS1FpgtCZMMx6@redhat.com> <Yn4y9BorEDzOLhFH@redhat.com>
In-Reply-To: <Yn4y9BorEDzOLhFH@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 11:55:18 -0400
Message-ID: <CAFn=p-Y77=F=qjdwWRycFafxiS7Rjxag4gLmPK0ERqEiyT19ig@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000018b04005dee6b4d0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

--00000000000018b04005dee6b4d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022, 6:29 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Fri, May 13, 2022 at 09:35:23AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, May 12, 2022 at 08:06:00PM -0400, John Snow wrote:
> > > RFC: This is a very early, crude attempt at switching over to an
> > > external Python package dependency for QMP. This series does not
> > > actually make the switch in and of itself, but instead just switches =
to
> > > the paradigm of using a venv in general to install the QEMU python
> > > packages instead of using PYTHONPATH to load them from the source tre=
e.
> > >
> > > (By installing the package, we can process dependencies.)
> > >
> > > I'm sending it to the list so I can show you some of what's ugly so f=
ar
> > > and my notes on how I might make it less ugly.
> > >
> > > (1) This doesn't trigger venv creation *from* iotests, it merely prin=
ts
> > > a friendly error message if "make check-venv" has not been run
> > > first. Not the greatest.
> >
> > So if we run the sequence
> >
> >   mkdir build
> >   cd build
> >   ../configure
> >   make
> >   ./tests/qemu-iotests/check 001
> >
> > It won't work anymore, until we 'make check-venv' (or simply
> > 'make check') ?
> >
> > I'm somewhat inclined to say that venv should be created
> > unconditionally by default. ie a plain 'make' should always
> > everything needed to be able to invoke the tests directly.
> >
> > > (2) This isn't acceptable for SRPM builds, because it uses PyPI to
> fetch
> > > packages just-in-time. My thought is to use an environment variable
> like
> > > QEMU_CHECK_NO_INTERNET that changes the behavior of the venv setup
> > > process. We can use "--system-site-packages" as an argument to venv
> > > creation and "--no-index" as an argument to pip installation to achie=
ve
> > > good behavior in SRPM building scenarios. It'd be up to the spec-writ=
er
> > > to opt into that behavior.
> >
> > I think I'd expect --system-site-packages to be the default behaviour.
> > We expect QEMU to be compatible with the packages available in the
> > distros that we're targetting. So if the dev has the python packages
> > installed from their distro, we should be using them preferentially.
> >
> > This is similar to how we bundle slirp/capstone/etc, but will
> > preferentially use the distro version if it is available.
>
> AFAICT from testing it, when '--system-site-packages' is set
> for the venv, then 'pip install' appears to end up being a
> no-op if the package is already present in the host, but
> installs it if missing.
>
> IOW, if we default to --system-site-packages, but still
> also run 'pip install', we should "do the right thing".
> It'll use any  distro packages that are available, and
> augment with stuff from pip. In the no-op case, pip will
> still try to consult the pipy servers to fetch version
> info IIUC, so we need to be able to stop that. So I'd
> suggest a  --python-env arg taking three values
>
>  * "auto" (the default) - add --system-site-packages, but
>    also run 'pip install'. Good for developers day-to-day
>

Sounds like a decent balance...

...My only concern is that the system packages might be very old and it's
possible that the qemu packages will be "too new" or have conflicts with
the system deps.

I'll just have to test this.

e.g. what if I want to require mypy >=3D 0.900 for testing, but you have a
system package that requires mypy < 0.700?

I don't *know* that this is a problem, but my python-sense is tingling.

The python dep compatibility matrix I try to enforce and support for
testing is already feeling overly wide. This might force me to support an
even wider matrix, which I think is the precisely wrong direction for venvs
where we want tighter control as a rule.


>  * "system" - add --system-site-packages but never run
>    'pip install'.  Good for formal package builds.
>

We still have to install the in-tree qemu ns package, but we can use
--no-index to do it. It'll fail if the deps aren't met.


>  * "pip"  - don't add --system-site-packages, always run
>    'pip install'. Good for testing compatibility with
>    bleeding edge python versions, or if explicit full
>    independance from host python install is desired.
>

as arguments to configure, this spread of options makes sense to me than
paolo's version, but I've still got some doubt on mixing system and venv
packages.

I am also as of yet not sold on building the venv *from* configure, see my
response to Paolo on that topic.

I'll keep plugging away for now, but the big picture is still a tad murky
in my head.

--js

--00000000000018b04005dee6b4d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 6:29 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Fri, May 13, 2022 at 09:35:23=
AM +0100, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; On Thu, May 12, 2022 at 08:06:00PM -0400, John Snow wrote:<br>
&gt; &gt; RFC: This is a very early, crude attempt at switching over to an<=
br>
&gt; &gt; external Python package dependency for QMP. This series does not<=
br>
&gt; &gt; actually make the switch in and of itself, but instead just switc=
hes to<br>
&gt; &gt; the paradigm of using a venv in general to install the QEMU pytho=
n<br>
&gt; &gt; packages instead of using PYTHONPATH to load them from the source=
 tree.<br>
&gt; &gt; <br>
&gt; &gt; (By installing the package, we can process dependencies.)<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m sending it to the list so I can show you some of what&#39=
;s ugly so far<br>
&gt; &gt; and my notes on how I might make it less ugly.<br>
&gt; &gt; <br>
&gt; &gt; (1) This doesn&#39;t trigger venv creation *from* iotests, it mer=
ely prints<br>
&gt; &gt; a friendly error message if &quot;make check-venv&quot; has not b=
een run<br>
&gt; &gt; first. Not the greatest.<br>
&gt; <br>
&gt; So if we run the sequence<br>
&gt; <br>
&gt;=C2=A0 =C2=A0mkdir build<br>
&gt;=C2=A0 =C2=A0cd build<br>
&gt;=C2=A0 =C2=A0../configure<br>
&gt;=C2=A0 =C2=A0make<br>
&gt;=C2=A0 =C2=A0./tests/qemu-iotests/check 001<br>
&gt; <br>
&gt; It won&#39;t work anymore, until we &#39;make check-venv&#39; (or simp=
ly<br>
&gt; &#39;make check&#39;) ?<br>
&gt; <br>
&gt; I&#39;m somewhat inclined to say that venv should be created<br>
&gt; unconditionally by default. ie a plain &#39;make&#39; should always<br=
>
&gt; everything needed to be able to invoke the tests directly.<br>
&gt; <br>
&gt; &gt; (2) This isn&#39;t acceptable for SRPM builds, because it uses Py=
PI to fetch<br>
&gt; &gt; packages just-in-time. My thought is to use an environment variab=
le like<br>
&gt; &gt; QEMU_CHECK_NO_INTERNET that changes the behavior of the venv setu=
p<br>
&gt; &gt; process. We can use &quot;--system-site-packages&quot; as an argu=
ment to venv<br>
&gt; &gt; creation and &quot;--no-index&quot; as an argument to pip install=
ation to achieve<br>
&gt; &gt; good behavior in SRPM building scenarios. It&#39;d be up to the s=
pec-writer<br>
&gt; &gt; to opt into that behavior.<br>
&gt; <br>
&gt; I think I&#39;d expect --system-site-packages to be the default behavi=
our.<br>
&gt; We expect QEMU to be compatible with the packages available in the<br>
&gt; distros that we&#39;re targetting. So if the dev has the python packag=
es<br>
&gt; installed from their distro, we should be using them preferentially.<b=
r>
&gt; <br>
&gt; This is similar to how we bundle slirp/capstone/etc, but will<br>
&gt; preferentially use the distro version if it is available.<br>
<br>
AFAICT from testing it, when &#39;--system-site-packages&#39; is set<br>
for the venv, then &#39;pip install&#39; appears to end up being a<br>
no-op if the package is already present in the host, but<br>
installs it if missing.<br>
<br>
IOW, if we default to --system-site-packages, but still<br>
also run &#39;pip install&#39;, we should &quot;do the right thing&quot;.<b=
r>
It&#39;ll use any=C2=A0 distro packages that are available, and<br>
augment with stuff from pip. In the no-op case, pip will<br>
still try to consult the pipy servers to fetch version<br>
info IIUC, so we need to be able to stop that. So I&#39;d<br>
suggest a=C2=A0 --python-env arg taking three values<br>
<br>
=C2=A0* &quot;auto&quot; (the default) - add --system-site-packages, but<br=
>
=C2=A0 =C2=A0also run &#39;pip install&#39;. Good for developers day-to-day=
<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Sounds like a decent balance...</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">...My only concern is that the system packages might be very old =
and it&#39;s possible that the qemu packages will be &quot;too new&quot; or=
 have conflicts with the system deps.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I&#39;ll just have to test this.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">e.g. what if I want to require mypy &gt;=3D 0.900 fo=
r testing, but you have a system package that requires mypy &lt; 0.700?</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t *know* that thi=
s is a problem, but my python-sense is tingling.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">The python dep compatibility matrix I try to enfor=
ce and support for testing is already feeling overly wide. This might force=
 me to support an even wider matrix, which I think is the precisely wrong d=
irection for venvs where we want tighter control as a rule.=C2=A0</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
=C2=A0* &quot;system&quot; - add --system-site-packages but never run<br>
=C2=A0 =C2=A0&#39;pip install&#39;.=C2=A0 Good for formal package builds.<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">We=
 still have to install the in-tree qemu ns package, but we can use --no-ind=
ex to do it. It&#39;ll fail if the deps aren&#39;t met.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
=C2=A0* &quot;pip&quot;=C2=A0 - don&#39;t add --system-site-packages, alway=
s run<br>
=C2=A0 =C2=A0&#39;pip install&#39;. Good for testing compatibility with<br>
=C2=A0 =C2=A0bleeding edge python versions, or if explicit full<br>
=C2=A0 =C2=A0independance from host python install is desired.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">as arguments =
to configure, this spread of options makes sense to me than paolo&#39;s ver=
sion, but I&#39;ve still got some doubt on mixing system and venv packages.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I am also as of yet not=
 sold on building the venv *from* configure, see my response to Paolo on th=
at topic.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll keep =
plugging away for now, but the big picture is still a tad murky in my head.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">--js</div></div>

--00000000000018b04005dee6b4d0--


