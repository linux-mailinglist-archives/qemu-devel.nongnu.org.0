Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383525F4472
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:40:49 +0200 (CEST)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiAC-0002v6-9h
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYR-0008FX-K8
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYM-0007Mf-BJ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:45 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so693900wmr.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=tBHYkl0tnnYge8Ee3MuZ9CuYnUkL87nC+JSD/vZke3o=;
 b=FOabqVPBqdGUV7HnM+WpnoqsK7ucD6/yc3WI82t0f/HBpbVURvwK14u/OFrhUlqpH/
 wS8U1znWFnVhJCjb+RCMJ8R32vLzhEgpBaL2lvkngW8XtOeqF0ZGZFVg3438Y0Rv7OF5
 0cs84NOzW67o9KM0CsACvWSa5XVHBXtd1/EP/b0+M+i+9F0jxs0Rkc52hADeoJWxMGw9
 dXFXWLJF+/P1YwxGshjHsoChqxGQTHs2owh7KCniFRfVSxdCLjHYueuNmI+780XzeIRC
 AQZ7zH12V6AtABEnob/2BLt73E857dDgOossQZqOsaPETAf1xoIEwwkYDlwwxACFo40q
 U71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tBHYkl0tnnYge8Ee3MuZ9CuYnUkL87nC+JSD/vZke3o=;
 b=ECi0urxMO3itTqzHgJW3z4UKsWxbghVJFY2AwsHxbFXCU2K9Aa7rkotKO81k6Gyqyz
 UR0cbMJwNaiSkcVGIgz2OmJLcfNWLAs+W6k4bsrDEgtEZUVfWra2GvRoBukPV6zXBDed
 WS0wPmTjKxDcOR31sZCHN5Ds5CupHnUroTyF49uBnqLOSgKb+noAbgxYoKJdUwZohBrX
 NyHD8BUBBLof3eCOCZ4oVFNBG5V7znpoUh1VZ4jHxbDSGmgW5Vwq9wMRwNfFC2chSLpD
 SRwL1afDPJKKq8v6ZFQcfCfdNQ5z5FxjbBWXYa0d190JvttDlt5MhUM4nwIWLAJmllLi
 iz+g==
X-Gm-Message-State: ACrzQf1WNtdU8pu3xRFY4CLLylNf+lxl9WwlKELhlbPY0pfmlKhSjkVd
 GNy+1svUhntHHKZj4rROspSx386TM0Dyyw==
X-Google-Smtp-Source: AMsMyM7DzZJPFIbQniwiyuiQu/mJhjb3ngw8EUYPZa4sfRbBRbETq+ckC8O8AR/qrjNhKCKbUR/ZqA==
X-Received: by 2002:a05:600c:22d6:b0:3b4:9f2e:9e33 with SMTP id
 22-20020a05600c22d600b003b49f2e9e33mr10293009wmg.163.1664888500765; 
 Tue, 04 Oct 2022 06:01:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a7bcc9a000000b003bd83d8c0f2sm795289wma.16.2022.10.04.06.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 590B41FFB7;
 Tue,  4 Oct 2022 14:01:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/54] testing, gdbstub, plugin and gitdm updates
Date: Tue,  4 Oct 2022 14:00:44 +0100
Message-Id: <20221004130138.2299307-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

The following changes since commit efbf38d73e5dcc4d5f8b98c6e7a12be1f3b91745:

  Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-10-03 15:06:07 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-plugins-gitdm-041022-1

for you to fetch changes up to 3450eff8bef9a97121c373c60b8abf7d79bd1fe9:

  plugins: add [pre|post]fork helpers to linux-user (2022-10-04 13:52:57 +0100)

[AJB: I've run out of gitlab minutes this month to run this tag
through CI but the previous series was clean]

----------------------------------------------------------------
testing, gdbstub, plugin and gitdm updates

  - cleanup scripts/ci/setup in advance of ppc64 runner
  - ensure detected gdb reported to TCG tests
  - update hexagon container with build deps
  - generate fedora-win[32|64]-cross with lcitool
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
Alex Bennée (26):
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

 docs/devel/tcg-plugins.rst                         | 175 ++++++++++++--
 docs/devel/writing-monitor-commands.rst            |   2 +-
 configure                                          | 258 ++++++++-------------
 Makefile                                           |  12 +-
 pc-bios/s390-ccw/netboot.mak                       |  27 +--
 meson.build                                        |   6 +-
 accel/kvm/kvm-cpus.h                               |   4 +
 gdbstub/internals.h                                |  17 ++
 gdbstub/trace.h                                    |   1 +
 include/monitor/monitor.h                          |   1 +
 include/qemu/accel.h                               |  12 +
 include/qemu/plugin.h                              |  24 ++
 include/sysemu/accel-ops.h                         |   7 +
 include/sysemu/cpus.h                              |   3 +
 include/sysemu/kvm.h                               |  36 ++-
 monitor/monitor-internal.h                         |   1 -
 tests/qtest/libqos/qgraph.h                        |   2 +-
 accel/accel-common.c                               |  10 +
 accel/kvm/kvm-accel-ops.c                          |   9 +
 accel/kvm/kvm-all.c                                |  48 ++--
 accel/stubs/kvm-stub.c                             |  21 --
 accel/tcg/tcg-accel-ops.c                          |  98 ++++++++
 accel/tcg/tcg-all.c                                |  17 ++
 block/monitor/block-hmp-cmds.c                     |  10 +-
 contrib/plugins/execlog.c                          |  99 ++++++--
 disas.c                                            |  43 ++--
 disas/capstone.c                                   |  73 +++---
 gdbstub.c => gdbstub/gdbstub.c                     | 156 ++-----------
 gdbstub/softmmu.c                                  |  51 ++++
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
 pc-bios/optionrom/Makefile                         |  51 ++--
 pc-bios/s390-ccw/Makefile                          |  43 ++--
 pc-bios/vof/Makefile                               |  19 +-
 scripts/ci/setup/build-environment.yml             |  15 +-
 tests/Makefile.include                             |  24 +-
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
 tests/docker/dockerfiles/fedora-win32-cross.docker | 136 ++++++++---
 tests/docker/dockerfiles/fedora-win64-cross.docker | 134 ++++++++---
 tests/docker/dockerfiles/fedora.docker             |   2 +
 tests/docker/dockerfiles/opensuse-leap.docker      |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker         |   2 +
 tests/docker/run                                   |   2 +-
 tests/lcitool/projects/qemu.yml                    |   3 +
 tests/lcitool/refresh                              |  50 ++--
 tests/tcg/Makefile.target                          |  34 ++-
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
 98 files changed, 1361 insertions(+), 737 deletions(-)
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


