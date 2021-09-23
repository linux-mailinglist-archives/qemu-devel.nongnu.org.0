Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514B4161A8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:03:43 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQGE-00034f-3u
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTQCi-0000U4-EJ
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTQCf-0001Hi-BZ
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632409200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M96jtvs49yh1FOnIMpdWH1TG/m+ISvcZtcG+rS8UMY8=;
 b=GIvcIQhlRtje6s1cvHOnQjJ8uXTH+QQY9kWN8X2MYj+zSlIW1sFez1KDeDLLcczOA/IKxw
 euj5VdgBn8IeI7xHHi1QgksvOomm8Bd6Bxm7nFAjRUZSVuD3hWYblPwB6ns8ezV2227Foc
 iIiPSakvUL7tIUtBHZtALAPpgrYu5pY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-MzeL7yBSM9SM2NKHu3N8Qg-1; Thu, 23 Sep 2021 10:59:50 -0400
X-MC-Unique: MzeL7yBSM9SM2NKHu3N8Qg-1
Received: by mail-oi1-f198.google.com with SMTP id
 e186-20020acab5c3000000b00273804e72c8so3694283oif.11
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 07:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M96jtvs49yh1FOnIMpdWH1TG/m+ISvcZtcG+rS8UMY8=;
 b=h5LF03BlGQ/q4ip5WOaknonbhcU2rNI5s0mAx9tK3F0fQV9MgDDycQPxlpn+yd0N33
 w9Jp8yYhYb1QBMHeaApb/agbPimDsX+shyB5pN0O+biwhSqWHHzWLVPJzYtwezS87bU9
 cZ3T0e+CXSNyhuJi6n90/RC/Qos5dic597QEvGpIe1mXAr/AOKBRVPX717l9wDn+tOGE
 hzoUOGatQoJXDTb6jFTPtOzRpW0SP+0mkzOt3A0naSroE9kxrPdsq9VZcclNkd3LQvYX
 UcUUWxZiSadkuEy744rzyC9AMNZ/K/H+LyXAp0Y09r1KiNA9EzdMOznIqJZzw+vc8gB4
 ODig==
X-Gm-Message-State: AOAM531Im6Y6eHiVXiL5bEFjsCfEODZ8fP/jtkd5xmLynqxzrS1GRkzh
 kcEwqb2Mr7Bo/vdck8tJQ8lggWECvzXu6e5nji3SUaEeBxEb33dPsD7Wod/zjNUgPUQT9giANTD
 bZgLBdknnB//5Oa+Uig+AdGwxImcgslc=
X-Received: by 2002:aca:f257:: with SMTP id q84mr3916559oih.52.1632409189472; 
 Thu, 23 Sep 2021 07:59:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZO063ntCr0G9YJ5OT9oErNBYW+reGig0PnldSgJNftVm1iTUV8QL2oDtV6VqCF3qDfwoV3M5V58Ue9C/5JPw=
X-Received: by 2002:aca:f257:: with SMTP id q84mr3916545oih.52.1632409189286; 
 Thu, 23 Sep 2021 07:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-3-jsnow@redhat.com>
 <YUxdjJnwhABAvfbR@redhat.com> <YUxiOUTzEtNsiAI7@redhat.com>
In-Reply-To: <YUxiOUTzEtNsiAI7@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 23 Sep 2021 10:59:38 -0400
Message-ID: <CAFn=p-bGoPWNuKoL0+FaGYnGgDERuV9=qXhbXPcf7VUe=k3Agw@mail.gmail.com>
Subject: Re: [PATCH 2/6] iotests: add warning for rogue 'qemu' packages
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000db17dd05ccaae1fe"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000db17dd05ccaae1fe
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 7:17 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 23.09.2021 um 12:57 hat Kevin Wolf geschrieben:
> > Am 23.09.2021 um 02:16 hat John Snow geschrieben:
> > > Add a warning for when 'iotests' runs against a qemu namespace that
> > > isn't the one in the source tree. This might occur if you have
> > > (accidentally) installed the Python namespace package to your local
> > > packages.
> > >
> > > (I'm not going to say that this is because I bit myself with this,
> > > but. You can fill in the blanks.)
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >  tests/qemu-iotests/testenv.py | 21 ++++++++++++++++++++-
> > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/qemu-iotests/testenv.py
> b/tests/qemu-iotests/testenv.py
> > > index 88104dace90..8a43b193af5 100644
> > > --- a/tests/qemu-iotests/testenv.py
> > > +++ b/tests/qemu-iotests/testenv.py
> > > @@ -16,6 +16,8 @@
> > >  # along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > >  #
> > >
> > > +import importlib.util
> > > +import logging
> > >  import os
> > >  import sys
> > >  import tempfile
> > > @@ -25,7 +27,7 @@
> > >  import random
> > >  import subprocess
> > >  import glob
> > > -from typing import List, Dict, Any, Optional, ContextManager
> > > +from typing import List, Dict, Any, Optional, ContextManager, cast
> > >
> > >  DEF_GDB_OPTIONS = 'localhost:12345'
> > >
> > > @@ -112,6 +114,22 @@ def init_directories(self) -> None:
> > >          # Path where qemu goodies live in this source tree.
> > >          qemu_srctree_path = Path(__file__,
> '../../../python').resolve()
> > >
> > > +        # warn if we happen to be able to find 'qemu' packages from an
> > > +        # unexpected location (i.e. the package is already installed
> in
> > > +        # the user's environment)
> > > +        qemu_spec = importlib.util.find_spec('qemu.qmp')
> > > +        if qemu_spec:
> > > +            spec_path = Path(cast(str, qemu_spec.origin))
> >
> > You're casting Optional[str] to str here. The source type is not obvious
> > from the local code, so unless you spend some time actively figuring it
> > out, this could be casting anything to str. But even knowing this, just
> > casting Optional away looks fishy anyway.
> >
> > Looking up the ModuleSpec docs, it seems okay to assume that it's never
> > None in our case, but wouldn't it be much cleaner to just 'assert
> > qemu_spec.origin' first and then use it without the cast?
> >
>

OK. I suppose I was thinking: "It's always going to be a string, and if it
isn't, something else will explode below, surely, so the assertion is
redundant", but I don't want code that makes people wonder, so principle of
least surprise it is.


> > > +            try:
> > > +                _ = spec_path.relative_to(qemu_srctree_path)
> > > +            except ValueError:
> > > +                self._logger.warning(
> > > +                    "WARNING: 'qemu' package will be imported from
> outside "
> > > +                    "the source tree!")
> > > +                self._logger.warning(
> > > +                    "Importing from: '%s'",
> > > +                    spec_path.parents[1])
> > > +
> > >          self.pythonpath = os.getenv('PYTHONPATH')
> > >          self.pythonpath = os.pathsep.join(filter(None, (
> > >              self.source_iotests,
> > > @@ -231,6 +249,7 @@ def __init__(self, imgfmt: str, imgproto: str,
> aiomode: str,
> > >
> > >          self.build_root = os.path.join(self.build_iotests, '..', '..')
> > >
> > > +        self._logger = logging.getLogger('qemu.iotests')
> > >          self.init_directories()
> > >          self.init_binaries()
> >
> > Looks good otherwise.
>
> Well, actually there is a major problem: We'll pass the right PYTHONPATH
> for the test scripts that we're calling, but this script itself doesn't
> use it yet. So what I get is:
>
> Traceback (most recent call last):
>   File "/home/kwolf/source/qemu/tests/qemu-iotests/build/check", line 120,
> in <module>
>     env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>   File "/home/kwolf/source/qemu/tests/qemu-iotests/testenv.py", line 253,
> in __init__
>     self.init_directories()
>   File "/home/kwolf/source/qemu/tests/qemu-iotests/testenv.py", line 120,
> in init_directories
>     qemu_spec = importlib.util.find_spec('qemu.qmp')
>   File "/usr/lib64/python3.9/importlib/util.py", line 94, in find_spec
>     parent = __import__(parent_name, fromlist=['__path__'])
> ModuleNotFoundError: No module named 'qemu'
>
> Kevin
>
>
Tch. So, it turns out with namespace packages that once you remove the
subpackages (pip uninstall qemu), it leaves the empty namespace folder
behind. This is also the reason I directly use 'qemu.qmp' as a bellwether
here, to make sure we're prodding a package and not just an empty namespace
with nothing in it.

I'll fix these, thanks.

--000000000000db17dd05ccaae1fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 7:17 AM Kevin=
 Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 23.09.2021=
 um 12:57 hat Kevin Wolf geschrieben:<br>
&gt; Am 23.09.2021 um 02:16 hat John Snow geschrieben:<br>
&gt; &gt; Add a warning for when &#39;iotests&#39; runs against a qemu name=
space that<br>
&gt; &gt; isn&#39;t the one in the source tree. This might occur if you hav=
e<br>
&gt; &gt; (accidentally) installed the Python namespace package to your loc=
al<br>
&gt; &gt; packages.<br>
&gt; &gt; <br>
&gt; &gt; (I&#39;m not going to say that this is because I bit myself with =
this,<br>
&gt; &gt; but. You can fill in the blanks.)<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" =
target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 tests/qemu-iotests/testenv.py | 21 ++++++++++++++++++++-<br=
>
&gt; &gt;=C2=A0 1 file changed, 20 insertions(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/t=
estenv.py<br>
&gt; &gt; index 88104dace90..8a43b193af5 100644<br>
&gt; &gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt; &gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt; &gt; @@ -16,6 +16,8 @@<br>
&gt; &gt;=C2=A0 # along with this program.=C2=A0 If not, see &lt;<a href=3D=
"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://=
www.gnu.org/licenses/</a>&gt;.<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +import importlib.util<br>
&gt; &gt; +import logging<br>
&gt; &gt;=C2=A0 import os<br>
&gt; &gt;=C2=A0 import sys<br>
&gt; &gt;=C2=A0 import tempfile<br>
&gt; &gt; @@ -25,7 +27,7 @@<br>
&gt; &gt;=C2=A0 import random<br>
&gt; &gt;=C2=A0 import subprocess<br>
&gt; &gt;=C2=A0 import glob<br>
&gt; &gt; -from typing import List, Dict, Any, Optional, ContextManager<br>
&gt; &gt; +from typing import List, Dict, Any, Optional, ContextManager, ca=
st<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 DEF_GDB_OPTIONS =3D &#39;localhost:12345&#39;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -112,6 +114,22 @@ def init_directories(self) -&gt; None:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Path where qemu goodies live =
in this source tree.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_srctree_path =3D Path(__fi=
le__, &#39;../../../python&#39;).resolve()<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # warn if we happen to be able to fi=
nd &#39;qemu&#39; packages from an<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # unexpected location (i.e. the pack=
age is already installed in<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the user&#39;s environment)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spec =3D importlib.util.find_sp=
ec(&#39;qemu.qmp&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if qemu_spec:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_path =3D Path(cas=
t(str, qemu_spec.origin))<br>
&gt; <br>
&gt; You&#39;re casting Optional[str] to str here. The source type is not o=
bvious<br>
&gt; from the local code, so unless you spend some time actively figuring i=
t<br>
&gt; out, this could be casting anything to str. But even knowing this, jus=
t<br>
&gt; casting Optional away looks fishy anyway.<br>
&gt; <br>
&gt; Looking up the ModuleSpec docs, it seems okay to assume that it&#39;s =
never<br>
&gt; None in our case, but wouldn&#39;t it be much cleaner to just &#39;ass=
ert<br>
&gt; qemu_spec.origin&#39; first and then use it without the cast?<br>
&gt; <br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">OK. I suppose I was thinking: &quot;It&#39;s always going =
to be a string, and if it isn&#39;t, something else will explode below, sur=
ely, so the assertion is redundant&quot;, but I don&#39;t want code that ma=
kes people wonder, so principle of least surprise it is.<br></div><div clas=
s=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D sp=
ec_path.relative_to(qemu_srctree_path)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._lo=
gger.warning(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;WARNING: &#39;qemu&#39; package will be imported from outside =
&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;the source tree!&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._lo=
gger.warning(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;Importing from: &#39;%s&#39;&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 spec_path.parents[1])<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pythonpath =3D os.getenv(&=
#39;PYTHONPATH&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pythonpath =3D os.pathsep.=
join(filter(None, (<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.source_iotes=
ts,<br>
&gt; &gt; @@ -231,6 +249,7 @@ def __init__(self, imgfmt: str, imgproto: str=
, aiomode: str,<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_root =3D os.path.joi=
n(self.build_iotests, &#39;..&#39;, &#39;..&#39;)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._logger =3D logging.getLogger(&=
#39;qemu.iotests&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.init_directories()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.init_binaries()<br>
&gt; <br>
&gt; Looks good otherwise.<br>
<br>
Well, actually there is a major problem: We&#39;ll pass the right PYTHONPAT=
H<br>
for the test scripts that we&#39;re calling, but this script itself doesn&#=
39;t<br>
use it yet. So what I get is:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/kwolf/source/qemu/tests/qemu-iotests/build/check&qu=
ot;, line 120, in &lt;module&gt;<br>
=C2=A0 =C2=A0 env =3D TestEnv(imgfmt=3Dargs.imgfmt, imgproto=3Dargs.imgprot=
o,<br>
=C2=A0 File &quot;/home/kwolf/source/qemu/tests/qemu-iotests/testenv.py&quo=
t;, line 253, in __init__<br>
=C2=A0 =C2=A0 self.init_directories()<br>
=C2=A0 File &quot;/home/kwolf/source/qemu/tests/qemu-iotests/testenv.py&quo=
t;, line 120, in init_directories<br>
=C2=A0 =C2=A0 qemu_spec =3D importlib.util.find_spec(&#39;qemu.qmp&#39;)<br=
>
=C2=A0 File &quot;/usr/lib64/python3.9/importlib/util.py&quot;, line 94, in=
 find_spec<br>
=C2=A0 =C2=A0 parent =3D __import__(parent_name, fromlist=3D[&#39;__path__&=
#39;])<br>
ModuleNotFoundError: No module named &#39;qemu&#39;<br>
<br>
Kevin<br>
<br></blockquote><div><br></div><div>Tch. So, it turns out with namespace p=
ackages that once you remove the subpackages (pip uninstall qemu), it leave=
s the empty namespace folder behind. This is also the reason I directly use=
 &#39;qemu.qmp&#39; as a bellwether here, to make sure we&#39;re prodding a=
 package and not just an empty namespace with nothing in it.</div><div><br>=
</div><div>I&#39;ll fix these, thanks.<br></div><div> <br></div></div></div=
>

--000000000000db17dd05ccaae1fe--


