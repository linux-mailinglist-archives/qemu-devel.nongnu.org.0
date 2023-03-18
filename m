Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F0E6BF9A1
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1Q-0004li-LV; Sat, 18 Mar 2023 07:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1N-0004l8-6f
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1L-0007CN-5I
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i9so6503377wrp.3
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SUcQBH3qGjgl3Nzx8Rs2ZTQ7/cVyAuUSPC74fjtVce0=;
 b=cTAqSFeGCiepj4rVSt+1KB5XNksCVX/2+107+OLmAixPsmm2FtA63k/+fP/VkMUws+
 fBC+gwN7ppHgRgF+gyXXOkxBmGXACk1UoOCxmLmhw0Lxmusl7I/MDy3EItHPN36ud8/T
 J84huQgrxwl8BLYcGUm4Y9f3vEM/c3esd3SKAbwpox0ZERc3IHGK7X5UEonV5iWaRsg3
 0Sc5SbAdiVoRN+2dIS0Fs3wNHbvrZ8E/+UVdkdFWAORRl/ocRGQ+qLSbri4VatyM1rRx
 8IU80qkcffzL+1nPmlWaM5MZzYZo2exXRFMtCsEKbTmUgsPoFfQLgTCTygeHMP1iJgFy
 gK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SUcQBH3qGjgl3Nzx8Rs2ZTQ7/cVyAuUSPC74fjtVce0=;
 b=ev0mhflO4KcnKqSG9pRv6oS9SD8kG1ESz+Axaet0M19PvrYsoJaruGUHit/xPskEdl
 B/NkFsn/uKLyYfQKmrfEepWzOu/2JGP/7aQn8gXVR26p0kxOiLyCfhZS4EDs5ihKLjhQ
 cH4MCpYGbLUfNy07SPjW+qARnZTqTLHXaOGBWGVl62oJFYzCfckGnJcAJhu56JS/vo2a
 Xkk/Pw2SZ2AwfCCKnG50odsB/DHhQJtBdtq+bsUu2EnTKxxMqe+D/3E/YHX/zKZIJNIq
 hMnSLznZYprGXXqVzmJUEkRCMCFkzCPc4b+LjGvSUKJXqWGeifP6CZVOZ2jpWNNzjRXY
 hHXg==
X-Gm-Message-State: AO0yUKVyMDY7Eoq3GXKU3uMmNMD2MUbNFiEzTExkLVckxgKJqabhUPI5
 A3M9yz3fw2D5Q8ASejlGzXDc4A==
X-Google-Smtp-Source: AK7set8/G/xmL74ZriTny35h6XtEQmnB2KN7VFmAu5tDe+IJnhCsUaiaWgDmHgFI8vI2byNOUK0kqA==
X-Received: by 2002:a5d:4990:0:b0:2cf:e739:9fbb with SMTP id
 r16-20020a5d4990000000b002cfe7399fbbmr8842202wrq.22.1679140005422; 
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u8-20020adfdb88000000b002cff06039d7sm4162104wri.39.2023.03.18.04.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97A051FFB7;
 Sat, 18 Mar 2023 11:46:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/31] various fixes (testing, plugins, gitdm)
Date: Sat, 18 Mar 2023 11:46:13 +0000
Message-Id: <20230318114644.1340899-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:

  Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-170323-4

for you to fetch changes up to 4f2c431acd43d0aa505494229d05fa343762f272:

  qtests: avoid printing comments before g_test_init() (2023-03-17
  17:50:19 +0000)

You can see my CI run on the branch here:

  https://gitlab.com/stsquad/qemu/-/pipelines/810271620

The failures:

  FreeBSD's time out on a migration test
  Centos8 Stream because my private runner needs more disk space

----------------------------------------------------------------
Misc fixes for 8.0 (testing, plugins, gitdm)

  - update Alpine image used for testing images
  - include libslirp in custom runner build env
  - update gitlab-runner recipe for CentOS
  - update docker calls for better caching behaviour
  - document some plugin callbacks
  - don't use tags to define drives for lkft baseline tests
  - fix missing clear of plugin_mem_cbs
  - fix iotests to report individual results
  - update the gitdm metadata for contributors
  - avoid printing comments before g_test_init()

----------------------------------------------------------------
Alex Bennée (14):
      tests/docker: all add DOCKER_BUILDKIT to RUNC environment
      scripts/ci: add libslirp-devel to build-environment
      scripts/ci: update gitlab-runner playbook to handle CentOS
      gitlab: update centos-8-stream job
      include/qemu: add documentation for memory callbacks
      tests/tcg: add some help output for running individual tests
      tests/avocado: don't use tags to define drive
      contrib/gitdm: Add ASPEED Technology to the domain map
      contrib/gitdm: Add SYRMIA to the domain map
      contrib/gitdm: add Amazon to the domain map
      contrib/gitdm: add Alibaba to the domain-map
      contrib/gitdm: add revng to domain map
      contrib/gitdm: add more individual contributors
      contrib/gitdm: add group map for AMD

Daniel P. Berrangé (9):
      iotests: explicitly pass source/build dir to 'check' command
      iotests: allow test discovery before building
      iotests: strip subdir path when listing tests
      iotests: print TAP protocol version when reporting tests
      iotests: connect stdin to /dev/null when running tests
      iotests: always use a unique sub-directory per test
      iotests: register each I/O test separately with meson
      iotests: remove the check-block.sh script
      qtests: avoid printing comments before g_test_init()

Marcin Juszkiewicz (1):
      tests/avocado: update AArch64 tests to Alpine 3.17.2

Richard Henderson (7):
      tcg: Clear plugin_mem_cbs on TB exit
      tcg: Drop plugin_gen_disable_mem_helpers from tcg_gen_exit_tb
      include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
      *: Add missing includes of qemu/error-report.h
      *: Add missing includes of qemu/plugin.h
      include/qemu: Split out plugin-event.h
      include/qemu/plugin: Inline qemu_plugin_disable_mem_helpers

 include/hw/core/cpu.h                              |  2 +-
 include/qemu/plugin-event.h                        | 26 ++++++++++
 include/qemu/plugin.h                              | 27 +++-------
 include/qemu/qemu-plugin.h                         | 47 +++++++++++++++--
 include/user/syscall-trace.h                       |  1 +
 accel/accel-softmmu.c                              |  2 +-
 accel/tcg/cpu-exec-common.c                        |  3 ++
 accel/tcg/cpu-exec.c                               |  5 +-
 block/monitor/block-hmp-cmds.c                     |  1 +
 cpu.c                                              |  1 +
 dump/dump.c                                        |  1 +
 dump/win_dump.c                                    |  1 +
 gdbstub/gdbstub.c                                  |  1 +
 hw/arm/collie.c                                    |  2 +
 hw/arm/cubieboard.c                                |  1 +
 hw/arm/musicpal.c                                  |  2 +
 hw/arm/npcm7xx_boards.c                            |  2 +
 hw/arm/nseries.c                                   |  2 +
 hw/arm/omap_sx1.c                                  |  2 +
 hw/arm/orangepi.c                                  |  1 +
 hw/arm/palm.c                                      |  2 +
 hw/core/loader.c                                   |  1 +
 hw/core/machine-smp.c                              |  2 +
 hw/i386/kvm/xen_evtchn.c                           |  1 +
 hw/i386/kvm/xen_xenstore.c                         |  1 +
 hw/i386/sgx.c                                      |  1 +
 hw/intc/apic.c                                     |  1 +
 hw/loongarch/acpi-build.c                          |  1 +
 hw/loongarch/virt.c                                |  2 +
 hw/m68k/next-cube.c                                |  1 +
 hw/m68k/q800.c                                     |  1 +
 hw/m68k/virt.c                                     |  1 +
 hw/mem/memory-device.c                             |  1 +
 hw/mem/sparse-mem.c                                |  1 +
 hw/openrisc/boot.c                                 |  1 +
 hw/ppc/ppc4xx_sdram.c                              |  1 +
 hw/ppc/spapr_softmmu.c                             |  2 +
 hw/riscv/opentitan.c                               |  1 +
 hw/riscv/shakti_c.c                                |  1 +
 hw/riscv/virt-acpi-build.c                         |  1 +
 hw/vfio/display.c                                  |  1 +
 hw/vfio/igd.c                                      |  1 +
 hw/vfio/migration.c                                |  1 +
 linux-user/elfload.c                               |  1 +
 linux-user/exit.c                                  |  1 +
 linux-user/syscall.c                               |  1 +
 migration/dirtyrate.c                              |  1 +
 migration/exec.c                                   |  1 +
 plugins/core.c                                     | 11 ----
 target/i386/cpu.c                                  |  1 +
 target/i386/host-cpu.c                             |  1 +
 target/i386/kvm/xen-emu.c                          |  1 +
 target/i386/sev.c                                  |  1 +
 target/i386/whpx/whpx-apic.c                       |  1 +
 target/mips/cpu.c                                  |  1 +
 target/s390x/cpu-sysemu.c                          |  1 +
 target/s390x/cpu_models.c                          |  1 +
 target/s390x/diag.c                                |  2 +
 tcg/tcg-op.c                                       |  1 -
 tests/qtest/migration-test.c                       | 10 ++--
 .../custom-runners/centos-stream-8-x86_64.yml      | 18 +++----
 contrib/gitdm/domain-map                           |  8 ++-
 contrib/gitdm/group-map-alibaba                    |  7 +++
 contrib/gitdm/group-map-amd                        |  8 +++
 contrib/gitdm/group-map-individuals                |  4 ++
 gitdm.config                                       |  2 +
 .../ci/org.centos/stream/8/build-environment.yml   |  1 +
 scripts/ci/setup/gitlab-runner.yml                 | 20 +++++++-
 tests/avocado/machine_aarch64_virt.py              |  8 +--
 tests/avocado/tuxrun_baselines.py                  | 60 +++++++++-------------
 tests/check-block.sh                               | 43 ----------------
 tests/docker/Makefile.include                      |  2 +-
 tests/qemu-iotests/check                           | 30 +++++++++--
 tests/qemu-iotests/meson.build                     | 35 ++++++++++---
 tests/qemu-iotests/testenv.py                      | 20 ++++----
 tests/qemu-iotests/testrunner.py                   | 43 +++++-----------
 tests/tcg/Makefile.target                          |  7 +++
 ui/cocoa.m                                         |  1 +
 78 files changed, 316 insertions(+), 195 deletions(-)
 create mode 100644 include/qemu/plugin-event.h
 create mode 100644 contrib/gitdm/group-map-alibaba
 create mode 100644 contrib/gitdm/group-map-amd
 delete mode 100755 tests/check-block.sh

-- 
2.39.2


