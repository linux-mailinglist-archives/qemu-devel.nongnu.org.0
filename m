Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA0F4CEE8F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:35:02 +0100 (CET)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0P0-0002ZN-18
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:35:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0IA-0004na-8Q
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:27:58 -0500
Received: from [2a00:1450:4864:20::334] (port=42666
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0I8-0000Zt-9f
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:27:57 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso8315591wmr.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 15:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cdsng5+QHYSkS+sGe6TtsNfAGbO/1Fxw+/QdFNaIiHI=;
 b=X/HmkH6p6AP4sjlLduRhwae4eKOdYEYGZPTAt44eDTmMVP4KHlsID6lecI5lh8Wq/D
 EOMRPPTijWJ41VF2XuSXiyMX1XMTjNuiYHp+7+JCZxBnRojsZUiiUTO2mc++WIqDTbBp
 +l2I/juwnUHIzd+zuYE/DmeuJhmzN9+jr5aJDIf5/4P+pKJoBU+kKCh7j0R4PptNO/0G
 lXHBq1g19+qgsBn+ZZIRoEL9yE3cblLnVmu8JsFkNQTBovWJLFPF4NM+ayTBOMinohAj
 0YLZOpJlVcVQRO5J5wQfA7ziFFVnjrkrg17RpmoMWkkhOtgX6G0dJ5VSmvW0ExIBKK2U
 Avqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cdsng5+QHYSkS+sGe6TtsNfAGbO/1Fxw+/QdFNaIiHI=;
 b=a9pOcpnhcn/pNLu05brRgqFVfqd7ixhtuQLaBVs0EHM9Ol+YiCJRSvuUQZ+ibGktKF
 A3eziUSahPh9vKIe6GGH/uisYFYJCC+cTAv4UWjAD6kIcKv3pN/i8cg7nsRgEKq750wH
 yecw0d00Oa2gxKT09TPy4IobE4n8+PVYW5h0QiE3/qhMQzcaP99XAbiDPuET5ejJNQP/
 KEt64Bb0ICFpeC1ePtKcdnqq13urBB20kfhegtfUh5lpGrw0N1HrzxWYfIM1++VIzSIu
 YQZI3lt9ppeVRm+u8Ir/q61tWV5x+Ix218k3Yz+Hz0UKHjY2LrRQasexA/B79EUhdiDs
 RsAQ==
X-Gm-Message-State: AOAM533wlHVkl9LRp/ucHGizpEIl91ZMgkzlnJc1E56iD2H5joLULJWL
 z8V2zX3rMLmZjJe6hT1i2qg=
X-Google-Smtp-Source: ABdhPJz4DcWDidFKccCI4pzTvQnWpSgSxRR5UijTB70vR5p8+FyVvys5sAnBRCgae952nr/gVF148g==
X-Received: by 2002:a1c:7303:0:b0:37c:9270:2ff4 with SMTP id
 d3-20020a1c7303000000b0037c92702ff4mr6993810wmb.99.1646609274784; 
 Sun, 06 Mar 2022 15:27:54 -0800 (PST)
Received: from nuc.. ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 g1-20020a1c4e01000000b003899c8053e1sm7604745wmh.41.2022.03.06.15.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 15:27:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: 
Subject: [PULL v2 00/33] Abstract ArchCPU
Date: Mon,  7 Mar 2022 00:27:49 +0100
Message-Id: <20220306232750.41671-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/abstract-arch-cpu-20220307

for you to fetch changes up to 61deada4bf54fddf1bc36e15c16269c33462aa90:

  accel/tcg: Remove pointless CPUArchState casts (2022-03-06 22:47:52 +0100)

Since v1: Fixed Darwin/x86_64 (HVF)

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

 meson.build                          |   4 +-
 include/exec/cpu-all.h               |   4 -
 include/exec/cpu-common.h            |  39 ++++++++++
 include/exec/cpu_ldst.h              |   1 +
 include/exec/exec-all.h              |  26 -------
 include/exec/gdbstub.h               |  25 +++---
 include/exec/poison.h                |   2 -
 include/hw/core/cpu.h                |  33 ++++----
 include/qemu/typedefs.h              |   2 +
 include/sysemu/accel-ops.h           |   3 +
 include/sysemu/arch_init.h           |   2 +
 include/sysemu/hax.h                 |  18 +++--
 include/sysemu/hw_accel.h            |   5 --
 include/sysemu/kvm.h                 |   6 +-
 include/sysemu/memory_mapping.h      |   5 +-
 target/alpha/cpu-qom.h               |   3 +-
 target/alpha/cpu.h                   |  11 +--
 target/arm/cpu-qom.h                 |   3 +-
 target/arm/cpu.h                     |   7 +-
 target/arm/hvf_arm.h                 |   2 +-
 target/avr/cpu-qom.h                 |   3 +-
 target/avr/cpu.h                     |  13 +---
 target/cris/cpu-qom.h                |   3 +-
 target/cris/cpu.h                    |   7 +-
 target/hexagon/cpu.h                 |  23 ++----
 target/hppa/cpu-qom.h                |   3 +-
 target/hppa/cpu.h                    |  12 +--
 target/i386/cpu-qom.h                |   3 +-
 target/i386/cpu.h                    |   7 +-
 target/i386/hvf/x86_emu.h            |  22 +++---
 target/m68k/cpu-qom.h                |   3 +-
 target/m68k/cpu.h                    |   7 +-
 target/microblaze/cpu-qom.h          |   3 +-
 target/microblaze/cpu.h              |   9 +--
 target/microblaze/mmu.h              |   2 +
 target/mips/cpu-qom.h                |   3 +-
 target/mips/cpu.h                    |  10 +--
 target/mips/internal.h               |  15 ++--
 target/nios2/cpu.h                   |   9 +--
 target/nios2/mmu.h                   |   2 +
 target/openrisc/cpu.h                |  17 ++---
 target/ppc/cpu-qom.h                 |   5 +-
 target/ppc/cpu.h                     |   7 +-
 target/riscv/cpu.h                   |  11 +--
 target/riscv/pmp.h                   |   2 +
 target/rx/cpu-qom.h                  |   5 +-
 target/rx/cpu.h                      |   6 +-
 target/s390x/cpu-qom.h               |   7 +-
 target/s390x/cpu.h                   |   7 +-
 target/sh4/cpu-qom.h                 |   3 +-
 target/sh4/cpu.h                     |   7 +-
 target/sparc/cpu-qom.h               |   3 +-
 target/sparc/cpu.h                   |   9 +--
 target/tricore/cpu-qom.h             |   3 +-
 target/tricore/cpu.h                 |  10 +--
 target/xtensa/cpu-qom.h              |   3 +-
 target/xtensa/cpu.h                  |  13 ++--
 accel/kvm/kvm-accel-ops.c            |  12 +++
 accel/qtest/qtest.c                  |   1 -
 accel/stubs/hax-stub.c               |   2 +
 accel/stubs/kvm-stub.c               |   5 --
 accel/tcg/cpu-exec.c                 |   4 +-
 accel/tcg/tcg-accel-ops-icount.c     |   1 +
 accel/tcg/tcg-accel-ops-mttcg.c      |   1 +
 accel/tcg/tcg-accel-ops-rr.c         |   1 +
 accel/tcg/tcg-accel-ops.c            |   1 +
 cpu.c                                |   8 +-
 softmmu/arch_init.c                  |   9 +++
 softmmu/cpu-timers.c                 |   1 -
 softmmu/cpus.c                       |  23 +++---
 softmmu/globals.c                    |   2 -
 softmmu/memory_mapping.c             |   1 +
 softmmu/physmem.c                    |   7 +-
 softmmu/vl.c                         |   5 +-
 target/alpha/translate.c             |   1 -
 target/i386/hax/hax-all.c            |  11 +--
 target/i386/hvf/x86_emu.c            | 110 +++++++++++++--------------
 target/i386/nvmm/nvmm-all.c          |  14 ++--
 target/i386/tcg/sysemu/excp_helper.c |   1 +
 target/i386/tcg/sysemu/misc_helper.c |   1 +
 target/i386/whpx/whpx-accel-ops.c    |   6 ++
 target/i386/whpx/whpx-all.c          |  18 ++---
 target/riscv/csr.c                   |   1 +
 tests/unit/ptimer-test-stubs.c       |   1 -
 accel/meson.build                    |  12 +--
 accel/stubs/meson.build              |  11 ++-
 softmmu/meson.build                  |  24 +++---
 87 files changed, 371 insertions(+), 402 deletions(-)

-- 
2.35.1


