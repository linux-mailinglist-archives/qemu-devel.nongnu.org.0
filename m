Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8944CF11
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:38:17 +0100 (CET)
Received: from localhost ([::1]:58480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkz2e-0007sv-HE
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:38:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0A-0005Yb-PJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:42 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53838 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz07-0001eU-BF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:42 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S2;
 Thu, 11 Nov 2021 09:35:28 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 00/30] Add Loongarch softmmu support. 
Date: Thu, 11 Nov 2021 09:34:58 +0800
Message-Id: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1xJrW5CFWfCF15Jw1xGrg_yoWxZFW8pF
 W7uwn8Kr48GrZrJr9Yqa45Xr98XFn7Gr4293WSqry8CrWIvry5Zr1kt3sIqFy7Jay8Gry0
 qF1Fkw1UWF47XaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry only part of the v2 patch succeed. I consulted GNU sysadmin,
He said our mail server was getting temporarily banned by fail2ban. Now the ban
was removed. I resend the v2 series patch. For uefi is preparing to submit to
the community only uefi binary can be provided now. All of the series patch
add RFC title.

This series patch add softmmu support for LoongArch.
Base on the linux-user emulation support V9 patch.
  * https://patchew.org/QEMU/1630586467-22463-1-git-send-email-gaosong@loongson.cn/diff/1636340895-5255-1-git-send-email-gaosong@loongson.cn/

The latest kernel:
  * https://github.com/loongson/linux/tree/loongarch-next
The manual:
  * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11

Changes for v2:
1.Combine patch 2 and 3 into one.
2.Adjust the order of the patch.
3.Put all the binaries on the github.
4.Modify some emulate errors when use the kernel from the github.
5.Adjust some format problem and the Naming problem 
6.Others mainly follow Richard's code review comments.

Please help review!

Thanks

Xiaojuan Yang (30):
  target/loongarch: Update README
  target/loongarch: Add CSR registers definition
  target/loongarch: Add basic vmstate description of CPU.
  target/loongarch: Define exceptions for LoongArch.
  target/loongarch: Implement qmp_query_cpu_definitions()
  target/loongarch: Add stabletimer support
  target/loongarch: Add MMU support for LoongArch CPU.
  target/loongarch: Add LoongArch CSR/IOCSR instruction
  target/loongarch: Add TLB instruction support
  target/loongarch: Add other core instructions support
  target/loongarch: Add LoongArch interrupt and exception handle
  target/loongarch: Add timer related instructions support.
  target/loongarch: Add gdb support.
  target/loongarch: Implement privilege instructions disassembly
  hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson
    Platform
  hw/loongarch: Add a virt LoongArch 3A5000 board support
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
  hw/loongarch: Add machine->possible_cpus
  hw/loongarch: Add Numa support.

 .../devices/loongarch64-softmmu/default.mak   |   3 +
 configs/targets/loongarch64-softmmu.mak       |   4 +
 gdb-xml/loongarch-base64.xml                  |  43 +
 gdb-xml/loongarch-fpu64.xml                   |  57 ++
 hw/Kconfig                                    |   1 +
 hw/acpi/Kconfig                               |   4 +
 hw/acpi/ls7a.c                                | 349 +++++++
 hw/acpi/meson.build                           |   1 +
 hw/intc/Kconfig                               |  12 +
 hw/intc/loongarch_extioi.c                    | 588 ++++++++++++
 hw/intc/loongarch_pch_msi.c                   |  73 ++
 hw/intc/loongarch_pch_pic.c                   | 283 ++++++
 hw/intc/meson.build                           |   3 +
 hw/loongarch/Kconfig                          |  22 +
 hw/loongarch/acpi-build.c                     | 653 +++++++++++++
 hw/loongarch/fw_cfg.c                         |  33 +
 hw/loongarch/fw_cfg.h                         |  15 +
 hw/loongarch/ipi.c                            | 146 +++
 hw/loongarch/loongarch_int.c                  |  59 ++
 hw/loongarch/ls3a5000_virt.c                  | 647 +++++++++++++
 hw/loongarch/meson.build                      |   7 +
 hw/meson.build                                |   1 +
 hw/pci-host/Kconfig                           |   4 +
 hw/pci-host/ls7a.c                            | 223 +++++
 hw/pci-host/meson.build                       |   1 +
 hw/rtc/Kconfig                                |   3 +
 hw/rtc/ls7a_rtc.c                             | 323 +++++++
 hw/rtc/meson.build                            |   1 +
 include/exec/poison.h                         |   2 +
 include/hw/acpi/ls7a.h                        |  53 ++
 include/hw/intc/loongarch_extioi.h            | 101 ++
 include/hw/intc/loongarch_pch_msi.h           |  16 +
 include/hw/intc/loongarch_pch_pic.h           |  49 +
 include/hw/loongarch/gipi.h                   |  37 +
 include/hw/loongarch/loongarch.h              |  78 ++
 include/hw/pci-host/ls7a.h                    |  66 ++
 include/sysemu/arch_init.h                    |   1 +
 qapi/machine-target.json                      |   6 +-
 qapi/machine.json                             |   2 +-
 softmmu/qdev-monitor.c                        |   3 +-
 target/Kconfig                                |   1 +
 target/loongarch/Kconfig                      |   2 +
 target/loongarch/README                       |  20 +
 target/loongarch/cpu-csr.h                    | 334 +++++++
 target/loongarch/cpu-param.h                  |   3 +
 target/loongarch/cpu.c                        | 390 ++++++++
 target/loongarch/cpu.h                        | 220 ++++-
 target/loongarch/csr_helper.c                 | 331 +++++++
 target/loongarch/disas.c                      |  86 ++
 target/loongarch/gdbstub.c                    |  97 ++
 target/loongarch/helper.h                     |  24 +
 target/loongarch/insn_trans/trans_core.c.inc  | 570 +++++++++++
 target/loongarch/insn_trans/trans_extra.c.inc |  32 +
 target/loongarch/insns.decode                 |  51 +
 target/loongarch/internals.h                  |  26 +
 target/loongarch/machine.c                    | 210 ++++
 target/loongarch/meson.build                  |  10 +
 target/loongarch/op_helper.c                  |  58 ++
 target/loongarch/stabletimer.c                |  70 ++
 target/loongarch/tlb_helper.c                 | 901 ++++++++++++++++++
 target/loongarch/translate.c                  |   7 +
 61 files changed, 7410 insertions(+), 6 deletions(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 configs/targets/loongarch64-softmmu.mak
 create mode 100644 gdb-xml/loongarch-base64.xml
 create mode 100644 gdb-xml/loongarch-fpu64.xml
 create mode 100644 hw/acpi/ls7a.c
 create mode 100644 hw/intc/loongarch_extioi.c
 create mode 100644 hw/intc/loongarch_pch_msi.c
 create mode 100644 hw/intc/loongarch_pch_pic.c
 create mode 100644 hw/loongarch/Kconfig
 create mode 100644 hw/loongarch/acpi-build.c
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h
 create mode 100644 hw/loongarch/ipi.c
 create mode 100644 hw/loongarch/loongarch_int.c
 create mode 100644 hw/loongarch/ls3a5000_virt.c
 create mode 100644 hw/loongarch/meson.build
 create mode 100644 hw/pci-host/ls7a.c
 create mode 100644 hw/rtc/ls7a_rtc.c
 create mode 100644 include/hw/acpi/ls7a.h
 create mode 100644 include/hw/intc/loongarch_extioi.h
 create mode 100644 include/hw/intc/loongarch_pch_msi.h
 create mode 100644 include/hw/intc/loongarch_pch_pic.h
 create mode 100644 include/hw/loongarch/gipi.h
 create mode 100644 include/hw/loongarch/loongarch.h
 create mode 100644 include/hw/pci-host/ls7a.h
 create mode 100644 target/loongarch/Kconfig
 create mode 100644 target/loongarch/cpu-csr.h
 create mode 100644 target/loongarch/csr_helper.c
 create mode 100644 target/loongarch/gdbstub.c
 create mode 100644 target/loongarch/insn_trans/trans_core.c.inc
 create mode 100644 target/loongarch/machine.c
 create mode 100644 target/loongarch/stabletimer.c
 create mode 100644 target/loongarch/tlb_helper.c

-- 
2.27.0


