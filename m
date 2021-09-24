Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4BD417ABC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:14:59 +0200 (CEST)
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpis-0000wq-Iz
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTpfr-00072l-V9
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTpfZ-0008MH-Ca
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632507092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7evytOLRUeFef4zhBGd9hRFzboU3QCeCKQCheydi3bg=;
 b=OOuo+WUy9sFOL/Cs2d6sIvOjMbBA4JzLD3oveuEteGjdWbr8gCY1YA4fA7hxJ9Q8/z6BAx
 mt7YxlJOVGHSE7B91PTJ6VB5Y7Bs73W1EMd76sol56k449qnCxXiqQhwDay6iSDZLHHKS6
 q8Ayw+yNPwUBxNAi865B1Gk6fm+YqCU=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576--xV7QTBUOYSMGF54hboXfw-1; Fri, 24 Sep 2021 14:11:29 -0400
X-MC-Unique: -xV7QTBUOYSMGF54hboXfw-1
Received: by mail-ot1-f72.google.com with SMTP id
 r14-20020a056830080e00b0053b7b79c0d0so7004374ots.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 11:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7evytOLRUeFef4zhBGd9hRFzboU3QCeCKQCheydi3bg=;
 b=mXQlp2unKKbq3L9HSQOIDSLWNd8xp/vXL7FcNefQGcxZwZnDHWeOpRZFf0jVrjeT3A
 hP5wJ48g6s8VviYKh88zmD8UpHIIVZRQf2ybAvKE0N/ieGRt623HKyT2SJTkgyM9RWpk
 w59guw1XCqvri07F+f09DHijZSt//A4uly/71OnguIV6A7xk3trDSRiO0iy6w8RHVdUk
 5+BKFwVRsvWaPV8N6LS+5GtGpOy6UiTmJG+AJpEHv8ptq/VWyq842AwoniOrWxWYkphx
 2OV+EiJ5EiWoE6F5oUMvCpwB2LOMTaier1u0JgqujoW8h9+wNVriPBHMTTqcIwoA4Z9i
 u8FA==
X-Gm-Message-State: AOAM5337BQtvkh00EVxe4/4ouQ3UrI/S+maFZXKD3k5VlrrbYyKJbPGq
 I30K1lM8wNfHyo1u5dKAiq5C6Ku7GnlV1vNyztNu8m31jiU3DpZu47LwrbMt0nYwY7v666VO0Ud
 fsSow/Qi24plmQWCMXBMKL2j8z2tjrBI=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr5432045ots.252.1632507088538; 
 Fri, 24 Sep 2021 11:11:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQH6K8c6o9iVMIyeAonYWZfUqCt4W5JYzqzJsgcCQhi2/xxP8K3kUvc25JX7Z++Hsx3n01pEeIt/kMcanF+hU=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr5432032ots.252.1632507088335; 
 Fri, 24 Sep 2021 11:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210923180715.4168522-1-jsnow@redhat.com>
 <20210923180715.4168522-3-jsnow@redhat.com>
 <d9c1be2a-e927-49a1-b30e-f99d48946928@virtuozzo.com>
 <CAFn=p-ZVo3Tgm6p3_DNvQa+1uqbfpThTmSkHmSK_A0BkGHNrgg@mail.gmail.com>
 <c17f8ec5-48ba-3ab9-078e-8f62c2dac72d@virtuozzo.com>
In-Reply-To: <c17f8ec5-48ba-3ab9-078e-8f62c2dac72d@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 24 Sep 2021 14:11:17 -0400
Message-ID: <CAFn=p-ZAw=jG8ettoTAi3QXBhVw+41_2GjdP+eLjEQVqaLjqCw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] iotests: add warning for rogue 'qemu' packages
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000018074a05ccc1ad26"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000018074a05ccc1ad26
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 4:27 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 23.09.2021 21:44, John Snow wrote:
> >
> >
> > On Thu, Sep 23, 2021 at 2:32 PM Vladimir Sementsov-Ogievskiy <
> vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> >
> >     23.09.2021 21:07, John Snow wrote:
> >      > Add a warning for when 'iotests' runs against a qemu namespace
> that
> >      > isn't the one in the source tree. This might occur if you have
> >      > (accidentally) installed the Python namespace package to your
> local
> >      > packages.
> >      >
> >      > (I'm not going to say that this is because I bit myself with this,
> >      > but you can fill in the blanks.)
> >      >
> >      > In the future, we will pivot to always preferring a specific
> installed
> >      > instance of qemu python packages managed directly by iotests. For
> now
> >      > simply warn if there is an ambiguity over which instance that
> iotests
> >      > might use.
> >      >
> >      > Example: If a user has navigated to ~/src/qemu/python and executed
> >      > `pip install .`, you will see output like this when running
> `./check`:
> >      >
> >      > WARNING: 'qemu' python packages will be imported from outside the
> source tree ('/home/jsnow/src/qemu/python')
> >      >           Importing instead from
> '/home/jsnow/.local/lib/python3.9/site-packages/qemu'
> >      >
> >      > Signed-off-by: John Snow <jsnow@redhat.com <mailto:
> jsnow@redhat.com>>
> >      > ---
> >      >   tests/qemu-iotests/testenv.py | 24 ++++++++++++++++++++++++
> >      >   1 file changed, 24 insertions(+)
> >      >
> >      > diff --git a/tests/qemu-iotests/testenv.py
> b/tests/qemu-iotests/testenv.py
> >      > index 99a57a69f3a..1c0f6358538 100644
> >      > --- a/tests/qemu-iotests/testenv.py
> >      > +++ b/tests/qemu-iotests/testenv.py
> >      > @@ -16,6 +16,8 @@
> >      >   # along with this program.  If not, see <
> http://www.gnu.org/licenses/ <http://www.gnu.org/licenses/>>.
> >      >   #
> >      >
> >      > +import importlib.util
> >      > +import logging
> >      >   import os
> >      >   import sys
> >      >   import tempfile
> >      > @@ -112,6 +114,27 @@ def init_directories(self) -> None:
> >      >           # Path where qemu goodies live in this source tree.
> >      >           qemu_srctree_path = Path(__file__,
> '../../../python').resolve()
> >      >
> >      > +        # Warn if we happen to be able to find qemu namespace
> packages
> >      > +        # (using qemu.qmp as a bellwether) from an unexpected
> location.
> >      > +        # i.e. the package is already installed in the user's
> environment.
> >      > +        try:
> >      > +            qemu_spec = importlib.util.find_spec('qemu.qmp')
> >      > +        except ModuleNotFoundError:
> >      > +            qemu_spec = None
> >      > +
> >      > +        if qemu_spec and qemu_spec.origin:
> >      > +            spec_path = Path(qemu_spec.origin)
> >      > +            try:
> >      > +                _ = spec_path.relative_to(qemu_srctree_path)
> >
> >     It took some time and looking at specification trying to understand
> what's going on here :)
> >
> >     Could we just use:
> >
> >     if not Path(qemu_spec.origin).is_relative_to(qemu_srctree_path):
> >          ... logging ...
> >
> >
> > Nope, that's 3.9+ only. (I made the same mistake.)
>
> Oh :(
>
> OK
>
> >
> >
> >      > +            except ValueError:
> >
> >      > +                self._logger.warning(
> >      > +                    "WARNING: 'qemu' python packages will be
> imported from"
> >      > +                    " outside the source tree ('%s')",
> >      > +                    qemu_srctree_path)
>
> why not use f-strings ? :)
>
>
The logging subsystem still uses % formatting by default, you can see I'm
not actually using the % operator to apply the values -- the Python docs
claim this is for "efficiency" because the string doesn't have to be
evaluated unless the logging statement is actually emitted, but that gain
sounds mostly theoretical to me, because Python still has eager evaluation
of passed arguments ... unless I've missed something.

Either way, using f-strings on logging calls gives you a pylint warning
that I'd just have to then disable, so I just skip the hassle.

Now, the logging system *does* allow you to use new-style python strings [
https://docs.python.org/3/howto/logging-cookbook.html#formatting-styles ]
but given that the default is still %-style and virtually every library
uses that style, I thought it might cause more problems than it creates by
trying to use a different style for just one portion of the codebase. Mind
you, I've never even bothered to try, so my apprehensions might not be
strictly factual ;)


> >      > +                self._logger.warning(
> >      > +                    "         Importing instead from '%s'",
> >      > +                    spec_path.parents[1])
> >      > +
> >
> >     Also, I'd move this new chunk of code to a separate function (may be
> even out of class, as the only usage of self is self._logger, which you
> introduce with this patch. Still a method would be OK too). And then, just
> call it from __init__(). Just to keep init_directories() simpler. And with
> this new code we don't init any directories to pass to further test
> execution, it's just a check for runtime environment.
> >
> >
> > I wanted to keep the wiggly python import logic all in one place so that
> it was harder to accidentally forget a piece of it if/when we adjust it.
>
> Hmm right.. I didn't look from that point of view.
>
> So, we actually check the library we are using now is the same which we
> pass to called tests.
>
> So, it's a right place for it. And it's about the fact that we are still
> hacking around importing libraries :) Hope for bright future.
>
> > I can create a standalone function for it, but I'd need to stash that
> qemu_srctree_path variable somewhere if we want to call that runtime check
> from somewhere else, because I don't want to compute it twice. Is it still
> worth doing in your opinion if I just create a method/function and pass it
> the qemu_srctree_path variable straight from init_directories()?
>
> My first impression was that init_directories() is not a right place. But
> now I see that we want to check exactly this qemu_srctree_path, which we
> are going to pass to tests.
>
> So, I'm OK as is.
>
> Still, may be adding helper function like
>
> def warn_if_module_loads_not_from(module_name, path):
>
> worth doing.. I'm not sure, up to you.
>
>
It's your code, I'd much rather defer to your judgment in terms of
organization. I will make the change.


>
> Another question comes to my mind:
>
> You say "'qemu' python packages will be imported from". But are you sure?
> We pass correct PYTHONPATH, where qemu_srctree_path goes first, doesn't it
> guarantee that qemu package will be loaded from it?
>
> I now read in spec about PYTHONPATH:
>
>    The default search path is installation dependent, but generally begins
> with prefix/lib/pythonversion (see PYTHONHOME above). It is always appended
> to PYTHONPATH.
>
>
> So, if do warn something, it seems correct to say that "System version of
> qemu is {spec_path.parents[1]}, but sorry, we prefer our own (and better)
> version at {qemu_srctree_path}".
>
> Or what I miss? In commit message it's not clean did you really see such
> problem or not :)
>
>
Hm, you didn't miss anything! I wrote this patch before the prior patch,
and I didn't realize that PYTHONPATH supersedes the default sys.path
internals. I thought it *appended* them. So uh. actually! with the previous
change ... this patch isn't really needed at all ... ! We can just drop it
entirely.


> >
> > Not adding _logger is valid, though. I almost removed it myself. I'll
> squash that in.
> >
> >      >           self.pythonpath = os.pathsep.join(filter(None, (
> >      >               self.source_iotests,
> >      >               str(qemu_srctree_path),
> >      > @@ -230,6 +253,7 @@ def __init__(self, imgfmt: str, imgproto:
> str, aiomode: str,
> >      >
> >      >           self.build_root = os.path.join(self.build_iotests,
> '..', '..')
> >      >
> >      > +        self._logger = logging.getLogger('qemu.iotests')
> >      >           self.init_directories()
> >      >           self.init_binaries()
> >      >
> >      >
> >
> >
> >     --
> >     Best regards,
> >     Vladimir
> >
>
>
> --
> Best regards,
> Vladimir
>
>

--00000000000018074a05ccc1ad26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 4:27 PM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">23.09.2021 21:44, John Snow wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Sep 23, 2021 at 2:32 PM Vladimir Sementsov-Ogievskiy &lt;<a hr=
ef=3D"mailto:vsementsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuoz=
zo.com</a> &lt;mailto:<a href=3D"mailto:vsementsov@virtuozzo.com" target=3D=
"_blank">vsementsov@virtuozzo.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A023.09.2021 21:07, John Snow wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Add a warning for when &#39;iotests&#39; runs=
 against a qemu namespace that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; isn&#39;t the one in the source tree. This mi=
ght occur if you have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (accidentally) installed the Python namespace=
 package to your local<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; packages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (I&#39;m not going to say that this is becaus=
e I bit myself with this,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; but you can fill in the blanks.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; In the future, we will pivot to always prefer=
ring a specific installed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; instance of qemu python packages managed dire=
ctly by iotests. For now<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; simply warn if there is an ambiguity over whi=
ch instance that iotests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; might use.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Example: If a user has navigated to ~/src/qem=
u/python and executed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; `pip install .`, you will see output like thi=
s when running `./check`:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; WARNING: &#39;qemu&#39; python packages will =
be imported from outside the source tree (&#39;/home/jsnow/src/qemu/python&=
#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Impor=
ting instead from &#39;/home/jsnow/.local/lib/python3.9/site-packages/qemu&=
#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: John Snow &lt;<a href=3D"mailt=
o:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a> &lt;mailto:<a hr=
ef=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt;&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0tests/qemu-iotests/testenv.py | 2=
4 ++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 24 insertions(+)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/tests/qemu-iotests/testenv.py b/=
tests/qemu-iotests/testenv.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 99a57a69f3a..1c0f6358538 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -16,6 +16,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0# along with this program.=C2=A0 =
If not, see &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer"=
 target=3D"_blank">http://www.gnu.org/licenses/</a> &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +import importlib.util<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +import logging<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0import os<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0import sys<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0import tempfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -112,6 +114,27 @@ def init_directories(sel=
f) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Pat=
h where qemu goodies live in this source tree.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_=
srctree_path =3D Path(__file__, &#39;../../../python&#39;).resolve()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Warn if we hap=
pen to be able to find qemu namespace packages<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (using qemu.qm=
p as a bellwether) from an unexpected location.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # i.e. the packa=
ge is already installed in the user&#39;s environment.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qe=
mu_spec =3D importlib.util.find_spec(&#39;qemu.qmp&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ModuleNot=
FoundError:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qe=
mu_spec =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if qemu_spec and=
 qemu_spec.origin:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp=
ec_path =3D Path(qemu_spec.origin)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tr=
y:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _ =3D spec_path.relative_to(qemu_srctree_path)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It took some time and looking at specification tryi=
ng to understand what&#39;s going on here :)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Could we just use:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0if not Path(qemu_spec.origin).is_relative_to(qemu_s=
rctree_path):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ... logging ...<br>
&gt; <br>
&gt; <br>
&gt; Nope, that&#39;s 3.9+ only. (I made the same mistake.)<br>
<br>
Oh :(<br>
<br>
OK<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ex=
cept ValueError:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self._logger.warning(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;WARNING: &#39;qemu&#39; python packages w=
ill be imported from&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; outside the source tree (&#39;%s&#39;)&q=
uot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_srctree_path)<br>
<br>
why not use f-strings ? :)<br>
<br></blockquote><div><br></div><div>The logging subsystem still uses % for=
matting by default, you can see I&#39;m not actually using the % operator t=
o apply the values -- the Python docs claim this is for &quot;efficiency&qu=
ot; because the string doesn&#39;t have to be evaluated unless the logging =
statement is actually emitted, but that gain sounds mostly theoretical to m=
e, because Python still has eager evaluation of passed arguments ... unless=
 I&#39;ve missed something.</div><div><br></div><div>Either way, using f-st=
rings on logging calls gives you a pylint warning that I&#39;d just have to=
 then disable, so I just skip the hassle.</div><div><br></div><div>Now, the=
 logging system *does* allow you to use new-style python strings [ <a href=
=3D"https://docs.python.org/3/howto/logging-cookbook.html#formatting-styles=
">https://docs.python.org/3/howto/logging-cookbook.html#formatting-styles</=
a> ] but given that the default is still %-style and virtually every librar=
y uses that style, I thought it might cause more problems than it creates b=
y trying to use a different style for just one portion of the codebase. Min=
d you, I&#39;ve never even bothered to try, so my apprehensions might not b=
e strictly factual ;)<br></div><div></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self._logger.warning(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Importi=
ng instead from &#39;%s&#39;&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_path.parents[1])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, I&#39;d move this new chunk of code to a sepa=
rate function (may be even out of class, as the only usage of self is self.=
_logger, which you introduce with this patch. Still a method would be OK to=
o). And then, just call it from __init__(). Just to keep init_directories()=
 simpler. And with this new code we don&#39;t init any directories to pass =
to further test execution, it&#39;s just a check for runtime environment.<b=
r>
&gt; <br>
&gt; <br>
&gt; I wanted to keep the wiggly python import logic all in one place so th=
at it was harder to accidentally forget a piece of it if/when we adjust it.=
<br>
<br>
Hmm right.. I didn&#39;t look from that point of view.<br>
<br>
So, we actually check the library we are using now is the same which we pas=
s to called tests.<br>
<br>
So, it&#39;s a right place for it. And it&#39;s about the fact that we are =
still hacking around importing libraries :) Hope for bright future.<br>
<br>
&gt; I can create a standalone function for it, but I&#39;d need to stash t=
hat qemu_srctree_path variable somewhere if we want to call that runtime ch=
eck from somewhere else, because I don&#39;t want to compute it twice. Is i=
t still worth doing in your opinion if I just create a method/function and =
pass it the qemu_srctree_path variable straight from init_directories()?<br=
>
<br>
My first impression was that init_directories() is not a right place. But n=
ow I see that we want to check exactly this qemu_srctree_path, which we are=
 going to pass to tests.<br>
<br>
So, I&#39;m OK as is.<br>
<br>
Still, may be adding helper function like<br>
<br>
def warn_if_module_loads_not_from(module_name, path):<br>
<br>
worth doing.. I&#39;m not sure, up to you.<br>
<br></blockquote><div><br></div><div>It&#39;s your code, I&#39;d much rathe=
r defer to your judgment in terms of organization. I will make the change.<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
Another question comes to my mind:<br>
<br>
You say &quot;&#39;qemu&#39; python packages will be imported from&quot;. B=
ut are you sure? We pass correct PYTHONPATH, where qemu_srctree_path goes f=
irst, doesn&#39;t it guarantee that qemu package will be loaded from it?<br=
>
<br>
I now read in spec about PYTHONPATH:<br>
<br>
=C2=A0 =C2=A0The default search path is installation dependent, but general=
ly begins with prefix/lib/pythonversion (see PYTHONHOME above). It is alway=
s appended to PYTHONPATH.<br>
<br>
<br>
So, if do warn something, it seems correct to say that &quot;System version=
 of qemu is {spec_path.parents[1]}, but sorry, we prefer our own (and bette=
r) version at {qemu_srctree_path}&quot;.<br>
<br>
Or what I miss? In commit message it&#39;s not clean did you really see suc=
h problem or not :)<br>
<br></blockquote><div><br></div><div>Hm, you didn&#39;t miss anything! I wr=
ote this patch before the prior patch, and I didn&#39;t realize that PYTHON=
PATH supersedes the default sys.path internals. I thought it *appended* the=
m. So uh. actually! with the previous change ... this patch isn&#39;t reall=
y needed at all ... ! We can just drop it entirely.<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Not adding _logger is valid, though. I almost removed it myself. I&#39=
;ll squash that in.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.=
pythonpath =3D os.pathsep.join(filter(None, (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0self.source_iotests,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0str(qemu_srctree_path),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -230,6 +253,7 @@ def __init__(self, imgfmt=
: str, imgproto: str, aiomode: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.=
build_root =3D os.path.join(self.build_iotests, &#39;..&#39;, &#39;..&#39;)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._logger =3D=
 logging.getLogger(&#39;qemu.iotests&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.=
init_directories()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.=
init_binaries()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Vladimir<br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--00000000000018074a05ccc1ad26--


