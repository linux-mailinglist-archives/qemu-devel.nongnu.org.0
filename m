Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503C74E9747
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:04:22 +0200 (CEST)
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYp2j-0006si-9W
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:04:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nYowh-0002dC-RS
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34572 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nYowe-0001Id-8V
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:07 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxbxPOsEFih08RAA--.17957S2; 
 Mon, 28 Mar 2022 20:57:50 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 00/29] Add LoongArch softmmu support
Date: Mon, 28 Mar 2022 20:57:20 +0800
Message-Id: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxbxPOsEFih08RAA--.17957S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JryDCF13XrWfKFyDtw1DWrg_yoWfWw4rpr
 W7uw15Kr48GFZrJrsYga45Wr98Jrn7Gr4293WSqry8CrWIvry5ZFn5tasxZFy3Jay8Gry0
 qr1Fkw1UWa1UJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series patch add softmmu support for LoongArch.
The latest kernel:
  * https://github.com/loongson/linux/tree/loongarch-next
The latest uefi:
  * https://github.com/loongson/edk2
  * https://github.com/loongson/edk2-platforms
The manual:
  * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11

You can get LoongArch qemu series like this:
   git clone https://github.com/loongson/qemu.git
   git checkout tcg-dev


Changes for v7:

1. Moved extioi memory region init function to loongarch_extioi_instance_init.
2. Replaced DECLARE_INSTANCE_CHECKER with OBJECT_DECLARE_SIMPLE_TYPE.
3. Fixed the usage of typedef struct.


Changes for v6: 

1. Add the new loongarch_cpu_init function.
2. Improved extioi memory region.
3. Replaced the original LS7A bridge with a new GPEX bridge.


Changes for v5: 

1. Fix host bridge map irq function.
2. Move cpu timer init function into machine init.
3. Adjust memory region layout.
4. Add the documentation at docs/system/loongarch/loongson3.rst.
   - Introduction to 3a5000 virt.
   - Output of "info mtree".


Changes for v4:
1. Uefi code is open and add some fdt interface to pass info between qemu and uefi.
2. Use a per cpu address space for iocsr.
3. Modify the tlb emulation.
4. Machine and board code mainly follow Mark's advice.
5. Adjust pci host space map.
6. Use more memregion to simplify the interrupt controller's emulate.


Changes for v3:
1.Target code mainly follow Richard's code review comments.
2.Put the csr and iocsr read/write instruction emulate into 2 different patch.
3.Simply the tlb emulation.
4.Delete some unused csr registers defintion.
5.Machine and board code mainly follow Mark's advice, discard the obsolete interface.
6.NUMA function is removed for it is not completed.
7.Adjust some format problem and the Naming problem


Changes for v3:
1.Target code mainly follow Richard's code review comments.
2.Put the csr and iocsr read/write instruction emulate into 2 different patch.
3.Simply the tlb emulation.
4.Delete some unused csr registers defintion.
5.Machine and board code mainly follow Mark's advice, discard the obsolete interface.
6.NUMA function is removed for it is not completed.
7.Adjust some format problem and the Naming problem


Changes for v2:
1.Combine patch 2 and 3 into one.
2.Adjust the order of the patch.
3.Put all the binaries on the github.
4.Modify some emulate errors when use the kernel from the github.
5.Adjust some format problem and the Naming problem
6.Others mainly follow Richard's code review comments.

Please help review!

Thanks


Xiaojuan Yang (29):
  target/loongarch: Add system emulation introduction
  target/loongarch: Add CSRs definition
  target/loongarch: Add basic vmstate description of CPU.
  target/loongarch: Implement qmp_query_cpu_definitions()
  target/loongarch: Add constant timer support
  target/loongarch: Add MMU support for LoongArch CPU.
  target/loongarch: Add LoongArch CSR instruction
  target/loongarch: Add LoongArch IOCSR instruction
  target/loongarch: Add TLB instruction support
  target/loongarch: Add other core instructions support
  target/loongarch: Add LoongArch interrupt and exception handle
  target/loongarch: Add timer related instructions support.
  target/loongarch: Add gdb support.
  hw/loongarch: Add support loongson3 virt machine type.
  hw/loongarch: Add LoongArch cpu interrupt support(CPUINTC)
  hw/loongarch: Add LoongArch ipi interrupt support(IPI)
  hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
  hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
  hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
  hw/loongarch: Add irq hierarchy for the system
  Enable common virtio pci support for LoongArch
  hw/loongarch: Add some devices support for 3A5000.
  hw/loongarch: Add LoongArch ls7a rtc device support
  hw/loongarch: Add default bios startup support.
  hw/loongarch: Add -kernel and -initrd options support
  hw/loongarch: Add LoongArch smbios support
  hw/loongarch: Add LoongArch acpi support
  hw/loongarch: Add fdt support.
  tests/tcg/loongarch64: Add hello/memory test in loongarch64 system

 MAINTAINERS                                   |  20 +
 .../devices/loongarch64-softmmu/default.mak   |   3 +
 configs/targets/loongarch64-softmmu.mak       |   4 +
 docs/system/loongarch/loongson3.rst           |  37 +
 gdb-xml/loongarch-base64.xml                  |  44 +
 gdb-xml/loongarch-fpu64.xml                   |  57 ++
 hw/Kconfig                                    |   1 +
 hw/acpi/Kconfig                               |   4 +
 hw/acpi/ls7a.c                                | 374 +++++++++
 hw/acpi/meson.build                           |   1 +
 hw/intc/Kconfig                               |  15 +
 hw/intc/loongarch_extioi.c                    | 408 ++++++++++
 hw/intc/loongarch_ipi.c                       | 164 ++++
 hw/intc/loongarch_pch_msi.c                   |  75 ++
 hw/intc/loongarch_pch_pic.c                   | 488 +++++++++++
 hw/intc/meson.build                           |   4 +
 hw/intc/trace-events                          |  27 +
 hw/loongarch/Kconfig                          |  23 +
 hw/loongarch/acpi-build.c                     | 636 +++++++++++++++
 hw/loongarch/fw_cfg.c                         |  33 +
 hw/loongarch/fw_cfg.h                         |  15 +
 hw/loongarch/loongson3.c                      | 752 +++++++++++++++++
 hw/loongarch/meson.build                      |   6 +
 hw/meson.build                                |   1 +
 hw/rtc/Kconfig                                |   3 +
 hw/rtc/ls7a_rtc.c                             | 323 ++++++++
 hw/rtc/meson.build                            |   1 +
 include/exec/poison.h                         |   2 +
 include/hw/acpi/ls7a.h                        |  53 ++
 include/hw/intc/loongarch_extioi.h            |  77 ++
 include/hw/intc/loongarch_ipi.h               |  47 ++
 include/hw/intc/loongarch_pch_msi.h           |  21 +
 include/hw/intc/loongarch_pch_pic.h           |  80 ++
 include/hw/loongarch/loongarch.h              |  75 ++
 include/hw/pci-host/ls7a.h                    |  48 ++
 include/sysemu/arch_init.h                    |   1 +
 linux-user/loongarch64/cpu_loop.c             |   8 +-
 qapi/machine-target.json                      |   6 +-
 qapi/machine.json                             |   2 +-
 softmmu/qdev-monitor.c                        |   3 +-
 target/Kconfig                                |   1 +
 target/loongarch/Kconfig                      |   2 +
 target/loongarch/README                       |  28 +
 target/loongarch/constant_timer.c             |  62 ++
 target/loongarch/cpu-csr.h                    | 236 ++++++
 target/loongarch/cpu-param.h                  |   2 +-
 target/loongarch/cpu.c                        | 363 ++++++++-
 target/loongarch/cpu.h                        | 218 ++++-
 target/loongarch/csr_helper.c                 | 112 +++
 target/loongarch/disas.c                      |  57 ++
 target/loongarch/fpu_helper.c                 |   2 +-
 target/loongarch/gdbstub.c                    |  99 +++
 target/loongarch/helper.h                     |  26 +
 target/loongarch/insn_trans/trans_extra.c.inc |  36 +-
 .../insn_trans/trans_privileged.c.inc         | 410 ++++++++++
 target/loongarch/insns.decode                 |  44 +
 target/loongarch/internals.h                  |  28 +
 target/loongarch/iocsr_helper.c               | 139 ++++
 target/loongarch/machine.c                    | 102 +++
 target/loongarch/meson.build                  |  11 +
 target/loongarch/op_helper.c                  |  52 ++
 target/loongarch/tlb_helper.c                 | 767 ++++++++++++++++++
 target/loongarch/translate.c                  |   9 +-
 tests/tcg/loongarch64/Makefile.softmmu-target |  33 +
 tests/tcg/loongarch64/system/boot.S           |  56 ++
 tests/tcg/loongarch64/system/kernel.ld        |  30 +
 tests/tcg/loongarch64/system/regdef.h         |  86 ++
 67 files changed, 6922 insertions(+), 31 deletions(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 configs/targets/loongarch64-softmmu.mak
 create mode 100644 docs/system/loongarch/loongson3.rst
 create mode 100644 gdb-xml/loongarch-base64.xml
 create mode 100644 gdb-xml/loongarch-fpu64.xml
 create mode 100644 hw/acpi/ls7a.c
 create mode 100644 hw/intc/loongarch_extioi.c
 create mode 100644 hw/intc/loongarch_ipi.c
 create mode 100644 hw/intc/loongarch_pch_msi.c
 create mode 100644 hw/intc/loongarch_pch_pic.c
 create mode 100644 hw/loongarch/Kconfig
 create mode 100644 hw/loongarch/acpi-build.c
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h
 create mode 100644 hw/loongarch/loongson3.c
 create mode 100644 hw/loongarch/meson.build
 create mode 100644 hw/rtc/ls7a_rtc.c
 create mode 100644 include/hw/acpi/ls7a.h
 create mode 100644 include/hw/intc/loongarch_extioi.h
 create mode 100644 include/hw/intc/loongarch_ipi.h
 create mode 100644 include/hw/intc/loongarch_pch_msi.h
 create mode 100644 include/hw/intc/loongarch_pch_pic.h
 create mode 100644 include/hw/loongarch/loongarch.h
 create mode 100644 include/hw/pci-host/ls7a.h
 create mode 100644 target/loongarch/Kconfig
 create mode 100644 target/loongarch/constant_timer.c
 create mode 100644 target/loongarch/cpu-csr.h
 create mode 100644 target/loongarch/csr_helper.c
 create mode 100644 target/loongarch/gdbstub.c
 create mode 100644 target/loongarch/insn_trans/trans_privileged.c.inc
 create mode 100644 target/loongarch/iocsr_helper.c
 create mode 100644 target/loongarch/machine.c
 create mode 100644 target/loongarch/tlb_helper.c
 create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
 create mode 100644 tests/tcg/loongarch64/system/boot.S
 create mode 100644 tests/tcg/loongarch64/system/kernel.ld
 create mode 100644 tests/tcg/loongarch64/system/regdef.h

-- 
2.31.1


