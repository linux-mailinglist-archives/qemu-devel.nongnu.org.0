Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655664E65CD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 16:06:26 +0100 (CET)
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXP2e-0000jM-U9
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 11:06:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXOzs-0007vG-QO
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXOzo-0007GE-6J
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648134207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bvtT/klrffZe43nWtLccae0HuQrptbzoD/hJ19wCkw=;
 b=POuybPH19G1Hkvc9cxI9DarTAQoEJHFcCjjK2+a250uAoYazDYN8PUtt/rHW08dZODC925
 4EM/JfGnrjv3A4xU+HFIEOv+h3jlaavf/ORM3azSboQrdYtvO90WbytihQhHF6o/4pRDXT
 aGgkoQCp4VuM+bEqqxDM1r/IpcOHa7g=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511--PYVKrdaMiGcNB32NXfypw-1; Thu, 24 Mar 2022 11:03:22 -0400
X-MC-Unique: -PYVKrdaMiGcNB32NXfypw-1
Received: by mail-vk1-f199.google.com with SMTP id
 x6-20020a056122050600b0033f544d4be1so958531vko.1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 08:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1bvtT/klrffZe43nWtLccae0HuQrptbzoD/hJ19wCkw=;
 b=LdoJMgDDTGwl5uNAe5nYJlvQEyiH7rGkSXl/WxCiAGWslaNu2wPLXfDbR3OD2AUOfV
 fNRW6f2DObT8s30TxvxLAtytYN9i6E6xH2cymAgl+C0hM5k2x4FRVdJhdGAmivGngBGn
 bUG25qw3uFQvM1pswFpqaV8WazjAJXhg1+hhNO5AO1fZhWWSPB4PtTh+pshB6RipTpSv
 qmY098Z1banihGN441ZllzjZ6VQ60i0L4yCSa9unE6RR9zl3IaNfwaXUPfXUV/vxJLuz
 a2cACBPzJwqEM02sGiUpNl0VWPedDfgzcyS/Mdij29iRhaXASZIaeok9uY6lGOYv7F7a
 fUig==
X-Gm-Message-State: AOAM5338h5N4sMQC7TENIgRhwRLFW6uypBFVXu3l9eECiiTKYWd5f9Ka
 VVYYVG0/EIGORS/h0PE/V3y3CGw4Mocdoc7TVyHCPTBNtV6mJZigDtIhy6xRpCnqCYgvt6uyPYp
 S2GvyIgTvVX8DbHx7Hwr1cc53PNpwfvo=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr2812651vst.11.1648134201558; 
 Thu, 24 Mar 2022 08:03:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnFAWCEnc0LxQFoldv335OJTOMszQLxw+NoGvDIWoewpbpvZTUS5w3U/Cm8YjNHnjmMijA9zGV9Lj0hr5ScvI=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr2812610vst.11.1648134201330; Thu, 24
 Mar 2022 08:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com> <Yjwzy97JAHKhvCHn@redhat.com>
In-Reply-To: <Yjwzy97JAHKhvCHn@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 11:03:12 -0400
Message-ID: <CAFn=p-Zj24yJYvPTpnXLA3wG-Fm8okVTXM-QG0rSAjp3AJuCvQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009ce1a305daf8256d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009ce1a305daf8256d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022, 5:03 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Thu, Mar 24, 2022 at 09:00:05AM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Mar 23, 2022 at 05:47:48PM -0400, John Snow wrote:
> > > On Mon, Mar 21, 2022 at 5:08 PM John Snow <jsnow@redhat.com> wrote:
> > > >
> > > > The legacy.py module is heavily based on the QMP module by Luiz
> > > > Capitulino (et al) which is licensed as explicit GPLv2-only. The
> async
> > > > QMP package is currently licensed similarly, but I intend to
> relicense
> > > > the async package to the more flexible GPLv2+.
> > > >
> > > > In preparation for that change, make the license on legacy.py
> explicit.
> > > >
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >  python/qemu/aqmp/legacy.py | 11 +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > >
> > > > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.p=
y
> > > > index 46026e9fdc..f86cb29804 100644
> > > > --- a/python/qemu/aqmp/legacy.py
> > > > +++ b/python/qemu/aqmp/legacy.py
> > > > @@ -4,6 +4,17 @@
> > > >  This class pretends to be qemu.qmp.QEMUMonitorProtocol.
> > > >  """
> > > >
> > > > +#
> > > > +# Copyright (C) 2009-2022 Red Hat Inc.
> > > > +#
> > > > +# Authors:
> > > > +#  Luiz Capitulino <lcapitulino@redhat.com>
> > > > +#  John Snow <jsnow@redhat.com>
> > > > +#
> > > > +# This work is licensed under the terms of the GNU GPL, version 2.
> See
> > > > +# the COPYING file in the top-level directory.
> > > > +#
> > > > +
> > > >  import asyncio
> > > >  from typing import (
> > > >      Any,
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > Anyone have any strong feelings on me doing this? CC'ing people with
> > > known strong feelings on licenses.
> > >
> > > I'm:
> > >
> > > (1) Re-affirming that the legacy interface for async QMP is GPLv2
> > > (like the classic QMP library is), because the interface and
> > > docstrings here are largely copy-pasted from that library. It's
> > > heavily remixed and modified, but it is undeniably derivative. (This
> > > patch)
> >
> > If this is going to live for any length of time it is desirable to
> > relience the legacy code to GPLv2+ too.
>

I do intend to drop legacy.py, replacing it with a sync.py module that's
similar, but provides an API that resembles the async API more closely.

I have patches, so it shouldn't be *too* far out, but I wanted to fork the
repo first, since it's kind of involved and fiddly.

It's genuinely a question of "What can I achieve faster?"

It's unclear, but before I fork the async code out into its own repository,
I wanted a better license on it while I'm still the sole author. So I
figured "Mostly new license, tiny bits of old" would be the best, quickest
way to prevent a backslide.

>
> > I've not fully audited the git history, but what little I've looked
> > at, the relicensing doesn't look too hard. The overwhealming majority
> > of code was by @redhat.com authors, so we can cope with that fairly
> > easily. There are a handful of other contributors still around in
> > QEMU, and some of the patches are so trivial you couldn't claim
> > copyright on them ie where adding 1 parameter to a method call is
> > literally the only possible way you could implmenent the change.
> > It is never fun to contact everyone, but it looks viable.
> >
> > > (2) Re-licensing async QMP as GPLv2+. (Next patch)
> > >
> > > (3) Someday, eventually, adding a different sync interface that
> > > doesn't re-mix this specific compatibility interface and will provide
> > > better event-waiting primitives and so on. legacy.py will get dropped
> > > at that point and the sub-project will become wholly GPLv2+. Until
> > > then, it will be mixed.
> >
> > Overall making it *all* GPLv2+ compat is going to be important if you
> > want people to be comfortable using it. If it has a mix of GPLv2+
> > and GPLv2-only code in the source tarball, then the overall combined
> > work will have to be considered GPLv2-only and that will put people
> > off using it. Even if they could theoreticallly restrict their usage
> > to only the GPLv2+ parts, many won't get that far before moving on.
>

I agree. Just a matter of which intermediate states we'll see enroute.


> Actually I'll go furthuer and suggest that if we're going to do a
> relicensing at all, and your goal is to encourage usage, then GPLv2+
> is the wrong choice. Use LGPLv2+ if you want to facilitate usage, while
> retaining a copyleft license.
>

Same question as Andrea. Does the linking exception matter for Python? (The
lawyer seemed to intuit to me that it was somewhat untested. I don't think
the answer was clear.)

I have no opposition towards LGPL whatsoever, so I guess if it doesn't hurt
anything I can just do that instead.

(The lawyer did suggest that MIT was likely the absolute most compatible
license I could choose here; but I'm unsure I want to open the floodgates
that wide without strong reason. MIT feels like an off-ramp out of open
source, and I like to avoid it when possible. That said, the point of this
package is to get people to use QEMU and drive them towards our GPL project
and ecosystem, so... Maybe MIT would be reasonable. Still, if this
component grows in complexity and becomes integrated into a commercial
product, I'd be *pretty upset* if any improvements were not published for
everyone to benefit from. I think that's why I lean GPL, even though I want
to maximize use.)


> With regards,
> Daniel
> --


Thanks,
--js

--0000000000009ce1a305daf8256d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 24, 2022, 5:03 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, Mar 24, 2022 at 09:00:05=
AM +0000, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; On Wed, Mar 23, 2022 at 05:47:48PM -0400, John Snow wrote:<br>
&gt; &gt; On Mon, Mar 21, 2022 at 5:08 PM John Snow &lt;<a href=3D"mailto:j=
snow@redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&=
gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The legacy.py module is heavily based on the QMP module by L=
uiz<br>
&gt; &gt; &gt; Capitulino (et al) which is licensed as explicit GPLv2-only.=
 The async<br>
&gt; &gt; &gt; QMP package is currently licensed similarly, but I intend to=
 relicense<br>
&gt; &gt; &gt; the async package to the more flexible GPLv2+.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In preparation for that change, make the license on legacy.p=
y explicit.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 python/qemu/aqmp/legacy.py | 11 +++++++++++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/l=
egacy.py<br>
&gt; &gt; &gt; index 46026e9fdc..f86cb29804 100644<br>
&gt; &gt; &gt; --- a/python/qemu/aqmp/legacy.py<br>
&gt; &gt; &gt; +++ b/python/qemu/aqmp/legacy.py<br>
&gt; &gt; &gt; @@ -4,6 +4,17 @@<br>
&gt; &gt; &gt;=C2=A0 This class pretends to be qemu.qmp.QEMUMonitorProtocol=
.<br>
&gt; &gt; &gt;=C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# Copyright (C) 2009-2022 Red Hat Inc.<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# Authors:<br>
&gt; &gt; &gt; +#=C2=A0 Luiz Capitulino &lt;<a href=3D"mailto:lcapitulino@r=
edhat.com" target=3D"_blank" rel=3D"noreferrer">lcapitulino@redhat.com</a>&=
gt;<br>
&gt; &gt; &gt; +#=C2=A0 John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" t=
arget=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# This work is licensed under the terms of the GNU GPL, ver=
sion 2.=C2=A0 See<br>
&gt; &gt; &gt; +# the COPYING file in the top-level directory.<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 import asyncio<br>
&gt; &gt; &gt;=C2=A0 from typing import (<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 Any,<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.34.1<br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt; Anyone have any strong feelings on me doing this? CC&#39;ing peop=
le with<br>
&gt; &gt; known strong feelings on licenses.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m:<br>
&gt; &gt; <br>
&gt; &gt; (1) Re-affirming that the legacy interface for async QMP is GPLv2=
<br>
&gt; &gt; (like the classic QMP library is), because the interface and<br>
&gt; &gt; docstrings here are largely copy-pasted from that library. It&#39=
;s<br>
&gt; &gt; heavily remixed and modified, but it is undeniably derivative. (T=
his<br>
&gt; &gt; patch)<br>
&gt; <br>
&gt; If this is going to live for any length of time it is desirable to<br>
&gt; relience the legacy code to GPLv2+ too.<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I do intend to drop legacy.py, =
replacing it with a sync.py module that&#39;s similar, but provides an API =
that resembles the async API more closely.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">I have patches, so it shouldn&#39;t be *too* far out, bu=
t I wanted to fork the repo first, since it&#39;s kind of involved and fidd=
ly.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s genui=
nely a question of &quot;What can I achieve faster?&quot;</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">It&#39;s unclear, but before I fork the a=
sync code out into its own repository, I wanted a better license on it whil=
e I&#39;m still the sole author. So I figured &quot;Mostly new license, tin=
y bits of old&quot; would be the best, quickest way to prevent a backslide.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
&gt; <br>
&gt; I&#39;ve not fully audited the git history, but what little I&#39;ve l=
ooked<br>
&gt; at, the relicensing doesn&#39;t look too hard. The overwhealming major=
ity<br>
&gt; of code was by @<a href=3D"http://redhat.com" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">redhat.com</a> authors, so we can cope with that fa=
irly<br>
&gt; easily. There are a handful of other contributors still around in<br>
&gt; QEMU, and some of the patches are so trivial you couldn&#39;t claim<br=
>
&gt; copyright on them ie where adding 1 parameter to a method call is <br>
&gt; literally the only possible way you could implmenent the change.<br>
&gt; It is never fun to contact everyone, but it looks viable.<br>
&gt; <br>
&gt; &gt; (2) Re-licensing async QMP as GPLv2+. (Next patch)<br>
&gt; &gt; <br>
&gt; &gt; (3) Someday, eventually, adding a different sync interface that<b=
r>
&gt; &gt; doesn&#39;t re-mix this specific compatibility interface and will=
 provide<br>
&gt; &gt; better event-waiting primitives and so on. legacy.py will get dro=
pped<br>
&gt; &gt; at that point and the sub-project will become wholly GPLv2+. Unti=
l<br>
&gt; &gt; then, it will be mixed.<br>
&gt; <br>
&gt; Overall making it *all* GPLv2+ compat is going to be important if you<=
br>
&gt; want people to be comfortable using it. If it has a mix of GPLv2+<br>
&gt; and GPLv2-only code in the source tarball, then the overall combined<b=
r>
&gt; work will have to be considered GPLv2-only and that will put people<br=
>
&gt; off using it. Even if they could theoreticallly restrict their usage<b=
r>
&gt; to only the GPLv2+ parts, many won&#39;t get that far before moving on=
.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I agree. Just a matter of which intermediate states we&#39;ll see enroute.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
Actually I&#39;ll go furthuer and suggest that if we&#39;re going to do a<b=
r>
relicensing at all, and your goal is to encourage usage, then GPLv2+<br>
is the wrong choice. Use LGPLv2+ if you want to facilitate usage, while<br>
retaining a copyleft license.<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Same question as Andrea. Does the linking exce=
ption matter for Python? (The lawyer seemed to intuit to me that it was som=
ewhat untested. I don&#39;t think the answer was clear.)</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I have no opposition towards LGPL whatsoev=
er, so I guess if it doesn&#39;t hurt anything I can just do that instead.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">(The lawyer did suggest =
that MIT was likely the absolute most compatible license I could choose her=
e; but I&#39;m unsure I want to open the floodgates that wide without stron=
g reason. MIT feels like an off-ramp out of open source, and I like to avoi=
d it when possible. That said, the point of this package is to get people t=
o use QEMU and drive them towards our GPL project and ecosystem, so... Mayb=
e MIT would be reasonable. Still, if this component grows in complexity and=
 becomes integrated into a commercial product, I&#39;d be *pretty upset* if=
 any improvements were not published for everyone to benefit from. I think =
that&#39;s why I lean GPL, even though I want to maximize use.)</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
--</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
anks,</div><div dir=3D"auto">--js</div></div>

--0000000000009ce1a305daf8256d--


