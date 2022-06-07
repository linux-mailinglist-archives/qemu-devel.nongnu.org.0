Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF053E47F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:50:31 +0200 (CEST)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyCBi-0004oI-Fd
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nyC5G-0007D0-N4
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:43:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39422 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nyC5D-0004MV-7R
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:43:50 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+Z29p1ishIXAA--.3714S2;
 Mon, 06 Jun 2022 20:43:34 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, maobibo@loongson.cn
Subject: [PATCH v7 00/43] Add LoongArch softmmu support
Date: Mon,  6 Jun 2022 20:42:50 +0800
Message-Id: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+Z29p1ishIXAA--.3714S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Zr15Kr4kJr4fZFyfCF1UAwb_yoW8Jr17Go
 WrAFWUXw4xGr1Fkr10k3sxXrWYgr97Cr48Aa9ru345WF4rCa45XFy7Kws0y343ZrnrGrW5
 G347Wa1DJrZ7Jr93n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi All,

As this series only supports running binary files in ELF format, and
does not depend on BIOS and kernel file. so this series are changed from
RFC to patch vX.


The manual:
  - https://github.com/loongson/LoongArch-Documentation/releases/tag/2022.03.17

Old series:
  - https://patchew.org/QEMU/20220328125749.2918087-1-yangxiaojuan@loongson.cn/
  - https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/

This version we have done the following tests

configure with --enable-sanitizers

- make check  
   Ok:                 117
   Expected Fail:      0   
   Fail:               0
   Unexpected Pass:    0   
   Skipped:            2
   Timeout:            0
   
- make check-tcg

   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
 tests/fp/berkeley-softfloat-3 dtc slirp
   BUILD   loongarch64-softmmu guest-tests
   RUN     loongarch64-softmmu guest-tests
   TEST    hello on loongarch64
 ==559429==WARNING: ASan doesn't fully support makecontext/swapcontext
 functions and may produce false positives in some cases!
   TEST    memory on loongarch64
 ==559435==WARNING: ASan doesn't fully support makecontext/swapcontext
 functions and may produce false positives in some cases!


- IMAGES='fedora-i386-cross fedora-win32-cross fedora-win64-cross' \
  make docker-test-build

  build success

- QTEST_QEMU_BINARY='./qemu-system-loongarch64' \
   ./tests/qtest/device-introspect-test -v

  ok 6 /loongarch64/device/introspect/concrete/defaults/none
  # End of defaults tests
  # End of concrete tests
  # End of introspect tests
  # End of device tests
  # End of loongarch64 tests

Need review patches:

  0034-hw-intc-Add-LoongArch-extioi-interrupt-controller-EI.patch


Thanks.
Xiaojuan

----

v7:
  - Rebase
  - Fixed extioi device emulation according to v6 advice.

v6:
  - Fixed ipi device check errors when enabled sanitizers. (patch 31)

  - Removed acpi device emulation temporarily, and replaced it with virt
power manager. (patch 40)

v5:
  - Fixed loongarch extioi device emulation.
  - Fixed loongarch rtc device emulation.
  - Fixed 'make docker-test-build' error.

v4:
  - Use 'la464' cpu type.
  - Fixed loongarch extioi device emulation.
  - Fixed loongarch rtc device emulation.
  - Fixed loongarch load elf function.

v3:
  - Add Check csr_names.
  - Drop CSR_CPUID, use cpu->cpu_index.
  - Fixed loongarch extioi device emulation. ipmap and coremap register
    change to 32bits.
  - Check_iocsr() function moved to loongarch_ipi_writel().
  - Pch_pic/msi use qdev_init_gpio_out() to init irq, and use
    qdev_connect_gpio_out() to connect irq.
  - Load elf function moved to hw/loongarch/loongson.c

v2:
  - Improvents to CSR/IOCSR instructions translation.
  - Fixed extioi device emulation. It is represented by only one memory
    region.
  - Fixed IPI device emulation. The registers are represented with
    uint64_t.
  - Use do_cpu_reset() and cpu_set_pc() to specify the load address.

v6: https://patchew.org/QEMU/20220601102509.985650-1-yangxiaojuan@loongson.cn/

Song Gao (18):
  target/loongarch: Add README
  target/loongarch: Add core definition
  target/loongarch: Add main translation routines
  target/loongarch: Add fixed point arithmetic instruction translation
  target/loongarch: Add fixed point shift instruction translation
  target/loongarch: Add fixed point bit instruction translation
  target/loongarch: Add fixed point load/store instruction translation
  target/loongarch: Add fixed point atomic instruction translation
  target/loongarch: Add fixed point extra instruction translation
  target/loongarch: Add floating point arithmetic instruction
    translation
  target/loongarch: Add floating point comparison instruction
    translation
  target/loongarch: Add floating point conversion instruction
    translation
  target/loongarch: Add floating point move instruction translation
  target/loongarch: Add floating point load/store instruction
    translation
  target/loongarch: Add branch instruction translation
  target/loongarch: Add disassembler
  target/loongarch: Add target build suport
  target/loongarch: 'make check-tcg' support

Xiaojuan Yang (25):
  target/loongarch: Add system emulation introduction
  target/loongarch: Add CSRs definition
  target/loongarch: Add basic vmstate description of CPU.
  target/loongarch: Implement qmp_query_cpu_definitions()
  target/loongarch: Add MMU support for LoongArch CPU.
  target/loongarch: Add LoongArch interrupt and exception handle
  target/loongarch: Add constant timer support
  target/loongarch: Add LoongArch CSR instruction
  target/loongarch: Add LoongArch IOCSR instruction
  target/loongarch: Add TLB instruction support
  target/loongarch: Add other core instructions support
  target/loongarch: Add timer related instructions support.
  hw/loongarch: Add support loongson3 virt machine type.
  hw/loongarch: Add LoongArch ipi interrupt support(IPI)
  hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
  hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
  hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
  hw/loongarch: Add irq hierarchy for the system
  Enable common virtio pci support for LoongArch
  hw/loongarch: Add some devices support for 3A5000.
  hw/loongarch: Add LoongArch ls7a rtc device support
  hw/loongarch: Add LoongArch load elf function.
  hw/loongarch: Add LoongArch virt power manager support.
  target/loongarch: Add gdb support.
  tests/tcg/loongarch64: Add hello/memory test in loongarch64 system

 MAINTAINERS                                   |  24 +
 .../devices/loongarch64-softmmu/default.mak   |   3 +
 configs/targets/loongarch64-softmmu.mak       |   4 +
 configure                                     |   1 +
 docs/system/loongarch/loongson3.rst           |  41 +
 gdb-xml/loongarch-base64.xml                  |  44 +
 gdb-xml/loongarch-fpu64.xml                   |  57 ++
 hw/Kconfig                                    |   1 +
 hw/intc/Kconfig                               |  15 +
 hw/intc/loongarch_extioi.c                    | 312 +++++++
 hw/intc/loongarch_ipi.c                       | 242 +++++
 hw/intc/loongarch_pch_msi.c                   |  73 ++
 hw/intc/loongarch_pch_pic.c                   | 431 +++++++++
 hw/intc/meson.build                           |   4 +
 hw/intc/trace-events                          |  22 +
 hw/loongarch/Kconfig                          |  16 +
 hw/loongarch/loongson3.c                      | 382 ++++++++
 hw/loongarch/meson.build                      |   4 +
 hw/meson.build                                |   1 +
 hw/rtc/Kconfig                                |   3 +
 hw/rtc/ls7a_rtc.c                             | 528 +++++++++++
 hw/rtc/meson.build                            |   1 +
 include/disas/dis-asm.h                       |   2 +
 include/exec/poison.h                         |   2 +
 include/hw/intc/loongarch_extioi.h            |  62 ++
 include/hw/intc/loongarch_ipi.h               |  52 ++
 include/hw/intc/loongarch_pch_msi.h           |  20 +
 include/hw/intc/loongarch_pch_pic.h           |  69 ++
 include/hw/loongarch/virt.h                   |  33 +
 include/hw/pci-host/ls7a.h                    |  44 +
 include/sysemu/arch_init.h                    |   1 +
 meson.build                                   |   1 +
 qapi/machine-target.json                      |   6 +-
 qapi/machine.json                             |   2 +-
 softmmu/qdev-monitor.c                        |   3 +-
 target/Kconfig                                |   1 +
 target/loongarch/Kconfig                      |   2 +
 target/loongarch/README                       |  64 ++
 target/loongarch/constant_timer.c             |  64 ++
 target/loongarch/cpu-csr.h                    | 208 +++++
 target/loongarch/cpu-param.h                  |  18 +
 target/loongarch/cpu.c                        | 704 ++++++++++++++
 target/loongarch/cpu.h                        | 391 ++++++++
 target/loongarch/csr_helper.c                 |  87 ++
 target/loongarch/disas.c                      | 757 +++++++++++++++
 target/loongarch/fpu_helper.c                 | 862 ++++++++++++++++++
 target/loongarch/gdbstub.c                    |  81 ++
 target/loongarch/helper.h                     | 130 +++
 target/loongarch/insn_trans/trans_arith.c.inc | 304 ++++++
 .../loongarch/insn_trans/trans_atomic.c.inc   | 113 +++
 target/loongarch/insn_trans/trans_bit.c.inc   | 212 +++++
 .../loongarch/insn_trans/trans_branch.c.inc   |  83 ++
 target/loongarch/insn_trans/trans_extra.c.inc | 101 ++
 .../loongarch/insn_trans/trans_farith.c.inc   | 105 +++
 target/loongarch/insn_trans/trans_fcmp.c.inc  |  56 ++
 target/loongarch/insn_trans/trans_fcnv.c.inc  |  33 +
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 153 ++++
 target/loongarch/insn_trans/trans_fmov.c.inc  | 157 ++++
 .../loongarch/insn_trans/trans_memory.c.inc   | 229 +++++
 .../insn_trans/trans_privileged.c.inc         | 466 ++++++++++
 target/loongarch/insn_trans/trans_shift.c.inc | 106 +++
 target/loongarch/insns.decode                 | 486 ++++++++++
 target/loongarch/internals.h                  |  56 ++
 target/loongarch/iocsr_helper.c               |  67 ++
 target/loongarch/machine.c                    | 102 +++
 target/loongarch/meson.build                  |  30 +
 target/loongarch/op_helper.c                  | 133 +++
 target/loongarch/tlb_helper.c                 | 763 ++++++++++++++++
 target/loongarch/translate.c                  | 281 ++++++
 target/loongarch/translate.h                  |  45 +
 target/meson.build                            |   1 +
 tests/tcg/loongarch64/Makefile.softmmu-target |  33 +
 tests/tcg/loongarch64/system/boot.S           |  56 ++
 tests/tcg/loongarch64/system/kernel.ld        |  30 +
 tests/tcg/loongarch64/system/regdef.h         |  86 ++
 75 files changed, 10158 insertions(+), 4 deletions(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 configs/targets/loongarch64-softmmu.mak
 create mode 100644 docs/system/loongarch/loongson3.rst
 create mode 100644 gdb-xml/loongarch-base64.xml
 create mode 100644 gdb-xml/loongarch-fpu64.xml
 create mode 100644 hw/intc/loongarch_extioi.c
 create mode 100644 hw/intc/loongarch_ipi.c
 create mode 100644 hw/intc/loongarch_pch_msi.c
 create mode 100644 hw/intc/loongarch_pch_pic.c
 create mode 100644 hw/loongarch/Kconfig
 create mode 100644 hw/loongarch/loongson3.c
 create mode 100644 hw/loongarch/meson.build
 create mode 100644 hw/rtc/ls7a_rtc.c
 create mode 100644 include/hw/intc/loongarch_extioi.h
 create mode 100644 include/hw/intc/loongarch_ipi.h
 create mode 100644 include/hw/intc/loongarch_pch_msi.h
 create mode 100644 include/hw/intc/loongarch_pch_pic.h
 create mode 100644 include/hw/loongarch/virt.h
 create mode 100644 include/hw/pci-host/ls7a.h
 create mode 100644 target/loongarch/Kconfig
 create mode 100644 target/loongarch/README
 create mode 100644 target/loongarch/constant_timer.c
 create mode 100644 target/loongarch/cpu-csr.h
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/csr_helper.c
 create mode 100644 target/loongarch/disas.c
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/gdbstub.c
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/insn_trans/trans_arith.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_bit.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_extra.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_farith.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fcmp.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fcnv.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fmov.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_memory.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_privileged.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_shift.c.inc
 create mode 100644 target/loongarch/insns.decode
 create mode 100644 target/loongarch/internals.h
 create mode 100644 target/loongarch/iocsr_helper.c
 create mode 100644 target/loongarch/machine.c
 create mode 100644 target/loongarch/meson.build
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/tlb_helper.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h
 create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
 create mode 100644 tests/tcg/loongarch64/system/boot.S
 create mode 100644 tests/tcg/loongarch64/system/kernel.ld
 create mode 100644 tests/tcg/loongarch64/system/regdef.h

-- 
2.31.1


