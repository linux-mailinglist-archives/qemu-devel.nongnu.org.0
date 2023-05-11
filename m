Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED66FEA6B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:57:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOA-0007W9-4F; Wed, 10 May 2023 23:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxO7-0007Vp-OW
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxO5-0005Iw-E2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xJlg9JyzyR7szAd7WwY8KbUFR6rj7CNXRSYZjvK/b5M=;
 b=fiZSzG36T7Q/C2kEoQeYI/EmjBHFfeEiXiWoGLsQI6+VzazyWbtLQOfoNq5aH3tHFEAx/e
 5XIEn3+3Dd+XQDS0R0qnMltYeQh+f28fvxT0c8vdsJ9ztFSKJrDEmK43u9nB5zsAcdc5/L
 y7ROg07+j0bsuobLeA+VFOGs4H2yh2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-BHyl-oHHOy2R58kecM_L_Q-1; Wed, 10 May 2023 23:54:37 -0400
X-MC-Unique: BHyl-oHHOy2R58kecM_L_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7128101A531;
 Thu, 11 May 2023 03:54:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D545C40C2076;
 Thu, 11 May 2023 03:54:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 00/27] configure: create a python venv and ensure meson, sphinx
Date: Wed, 10 May 2023 23:54:08 -0400
Message-Id: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This patch series creates a mandatory python virtual environment=0D
("venv") during configure time and uses it to ensure the availability of=0D
meson and sphinx.=0D
=0D
See https://www.qemu.org/2023/03/24/python/ for motivations. The summary=0D
is that the goal of this series is to ensure that the `python` used to=0D
run meson is the same `python` used to run Sphinx, tests, and any=0D
build-time python scripting we have. As it stands, meson and sphinx (and=0D
their extensions) *may* run in a different python environment than the=0D
one configured and chosen by the user at configure/build time.=0D
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
- Works for Python 3.6 and up, on Fedora, OpenSuSE, Red Hat, CentOS,=0D
  Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere=0D
=0D
- No new dependencies (...for most platforms. Debian and NetBSD get an=0D
  asterisk.)=0D
=0D
- The meson git submodule is unused after this series and can be removed.=0D
=0D
... I could write more, and I'm sure there's a few things that need=0D
buffing out or changing here and there, but I think it's largely good.=0D
=0D
So, enjoy!=0D
=0D
~js=0D
=0D
John Snow (22):=0D
  python: update pylint configuration=0D
  python: add mkvenv.py=0D
  mkvenv: add better error message for missing pyexpat module=0D
  mkvenv: add nested venv workaround=0D
  mkvenv: add ensure subcommand=0D
  mkvenv: add diagnose() method for ensure() failures=0D
  mkvenv: add console script entry point generation=0D
  mkvenv: work around broken pip installations on Debian 10=0D
  tests/docker: add python3-venv dependency=0D
  tests/vm: Configure netbsd to use Python 3.10=0D
  tests/vm: add py310-expat to NetBSD=0D
  python: add vendor.py utility=0D
  configure: create a python venv unconditionally=0D
  python/wheels: add vendored meson package=0D
  configure: use 'mkvenv ensure meson' to bootstrap meson=0D
  qemu.git: drop meson git submodule=0D
  tests: Use configure-provided pyvenv for tests=0D
  configure: move --enable-docs and --disable-docs back to configure=0D
  configure: bootstrap sphinx with mkvenv=0D
  configure: add --enable-pypi and --disable-pypi=0D
  configure: Add courtesy hint to Python version failure message=0D
  mkvenv.py: experiment; use distlib to generate script entry points=0D
=0D
Paolo Bonzini (5):=0D
  python: shut up "pip install" during "make check-minreqs"=0D
  mkvenv: create pip binary in virtual environment=0D
  Python: Drop support for Python 3.6=0D
  mkvenv: mark command as required=0D
  python: bump some of the dependencies=0D
=0D
 docs/about/build-platforms.rst                |   2 +-=0D
 docs/conf.py                                  |   9 -=0D
 docs/devel/acpi-bits.rst                      |   6 +-=0D
 docs/devel/testing.rst                        |  14 +-=0D
 docs/meson.build                              |   2 +-=0D
 configure                                     | 155 ++--=0D
 .gitlab-ci.d/buildtest-template.yml           |   4 +-=0D
 .gitlab-ci.d/buildtest.yml                    |   6 +-=0D
 .gitmodules                                   |   3 -=0D
 meson                                         |   1 -=0D
 meson_options.txt                             |   2 -=0D
 python/Makefile                               |  19 +-=0D
 python/scripts/mkvenv.py                      | 858 ++++++++++++++++++=0D
 python/scripts/vendor.py                      |  74 ++=0D
 python/setup.cfg                              |  27 +-=0D
 python/tests/flake8.sh                        |   1 +=0D
 python/tests/isort.sh                         |   1 +=0D
 python/tests/minreqs.txt                      |  16 +-=0D
 python/tests/mypy.sh                          |   1 +=0D
 python/tests/pylint.sh                        |   1 +=0D
 python/wheels/meson-0.61.5-py3-none-any.whl   | Bin 0 -> 862509 bytes=0D
 .../org.centos/stream/8/x86_64/test-avocado   |   4 +-=0D
 scripts/device-crash-test                     |   2 +-=0D
 scripts/meson-buildoptions.sh                 |   3 -=0D
 scripts/qapi/mypy.ini                         |   2 +-=0D
 tests/Makefile.include                        |  10 +-=0D
 .../dockerfiles/debian-all-test-cross.docker  |   3 +-=0D
 .../dockerfiles/debian-hexagon-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-riscv64-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-tricore-cross.docker   |   3 +-=0D
 tests/requirements.txt                        |   7 +-=0D
 tests/vm/netbsd                               |   2 +=0D
 32 files changed, 1108 insertions(+), 136 deletions(-)=0D
 delete mode 160000 meson=0D
 create mode 100644 python/scripts/mkvenv.py=0D
 create mode 100755 python/scripts/vendor.py=0D
 create mode 100644 python/wheels/meson-0.61.5-py3-none-any.whl=0D
=0D
-- =0D
2.40.0=0D
=0D


