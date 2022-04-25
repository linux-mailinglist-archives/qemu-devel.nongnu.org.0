Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C004C50E8E4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 20:55:52 +0200 (CEST)
Received: from localhost ([::1]:40104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj3sF-00080h-CX
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 14:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nj3qx-0006wH-5y
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nj3qt-0005sl-GF
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650912865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Urp9YtSbZlU2pbyNR9a8Krf8kI5Fuard1ElSo+sRmco=;
 b=b2O5ZXXUsEDlQCpkUsAEkabQKrI/jJytTbE/ZU7u7SbluJ1lp36ycH/wBN/Y+T9EDDqB4U
 lHLaXJHlOuCet7Vq2sfyYsJzZVc36NEL0w0kP1E3ky4ySaL842S8Y2MEsLuQaudK1TuFKV
 KY0kTggzmIH9Kewtq4oFRVxCTeVX9+k=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-8NvbnU_MPX6YO5jD1hEB2Q-1; Mon, 25 Apr 2022 14:54:24 -0400
X-MC-Unique: 8NvbnU_MPX6YO5jD1hEB2Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 b23-20020a1fb217000000b003465f17c5b5so1606255vkf.14
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 11:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Urp9YtSbZlU2pbyNR9a8Krf8kI5Fuard1ElSo+sRmco=;
 b=X0jfU6he09EJb3HZxq4wfItwt1KmWSaX8czqwEaK/DrNJpj/e7V0UBxawOUMrXOlSX
 fXkK3kmvel8gEYXmmy6k262FRbh1QfjrjBfQnOM5P3h/062K49NMmHqXwJOftbkIA4IJ
 gJb4YUIeXL6WTZJO2UV/smzpeZuidFoyXwtSicBlX22GYh5BsGetlVsJZsNzBA2ZpNzt
 01xEXqf3omkc2UBBUu6QL06Tjd0RWD0FabpPEOr8FVmUwlDslWTW5lLytZdylP+3+1GR
 faI7QjNPU4J1pSWak5J4/j8iZrA/C2TkOIU/HFY/3SyGplVNjeciy4rsCPvx7On4ZzXh
 835w==
X-Gm-Message-State: AOAM533SpcwGm6/MLFoRK/tpPA02G/YT5aM8iqYPjujocWK8ua/kbfCI
 zfz0PIEeVuxVHhI1KXCwrKUv3JA3DTderZsxvfYOdMVkHZ08l+J2dSK8rL85CBomuK1+VSyirSl
 TdBaPp7NDfHIWHgHx7JANidF8oUmNltM=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr5772888vsa.38.1650912863582; 
 Mon, 25 Apr 2022 11:54:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYp24iEg5a185o0h2dPH22mQrea32cVNZvYdbKdW5STLO1pw17/ULuz7VhObYK5nsn6KY9G0NI8B6BGBY8rgA=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr5772881vsa.38.1650912863342; Mon, 25 Apr
 2022 11:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-2-jsnow@redhat.com>
 <YmZ567xK3o7kWBjE@redhat.com>
In-Reply-To: <YmZ567xK3o7kWBjE@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Apr 2022 14:54:12 -0400
Message-ID: <CAFn=p-ZQKfPNFwdz6jJbit94gu8c9yC+PeKYUMsbB2yaBi417Q@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 01/12] fork qemu.qmp from qemu.git
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c668f505dd7f1ab3"
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Kashyap Chamarthy <kchamart@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c668f505dd7f1ab3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022, 6:37 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Fri, Apr 22, 2022 at 02:49:29PM -0400, John Snow wrote:
> > Split python/ from qemu.git, using these commands:
> >
> > > git subtree split -P python/ -b python-split-v3
> > > mkdir ~/src/tmp
> > > cd ~/src/tmp
> > > git clone --no-local --branch python-split-v3 --single-branch
> ~/src/qemu
> > > cd qemu
> > > git filter-repo --path qemu/machine/           \
> >                   --path qemu/utils/             \
> >                   --path tests/iotests-mypy.sh   \
> >                   --path tests/iotests-pylint.sh \
> >                   --invert-paths
>
> So you're saying the repository is initialized with the output from
> the above commands, and then this commit is the first one on top
> of that.
>

Yeah. This was just my best guess at how to preserve development history
and SOB credits.

Figured I'd document how the split was done in the commit so that was
archived too.


> > This commit, however, only performs some minimum cleanup to reflect the
> > deletion of the other subpackages. It is not intended to be exhaustive,
> > and further edits are made in forthcoming commits.
> >
> > These fixes are broken apart into micro-changes to facilitate mailing
> > list review subject-by-subject. They *could* be squashed into a single
> > larger commit on merge if desired, but due to the nature of the fork,
> > bisectability across the fork boundary is going to be challenging
> > anyway. It may be better value to just leave these initial commits
> > as-is.
>
> Yep, I think bisectability is impractical to achieve across this kind
> of split. I think the filtered git history is simply there as a  way
> to give credit to the original authors, for historical research and
> to make 'git blame' work.
>
> IOW, I'd declare bitsectability starts at the end of this patch
> series, as a goal.
>

That's the plan!

This series will mark 0.0.0a1 (no plans to publish) and then by the end of
the subsequent checkins to add package builds, doc builds, ci etc I'll tag
and publish a v0.0.1. (Possibily with a published v0.0.1a1 first to make
sure everything is wired up right. This will also be useful for testing
qemu.git changes to pull from PyPI.)


> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> >  .gitignore |  2 +-
> >  Makefile   | 16 ++++++++--------
> >  setup.cfg  | 24 +-----------------------
> >  setup.py   |  2 +-
> >  4 files changed, 11 insertions(+), 33 deletions(-)
> >
> > diff --git a/.gitignore b/.gitignore
> > index 904f324..b071f02 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -5,7 +5,7 @@
> >  # python packaging
> >  build/
> >  dist/
> > -qemu.egg-info/
> > +qemu.qmp.egg-info/
> >
> >  # editor config
> >  .idea/
> > diff --git a/Makefile b/Makefile
> > index 3334311..a2d2f2c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -30,7 +30,7 @@ help:
> >       @echo ""
> >       @echo "make develop:"
> >       @echo "    Install deps needed for for 'make check',"
> > -     @echo "    and install the qemu package in editable mode."
> > +     @echo "    and install the qemu.qmp package in editable mode."
> >       @echo "    (Can be used in or outside of a venv.)"
> >       @echo ""
> >       @echo "make pipenv"
> > @@ -43,7 +43,7 @@ help:
> >       @echo "    Remove package build output."
> >       @echo ""
> >       @echo "make distclean:"
> > -     @echo "    remove pipenv/venv files, qemu package forwarder,"
> > +     @echo "    remove pipenv/venv files, qemu.qmp package forwarder,"
> >       @echo "    built distribution files, and everything from 'make
> clean'."
> >       @echo ""
> >       @echo -e "Have a nice day ^_^\n"
> > @@ -64,11 +64,11 @@ dev-venv: $(QEMU_VENV_DIR)
> $(QEMU_VENV_DIR)/bin/activate
> >  $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
> >       @echo "VENV $(QEMU_VENV_DIR)"
> >       @python3 -m venv $(QEMU_VENV_DIR)
> > -     @(                                                      \
> > -             echo "ACTIVATE $(QEMU_VENV_DIR)";               \
> > -             . $(QEMU_VENV_DIR)/bin/activate;                \
> > -             echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";    \
> > -             make develop 1>/dev/null;                       \
> > +     @(                                                              \
> > +             echo "ACTIVATE $(QEMU_VENV_DIR)";                       \
> > +             . $(QEMU_VENV_DIR)/bin/activate;                        \
> > +             echo "INSTALL qemu.qmp[devel] $(QEMU_VENV_DIR)";        \
> > +             make develop 1>/dev/null;                               \
> >       )
> >       @touch $(QEMU_VENV_DIR)
> >
> > @@ -106,6 +106,6 @@ clean:
> >
> >  .PHONY: distclean
> >  distclean: clean
> > -     rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > +     rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> >       rm -f .coverage .coverage.*
> >       rm -rf htmlcov/
> > diff --git a/setup.cfg b/setup.cfg
> > index e877ea5..4ffab73 100644
> > --- a/setup.cfg
> > +++ b/setup.cfg
> > @@ -1,5 +1,5 @@
> >  [metadata]
> > -name =3D qemu
> > +name =3D qemu.qmp
> >  version =3D file:VERSION
> >  maintainer =3D QEMU Developer Team
> >  maintainer_email =3D qemu-devel@nongnu.org
> > @@ -25,8 +25,6 @@ classifiers =3D
> >  python_requires =3D >=3D 3.6
> >  packages =3D
> >      qemu.qmp
> > -    qemu.machine
> > -    qemu.utils
> >
> >  [options.package_data]
> >  * =3D py.typed
> > @@ -38,7 +36,6 @@ packages =3D
> >  devel =3D
> >      avocado-framework >=3D 90.0
> >      flake8 >=3D 3.6.0
> > -    fusepy >=3D 2.0.4
> >      isort >=3D 5.1.2
> >      mypy >=3D 0.780
> >      pylint >=3D 2.8.0
> > @@ -47,10 +44,6 @@ devel =3D
> >      urwid-readline >=3D 0.13
> >      Pygments >=3D 2.9.0
> >
> > -# Provides qom-fuse functionality
> > -fuse =3D
> > -    fusepy >=3D 2.0.4
> > -
> >  # QMP TUI dependencies
> >  tui =3D
> >      urwid >=3D 2.1.2
> > @@ -59,13 +52,6 @@ tui =3D
> >
> >  [options.entry_points]
> >  console_scripts =3D
> > -    qom =3D qemu.utils.qom:main
> > -    qom-set =3D qemu.utils.qom:QOMSet.entry_point
> > -    qom-get =3D qemu.utils.qom:QOMGet.entry_point
> > -    qom-list =3D qemu.utils.qom:QOMList.entry_point
> > -    qom-tree =3D qemu.utils.qom:QOMTree.entry_point
> > -    qom-fuse =3D qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
> > -    qemu-ga-client =3D qemu.utils.qemu_ga_client:main
> >      qmp-shell =3D qemu.qmp.qmp_shell:main
> >      qmp-shell-wrap =3D qemu.qmp.qmp_shell:main_wrap
> >      qmp-tui =3D qemu.qmp.qmp_tui:main [tui]
> > @@ -80,19 +66,12 @@ python_version =3D 3.6
> >  warn_unused_configs =3D True
> >  namespace_packages =3D True
> >
> > -[mypy-qemu.utils.qom_fuse]
> > -# fusepy has no type stubs:
> > -allow_subclassing_any =3D True
> > -
> >  [mypy-qemu.qmp.qmp_tui]
> >  # urwid and urwid_readline have no type stubs:
> >  allow_subclassing_any =3D True
> >
> >  # The following missing import directives are because these libraries
> do not
> >  # provide type stubs. Allow them on an as-needed basis for mypy.
> > -[mypy-fuse]
> > -ignore_missing_imports =3D True
> > -
> >  [mypy-urwid]
> >  ignore_missing_imports =3D True
> >
> > @@ -164,7 +143,6 @@ skip_missing_interpreters =3D true
> >  allowlist_externals =3D make
> >  deps =3D
> >      .[devel]
> > -    .[fuse]  # Workaround to trigger tox venv rebuild
> >      .[tui]   # Workaround to trigger tox venv rebuild
> >  commands =3D
> >      make check
> > diff --git a/setup.py b/setup.py
> > index c5bc459..aba951a 100755
> > --- a/setup.py
> > +++ b/setup.py
> > @@ -1,6 +1,6 @@
> >  #!/usr/bin/env python3
> >  """
> > -QEMU tooling installer script
> > +QEMU QMP library installer script
> >  Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
> >  """
> >
> > --
> > 2.34.1
> >
>
> With regards,
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

--000000000000c668f505dd7f1ab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 25, 2022, 6:37 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Fri, Apr 22, 2022 at 02:49:29=
PM -0400, John Snow wrote:<br>
&gt; Split python/ from qemu.git, using these commands:<br>
&gt; <br>
&gt; &gt; git subtree split -P python/ -b python-split-v3<br>
&gt; &gt; mkdir ~/src/tmp<br>
&gt; &gt; cd ~/src/tmp<br>
&gt; &gt; git clone --no-local --branch python-split-v3 --single-branch ~/s=
rc/qemu<br>
&gt; &gt; cd qemu<br>
&gt; &gt; git filter-repo --path qemu/machine/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--=
path qemu/utils/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--=
path tests/iotests-mypy.sh=C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--=
path tests/iotests-pylint.sh \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--=
invert-paths<br>
<br>
So you&#39;re saying the repository is initialized with the output from<br>
the above commands, and then this commit is the first one on top<br>
of that.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yeah. This was just my best guess at how to preserve development =
history and SOB credits.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Figured I&#39;d document how the split was done in the commit so that was =
archived too.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; This commit, however, only performs some minimum cleanup to reflect th=
e<br>
&gt; deletion of the other subpackages. It is not intended to be exhaustive=
,<br>
&gt; and further edits are made in forthcoming commits.<br>
&gt; <br>
&gt; These fixes are broken apart into micro-changes to facilitate mailing<=
br>
&gt; list review subject-by-subject. They *could* be squashed into a single=
<br>
&gt; larger commit on merge if desired, but due to the nature of the fork,<=
br>
&gt; bisectability across the fork boundary is going to be challenging<br>
&gt; anyway. It may be better value to just leave these initial commits<br>
&gt; as-is.<br>
<br>
Yep, I think bisectability is impractical to achieve across this kind<br>
of split. I think the filtered git history is simply there as a=C2=A0 way<b=
r>
to give credit to the original authors, for historical research and<br>
to make &#39;git blame&#39; work. <br>
<br>
IOW, I&#39;d declare bitsectability starts at the end of this patch<br>
series, as a goal.<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">That&#39;s the plan!</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">This series will mark 0.0.0a1 (no plans to publish) and then=
 by the end of the subsequent checkins to add package builds, doc builds, c=
i etc I&#39;ll tag and publish a v0.0.1. (Possibily with a published v0.0.1=
a1 first to make sure everything is wired up right. This will also be usefu=
l for testing qemu.git changes to pull from PyPI.)</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Kashyap Chamarthy &lt;<a href=3D"mailto:kchamart@redhat.c=
om" target=3D"_blank" rel=3D"noreferrer">kchamart@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .gitignore |=C2=A0 2 +-<br>
&gt;=C2=A0 Makefile=C2=A0 =C2=A0| 16 ++++++++--------<br>
&gt;=C2=A0 setup.cfg=C2=A0 | 24 +-----------------------<br>
&gt;=C2=A0 setup.py=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 4 files changed, 11 insertions(+), 33 deletions(-)<br>
&gt; <br>
&gt; diff --git a/.gitignore b/.gitignore<br>
&gt; index 904f324..b071f02 100644<br>
&gt; --- a/.gitignore<br>
&gt; +++ b/.gitignore<br>
&gt; @@ -5,7 +5,7 @@<br>
&gt;=C2=A0 # python packaging<br>
&gt;=C2=A0 build/<br>
&gt;=C2=A0 dist/<br>
&gt; -qemu.egg-info/<br>
&gt; +qemu.qmp.egg-info/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # editor config<br>
&gt;=C2=A0 .idea/<br>
&gt; diff --git a/Makefile b/Makefile<br>
&gt; index 3334311..a2d2f2c 100644<br>
&gt; --- a/Makefile<br>
&gt; +++ b/Makefile<br>
&gt; @@ -30,7 +30,7 @@ help:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;make develop:&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Install deps neede=
d for for &#39;make check&#39;,&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 and install the qemu pa=
ckage in editable mode.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 and install the qemu.qm=
p package in editable mode.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 (Can be used in or=
 outside of a venv.)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;make pipenv&quot;<br>
&gt; @@ -43,7 +43,7 @@ help:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Remove package bui=
ld output.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;make distclean:&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 remove pipenv/venv file=
s, qemu package forwarder,&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 remove pipenv/venv file=
s, qemu.qmp package forwarder,&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 built distribution=
 files, and everything from &#39;make clean&#39;.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo -e &quot;Have a nice day ^_^\n&quot;<b=
r>
&gt; @@ -64,11 +64,11 @@ dev-venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/ac=
tivate<br>
&gt;=C2=A0 $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;VENV $(QEMU_VENV_DIR)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@python3 -m venv $(QEMU_VENV_DIR)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;ACTIVATE $=
(QEMU_VENV_DIR)&quot;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. $(QEMU_VENV_DIR)/bi=
n/activate;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;INSTALL qe=
mu[devel] $(QEMU_VENV_DIR)&quot;;=C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make develop 1&gt;/de=
v/null;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;ACTIVATE $=
(QEMU_VENV_DIR)&quot;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. $(QEMU_VENV_DIR)/bi=
n/activate;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;INSTALL qe=
mu.qmp[devel] $(QEMU_VENV_DIR)&quot;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make develop 1&gt;/de=
v/null;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@touch $(QEMU_VENV_DIR)<br>
&gt;=C2=A0 <br>
&gt; @@ -106,6 +106,6 @@ clean:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 .PHONY: distclean<br>
&gt;=C2=A0 distclean: clean<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DI=
R) dist/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VEN=
V_DIR) dist/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f .coverage .coverage.*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf htmlcov/<br>
&gt; diff --git a/setup.cfg b/setup.cfg<br>
&gt; index e877ea5..4ffab73 100644<br>
&gt; --- a/setup.cfg<br>
&gt; +++ b/setup.cfg<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 [metadata]<br>
&gt; -name =3D qemu<br>
&gt; +name =3D qemu.qmp<br>
&gt;=C2=A0 version =3D file:VERSION<br>
&gt;=C2=A0 maintainer =3D QEMU Developer Team<br>
&gt;=C2=A0 maintainer_email =3D <a href=3D"mailto:qemu-devel@nongnu.org" ta=
rget=3D"_blank" rel=3D"noreferrer">qemu-devel@nongnu.org</a><br>
&gt; @@ -25,8 +25,6 @@ classifiers =3D<br>
&gt;=C2=A0 python_requires =3D &gt;=3D 3.6<br>
&gt;=C2=A0 packages =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu.qmp<br>
&gt; -=C2=A0 =C2=A0 qemu.machine<br>
&gt; -=C2=A0 =C2=A0 qemu.utils<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 [options.package_data]<br>
&gt;=C2=A0 * =3D py.typed<br>
&gt; @@ -38,7 +36,6 @@ packages =3D<br>
&gt;=C2=A0 devel =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 avocado-framework &gt;=3D 90.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 flake8 &gt;=3D 3.6.0<br>
&gt; -=C2=A0 =C2=A0 fusepy &gt;=3D 2.0.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 isort &gt;=3D 5.1.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mypy &gt;=3D 0.780<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pylint &gt;=3D 2.8.0<br>
&gt; @@ -47,10 +44,6 @@ devel =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 urwid-readline &gt;=3D 0.13<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Pygments &gt;=3D 2.9.0<br>
&gt;=C2=A0 <br>
&gt; -# Provides qom-fuse functionality<br>
&gt; -fuse =3D<br>
&gt; -=C2=A0 =C2=A0 fusepy &gt;=3D 2.0.4<br>
&gt; -<br>
&gt;=C2=A0 # QMP TUI dependencies<br>
&gt;=C2=A0 tui =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 urwid &gt;=3D 2.1.2<br>
&gt; @@ -59,13 +52,6 @@ tui =3D<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 [options.entry_points]<br>
&gt;=C2=A0 console_scripts =3D<br>
&gt; -=C2=A0 =C2=A0 qom =3D qemu.utils.qom:main<br>
&gt; -=C2=A0 =C2=A0 qom-set =3D qemu.utils.qom:QOMSet.entry_point<br>
&gt; -=C2=A0 =C2=A0 qom-get =3D qemu.utils.qom:QOMGet.entry_point<br>
&gt; -=C2=A0 =C2=A0 qom-list =3D qemu.utils.qom:QOMList.entry_point<br>
&gt; -=C2=A0 =C2=A0 qom-tree =3D qemu.utils.qom:QOMTree.entry_point<br>
&gt; -=C2=A0 =C2=A0 qom-fuse =3D qemu.utils.qom_fuse:QOMFuse.entry_point [f=
use]<br>
&gt; -=C2=A0 =C2=A0 qemu-ga-client =3D qemu.utils.qemu_ga_client:main<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qmp-shell =3D qemu.qmp.qmp_shell:main<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qmp-shell-wrap =3D qemu.qmp.qmp_shell:main_wrap<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 qmp-tui =3D qemu.qmp.qmp_tui:main [tui]<br>
&gt; @@ -80,19 +66,12 @@ python_version =3D 3.6<br>
&gt;=C2=A0 warn_unused_configs =3D True<br>
&gt;=C2=A0 namespace_packages =3D True<br>
&gt;=C2=A0 <br>
&gt; -[mypy-qemu.utils.qom_fuse]<br>
&gt; -# fusepy has no type stubs:<br>
&gt; -allow_subclassing_any =3D True<br>
&gt; -<br>
&gt;=C2=A0 [mypy-qemu.qmp.qmp_tui]<br>
&gt;=C2=A0 # urwid and urwid_readline have no type stubs:<br>
&gt;=C2=A0 allow_subclassing_any =3D True<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # The following missing import directives are because these libr=
aries do not<br>
&gt;=C2=A0 # provide type stubs. Allow them on an as-needed basis for mypy.=
<br>
&gt; -[mypy-fuse]<br>
&gt; -ignore_missing_imports =3D True<br>
&gt; -<br>
&gt;=C2=A0 [mypy-urwid]<br>
&gt;=C2=A0 ignore_missing_imports =3D True<br>
&gt;=C2=A0 <br>
&gt; @@ -164,7 +143,6 @@ skip_missing_interpreters =3D true<br>
&gt;=C2=A0 allowlist_externals =3D make<br>
&gt;=C2=A0 deps =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .[devel]<br>
&gt; -=C2=A0 =C2=A0 .[fuse]=C2=A0 # Workaround to trigger tox venv rebuild<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 .[tui]=C2=A0 =C2=A0# Workaround to trigger tox ven=
v rebuild<br>
&gt;=C2=A0 commands =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 make check<br>
&gt; diff --git a/setup.py b/setup.py<br>
&gt; index c5bc459..aba951a 100755<br>
&gt; --- a/setup.py<br>
&gt; +++ b/setup.py<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 #!/usr/bin/env python3<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt; -QEMU tooling installer script<br>
&gt; +QEMU QMP library installer script<br>
&gt;=C2=A0 Copyright (c) 2020-2021 John Snow for Red Hat, Inc.<br>
&gt;=C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000c668f505dd7f1ab3--


