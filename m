Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D166C50DC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:34:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf1Og-0007XG-Dy; Wed, 22 Mar 2023 12:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf1Oe-0007Tm-Ec
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:33:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf1Oc-00042U-20
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:33:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id r29so17705843wra.13
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679502784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VUMY3iZvxaM1HmicNS7gOhD7JHp5hgA6l4C/oTD3F3A=;
 b=T9pZjKbeTAX3JzBgLlTFrzn9xe5HRSxKjRrlIgbuMOOyoxIkVCEJAva2fL7oeNif33
 BdmuyTlShXyDOSjOhQGoyUY6t4xK22JhtUlObeZ5eWOhY4fFfI5rJJ9sjIGpu58CiG+c
 dwnaiJYdzkC9fj82iaCh+FG1WnyshqDBjH+hkRSv1lchUFIL15f2txweLCD4QwVBHVxI
 wOzZAIM/tw38BojKdiWJfbiXWZY28nxL6LrN4Jw8MO8LnkS+97y7p8UJNU5dJPy3v4cZ
 FGvngeUwOv+3xWFPSp9O1zA+qZklylHma1Q8yShNcHBz0VLbIhAxhJp8h3GDdJOUQnDw
 TywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679502784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VUMY3iZvxaM1HmicNS7gOhD7JHp5hgA6l4C/oTD3F3A=;
 b=tvumboX6Gy4kD2iAETQncqZUjX/YQX77TYDPO/7u1neU1cePGGwnK5v4lzJW+sNnUs
 +A1KyDy6p9rGzSAjTBmEWK1zk+EcHHN0Q14vx9UjrhuZGxwdDF+r6upnyB4VB5/7BGIE
 bl0t1z/gioeJNDKZPOFAV7QklUxles7yB/2Sy0E6qu8EOQjZYdHSIsyyaGphk0O1ILPh
 Q9Yg9sTgqrGU9m42iuMUZ6DOM5xGZvXeqB2CFVEc79zPgZSX4S/mbyW7rluKLUJrkFqD
 +nExpkb8P5F2XpMFgb7YHvGay2Ar/OOl8wxNJoJd7gmZDipbC1NZ5AFDXfmizpEX3qiK
 tb5g==
X-Gm-Message-State: AAQBX9ddvEM3PFUz6rBbHvk0mpY16jdUHkaPIbY/aLDi+5a4awGAVPzd
 e3rc+J0AxqnBzpD+BShP7cRrWQ==
X-Google-Smtp-Source: AKy350b9OnPHkM/6Zelu3wFGVNg/jxRMzyDAtlkmGSVJE+TCukJmcgaA/eZq6j/bKSY9pq9120hStg==
X-Received: by 2002:a5d:4b10:0:b0:2cf:f30f:cc04 with SMTP id
 v16-20020a5d4b10000000b002cff30fcc04mr308846wrq.27.1679502784212; 
 Wed, 22 Mar 2023 09:33:04 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a5d4d87000000b002c707785da4sm14136417wru.107.2023.03.22.09.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 09:33:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B9C11FFB7;
 Wed, 22 Mar 2023 16:33:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 for 8.0 00/35] various fixes (testing, plugins, gitdm)
Date: Wed, 22 Mar 2023 16:33:03 +0000
Message-Id: <20230322163303.4115917-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

The following changes since commit c283ff89d11ff123efc9af49128ef58511f73012:

  Update version for v8.0.0-rc1 release (2023-03-21 17:15:43 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-220323-1

for you to fetch changes up to e35b9a2e81ccce86db6f1417b1d73bb97d7cbc17:

  qtests: avoid printing comments before g_test_init() (2023-03-22
  15:08:26 +0000)

Note you will need to remove the old openbsd disk image to trigger a
rebuild that avoids the issues with -ENOSPC. My pipeline can be seen
here:

  https://gitlab.com/stsquad/qemu/-/pipelines/814624909

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
  - probe for multiprocess support before running avocado test
  - refactor igb.py into netdev-ethtool.py avocado test
  - rebuild openbsd to have more space space for iotests

----------------------------------------------------------------
Alex Bennée (16):
      tests/avocado: probe for multi-process support before running test
      tests/avocado: re-factor igb test to avoid timeouts
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

Daniel P. Berrangé (11):
      tests/vm: skip X11 in openbsd installation
      tests/vm: custom openbsd partitioning to increase /home space
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

 include/hw/core/cpu.h                              |   2 +-
 include/qemu/plugin-event.h                        |  26 +++++
 include/qemu/plugin.h                              |  27 ++---
 include/qemu/qemu-plugin.h                         |  47 ++++++++-
 include/user/syscall-trace.h                       |   1 +
 accel/accel-softmmu.c                              |   2 +-
 accel/tcg/cpu-exec-common.c                        |   3 +
 accel/tcg/cpu-exec.c                               |   5 +-
 block/monitor/block-hmp-cmds.c                     |   1 +
 cpu.c                                              |   1 +
 dump/dump.c                                        |   1 +
 dump/win_dump.c                                    |   1 +
 gdbstub/gdbstub.c                                  |   1 +
 hw/arm/collie.c                                    |   2 +
 hw/arm/cubieboard.c                                |   1 +
 hw/arm/musicpal.c                                  |   2 +
 hw/arm/npcm7xx_boards.c                            |   2 +
 hw/arm/nseries.c                                   |   2 +
 hw/arm/omap_sx1.c                                  |   2 +
 hw/arm/orangepi.c                                  |   1 +
 hw/arm/palm.c                                      |   2 +
 hw/core/loader.c                                   |   1 +
 hw/core/machine-smp.c                              |   2 +
 hw/i386/kvm/xen_evtchn.c                           |   1 +
 hw/i386/kvm/xen_xenstore.c                         |   1 +
 hw/i386/sgx.c                                      |   1 +
 hw/intc/apic.c                                     |   1 +
 hw/loongarch/acpi-build.c                          |   1 +
 hw/loongarch/virt.c                                |   2 +
 hw/m68k/next-cube.c                                |   1 +
 hw/m68k/q800.c                                     |   1 +
 hw/m68k/virt.c                                     |   1 +
 hw/mem/memory-device.c                             |   1 +
 hw/mem/sparse-mem.c                                |   1 +
 hw/openrisc/boot.c                                 |   1 +
 hw/ppc/ppc4xx_sdram.c                              |   1 +
 hw/ppc/spapr_softmmu.c                             |   2 +
 hw/riscv/opentitan.c                               |   1 +
 hw/riscv/shakti_c.c                                |   1 +
 hw/riscv/virt-acpi-build.c                         |   1 +
 hw/vfio/display.c                                  |   1 +
 hw/vfio/igd.c                                      |   1 +
 hw/vfio/migration.c                                |   1 +
 linux-user/elfload.c                               |   1 +
 linux-user/exit.c                                  |   1 +
 linux-user/syscall.c                               |   1 +
 migration/dirtyrate.c                              |   1 +
 migration/exec.c                                   |   1 +
 plugins/core.c                                     |  11 --
 target/i386/cpu.c                                  |   1 +
 target/i386/host-cpu.c                             |   1 +
 target/i386/kvm/xen-emu.c                          |   1 +
 target/i386/sev.c                                  |   1 +
 target/i386/whpx/whpx-apic.c                       |   1 +
 target/mips/cpu.c                                  |   1 +
 target/s390x/cpu-sysemu.c                          |   1 +
 target/s390x/cpu_models.c                          |   1 +
 target/s390x/diag.c                                |   2 +
 tcg/tcg-op.c                                       |   1 -
 tests/qtest/migration-test.c                       |  10 +-
 .../custom-runners/centos-stream-8-x86_64.yml      |  18 ++--
 contrib/gitdm/domain-map                           |   8 +-
 contrib/gitdm/group-map-alibaba                    |   7 ++
 contrib/gitdm/group-map-amd                        |   8 ++
 contrib/gitdm/group-map-individuals                |   4 +
 gitdm.config                                       |   2 +
 .../ci/org.centos/stream/8/build-environment.yml   |   1 +
 scripts/ci/setup/gitlab-runner.yml                 |  20 +++-
 tests/avocado/avocado_qemu/__init__.py             |  10 ++
 tests/avocado/igb.py                               |  38 -------
 tests/avocado/machine_aarch64_virt.py              |   8 +-
 tests/avocado/multiprocess.py                      |   1 +
 tests/avocado/netdev-ethtool.py                    | 116 +++++++++++++++++++++
 tests/avocado/tuxrun_baselines.py                  |  60 +++++------
 tests/check-block.sh                               |  43 --------
 tests/docker/Makefile.include                      |   2 +-
 tests/qemu-iotests/check                           |  30 +++++-
 tests/qemu-iotests/meson.build                     |  35 +++++--
 tests/qemu-iotests/testenv.py                      |  20 ++--
 tests/qemu-iotests/testrunner.py                   |  43 +++-----
 tests/tcg/Makefile.target                          |   7 ++
 tests/vm/openbsd                                   |  30 +++++-
 ui/cocoa.m                                         |   1 +
 83 files changed, 470 insertions(+), 236 deletions(-)
 create mode 100644 include/qemu/plugin-event.h
 create mode 100644 contrib/gitdm/group-map-alibaba
 create mode 100644 contrib/gitdm/group-map-amd
 delete mode 100644 tests/avocado/igb.py
 create mode 100644 tests/avocado/netdev-ethtool.py
 delete mode 100755 tests/check-block.sh

-- 
2.39.2


