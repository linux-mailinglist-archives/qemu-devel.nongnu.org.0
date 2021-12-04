Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1943F4684AF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:12:08 +0100 (CET)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtTte-0002Ni-Qb
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpP-0007Nk-BG
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57966 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpK-0003FC-U4
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:43 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S2;
 Sat, 04 Dec 2021 20:07:25 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 00/27] Add LoongArch softmmu support.
Date: Sat,  4 Dec 2021 20:06:58 +0800
Message-Id: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtryDXFyrKw47Ary7WF4DArb_yoWxZw4fpr
 W7uwn8Kr48GrZrJr95Xa45Xr95XFn7Gr4293WSqry8CrWavry5ZF1kt3sxXFy3Jay8Gry0
 qF1Fkw1UWa17XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series patch add softmmu support for LoongArch.
Base on the linux-user emulation support V13 patch.
  * https://patchew.org/QEMU/1638610165-15036-1-git-send-email-gaosong@loongson.cn/
The latest kernel:
  * https://github.com/loongson/linux/tree/loongarch-next
The manual:
  * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11

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

Xiaojuan Yang (27):
  target/loongarch: Update README
  target/loongarch: Add CSR registers definition
  target/loongarch: Add basic vmstate description of CPU.
  target/loongarch: Implement qmp_query_cpu_definitions()
  target/loongarch: Add stabletimer support
  target/loongarch: Add MMU support for LoongArch CPU.
  target/loongarch: Add LoongArch CSR instruction
  target/loongarch: Add LoongArch IOCSR instruction
  target/loongarch: Add TLB instruction support
  target/loongarch: Add other core instructions support
  target/loongarch: Add LoongArch interrupt and exception handle
  target/loongarch: Add timer related instructions support.
  target/loongarch: Add gdb support.
  hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson3
    Platform
  hw/loongarch: Add support loongson3-ls7a machine type.
  hw/loongarch: Add LoongArch cpu interrupt support(CPUINTC)
  hw/loongarch: Add LoongArch ipi interrupt support(IPI)
  hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
  hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
  hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
  hw/loongarch: Add irq hierarchy for the system
  hw/loongarch: Add some devices support for 3A5000.
  hw/loongarch: Add LoongArch ls7a rtc device support
  hw/loongarch: Add default bios startup support.
  hw/loongarch: Add -kernel and -initrd options support
  hw/loongarch: Add LoongArch smbios support
  hw/loongarch: Add LoongArch acpi support

 .../devices/loongarch64-softmmu/default.mak   |   3 +
 configs/targets/loongarch64-softmmu.mak       |   4 +
 gdb-xml/loongarch-base64.xml                  |  43 +
 gdb-xml/loongarch-fpu64.xml                   |  57 ++
 hw/Kconfig                                    |   1 +
 hw/acpi/Kconfig                               |   4 +
 hw/acpi/ls7a.c                                | 349 ++++++++
 hw/acpi/meson.build                           |   1 +
 hw/intc/Kconfig                               |  15 +
 hw/intc/loongarch_extioi.c                    | 499 +++++++++++
 hw/intc/loongarch_ipi.c                       | 162 ++++
 hw/intc/loongarch_pch_msi.c                   |  67 ++
 hw/intc/loongarch_pch_pic.c                   | 357 ++++++++
 hw/intc/meson.build                           |   4 +
 hw/intc/trace-events                          |  21 +
 hw/loongarch/Kconfig                          |  23 +
 hw/loongarch/acpi-build.c                     | 637 ++++++++++++++
 hw/loongarch/fw_cfg.c                         |  33 +
 hw/loongarch/fw_cfg.h                         |  15 +
 hw/loongarch/loongson3.c                      | 509 +++++++++++
 hw/loongarch/meson.build                      |   6 +
 hw/meson.build                                |   1 +
 hw/pci-host/Kconfig                           |   4 +
 hw/pci-host/ls7a.c                            | 214 +++++
 hw/pci-host/meson.build                       |   1 +
 hw/rtc/Kconfig                                |   3 +
 hw/rtc/ls7a_rtc.c                             | 323 +++++++
 hw/rtc/meson.build                            |   1 +
 include/exec/poison.h                         |   2 +
 include/hw/acpi/ls7a.h                        |  53 ++
 include/hw/intc/loongarch_extioi.h            |  69 ++
 include/hw/intc/loongarch_ipi.h               |  47 ++
 include/hw/intc/loongarch_pch_msi.h           |  21 +
 include/hw/intc/loongarch_pch_pic.h           |  61 ++
 include/hw/loongarch/loongarch.h              |  68 ++
 include/hw/pci-host/ls7a.h                    |  79 ++
 include/sysemu/arch_init.h                    |   1 +
 linux-user/loongarch64/cpu_loop.c             |   8 +-
 qapi/machine-target.json                      |   6 +-
 qapi/machine.json                             |   2 +-
 softmmu/qdev-monitor.c                        |   3 +-
 target/Kconfig                                |   1 +
 target/loongarch/Kconfig                      |   2 +
 target/loongarch/README                       |  20 +
 target/loongarch/cpu-csr.h                    | 236 ++++++
 target/loongarch/cpu-param.h                  |   2 +-
 target/loongarch/cpu.c                        | 402 ++++++++-
 target/loongarch/cpu.h                        | 216 ++++-
 target/loongarch/csr_helper.c                 | 112 +++
 target/loongarch/disas.c                      |  57 ++
 target/loongarch/fpu_helper.c                 |   2 +-
 target/loongarch/gdbstub.c                    |  97 +++
 target/loongarch/helper.h                     |  26 +
 target/loongarch/insn_trans/trans_core.c.inc  | 409 +++++++++
 target/loongarch/insn_trans/trans_extra.c.inc |  36 +-
 target/loongarch/insns.decode                 |  44 +
 target/loongarch/internals.h                  |  29 +
 target/loongarch/iocsr_helper.c               | 109 +++
 target/loongarch/machine.c                    | 104 +++
 target/loongarch/meson.build                  |  11 +
 target/loongarch/op_helper.c                  |  56 ++
 target/loongarch/stabletimer.c                |  63 ++
 target/loongarch/tlb_helper.c                 | 789 ++++++++++++++++++
 target/loongarch/translate.c                  |   9 +-
 64 files changed, 6579 insertions(+), 30 deletions(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 configs/targets/loongarch64-softmmu.mak
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
 create mode 100644 hw/pci-host/ls7a.c
 create mode 100644 hw/rtc/ls7a_rtc.c
 create mode 100644 include/hw/acpi/ls7a.h
 create mode 100644 include/hw/intc/loongarch_extioi.h
 create mode 100644 include/hw/intc/loongarch_ipi.h
 create mode 100644 include/hw/intc/loongarch_pch_msi.h
 create mode 100644 include/hw/intc/loongarch_pch_pic.h
 create mode 100644 include/hw/loongarch/loongarch.h
 create mode 100644 include/hw/pci-host/ls7a.h
 create mode 100644 target/loongarch/Kconfig
 create mode 100644 target/loongarch/cpu-csr.h
 create mode 100644 target/loongarch/csr_helper.c
 create mode 100644 target/loongarch/gdbstub.c
 create mode 100644 target/loongarch/insn_trans/trans_core.c.inc
 create mode 100644 target/loongarch/iocsr_helper.c
 create mode 100644 target/loongarch/machine.c
 create mode 100644 target/loongarch/stabletimer.c
 create mode 100644 target/loongarch/tlb_helper.c

-- 
2.27.0


