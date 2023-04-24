Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD46ED5D8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:05:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Ot-0007kI-RJ; Mon, 24 Apr 2023 16:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oq-0007eE-V8
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Om-0000wQ-Nw
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Jp4sSOMY60EtooONKVkiOxUacG9+ydPgVjXl9RGqV4=;
 b=Lgz5x6UYV4qLEDMZZ3tjkl6mCWNiicbG+rQjLy+ockWR0JsXgnztc9VRv4swKqTvSqvOoQ
 mnNAQ9IYh/WMTWaU9J55IZ7yIhXSdGr8hcpfTSFT3po/5tTr9FOghb/YYC9BS4jmDqc1TC
 KzTM1ZoMYyy43qI+iXRbsa9+ySD5M4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-L83aPjVKNW2QqDFOFQbehw-1; Mon, 24 Apr 2023 16:02:50 -0400
X-MC-Unique: L83aPjVKNW2QqDFOFQbehw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96C69185A791;
 Mon, 24 Apr 2023 20:02:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B51EA112131B;
 Mon, 24 Apr 2023 20:02:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v3 00/20] configure: create a python venv and ensure meson, sphinx
Date: Mon, 24 Apr 2023 16:02:28 -0400
Message-Id: <20230424200248.1183394-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/846869409=0D
           (All green, except Python self-tests, see below)=0D
=0D
This patch series creates a mandatory python virtual environment=0D
("venv") during configure time and uses it to ensure the availability of=0D
meson and sphinx.=0D
=0D
See https://www.qemu.org/2023/03/24/python/ for details. The summary is=0D
that the goal of this series is to ensure that the `python` used to run=0D
meson is the same `python` used to run Sphinx, tests, and any build-time=0D
python scripting we have. As it stands, meson and sphinx (and their=0D
extensions) *may* run in a different python environment than the one=0D
configured and chosen by the user at configure/build time.=0D
=0D
The effective change of this series is that QEMU will now=0D
unconditionally create a venv at configure-time and will ensure that=0D
meson (and sphinx, if docs are enabled) are available through that venv.=0D
=0D
Some important points as a pre-emptive "FAQ":=0D
=0D
- This venv is unconditionally created and lives at {build_dir}/pyvenv.=0D
=0D
- The python interpreter used by this venv is always the one identified=0D
  by configure. (Which in turn is always the one specified by --python=0D
  or $PYTHON)=0D
=0D
- *almost* all python scripts in qemu.git executed as part of the build=0D
  system, meson, sphinx, avocado tests, vm tests or CI are always=0D
  executed within this venv.=0D
=0D
  (iotests are not yet integrated; I plan to tackle this separately as a=0D
  follow-up in order to have a more tightly focused scope on that=0D
  series.)=0D
=0D
- It remains possible to build and test fully offline.=0D
  (In most cases, you just need meson and sphinx from your distro's repo.)=
=0D
=0D
- Distribution packaged 'meson' and 'sphinx' are still utilized whenever=0D
  possible as the highest preference.=0D
=0D
- Vendored versions of e.g. 'meson' are always preferred to PyPI=0D
  versions for speed, repeatability and ensuring tarball builds work=0D
  as-is offline.=0D
=0D
  (Sphinx will not be vendored, just like it already isn't.)=0D
=0D
- Missing dependencies, when possible, are fetched and installed=0D
  on-demand automatically to make developer environments "just work".=0D
=0D
- Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS,=0D
  Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere=0D
=0D
- No new dependencies (...for most platforms. Debian and NetBSD get an=0D
  asterisk.)=0D
=0D
- The meson git submodule is unused after this series and can be removed.=0D
=0D
For reviewers, here's how the series is broken up:=0D
=0D
Patch 1 is a testing pre-req. Note that even with this patch,=0D
'check-python-minreqs' and 'check-python-tox' CI jobs will both still=0D
fail on origin/master because this series requires 3.7+, but=0D
origin/master is currently still 3.6+.=0D
=0D
- python: update pylint configuration=0D
=0D
Patches 2-8 add the mkvenv script. The first patch checks in the barest=0D
essentials, and each subsequent patch adds a workaround or feature one=0D
at a time.=0D
=0D
- python: add mkvenv.py=0D
- mkvenv: add console script entry point generation=0D
- mkvenv: Add better error message for missing pyexapt module=0D
- mkvenv: generate console entry shims from inside the venv=0D
- mkvenv: work around broken pip installations on Debian 10=0D
- mkvenv: add nested venv workaround=0D
- mkvenv: add ensure subcommand=0D
=0D
Patches 9-11 modify our testing configuration to add new dependencies as=0D
needed.=0D
=0D
- tests/docker: add python3-venv dependency=0D
- tests/vm: Configure netbsd to use Python 3.10=0D
- tests/vm: add py310-expat to NetBSD=0D
=0D
Patch 12 changes how we package release tarballs.=0D
=0D
- scripts/make-release: download meson=3D=3D0.61.5 .whl=0D
=0D
Patches 13-16 wire mkvenv into configure and tests.=0D
=0D
- configure: create a python venv unconditionally=0D
- configure: use 'mkvenv ensure meson' to bootstrap meson=0D
- configure: add --enable-pypi and --disable-pypi=0D
- tests: Use configure-provided pyvenv for tests=0D
=0D
Patches 17-20 delegate Sphinx bootstrapping to mkvenv. Some of these=0D
changes could be folded earlier in the series (like the diagnose()=0D
patch), but I'm keeping it separate for review for now.=0D
=0D
- configure: move --enable-docs and --disable-docs back to configure=0D
- mkvenv: add diagnose() method for ensure() failures=0D
- configure: use --diagnose option with meson ensure=0D
- configure: bootstrap sphinx with mkvenv=0D
=0D
That's all for now, seeya!=0D
--js=0D
=0D
John Snow (20):=0D
  python: update pylint configuration=0D
  python: add mkvenv.py=0D
  mkvenv: add console script entry point generation=0D
  mkvenv: Add better error message for missing pyexpat module=0D
  mkvenv: generate console entry shims from inside the venv=0D
  mkvenv: work around broken pip installations on Debian 10=0D
  mkvenv: add nested venv workaround=0D
  mkvenv: add ensure subcommand=0D
  tests/docker: add python3-venv dependency=0D
  tests/vm: Configure netbsd to use Python 3.10=0D
  tests/vm: add py310-expat to NetBSD=0D
  scripts/make-release: download meson=3D=3D0.61.5 .whl=0D
  configure: create a python venv unconditionally=0D
  configure: use 'mkvenv ensure meson' to bootstrap meson=0D
  configure: add --enable-pypi and --disable-pypi=0D
  tests: Use configure-provided pyvenv for tests=0D
  configure: move --enable-docs and --disable-docs back to configure=0D
  mkvenv: add diagnose() method for ensure() failures=0D
  configure: use --diagnose option with meson ensure=0D
  configure: bootstrap sphinx with mkvenv=0D
=0D
 docs/devel/acpi-bits.rst                      |   6 +-=0D
 docs/devel/testing.rst                        |  14 +-=0D
 configure                                     | 139 +--=0D
 .gitlab-ci.d/buildtest-template.yml           |   4 +-=0D
 .gitlab-ci.d/buildtest.yml                    |   6 +-=0D
 python/scripts/mkvenv.py                      | 871 ++++++++++++++++++=0D
 python/setup.cfg                              |  10 +=0D
 python/tests/flake8.sh                        |   1 +=0D
 python/tests/isort.sh                         |   1 +=0D
 python/tests/mypy.sh                          |   1 +=0D
 python/tests/pylint.sh                        |   1 +=0D
 .../org.centos/stream/8/x86_64/test-avocado   |   4 +-=0D
 scripts/device-crash-test                     |   2 +-=0D
 scripts/make-release                          |  11 +=0D
 tests/Makefile.include                        |  10 +-=0D
 .../dockerfiles/debian-all-test-cross.docker  |   3 +-=0D
 .../dockerfiles/debian-hexagon-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-riscv64-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-tricore-cross.docker   |   3 +-=0D
 tests/requirements.txt                        |   7 +-=0D
 tests/vm/netbsd                               |   2 +=0D
 21 files changed, 1016 insertions(+), 86 deletions(-)=0D
 create mode 100644 python/scripts/mkvenv.py=0D
=0D
-- =0D
2.39.2=0D
=0D


