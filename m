Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FE67A0CD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:03:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNc8-0001UK-1i; Tue, 24 Jan 2023 13:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc2-0001T1-I0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:38 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNbv-00064L-Oj
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:37 -0500
Received: by mail-wr1-x431.google.com with SMTP id t18so1887364wro.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gyqGhqSqYiZj+Fi+sJQRIlN53WCN/5RmfFICipUo58U=;
 b=RinUJHreGqY/40KJx9h5B5p2rTqakBWnm1fV84oY+ApDEyuZkOZ07aMKGprkqjqdgb
 daK3XfjBIviq0rp0+9EA1nEN5rpWCmn/VaJ2uPagR2+zVk8Bw9wY7PfVMgXM+/IjYnYk
 TwxuxdubsvQrfUlQf4VzxtszyFAB6ss1r46OeB1/Yh/hdYJxR4IPdztpY9XN+blxuoJK
 tNRTS5peALbBiUjz1j+NbarAIXUTiP75pCS42g8oZdsKJjxKWIRBsBS6fx5gqSM9dUDU
 +PtTyweCvOG4lZN/0rZpO4dGIohysucBwPiDaIiBgsDgquzT/uLs8o62V33S1M9rINcE
 Gyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gyqGhqSqYiZj+Fi+sJQRIlN53WCN/5RmfFICipUo58U=;
 b=Z6VpotCZ2l0omRHpMzB4d6ow0BKGIQY3W5IEQmWdVtBRZFVZFC2oEg3+4Zood0Ubbg
 08XrnnBI+lCzOJZCx70LKJ3gSO8IrB5pjyU2V+eiTxPgeeQq3Dio/iUOrJupJLVHTqOW
 es8/HwvBvIACXwwrz1F5cwJ+Mx/IXuR1iV0nkmWsxOuYESLPs76Ll7/iJRKja/Xf/gue
 Py94kYJzY7S17vVhKRSyDqI2hgdk6ZUyp7p9Ylqk4qPohYaB/M+HZpz6r3RgcLrmUn2X
 k+6BvT0KgtVlUdRslCz4k5GcX0h1c7lYFbHTJy5CjqfbrkdrEb2UoqnPeay3VtwaU81l
 xlKA==
X-Gm-Message-State: AFqh2kr8vSEQBxa3WDgySULnJLuO6rViaDKlr0nTseUSkD+yb0vdVyM6
 0K93E94c4POXjdRG68lsgydGDA==
X-Google-Smtp-Source: AMrXdXszEusWfFhrAlWAOBo9TwRjIuhnjSvJM1mBkPulCumEiBB506w7owswwXkpTM4NaHP/2KzWFg==
X-Received: by 2002:adf:f64f:0:b0:2be:435:cf7b with SMTP id
 x15-20020adff64f000000b002be0435cf7bmr23095988wrp.8.1674583288669; 
 Tue, 24 Jan 2023 10:01:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v20-20020adfa1d4000000b00241cfe6e286sm2456824wrv.98.2023.01.24.10.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95DE51FFB7;
 Tue, 24 Jan 2023 18:01:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 00/35] maintainer tree pre-PR
 (testing/docs/semihosting/plugins)
Date: Tue, 24 Jan 2023 18:00:52 +0000
Message-Id: <20230124180127.1881110-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

This is a roll-up of all my maintainer trees which contains fixes all
over QEMU. I'd hoped to minimise the disruption of multiple pull
requests but in the end spent a lot of time trying to re-create the
win64 cross failure which only occurs on CI. I'm not sure if the
failure is just down to some sort of weird registry issue so I'm kind
of hoping it disappears once merged. However if anyone is able to run
CI on their repo you can try:

  git push-ci -f gitlab

and then manually run:

  win64-fedora-cross-container (in containers)

and then:

  cross-win64-system (in builds)

and let me know if it hangs for you to. In which case I'll just have
to drop the Fedora 37 updates all together. Either way I'll base the
final PR of this series.

A summary of the contents:

  - some cleanups and tweaks for gitlab
  - a new playbook to install gitlab runners
  - a proposed re-org of the front about section
  - a few semihosting fixes (with docs ;-)
  - a bunch of tsan fixes touching tcg and plugins
  - fixing some plugin races
  - expunging the last vestiges of perl from the build system

The following patches need review:

  plugins: Iterate on cb_lists in qemu_plugin_user_exit
  docs: add a new section to outline emulation support (1 acks, 1 sobs)
  gitlab: add lsan suppression file to workaround tcmalloc issues
  scripts/ci: update gitlab-runner playbook to use latest runner

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
  plugins: make qemu_plugin_user_exit's locking order consistent with
    fork_start's
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

 MAINTAINERS                                   |   2 +-
 docs/about/emulation.rst                      | 192 +++++++++++++++
 docs/about/index.rst                          |  17 +-
 docs/conf.py                                  |  13 --
 docs/devel/tcg-plugins.rst                    |   2 +
 docs/interop/live-block-operations.rst        |   2 +
 docs/interop/qemu-qmp-ref.rst                 |   2 +
 docs/system/arm/emulation.rst                 |   2 +
 docs/system/index.rst                         |   4 +-
 docs/system/introduction.rst                  | 220 ++++++++++++++++++
 docs/system/multi-process.rst                 |   2 +
 docs/system/quickstart.rst                    |  21 --
 docs/tools/index.rst                          |   2 +
 docs/user/index.rst                           |   2 +
 meson.build                                   |   2 +-
 accel/tcg/plugin-helpers.h                    |   4 +-
 accel/tcg/tb-jmp-cache.h                      |   1 +
 include/qemu/plugin.h                         |  11 +
 include/qemu/thread.h                         |   5 +-
 include/tcg/tcg.h                             |   2 +
 accel/tcg/cpu-exec.c                          |   5 +-
 accel/tcg/plugin-gen.c                        |  26 ++-
 accel/tcg/translator.c                        |  15 +-
 cpu.c                                         |  11 +-
 plugins/core.c                                |  23 +-
 semihosting/syscalls.c                        |  28 +--
 tcg/tcg.c                                     |   6 +-
 tests/unit/test-io-channel-command.c          |  14 +-
 util/qht.c                                    |  97 ++++++--
 .gitlab-ci.d/base.yml                         |   5 +
 .gitlab-ci.d/buildtest.yml                    |   1 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 .gitlab-ci.d/custom-runners.yml               |  11 +
 .../custom-runners/ubuntu-20.04-s390x.yml     |  13 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  15 +-
 .gitlab-ci.d/windows.yml                      |   5 +-
 qemu-options.hx                               |  30 ++-
 scripts/ci/setup/build-environment.yml        |   1 -
 scripts/ci/setup/gitlab-runner.yml            |  56 ++---
 scripts/ci/setup/vars.yml.template            |   2 -
 scripts/oss-fuzz/lsan_suppressions.txt        |   2 +
 scripts/shaderinclude.pl                      |  16 --
 scripts/shaderinclude.py                      |  26 +++
 tests/docker/Makefile.include                 |   1 -
 tests/docker/dockerfiles/alpine.docker        |   2 -
 tests/docker/dockerfiles/centos8.docker       |   2 -
 .../dockerfiles/debian-amd64-cross.docker     |   4 +-
 tests/docker/dockerfiles/debian-amd64.docker  |   2 -
 .../dockerfiles/debian-arm64-cross.docker     |   4 +-
 .../dockerfiles/debian-armel-cross.docker     |   4 +-
 .../dockerfiles/debian-armhf-cross.docker     |   4 +-
 .../dockerfiles/debian-mips64el-cross.docker  |   4 +-
 .../dockerfiles/debian-mipsel-cross.docker    |   4 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |   4 +-
 .../dockerfiles/debian-s390x-cross.docker     |   4 +-
 .../dockerfiles/debian-toolchain.docker       |   1 -
 .../dockerfiles/debian-tricore-cross.docker   |   2 +-
 .../dockerfiles/fedora-win32-cross.docker     |   6 +-
 .../dockerfiles/fedora-win64-cross.docker     |   6 +-
 tests/docker/dockerfiles/fedora.docker        |   6 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   2 -
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 -
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 -
 tests/lcitool/refresh                         |   6 +-
 tests/qapi-schema/meson.build                 |   7 +-
 tests/tcg/Makefile.target                     |   4 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   7 +
 tests/tcg/aarch64/system/boot.S               |   3 +-
 tests/tcg/multiarch/Makefile.target           |   9 +
 tests/vm/centos.aarch64                       |   2 +-
 74 files changed, 758 insertions(+), 272 deletions(-)
 create mode 100644 docs/about/emulation.rst
 create mode 100644 docs/system/introduction.rst
 delete mode 100644 docs/system/quickstart.rst
 create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

-- 
2.34.1


