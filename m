Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC2669D4D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMFQ-0000yJ-Mp; Fri, 13 Jan 2023 10:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFO-0000wV-Mg
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:38 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFM-0005iA-FO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so15549504wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fuJYLrJaknWTtHcnEUTXXQrrcZaoHwiNWHGYBCNXn9U=;
 b=sbeYbuj6jy7ufaX4Af+xs2I2grgf9sEZlrF/AH2ZeZZzLXr5rBgUyGDh2QePDKX+Rq
 zZJnXk2qwGWMmhcgJHZD3dmzE8lmRXyJUkqvi62TGnJshqzTFXvK/Mog5+LjvCQoRSHu
 KM5UE9+LI5I2dXdPp0OOhLVhQKJ3lN1zoA/16QkSR2fomAdQ9IPUegEb20qkxeajanpU
 bMSv8XMC0WYSRyarwUH1WPM2JZp06uYEE9H1YzV1Ie1bHM0sGS4Rc+p/FNWIPHXKUg9R
 u1pXKnccX4Gy0t9XjMBV3y3d7an4QuEcjzAOsrUrOztJKAege5GFZzh6kQdVrWDdCOIr
 eGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fuJYLrJaknWTtHcnEUTXXQrrcZaoHwiNWHGYBCNXn9U=;
 b=BBIeBNIn3h89rbEonx38pW8ghmJKervoyqdmdWOvekfQpDilEyU3cwaoGzdMZPu/93
 2XMSQ1fCLJB4sQnopBGsEhimmT1IRuPXD9FtlO0cyjd7LfX5ebSbmJhfnLK3Q/6CtoBa
 DSj/9eW79QUCR1YZ2gT1oy4oIJVTOYsU/K+X6SS38hc5R5f1bdTbat8NJa9wHVZSq+Th
 RBw8ugg6Aa5PIkTZqE/o2++bsHYC68FTVh6qp9ixliju3e5ntMvHPfZRmlvoXCkfP6Lx
 mNdogS+VcBZxXveTA1Z6SCQ6uiMQoW//UtMyxV2m30FwTuUsYflgdEFPfoOwGe7TFw+p
 MBpw==
X-Gm-Message-State: AFqh2krfNp7nKGkIovA9xdF4Jrxpo/Y37ShrKQjgyFy5b2NbdD+3oQ5W
 //cK1S7nTp4j8iXnWYcykZpNBdNy2qu2uJ3M
X-Google-Smtp-Source: AMrXdXtVLU4Bm5dsIgGS+kA+kFxE2JIfwRV1hFAw5aTeKOFvWHYliUv8BEgqRHhhEJ5AJZ0MtOmB9g==
X-Received: by 2002:a05:600c:601b:b0:3d3:56ce:5693 with SMTP id
 az27-20020a05600c601b00b003d356ce5693mr57706819wmb.17.1673624734292; 
 Fri, 13 Jan 2023 07:45:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b002bbddb89c71sm15374553wrv.67.2023.01.13.07.45.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:45:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/46] MIPS patches for 2023-01-13
Date: Fri, 13 Jan 2023 16:44:46 +0100
Message-Id: <20230113154532.49979-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

The following changes since commit 3db29dcac23da85486704ef9e7a8e7217f7829cd:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-01-12 13:51:36 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20230113

for you to fetch changes up to 4828656f65324249273ad2f2db80844ba90eeb9b:

  scripts/git.orderfile: Display MAINTAINERS changes first (2023-01-13 16:22:57 +0100)

----------------------------------------------------------------
MIPS patches queue

Confronting my triskaidekaphobia, here goes
a bunch of cleanups from various people:

- Improved GT64120 on big-endian hosts
- GT64120 north bridge and MC146818 RTC devices are now target independent
- Bonito64 north bridge converted to 3-phase reset API
- PCI refactors around PIIX devices
- Support for nanoMIPS in bootloader generator API
- New YAMON Malta Avocado test
- Removal of 'trap and emulate' KVM support
- System-specific QMP commands restricted to system emulation

----------------------------------------------------------------

Bernhard Beschow (6):
  hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
  hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
  hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
  hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
  hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
  hw/intc/i8259: Make using the isa_pic singleton more type-safe

Daniel Henrique Barboza (1):
  hw/mips/boston: Rename MachineState 'mc' pointer to 'ms'

Paolo Bonzini (2):
  mips: Remove support for trap and emulate KVM
  mips: Always include nanomips disassembler

Philippe Mathieu-Daudé (33):
  hw/mips/malta: Split FPGA LEDs/ASCII display updates
  hw/mips/malta: Trace FPGA LEDs/ASCII display updates
  hw/mips/gt64xxx_pci: Accumulate address space changes
  hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps
  hw/mips/Kconfig: Introduce CONFIG_GT64120 to select gt64xxx_pci.c
  hw/mips/gt64xxx_pci: Let the GT64120 manage the lower 512MiB hole
  hw/mips/gt64xxx_pci: Manage endian bits with the RegisterFields API
  hw/mips/gt64xxx_pci: Add a 'cpu-little-endian' qdev property
  hw/mips/malta: Explicit GT64120 endianness upon device creation
  hw/mips/meson: Make gt64xxx_pci.c endian-agnostic
  hw/mips/gt64xxx_pci: Move it to hw/pci-host/
  tests/avocado: Add tests booting YAMON ROM on MIPS Malta machines
  hw/mips/bootloader: Handle buffers as opaque arrays
  hw/mips/bootloader: Implement nanoMIPS NOP opcode generator
  hw/mips/bootloader: Implement nanoMIPS SW opcode generator
  hw/mips/bootloader: Implement nanoMIPS LI (LUI+ORI) opcode generator
  hw/mips/bootloader: Implement nanoMIPS JALRc opcode generator
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (1/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (2/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (3/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (4/5)
  hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (5/5)
  hw/mips/malta: Merge common BL code as bl_setup_gt64120_jump_kernel()
  hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
  hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
  hw/isa/piix4: Correct IRQRC[A:D] reset values
  hw/pci/pci_host: Trace config accesses on unexisting functions
  hw/pci-host/bonito: Convert to 3-phase reset
  hw/pci-host/bonito: Use 'bonito_host' for PCI host bridge code
  hw/pci-host/bonito: Use 'bonito_pci' for PCI function #0 code
  hw/pci-host/bonito: Declare TYPE_BONITO_PCI_HOST_BRIDGE in header
  target/mips: Restrict 'qapi-commands-machine.h' to system emulation
  scripts/git.orderfile: Display MAINTAINERS changes first

Thomas Huth (4):
  hw/intc: Extract the IRQ counting functions into a separate file
  hw/core/qdev-properties-system: Allow the 'slew' policy only on x86
  hw/rtc/mc146818rtc: Make the mc146818 RTC device target independent
  softmmu/rtc: Emit warning when using driftfix=slew on systems without
    mc146818

 MAINTAINERS                                   |   3 +-
 configs/devices/mips-softmmu/common.mak       |   3 -
 disas/meson.build                             |   3 +-
 docs/about/deprecated.rst                     |   9 -
 docs/about/removed-features.rst               |   9 +
 hw/core/qdev-properties-system.c              |  28 +-
 hw/i386/kvm/i8259.c                           |   4 +-
 hw/i386/kvm/ioapic.c                          |   4 +-
 hw/i386/pc_piix.c                             |  18 +-
 hw/i386/pc_q35.c                              |  17 +-
 hw/intc/apic.c                                |   3 +-
 hw/intc/apic_common.c                         |  30 +-
 hw/intc/i8259.c                               |  11 +-
 hw/intc/kvm_irqcount.c                        |  49 +++
 hw/intc/meson.build                           |   6 +
 hw/intc/trace-events                          |   9 +-
 hw/isa/piix3.c                                |  17 +-
 hw/isa/piix4.c                                |  37 +-
 hw/mips/Kconfig                               |   2 +
 hw/mips/bootloader.c                          | 141 ++++--
 hw/mips/boston.c                              |   6 +-
 hw/mips/fuloong2e.c                           |   2 +-
 hw/mips/malta.c                               | 403 ++++++------------
 hw/mips/meson.build                           |   2 +-
 hw/mips/trace-events                          |   9 +-
 hw/pci-host/Kconfig                           |   6 +
 hw/pci-host/bonito.c                          |  37 +-
 hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} | 130 ++++--
 hw/pci-host/meson.build                       |   1 +
 hw/pci-host/raven.c                           |   3 +-
 hw/pci-host/trace-events                      |   7 +
 hw/pci-host/versatile.c                       |   3 +-
 hw/pci/pci.c                                  |  12 +-
 hw/pci/pci_host.c                             |   6 +
 hw/remote/machine.c                           |   3 +-
 hw/remote/vfio-user-obj.c                     |   4 +-
 hw/rtc/mc146818rtc.c                          |  20 +-
 hw/rtc/meson.build                            |   3 +-
 hw/usb/hcd-uhci.c                             |  16 +-
 hw/usb/hcd-uhci.h                             |   4 +
 include/exec/poison.h                         |   1 -
 include/hw/i386/apic.h                        |   2 -
 include/hw/i386/apic_internal.h               |   1 -
 include/hw/intc/i8259.h                       |   6 +-
 include/hw/intc/kvm_irqcount.h                |  10 +
 include/hw/mips/bootloader.h                  |  10 +-
 include/hw/pci-host/bonito.h                  |  18 +
 include/hw/pci/pci.h                          |   3 +-
 include/hw/rtc/mc146818rtc.h                  |   1 +
 include/qemu/typedefs.h                       |   1 +
 meson.build                                   |   5 -
 scripts/git.orderfile                         |   2 +
 softmmu/rtc.c                                 |   6 +-
 target/mips/cpu.c                             |  38 +-
 target/mips/cpu.h                             |   3 -
 target/mips/internal.h                        |   3 -
 target/mips/kvm.c                             |  11 +-
 target/mips/sysemu/addr.c                     |  17 -
 target/mips/sysemu/meson.build                |   1 +
 target/mips/sysemu/mips-qmp-cmds.c            |  39 ++
 target/mips/sysemu/physaddr.c                 |  13 -
 tests/avocado/machine_mips_malta.py           |  47 +-
 62 files changed, 693 insertions(+), 625 deletions(-)
 create mode 100644 hw/intc/kvm_irqcount.c
 rename hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} (91%)
 create mode 100644 include/hw/intc/kvm_irqcount.h
 create mode 100644 include/hw/pci-host/bonito.h
 create mode 100644 target/mips/sysemu/mips-qmp-cmds.c

-- 
2.38.1


