Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490746E1C13
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:57:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCP5-0007Pu-Pr; Fri, 14 Apr 2023 01:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOx-0007MZ-MJ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOk-0000Ii-6p
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r7EXu/SpUHafSFNowobPa+R1hJQJ5a/ZkPgJMNtgO/8=;
 b=U3r3+D0035U8U4BgyFCOPOoUVgoYnTPmFTKvH9gtQN8rppjfwLPU04J7MSsqgeuk0OonHk
 UZZP9G3Ajlg9TuycbPdRI+BBjTUMfZcPHoQ8dJM44/8bRGWMQOlHXJMMRoxgvWnpuXOEfG
 T7YiEJlHr+f3p+7fW5zh0AlzswWsO0w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-4wOsT7tOM3G5PiLcj2dXbA-1; Fri, 14 Apr 2023 01:54:50 -0400
X-MC-Unique: 4wOsT7tOM3G5PiLcj2dXbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 731CF855300;
 Fri, 14 Apr 2023 05:54:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAC50C1602A;
 Fri, 14 Apr 2023 05:54:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 00/10] configure: create a python venv and install meson
Date: Fri, 14 Apr 2023 01:54:39 -0400
Message-Id: <20230414055449.4028284-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/836855908=0D
           (All green. phew.)=0D
=0D
(This is a quick V2 RFC to freshen the patches on the list and=0D
consolidate some fixes made so far. See changes below.)=0D
=0D
This patch series creates a mandatory venv during configure time and=0D
uses it to install meson.=0D
=0D
The eventual goal of all of this is to ensure that the Python used to=0D
run meson is the same Python used to run Sphinx, tests, and any=0D
build-time scripting we have. As it stands, meson and sphinx (and their=0D
extensions) may run in a different Python environment than the one=0D
configured and chosen by the user at configure/build time.=0D
=0D
We can ensure that everything uses the same Python and has the same=0D
packages available with a bit of up-front work. See=0D
https://www.qemu.org/2023/03/24/python/ for more information.=0D
=0D
Changes in V2:=0D
=0D
- Each workaround in mkvenv is added in a separate patch now to better=0D
  isolate parts of the design and what they were added to address.=0D
- Introduction into configure is split into two parts, the first of=0D
  which is quite a bit cleaner and introduces a lot less logic into the=0D
  configure file.=0D
- Avocado tests now use the configure-time venv.=0D
- Python 3.7 now works unconditionally without new dependencies, though=0D
  we might drop it in favor of 3.8 soon. "Just in case", I suppose.=0D
- msys2 CI jobs now pass - there was a bug in the os.chmod call under=0D
  windows.=0D
- NetBSD now works; mkvenv.py has better diagnostics for detecting=0D
  NetBSD edge cases.=0D
=0D
Changes yet to come for further revisions to this series:=0D
=0D
- Need to add Sphinx support.=0D
- Need to add nested venv support.=0D
- PyPI support? (To drop meson git submodule?)=0D
- Installing meson from vendored .whl files for tarballs?=0D
  (To drop --no-use-pep517 hack?)=0D
=0D
John Snow (10):=0D
  python: add mkvenv.py=0D
  tests: add python3-venv dependency=0D
  mkvenv: Add better error message for missing pyexapt module=0D
  tests/vm: Configure netbsd to use Python 3.10=0D
  tests/vm: add py310-expat to NetBSD=0D
  mkvenv: generate console entry shims from inside the venv=0D
  mkvenv: work around broken pip installations on Debian 10=0D
  configure: create a python venv unconditionally=0D
  configure: remove --meson=3D; install meson to the pyvenv=0D
  tests: Use configure-provided pyvenv for tests=0D
=0D
 docs/devel/acpi-bits.rst                      |   6 +-=0D
 docs/devel/testing.rst                        |  14 +-=0D
 configure                                     | 138 ++++--=0D
 .gitlab-ci.d/buildtest-template.yml           |   4 +-=0D
 .gitlab-ci.d/buildtest.yml                    |   6 +-=0D
 python/scripts/mkvenv.py                      | 466 ++++++++++++++++++=0D
 .../org.centos/stream/8/x86_64/test-avocado   |   4 +-=0D
 scripts/device-crash-test                     |   2 +-=0D
 tests/Makefile.include                        |  10 +-=0D
 .../dockerfiles/debian-all-test-cross.docker  |   3 +-=0D
 .../dockerfiles/debian-hexagon-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-riscv64-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-tricore-cross.docker   |   3 +-=0D
 tests/requirements.txt                        |   7 +-=0D
 tests/vm/netbsd                               |   2 +=0D
 15 files changed, 590 insertions(+), 81 deletions(-)=0D
 create mode 100644 python/scripts/mkvenv.py=0D
=0D
-- =0D
2.39.2=0D
=0D


