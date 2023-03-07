Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273056AF776
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekw-0001lO-9l; Tue, 07 Mar 2023 16:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekm-0001fG-8L
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:48 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZeki-000819-I6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:47 -0500
Received: by mail-wm1-x330.google.com with SMTP id k37so8715678wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+SV5N3j4VG3OcL1COoCrdKNKfU0NGFaNHlwkJ/kv5YM=;
 b=QGS2dVuzMS6dsj0RYx+hg8GLLXtbV3McTCknSq1TLhJJ6DQXbp3JFYeh/XVnfhUeCp
 eCfcEu20si3XnuXK1YfH+SREBwNJbYNrKbzsvktYyIzgdBmWNbV/3ikuMhng0pE4smDn
 iOs6phXVvISCQsXiFv8q4ZFALvvwhAMoDpOM+TfUPl0aiGZKaC4CaoKgguznXYdX/O47
 ifgM+vBu/DkuMaaoj8cG9EnukP+cEYRqK147SR6SYz/gI7kBsGP52B8IwAVx2bY0SbPK
 Lcb06u63r8nSQwNgC5Wmgl4t0eHeWIeHdzeWBXl5XFS1UXht52FaTS1DEfYTiyW3JPZl
 1VqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SV5N3j4VG3OcL1COoCrdKNKfU0NGFaNHlwkJ/kv5YM=;
 b=aaTWeNkCQIIgg2w5luS6/gEvSjMJ/BTP8R47YiBwb4Qqj103p6Sxem32sJDQbeVGmY
 Klgq0fIunJhSgAe18rLOLaxfPWF/cJQPB5iAz4ypcyF+USM/01Iwu/IL5Io594+wRqk+
 o+ELLGO+Ij8aGHE/txshzbDgFDo5Ws33taxNeQKeBe1l9n0gcNMGY220l0IiOYkBekEW
 ALa0hy31JXJTjoaH8N4IHDoPPVdklZcMRKK8K5UG0LcC99A+Sa+yRS4HwsSaJJdWAPXh
 Wm4/LsVOKbeaCLwrYGHMXnXLYhe0R7KwbFDB4hwV4x7gNsGAOSBGoj3K+0GOEgTEeiOY
 CF2w==
X-Gm-Message-State: AO0yUKWRHXIfbAR+/WLDs0bD5MdqP8WWS+GxaIQnlr5moLRe2SylsRQh
 00CUx7JyumlKUNsI8Xl62evcYNkesvEbHAdfZx8=
X-Google-Smtp-Source: AK7set+JFzzNfiEp4olLJwZiDKdv6SAi8bqoVHbwvCwRMZWF8twrtEMKBUJDJie6M5AQiVs9Zi/K7g==
X-Received: by 2002:a7b:c84a:0:b0:3df:eda1:439c with SMTP id
 c10-20020a7bc84a000000b003dfeda1439cmr13603683wml.11.1678224100352; 
 Tue, 07 Mar 2023 13:21:40 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b003e01493b136sm19220641wmq.43.2023.03.07.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C0761FFB7;
 Tue,  7 Mar 2023 21:21:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/30] gdbstub refactor for smaller build
Date: Tue,  7 Mar 2023 21:21:09 +0000
Message-Id: <20230307212139.883112-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-gdbstub-070323-3

for you to fetch changes up to 412ae12647d1086c713e13841fd25d10d5418c7f:

  gdbstub: move update guest debug to accel ops (2023-03-07 20:44:09 +0000)

----------------------------------------------------------------
gdbstub refactor:

  - split user and softmmu code
  - use cleaner headers for tb_flush, target_ulong
  - probe for gdb multiarch support at configure
  - make syscall handling target independent
  - add update guest debug of accel ops

----------------------------------------------------------------
Alex Bennée (25):
      gdbstub/internals.h: clean up include guard
      gdbstub: fix-up copyright and license files
      gdbstub: clean-up indent on gdb_exit
      gdbstub: define separate user/system structures
      gdbstub: move GDBState to shared internals header
      includes: move tb_flush into its own header
      gdbstub: move fromhex/tohex routines to internals
      gdbstub: make various helpers visible to the rest of the module
      gdbstub: move chunk of softmmu functionality to own file
      gdbstub: move chunks of user code into own files
      gdbstub: rationalise signal mapping in softmmu
      gdbstub: abstract target specific details from gdb_put_packet_binary
      gdbstub: specialise handle_query_attached
      gdbstub: specialise target_memory_rw_debug
      gdbstub: introduce gdb_get_max_cpus
      gdbstub: specialise stub_can_reverse
      gdbstub: fix address type of gdb_set_cpu_pc
      gdbstub: don't use target_ulong while handling registers
      gdbstub: move register helpers into standalone include
      gdbstub: move syscall handling to new file
      gdbstub: only compile gdbstub twice for whole build
      testing: probe gdb for supported architectures ahead of time
      include: split target_long definition from cpu-defs
      gdbstub: split out softmmu/user specifics for syscall handling
      stubs: split semihosting_get_target from system only stubs

Mads Ynddal (1):
      gdbstub: move update guest debug to accel ops

Philippe Mathieu-Daudé (1):
      gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs

Richard Henderson (3):
      gdbstub: Remove gdb_do_syscallv
      gdbstub: Adjust gdb_do_syscall to only use uint32_t and uint64_t
      gdbstub: Build syscall.c once

 MAINTAINERS                                        |    4 +
 configure                                          |    8 +
 gdbstub/internals.h                                |  212 ++-
 include/exec/cpu-defs.h                            |   19 +-
 include/exec/exec-all.h                            |    1 -
 include/exec/gdbstub.h                             |  208 ---
 include/exec/target_long.h                         |   42 +
 include/exec/tb-flush.h                            |   26 +
 include/gdbstub/helpers.h                          |  103 ++
 include/gdbstub/syscalls.h                         |  113 ++
 include/gdbstub/user.h                             |   43 +
 include/sysemu/accel-ops.h                         |    1 +
 linux-user/user-internals.h                        |    1 +
 accel/kvm/kvm-accel-ops.c                          |    8 +
 accel/stubs/tcg-stub.c                             |    1 +
 accel/tcg/tb-maint.c                               |    1 +
 accel/tcg/translate-all.c                          |    1 +
 bsd-user/freebsd/os-syscall.c                      |    2 +
 bsd-user/main.c                                    |    1 +
 bsd-user/signal.c                                  |    1 +
 cpu.c                                              |   12 +-
 gdbstub/gdbstub.c                                  | 1655 ++------------------
 gdbstub/softmmu.c                                  |  603 ++++++-
 gdbstub/syscalls.c                                 |  205 +++
 gdbstub/user-target.c                              |  283 ++++
 gdbstub/user.c                                     |  423 ++++-
 hw/ppc/spapr_hcall.c                               |    1 +
 linux-user/exit.c                                  |    2 +-
 linux-user/main.c                                  |    1 +
 linux-user/signal.c                                |    2 +-
 plugins/core.c                                     |    1 +
 plugins/loader.c                                   |    2 +-
 semihosting/arm-compat-semi.c                      |    1 +
 semihosting/guestfd.c                              |    2 +-
 semihosting/syscalls.c                             |   37 +-
 softmmu/runstate.c                                 |    2 +-
 stubs/semihost-all.c                               |   17 +
 stubs/semihost.c                                   |    5 -
 target/alpha/gdbstub.c                             |    2 +-
 target/alpha/sys_helper.c                          |    1 +
 target/arm/gdbstub.c                               |    1 +
 target/arm/gdbstub64.c                             |    2 +-
 target/arm/tcg/helper-a64.c                        |    2 +-
 target/arm/tcg/m_helper.c                          |    1 +
 target/avr/gdbstub.c                               |    2 +-
 target/cris/gdbstub.c                              |    2 +-
 target/hexagon/gdbstub.c                           |    2 +-
 target/hppa/gdbstub.c                              |    2 +-
 target/i386/gdbstub.c                              |    2 +-
 target/i386/whpx/whpx-all.c                        |    2 +-
 target/loongarch/gdbstub.c                         |    1 +
 target/m68k/gdbstub.c                              |    2 +-
 target/m68k/helper.c                               |    1 +
 target/m68k/m68k-semi.c                            |    3 +-
 target/microblaze/gdbstub.c                        |    2 +-
 target/mips/gdbstub.c                              |    2 +-
 target/mips/tcg/sysemu/mips-semi.c                 |    3 +-
 target/nios2/cpu.c                                 |    2 +-
 target/nios2/nios2-semi.c                          |    3 +-
 target/openrisc/gdbstub.c                          |    2 +-
 target/openrisc/interrupt.c                        |    2 +-
 target/openrisc/mmu.c                              |    2 +-
 target/ppc/cpu_init.c                              |    2 +-
 target/ppc/gdbstub.c                               |    1 +
 target/riscv/csr.c                                 |    1 +
 target/riscv/gdbstub.c                             |    1 +
 target/rx/gdbstub.c                                |    2 +-
 target/s390x/gdbstub.c                             |    1 +
 target/s390x/helper.c                              |    2 +-
 target/sh4/gdbstub.c                               |    2 +-
 target/sparc/gdbstub.c                             |    2 +-
 target/tricore/gdbstub.c                           |    2 +-
 target/xtensa/core-dc232b.c                        |    2 +-
 target/xtensa/core-dc233c.c                        |    2 +-
 target/xtensa/core-de212.c                         |    2 +-
 target/xtensa/core-de233_fpu.c                     |    2 +-
 target/xtensa/core-dsp3400.c                       |    2 +-
 target/xtensa/core-fsf.c                           |    2 +-
 target/xtensa/core-lx106.c                         |    2 +-
 target/xtensa/core-sample_controller.c             |    2 +-
 target/xtensa/core-test_kc705_be.c                 |    2 +-
 target/xtensa/core-test_mmuhifi_c3.c               |    2 +-
 target/xtensa/gdbstub.c                            |    2 +-
 target/xtensa/helper.c                             |    2 +-
 gdbstub/meson.build                                |   34 +-
 gdbstub/trace-events                               |    4 +-
 scripts/probe-gdb-support.py                       |   88 ++
 stubs/meson.build                                  |    1 +
 target/xtensa/import_core.sh                       |    2 +-
 tests/tcg/aarch64/Makefile.target                  |    2 +-
 tests/tcg/multiarch/Makefile.target                |    5 +
 tests/tcg/multiarch/system/Makefile.softmmu-target |    6 +-
 tests/tcg/s390x/Makefile.target                    |    2 +-
 93 files changed, 2462 insertions(+), 1818 deletions(-)
 create mode 100644 include/exec/target_long.h
 create mode 100644 include/exec/tb-flush.h
 create mode 100644 include/gdbstub/helpers.h
 create mode 100644 include/gdbstub/syscalls.h
 create mode 100644 include/gdbstub/user.h
 create mode 100644 gdbstub/syscalls.c
 create mode 100644 gdbstub/user-target.c
 create mode 100644 stubs/semihost-all.c
 create mode 100755 scripts/probe-gdb-support.py

-- 
2.39.2


