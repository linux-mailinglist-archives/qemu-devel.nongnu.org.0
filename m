Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F14CEB9A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:03:47 +0100 (CET)
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqY5-00030H-W1
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:03:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUa-000056-QQ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:08 -0500
Received: from [2a00:1450:4864:20::436] (port=44735
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUY-0003ft-Ju
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id u1so19297107wrg.11
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQIq1yNVklmQrtsqBjVjpE/XlTvK7dL6nf5vUmjem4k=;
 b=qpWKoAzGD/gZQzR9/4qNp0HKP3GVFtu/QJSSvsziwGBYxotzb4ANxmAN6eqQIp2yCt
 1Q09jVo+Dn5FW8DmtqpHlvAeIlJkSvnPi4Q1YuaI0xUGVJvql2/tDntqUxzX9/GYqkrP
 NJ43P0EpztUEU7nu94hLTvcHyrL5hvm69yYI8QGU7ugJdedFlP8mhBm72r5vrpe5QSyQ
 eDA+HF/pZzbW1halsp3OrszZP+0ypnWZP1yLjmjRChouFcgaNxlo2uxih4ugJbxAbN56
 J8yJLrLuPhdZLmUxMhBQ+6rrb1uB0sa4No78+Vk0cXJ6hiVpayJcIj3BQsOINSsUYUyY
 kaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQIq1yNVklmQrtsqBjVjpE/XlTvK7dL6nf5vUmjem4k=;
 b=7PenagS7aD/VKon63VxODc1bkeSkT/GIYscYiV+HOJH0d3CcoARgMbYmK9as3cTri7
 YgQ8HYlaEsh5NJrd32i0GiTRPFVDQKclYHacb8i7hAxtGmivFWZ+L9obJwd/+pQheUXP
 V/S1OGklTzK1Xbu978+w53OcdPsyd+57tIqdLY22mxT1TQGoW0e+HEthRsXQy6c/xN3w
 ZM/CJjwJdteyQokf96UtGCVwXoL6BkfABATX3tAMRPejDPscIdfzNFHDAtLsW+WapBwY
 TIUYA5OjyTtSxtRfgrSh92yW+0/k3Y0zGUMZ0BWwcQI0pUWEdlbihZUHHSuksN6ZTNci
 uzGA==
X-Gm-Message-State: AOAM532T3Ls7dY2OLKGTuR3ISN+tTsEuLpBOkZf98SQZ+POXDv5HW44g
 0IGEwVg4d/ZAgvUWC9VBMkOo0doJPts=
X-Google-Smtp-Source: ABdhPJxAd5gnFPK0CEN+CNnZWE0fKQ2BF5pA2AG1uTKBy7uZsWiq3siRWb+6EbfK4TgoNEh8rYARPw==
X-Received: by 2002:a05:6000:128f:b0:1f1:e586:87af with SMTP id
 f15-20020a056000128f00b001f1e58687afmr3687381wrx.222.1646571604224; 
 Sun, 06 Mar 2022 05:00:04 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 g12-20020a5d698c000000b001f1d8bb4618sm8028014wru.36.2022.03.06.05.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] Abstract ArchCPU
Date: Sun,  6 Mar 2022 13:59:27 +0100
Message-Id: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/abstract-arch-cpu-20220306

for you to fetch changes up to 5bbf37aa89881751828d28e38608db0371874aef:

  accel/tcg: Remove pointless CPUArchState casts (2022-03-06 13:15:42 +0100)

----------------------------------------------------------------
- Re-org accel/ and softmmu/ to have more target-agnostic objects.

- Use CPUArchState as an abstract type, defined by each target
  (CPUState is our interface with generic code, CPUArchState is
   our interface with target-specific code).

----------------------------------------------------------------

Philippe Mathieu-Daudé (32):
  accel: Restrict sysemu stubs to system emulation
  accel/meson: Only build hw virtualization with system emulation
  exec: Declare vaddr as a generic target-agnostic type
  exec: Make cpu_memory_rw_debug() target agnostic
  sysemu/memory_mapping: Become target-agnostic
  sysemu/kvm: Make kvm_on_sigbus() / kvm_on_sigbus_vcpu() target
    agnostic
  accel/kvm: Simplify user-mode #ifdef'ry
  accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
  softmmu/cpus: Code movement
  accel: Introduce AccelOpsClass::cpu_thread_is_idle()
  accel: Introduce AccelOpsClass::cpus_are_resettable()
  softmmu/globals: Remove unused 'hw/i386/*' headers
  softmmu/physmem: Remove unnecessary include
  softmmu/cpu-timers: Remove unused 'exec/exec-all.h' header
  misc: Remove unnecessary "sysemu/cpu-timers.h" include
  misc: Add missing "sysemu/cpu-timers.h" include
  exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu() target agnostic
  exec/cpu: Make address_space_init/reloading_memory_map target agnostic
  softmmu: Add qemu_init_arch_modules()
  softmmu: Build target-agnostic objects once
  meson: Display libfdt as disabled when system emulation is disabled
  exec/cpu_ldst: Include 'cpu.h' to get target_ulong definition
  cpu: Add missing 'exec/exec-all.h' and 'qemu/accel.h' headers
  target/i386/tcg/sysemu: Include missing 'exec/exec-all.h' header
  target: Include missing 'cpu.h'
  target/hexagon: Add missing 'hw/core/cpu.h' include
  target: Use forward declared type instead of structure type
  target: Use CPUArchState as interface to target-specific CPU state
  target: Introduce and use OBJECT_DECLARE_CPU_TYPE() macro
  target: Use ArchCPU as interface to target CPU
  target/i386: Remove pointless CPUArchState casts
  accel/tcg: Remove pointless CPUArchState casts

Taylor Simpson (1):
  Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE

 meson.build                          |  4 ++-
 include/exec/cpu-all.h               |  4 ---
 include/exec/cpu-common.h            | 39 ++++++++++++++++++++++++++++
 include/exec/cpu_ldst.h              |  1 +
 include/exec/exec-all.h              | 26 -------------------
 include/exec/gdbstub.h               | 25 +++++++++---------
 include/exec/poison.h                |  2 --
 include/hw/core/cpu.h                | 33 +++++++++++++----------
 include/qemu/typedefs.h              |  2 ++
 include/sysemu/accel-ops.h           |  3 +++
 include/sysemu/arch_init.h           |  2 ++
 include/sysemu/hax.h                 | 18 ++++++++-----
 include/sysemu/hw_accel.h            |  5 ----
 include/sysemu/kvm.h                 |  6 ++---
 include/sysemu/memory_mapping.h      |  5 ++--
 target/alpha/cpu-qom.h               |  3 +--
 target/alpha/cpu.h                   | 11 +++-----
 target/arm/cpu-qom.h                 |  3 +--
 target/arm/cpu.h                     |  7 ++---
 target/arm/hvf_arm.h                 |  2 +-
 target/avr/cpu-qom.h                 |  3 +--
 target/avr/cpu.h                     | 13 +++-------
 target/cris/cpu-qom.h                |  3 +--
 target/cris/cpu.h                    |  7 ++---
 target/hexagon/cpu.h                 | 23 ++++++----------
 target/hppa/cpu-qom.h                |  3 +--
 target/hppa/cpu.h                    | 12 +++------
 target/i386/cpu-qom.h                |  3 +--
 target/i386/cpu.h                    |  7 ++---
 target/m68k/cpu-qom.h                |  3 +--
 target/m68k/cpu.h                    |  7 ++---
 target/microblaze/cpu-qom.h          |  3 +--
 target/microblaze/cpu.h              |  9 +++----
 target/microblaze/mmu.h              |  2 ++
 target/mips/cpu-qom.h                |  3 +--
 target/mips/cpu.h                    | 10 +++----
 target/mips/internal.h               | 15 ++++++-----
 target/nios2/cpu.h                   |  9 +++----
 target/nios2/mmu.h                   |  2 ++
 target/openrisc/cpu.h                | 17 ++++--------
 target/ppc/cpu-qom.h                 |  5 ++--
 target/ppc/cpu.h                     |  7 ++---
 target/riscv/cpu.h                   | 11 +++-----
 target/riscv/pmp.h                   |  2 ++
 target/rx/cpu-qom.h                  |  5 +---
 target/rx/cpu.h                      |  6 ++---
 target/s390x/cpu-qom.h               |  7 +++--
 target/s390x/cpu.h                   |  7 ++---
 target/sh4/cpu-qom.h                 |  3 +--
 target/sh4/cpu.h                     |  7 ++---
 target/sparc/cpu-qom.h               |  3 +--
 target/sparc/cpu.h                   |  9 +++----
 target/tricore/cpu-qom.h             |  3 +--
 target/tricore/cpu.h                 | 10 +++----
 target/xtensa/cpu-qom.h              |  3 +--
 target/xtensa/cpu.h                  | 13 ++++------
 accel/kvm/kvm-accel-ops.c            | 12 +++++++++
 accel/qtest/qtest.c                  |  1 -
 accel/stubs/hax-stub.c               |  2 ++
 accel/stubs/kvm-stub.c               |  5 ----
 accel/tcg/cpu-exec.c                 |  4 +--
 accel/tcg/tcg-accel-ops-icount.c     |  1 +
 accel/tcg/tcg-accel-ops-mttcg.c      |  1 +
 accel/tcg/tcg-accel-ops-rr.c         |  1 +
 accel/tcg/tcg-accel-ops.c            |  1 +
 cpu.c                                |  8 +++---
 softmmu/arch_init.c                  |  9 +++++++
 softmmu/cpu-timers.c                 |  1 -
 softmmu/cpus.c                       | 23 +++++++++-------
 softmmu/globals.c                    |  2 --
 softmmu/memory_mapping.c             |  1 +
 softmmu/physmem.c                    |  7 +++--
 softmmu/vl.c                         |  5 +---
 target/alpha/translate.c             |  1 -
 target/i386/hax/hax-all.c            | 11 +++-----
 target/i386/nvmm/nvmm-all.c          | 14 +++++-----
 target/i386/tcg/sysemu/excp_helper.c |  1 +
 target/i386/tcg/sysemu/misc_helper.c |  1 +
 target/i386/whpx/whpx-accel-ops.c    |  6 +++++
 target/i386/whpx/whpx-all.c          | 18 ++++++-------
 target/riscv/csr.c                   |  1 +
 tests/unit/ptimer-test-stubs.c       |  1 -
 accel/meson.build                    | 12 +++++----
 accel/stubs/meson.build              | 11 +++++---
 softmmu/meson.build                  | 24 ++++++++---------
 85 files changed, 305 insertions(+), 336 deletions(-)

-- 
2.35.1


