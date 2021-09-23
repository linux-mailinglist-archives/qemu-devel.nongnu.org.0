Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37141655A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:47:27 +0200 (CEST)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTkk-0004JL-HA
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTi2-0002pj-WF
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTi0-0001n7-46
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632422675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nPSYX2aSbOt9zSxfdEbLAQMI1rF+0TBclwgJ864EeZs=;
 b=W5nUmW1S5GNj6VIfXl90ACFuDjUSG7zForkt2QAZSW0b8CW/orPSU40IyyMO2Ep3mgSS/z
 o7Gt9JuM0ulRxAl0+cSdWX3S2Q7t4OI/0t1P5kachPgJYYk2Le3SrnvxVDKQclFw4IdNkq
 CWPTRQh1TzI2nWXskgBeHBnPYH49rJ0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-qH5jj4UnPruBXtK9fFevEg-1; Thu, 23 Sep 2021 14:44:33 -0400
X-MC-Unique: qH5jj4UnPruBXtK9fFevEg-1
Received: by mail-oi1-f200.google.com with SMTP id
 u142-20020acaab94000000b00275c1cf21e7so3188197oie.12
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 11:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nPSYX2aSbOt9zSxfdEbLAQMI1rF+0TBclwgJ864EeZs=;
 b=lOVtxkFW+qIq0V7SBAosMvyo8uff4Uad8evUgIXujcyKHMDPQ5OjrKTaB9T14e9mzA
 bmc/arBvdfva2RL4APQ4mOpKvG91MjBYSgiKmL1A0Aca/IyZuJKtG0NG2iw9Vi8m9yN8
 8fscdNshJcx7jJyv7+JJvaUkBwo9+fuIk9hksBwq1Qe80sRQbpvxn+zn7fyEeyzo6hHL
 G+EyDn3GI9RGbPB5gE1eoqUTEr74lCOHGlooDkc0b666jAQ82eHgt9Yjr2WjCfmImOtW
 2xG5+E1kG99AjQCMWrr8Jt6laAMrMqfvdOcHWFdBD2LgFY9eSG5TZg41eknP8sqqtt8K
 rAVw==
X-Gm-Message-State: AOAM531ZM+Yv47prUauID1+I6njZU7+rDAoV00HARW2IDTvyIDOnq2Oz
 IaqQ/hdp01AKuRLaobcuPPPMNQnohbVUFZVW0ClEMGGzEbnyXac1xkjQx1UKOyPEobNQzWW38Jb
 LihSq4kIscVfu+Lo9ygRG/GEwjuhlFIo=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr165956otj.129.1632422672793;
 Thu, 23 Sep 2021 11:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9eRFKQWSPssETFmodssEoOH22wG4K5BS/rYZcQ+oCPWKj79nlwDjiD1tOy426L1nZB9tdQKm6wwpdMV5kaYU=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr165939otj.129.1632422672561;
 Thu, 23 Sep 2021 11:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210923180715.4168522-1-jsnow@redhat.com>
 <20210923180715.4168522-3-jsnow@redhat.com>
 <d9c1be2a-e927-49a1-b30e-f99d48946928@virtuozzo.com>
In-Reply-To: <d9c1be2a-e927-49a1-b30e-f99d48946928@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 23 Sep 2021 14:44:21 -0400
Message-ID: <CAFn=p-ZVo3Tgm6p3_DNvQa+1uqbfpThTmSkHmSK_A0BkGHNrgg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] iotests: add warning for rogue 'qemu' packages
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008590ad05ccae054d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008590ad05ccae054d
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:32 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 23.09.2021 21:07, John Snow wrote:
> > Add a warning for when 'iotests' runs against a qemu namespace that
> > isn't the one in the source tree. This might occur if you have
> > (accidentally) installed the Python namespace package to your local
> > packages.
> >
> > (I'm not going to say that this is because I bit myself with this,
> > but you can fill in the blanks.)
> >
> > In the future, we will pivot to always preferring a specific installed
> > instance of qemu python packages managed directly by iotests. For now
> > simply warn if there is an ambiguity over which instance that iotests
> > might use.
> >
> > Example: If a user has navigated to ~/src/qemu/python and executed
> > `pip install .`, you will see output like this when running `./check`:
> >
> > WARNING: 'qemu' python packages will be imported from outside the source
> tree ('/home/jsnow/src/qemu/python')
> >           Importing instead from
> '/home/jsnow/.local/lib/python3.9/site-packages/qemu'
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/testenv.py | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/tests/qemu-iotests/testenv.py
> b/tests/qemu-iotests/testenv.py
> > index 99a57a69f3a..1c0f6358538 100644
> > --- a/tests/qemu-iotests/testenv.py
> > +++ b/tests/qemu-iotests/testenv.py
> > @@ -16,6 +16,8 @@
> >   # along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> >   #
> >
> > +import importlib.util
> > +import logging
> >   import os
> >   import sys
> >   import tempfile
> > @@ -112,6 +114,27 @@ def init_directories(self) -> None:
> >           # Path where qemu goodies live in this source tree.
> >           qemu_srctree_path = Path(__file__, '../../../python').resolve()
> >
> > +        # Warn if we happen to be able to find qemu namespace packages
> > +        # (using qemu.qmp as a bellwether) from an unexpected location.
> > +        # i.e. the package is already installed in the user's
> environment.
> > +        try:
> > +            qemu_spec = importlib.util.find_spec('qemu.qmp')
> > +        except ModuleNotFoundError:
> > +            qemu_spec = None
> > +
> > +        if qemu_spec and qemu_spec.origin:
> > +            spec_path = Path(qemu_spec.origin)
> > +            try:
> > +                _ = spec_path.relative_to(qemu_srctree_path)
>
> It took some time and looking at specification trying to understand what's
> going on here :)
>
> Could we just use:
>
> if not Path(qemu_spec.origin).is_relative_to(qemu_srctree_path):
>     ... logging ...
>
>
Nope, that's 3.9+ only. (I made the same mistake.)


> > +            except ValueError:
>
> +                self._logger.warning(
> > +                    "WARNING: 'qemu' python packages will be imported
> from"
> > +                    " outside the source tree ('%s')",
> > +                    qemu_srctree_path)
> > +                self._logger.warning(
> > +                    "         Importing instead from '%s'",
> > +                    spec_path.parents[1])
> > +
>
> Also, I'd move this new chunk of code to a separate function (may be even
> out of class, as the only usage of self is self._logger, which you
> introduce with this patch. Still a method would be OK too). And then, just
> call it from __init__(). Just to keep init_directories() simpler. And with
> this new code we don't init any directories to pass to further test
> execution, it's just a check for runtime environment.
>
>
I wanted to keep the wiggly python import logic all in one place so that it
was harder to accidentally forget a piece of it if/when we adjust it. I can
create a standalone function for it, but I'd need to stash that
qemu_srctree_path variable somewhere if we want to call that runtime check
from somewhere else, because I don't want to compute it twice. Is it still
worth doing in your opinion if I just create a method/function and pass it
the qemu_srctree_path variable straight from init_directories()?

Not adding _logger is valid, though. I almost removed it myself. I'll
squash that in.


> >           self.pythonpath = os.pathsep.join(filter(None, (
> >               self.source_iotests,
> >               str(qemu_srctree_path),
> > @@ -230,6 +253,7 @@ def __init__(self, imgfmt: str, imgproto: str,
> aiomode: str,
> >
> >           self.build_root = os.path.join(self.build_iotests, '..', '..')
> >
> > +        self._logger = logging.getLogger('qemu.iotests')
> >           self.init_directories()
> >           self.init_binaries()
> >
> >
>
>
> --
> Best regards,
> Vladimir
>
>

--0000000000008590ad05ccae054d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 2:32 PM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">23.09.2021 21:07, John Snow wrote:<br>
&gt; Add a warning for when &#39;iotests&#39; runs against a qemu namespace=
 that<br>
&gt; isn&#39;t the one in the source tree. This might occur if you have<br>
&gt; (accidentally) installed the Python namespace package to your local<br=
>
&gt; packages.<br>
&gt; <br>
&gt; (I&#39;m not going to say that this is because I bit myself with this,=
<br>
&gt; but you can fill in the blanks.)<br>
&gt; <br>
&gt; In the future, we will pivot to always preferring a specific installed=
<br>
&gt; instance of qemu python packages managed directly by iotests. For now<=
br>
&gt; simply warn if there is an ambiguity over which instance that iotests<=
br>
&gt; might use.<br>
&gt; <br>
&gt; Example: If a user has navigated to ~/src/qemu/python and executed<br>
&gt; `pip install .`, you will see output like this when running `./check`:=
<br>
&gt; <br>
&gt; WARNING: &#39;qemu&#39; python packages will be imported from outside =
the source tree (&#39;/home/jsnow/src/qemu/python&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Importing instead from &#39;/h=
ome/jsnow/.local/lib/python3.9/site-packages/qemu&#39;<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/testenv.py | 24 +++++++++++++++++++++++=
+<br>
&gt;=C2=A0 =C2=A01 file changed, 24 insertions(+)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testen=
v.py<br>
&gt; index 99a57a69f3a..1c0f6358538 100644<br>
&gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt; @@ -16,6 +16,8 @@<br>
&gt;=C2=A0 =C2=A0# along with this program.=C2=A0 If not, see &lt;<a href=
=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http=
://www.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +import importlib.util<br>
&gt; +import logging<br>
&gt;=C2=A0 =C2=A0import os<br>
&gt;=C2=A0 =C2=A0import sys<br>
&gt;=C2=A0 =C2=A0import tempfile<br>
&gt; @@ -112,6 +114,27 @@ def init_directories(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Path where qemu goodies live=
 in this source tree.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_srctree_path =3D Path(__f=
ile__, &#39;../../../python&#39;).resolve()<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Warn if we happen to be able to find qe=
mu namespace packages<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (using qemu.qmp as a bellwether) from a=
n unexpected location.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # i.e. the package is already installed i=
n the user&#39;s environment.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spec =3D importlib.uti=
l.find_spec(&#39;qemu.qmp&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ModuleNotFoundError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spec =3D None<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if qemu_spec and qemu_spec.origin:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_path =3D Path(qemu_spe=
c.origin)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D spec_pa=
th.relative_to(qemu_srctree_path)<br>
<br>
It took some time and looking at specification trying to understand what&#3=
9;s going on here :)<br>
<br>
Could we just use:<br>
<br>
if not Path(qemu_spec.origin).is_relative_to(qemu_srctree_path):<br>
=C2=A0 =C2=A0 ... logging ...<br>
<br></blockquote><div><br></div><div>Nope, that&#39;s 3.9+ only. (I made th=
e same mistake.)<br></div><div> <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br></blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._logger.=
warning(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;WARNING: &#39;qemu&#39; python packages will be imported from&quot;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot; outside the source tree (&#39;%s&#39;)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 qemu_srctree_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._logger.=
warning(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Importing instead from &#39;%s&#39=
;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 spec_path.parents[1])<br>
&gt; +<br>
<br>
Also, I&#39;d move this new chunk of code to a separate function (may be ev=
en out of class, as the only usage of self is self._logger, which you intro=
duce with this patch. Still a method would be OK too). And then, just call =
it from __init__(). Just to keep init_directories() simpler. And with this =
new code we don&#39;t init any directories to pass to further test executio=
n, it&#39;s just a check for runtime environment.<br>
<br></blockquote><div><br></div><div>I wanted to keep the wiggly python imp=
ort logic all in one place so that it was harder to accidentally forget a p=
iece of it if/when we adjust it. I can create a standalone function for it,=
 but I&#39;d need to stash that qemu_srctree_path variable somewhere if we =
want to call that runtime check from somewhere else, because I don&#39;t wa=
nt to compute it twice. Is it still worth doing in your opinion if I just c=
reate a method/function and pass it the qemu_srctree_path variable straight=
 from init_directories()?<br></div><div><br></div><div>Not adding _logger i=
s valid, though. I almost removed it myself. I&#39;ll squash that in.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pythonpath =3D os.pathsep=
.join(filter(None, (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.source_iote=
sts,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str(qemu_srctree=
_path),<br>
&gt; @@ -230,6 +253,7 @@ def __init__(self, imgfmt: str, imgproto: str, aio=
mode: str,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.build_root =3D os.path.jo=
in(self.build_iotests, &#39;..&#39;, &#39;..&#39;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._logger =3D logging.getLogger(&#39;q=
emu.iotests&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.init_directories()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.init_binaries()<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--0000000000008590ad05ccae054d--


