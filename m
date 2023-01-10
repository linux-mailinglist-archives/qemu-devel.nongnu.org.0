Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F7664578
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEeo-0001JA-TL; Tue, 10 Jan 2023 08:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFEem-0001IT-0M
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFEek-0003Zd-D0
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673357229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ku7fbhXlVFbfROtZyAeEocNZHybZTKaGUbi1YrKHmqI=;
 b=VIeOP77dxKWrG8G2d3pE++AjsUIMxEqjClHgPK3+yJAWq8RyLrSDIKw3mhNFelVsCtVqvB
 L7cnwE0vOJ2utpuhw+OrD0/lHKlEREhbuvQtGaSl+RZ+tpxdFVTy/pngpVxDfTUgZSese7
 dKgqJyXutpUAajum7/ZoQ9ikUiuVeo4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-s9k0HTk1PHCoFVdZ-LExpA-1; Tue, 10 Jan 2023 08:27:06 -0500
X-MC-Unique: s9k0HTk1PHCoFVdZ-LExpA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43C7185D061;
 Tue, 10 Jan 2023 13:27:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1910F422F2;
 Tue, 10 Jan 2023 13:27:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, kraxel@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, thuth@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>, Michael Roth <michael.roth@amd.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: [PATCH v4 0/8] Fix win32/msys2 shader compilation & update lcitool
 deps
Date: Tue, 10 Jan 2023 17:26:52 +0400
Message-Id: <20230110132700.833690-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

Fix the shader compilation error on win32/msys2 and convert the related script
from perl to python. Drop unneeded dependencies from lcitool project.

v4:
- remove -x from python script, to fix the build on FreeBSD
- add more commoent on lcitool update patch
- add some rb/tb tags

v3:
- split lcitool & f37 update
- fix sed portability usage, add back trailing $ in the regex
- add some patches to drop texinfo references/deps

v2:
- add a few patches to drop perl from the build dependencies
- add some tags for v1 patches
- add copyright header to the python script

Marc-André Lureau (8):
  build-sys: fix crlf-ending C code
  .gitlab-ci.d/windows: do not disable opengl
  configure: replace Perl usage with sed
  meson: replace Perl usage with Python
  docs: drop texinfo options
  Update lcitool and fedora to 37
  lcitool: drop perl from QEMU project/dependencies
  lcitool: drop texinfo from QEMU project/dependencies

 docs/conf.py                                  | 13 ----------
 configure                                     |  8 +++---
 meson.build                                   |  2 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |  2 +-
 .gitlab-ci.d/windows.yml                      |  5 ++--
 scripts/ci/setup/build-environment.yml        |  1 -
 scripts/shaderinclude.pl                      | 16 ------------
 scripts/shaderinclude.py                      | 26 +++++++++++++++++++
 tests/docker/dockerfiles/alpine.docker        |  2 --
 tests/docker/dockerfiles/centos8.docker       |  2 --
 .../dockerfiles/debian-amd64-cross.docker     |  4 +--
 tests/docker/dockerfiles/debian-amd64.docker  |  2 --
 .../dockerfiles/debian-arm64-cross.docker     |  4 +--
 .../dockerfiles/debian-armel-cross.docker     |  4 +--
 .../dockerfiles/debian-armhf-cross.docker     |  4 +--
 .../dockerfiles/debian-mips64el-cross.docker  |  4 +--
 .../dockerfiles/debian-mipsel-cross.docker    |  4 +--
 .../dockerfiles/debian-ppc64el-cross.docker   |  4 +--
 .../dockerfiles/debian-s390x-cross.docker     |  4 +--
 .../dockerfiles/debian-toolchain.docker       |  1 -
 .../dockerfiles/debian-tricore-cross.docker   |  1 -
 .../dockerfiles/fedora-win32-cross.docker     |  6 ++---
 .../dockerfiles/fedora-win64-cross.docker     |  6 ++---
 tests/docker/dockerfiles/fedora.docker        |  6 ++---
 tests/docker/dockerfiles/opensuse-leap.docker |  2 --
 tests/docker/dockerfiles/ubuntu2004.docker    |  2 --
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               |  2 --
 tests/lcitool/refresh                         |  6 ++---
 tests/qapi-schema/meson.build                 |  7 ++---
 tests/vm/centos.aarch64                       |  2 +-
 33 files changed, 58 insertions(+), 100 deletions(-)
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

-- 
2.39.0


