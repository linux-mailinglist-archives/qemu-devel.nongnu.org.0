Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36730477866
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:21:03 +0100 (CET)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtV7-0003Gz-RC
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:21:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxtSp-00011a-2X
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxtSk-00032z-Ee
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639671513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YcNjX7dRgknef7O1IJpIHG4CW4Y+XFqxkbZmjfteUwA=;
 b=gsmJlpZYaP+8vcA5+MbKkfrNNXx01qQIktDzZa5E/40WCjUe518Mjg47pfqno39T6W19mq
 URG8xURO0kOM5bxO6MQFAfctDIUo7nTtkELHR37qPR1pA07DVri1Cls+pvOv6PIGvPgD0E
 QBV2bh8Tmw8OLcykCOMj7ytvfzDWGOo=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-RrCS38C_Pv-V411xX2qHXw-1; Thu, 16 Dec 2021 11:18:29 -0500
X-MC-Unique: RrCS38C_Pv-V411xX2qHXw-1
Received: by mail-ua1-f70.google.com with SMTP id
 t10-20020ab04aca000000b002f6f910b48cso4208217uae.20
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YcNjX7dRgknef7O1IJpIHG4CW4Y+XFqxkbZmjfteUwA=;
 b=qcyupAjhJM9cES7o7OmM66BTyQybMQf3UJM2EoJ4/xGnTSZyUop12MSh54V0+PjHPx
 HD67ijgpuppy70NCice2xBlSZwwjsMxugaYCxFhJF+194QWN7XvLJ0eTGxNJKZZpLr/q
 qChSN8OKPxjXb4ZPvXJt3gA1EjSdRRHFTD9gm+0iFLphH1qKkOUAsy3iZaKAMcUiPvvs
 DiUidsnM1rgCW+OkT8ZnsP7ziatV8gXZVSAkZQVoXu/K5WIVyqCGtt5zwLrcTv7e12Pf
 8sK9pEYT4Fw3D/GWpP/+S3g7sTpN3sMwAO4tsozQHA3b4Ees+1bYX5Ee6eqPLRv/JTeg
 cz+Q==
X-Gm-Message-State: AOAM531tdQHLkyVGBOESFu3lN98pW+cXKWGshM6RljDokARt/UXY1910
 ZO3qGKN5iUb5rUmo+tEOuvC1cL2fQPVZlaFh2c5QHL8SuiELHNtyfoXrFVYMJaC/rVGQAJ6kh/E
 KPUS1lxaxh3VN7BTQGfe4De0Sn6h5Cqk=
X-Received: by 2002:a67:e40d:: with SMTP id d13mr5963409vsf.11.1639671508655; 
 Thu, 16 Dec 2021 08:18:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye9PXy2jpFvcudO9wgkaQPUVF5Jfv7zOVtL0J8G60b9ZYVkKKgr0cnCE9Wx2LPjN1F5TovGjLN5LpZZCYsXYc=
X-Received: by 2002:a67:e40d:: with SMTP id d13mr5963350vsf.11.1639671507416; 
 Thu, 16 Dec 2021 08:18:27 -0800 (PST)
MIME-Version: 1.0
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <YbsXvBwgSuCuhzK/@redhat.com>
In-Reply-To: <YbsXvBwgSuCuhzK/@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 11:18:16 -0500
Message-ID: <CAFn=p-af79+rtf-WrP+0Hx=RA29idGGQemDjO0zRGJOoT7PdRw@mail.gmail.com>
Subject: Re: [RFC qemu.qmp PATCH 00/24] Python: Fork qemu.qmp Python lib into
 independent repo
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bf8d0105d345c508"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bf8d0105d345c508
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 5:41 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Dec 15, 2021 at 04:06:10PM -0500, John Snow wrote:
> > Hi, this series is part of an effort to publish the qemu.qmp package on
> > PyPI. It is the second of three series to complete this work:
> >
> >     (1) Switch the new Async QMP library in to python/qemu/qmp
> > --> (2) Fork python/qemu/qmp out into its own repository,
> >         with updated GitLab CI/CD targets to build packages.
> >     (3) Update qemu.git to install qemu.qmp from PyPI,
> >         and then delete python/qemu/qmp.
> >
> > This series is not meant to apply to qemu.git, rather -- it's the serie=
s
> > that performs the split and would apply to a brand new repository.
> >
> > I am submitting it to the QEMU mailing list for these reasons:
> >
> > (1) To more broadly announce my intentions, and as reference alongside
> > series #1 and #3 detailed above.
> >
> > (2) To ask for permission to become the maintainer of a
> > 'qemu-project/qemu.qmp' repository, where I would like to host this
> > subproject.
>
> I'd say we need 3 designated maintainers as a minimum for redundancy.
>

Fine by me -- I'd like to nominate Cleber as my current co-maintainer of
python/, but that leaves a third spot open. Cleber may decide to nominate
someone else who is working on Avocado, too -- that'd be good too. If there
was a third person who wasn't @redhat.com, that'd be nice, but nobody comes
to mind right away. Any volunteers?

Also, I can hand over control of the PyPI project(s) to the conservancy and
use revocable auth tokens to perform releases. We'll cross that bridge when
we get there, but I've looked into it.


>
> > (3) To ask for review on the README.rst file which details my intended
> > contribution guidelines for this subproject.
> >
> > (4) To ask for review on the .gitlab-ci.d/ files and other repo-level
> > CI/CD ephemera, including and especially the docs-building process.  I
> > think the generated docs are still ugly, and I'd like to upload them to
> > readthedocs, among other things -- hence the RFC quality of this series=
.
>
> > Some review/RFC notes:
> >
> > - I use jsnow/qemu.qmp as the repo name throughout the series; that wil=
l
> >   have to be changed eventually, but for the purposes of prototyping, i=
t
> >   was nicer to have a fully working series.
> >
> > - I'm planning on using gitlab issues and MRs for the subproject.
>
> Great !
>
>
It's just easier for me, and I suspect it would be easier for non-QEMU
contributors to use. I'm starting to try and target people that sit a
little further out from our core project, so it seemed like it'd make the
most sense.

I'll have to work out how to announce changes to the list, though ... maybe
I'll have a bot announce merge requests to the mailing list, I'm not sure.


> > - I plan to version this lib independently, starting at 0.0.1 for the
> >   initial public release and bumping only the micro version for every
> >   last release. I plan to bump the minor version once it hits a "beta"
> >   state. There will be no cross-versioning against QEMU. I don't plan t=
o
> >   publish new releases during QEMU freezes.
>
> IMHO if we're saying that QEMU is going to use this library straight
> from PyPI from the start, then we're defacto considering it staable
> from the start too. We can't accept changes published to PyPI that
> are going to be incompatible with existing QEMU.
>
> If that isn't acceptable, then QEMU is going to have to be pinned to
> a very specific version from PyPi, and explicitly not pull the
> latest.
>
>
Right, I was thinking of pinning against a specific version. I want to
retain the freedom to change the API for a little while. I was worried that
if I tried to make it perfect before publishing it, that I'd never actually
make it perfect OR publish it.
My plan is something like this:

- Increment the micro version for any change during the "alpha" period
- Once I remove legacy.py and add a proper sync layer (Which may involve
some rework of how the event listeners are factored) I want to version at
0.1.0 and call it "beta". From there, compatible changes and extensions
will bump the micro and incompatible changes will bump the minor.
- After a QEMU release or two with the beta version and no major problems,
I'll probably bump it to 1.0.0, call it stable, and then use semver "as
normal" for all future releases.


> > - Docs are not yet uploaded anywhere (GitLab pages, readthedocs?)
>
> Since we're already using gitlab, personally I'd just setup a 'pages'
> job and assign a qemu.org sub-domain to gitlab pages service.
>
>
I'll work on a pages job at least, then. I'll look at what you've written
for qemu and qemu-web and do some copy-pasting.


> > - Tags on a commit trigger two pipelines; this causes one of the packag=
e
> >   builds to fail as the version number will be duplicated in this
> >   case. Not entirely sure how I want to fix this yet ...
>
> If you dont have any 'rules:' stanza gitlab creates a pipeline
> for any 'push' event - this means pushes of branch commits or
> pushes of tags.
>
> To remove the duplicates we need to filter based on certain
> standard variables - CI_COMMIT_BRANCH or CI_COMMIT_TAG
>
>   rules:
>     - if '$CI_PIPELINE_SOURCE !=3D "push"'
>       when: never
>     - if '$CI_PIPELINE_SOURCE =3D=3D "push" && $CI_COMMIT_BRANCH'
>       when: never
>     - if '$CI_PIPELINE_SOURCE =3D=3D "push" && $CI_COMMIT_BRANCH'
>       when: on_success
>     - when: never
>
>
> will cull jobs for pushes of branch commit, leaving pipelines
> for tag pushes. It can get arbitrarily more complicated depending
> on what you need to achieve.
>

OK, I'll play around with it -- thanks


> Since we're going to use merge requests, we should be aiming to
> *NOT* run pipelines on branch commit pushes for forks. We only
> want pipelines attached to the merge request.
>
> You'll need pipelines on pushes of tags for the post-merge publishing
> jobs potentially, unless you want todo that on a nightly schedule
>
> Regards,
> Daniel
>
>
Thanks for taking a peek!

(looks at email inbox ... well, this is gonna take a second to unpack ...!)

--000000000000bf8d0105d345c508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:41 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Dec 15, 2021 at 04:06:10PM -0500, John Snow wrote:<br>
&gt; Hi, this series is part of an effort to publish the qemu.qmp package o=
n<br>
&gt; PyPI. It is the second of three series to complete this work:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0(1) Switch the new Async QMP library in to python/q=
emu/qmp<br>
&gt; --&gt; (2) Fork python/qemu/qmp out into its own repository,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with updated GitLab CI/CD targets to =
build packages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0(3) Update qemu.git to install qemu.qmp from PyPI,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and then delete python/qemu/qmp.<br>
&gt; <br>
&gt; This series is not meant to apply to qemu.git, rather -- it&#39;s the =
series<br>
&gt; that performs the split and would apply to a brand new repository.<br>
&gt; <br>
&gt; I am submitting it to the QEMU mailing list for these reasons:<br>
&gt; <br>
&gt; (1) To more broadly announce my intentions, and as reference alongside=
<br>
&gt; series #1 and #3 detailed above.<br>
&gt; <br>
&gt; (2) To ask for permission to become the maintainer of a<br>
&gt; &#39;qemu-project/qemu.qmp&#39; repository, where I would like to host=
 this<br>
&gt; subproject.<br>
<br>
I&#39;d say we need 3 designated maintainers as a minimum for redundancy.<b=
r></blockquote><div><br></div><div>Fine by me -- I&#39;d like to nominate C=
leber as my current co-maintainer of python/, but that leaves a third spot =
open. Cleber may decide to nominate someone else who is working on Avocado,=
 too -- that&#39;d be good too. If there was a third person who wasn&#39;t =
@<a href=3D"http://redhat.com">redhat.com</a>, that&#39;d be nice, but nobo=
dy comes to mind right away. Any volunteers?<br></div><div><br></div><div>A=
lso, I can hand over control of the PyPI project(s) to the conservancy and =
use revocable auth tokens to perform releases. We&#39;ll cross that bridge =
when we get there, but I&#39;ve looked into it.<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; (3) To ask for review on the README.rst file which details my intended=
<br>
&gt; contribution guidelines for this subproject.<br>
&gt; <br>
&gt; (4) To ask for review on the .gitlab-ci.d/ files and other repo-level<=
br>
&gt; CI/CD ephemera, including and especially the docs-building process.=C2=
=A0 I<br>
&gt; think the generated docs are still ugly, and I&#39;d like to upload th=
em to<br>
&gt; readthedocs, among other things -- hence the RFC quality of this serie=
s.<br>
<br>
&gt; Some review/RFC notes:<br>
&gt; <br>
&gt; - I use jsnow/qemu.qmp as the repo name throughout the series; that wi=
ll<br>
&gt;=C2=A0 =C2=A0have to be changed eventually, but for the purposes of pro=
totyping, it<br>
&gt;=C2=A0 =C2=A0was nicer to have a fully working series.<br>
&gt; <br>
&gt; - I&#39;m planning on using gitlab issues and MRs for the subproject.<=
br>
<br>
Great !<br>
<br></blockquote><div><br></div><div>It&#39;s just easier for me, and I sus=
pect it would be easier for non-QEMU contributors to use. I&#39;m starting =
to try and target people that sit a little further out from our core projec=
t, so it seemed like it&#39;d make the most sense.</div><div><br></div><div=
>I&#39;ll have to work out how to announce changes to the list, though ... =
maybe I&#39;ll have a bot announce merge requests to the mailing list, I&#3=
9;m not sure.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; - I plan to version this lib independently, starting at 0.0.1 for the<=
br>
&gt;=C2=A0 =C2=A0initial public release and bumping only the micro version =
for every<br>
&gt;=C2=A0 =C2=A0last release. I plan to bump the minor version once it hit=
s a &quot;beta&quot;<br>
&gt;=C2=A0 =C2=A0state. There will be no cross-versioning against QEMU. I d=
on&#39;t plan to<br>
&gt;=C2=A0 =C2=A0publish new releases during QEMU freezes.<br>
<br>
IMHO if we&#39;re saying that QEMU is going to use this library straight<br=
>
from PyPI from the start, then we&#39;re defacto considering it staable<br>
from the start too. We can&#39;t accept changes published to PyPI that<br>
are going to be incompatible with existing QEMU.<br>
<br>
If that isn&#39;t acceptable, then QEMU is going to have to be pinned to<br=
>
a very specific version from PyPi, and explicitly not pull the<br>
latest.<br>
<br></blockquote><div><br></div><div>Right, I was thinking of pinning again=
st a specific version. I want to retain the freedom to change the API for a=
 little while. I was worried that if I tried to make it perfect before publ=
ishing it, that I&#39;d never actually make it perfect OR publish it. <br><=
div>My plan is something like this:</div></div><div><br></div><div>- Increm=
ent the micro version for any change during the &quot;alpha&quot; period</d=
iv><div>- Once I remove legacy.py and add a proper sync layer (Which may in=
volve some rework of how the event listeners are factored) I want to versio=
n at 0.1.0 and call it &quot;beta&quot;. From there, compatible changes and=
 extensions will bump the micro and incompatible changes will bump the mino=
r.</div><div>- After a QEMU release or two with the beta version and no maj=
or problems, I&#39;ll probably bump it to 1.0.0, call it stable, and then u=
se semver &quot;as normal&quot; for all future releases.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; - Docs are not yet uploaded anywhere (GitLab pages, readthedocs?)<br>
<br>
Since we&#39;re already using gitlab, personally I&#39;d just setup a &#39;=
pages&#39;<br>
job and assign a <a href=3D"http://qemu.org" rel=3D"noreferrer" target=3D"_=
blank">qemu.org</a> sub-domain to gitlab pages service.<br>
<br></blockquote><div><br></div><div>I&#39;ll work on a pages job at least,=
 then. I&#39;ll look at what you&#39;ve written for qemu and qemu-web and d=
o some copy-pasting.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; - Tags on a commit trigger two pipelines; this causes one of the packa=
ge<br>
&gt;=C2=A0 =C2=A0builds to fail as the version number will be duplicated in=
 this<br>
&gt;=C2=A0 =C2=A0case. Not entirely sure how I want to fix this yet ...<br>
<br>
If you dont have any &#39;rules:&#39; stanza gitlab creates a pipeline<br>
for any &#39;push&#39; event - this means pushes of branch commits or<br>
pushes of tags.<br>
<br>
To remove the duplicates we need to filter based on certain<br>
standard variables - CI_COMMIT_BRANCH or CI_COMMIT_TAG<br>
<br>
=C2=A0 rules:<br>
=C2=A0 =C2=A0 - if &#39;$CI_PIPELINE_SOURCE !=3D &quot;push&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 when: never<br>
=C2=A0 =C2=A0 - if &#39;$CI_PIPELINE_SOURCE =3D=3D &quot;push&quot; &amp;&a=
mp; $CI_COMMIT_BRANCH&#39;<br>
=C2=A0 =C2=A0 =C2=A0 when: never<br>
=C2=A0 =C2=A0 - if &#39;$CI_PIPELINE_SOURCE =3D=3D &quot;push&quot; &amp;&a=
mp; $CI_COMMIT_BRANCH&#39;<br>
=C2=A0 =C2=A0 =C2=A0 when: on_success<br>
=C2=A0 =C2=A0 - when: never<br>
<br>
<br>
will cull jobs for pushes of branch commit, leaving pipelines<br>
for tag pushes. It can get arbitrarily more complicated depending<br>
on what you need to achieve.<br></blockquote><div><br></div><div>OK, I&#39;=
ll play around with it -- thanks<br></div><div>=C2=A0<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Since we&#39;re going to use merge requests, we should be aiming to<br>
*NOT* run pipelines on branch commit pushes for forks. We only<br>
want pipelines attached to the merge request.<br>
<br>
You&#39;ll need pipelines on pushes of tags for the post-merge publishing<b=
r>
jobs potentially, unless you want todo that on a nightly schedule<br>
<br>
Regards,<br>
Daniel<br><br></blockquote><div><br></div><div>Thanks for taking a peek!<br=
><br></div><div>(looks at email inbox ... well, this is gonna take a second=
 to unpack ...!)<br></div></div></div>

--000000000000bf8d0105d345c508--


