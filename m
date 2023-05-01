Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A86F369F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:21:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptZ4b-0002Ss-Hr; Mon, 01 May 2023 15:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ptZ4a-0002Si-0x
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ptZ4X-0007ux-8p
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682968827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LGGHV2/Vl/2tUE97rz9iRgneZ6Xyce0VOibIdUFlEp4=;
 b=BQHbv6ZaENlSugniAdFfUlgsPOubIs6piiqYDYO4g4yoGPCTG/R8USjUqDDOvrXRT1qhjV
 S+8AGBXRb1e6B7ofnLFan+rL0Bxw2XqJXedIwbxiyHsWkOdWTTrVif9fvDhBQkE/vFvaGo
 1kRo05DrucZJL2TJhN529PxkiblWxGY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-J4XKr_GqOjOv4HvN-7c23g-1; Mon, 01 May 2023 15:20:26 -0400
X-MC-Unique: J4XKr_GqOjOv4HvN-7c23g-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-24e116d1a05so876011a91.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 12:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682968825; x=1685560825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LGGHV2/Vl/2tUE97rz9iRgneZ6Xyce0VOibIdUFlEp4=;
 b=Aa8+gjzwHowztDm9PjsIe4lBpuKF/cytw3cB+Ibc9c1vw3kEIU/YdhXEUBlr2LdK9j
 JCXb4xTZkqhhczra3DDJw1U93J8UYEMlkBAelgYmGk47h6PKhA6GeUnysu6ZQVZh7NDd
 t5HfEF6VBgSb/ebnQxKM+1d6rjcc4+m6q6Af6xoRLBu5oXwBlzLB2jieQND/vZBAa5MW
 Ba1eWUuDqIDQkEDf9QxN2ZZ8vaoU06WChYoNr0VYdu5ydLhEmleyzXhxAu56REWcBtoA
 56UfVwYasczAnTiaOJRshFL2UbjwtYJdnKS4OAlEgxBR/mmN8w3RXTeFSe+SAayzDCOn
 VFtw==
X-Gm-Message-State: AC+VfDwaWkHZyfLwhLBdxKeaVKVKMLzIs/Cm5iw0Mk90WhwahMZw9TIR
 oktUdCh447Ekq4iWRJtnvcoMr3x0mGlVrqObKFLjJh1VF8kTnfDOq8gKdvRD1DYBub8fQdtoxIJ
 BnTjw+8PAzfw9GRq/W665Kj1PRpyCHbENXqO0SgQ=
X-Received: by 2002:a17:90a:a010:b0:249:6098:b068 with SMTP id
 q16-20020a17090aa01000b002496098b068mr15772771pjp.45.1682968824997; 
 Mon, 01 May 2023 12:20:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6QGn0QJpLcqJCIYB+gjKWjafF44clMLrZFYSOaw7CpYalqzo7a/ywzzgfF0D/spTf1Mzb+Osmaoj2jami9gwg=
X-Received: by 2002:a17:90a:a010:b0:249:6098:b068 with SMTP id
 q16-20020a17090aa01000b002496098b068mr15772736pjp.45.1682968824579; Mon, 01
 May 2023 12:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 1 May 2023 15:20:13 -0400
Message-ID: <CAFn=p-bw0iaYn_kYwQx86GOOgYgNBOnQyqRNeFA04C1Hm+0sFA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f52aaa05faa6b608"
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

--000000000000f52aaa05faa6b608
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 24, 2023, 4:02 PM John Snow <jsnow@redhat.com> wrote:

> GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/846869409
>            (All green, except Python self-tests, see below)
>
> This patch series creates a mandatory python virtual environment
> ("venv") during configure time and uses it to ensure the availability of
> meson and sphinx.
>
> See https://www.qemu.org/2023/03/24/python/ for details. The summary is
> that the goal of this series is to ensure that the `python` used to run
> meson is the same `python` used to run Sphinx, tests, and any build-time
> python scripting we have. As it stands, meson and sphinx (and their
> extensions) *may* run in a different python environment than the one
> configured and chosen by the user at configure/build time.
>
> The effective change of this series is that QEMU will now
> unconditionally create a venv at configure-time and will ensure that
> meson (and sphinx, if docs are enabled) are available through that venv.
>
> Some important points as a pre-emptive "FAQ":
>
> - This venv is unconditionally created and lives at {build_dir}/pyvenv.
>
> - The python interpreter used by this venv is always the one identified
>   by configure. (Which in turn is always the one specified by --python
>   or $PYTHON)
>
> - *almost* all python scripts in qemu.git executed as part of the build
>   system, meson, sphinx, avocado tests, vm tests or CI are always
>   executed within this venv.
>
>   (iotests are not yet integrated; I plan to tackle this separately as a
>   follow-up in order to have a more tightly focused scope on that
>   series.)
>
> - It remains possible to build and test fully offline.
>   (In most cases, you just need meson and sphinx from your distro's repo.)
>
> - Distribution packaged 'meson' and 'sphinx' are still utilized whenever
>   possible as the highest preference.
>
> - Vendored versions of e.g. 'meson' are always preferred to PyPI
>   versions for speed, repeatability and ensuring tarball builds work
>   as-is offline.
>
>   (Sphinx will not be vendored, just like it already isn't.)
>
> - Missing dependencies, when possible, are fetched and installed
>   on-demand automatically to make developer environments "just work".
>
> - Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS,
>   Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere
>
> - No new dependencies (...for most platforms. Debian and NetBSD get an
>   asterisk.)
>
> - The meson git submodule is unused after this series and can be removed.
>
> For reviewers, here's how the series is broken up:
>
> Patch 1 is a testing pre-req. Note that even with this patch,
> 'check-python-minreqs' and 'check-python-tox' CI jobs will both still
> fail on origin/master because this series requires 3.7+, but
> origin/master is currently still 3.6+.
>
> - python: update pylint configuration
>
> Patches 2-8 add the mkvenv script. The first patch checks in the barest
> essentials, and each subsequent patch adds a workaround or feature one
> at a time.
>
> - python: add mkvenv.py
> - mkvenv: add console script entry point generation
> - mkvenv: Add better error message for missing pyexapt module
> - mkvenv: generate console entry shims from inside the venv
> - mkvenv: work around broken pip installations on Debian 10
> - mkvenv: add nested venv workaround
> - mkvenv: add ensure subcommand
>
> Patches 9-11 modify our testing configuration to add new dependencies as
> needed.
>
> - tests/docker: add python3-venv dependency
> - tests/vm: Configure netbsd to use Python 3.10
> - tests/vm: add py310-expat to NetBSD
>
> Patch 12 changes how we package release tarballs.
>
> - scripts/make-release: download meson==0.61.5 .whl
>
> Patches 13-16 wire mkvenv into configure and tests.
>
> - configure: create a python venv unconditionally
> - configure: use 'mkvenv ensure meson' to bootstrap meson
> - configure: add --enable-pypi and --disable-pypi
> - tests: Use configure-provided pyvenv for tests
>
> Patches 17-20 delegate Sphinx bootstrapping to mkvenv. Some of these
> changes could be folded earlier in the series (like the diagnose()
> patch), but I'm keeping it separate for review for now.
>
> - configure: move --enable-docs and --disable-docs back to configure
> - mkvenv: add diagnose() method for ensure() failures
> - configure: use --diagnose option with meson ensure
> - configure: bootstrap sphinx with mkvenv
>
> That's all for now, seeya!
> --js
>
> John Snow (20):
>   python: update pylint configuration
>   python: add mkvenv.py
>   mkvenv: add console script entry point generation
>   mkvenv: Add better error message for missing pyexpat module
>   mkvenv: generate console entry shims from inside the venv
>   mkvenv: work around broken pip installations on Debian 10
>   mkvenv: add nested venv workaround
>   mkvenv: add ensure subcommand
>   tests/docker: add python3-venv dependency
>   tests/vm: Configure netbsd to use Python 3.10
>   tests/vm: add py310-expat to NetBSD
>   scripts/make-release: download meson==0.61.5 .whl
>   configure: create a python venv unconditionally
>   configure: use 'mkvenv ensure meson' to bootstrap meson
>   configure: add --enable-pypi and --disable-pypi
>   tests: Use configure-provided pyvenv for tests
>   configure: move --enable-docs and --disable-docs back to configure
>   mkvenv: add diagnose() method for ensure() failures
>   configure: use --diagnose option with meson ensure
>   configure: bootstrap sphinx with mkvenv
>
>  docs/devel/acpi-bits.rst                      |   6 +-
>  docs/devel/testing.rst                        |  14 +-
>  configure                                     | 139 +--
>  .gitlab-ci.d/buildtest-template.yml           |   4 +-
>  .gitlab-ci.d/buildtest.yml                    |   6 +-
>  python/scripts/mkvenv.py                      | 871 ++++++++++++++++++
>  python/setup.cfg                              |  10 +
>  python/tests/flake8.sh                        |   1 +
>  python/tests/isort.sh                         |   1 +
>  python/tests/mypy.sh                          |   1 +
>  python/tests/pylint.sh                        |   1 +
>  .../org.centos/stream/8/x86_64/test-avocado   |   4 +-
>  scripts/device-crash-test                     |   2 +-
>  scripts/make-release                          |  11 +
>  tests/Makefile.include                        |  10 +-
>  .../dockerfiles/debian-all-test-cross.docker  |   3 +-
>  .../dockerfiles/debian-hexagon-cross.docker   |   3 +-
>  .../dockerfiles/debian-riscv64-cross.docker   |   3 +-
>  .../dockerfiles/debian-tricore-cross.docker   |   3 +-
>  tests/requirements.txt                        |   7 +-
>  tests/vm/netbsd                               |   2 +
>  21 files changed, 1016 insertions(+), 86 deletions(-)
>  create mode 100644 python/scripts/mkvenv.py
>
> --
> 2.39.2
>

Just a note to say I'm working on the respin here - Paolo suggested I
remove the "--gen" arguments to mkvenv and generate the entry point scripts
conditionally at ensure time instead.

Good idea!

I ran into some problems with msys2, though, where the entry point scripts
native to the system are binary .exe files I don't know how to recreate.

I have some research to do on windows perhaps to understand what's expected
on that platform and how to achieve it.

I'm hoping the fix is as easy as "You can still use console scripts, but
you need to use the .py or .pyw suffix". I'll know shortly!

If I don't smooth over all the issues before Wednesday, though, I'm going
to be away from my desk for the rest of the week and may need to ask Paolo
for help finishing up the polish so we can land this in a timely fashion so
we have a lot of runway to fix build issues before 8.1 rc0.

--js

>

--000000000000f52aaa05faa6b608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 24, 2023, 4:02 PM John Snow &lt;<a href=3D=
"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">GitLab CI: <a href=3D"https://gitlab.com/jsnow/qemu/=
-/pipelines/846869409" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://gitlab.com/jsnow/qemu/-/pipelines/846869409</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(All green, except Python self-tes=
ts, see below)<br>
<br>
This patch series creates a mandatory python virtual environment<br>
(&quot;venv&quot;) during configure time and uses it to ensure the availabi=
lity of<br>
meson and sphinx.<br>
<br>
See <a href=3D"https://www.qemu.org/2023/03/24/python/" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://www.qemu.org/2023/03/24/python/</a> fo=
r details. The summary is<br>
that the goal of this series is to ensure that the `python` used to run<br>
meson is the same `python` used to run Sphinx, tests, and any build-time<br=
>
python scripting we have. As it stands, meson and sphinx (and their<br>
extensions) *may* run in a different python environment than the one<br>
configured and chosen by the user at configure/build time.<br>
<br>
The effective change of this series is that QEMU will now<br>
unconditionally create a venv at configure-time and will ensure that<br>
meson (and sphinx, if docs are enabled) are available through that venv.<br=
>
<br>
Some important points as a pre-emptive &quot;FAQ&quot;:<br>
<br>
- This venv is unconditionally created and lives at {build_dir}/pyvenv.<br>
<br>
- The python interpreter used by this venv is always the one identified<br>
=C2=A0 by configure. (Which in turn is always the one specified by --python=
<br>
=C2=A0 or $PYTHON)<br>
<br>
- *almost* all python scripts in qemu.git executed as part of the build<br>
=C2=A0 system, meson, sphinx, avocado tests, vm tests or CI are always<br>
=C2=A0 executed within this venv.<br>
<br>
=C2=A0 (iotests are not yet integrated; I plan to tackle this separately as=
 a<br>
=C2=A0 follow-up in order to have a more tightly focused scope on that<br>
=C2=A0 series.)<br>
<br>
- It remains possible to build and test fully offline.<br>
=C2=A0 (In most cases, you just need meson and sphinx from your distro&#39;=
s repo.)<br>
<br>
- Distribution packaged &#39;meson&#39; and &#39;sphinx&#39; are still util=
ized whenever<br>
=C2=A0 possible as the highest preference.<br>
<br>
- Vendored versions of e.g. &#39;meson&#39; are always preferred to PyPI<br=
>
=C2=A0 versions for speed, repeatability and ensuring tarball builds work<b=
r>
=C2=A0 as-is offline.<br>
<br>
=C2=A0 (Sphinx will not be vendored, just like it already isn&#39;t.)<br>
<br>
- Missing dependencies, when possible, are fetched and installed<br>
=C2=A0 on-demand automatically to make developer environments &quot;just wo=
rk&quot;.<br>
<br>
- Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS,<br>
=C2=A0 Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere<br=
>
<br>
- No new dependencies (...for most platforms. Debian and NetBSD get an<br>
=C2=A0 asterisk.)<br>
<br>
- The meson git submodule is unused after this series and can be removed.<b=
r>
<br>
For reviewers, here&#39;s how the series is broken up:<br>
<br>
Patch 1 is a testing pre-req. Note that even with this patch,<br>
&#39;check-python-minreqs&#39; and &#39;check-python-tox&#39; CI jobs will =
both still<br>
fail on origin/master because this series requires 3.7+, but<br>
origin/master is currently still 3.6+.<br>
<br>
- python: update pylint configuration<br>
<br>
Patches 2-8 add the mkvenv script. The first patch checks in the barest<br>
essentials, and each subsequent patch adds a workaround or feature one<br>
at a time.<br>
<br>
- python: add mkvenv.py<br>
- mkvenv: add console script entry point generation<br>
- mkvenv: Add better error message for missing pyexapt module<br>
- mkvenv: generate console entry shims from inside the venv<br>
- mkvenv: work around broken pip installations on Debian 10<br>
- mkvenv: add nested venv workaround<br>
- mkvenv: add ensure subcommand<br>
<br>
Patches 9-11 modify our testing configuration to add new dependencies as<br=
>
needed.<br>
<br>
- tests/docker: add python3-venv dependency<br>
- tests/vm: Configure netbsd to use Python 3.10<br>
- tests/vm: add py310-expat to NetBSD<br>
<br>
Patch 12 changes how we package release tarballs.<br>
<br>
- scripts/make-release: download meson=3D=3D0.61.5 .whl<br>
<br>
Patches 13-16 wire mkvenv into configure and tests.<br>
<br>
- configure: create a python venv unconditionally<br>
- configure: use &#39;mkvenv ensure meson&#39; to bootstrap meson<br>
- configure: add --enable-pypi and --disable-pypi<br>
- tests: Use configure-provided pyvenv for tests<br>
<br>
Patches 17-20 delegate Sphinx bootstrapping to mkvenv. Some of these<br>
changes could be folded earlier in the series (like the diagnose()<br>
patch), but I&#39;m keeping it separate for review for now.<br>
<br>
- configure: move --enable-docs and --disable-docs back to configure<br>
- mkvenv: add diagnose() method for ensure() failures<br>
- configure: use --diagnose option with meson ensure<br>
- configure: bootstrap sphinx with mkvenv<br>
<br>
That&#39;s all for now, seeya!<br>
--js<br>
<br>
John Snow (20):<br>
=C2=A0 python: update pylint configuration<br>
=C2=A0 python: add mkvenv.py<br>
=C2=A0 mkvenv: add console script entry point generation<br>
=C2=A0 mkvenv: Add better error message for missing pyexpat module<br>
=C2=A0 mkvenv: generate console entry shims from inside the venv<br>
=C2=A0 mkvenv: work around broken pip installations on Debian 10<br>
=C2=A0 mkvenv: add nested venv workaround<br>
=C2=A0 mkvenv: add ensure subcommand<br>
=C2=A0 tests/docker: add python3-venv dependency<br>
=C2=A0 tests/vm: Configure netbsd to use Python 3.10<br>
=C2=A0 tests/vm: add py310-expat to NetBSD<br>
=C2=A0 scripts/make-release: download meson=3D=3D0.61.5 .whl<br>
=C2=A0 configure: create a python venv unconditionally<br>
=C2=A0 configure: use &#39;mkvenv ensure meson&#39; to bootstrap meson<br>
=C2=A0 configure: add --enable-pypi and --disable-pypi<br>
=C2=A0 tests: Use configure-provided pyvenv for tests<br>
=C2=A0 configure: move --enable-docs and --disable-docs back to configure<b=
r>
=C2=A0 mkvenv: add diagnose() method for ensure() failures<br>
=C2=A0 configure: use --diagnose option with meson ensure<br>
=C2=A0 configure: bootstrap sphinx with mkvenv<br>
<br>
=C2=A0docs/devel/acpi-bits.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0docs/devel/testing.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
139 +--<br>
=C2=A0.gitlab-ci.d/buildtest-template.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.gitlab-ci.d/buildtest.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0python/scripts/mkvenv.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 871 ++++++++++++++++++<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
=C2=A0python/tests/flake8.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0python/tests/isort.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0python/tests/mypy.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0python/tests/pylint.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../org.centos/stream/8/x86_64/test-avocado=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +-<br>
=C2=A0scripts/device-crash-test=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/make-release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +<br>
=C2=A0tests/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0.../dockerfiles/debian-all-test-cross.docker=C2=A0 |=C2=A0 =C2=A03 +-=
<br>
=C2=A0.../dockerfiles/debian-hexagon-cross.docker=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +-<br>
=C2=A0.../dockerfiles/debian-riscv64-cross.docker=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +-<br>
=C2=A0.../dockerfiles/debian-tricore-cross.docker=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +-<br>
=C2=A0tests/requirements.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0tests/vm/netbsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+<br>
=C2=A021 files changed, 1016 insertions(+), 86 deletions(-)<br>
=C2=A0create mode 100644 python/scripts/mkvenv.py<br>
<br>
-- <br>
2.39.2<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Just a note to say I&#39;m working on the respin here - Paolo suggest=
ed I remove the &quot;--gen&quot; arguments to mkvenv and generate the entr=
y point scripts conditionally at ensure time instead.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Good idea!</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">I ran into some problems with msys2, though, where the ent=
ry point scripts native to the system are binary .exe files I don&#39;t kno=
w how to recreate.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I hav=
e some research to do on windows perhaps to understand what&#39;s expected =
on that platform and how to achieve it.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I&#39;m hoping the fix is as easy as &quot;You can still us=
e console scripts, but you need to use the .py or .pyw suffix&quot;. I&#39;=
ll know shortly!</div><div dir=3D"auto"><br></div><div dir=3D"auto">If I do=
n&#39;t smooth over all the issues before Wednesday, though, I&#39;m going =
to be away from my desk for the rest of the week and may need to ask Paolo =
for help finishing up the polish so we can land this in a timely fashion so=
 we have a lot of runway to fix build issues before 8.1 rc0.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><=
/div>

--000000000000f52aaa05faa6b608--


