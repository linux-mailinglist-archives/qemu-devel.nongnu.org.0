Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E96D6A6F2C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:18:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOCJ-0000Hy-Ot; Wed, 01 Mar 2023 10:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBg-00087j-Df
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBb-0007b9-LE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id p16so8794654wmq.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SiErJVfW9fH1m8vM2oH4qOkipVdpDIGxMjTO/6cOb7c=;
 b=DlxLuainAwsYQoRnN3gwAtS9bL0u08dmBs9BMaf7wun6SLOfMAKVWEFUJ0qOCq/5v1
 ZlMPADQ8SGn6xa2FjISycpJWqWyVSmzbIdF0/8e7m8IfeXyfLH2b51F19aUy8FfMZh/i
 22hwXywfeyfRB0TaJXYZHxo82wG1DhcUObS2qjAuPTCmd+cs3aVJuKF41xCIKOMay1Yl
 BsAqosV/B9Ng3QaQMtKyoKAiUFXAqR5nhCIfjDuf1z0gOK88xs4Q3jSA3Tyo0DV2vw/V
 3G1kpHcKZl1/0nNb0FZ8qPuORQXBm7IWN6cBcORPVRIVYRLHbgX/hz0q1jtbahEEUnv1
 vcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SiErJVfW9fH1m8vM2oH4qOkipVdpDIGxMjTO/6cOb7c=;
 b=umlS/3j/fOl15lFOOzXl2yrHE3EQRf21l92TpF3NoeUy1lJVZQGW5R4BN0CceSt03W
 tJmLGjdErchTFj3f2nWwdwNX5izNTVUzHHTHyzTsgj9PFEr28NJrWIqZkvBGe1F76nbN
 o9pdPJ+QPJnQZJQtqyvd5r9HdRAsg+iV6LPu5SL4OMs445JjuOLQPeVmgDJHjsG3SL8X
 ODCM2egQJENUf/Iko9TcfAQ0jltPlyhc2xLEEjs7jgrRxHeLLiIettCPkRDzyb/qatQL
 Ahe8weeUJSVQ6F1hgUGnMOGgndgG8M1XnA+LkX5qA9TzT17fdSkk1gzSbAbfAQbTLHou
 atiQ==
X-Gm-Message-State: AO0yUKXX4zPzJUpvpapyxyk/s1mn29jOcDxoy1s+pCtoWAylYKq8MlkP
 qcaZLkzpoNQEKzd3SFTuMIQE1g==
X-Google-Smtp-Source: AK7set88FdAEjziLuPm0pLnSJGXiIqSJA7R2reu8eN8ee63IbWI+zv7jveNrH+eGtRgZrW4msqk+Zw==
X-Received: by 2002:a05:600c:474e:b0:3ea:f6c4:305e with SMTP id
 w14-20020a05600c474e00b003eaf6c4305emr5694872wmo.38.1677683765364; 
 Wed, 01 Mar 2023 07:16:05 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002c5544b3a69sm12574474wrx.89.2023.03.01.07.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86CF01FFB7;
 Wed,  1 Mar 2023 15:16:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
Date: Wed,  1 Mar 2023 15:15:40 +0000
Message-Id: <20230301151604.1948813-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:

  Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1

for you to fetch changes up to c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb:

  tests/avocado: disable BootLinuxPPC64 test in CI (2023-03-01 12:51:01 +0000)

----------------------------------------------------------------
testing updates:

  - ensure socat available for tests
  - skip socat tests for MacOS
  - properly clean up fifos after use
  - make fp-test less chatty
  - store test artefacts on Cirrus
  - control custom runners with QEMU_CI knobs
  - disable benchmark runs under tsan build
  - update ubuntu 2004 to 2204
  - skip nios2 kernel replay test
  - add tuxrun baselines to avocado
  - binary build of tricore tools
  - export test results on cross builds
  - improve windows builds
  - ensure we properly print TAP headers
  - migrate away from docker.py for building containers
  - be more efficient in our handling of build artefacts between stages
  - enable ztsd in containers so we can run tux_baselines
  - disable heavyweight PPC64 Boot Linux test in CI

----------------------------------------------------------------
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
      tests/docker: add zstdtools to the images
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

 MAINTAINERS                                        |   1 +
 docs/devel/testing.rst                             |   4 +-
 configure                                          |   3 +
 tests/tcg/tricore/macros.h                         |   2 +-
 tests/fp/fp-test.c                                 |  19 +-
 tests/qtest/fuzz-lsi53c895a-test.c                 |   4 +-
 tests/qtest/rtl8139-test.c                         |   3 +-
 tests/unit/test-io-channel-command.c               |  10 +-
 .cirrus.yml                                        |   8 +-
 .gitlab-ci.d/buildtest-template.yml                |  16 +
 .gitlab-ci.d/buildtest.yml                         | 100 ++---
 .gitlab-ci.d/cirrus/build.yml                      |   7 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                  |   2 +-
 .gitlab-ci.d/container-template.yml                |   9 +-
 .gitlab-ci.d/containers.yml                        |   4 +-
 .gitlab-ci.d/crossbuild-template.yml               |  11 +
 .gitlab-ci.d/crossbuilds.yml                       |  12 +-
 .gitlab-ci.d/custom-runners.yml                    |   3 +-
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml |  10 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml        |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml        |  10 +-
 tests/avocado/boot_linux.py                        |   3 +
 tests/avocado/replay_kernel.py                     |   1 +
 tests/avocado/tuxrun_baselines.py                  | 423 +++++++++++++++++++++
 tests/docker/Makefile.include                      |  28 +-
 tests/docker/dockerfiles/alpine.docker             |   7 +
 tests/docker/dockerfiles/centos8.docker            |   9 +-
 .../dockerfiles/debian-all-test-cross.docker       |   5 +
 tests/docker/dockerfiles/debian-alpha-cross.docker |   5 +
 tests/docker/dockerfiles/debian-amd64-cross.docker |   9 +-
 tests/docker/dockerfiles/debian-amd64.docker       |   9 +-
 tests/docker/dockerfiles/debian-arm64-cross.docker |   9 +-
 tests/docker/dockerfiles/debian-armel-cross.docker |   9 +-
 tests/docker/dockerfiles/debian-armhf-cross.docker |   9 +-
 .../docker/dockerfiles/debian-hexagon-cross.docker |   5 +
 tests/docker/dockerfiles/debian-hppa-cross.docker  |   5 +
 .../dockerfiles/debian-loongarch-cross.docker      |   5 +
 tests/docker/dockerfiles/debian-m68k-cross.docker  |   5 +
 tests/docker/dockerfiles/debian-mips-cross.docker  |   5 +
 .../docker/dockerfiles/debian-mips64-cross.docker  |   5 +
 .../dockerfiles/debian-mips64el-cross.docker       |   9 +-
 .../docker/dockerfiles/debian-mipsel-cross.docker  |   9 +-
 tests/docker/dockerfiles/debian-native.docker      |   5 +
 .../dockerfiles/debian-powerpc-test-cross.docker   |   6 +-
 .../docker/dockerfiles/debian-ppc64el-cross.docker |   9 +-
 .../docker/dockerfiles/debian-riscv64-cross.docker |   5 +
 .../dockerfiles/debian-riscv64-test-cross.docker   |   5 +
 tests/docker/dockerfiles/debian-s390x-cross.docker |   9 +-
 tests/docker/dockerfiles/debian-sh4-cross.docker   |   5 +
 .../docker/dockerfiles/debian-sparc64-cross.docker |   5 +
 tests/docker/dockerfiles/debian-toolchain.docker   |   9 +-
 .../docker/dockerfiles/debian-tricore-cross.docker |  15 +-
 .../docker/dockerfiles/debian-xtensa-cross.docker  |   5 +
 tests/docker/dockerfiles/fedora-cris-cross.docker  |   5 +
 tests/docker/dockerfiles/fedora-i386-cross.docker  |   5 +
 tests/docker/dockerfiles/fedora-win32-cross.docker |   9 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker |   9 +-
 tests/docker/dockerfiles/fedora.docker             |   9 +-
 tests/docker/dockerfiles/opensuse-leap.docker      |   9 +-
 tests/docker/dockerfiles/python.docker             |   5 +
 tests/docker/dockerfiles/ubuntu2004.docker         |  12 +-
 tests/docker/dockerfiles/ubuntu2204.docker         | 153 ++++++++
 tests/docker/test-tsan                             |   2 +-
 tests/fp/berkeley-testfloat-3                      |   2 +-
 tests/fp/meson.build                               |   2 +-
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/projects/qemu.yml                    |   2 +
 tests/lcitool/refresh                              |  26 +-
 tests/tcg/tricore/Makefile.softmmu-target          |   6 +-
 71 files changed, 994 insertions(+), 160 deletions(-)
 create mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100644 tests/docker/dockerfiles/ubuntu2204.docker

-- 
2.39.2


