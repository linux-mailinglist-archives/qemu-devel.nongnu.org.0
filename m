Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD076A0D73
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyP-0000QU-DO; Thu, 23 Feb 2023 10:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyK-0008R9-Jn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:28 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyG-0004iI-Sh
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so6704000wmq.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j6baHhmm5iVYx+QFlI2MHWKrng0tw0sxBOFXGC38KHw=;
 b=MiNgqvCGSXD8wn/MddfRsHdnoRnKULuwpHLlnmzhWEfMZfcfcnT4NnhwFbBNR9Iaqa
 z04zoy8ID2qrqT58gK4udXc8/eF5jf/nkX+rVJqRMtGV391pF/N7ltWDxAp1SIKES6Xt
 SubcVgMNPsOaYJFu9/hWyLpxhYeiuM3N8C70UAAdee5PPeWbei+WCtZNS5CiEIaPv9Vt
 eJesHgk0srb+prhzOYO0apYrfaHw/KcbK1rDAIEPF8h2aN/tUH8ES6lq79pZoJOCd+l2
 GCw7fPrR3xeZcIxAAsOfdGm9wbhhJXXeoAUjCHQZvoEyD9jmbhWW8gGK+0meEIGbVJgj
 DXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j6baHhmm5iVYx+QFlI2MHWKrng0tw0sxBOFXGC38KHw=;
 b=agqqj9u24VPeX9H5896hiVumbsxziOzWHAk+hnnD5VTbu0iHYtoqZsvuUy99bgeHc1
 QGnnSsowTC4Ojzwg5IemhgkZsnSTacLH0XEsQT1Ld4+2qN/glnZ50OIx/EEhT6D3Dzab
 wnBamABfeTkb+npC5Sw4nWhxXYRLsTBECAoLGyLdbhMxyYe4jS52gfTOFO3fHgRi57SI
 /ZxQmZfZE0odJeyQF3C0Budswzbn3l/mPVeZNnX8l9uXneW5CHofudzfZONcKXQhg1nh
 E8FP2ED7mwpInh9iy3EAC0Cv2CmQapisWUMKmHjq9TVvNcrOhFaINpiyr6F27a9GzWtd
 Mwyw==
X-Gm-Message-State: AO0yUKVlRjI6ni9fVp9wB2lcixAo+GN7PM7DZU56xHVK/4ew0qd45RGk
 ZWBbFOEJwbGAXvFxu+7fCdx4iLw/kuecg04X
X-Google-Smtp-Source: AK7set9mNCck3IiERZBWgSkRvYGz7anV5FikCUS6qmyhgKXQ3PSu31CepIBPhOetcjQ+tTNtCsYfGQ==
X-Received: by 2002:a05:600c:600f:b0:3dc:4316:52be with SMTP id
 az15-20020a05600c600f00b003dc431652bemr10940664wmb.10.1677167840881; 
 Thu, 23 Feb 2023 07:57:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003daf7721bb3sm11727354wmj.12.2023.02.23.07.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A6F31FFB7;
 Thu, 23 Feb 2023 15:57:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
Date: Thu, 23 Feb 2023 15:57:07 +0000
Message-Id: <20230223155720.310593-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223-1

for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7eda2c:

  cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +0000)

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

----------------------------------------------------------------
Alex Bennée (10):
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

Bastian Koppelmann (1):
      tests/docker: Use binaries for debian-tricore-cross

Thomas Huth (2):
      gitlab-ci: Use artifacts instead of dumping logs in the Cirrus-CI jobs
      cirrus.yml: Improve the windows_msys2_task

 MAINTAINERS                                        |   1 +
 docs/devel/testing.rst                             |   4 +-
 tests/tcg/tricore/macros.h                         |   2 +-
 tests/fp/fp-test.c                                 |  19 +-
 tests/unit/test-io-channel-command.c               |  10 +-
 .cirrus.yml                                        |   8 +-
 .gitlab-ci.d/buildtest.yml                         |  23 +-
 .gitlab-ci.d/cirrus/build.yml                      |   7 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                  |   2 +-
 .gitlab-ci.d/containers.yml                        |   4 +-
 .gitlab-ci.d/crossbuild-template.yml               |  11 +
 .gitlab-ci.d/crossbuilds.yml                       |  12 +-
 .gitlab-ci.d/custom-runners.yml                    |   3 +-
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml |  10 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml        |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml        |  10 +-
 tests/avocado/replay_kernel.py                     |   1 +
 tests/avocado/tuxrun_baselines.py                  | 423 +++++++++++++++++++++
 tests/docker/dockerfiles/alpine.docker             |   1 +
 tests/docker/dockerfiles/centos8.docker            |   1 +
 tests/docker/dockerfiles/debian-amd64-cross.docker |   1 +
 tests/docker/dockerfiles/debian-amd64.docker       |   1 +
 tests/docker/dockerfiles/debian-arm64-cross.docker |   1 +
 tests/docker/dockerfiles/debian-armel-cross.docker |   1 +
 tests/docker/dockerfiles/debian-armhf-cross.docker |   1 +
 .../dockerfiles/debian-mips64el-cross.docker       |   1 +
 .../docker/dockerfiles/debian-mipsel-cross.docker  |   1 +
 .../docker/dockerfiles/debian-ppc64el-cross.docker |   1 +
 tests/docker/dockerfiles/debian-s390x-cross.docker |   1 +
 .../docker/dockerfiles/debian-tricore-cross.docker |  10 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker |   1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker |   1 +
 tests/docker/dockerfiles/fedora.docker             |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker      |   1 +
 tests/docker/dockerfiles/ubuntu2004.docker         |   4 +-
 tests/docker/dockerfiles/ubuntu2204.docker         | 147 +++++++
 tests/docker/test-tsan                             |   2 +-
 tests/fp/berkeley-testfloat-3                      |   2 +-
 tests/fp/meson.build                               |   2 +-
 tests/lcitool/projects/qemu.yml                    |   1 +
 tests/lcitool/refresh                              |  11 +-
 tests/tcg/tricore/Makefile.softmmu-target          |   6 +-
 44 files changed, 683 insertions(+), 73 deletions(-)
 create mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100644 tests/docker/dockerfiles/ubuntu2204.docker

-- 
2.39.1


