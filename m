Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904516A5F50
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5K0-0002OO-IM; Tue, 28 Feb 2023 14:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JS-0002FN-2d
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JP-0002lC-VA
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:06:57 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so6514512wmq.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pNw3gtLKESA+yujugjp3Vva8jq64Boa6Nj71pPxF2gk=;
 b=TLzgPiAVUlMA4wLoAy4fHu0k/5uqWfWOzeYKPiTDyelDXDc5hMAX+4y+yvr0rEvHBT
 KUyjcXFTQmbr9rE7iZ8mZbkbZrrJOj1h/fejPgfxotIDR0o0ruZ3bQfGueIFLPkr6B2c
 xZ8ZstWTBDbGvL1GAoOZKsrsxsaifbM3dftXcTgskq1TqGpxXQZvXUtNb2UkgsljC9XK
 cj839bV/0NJimyo3ZjbrgPiYmJkC4kWeM65qk6PcwdpXZ5aW1G8gXlrl3Frl8NsHXgnk
 urSzcSENSSKxcIzQw16SdgzJ11N7hb+5d5URcFTd3GNBCqWerOTJsF4XTOxM2Dmnadbd
 N1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pNw3gtLKESA+yujugjp3Vva8jq64Boa6Nj71pPxF2gk=;
 b=Xp3mDnEO8vJGelb8hXPA8QcIb3zcU+yyivTQBMeJrpp/Km/RkBK7deykSpUt9wGekd
 JfM88AJblygxG2ozjvMQHH1o3dr1b5MRuLYMQsRP7C5X9qGw5kR1r9M4P7tdT67yFKTX
 +Ek2sISPRgIJPVmmkEuoxP52LlBk7Zrh7diMJNDBUQCgMblGbHpQfE98urCS3WWAKBFZ
 z80NNvB8su76vJMR5qDZ/8Jj+dAXrjvv06pDiVTdz8e5aH8TOoVDC1zCZ3VsOJkgwQm9
 XCrolN3+GNqPiRSY5fdyjz3IUX2H35t2H7pKZRzD+6ucucGN+GveT5lnNz2A923BVEel
 uPHQ==
X-Gm-Message-State: AO0yUKWNc9Xz22wnZ0nah6v+YrauTZ6dnqVCW2DgBL6JCaJVker1xNWK
 sWZEr3RnCP3QcKLGAvbgOeIYhA==
X-Google-Smtp-Source: AK7set9iSBj8l6CzRTMAEKTwE9bUZNZw+SO0IUUreGVN8sHIu7i6R10Jn7jifdo4YIMsNFOnMMxMSw==
X-Received: by 2002:a05:600c:1715:b0:3ea:bc08:b63e with SMTP id
 c21-20020a05600c171500b003eabc08b63emr3289971wmn.2.1677611213924; 
 Tue, 28 Feb 2023 11:06:53 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm10502915wrr.6.2023.02.28.11.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2799B1FFB7;
 Tue, 28 Feb 2023 19:06:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 00/24] testing/next: docker, avocado, unit, gitlab
Date: Tue, 28 Feb 2023 19:06:29 +0000
Message-Id: <20230228190653.1602033-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Since the last posting I've reincorporated my last PR (as it needed
re-basing to merge). The new patches all attempt to reduce the CI load
by a little more. I've also picked up patches from Fabinao and
Richard WMJ.

The following patches need review:

tests/avocado: disable BootLinuxPPC64 test in CI
tests/docker: add zstdtools to the images (!AWAITING UPSTREAM)
gitlab: move the majority of artefact handling to a template
tests/lcitool: append user setting stanza to dockerfiles

Alex Bennée (19):
  tests: don't run socat tests on MacOS as well
  tests: add socat dependency for tests
  tests: be a bit more strict cleaning up fifos
  tests: make fp-test less chatty when running from test suite
  gitlab: extend custom runners with base_job_template
  tests: don't run benchmarks for the tsan build
  testing: update ubuntu2004 to ubuntu2204
  tests: skip the nios2 replay_kernel test
  tests: add tuxrun baseline test to avocado
  tests: ensure we export job results for some cross builds
  tests/dockerfiles: unify debian-toolchain references
  configure: expose the direct container command
  tests/lcitool: append user setting stanza to dockerfiles
  tests/docker: add USER stanzas to non-lci images
  tests/docker: use direct RUNC call to build containers
  tests/docker: use direct RUNC call to run test jobs
  gitlab: move the majority of artefact handling to a template
  tests/docker: add zstdtools to the images (!AWAITING UPSTREAM)
  tests/avocado: disable BootLinuxPPC64 test in CI

Bastian Koppelmann (1):
  tests/docker: Use binaries for debian-tricore-cross

Fabiano Rosas (1):
  gitlab: Use plain docker in container-template.yml

Richard W.M. Jones (1):
  tests: Ensure TAP version is printed before other messages

Thomas Huth (2):
  gitlab-ci: Use artifacts instead of dumping logs in the Cirrus-CI jobs
  cirrus.yml: Improve the windows_msys2_task

 MAINTAINERS                                   |   1 +
 docs/devel/testing.rst                        |   4 +-
 configure                                     |   3 +
 tests/tcg/tricore/macros.h                    |   2 +-
 tests/fp/fp-test.c                            |  19 +-
 tests/qtest/fuzz-lsi53c895a-test.c            |   4 +-
 tests/qtest/rtl8139-test.c                    |   3 +-
 tests/unit/test-io-channel-command.c          |  10 +-
 .cirrus.yml                                   |   8 +-
 .gitlab-ci.d/buildtest-template.yml           |  16 +
 .gitlab-ci.d/buildtest.yml                    | 100 ++---
 .gitlab-ci.d/cirrus/build.yml                 |   7 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 .gitlab-ci.d/container-template.yml           |   9 +-
 .gitlab-ci.d/containers.yml                   |   4 +-
 .gitlab-ci.d/crossbuild-template.yml          |  11 +
 .gitlab-ci.d/crossbuilds.yml                  |  12 +-
 .gitlab-ci.d/custom-runners.yml               |   3 +-
 .../custom-runners/ubuntu-20.04-s390x.yml     |  10 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  10 +-
 tests/avocado/boot_linux.py                   |   4 +
 tests/avocado/replay_kernel.py                |   1 +
 tests/avocado/tuxrun_baselines.py             | 423 ++++++++++++++++++
 tests/docker/Makefile.include                 |  28 +-
 tests/docker/dockerfiles/alpine.docker        |   7 +
 tests/docker/dockerfiles/centos8.docker       |   9 +-
 .../dockerfiles/debian-all-test-cross.docker  |   5 +
 .../dockerfiles/debian-alpha-cross.docker     |   5 +
 .../dockerfiles/debian-amd64-cross.docker     |   9 +-
 tests/docker/dockerfiles/debian-amd64.docker  |   9 +-
 .../dockerfiles/debian-arm64-cross.docker     |   9 +-
 .../dockerfiles/debian-armel-cross.docker     |   9 +-
 .../dockerfiles/debian-armhf-cross.docker     |   9 +-
 .../dockerfiles/debian-hexagon-cross.docker   |   5 +
 .../dockerfiles/debian-hppa-cross.docker      |   5 +
 .../dockerfiles/debian-loongarch-cross.docker |   5 +
 .../dockerfiles/debian-m68k-cross.docker      |   5 +
 .../dockerfiles/debian-mips-cross.docker      |   5 +
 .../dockerfiles/debian-mips64-cross.docker    |   5 +
 .../dockerfiles/debian-mips64el-cross.docker  |   9 +-
 .../dockerfiles/debian-mipsel-cross.docker    |   9 +-
 tests/docker/dockerfiles/debian-native.docker |   5 +
 .../debian-powerpc-test-cross.docker          |   6 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |   9 +-
 .../dockerfiles/debian-riscv64-cross.docker   |   5 +
 .../debian-riscv64-test-cross.docker          |   5 +
 .../dockerfiles/debian-s390x-cross.docker     |   9 +-
 .../dockerfiles/debian-sh4-cross.docker       |   5 +
 .../dockerfiles/debian-sparc64-cross.docker   |   5 +
 .../dockerfiles/debian-toolchain.docker       |   9 +-
 .../dockerfiles/debian-tricore-cross.docker   |  15 +-
 .../dockerfiles/debian-xtensa-cross.docker    |   5 +
 .../dockerfiles/fedora-cris-cross.docker      |   5 +
 .../dockerfiles/fedora-i386-cross.docker      |   5 +
 .../dockerfiles/fedora-win32-cross.docker     |   9 +-
 .../dockerfiles/fedora-win64-cross.docker     |   9 +-
 tests/docker/dockerfiles/fedora.docker        |   9 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   9 +-
 tests/docker/dockerfiles/python.docker        |   5 +
 tests/docker/dockerfiles/ubuntu2004.docker    |  12 +-
 tests/docker/dockerfiles/ubuntu2204.docker    | 153 +++++++
 tests/docker/test-tsan                        |   2 +-
 tests/fp/berkeley-testfloat-3                 |   2 +-
 tests/fp/meson.build                          |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 +
 tests/lcitool/refresh                         |  26 +-
 tests/tcg/tricore/Makefile.softmmu-target     |   6 +-
 70 files changed, 994 insertions(+), 159 deletions(-)
 create mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100644 tests/docker/dockerfiles/ubuntu2204.docker

-- 
2.39.2


