Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95736EE68E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:23:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMNY-0004Nx-Dc; Tue, 25 Apr 2023 13:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prMNV-0004NV-Rk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prMNT-0001ip-5F
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ELmWLq3jxrcqLURlA5uFTH5D3eVeVzg7MnKjjgWeofc=;
 b=JJYEaxnYTZrgll5TB0GzYIHbDn3jUzRvkRuPCqp8j6zon5c8FJ++vWPS0DuTwx7Cx99Zcr
 nsXDnjc+WFKn2kfMYJCjt+mTf+cYNZu6Q0gj6rQd5v9OifxxKYu1GeOE2U93rg4CwsrhDX
 wWLtZm95os/k7C5FqUBZsnx3gV2T2SM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-neTYpr8dNduMn0zfxwhF9Q-1; Tue, 25 Apr 2023 13:22:52 -0400
X-MC-Unique: neTYpr8dNduMn0zfxwhF9Q-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-517a659f877so3743650a12.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 10:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682443370; x=1685035370;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ELmWLq3jxrcqLURlA5uFTH5D3eVeVzg7MnKjjgWeofc=;
 b=M/gS9zCMhF/0w3sbYZHmTVxJqpXg9R29ZNrsQsV7x8kykBrSI+kr2Qno0TyV05PIOZ
 7qlg+qCkT1Fb+VPB95/yvpIL3YCaL+PVy9LmLV2UjcSS04nIkxMsEaowWrWDN1qL+YX6
 8XZof5nLvlU3qUnWVDUuQIDLxoN5nB8k6QXoDt/oA8Zcfn90wa0QH2j8OHRvu7Nwsfyh
 Wj10yF/5hCSo9SI+cW2cqBxwhZbpJrc+3KKKOdGqhF+25/5ILzWWAphPrCftlO3Ip/CN
 9JzIdIqYL/KKysB0x7mTOa9h+G+Ta20MrhAinq12BkhKRVt4QzJnSYNTH6S+yZLk01BZ
 wfNQ==
X-Gm-Message-State: AAQBX9fY0OHC42CPNaTnBPUg8FVbsK/8sPZs1jkIY2KXIGrcHKxBIDg1
 yr8njT82oCfKFszrl/r4VDpb0GsQ/4kx0aSuWiIJmXuXspMg+8u0tKi5GofMmNcwhCjHiUL6fqA
 RrKJyUI13CPTPfeWVKlvJvrZ3Aepmbak=
X-Received: by 2002:a17:90a:f318:b0:246:b8a5:b702 with SMTP id
 ca24-20020a17090af31800b00246b8a5b702mr18449931pjb.29.1682443370091; 
 Tue, 25 Apr 2023 10:22:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YC60BHWEPmD+vrV6FHtuyJmauLEqPXD7rcLwySbJPXy59EVcApZNjz3bX2iCAuMjZrTztoLMp0aSgNJJpKPJg=
X-Received: by 2002:a17:90a:f318:b0:246:b8a5:b702 with SMTP id
 ca24-20020a17090af31800b00246b8a5b702mr18449904pjb.29.1682443369811; Tue, 25
 Apr 2023 10:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <ZEgLNJ13fJf5RAI4@redhat.com>
In-Reply-To: <ZEgLNJ13fJf5RAI4@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 25 Apr 2023 13:22:38 -0400
Message-ID: <CAFn=p-YNjRZnFUhFr7PfHWKGvRnRnF1mpTc7KvFr5eXBM0Lsxw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000069a5bf05fa2c5ff0"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000069a5bf05fa2c5ff0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023, 1:17 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Mon, Apr 24, 2023 at 04:02:28PM -0400, John Snow wrote:
> > GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/846869409
> >            (All green, except Python self-tests, see below)
> >
> > This patch series creates a mandatory python virtual environment
> > ("venv") during configure time and uses it to ensure the availability o=
f
> > meson and sphinx.
> >
> > See https://www.qemu.org/2023/03/24/python/ for details. The summary is
> > that the goal of this series is to ensure that the `python` used to run
> > meson is the same `python` used to run Sphinx, tests, and any build-tim=
e
> > python scripting we have. As it stands, meson and sphinx (and their
> > extensions) *may* run in a different python environment than the one
> > configured and chosen by the user at configure/build time.
> >
> > The effective change of this series is that QEMU will now
> > unconditionally create a venv at configure-time and will ensure that
> > meson (and sphinx, if docs are enabled) are available through that venv=
.
> >
> > Some important points as a pre-emptive "FAQ":
> >
> > - This venv is unconditionally created and lives at {build_dir}/pyvenv.
> >
> > - The python interpreter used by this venv is always the one identified
> >   by configure. (Which in turn is always the one specified by --python
> >   or $PYTHON)
> >
> > - *almost* all python scripts in qemu.git executed as part of the build
> >   system, meson, sphinx, avocado tests, vm tests or CI are always
> >   executed within this venv.
> >
> >   (iotests are not yet integrated; I plan to tackle this separately as =
a
> >   follow-up in order to have a more tightly focused scope on that
> >   series.)
> >
> > - It remains possible to build and test fully offline.
> >   (In most cases, you just need meson and sphinx from your distro's
> repo.)
> >
> > - Distribution packaged 'meson' and 'sphinx' are still utilized wheneve=
r
> >   possible as the highest preference.
> >
> > - Vendored versions of e.g. 'meson' are always preferred to PyPI
> >   versions for speed, repeatability and ensuring tarball builds work
> >   as-is offline.
> >
> >   (Sphinx will not be vendored, just like it already isn't.)
> >
> > - Missing dependencies, when possible, are fetched and installed
> >   on-demand automatically to make developer environments "just work".
> >
> > - Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS,
> >   Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere
> >
> > - No new dependencies (...for most platforms. Debian and NetBSD get an
> >   asterisk.)
> >
> > - The meson git submodule is unused after this series and can be remove=
d.
> >
> > For reviewers, here's how the series is broken up:
> >
> > Patch 1 is a testing pre-req. Note that even with this patch,
> > 'check-python-minreqs' and 'check-python-tox' CI jobs will both still
> > fail on origin/master because this series requires 3.7+, but
> > origin/master is currently still 3.6+.
> >
> > - python: update pylint configuration
> >
> > Patches 2-8 add the mkvenv script. The first patch checks in the barest
> > essentials, and each subsequent patch adds a workaround or feature one
> > at a time.
> >
> > - python: add mkvenv.py
> > - mkvenv: add console script entry point generation
> > - mkvenv: Add better error message for missing pyexapt module
> > - mkvenv: generate console entry shims from inside the venv
> > - mkvenv: work around broken pip installations on Debian 10
> > - mkvenv: add nested venv workaround
> > - mkvenv: add ensure subcommand
> >
> > Patches 9-11 modify our testing configuration to add new dependencies a=
s
> > needed.
> >
> > - tests/docker: add python3-venv dependency
> > - tests/vm: Configure netbsd to use Python 3.10
> > - tests/vm: add py310-expat to NetBSD
> >
> > Patch 12 changes how we package release tarballs.
> >
> > - scripts/make-release: download meson=3D=3D0.61.5 .whl
> >
> > Patches 13-16 wire mkvenv into configure and tests.
> >
> > - configure: create a python venv unconditionally
> > - configure: use 'mkvenv ensure meson' to bootstrap meson
> > - configure: add --enable-pypi and --disable-pypi
> > - tests: Use configure-provided pyvenv for tests
> >
> > Patches 17-20 delegate Sphinx bootstrapping to mkvenv. Some of these
> > changes could be folded earlier in the series (like the diagnose()
> > patch), but I'm keeping it separate for review for now.
> >
> > - configure: move --enable-docs and --disable-docs back to configure
> > - mkvenv: add diagnose() method for ensure() failures
> > - configure: use --diagnose option with meson ensure
> > - configure: bootstrap sphinx with mkvenv
>
> I'm not sure this last bit is working.
>
> I uninstalled meson and python3-sphinx from my F38 host and ran
> configure --target-list=3Dx86_64-softmmu and got this:
>
> $ ./configure --target-list=3Dx86_64-softmmu
> Using './build' as the directory for build output
> python determined to be '/usr/bin/python3'
> python version: Python 3.11.3
> MKVENV pyvenv
> Configured python as
> '/home/berrange/src/virt/qemu/build/pyvenv/bin/python3 -B'
> MKVENV ensure meson>=3D0.61.5
> WARNING: Skipping
> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due t=
o
> invalid metadata entry 'name'
> WARNING: Skipping
> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due t=
o
> invalid metadata entry 'name'
> WARNING: Location 'file:///home/berrange/src/virt/qemu/python/wheels' is
> ignored: it is neither a file nor a directory.
> ERROR: Could not find a version that satisfies the requirement
> meson>=3D0.61.5 (from versions: none)
> ERROR: No matching distribution found for meson>=3D0.61.5
> WARNING: Skipping
> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due t=
o
> invalid metadata entry 'name'
> WARNING: Skipping
> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due t=
o
> invalid metadata entry 'name'
> WARNING: Skipping
> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due t=
o
> invalid metadata entry 'name'
> MKVENV ensure sphinx>=3D1.6.0
> WARNING: Skipping
> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due t=
o
> invalid metadata entry 'name'
> WARNING: Skipping
> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due t=
o
> invalid metadata entry 'name'
> ERROR: Could not find a version that satisfies the requirement
> sphinx>=3D1.6.0 (from versions: none)
> ERROR: No matching distribution found for sphinx>=3D1.6.0
>
> *** Ouch! ***
>
> Could not ensure availability of 'sphinx>=3D1.6.0':
>  =E2=80=A2 Python package 'sphinx' was not found nor installed.
>  =E2=80=A2 No local package directory was searched.
>  =E2=80=A2 mkvenv was configured to operate offline and did not check PyP=
I.
>
>
> Sphinx not found/usable, disabling docs.
> MKVENV ok!
>
>
>
> It says mkvenv was configured to run offline, but I didn't do
> anything. I thought the intention was for developers it would
> live download from PyPI ?
>

Ah. So... with enable pypi being the default and with docs set to "auto", I
actually fall back to not installing sphinx from pypi *by default*. It
tries to locate it on your system and will enable docs if it can, but it
doesn't try too hard and doesn't get upset if it fails.

Try passing --enable-docs to convince the build system you'd really
definitely like docs, and it'll force the pypi access.


>
> On a system where i already have meson/sphinx installed, it
> all just worked fine AFAICT.
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

--00000000000069a5bf05fa2c5ff0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 25, 2023, 1:17 PM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Mon, Apr 24, 2023 at 04:02:28=
PM -0400, John Snow wrote:<br>
&gt; GitLab CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/846869=
409" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/jsn=
ow/qemu/-/pipelines/846869409</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (All green, except Python sel=
f-tests, see below)<br>
&gt; <br>
&gt; This patch series creates a mandatory python virtual environment<br>
&gt; (&quot;venv&quot;) during configure time and uses it to ensure the ava=
ilability of<br>
&gt; meson and sphinx.<br>
&gt; <br>
&gt; See <a href=3D"https://www.qemu.org/2023/03/24/python/" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://www.qemu.org/2023/03/24/python/</=
a> for details. The summary is<br>
&gt; that the goal of this series is to ensure that the `python` used to ru=
n<br>
&gt; meson is the same `python` used to run Sphinx, tests, and any build-ti=
me<br>
&gt; python scripting we have. As it stands, meson and sphinx (and their<br=
>
&gt; extensions) *may* run in a different python environment than the one<b=
r>
&gt; configured and chosen by the user at configure/build time.<br>
&gt; <br>
&gt; The effective change of this series is that QEMU will now<br>
&gt; unconditionally create a venv at configure-time and will ensure that<b=
r>
&gt; meson (and sphinx, if docs are enabled) are available through that ven=
v.<br>
&gt; <br>
&gt; Some important points as a pre-emptive &quot;FAQ&quot;:<br>
&gt; <br>
&gt; - This venv is unconditionally created and lives at {build_dir}/pyvenv=
.<br>
&gt; <br>
&gt; - The python interpreter used by this venv is always the one identifie=
d<br>
&gt;=C2=A0 =C2=A0by configure. (Which in turn is always the one specified b=
y --python<br>
&gt;=C2=A0 =C2=A0or $PYTHON)<br>
&gt; <br>
&gt; - *almost* all python scripts in qemu.git executed as part of the buil=
d<br>
&gt;=C2=A0 =C2=A0system, meson, sphinx, avocado tests, vm tests or CI are a=
lways<br>
&gt;=C2=A0 =C2=A0executed within this venv.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0(iotests are not yet integrated; I plan to tackle this sep=
arately as a<br>
&gt;=C2=A0 =C2=A0follow-up in order to have a more tightly focused scope on=
 that<br>
&gt;=C2=A0 =C2=A0series.)<br>
&gt; <br>
&gt; - It remains possible to build and test fully offline.<br>
&gt;=C2=A0 =C2=A0(In most cases, you just need meson and sphinx from your d=
istro&#39;s repo.)<br>
&gt; <br>
&gt; - Distribution packaged &#39;meson&#39; and &#39;sphinx&#39; are still=
 utilized whenever<br>
&gt;=C2=A0 =C2=A0possible as the highest preference.<br>
&gt; <br>
&gt; - Vendored versions of e.g. &#39;meson&#39; are always preferred to Py=
PI<br>
&gt;=C2=A0 =C2=A0versions for speed, repeatability and ensuring tarball bui=
lds work<br>
&gt;=C2=A0 =C2=A0as-is offline.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0(Sphinx will not be vendored, just like it already isn&#39=
;t.)<br>
&gt; <br>
&gt; - Missing dependencies, when possible, are fetched and installed<br>
&gt;=C2=A0 =C2=A0on-demand automatically to make developer environments &qu=
ot;just work&quot;.<br>
&gt; <br>
&gt; - Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS,<b=
r>
&gt;=C2=A0 =C2=A0Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully eve=
rywhere<br>
&gt; <br>
&gt; - No new dependencies (...for most platforms. Debian and NetBSD get an=
<br>
&gt;=C2=A0 =C2=A0asterisk.)<br>
&gt; <br>
&gt; - The meson git submodule is unused after this series and can be remov=
ed.<br>
&gt; <br>
&gt; For reviewers, here&#39;s how the series is broken up:<br>
&gt; <br>
&gt; Patch 1 is a testing pre-req. Note that even with this patch,<br>
&gt; &#39;check-python-minreqs&#39; and &#39;check-python-tox&#39; CI jobs =
will both still<br>
&gt; fail on origin/master because this series requires 3.7+, but<br>
&gt; origin/master is currently still 3.6+.<br>
&gt; <br>
&gt; - python: update pylint configuration<br>
&gt; <br>
&gt; Patches 2-8 add the mkvenv script. The first patch checks in the bares=
t<br>
&gt; essentials, and each subsequent patch adds a workaround or feature one=
<br>
&gt; at a time.<br>
&gt; <br>
&gt; - python: add mkvenv.py<br>
&gt; - mkvenv: add console script entry point generation<br>
&gt; - mkvenv: Add better error message for missing pyexapt module<br>
&gt; - mkvenv: generate console entry shims from inside the venv<br>
&gt; - mkvenv: work around broken pip installations on Debian 10<br>
&gt; - mkvenv: add nested venv workaround<br>
&gt; - mkvenv: add ensure subcommand<br>
&gt; <br>
&gt; Patches 9-11 modify our testing configuration to add new dependencies =
as<br>
&gt; needed.<br>
&gt; <br>
&gt; - tests/docker: add python3-venv dependency<br>
&gt; - tests/vm: Configure netbsd to use Python 3.10<br>
&gt; - tests/vm: add py310-expat to NetBSD<br>
&gt; <br>
&gt; Patch 12 changes how we package release tarballs.<br>
&gt; <br>
&gt; - scripts/make-release: download meson=3D=3D0.61.5 .whl<br>
&gt; <br>
&gt; Patches 13-16 wire mkvenv into configure and tests.<br>
&gt; <br>
&gt; - configure: create a python venv unconditionally<br>
&gt; - configure: use &#39;mkvenv ensure meson&#39; to bootstrap meson<br>
&gt; - configure: add --enable-pypi and --disable-pypi<br>
&gt; - tests: Use configure-provided pyvenv for tests<br>
&gt; <br>
&gt; Patches 17-20 delegate Sphinx bootstrapping to mkvenv. Some of these<b=
r>
&gt; changes could be folded earlier in the series (like the diagnose()<br>
&gt; patch), but I&#39;m keeping it separate for review for now.<br>
&gt; <br>
&gt; - configure: move --enable-docs and --disable-docs back to configure<b=
r>
&gt; - mkvenv: add diagnose() method for ensure() failures<br>
&gt; - configure: use --diagnose option with meson ensure<br>
&gt; - configure: bootstrap sphinx with mkvenv<br>
<br>
I&#39;m not sure this last bit is working.<br>
<br>
I uninstalled meson and python3-sphinx from my F38 host and ran<br>
configure --target-list=3Dx86_64-softmmu and got this:<br>
<br>
$ ./configure --target-list=3Dx86_64-softmmu<br>
Using &#39;./build&#39; as the directory for build output<br>
python determined to be &#39;/usr/bin/python3&#39;<br>
python version: Python 3.11.3<br>
MKVENV pyvenv<br>
Configured python as &#39;/home/berrange/src/virt/qemu/build/pyvenv/bin/pyt=
hon3 -B&#39;<br>
MKVENV ensure meson&gt;=3D0.61.5<br>
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.1=
1.egg-info due to invalid metadata entry &#39;name&#39;<br>
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.1=
1.egg-info due to invalid metadata entry &#39;name&#39;<br>
WARNING: Location &#39;file:///home/berrange/src/virt/qemu/python/wheels&#3=
9; is ignored: it is neither a file nor a directory.<br>
ERROR: Could not find a version that satisfies the requirement meson&gt;=3D=
0.61.5 (from versions: none)<br>
ERROR: No matching distribution found for meson&gt;=3D0.61.5<br>
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.1=
1.egg-info due to invalid metadata entry &#39;name&#39;<br>
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.1=
1.egg-info due to invalid metadata entry &#39;name&#39;<br>
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.1=
1.egg-info due to invalid metadata entry &#39;name&#39;<br>
MKVENV ensure sphinx&gt;=3D1.6.0<br>
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.1=
1.egg-info due to invalid metadata entry &#39;name&#39;<br>
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.1=
1.egg-info due to invalid metadata entry &#39;name&#39;<br>
ERROR: Could not find a version that satisfies the requirement sphinx&gt;=
=3D1.6.0 (from versions: none)<br>
ERROR: No matching distribution found for sphinx&gt;=3D1.6.0<br>
<br>
*** Ouch! ***<br>
<br>
Could not ensure availability of &#39;sphinx&gt;=3D1.6.0&#39;:<br>
=C2=A0=E2=80=A2 Python package &#39;sphinx&#39; was not found nor installed=
.<br>
=C2=A0=E2=80=A2 No local package directory was searched.<br>
=C2=A0=E2=80=A2 mkvenv was configured to operate offline and did not check =
PyPI. <br>
<br>
<br>
Sphinx not found/usable, disabling docs.<br>
MKVENV ok!<br>
<br>
<br>
<br>
It says mkvenv was configured to run offline, but I didn&#39;t do<br>
anything. I thought the intention was for developers it would<br>
live download from PyPI ?<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Ah. So... with enable pypi being the default and w=
ith docs set to &quot;auto&quot;, I actually fall back to not installing sp=
hinx from pypi *by default*. It tries to locate it on your system and will =
enable docs if it can, but it doesn&#39;t try too hard and doesn&#39;t get =
upset if it fails.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Try p=
assing --enable-docs to convince the build system you&#39;d really definite=
ly like docs, and it&#39;ll force the pypi access.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
<br>
On a system where i already have meson/sphinx installed, it<br>
all just worked fine AFAICT.<br>
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

--00000000000069a5bf05fa2c5ff0--


