Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DD5F64BE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:01:41 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogOdG-0006ye-09
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ogOXq-0001iI-3X
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:56:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ogOXn-00029K-Pt
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:56:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id bq9so2114084wrb.4
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gotVvwCcfckEWZvfeeyVuuIFWix7Zqdk8u78JUZcuaw=;
 b=LOO8Vr4GUtqottRe7ldNA/XTu28LTuTMQQ3cE4etvKc/snrp3IcHL4uLlqIuRRX8Bi
 BiaVzPA7oIEym2tGOB+i18LQxwykGCa+dWNIdb3fgRkl5+pjZ+ha11rx3ZdCqwr0iBDx
 kta5Stl1xyfDerrqLnxUSIHdBDV6MRAHG2m1nW/y8LYkJs1TzIa/1dOkslyPKkAGZms8
 IiYlgCli0PWTfCgvEToSjdT36VtUZUIgC02GTNaCEBC+s8MWzUVRr6dNBPB3glsT53dB
 G9HZh3OwDl3x1kmbNC4lwuTGadqBvfWI2/1WjlLLeIvKusyIi2z2B0Yc6TDprMyz8hqN
 6eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gotVvwCcfckEWZvfeeyVuuIFWix7Zqdk8u78JUZcuaw=;
 b=dCXTvWI8JqYS3CAbMlPAt0UXJkQtWPwVgSmNKK3Hr3NqGq+2+iczvMvp1GYHoKE8aX
 B0IHYKsK2Nj6jBjZ6HuIrSA79eJc1iZQ2CX1uC9DUeJHm/OxsIJ/cuGR1lRmOOegxDOu
 Jo97q5gIvOZNMXuq52Wasx8DEuC77+Nk3/MSxC0YrNXhokeWDmC5kwX+Fftp5XHxIsXm
 4hdz7eLMpA+1GVh93830Ue+Xl1zHtrXvezX6SJqYK0Y7oDqfYnhqf05u5lsNNL71EiwN
 jpeGYCIuT2F1V/1U5Vo8WEuUmMKSUmZ7uFFkxionmeezRAEk13vzU+SZnX8O/D8ZQhas
 2//w==
X-Gm-Message-State: ACrzQf25g227vyUNP1zPowkSYwwOVyle3RaSL+WdUqHwEhWW99e8KXFU
 NaZ2lvRuAqPS4Jut0ZbxN1KUhw==
X-Google-Smtp-Source: AMsMyM5/PtMTv143/fupAdiV4ijd9GXSoFF3PtYwxUSbU+PJQPe1Rx8iwbSGc2Jhk+0PUYGQ20/XZQ==
X-Received: by 2002:a5d:64a1:0:b0:228:46e1:285d with SMTP id
 m1-20020a5d64a1000000b0022846e1285dmr2724806wrp.64.1665053757974; 
 Thu, 06 Oct 2022 03:55:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a5d6dc3000000b0022e3cba367fsm10985281wrz.100.2022.10.06.03.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 03:55:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36D7E1FFB7;
 Thu,  6 Oct 2022 11:55:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v3 00/52] testing, gdbstub, plugin and gitdm updates
Date: Thu,  6 Oct 2022 11:55:56 +0100
Message-Id: <20221006105556.3319342-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1dcdc92c72af5311666df64f5f04d6600af262ed:

  Merge tag 'pull-hex-20221003' of https://github.com/quic/qemu into staging (2022-10-05 10:17:32 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-plugins-gitdm-061022-3

for you to fetch changes up to f7e15affa8e574a800180de3bde1a6462aec7241:

  plugins: add [pre|post]fork helpers to linux-user (2022-10-06 11:53:41 +0100)

----------------------------------------------------------------
testing, gdbstub, plugin and gitdm updates

  - cleanup scripts/ci/setup in advance of ppc64 runner
  - ensure detected gdb reported to TCG tests
  - update hexagon container with build deps
  - move alpine container to tagged release
  - fix overflow during qos-test test tree iteration
  - allow bios blobs to be built with test cross compilers
  - introduce monitor_puts for plain strings
  - share disas code between monitor and plugins
  - fix bug in execlog plugin
  - add more tcg plugin documentation, reorg
  - fix link to semihosting spec
  - re-factor gdbstub to use AccelClass/Ops
  - many gitdm updates
  - fix race with plugin mutex lock and linux-user fork()

----------------------------------------------------------------
Alex Bennée (25):
      configure: move detected gdb to TCG's config-host.mak
      tests/docker: move alpine from edge to tagged release
      tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
      monitor: expose monitor_puts to rest of code
      disas: generalise plugin_printf and use for monitor_disas
      disas: use result of ->read_memory_func
      plugins: extend execlog to filter matches
      docs/devel: clean-up qemu invocations in tcg-plugins
      docs/devel: move API to end of tcg-plugins.rst
      contrib/plugins: reset skip when matching in execlog
      docs/devel: document the test plugins
      semihosting: update link to spec
      gdbstub: move into its own sub directory
      gdbstub: move sstep flags probing into AccelClass
      gdbstub: move breakpoint logic to accel ops
      gdbstub: move guest debug support check to ops
      accel/kvm: move kvm_update_guest_debug to inline stub
      contrib/gitdm: add mapping for Loongson Technology
      contrib/gitdm: add Paul to individual contributors
      contrib/gitdm: add WANG Xuerui to individual contributers
      contrib/gitdm: add ISCAS to the academics group
      contrib/gitdm: add China Telecom to the domain map
      contrib/gitdm: add Simon to individual contributors
      contrib/gitdm: add Université Grenoble Alpes
      plugins: add [pre|post]fork helpers to linux-user

Anton Johansson (3):
      target/hexagon: add flex/bison/glib2 to qemu.yml
      target/hexagon: regenerate docker/cirrus files
      target/hexagon: manually add flex/bison/glib2 to remaining containers

Lucas Mateus Castro (alqotel) (4):
      scripts/ci/setup: ninja missing from build-environment
      scripts/ci/setup: Fix libxen requirements
      scripts/ci/setup: spice-server only on x86 aarch64
      tests/docker: run script use realpath instead of readlink

Paolo Bonzini (19):
      pc-bios/optionrom: detect CC options just once
      pc-bios/s390-ccw: detect CC options just once
      vof: add distclean target
      build: add recursive distclean rules
      configure: return status code from probe_target_compiler
      configure: store container engine in config-host.mak
      tests: simplify Makefile invocation for tests/tcg
      tests/tcg: remove -f from Makefile invocation
      tests/tcg: add distclean rule
      tests/tcg: unify ppc64 and ppc64le Makefiles
      tests/tcg: clean up calls to run-test
      tests/tcg: move compiler tests to Makefiles
      configure: move tests/tcg/Makefile.prereqs to root build directory
      configure: unify creation of cross-compilation Makefiles
      configure: cleanup creation of tests/tcg target config
      configure: build ROMs with container-based cross compilers
      pc-bios/optionrom: Adopt meson style Make output
      pc-bios/s390-ccw: Adopt meson style Make output
      pc-bios/vof: Adopt meson style Make output

Richard Henderson (1):
      plugins: Assert mmu_idx in range before use in qemu_plugin_get_hwaddr

 docs/devel/tcg-plugins.rst                         | 175 +++++++++++++--
 docs/devel/writing-monitor-commands.rst            |   2 +-
 configure                                          | 238 ++++++++-------------
 Makefile                                           |  12 +-
 pc-bios/s390-ccw/netboot.mak                       |  27 ++-
 meson.build                                        |   6 +-
 accel/kvm/kvm-cpus.h                               |   4 +
 gdbstub/internals.h                                |  17 ++
 gdbstub/trace.h                                    |   1 +
 include/monitor/monitor.h                          |   1 +
 include/qemu/accel.h                               |  12 ++
 include/qemu/plugin.h                              |  24 +++
 include/sysemu/accel-ops.h                         |   7 +
 include/sysemu/cpus.h                              |   3 +
 include/sysemu/kvm.h                               |  36 ++--
 monitor/monitor-internal.h                         |   1 -
 tests/qtest/libqos/qgraph.h                        |   2 +-
 accel/accel-common.c                               |  10 +
 accel/kvm/kvm-accel-ops.c                          |   9 +
 accel/kvm/kvm-all.c                                |  48 ++---
 accel/stubs/kvm-stub.c                             |  21 --
 accel/tcg/tcg-accel-ops.c                          |  98 +++++++++
 accel/tcg/tcg-all.c                                |  17 ++
 block/monitor/block-hmp-cmds.c                     |  10 +-
 contrib/plugins/execlog.c                          |  99 +++++++--
 disas.c                                            |  43 ++--
 disas/capstone.c                                   |  73 ++++---
 gdbstub.c => gdbstub/gdbstub.c                     | 156 ++------------
 gdbstub/softmmu.c                                  |  51 +++++
 gdbstub/user.c                                     |  68 ++++++
 hw/misc/mos6522.c                                  |   2 +-
 linux-user/main.c                                  |   2 +
 monitor/hmp-cmds.c                                 |   8 +-
 monitor/hmp.c                                      |   2 +-
 plugins/api.c                                      |   2 +
 plugins/core.c                                     |  20 ++
 semihosting/arm-compat-semi.c                      |   2 +-
 softmmu/cpus.c                                     |   7 +
 target/i386/helper.c                               |   2 +-
 tests/tcg/{ppc64le => ppc64}/bcdsub.c              |   0
 tests/tcg/{ppc64le => ppc64}/byte_reverse.c        |   0
 tests/tcg/{ppc64le => ppc64}/mffsce.c              |   0
 tests/tcg/{ppc64le => ppc64}/mtfsf.c               |   0
 tests/tcg/{ppc64le => ppc64}/non_signalling_xscv.c |   0
 .../{ppc64le => ppc64}/signal_save_restore_xer.c   |   0
 tests/tcg/{ppc64le => ppc64}/xxspltw.c             |   0
 .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
 .gitlab-ci.d/cirrus/macos-11.vars                  |   2 +-
 .gitlab-ci.d/windows.yml                           |   6 +-
 .mailmap                                           |   1 +
 MAINTAINERS                                        |   2 +-
 contrib/gitdm/domain-map                           |   2 +
 contrib/gitdm/group-map-academics                  |   6 +
 contrib/gitdm/group-map-individuals                |   3 +
 gdbstub/meson.build                                |   9 +
 gdbstub/trace-events                               |  29 +++
 pc-bios/optionrom/Makefile                         |  47 ++--
 pc-bios/s390-ccw/Makefile                          |  43 ++--
 pc-bios/vof/Makefile                               |  19 +-
 scripts/ci/setup/build-environment.yml             |  15 +-
 tests/Makefile.include                             |  24 ++-
 tests/docker/Makefile.include                      |   2 +-
 tests/docker/dockerfiles/alpine.docker             |   6 +-
 tests/docker/dockerfiles/centos8.docker            |   2 +
 tests/docker/dockerfiles/debian-amd64-cross.docker |   3 +
 tests/docker/dockerfiles/debian-amd64.docker       |   2 +
 tests/docker/dockerfiles/debian-arm64-cross.docker |   3 +
 tests/docker/dockerfiles/debian-armel-cross.docker |   3 +
 tests/docker/dockerfiles/debian-armhf-cross.docker |   3 +
 .../dockerfiles/debian-mips64el-cross.docker       |   3 +
 .../docker/dockerfiles/debian-mipsel-cross.docker  |   3 +
 .../docker/dockerfiles/debian-ppc64el-cross.docker |   3 +
 .../docker/dockerfiles/debian-riscv64-cross.docker |   3 +
 tests/docker/dockerfiles/debian-s390x-cross.docker |   3 +
 tests/docker/dockerfiles/fedora-i386-cross.docker  |   2 +
 tests/docker/dockerfiles/fedora-win32-cross.docker |   3 +
 tests/docker/dockerfiles/fedora-win64-cross.docker |   3 +
 tests/docker/dockerfiles/fedora.docker             |   2 +
 tests/docker/dockerfiles/opensuse-leap.docker      |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker         |   2 +
 tests/docker/run                                   |   2 +-
 tests/lcitool/projects/qemu.yml                    |   3 +
 tests/lcitool/refresh                              |   2 +-
 tests/tcg/Makefile.target                          |  34 +--
 tests/tcg/aarch64/Makefile.softmmu-target          |  11 +-
 tests/tcg/aarch64/Makefile.target                  |  15 +-
 tests/tcg/arm/Makefile.target                      |   9 +-
 tests/tcg/cris/Makefile.target                     |   2 +-
 tests/tcg/i386/Makefile.softmmu-target             |   3 +-
 tests/tcg/i386/Makefile.target                     |  11 +-
 tests/tcg/multiarch/Makefile.target                |  18 +-
 tests/tcg/multiarch/system/Makefile.softmmu-target |   2 +-
 tests/tcg/ppc64/Makefile.target                    |   8 +-
 tests/tcg/ppc64le/Makefile.target                  |  26 +--
 tests/tcg/s390x/Makefile.target                    |   2 +-
 tests/tcg/x86_64/Makefile.softmmu-target           |   3 +-
 trace-events                                       |  28 ---
 98 files changed, 1138 insertions(+), 624 deletions(-)
 create mode 100644 gdbstub/internals.h
 create mode 100644 gdbstub/trace.h
 rename gdbstub.c => gdbstub/gdbstub.c (95%)
 create mode 100644 gdbstub/softmmu.c
 create mode 100644 gdbstub/user.c
 rename tests/tcg/{ppc64le => ppc64}/bcdsub.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/byte_reverse.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mffsce.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mtfsf.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/non_signalling_xscv.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/signal_save_restore_xer.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/xxspltw.c (100%)
 create mode 100644 gdbstub/meson.build
 create mode 100644 gdbstub/trace-events

-- 
2.34.1


