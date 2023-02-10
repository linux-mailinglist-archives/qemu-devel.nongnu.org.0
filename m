Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50E26924E7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQXcN-00017Y-OX; Fri, 10 Feb 2023 12:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQXcK-00016q-2t
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:55:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQXcH-0007L3-5R
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676051719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=emdE/fFNhhw74J59H000dWfTP8m2Fkf8YAiHKqQz6eA=;
 b=QzvRmubXgPa+NnSt7rkJxNNmSvd/BEuF1I7r3CpR23IP8GneX/T2jvqmTueRbELYQfsGUu
 8qmyMFsmoM1QpYhWHMARlUxyJpXbgx8j8I2e3zinwhio76Bt3KP2I78p8f29BRUgieyAgr
 z6lA2FzbKn+u+qmWkoJE9OkiUbJLXoM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-7ktvbL8iMLWj-azE8SrKgg-1; Fri, 10 Feb 2023 12:55:18 -0500
X-MC-Unique: 7ktvbL8iMLWj-azE8SrKgg-1
Received: by mail-pl1-f200.google.com with SMTP id
 u15-20020a170902a60f00b001992a366c3bso3359089plq.12
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 09:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=emdE/fFNhhw74J59H000dWfTP8m2Fkf8YAiHKqQz6eA=;
 b=MCZUDCHwpddAvjbqQSbPzBCGc24Ukxlspdg2NuaekBZHzmRRGMz3FeQmDha5g7prKA
 FdA7ESDUVxUprVcYYvK28/7QmQZN7vAevgi7Al/AxCcXV/OtUa7xwJ6n2xZJNZX9Ik3O
 odbh/UCy999P7m82HdT2aHCLvTJutcewI+pfgV2l82Vxg2Z+i+mqeona0kxESEB2FqD5
 iJIwfy2nmcJDZoj0FjaaM5ldksHoLekuff9XtpJNbVJWhA2V2Cbm8GoqnihLNTXwmn2l
 WdbCHI8DF0grIP7xTB44t7kbHuh0IRFCBwnfnZuM2d+BmwdQZGyUzA0oZTjxoPFTs9An
 DIAQ==
X-Gm-Message-State: AO0yUKW/W7mjcpQ2rYLEyrs2ObCRuBqJxev4yR3ULp7SMZRYs0cIAwZE
 BP+WSkqOB/5Q7ngqdWM0bn1OfmLAEr91vWFfMBsg1HmtkGAjTPz7ZnJyxWtS6MRxfPxexbt8uQL
 FTyGae7q+3PU28AiSDbNNyUWbNc6TPws=
X-Received: by 2002:a63:78c9:0:b0:4f1:ccba:5bac with SMTP id
 t192-20020a6378c9000000b004f1ccba5bacmr3037397pgc.20.1676051717079; 
 Fri, 10 Feb 2023 09:55:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/vD8YeBj7VvmDMJ4Y+p239C0AA+fX9+hpi2WxjZO7l2LkgKNaVDzHPJrTSP52kheLo/5bkph0EaCe7D5+2crU=
X-Received: by 2002:a63:78c9:0:b0:4f1:ccba:5bac with SMTP id
 t192-20020a6378c9000000b004f1ccba5bacmr3037379pgc.20.1676051716738; Fri, 10
 Feb 2023 09:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
In-Reply-To: <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Feb 2023 12:55:04 -0500
Message-ID: <CAFn=p-aLGgf-tWA5kXeTXWjKicCb+T0MZ3M6eFEP3YQxf4MKPg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000033b68305f45c33c0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000033b68305f45c33c0
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 11:32 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 10 Feb 2023 at 16:01, John Snow <jsnow@redhat.com> wrote:
> > On Fri, Feb 10, 2023, 5:41 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >> On Fri, 10 Feb 2023 at 00:31, John Snow <jsnow@redhat.com> wrote:
> >> This confuses me. We work fine with Python 3.6 today.
> >
> >
> > That won't last - Many tools such as mypy, pylint and flake8 which I use
> to manage our python codebase have been dropping support for 3.6 and I've
> had to implement an increasing number of workarounds to help keep it
> possible to test 3.6 via CI while also ensuring our newest platforms work
> as dev environments.
>
> Something somewhere seems kind of out-of-sync here. Either:
>  * Python is deprecating old versions too quickly and
>    dropping support for them too fast
>

I think this is true. The Python upstream ecosystem moves extremely fast
and breaks backwards compatibility for tooling often. It is sometimes tough
to mediate that flow rate difference.

Part of the reason I added that "check-tox" CI test that is currently
optional to run is specifically so it can find problems with cutting edge
tooling - and it happens often. (It seems like every freeze, I find out a
new upstream version of something breaks the testing, like clockwork.)

On the other hand, Python 3.6 did launch some six years ago - 2016-12-22.
It's probably reasonable most cutting edge tooling for f37/f38 no longer
supports developing for a version this old.

I can't deny that the Python package ecosystem is too cavalier about
dropping for support for things too quickly, though.

 * CentOS is retaining old versions of Python when it needs to
>    ship newer ones
>

I'm not clear on the exact policies for Stream 8/9, but in our traditional
releases we'd not ever upgrade this - we'd only do micro updates and
backports.

Instead, Stream 8/9 (and OpenSUSE too) offer optional Python versions that
install side-by-side.

So sphinx (as packaged as an rpm) continues to use the platform Python -
3.6 - but you *can* launch the "system sphinx" with your newer Python
interpreter - if the version of sphinx shipped happens to cope with a newer
interpreter.

(If you run `python3.7 -m sphinx`, for example - it might work, but only if
your rpm-packaged sphinx isn't using any features of Python that were
dropped in 3.7. I'd wager it probably does work most of the time.)

 * Our policy for what distros we support is overly lax
>    and causing us to try to support ancient platforms
>    that we shouldn't be trying to support
>

Possibly. Part of the idea behind RHEL8/CentOS8 is that you'll get security
fixes, but it should otherwise be a stable platform for production.

Supporting this as a development environment for cutting edge versions does
feel like a mismatch in visions at times.

RHEL8 launched 2018-11-14, so is it reasonable to expect that cutting edge
versions of QEMU 4 years in the future will build on it no problem?

Meanwhile, OpenSUSE 15.4 released just eight months ago and still ships
Python 3.6 as its default/platform Python. They don't ship a distro with a
modern Python as default at all... Even the upcoming 15.5 release still
appears to use Python 3.6 as the platform default.

(Like RHEL, they offer optional additional interpreters if you want to run
upstream software written within the last two years.)

At least QEMU's stated support for RHEL8 runs out in another year or so. I
wonder what OpenSUSE is planning to do.


>
>
> because "use the system version of foo" should not be a big
> deal -- it's not like we're trying to support decades-old
> hosts here: Centos 8 was released in 2019, which is less than
> five years ago.
>

Yeah, I have nothing cute to say to this. It's unfortunate that it's hard
to support RHEL8 and Fedora 37 simultaneously as development environments
for our devs.

I do take great pains to reduce disruptions to everyone as I keep the
python code afloat. I hope I have been successful these past few years.

However, there are packaged versions of modern Python available for any
platform we support that otherwise defaults to 3.6, so it's not a huge
affair to continue supporting these older platforms.

It'll just be as if you need one extra dependency on those systems. (Maybe
two if you want to build docs.)

I think that trade-off is fair; as it's only a one-time expense to
developers still working on older platforms.


> > The argument I'm making is:
> >
> > - CentOS 8 is a supported build platform
> > - All platforms *do* have a Python modern enough to allow us to drop 3.6
> > - CentOS's repo version of sphinx is hardcoded to use the older 3.6,
> though
> > - You expressed a preference to me in the past to NOT use a pip
> installed version of sphinx in preference to the system version in
> "configure"
> > - It's still possible to build docs on CentOS 8 after this patchset, you
> just need a pip version.
> > - We've used the justification that our build platform promise does not
> necessarily extend to docs and tests in the past.
> > - So just skip docs building for CentOS 8, only in the CI.
> >
> > If you believe docs in CI for CentOS 8 is a hard deal breaker, then I
> want to go back to discussing the possibility of using sphinx versions from
> pip.
>
> If Python 3.6 is EOL, shouldn't CentOS have shipped an updated
> version of Sphinx to go with their updated Python ?
>

It's EOL upstream, but I suppose the RHEL/CentOS view is that we'll support
it with our own security fixes/backports past its upstream death. I don't
know the exact versioning policies, but generally they never do a version
bump. I don't expect them to ever upgrade the platform default python from
3.6, because it will likely involve hundreds of version bumps to other
packages as a result.


> I'm not super-happy about dropping the docs build requirement,
> but I guess it's probably the least-worst choice.
>

I think Paolo is advocating for allowing the build to use a pip-installed
version of sphinx, and configuring our docker containers to set up that
environment.

We'd keep CentOS 8 building docs just fine as a result.

It would mean that individual contributors that wanted to build docs on
CentOS 8 would need to install a sphinx version with pip, though.

(The problem with just allowing sphinx to be a black box and continuing to
happily use the 3.6-based versions is that we are using QAPIDoc extensions
from our own codebase, which would lock those to 3.6. A big motivator for
Markus is dropping some 3.6 kludges we're carrying for qapi, so I looked to
the opposite solution - nudging Sphinx forward instead.)


> thanks
> -- PMM
>

Sorry for the essay!
--js

>

--00000000000033b68305f45c33c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 11:32 AM Peter Maydell &lt;<a hr=
ef=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Fri, 10 Feb 2023 at 16:01, J=
ohn Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"n=
oreferrer">jsnow@redhat.com</a>&gt; wrote:<br>
&gt; On Fri, Feb 10, 2023, 5:41 AM Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter.maydell@li=
naro.org</a>&gt; wrote:<br>
&gt;&gt; On Fri, 10 Feb 2023 at 00:31, John Snow &lt;<a href=3D"mailto:jsno=
w@redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;=
 wrote:<br>
&gt;&gt; This confuses me. We work fine with Python 3.6 today.<br>
&gt;<br>
&gt;<br>
&gt; That won&#39;t last - Many tools such as mypy, pylint and flake8 which=
 I use to manage our python codebase have been dropping support for 3.6 and=
 I&#39;ve had to implement an increasing number of workarounds to help keep=
 it possible to test 3.6 via CI while also ensuring our newest platforms wo=
rk as dev environments.<br>
<br>
Something somewhere seems kind of out-of-sync here. Either:<br>
=C2=A0* Python is deprecating old versions too quickly and<br>
=C2=A0 =C2=A0dropping support for them too fast<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I think this is true. The Py=
thon upstream ecosystem moves extremely fast and breaks backwards compatibi=
lity for tooling often. It is sometimes tough to mediate that flow rate dif=
ference.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Part of the rea=
son I added that &quot;check-tox&quot; CI test that is currently optional t=
o run is specifically so it can find problems with cutting edge tooling - a=
nd it happens often. (It seems like every freeze, I find out a new upstream=
 version of something breaks the testing, like clockwork.)</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">On the other hand, Python 3.6 did launch=
 some six years ago - 2016-12-22. It&#39;s probably reasonable most cutting=
 edge tooling for f37/f38 no longer supports developing for a version this =
old.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I can&#39;t deny th=
at the Python package ecosystem is too cavalier about dropping for support =
for things too quickly, though.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0* CentOS is retaining old versions of Python when it needs to<br>
=C2=A0 =C2=A0ship newer ones<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I&#39;m not clear on the exact policies for Str=
eam 8/9, but in our traditional releases we&#39;d not ever upgrade this - w=
e&#39;d only do micro updates and backports.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Instead, Stream 8/9 (and OpenSUSE too) offer optional =
Python versions that install side-by-side.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">So sphinx (as packaged as an rpm) continues to use the p=
latform Python - 3.6 - but you *can* launch the &quot;system sphinx&quot; w=
ith your newer Python interpreter - if the version of sphinx shipped happen=
s to cope with a newer interpreter.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">(If you run `python3.7 -m sphinx`, for example - it might work,=
 but only if your rpm-packaged sphinx isn&#39;t using any features of Pytho=
n that were dropped in 3.7. I&#39;d wager it probably does work most of the=
 time.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
=C2=A0* Our policy for what distros we support is overly lax<br>
=C2=A0 =C2=A0and causing us to try to support ancient platforms<br>
=C2=A0 =C2=A0that we shouldn&#39;t be trying to support<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Possibly. Part of th=
e idea behind RHEL8/CentOS8 is that you&#39;ll get security fixes, but it s=
hould otherwise be a stable platform for production.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Supporting this as a development environment f=
or cutting edge versions does feel like a mismatch in visions at times.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">RHEL8 launched 2018-11-14, =
so is it reasonable to expect that cutting edge versions of QEMU 4 years in=
 the future will build on it no problem?</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Meanwhile, OpenSUSE 15.4 released just eight months ago an=
d still ships Python 3.6 as its default/platform Python. They don&#39;t shi=
p a distro with a modern Python as default at all... Even the upcoming 15.5=
 release still appears to use Python 3.6 as the platform default.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">(Like RHEL, they offer optional a=
dditional interpreters if you want to run upstream software written within =
the last two years.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">At =
least QEMU&#39;s stated support for RHEL8 runs out in another year or so. I=
 wonder what OpenSUSE is planning to do.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br><br><br>
because &quot;use the system version of foo&quot; should not be a big<br>
deal -- it&#39;s not like we&#39;re trying to support decades-old<br>
hosts here: Centos 8 was released in 2019, which is less than<br>
five years ago.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Yeah, I have nothing cute to say to this. It&#39;s unfortuna=
te that it&#39;s hard to support RHEL8 and Fedora 37 simultaneously as deve=
lopment environments for our devs.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I do take great pains to reduce disruptions to everyone as I kee=
p the python code afloat. I hope I have been successful these past few year=
s.</div><div dir=3D"auto"><br></div><div dir=3D"auto">However, there are pa=
ckaged versions of modern Python available for any platform we support that=
 otherwise defaults to 3.6, so it&#39;s not a huge affair to continue suppo=
rting these older platforms.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">It&#39;ll just be as if you need one extra dependency on those systems=
. (Maybe two if you want to build docs.)</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">I think that trade-off is fair; as it&#39;s only a one-tim=
e expense to developers still working on older platforms.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
&gt; The argument I&#39;m making is:<br>
&gt;<br>
&gt; - CentOS 8 is a supported build platform<br>
&gt; - All platforms *do* have a Python modern enough to allow us to drop 3=
.6<br>
&gt; - CentOS&#39;s repo version of sphinx is hardcoded to use the older 3.=
6, though<br>
&gt; - You expressed a preference to me in the past to NOT use a pip instal=
led version of sphinx in preference to the system version in &quot;configur=
e&quot;<br>
&gt; - It&#39;s still possible to build docs on CentOS 8 after this patchse=
t, you just need a pip version.<br>
&gt; - We&#39;ve used the justification that our build platform promise doe=
s not necessarily extend to docs and tests in the past.<br>
&gt; - So just skip docs building for CentOS 8, only in the CI.<br>
&gt;<br>
&gt; If you believe docs in CI for CentOS 8 is a hard deal breaker, then I =
want to go back to discussing the possibility of using sphinx versions from=
 pip.<br>
<br>
If Python 3.6 is EOL, shouldn&#39;t CentOS have shipped an updated<br>
version of Sphinx to go with their updated Python ?<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s EOL upstream, b=
ut I suppose the RHEL/CentOS view is that we&#39;ll support it with our own=
 security fixes/backports past its upstream death. I don&#39;t know the exa=
ct versioning policies, but generally they never do a version bump. I don&#=
39;t expect them to ever upgrade the platform default python from 3.6, beca=
use it will likely involve hundreds of version bumps to other packages as a=
 result.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
I&#39;m not super-happy about dropping the docs build requirement,<br>
but I guess it&#39;s probably the least-worst choice.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think Paolo is advoc=
ating for allowing the build to use a pip-installed version of sphinx, and =
configuring our docker containers to set up that environment.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">We&#39;d keep CentOS 8 building docs =
just fine as a result.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
t would mean that individual contributors that wanted to build docs on Cent=
OS 8 would need to install a sphinx version with pip, though.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">(The problem with just allowing sphin=
x to be a black box and continuing to happily use the 3.6-based versions is=
 that we are using QAPIDoc extensions from our own codebase, which would lo=
ck those to 3.6. A big motivator for Markus is dropping some 3.6 kludges we=
&#39;re carrying for qapi, so I looked to the opposite solution - nudging S=
phinx forward instead.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Sorry for the essay!</div><div dir=3D"auto">--js</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000033b68305f45c33c0--


