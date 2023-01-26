Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEA67C9DB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:28:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LN-00021R-O7; Thu, 26 Jan 2023 06:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LI-0001US-DI
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:56 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LF-0003YR-PT
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so3035069wml.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hxMUtvuanoxVvHV9P26Id4QiE1+HoMLvaXL6sgLN7UA=;
 b=ZTKfbDsqbAtj6J0jjJ8UELY/BtbyWJcCe02xfzBzq64DwKOVf9EQCVpfWUwRmvPXVm
 Nke3M4YG5pE/Z5DrwPzT41fVcDlDgjflNpcXHuzEPuH9w8cSJ+U6JtE084SQLfyuCKia
 yBUz62qH0GbXHAM8YhAumcopibF1ShVnkmQegxKGh4/5nnp567PRpgL1YKfjthwG5Y7G
 V7Hdt1ZjXaQ0xZlDjOW/5InCyaOnDtv0uJChzoSUwhsimMEECX8L4Xw+jX8od6H8a4rP
 tbfA/pOlm/fi6KSBkfPAJxBeGZ7bFN7/1SDjL2o+RTKuq7U9TTg69XMZvdtkSW4ChvQ9
 5qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hxMUtvuanoxVvHV9P26Id4QiE1+HoMLvaXL6sgLN7UA=;
 b=H1BmOZyobQsganzck826TndUvqcdZs2+zAK3oh1ZrvYy97Rj3/3YxPw/DoafOqQRni
 CB05BR41zhhom+s1yZbYveGPN/fs6UxG6IDCS2Vujgo4R7KKsWH/KXDJjGs61c4ia1MV
 Lc3OIACBdTAY0S63rk8qjzcU4f7lo0ATIYIiCpZlRU1y/yN5l2uEmURC6SUBG6aFNyVw
 Y2jJ4Ye3noN4o4TCVg5dQXIwZzEidky8urz0IdLMDAJABHMFWJWYeLtuLD2f+j0Q8tKT
 3bJZilxNEoYwCvrDwb3FP6rL5sMbbVfoBFfE7WZOy2AxbnDkfz9aLiHuJ/wA/GEuwqbX
 KU9w==
X-Gm-Message-State: AFqh2kqIo6oJ8CSERo5aCBgG6G2pRqt5bsIxUDyX4UdLc32rSeqwTpbG
 dNURgWMvDvBBh+Z/7bNyOwcCcg==
X-Google-Smtp-Source: AMrXdXsQrre3j0netrIIyK7ldbTvpu8tYD81+SKGHYl4q7t8tG7Tyr5+zx/Xx0G79s4AkVGBhIRYRA==
X-Received: by 2002:a05:600c:354a:b0:3da:1f6a:7b36 with SMTP id
 i10-20020a05600c354a00b003da1f6a7b36mr35459571wmq.0.1674732171808; 
 Thu, 26 Jan 2023 03:22:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c415100b003da2932bde0sm1460422wmm.23.2023.01.26.03.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D84AA1FFB7;
 Thu, 26 Jan 2023 11:22:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/35] Testing, docs, semihosting and plugin updates
Date: Thu, 26 Jan 2023 11:22:15 +0000
Message-Id: <20230126112250.2584701-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-jan-omnibus-260123-1

for you to fetch changes up to d200653282f50df2a994a0609f88baa6a5889f80:

  plugins: Iterate on cb_lists in qemu_plugin_user_exit (2023-01-26 11:12:01 +0000)

----------------------------------------------------------------
Testing, docs, semihosting and plugin updates

  - update playbooks for custom runners
  - add section timing support to gitlab
  - upgrade fedora images to 37
  - purge perl from the build system and deps
  - disable unstable tests in CI
  - improve intro, emulation and semihosting docs
  - semihosting bug fix and O_BINARY default
  - add memory-sve test
  - fix some races in qht
  - improve plugin handling of memory helpers
  - optimise plugin hooks
  - fix some plugin deadlocks

----------------------------------------------------------------
Alex Bennée (12):
      scripts/ci: update gitlab-runner playbook to use latest runner
      gitlab: just use plain --cc=clang for custom runner build
      tests/unit: drop hacky race avoidance in test-io-channel-command
      gitlab: add lsan suppression file to workaround tcmalloc issues
      tests/docker: drop debian-tricore-cross's partial status
      tests/tcg: skip the vma-pthread test on CI
      gitlab: wrap up test results for custom runners
      docs: add hotlinks to about preface text
      docs: add a new section to outline emulation support
      semihosting: add semihosting section to the docs
      docs: add an introduction to the system docs
      tests/tcg: add memory-sve test for aarch64

Emilio Cota (9):
      cpu: free cpu->tb_jmp_cache with RCU
      util/qht: add missing atomic_set(hashes[i])
      thread: de-const qemu_spin_destroy
      util/qht: use striped locks under TSAN
      plugins: make qemu_plugin_user_exit's locking order consistent with fork_start's
      plugins: fix optimization in plugin_gen_disable_mem_helpers
      translator: always pair plugin_gen_insn_{start, end} calls
      tcg: exclude non-memory effecting helpers from instrumentation
      cpu-exec: assert that plugin_mem_cbs is NULL after execution

Evgeny Iakovlev (1):
      semihosting: add O_BINARY flag in host_open for NT compatibility

Keith Packard (1):
      semihosting: Write back semihosting data before completion callback

Marc-André Lureau (7):
      build-sys: fix crlf-ending C code
      .gitlab-ci.d/windows: do not disable opengl
      meson: replace Perl usage with Python
      docs: drop texinfo options
      Update lcitool and fedora to 37
      lcitool: drop perl from QEMU project/dependencies
      lcitool: drop texinfo from QEMU project/dependencies

Mark Cave-Ayland (1):
      gitlab: add FF_SCRIPT_SECTIONS for timings

Philippe Mathieu-Daudé (1):
      tests/docker: Install flex in debian-tricore-cross

Richard Henderson (2):
      tests/tcg: Use SIGKILL for timeout
      plugins: Iterate on cb_lists in qemu_plugin_user_exit

Thomas Huth (1):
      MAINTAINERS: Fix the entry for tests/tcg/nios2

 MAINTAINERS                                        |   2 +-
 docs/about/emulation.rst                           | 192 ++++++++++++++++++
 docs/about/index.rst                               |  17 +-
 docs/conf.py                                       |  13 --
 docs/devel/tcg-plugins.rst                         |   2 +
 docs/interop/live-block-operations.rst             |   2 +
 docs/interop/qemu-qmp-ref.rst                      |   2 +
 docs/system/arm/emulation.rst                      |   2 +
 docs/system/index.rst                              |   4 +-
 docs/system/introduction.rst                       | 220 +++++++++++++++++++++
 docs/system/multi-process.rst                      |   2 +
 docs/system/quickstart.rst                         |  21 --
 docs/tools/index.rst                               |   2 +
 docs/user/index.rst                                |   2 +
 meson.build                                        |   2 +-
 accel/tcg/plugin-helpers.h                         |   4 +-
 accel/tcg/tb-jmp-cache.h                           |   1 +
 include/qemu/plugin.h                              |  11 ++
 include/qemu/thread.h                              |   5 +-
 include/tcg/tcg.h                                  |   2 +
 accel/tcg/cpu-exec.c                               |   5 +-
 accel/tcg/plugin-gen.c                             |  26 ++-
 accel/tcg/translator.c                             |  15 +-
 cpu.c                                              |  11 +-
 plugins/core.c                                     |  23 ++-
 semihosting/syscalls.c                             |  28 +--
 tcg/tcg.c                                          |   6 +-
 tests/unit/test-io-channel-command.c               |  14 +-
 util/qht.c                                         |  97 +++++++--
 .gitlab-ci.d/base.yml                              |   5 +
 .gitlab-ci.d/buildtest.yml                         |   1 +
 .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                  |   2 +-
 .gitlab-ci.d/custom-runners.yml                    |  11 ++
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml |  13 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml        |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml        |  15 +-
 .gitlab-ci.d/windows.yml                           |   5 +-
 qemu-options.hx                                    |  30 ++-
 scripts/ci/setup/build-environment.yml             |   1 -
 scripts/ci/setup/gitlab-runner.yml                 |  56 ++----
 scripts/ci/setup/vars.yml.template                 |   2 -
 scripts/oss-fuzz/lsan_suppressions.txt             |   2 +
 scripts/shaderinclude.pl                           |  16 --
 scripts/shaderinclude.py                           |  26 +++
 tests/docker/Makefile.include                      |   1 -
 tests/docker/dockerfiles/alpine.docker             |   2 -
 tests/docker/dockerfiles/centos8.docker            |   2 -
 tests/docker/dockerfiles/debian-amd64-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-amd64.docker       |   2 -
 tests/docker/dockerfiles/debian-arm64-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-armel-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-armhf-cross.docker |   4 +-
 .../dockerfiles/debian-mips64el-cross.docker       |   4 +-
 .../docker/dockerfiles/debian-mipsel-cross.docker  |   4 +-
 .../docker/dockerfiles/debian-ppc64el-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-s390x-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-toolchain.docker   |   1 -
 .../docker/dockerfiles/debian-tricore-cross.docker |   2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker |   6 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker |   6 +-
 tests/docker/dockerfiles/fedora.docker             |   6 +-
 tests/docker/dockerfiles/opensuse-leap.docker      |   2 -
 tests/docker/dockerfiles/ubuntu2004.docker         |   2 -
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/projects/qemu.yml                    |   2 -
 tests/lcitool/refresh                              |   6 +-
 tests/qapi-schema/meson.build                      |   7 +-
 tests/tcg/Makefile.target                          |   4 +-
 tests/tcg/aarch64/Makefile.softmmu-target          |   7 +
 tests/tcg/aarch64/system/boot.S                    |   3 +-
 tests/tcg/multiarch/Makefile.target                |   9 +
 tests/vm/centos.aarch64                            |   2 +-
 74 files changed, 758 insertions(+), 272 deletions(-)
 create mode 100644 docs/about/emulation.rst
 create mode 100644 docs/system/introduction.rst
 delete mode 100644 docs/system/quickstart.rst
 create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

-- 
2.34.1


