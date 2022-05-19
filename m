Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A5052DFE9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 00:17:33 +0200 (CEST)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nroSa-0007gw-4T
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 18:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nroR5-0006qP-Gi
 for qemu-devel@nongnu.org; Thu, 19 May 2022 18:15:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nroR1-000612-Vb
 for qemu-devel@nongnu.org; Thu, 19 May 2022 18:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652998554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xv1V/bVJZ3y9epDuzwr5dlqqDP8ImlSDLomfqdQRtYY=;
 b=aY3rqGj7gWSE8CxSGj9xLO/hXi7ttEs2PJzBMwe2zBKa+0GDzHqmd0i/A+xmEWrtCliVjr
 tvop3oSELRK2Wwxnqhb+QDv2pTIIDjWk6QGQQCTLKyrPs1xXcKFNfulEjgibKM1RSteVIE
 71/QeZIzWZaANCBqADoym/5z4f6RqCg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-lpl1LTVjP2-jiwqsXbljmA-1; Thu, 19 May 2022 18:15:53 -0400
X-MC-Unique: lpl1LTVjP2-jiwqsXbljmA-1
Received: by mail-ua1-f69.google.com with SMTP id
 o68-20020a9f354a000000b00368bf24af26so3005316uao.9
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 15:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xv1V/bVJZ3y9epDuzwr5dlqqDP8ImlSDLomfqdQRtYY=;
 b=Mbta7maf+kBpx9rPanXYFlMg+QWVn0eNNBETLFxRKGmHR3gvBpjaYPGrkFNie4Pu23
 Jrq9MuyWTNqhipV0IbFPKJzYY9eA7xKb4e6a1NXSZa9CBgG5aCUUiSyfr29nmnW7byk+
 jR8BEjj+89H63/pW7ev6EEnGB6eFam2cmV1OWsszJmCxGhjhyDRRaR/OVYqY/OXW7ouD
 iHjeOnx7KDqhh+QgCBCF7UGGqLHLZCf84i639DLbfahfUk/GsKSpwzLiR/R5/ycmBw/6
 p7Q9vfjYyEDY948NMYYFpkHhZgGxgv9HwF3EVU0hw1VGHfT12dk7F9t5lBdFwEURsDjx
 a6hA==
X-Gm-Message-State: AOAM531upPkMmrMuU1Y2urd7FbOy1nlcOZ48xIw4aUGJHmerh9Pw16z4
 VkrojGNXpaqvmfBaboPQqtXHzipLdpD868DrfsTsFe9NeHEh22wzxPZwtpviEgPz5nq7PxFcuYM
 1HMgrZGIpwITAf4QmvEh9klq7RqRNp+E=
X-Received: by 2002:a1f:ce46:0:b0:34e:b018:c8a4 with SMTP id
 e67-20020a1fce46000000b0034eb018c8a4mr2975868vkg.26.1652998552697; 
 Thu, 19 May 2022 15:15:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBh5AkOOezJiFPPDCPFDUPQlrbNj14VnWO1v4V17FxCPS1yxTgk6lItsINNgVG/LSO5Fglkv5w180tL6Vbttw=
X-Received: by 2002:a1f:ce46:0:b0:34e:b018:c8a4 with SMTP id
 e67-20020a1fce46000000b0034eb018c8a4mr2975859vkg.26.1652998552432; Thu, 19
 May 2022 15:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-aEc=uWyGi2758wDwJF=St4ZThkvuDqVXoxTtcHLFZkhA@mail.gmail.com>
 <YoUgufuA8/pjYwTE@redhat.com>
 <CAFn=p-YUQm-spxrbOgv8xKB3wDMWdTRfSVB6oVOiYh=Eqw=sfA@mail.gmail.com>
 <YoX30Aa0x40CKe7G@redhat.com> <YoX+5VEe/ET8+5W8@redhat.com>
In-Reply-To: <YoX+5VEe/ET8+5W8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 19 May 2022 18:15:39 -0400
Message-ID: <CAFn=p-Z-dEQkNJm2nJt=G+Y-mUVZb+6kZ5t5LwJ6JHHh-WMBGQ@mail.gmail.com>
Subject: Re: The fate of iotest 297
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000884a5305df64b71f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--000000000000884a5305df64b71f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022, 4:25 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Thu, May 19, 2022 at 09:54:56AM +0200, Kevin Wolf wrote:
> > Am 18.05.2022 um 20:21 hat John Snow geschrieben:
> > > To wire it up to "make check" by *default*, I believe I need to expan=
d
> the
> > > configure script to poll for certain requisites and then create some
> > > wrapper script of some kind that only engages the python tests if the
> > > requisites were met ... and I lose some control over the mypy/pylint
> > > versioning windows. I have to tolerate a wider versioning, or it'll
> never
> > > get run in practice.
> > >
> > > I have some reluctance to doing this, because pylint and mypy change =
so
> > > frequently that I don't want "make check" to fail spuriously in the
> future.
> > >
> > > (In practice, these failures occur 100% of the time when I am on
> vacation.)
> >
> > So we seem to agree that it's something that we do expect to fail from
> > time to time. Maybe this is how I could express my point better: If it'=
s
> > a hard failure, it should fail as early as possible - i.e. ideally
> > before the developer sends a patch, but certainly before failing a pull
> > request.
>
> At least with pylint we can make an explicit list of which lint
> checks we want to run, so we should not get new failures when a
> new pylint is released. If there are rare cases where we none
> the less see a new failure from a new release, then so be it,
> whoever hits it first can send a patch. IOW, I think we should
> just enable pylint all the time with a fixed list of tests we
> care about. Over time we can enable more of its checks when
> desired.
>

Yeh, this might help a bit. If we use system packages by default, we'll
also generally avoid using bleeding edge packages and I'll (generally)
catch those myself via check-tox before people run into them organically.


> I don't know enough about mypy to know if it can provide similar
> level of control. Possibly the answer for "should we run it by default"
> will be different for pylint vs mypy.
>

Yeah, we can probably do different things. mypy is actually much more
stable than pylint IMO, it's probably actually okay to just let that one
behave as-is.

(I know I have a fix for 0.950 in my recent rfc series, but anecdotally I
feel mypy changes behavior a lot less often than pylint. isort and flake8
have basically never ever broken on update for me, either.)

Still, none of this is all that different from the case where
> new GCC or CLang are released and developers find new warnings
> have arrived. People just send patches when they hit this.
> Given python is a core part of QEMU's dev tooling, I think it
> is reasonable to expect developers to cope with this for python
> too, as long as the frequency of problems is not unreasonably
> high.
>

To some extent, though it's still a bummer to get warnings and errors that
have nothing to do with your changes. I have made sure I test a wide matrix
to the best of my ability, so it should be fine. I guess I'm just super
conservative about it ...

(Well, and even when I had the check-tox test set to allow failure, the
yellow exclamation mark still annoyed people. I'm just keen to avoid more
nastygrams.)


> > > That said ... maybe I can add a controlled venv version of
> "check-python"
> > > and just have a --disable-check-python or something that spec files
> can opt
> > > into. Maybe that will work well enough?
> > >
> > > i.e. maybe configure can check for the presence of pip, the python ve=
nv
> > > module (debian doesnt ship it standard...), and PyPI connectivity and
> if
> > > so, enables the test. Otherwise, we skip it.
> >
> > I think this should work. If detecting the right environment is hard, I
> > don't think there is even a requirement to do so. You can make
> > --enable-check-python the default and if people don't want it, they can
> > explicitly disable it. (I understand that until you run 'make check', i=
t
> > doesn't make a difference anyway, so pure users would never have to
> > change the option, right?)
>
> I think it should just be the default too. Contributors have to accept
> that python is a core part of our project and we expect such code to
> pass various python quality control tests, on the wide variety of OS
> platforms we run on.
>

I meant that I'd have the default be "auto", but if you're arguing for the
default to be "on", I suppose I could. I have a weak preference for keeping
the min requisites for a no-option configure set small. This should be
trivial to change in either direction, though.

The requisites aren't steep: you just need python and the venv stdlib
module. If you have python, you meet that requisite on every platform
except debian/ubuntu, which ships venv separately. In practice, it probably
will be enabled for most people by default.


> > > Got it. I'll see what I can come up with that checks the boxes for
> > > everyone, thanks for clarifying yours.
> > >
> > > I want to make everything "just work" but I'm also afraid of writing
> too
> > > much magic crap that could break and frustrate people who have no
> desire to
> > > understand python packaging junk, so I'm trying to balance that.
> >
> > Yes, sounds like we need to find some balance there. Test infrastructur=
e
> > breaking locally for no obvious reason can be quite frustrating. But
> > sending a patch and getting it queued, only to be notified that it's
> > dropped again because of a mypy problem two weeks later when the
> > maintainer sends the pull request, can be equally (if not even more)
> > frustrating.
>
> The other benefit to having the checks turned on by default for everyone
> is that it removes John as the centralized point responsible for finding,
> investigating and addressing python style issues, and distributes it
> amongst all the QEMU contributors.
>

Haha. I won't hold my breath for anyone else to have patience enough to
track it down, but I appreciate the sentiment :)

Thanks for the feedback. I'm still working on my RFC for the actual unit
testing venv but ran into some difficulties with vm tests and Avocado tests
being a little flaky, and testing has been slow.

So: v2 RFC coming up soon and I'll put code and test results to all these
worrrrrrrrrds.

--js

--000000000000884a5305df64b71f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 19, 2022, 4:25 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, May 19, 2022 at 09:54:56=
AM +0200, Kevin Wolf wrote:<br>
&gt; Am 18.05.2022 um 20:21 hat John Snow geschrieben:<br>
&gt; &gt; To wire it up to &quot;make check&quot; by *default*, I believe I=
 need to expand the<br>
&gt; &gt; configure script to poll for certain requisites and then create s=
ome<br>
&gt; &gt; wrapper script of some kind that only engages the python tests if=
 the<br>
&gt; &gt; requisites were met ... and I lose some control over the mypy/pyl=
int<br>
&gt; &gt; versioning windows. I have to tolerate a wider versioning, or it&=
#39;ll never<br>
&gt; &gt; get run in practice.<br>
&gt; &gt; <br>
&gt; &gt; I have some reluctance to doing this, because pylint and mypy cha=
nge so<br>
&gt; &gt; frequently that I don&#39;t want &quot;make check&quot; to fail s=
puriously in the future.<br>
&gt; &gt; <br>
&gt; &gt; (In practice, these failures occur 100% of the time when I am on =
vacation.)<br>
&gt; <br>
&gt; So we seem to agree that it&#39;s something that we do expect to fail =
from<br>
&gt; time to time. Maybe this is how I could express my point better: If it=
&#39;s<br>
&gt; a hard failure, it should fail as early as possible - i.e. ideally<br>
&gt; before the developer sends a patch, but certainly before failing a pul=
l<br>
&gt; request.<br>
<br>
At least with pylint we can make an explicit list of which lint<br>
checks we want to run, so we should not get new failures when a<br>
new pylint is released. If there are rare cases where we none<br>
the less see a new failure from a new release, then so be it,<br>
whoever hits it first can send a patch. IOW, I think we should<br>
just enable pylint all the time with a fixed list of tests we<br>
care about. Over time we can enable more of its checks when<br>
desired.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yeh, this might help a bit. If we use system packages by default,=
 we&#39;ll also generally avoid using bleeding edge packages and I&#39;ll (=
generally) catch those myself via check-tox before people run into them org=
anically.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
I don&#39;t know enough about mypy to know if it can provide similar<br>
level of control. Possibly the answer for &quot;should we run it by default=
&quot;<br>
will be different for pylint vs mypy.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Yeah, we can probably do different th=
ings. mypy is actually much more stable than pylint IMO, it&#39;s probably =
actually okay to just let that one behave as-is.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">(I know I have a fix for 0.950 in my recent rfc se=
ries, but anecdotally I feel mypy changes behavior a lot less often than py=
lint. isort and flake8 have basically never ever broken on update for me, e=
ither.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
Still, none of this is all that different from the case where<br>
new GCC or CLang are released and developers find new warnings<br>
have arrived. People just send patches when they hit this.<br>
Given python is a core part of QEMU&#39;s dev tooling, I think it<br>
is reasonable to expect developers to cope with this for python<br>
too, as long as the frequency of problems is not unreasonably<br>
high.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">To some extent, though it&#39;s still a bummer to get warnings and err=
ors that have nothing to do with your changes. I have made sure I test a wi=
de matrix to the best of my ability, so it should be fine. I guess I&#39;m =
just super conservative about it ...</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">(Well, and even when I had the check-tox test set to allow fai=
lure, the yellow exclamation mark still annoyed people. I&#39;m just keen t=
o avoid more nastygrams.)</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; &gt; That said ... maybe I can add a controlled venv version of &quot;=
check-python&quot;<br>
&gt; &gt; and just have a --disable-check-python or something that spec fil=
es can opt<br>
&gt; &gt; into. Maybe that will work well enough?<br>
&gt; &gt; <br>
&gt; &gt; i.e. maybe configure can check for the presence of pip, the pytho=
n venv<br>
&gt; &gt; module (debian doesnt ship it standard...), and PyPI connectivity=
 and if<br>
&gt; &gt; so, enables the test. Otherwise, we skip it.<br>
&gt; <br>
&gt; I think this should work. If detecting the right environment is hard, =
I<br>
&gt; don&#39;t think there is even a requirement to do so. You can make<br>
&gt; --enable-check-python the default and if people don&#39;t want it, the=
y can<br>
&gt; explicitly disable it. (I understand that until you run &#39;make chec=
k&#39;, it<br>
&gt; doesn&#39;t make a difference anyway, so pure users would never have t=
o<br>
&gt; change the option, right?)<br>
<br>
I think it should just be the default too. Contributors have to accept<br>
that python is a core part of our project and we expect such code to<br>
pass various python quality control tests, on the wide variety of OS<br>
platforms we run on.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I meant that I&#39;d have the default be &quot;auto&quo=
t;, but if you&#39;re arguing for the default to be &quot;on&quot;, I suppo=
se I could. I have a weak preference for keeping the min requisites for a n=
o-option configure set small. This should be trivial to change in either di=
rection, though.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The req=
uisites aren&#39;t steep: you just need python and the venv stdlib module. =
If you have python, you meet that requisite on every platform except debian=
/ubuntu, which ships venv separately. In practice, it probably will be enab=
led for most people by default.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; &gt; Got it. I&#39;ll see what I can come up with that checks the boxe=
s for<br>
&gt; &gt; everyone, thanks for clarifying yours.<br>
&gt; &gt; <br>
&gt; &gt; I want to make everything &quot;just work&quot; but I&#39;m also =
afraid of writing too<br>
&gt; &gt; much magic crap that could break and frustrate people who have no=
 desire to<br>
&gt; &gt; understand python packaging junk, so I&#39;m trying to balance th=
at.<br>
&gt; <br>
&gt; Yes, sounds like we need to find some balance there. Test infrastructu=
re<br>
&gt; breaking locally for no obvious reason can be quite frustrating. But<b=
r>
&gt; sending a patch and getting it queued, only to be notified that it&#39=
;s<br>
&gt; dropped again because of a mypy problem two weeks later when the<br>
&gt; maintainer sends the pull request, can be equally (if not even more)<b=
r>
&gt; frustrating.<br>
<br>
The other benefit to having the checks turned on by default for everyone<br=
>
is that it removes John as the centralized point responsible for finding,<b=
r>
investigating and addressing python style issues, and distributes it<br>
amongst all the QEMU contributors.<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Haha. I won&#39;t hold my breath for anyo=
ne else to have patience enough to track it down, but I appreciate the sent=
iment :)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the =
feedback. I&#39;m still working on my RFC for the actual unit testing venv =
but ran into some difficulties with vm tests and Avocado tests being a litt=
le flaky, and testing has been slow.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">So: v2 RFC coming up soon and I&#39;ll put code and test resul=
ts to all these worrrrrrrrrds.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">--js</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></=
div>

--000000000000884a5305df64b71f--


