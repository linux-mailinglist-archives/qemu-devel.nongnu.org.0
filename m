Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66166498A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb1-0003Ny-88; Tue, 10 Jan 2023 12:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIaz-0003MY-Gu
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:33 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIaw-0001E6-4x
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:33 -0500
Received: by mail-wr1-x436.google.com with SMTP id t5so8177266wrq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zyoKH84Zvq9o4d50vDfUWgnSlrBuTwlFu/rrTxWuUn8=;
 b=MZ3X3lkVgKBXqg4VWv1ecE7BEYJCjuEDTlSiaeyfiZPoE9X/Uymzq92dyfHMaiysx/
 jBeWJ9IsKwPfluEmSK79YUJYU9Vf9FJklv+uPpxjnzcS6+58EedQd8OXvxdr1/BPy2/z
 IOe+91Q4fx1gDuVVdReoUGAHo6Qxs0CvPvT1i6L7Lgni85vizGo7fiHkFeLf+Js+MTTj
 nM5ZlRhL2/gSR2OXt9Dqb7XDI9Gz6QuMxUTslfAdISjj20HYr4j+ZmnbKPo2dnB0wgwB
 ehIJwEalMbHXjJw3UsAOl+dg8mbq/Ufsnx1sAS3mjlpJ5CE9p5enD8pZFHsfH2g8iFx6
 8JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zyoKH84Zvq9o4d50vDfUWgnSlrBuTwlFu/rrTxWuUn8=;
 b=KsiFAgErC9kKIL3iHRm9bTjkwBgYIErXFxKk0K8nd8jRZBeh5ZBbd3V1TPRx2TRibU
 29onCxLw3tg3gx6OEzFHkFUN11SkoAPpWw2jA6FlI8r0uqX4B6US+Wq0ZCaSxbR08Luw
 1rYaisXxilfx8NyFdf13/xN2JgNimGq3YQKBufzc8YYwJjPegTaFOYIRdfXBxGjMbCmu
 V1xPIjVCpuVTxKR/RDu1a3lg+HvpjjipWGmSIh6f+7zt7Vhnfy2lMCwGfaXTgpXxkVDw
 A/CecHu3JVLSgH8BkMSvdSjyuwH0Xh+U9EOFg4+uqokh5vy0P6ORegIucMgNnDvooRtn
 CHQg==
X-Gm-Message-State: AFqh2kpAMhD3vwwXNvgYQxZuxZdBAeWIBcNKqcgauDKdUZW7CMc3257d
 QRgngROa4SUc+2QmrzIaRdZ2Uw==
X-Google-Smtp-Source: AMrXdXsW9sMG21SZxRB9EoYpClYvm51GZpPAFYaf4XoPeimzLZJwAfof/GOoiqEbm+2swy+d2Kc55w==
X-Received: by 2002:a5d:564e:0:b0:27d:59a5:28bc with SMTP id
 j14-20020a5d564e000000b0027d59a528bcmr35591398wrw.35.1673372368680; 
 Tue, 10 Jan 2023 09:39:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm11808233wrt.16.2023.01.10.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B81F21FFB7;
 Tue, 10 Jan 2023 17:39:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 00/26] current maintainer trees (testing/semihosting/plugins)
Date: Tue, 10 Jan 2023 17:38:56 +0000
Message-Id: <20230110173922.265055-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

Hi All,

I've wrapped up all my maintainer trees into a single branch to
minimise the disruption of multiple pull requests. Most stuff has
already been reviewed but in short we have:

  - some cleanups and tweaks for gitlab
  - a new playbook to install gitlab runners
  - a proposed re-org of the front about section
  - a few semihosting fixes (with docs ;-)
  - a bunch of tsan fixes touching tcg and plugins
  - fixing some plugin races
  - expunging the last vestiges of perl from the build system

The following patches need review:

  tests/tcg: add memory-sve test for aarch64
  semihosting: add semihosting section to the docs
  docs: add a proper feature overview in "About QEMU"
  tests/unit: drop hacky race avoidance in test-io-channel-command
  gitlab: just use plain --cc=clang for custom runner build
  gitlab: add FF_SCRIPT_SECTIONS for timings
  scripts/ci: update gitlab-runner playbook to use latest runner

Alex Bennée (6):
  scripts/ci: update gitlab-runner playbook to use latest runner
  gitlab: just use plain --cc=clang for custom runner build
  tests/unit: drop hacky race avoidance in test-io-channel-command
  docs: add a proper feature overview in "About QEMU"
  semihosting: add semihosting section to the docs
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
  tcg: exclude lookup_tb_ptr from helper instrumentation
  cpu-exec: assert that plugin_mem_cbs is NULL after execution

Evgeny Iakovlev (1):
  semihosting: add O_BINARY flag in host_open for NT compatibility

Keith Packard (1):
  semihosting: Write back semihosting data before completion callback

Marc-André Lureau (8):
  build-sys: fix crlf-ending C code
  .gitlab-ci.d/windows: do not disable opengl
  configure: replace Perl usage with sed
  meson: replace Perl usage with Python
  docs: drop texinfo options
  Update lcitool and fedora to 37
  lcitool: drop perl from QEMU project/dependencies
  lcitool: drop texinfo from QEMU project/dependencies

Mark Cave-Ayland (1):
  gitlab: add FF_SCRIPT_SECTIONS for timings

 docs/about/features.rst                       | 236 ++++++++++++++++++
 docs/about/index.rst                          |  16 +-
 docs/conf.py                                  |  13 -
 docs/devel/tcg-plugins.rst                    |   2 +
 docs/specs/index.rst                          |   1 +
 docs/specs/semihosting.rst                    |  79 ++++++
 docs/system/arm/emulation.rst                 |   2 +
 docs/system/index.rst                         |   2 +
 docs/system/multi-process.rst                 |   2 +
 docs/tools/index.rst                          |   2 +
 docs/user/index.rst                           |   2 +
 configure                                     |   8 +-
 meson.build                                   |   2 +-
 accel/tcg/tb-jmp-cache.h                      |   1 +
 include/qemu/plugin.h                         |  11 +
 include/qemu/thread.h                         |   5 +-
 accel/tcg/cpu-exec.c                          |   5 +-
 accel/tcg/plugin-gen.c                        |  26 +-
 accel/tcg/translator.c                        |  15 +-
 cpu.c                                         |  11 +-
 plugins/core.c                                |  16 +-
 semihosting/syscalls.c                        |  28 +--
 tcg/tcg.c                                     |   6 +-
 tests/unit/test-io-channel-command.c          |  14 +-
 util/qht.c                                    | 103 ++++++--
 .gitlab-ci.d/base.yml                         |   5 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   2 +-
 .gitlab-ci.d/windows.yml                      |   5 +-
 qemu-options.hx                               |  27 +-
 scripts/ci/setup/build-environment.yml        |   1 -
 scripts/ci/setup/gitlab-runner.yml            |  56 +----
 scripts/ci/setup/vars.yml.template            |   2 -
 scripts/shaderinclude.pl                      |  16 --
 scripts/shaderinclude.py                      |  26 ++
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
 .../dockerfiles/debian-tricore-cross.docker   |   1 -
 .../dockerfiles/fedora-win32-cross.docker     |   6 +-
 .../dockerfiles/fedora-win64-cross.docker     |   6 +-
 tests/docker/dockerfiles/fedora.docker        |   6 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   2 -
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 -
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 -
 tests/lcitool/refresh                         |   6 +-
 tests/qapi-schema/meson.build                 |   7 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   7 +
 tests/tcg/aarch64/system/boot.S               |   3 +-
 tests/vm/centos.aarch64                       |   2 +-
 62 files changed, 607 insertions(+), 238 deletions(-)
 create mode 100644 docs/about/features.rst
 create mode 100644 docs/specs/semihosting.rst
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

-- 
2.34.1


