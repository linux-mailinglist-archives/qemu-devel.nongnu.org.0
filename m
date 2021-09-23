Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D06D416259
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:49:11 +0200 (CEST)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQyE-0007GG-G9
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTQrq-0001aD-MB
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:42:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTQre-0005cr-SF
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632411741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3x0Un7NBFPjI9REJDLoBE7tbGzUbXPMMK93EaxZ9W0=;
 b=HK67/VaAmpSHRLJE755ln/8EYLh17ajraxlXIVGn4BZZfZlEZrtvUQdbut28+L6AqR7CtV
 nurwksMJkHty9yFL7Q1+wI/36XXXynuoqiFL37sta432U4v47vIi2bBUzW6Ckw6WFw1h/C
 gTAf2mvJ+FWSvvfXx4BcSwEXUAOqwjc=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-aAls3UgBOnyxac067b8vhg-1; Thu, 23 Sep 2021 11:42:15 -0400
X-MC-Unique: aAls3UgBOnyxac067b8vhg-1
Received: by mail-oo1-f72.google.com with SMTP id
 f2-20020a4a2202000000b0028c8a8074deso4040660ooa.20
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 08:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3x0Un7NBFPjI9REJDLoBE7tbGzUbXPMMK93EaxZ9W0=;
 b=2nNbs88KLeLf63kN3H8HbMUIk3nJz+4ZA01qWbR6DeFAfKc6uk++cTw+z7UNx8X8CC
 r9gbXYSK/CWI/AKsn+h2rL4sL/cxSr8ycuy9ycTMN9ErqNUTHBMXnw7QK3eZnZJYvzaO
 g2JKuDrDtwmMHhi05xPQjSPqJyeter8V7iyZmrZxWz/r0PZmmarD5MN5fpAAWhWDn4oL
 qo+g31XQxPEkffjIKKGaCb36baMVQ21t1CBadCgVOfWSQAEmw8sgdngxSHTB36+bbFTP
 gdL5mMquc8KImq3+Aujy96r18D674AqgfmiOJY5WD+M4INv/BsS+tkA7LovVLNwKysqU
 zNuQ==
X-Gm-Message-State: AOAM532bxNFtN/5YiDs5u7H5wy+7122+5cY2Fhrqhfvh558cuOPaLnk7
 ADMMyXwbzyoiO0wpcRPtvddx/6+ixzHSdPWG2QuZADwenBtl7AymmZyMOmAZx4L/P+reub+V9Jq
 A0IZ1kd3C2YUbXm+Qedeu0EAFX/yFwGQ=
X-Received: by 2002:aca:f257:: with SMTP id q84mr4092700oih.52.1632411734831; 
 Thu, 23 Sep 2021 08:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJBNKvr4ku78n5qxNu5xRwhy15Oj8y7Cn/MTDmYdh8HnXbMxpR78Ri0Sry/qutawKi3tUGN5/OXmPdT2lpng4=
X-Received: by 2002:aca:f257:: with SMTP id q84mr4092685oih.52.1632411734493; 
 Thu, 23 Sep 2021 08:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-3-jsnow@redhat.com>
 <YUxgU6DrbcspzDtr@redhat.com>
In-Reply-To: <YUxgU6DrbcspzDtr@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 23 Sep 2021 11:42:03 -0400
Message-ID: <CAFn=p-ZVvp45xLpx-QJw-SKZNZtbyVzdChfvPGFqjNts+A-bnA@mail.gmail.com>
Subject: Re: [PATCH 2/6] iotests: add warning for rogue 'qemu' packages
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008fe05b05ccab7910"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008fe05b05ccab7910
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 7:09 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Sep 22, 2021 at 08:16:21PM -0400, John Snow wrote:
> > Add a warning for when 'iotests' runs against a qemu namespace that
> > isn't the one in the source tree. This might occur if you have
> > (accidentally) installed the Python namespace package to your local
> > packages.
>
> IIUC, it is/was a valid use case to run the iotests on arbitrary
> QEMU outside the source tree ie a distro packaged binary set.
>
> Are we not allowing the tests/qemu-iotests/* content to be
> run outside the context of the main source tree for this
> purpose ?
>
> eg  consider if Fedora/RHEL builds put tests/qemu-iotests/* into
> a 'qemu-iotests' RPM, which was installed and used with a distro
> package python-qemu ?
>
>
(1) "isn't the one in the source tree" is imprecise language here. The real
key is that it must be the QEMU namespace located at "
testenv.py/../../../python/qemu". This usually means the source tree, but
it'd work in any identically structured filesystem hierarchy.

(2) The preceding patch might help illustrate this. At present the iotests
expect to be able to find the 'qemu' python packages by navigating
directories starting from their own location (and not CWD). What patch 1
does is to centralize the logic that has to go "searching" for the python
packages into the init_directories method in testenv.py so that each
individual test doesn't have to repeat it.

i.e. before patch 1, iotests.py does this:
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..',
'python'))

so we'll always crawl to ../../python from wherever iotests.py is.

After patch 1, we're going to crawl to the same location, but starting from
testenv.py instead. testenv.py and iotests.py are in the same directory, so
I expect whatever worked before (and in whatever environment) will continue
working after. I can't say with full certainty in what circumstances we
support running iotests, but I don't think I have introduced any new
limitation with this.


> > (I'm not going to say that this is because I bit myself with this,
> > but. You can fill in the blanks.)
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/testenv.py | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qemu-iotests/testenv.py
> b/tests/qemu-iotests/testenv.py
> > index 88104dace90..8a43b193af5 100644
> > --- a/tests/qemu-iotests/testenv.py
> > +++ b/tests/qemu-iotests/testenv.py
> > @@ -16,6 +16,8 @@
> >  # along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
> >  #
> >
> > +import importlib.util
> > +import logging
> >  import os
> >  import sys
> >  import tempfile
> > @@ -25,7 +27,7 @@
> >  import random
> >  import subprocess
> >  import glob
> > -from typing import List, Dict, Any, Optional, ContextManager
> > +from typing import List, Dict, Any, Optional, ContextManager, cast
> >
> >  DEF_GDB_OPTIONS =3D 'localhost:12345'
> >
> > @@ -112,6 +114,22 @@ def init_directories(self) -> None:
> >          # Path where qemu goodies live in this source tree.
> >          qemu_srctree_path =3D Path(__file__, '../../../python').resolv=
e()
> >
> > +        # warn if we happen to be able to find 'qemu' packages from an
> > +        # unexpected location (i.e. the package is already installed i=
n
> > +        # the user's environment)
> > +        qemu_spec =3D importlib.util.find_spec('qemu.qmp')
> > +        if qemu_spec:
> > +            spec_path =3D Path(cast(str, qemu_spec.origin))
> > +            try:
> > +                _ =3D spec_path.relative_to(qemu_srctree_path)
> > +            except ValueError:
> > +                self._logger.warning(
> > +                    "WARNING: 'qemu' package will be imported from
> outside "
> > +                    "the source tree!")
> > +                self._logger.warning(
> > +                    "Importing from: '%s'",
> > +                    spec_path.parents[1])
>
> It feels to me like the scenario  we're blocking here is actally
> the scenario we want to aim for.
>
>
It isn't blocking it, it's just a warning. At present, iotests expects that
it's using the version of the python packages that are in the source tree /
tarball / whatever. Since I converted those packages to be installable to
your environment, I introduced an ambiguity about which version iotests is
actually using: the version you installed, or the version in the source
tree? This is just merely a warning to let you know that iotests is
technically doing something new. ("Hey, you're running some other python
code than what iotests has done for the past ten years. Are you cool with
that?")

You're right, though: my actual end-goal (after a lot of pending cleanups I
have in-flight, I am getting to it ...!) is to eventually pivot iotests to
always using qemu as an installed package and wean it off of using
directory-crawling to find its dependencies. We are close to doing that.
When we do transition to that, the warning can be dropped as there will no
longer be an ambiguity over which version it is using. There are some
questions for me to ponder first over exactly how the environment setup
should be accomplished, though.


> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000008fe05b05ccab7910
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 7:09 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Sep 22, 2021 at 08:16:21PM -0400, John Snow wrote:<br>
&gt; Add a warning for when &#39;iotests&#39; runs against a qemu namespace=
 that<br>
&gt; isn&#39;t the one in the source tree. This might occur if you have<br>
&gt; (accidentally) installed the Python namespace package to your local<br=
>
&gt; packages.<br>
<br>
IIUC, it is/was a valid use case to run the iotests on arbitrary<br>
QEMU outside the source tree ie a distro packaged binary set.<br>
<br>
Are we not allowing the tests/qemu-iotests/* content to be<br>
run outside the context of the main source tree for this<br>
purpose ?<br>
<br>
eg=C2=A0 consider if Fedora/RHEL builds put tests/qemu-iotests/* into<br>
a &#39;qemu-iotests&#39; RPM, which was installed and used with a distro<br=
>
package python-qemu ?<br>
<br></blockquote><div><br></div><div>(1) &quot;isn&#39;t the one in the sou=
rce tree&quot; is imprecise language here. The real key is that it must be =
the QEMU namespace located at &quot;<a href=3D"http://testenv.py/../../../p=
ython/qemu">testenv.py/../../../python/qemu</a>&quot;. This usually means t=
he source tree, but it&#39;d work in any identically structured filesystem =
hierarchy.</div><div><br></div><div>(2) The preceding patch might help illu=
strate this. At present the iotests expect to be able to find the &#39;qemu=
&#39; python packages by navigating directories starting from their own loc=
ation (and not CWD). What patch 1 does is to centralize the logic that has =
to go &quot;searching&quot; for the python packages into the init_directori=
es method in testenv.py so that each individual test doesn&#39;t have to re=
peat it.<br></div><div><br></div><div>i.e. before patch 1, iotests.py does =
this:</div><div>sys.path.append(os.path.join(os.path.dirname(__file__), &#3=
9;..&#39;, &#39;..&#39;, &#39;python&#39;))</div><div><br></div><div>so we&=
#39;ll always crawl to ../../python from wherever iotests.py is.</div><div>=
<br></div><div>After patch 1, we&#39;re going to crawl to the same location=
, but starting from testenv.py instead. testenv.py and iotests.py are in th=
e same directory, so I expect whatever worked before (and in whatever envir=
onment) will continue working after. I can&#39;t say with full certainty in=
 what circumstances we support running iotests, but I don&#39;t think I hav=
e introduced any new limitation with this.<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; (I&#39;m not going to say that this is because I bit myself with this,=
<br>
&gt; but. You can fill in the blanks.)<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/qemu-iotests/testenv.py | 21 ++++++++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 20 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testen=
v.py<br>
&gt; index 88104dace90..8a43b193af5 100644<br>
&gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt; @@ -16,6 +16,8 @@<br>
&gt;=C2=A0 # along with this program.=C2=A0 If not, see &lt;<a href=3D"http=
://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.g=
nu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 <br>
&gt; +import importlib.util<br>
&gt; +import logging<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import sys<br>
&gt;=C2=A0 import tempfile<br>
&gt; @@ -25,7 +27,7 @@<br>
&gt;=C2=A0 import random<br>
&gt;=C2=A0 import subprocess<br>
&gt;=C2=A0 import glob<br>
&gt; -from typing import List, Dict, Any, Optional, ContextManager<br>
&gt; +from typing import List, Dict, Any, Optional, ContextManager, cast<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEF_GDB_OPTIONS =3D &#39;localhost:12345&#39;<br>
&gt;=C2=A0 <br>
&gt; @@ -112,6 +114,22 @@ def init_directories(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Path where qemu goodies live in th=
is source tree.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_srctree_path =3D Path(__file__,=
 &#39;../../../python&#39;).resolve()<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # warn if we happen to be able to find &#=
39;qemu&#39; packages from an<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # unexpected location (i.e. the package i=
s already installed in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the user&#39;s environment)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spec =3D importlib.util.find_spec(&#=
39;qemu.qmp&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if qemu_spec:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_path =3D Path(cast(str=
, qemu_spec.origin))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D spec_pa=
th.relative_to(qemu_srctree_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._logger.=
warning(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;WARNING: &#39;qemu&#39; package will be imported from outside &quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;the source tree!&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._logger.=
warning(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;Importing from: &#39;%s&#39;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 spec_path.parents[1])<br>
<br>
It feels to me like the scenario=C2=A0 we&#39;re blocking here is actally<b=
r>
the scenario we want to aim for.<br>
<br></blockquote><div><br></div><div class=3D"gmail_quote">It isn&#39;t blo=
cking it, it&#39;s just a warning. At present, iotests expects that it&#39;=
s using the version of the python packages that are in the source tree / ta=
rball / whatever. Since I converted those packages to be installable to you=
r environment, I introduced an ambiguity about which version iotests is act=
ually using: the version you installed, or the version in the source tree? =
This is just merely a warning to let you know that iotests is technically d=
oing something new. (&quot;Hey, you&#39;re running some other python code t=
han what iotests has done for the past ten years. Are you cool with that?&q=
uot;)<br></div></div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">You&#39;re right, though: my actual end-goal (after a lot of pend=
ing cleanups I have in-flight, I am getting to it ...!) is to eventually pi=
vot iotests to always using qemu as an installed package and wean it off of=
 using directory-crawling to find its dependencies. We are close to doing t=
hat. When we do transition to that, the warning can be dropped as there wil=
l no longer be an ambiguity over which version it is using. There are some =
questions for me to ponder first over exactly how the environment setup sho=
uld be accomplished, though.<br></div><div class=3D"gmail_quote"><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000008fe05b05ccab7910--


