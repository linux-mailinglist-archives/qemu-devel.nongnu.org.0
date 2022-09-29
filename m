Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A05EF5E3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:59:58 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt8v-0000no-IU
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw5-0004NF-48
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw2-0001Bw-AW
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id s14so1792638wro.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=5C0r1BceflgQ9edxqT38jIsjNuDkuBJcoNuFqlx/xlM=;
 b=hi22GbtYxiMiEObtcLMpdzF2VrvrS7od/oep8rZK+a04/NV71vAuj2VqcCJBZ/ICd/
 YZx+HtJAxzjlrizX9WPTtZn4qLIvuZmFR/NuywvBO+yEVn1LVnDqJuE7Izm2s7r5RwZB
 17dFDr1CjiL5yAhf8ameaxPHckERdVH2jQeSPmaV0PJcjLEOl5TY9dBsQ3Tu+HuK5poC
 EJc7u2EwmOJjzEsk8oDl0lvUM0gNV8UVAc9WVjfRRXSlpzTpPLHSmf58bTcHEgm/6RLo
 b4Vs8RGmXrrV46Ffp8Vz1EWtstqgsvSS/j/EW6PTzKrIKtJWUSknyCUULiyM6r4jp7Y2
 mwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5C0r1BceflgQ9edxqT38jIsjNuDkuBJcoNuFqlx/xlM=;
 b=PwVpySuJ6mYobRPLhJ41xPotOl9UbZhLmkxDVGi3xl9rTcSqTXvdco82E05FYG9nTc
 bNm1PWxEwBYp9HNMaHgfJQo1Hy1gI6tK5cUECeuKk7DFCbplVmoxeg4C24N3bOoQVkJT
 QwG9W/emXOikqGgm1vIkgN/OOm0PuCIlAxAMuwj9YJS86uj2ZNpUUPyOedPO0SYBJ8YL
 q0XUVLy6EqounX97zsXyTzR1dxJ5V0qW+WYvlFELkiMNxO8lHfXIggbaLgLSBQ+BusKE
 2z70tRa6wX92wenhZMeb6B86x5uzHU2LuEiZkoawg0gbCp7BylQZaNmurWIVHCCL7TWU
 udFg==
X-Gm-Message-State: ACrzQf1p4rQpO+wKaifB4WX5VmVcpXjqlGmiFjbeml2cL56S90rDnh2R
 G756PhLxgaB8oq/VaTID7fyw7A==
X-Google-Smtp-Source: AMsMyM4cvgLV5w22cehuwRGwgurRkVbv8EjnHPF70jmf/dfaDQhO31fLEYeE/Qok2IBqCQe0KbOVRg==
X-Received: by 2002:adf:a4ce:0:b0:22a:f5e8:6dcc with SMTP id
 h14-20020adfa4ce000000b0022af5e86dccmr1831779wrb.445.1664451752662; 
 Thu, 29 Sep 2022 04:42:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003b4c979e6bcsm4281313wmq.10.2022.09.29.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B56B1FFB7;
 Thu, 29 Sep 2022 12:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/51] maintainer pre-PR (testing, plugins, gitdm,
 semihosting)
Date: Thu, 29 Sep 2022 12:41:40 +0100
Message-Id: <20220929114231.583801-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a pre-PR series for a pull request I intend to cut next week.
It includes bits and pieces from my various maintainer trees as well
Paolo's continuing clean-up of cross-compilation.

  - more docker testing updates
  - cross compile fixes
  - semihosting doc patch
  - various plugin and disas cleanups
  - gdbstub refactor (without MxTxAttrs work, that needs longer to cook)
  - some gitdm metadata updates

Most patches are already reviewed but feel free to weigh in on:

 - contrib/gitdm: add China Telecom to the domain map (1 acks, 1 sobs)
 - contrib/gitdm: add Paul to individual contributors
 - contrib/gitdm: add mapping for Loongson Technology (1 acks, 1 sobs)
 - accel/kvm: move kvm_update_guest_debug to inline stub
 - docs/devel: document the test plugins
 - tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE (2 acks, 1 sobs)
 - tests/docker: update fedora-win[32|64]-cross with lcitool
 - configure: move detected gdb to TCG's config-host.mak

Alex Bennée (23):
  configure: move detected gdb to TCG's config-host.mak
  tests/docker: update fedora-win[32|64]-cross with lcitool
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

Anton Johansson (3):
  target/hexagon: add flex/bison/glib2 to qemu.yml
  target/hexagon: regenerate docker/cirrus files
  target/hexagon: manually add flex/bison/glib2 to remaining containers

Lucas Mateus Castro (alqotel) (4):
  scripts/ci/setup: ninja missing from build-environment
  scripts/ci/setup: Fix libxen requirements
  scripts/ci/setup: spice-server only on x86 aarch64
  tests/docker: run script use realpath instead of readlink

Paolo Bonzini (20):
  configure: do not invoke as/ld directly for pc-bios/optionrom
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

 docs/devel/tcg-plugins.rst                    | 175 ++++++++++--
 docs/devel/writing-monitor-commands.rst       |   2 +-
 configure                                     | 258 +++++++-----------
 Makefile                                      |  12 +-
 pc-bios/s390-ccw/netboot.mak                  |  27 +-
 meson.build                                   |   6 +-
 accel/kvm/kvm-cpus.h                          |   4 +
 gdbstub/internals.h                           |  17 ++
 gdbstub/trace.h                               |   1 +
 include/monitor/monitor.h                     |   1 +
 include/qemu/accel.h                          |  12 +
 include/sysemu/accel-ops.h                    |   7 +
 include/sysemu/cpus.h                         |   3 +
 include/sysemu/kvm.h                          |  36 ++-
 monitor/monitor-internal.h                    |   1 -
 tests/qtest/libqos/qgraph.h                   |   2 +-
 accel/accel-common.c                          |  10 +
 accel/kvm/kvm-accel-ops.c                     |   9 +
 accel/kvm/kvm-all.c                           |  48 ++--
 accel/stubs/kvm-stub.c                        |  21 --
 accel/tcg/tcg-accel-ops.c                     |  98 +++++++
 accel/tcg/tcg-all.c                           |  17 ++
 block/monitor/block-hmp-cmds.c                |  10 +-
 contrib/plugins/execlog.c                     |  99 ++++++-
 disas.c                                       |  43 +--
 disas/capstone.c                              |  73 +++--
 gdbstub.c => gdbstub/gdbstub.c                | 156 ++---------
 gdbstub/softmmu.c                             |  51 ++++
 gdbstub/user.c                                |  68 +++++
 hw/misc/mos6522.c                             |   2 +-
 monitor/hmp-cmds.c                            |   8 +-
 monitor/hmp.c                                 |   2 +-
 plugins/api.c                                 |   2 +
 semihosting/arm-compat-semi.c                 |   2 +-
 softmmu/cpus.c                                |   7 +
 target/i386/helper.c                          |   2 +-
 tests/tcg/{ppc64le => ppc64}/bcdsub.c         |   0
 tests/tcg/{ppc64le => ppc64}/byte_reverse.c   |   0
 tests/tcg/{ppc64le => ppc64}/mffsce.c         |   0
 tests/tcg/{ppc64le => ppc64}/mtfsf.c          |   0
 .../{ppc64le => ppc64}/non_signalling_xscv.c  |   0
 .../signal_save_restore_xer.c                 |   0
 tests/tcg/{ppc64le => ppc64}/xxspltw.c        |   0
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-11.vars             |   2 +-
 .gitlab-ci.d/windows.yml                      |   6 +-
 .mailmap                                      |   1 +
 MAINTAINERS                                   |   2 +-
 contrib/gitdm/domain-map                      |   2 +
 contrib/gitdm/group-map-academics             |   3 +
 contrib/gitdm/group-map-individuals           |   2 +
 gdbstub/meson.build                           |   9 +
 gdbstub/trace-events                          |  29 ++
 pc-bios/optionrom/Makefile                    |  51 ++--
 pc-bios/s390-ccw/Makefile                     |  43 ++-
 pc-bios/vof/Makefile                          |  19 +-
 scripts/ci/setup/build-environment.yml        |  15 +-
 tests/Makefile.include                        |  24 +-
 tests/docker/Makefile.include                 |   2 +-
 tests/docker/dockerfiles/alpine.docker        |   6 +-
 tests/docker/dockerfiles/centos8.docker       |   2 +
 .../dockerfiles/debian-amd64-cross.docker     |   3 +
 tests/docker/dockerfiles/debian-amd64.docker  |   2 +
 .../dockerfiles/debian-arm64-cross.docker     |   3 +
 .../dockerfiles/debian-armel-cross.docker     |   3 +
 .../dockerfiles/debian-armhf-cross.docker     |   3 +
 .../dockerfiles/debian-mips64el-cross.docker  |   3 +
 .../dockerfiles/debian-mipsel-cross.docker    |   3 +
 .../dockerfiles/debian-ppc64el-cross.docker   |   3 +
 .../dockerfiles/debian-riscv64-cross.docker   |   3 +
 .../dockerfiles/debian-s390x-cross.docker     |   3 +
 .../dockerfiles/fedora-i386-cross.docker      |   2 +
 .../dockerfiles/fedora-win32-cross.docker     | 136 ++++++---
 .../dockerfiles/fedora-win64-cross.docker     | 134 ++++++---
 tests/docker/dockerfiles/fedora.docker        |   2 +
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 +
 tests/docker/run                              |   2 +-
 tests/lcitool/projects/qemu.yml               |   3 +
 tests/lcitool/refresh                         |  50 ++--
 tests/tcg/Makefile.target                     |  34 ++-
 tests/tcg/aarch64/Makefile.softmmu-target     |  11 +-
 tests/tcg/aarch64/Makefile.target             |  15 +-
 tests/tcg/arm/Makefile.target                 |   9 +-
 tests/tcg/cris/Makefile.target                |   2 +-
 tests/tcg/i386/Makefile.softmmu-target        |   3 +-
 tests/tcg/i386/Makefile.target                |  11 +-
 tests/tcg/multiarch/Makefile.target           |  18 +-
 .../multiarch/system/Makefile.softmmu-target  |   2 +-
 tests/tcg/ppc64/Makefile.target               |   8 +-
 tests/tcg/ppc64le/Makefile.target             |  26 +-
 tests/tcg/s390x/Makefile.target               |   2 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |   3 +-
 trace-events                                  |  28 --
 95 files changed, 1311 insertions(+), 737 deletions(-)
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


