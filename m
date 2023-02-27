Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A16A41D2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:40:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcme-0002Gc-IY; Mon, 27 Feb 2023 07:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmP-0002EW-49
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:00 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmL-00017H-Bo
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:38:56 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bw19so6013005wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0vNYmnYGAaMzIndsAWCR2XdKRA3GslkP2u+aBifC8ko=;
 b=KRprPrawU2pWtnPAur9PbPG75DkbqlIiC6xE2eMoiKB3w9D1V7Wn98FNqGFZ7s9cY7
 VaMX8bX09xIlm1Wsw87B8j5bLtZmNdoFJ0MaHoEohS5CRzotK4yiavv2jxsjJry727qy
 4JolEbUpB0zo27FdJ9pnJmUSlVoZEVsql+YhWzmgObKU0DW9HR7FnFyCey/OqJOvs1lV
 sVdDGFts5kNLn+LdBumuOSXCadsZ2OHa43LZjQBuMpbMEUmZ240wMy+OMxFqi7T7fple
 ka8gjsfwhxoP+FAh8rHUzhXP1k1aK3ecBJlD+umBzp8ccMqV8s1LcIHbxBWmaJ+omyUT
 Uspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vNYmnYGAaMzIndsAWCR2XdKRA3GslkP2u+aBifC8ko=;
 b=yjy47WkTh3svkcVlW4c8fqApz1Y6rbfHFShRzX/YXpV/CSQfGQlPnMrx9qZfyBo5NE
 UIf8WT9IHqlBeEisoQX4Dfkyu5OceFFcQ7G69pJuXSDSzMNDdXaF56NJQh/UAVkeLjXx
 WDvPvYmeXb+auNdY5JyTglsKvO2AhEV+Ee1KIWZH/XkNvg0blCXn3AlWyQMWV40Kakix
 CwxTjtMigqCmvhbSbut0XOe0nuILeGazArqFRgrWDUPnLRvfpHY7waYFOYeW+p2wJdAt
 UESfOpMtDzC2BnvU7HcjSPt7Hsm4pLIxOni4PfcwnSg4LBWkkExp6R485pBUowCxX7MW
 FXwA==
X-Gm-Message-State: AO0yUKWn/2m7B/Hb0y2A9D6snv6q+qj9w2kv/sLHmjkvi8oAKd/mycmN
 NkL0ufucqtoODP6AqpQU+uTEv771YqJrkZu3
X-Google-Smtp-Source: AK7set9ERYm4ms/v9jcB1412y+8JS214dpASm9X+Kl/P6+XHOdGVh5vaLSOhx6cDGlvLefZxSKZAEA==
X-Received: by 2002:a05:6000:186b:b0:2c5:4bdf:8f5b with SMTP id
 d11-20020a056000186b00b002c54bdf8f5bmr7403031wri.20.1677501531159; 
 Mon, 27 Feb 2023 04:38:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d6691000000b002c54e26bca5sm7032691wru.49.2023.02.27.04.38.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:38:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 000/123] Buildsys / QOM / QDev / UI patches for 2023-02-27
Date: Mon, 27 Feb 2023 13:36:44 +0100
Message-Id: <20230227123847.27110-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Hi Peter,

I apologize for the size of this request, I was hoping various
series would go via other tree, but everybody has been quite busy
and the freezing windows is close, so I'm sending a huge mixed
patchset here.

The following changes since commit b11728dc3ae67ddedf34b7a4f318170e7092803c:

  Merge tag 'pull-riscv-to-apply-20230224' of github.com:palmer-dabbelt/qemu into staging (2023-02-26 20:14:46 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/buildsys-qom-qdev-ui-20230227

for you to fetch changes up to 44efb54240815652e18b8a8eacdd715b3b051168:

  ui/cocoa: user friendly characters for release mouse (2023-02-27 13:14:15 +0100)

----------------------------------------------------------------
Mixed bag of various patches all over the tree:

- buildsys
  - Various header cleaned up (removing pointless headers)
  - Mark various files/code user/system specific
  - Make various objects target-independent
  - Remove tswapN() calls from dump.o
  - Suggest g_assert_not_reached() instead of assert(0)

- qdev / qom
  - Replace various container_of() by QOM cast macros
  - Declare some QOM macros using OBJECT_DECLARE_TYPE()
  - Embed OHCI QOM child in SM501 chipset

- hw (ISA & IDE)
  - add some documentation, improve function names
  - un-inline, open-code few functions
  - have ISA API accessing IRQ/DMA prefer ISABus over ISADevice
  - Demote IDE subsystem maintenance to "Odd Fixes"

- ui: Improve Ctrl+Alt hint on Darwin Cocoa

----------------------------------------------------------------

BALATON Zoltan (5):
  hw/usb/ohci: Code style fix comments
  hw/usb/ohci: Code style fix white space errors
  hw/usb/ohci: Code style fix missing braces and extra parenthesis
  hw/usb/ohci: Move a function next to where it is used
  hw/usb/ohci: Add trace points for register access

Bernhard Beschow (15):
  target/loongarch/cpu: Remove unused "sysbus.h" header
  hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
  hw/isa/lpc_ich9: Unexport PIRQ functions
  hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus
  hw/i2c/smbus_ich9: Move ich9_smb_set_irq() in front of
    ich9_smbus_realize()
  hw/i2c/smbus_ich9: Inline ich9_smb_init() and remove it
  hw/i386/pc_q35: Allow for setting properties before realizing
    TYPE_ICH9_LPC_DEVICE
  hw/isa/lpc_ich9: Connect PM stuff to LPC internally
  hw/isa/lpc_ich9: Remove redundant ich9_lpc_reset() invocation
  hw/i386/ich9: Remove redundant GSI_NUM_PINS
  hw: Move ioapic*.h to intc/
  hw/i386/ich9: Clean up includes
  hw: Move ich9.h to southbridge/
  hw/ide/pci: Unexport bmdma_active_if()
  hw/ide/pci: Add PCIIDEState::isa_irq[]

Christian Schoenebeck (1):
  ui/cocoa: user friendly characters for release mouse

Fiona Ebner (1):
  hw/ide/ahci: Trace ncq write command as write instead of read

John Snow (1):
  MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"

Mauro Matteo Cascella (1):
  hw/nubus/nubus-device: Fix memory leak in nubus_device_realize

Philippe Mathieu-Daudé (98):
  cpu: Remove capstone meson dependency
  cpu: Move breakpoint helpers to common code
  cputlb: Restrict SavedIOTLB to system emulation
  gdbstub: Use vaddr type for generic insert/remove_breakpoint() API
  target/cpu: Restrict cpu_get_phys_page_debug() handlers to sysemu
  target/cpu: Restrict do_transaction_failed() handlers to sysemu
  target/i386: Remove NEED_CPU_H guard from target-specific headers
  target/i386/cpu: Remove dead helper_lock() declaration
  target/i386: Remove x86_cpu_dump_local_apic_state() dead stub
  target/hppa: Extract FPU helpers to fpu_helper.c
  target/hppa: Extract system helpers to sys_helper.c
  target/alpha: Remove obsolete STATUS document
  target/loongarch/cpu: Restrict "memory.h" header to sysemu
  target/ppc/internal: Restrict MMU declarations to sysemu
  target/ppc/kvm: Remove unused "sysbus.h" header
  target/riscv/cpu: Move Floating-Point fields closer
  target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY guard
  target/xtensa/cpu: Include missing "memory.h" header
  target/tricore: Remove unused fields from CPUTriCoreState
  qom/object_interfaces: Fix QAPI headers included
  trace: Do not try to include QMP commands in user emulation binaries
  exec: Remove unused 'qemu/timer.h' timer
  tcg: Silent -Wmissing-field-initializers warning
  tcg/tcg-op-gvec: Remove unused "qemu/main-loop.h" header
  accel/tcg: Restrict 'qapi-commands-machine.h' to system emulation
  accel/xen: Remove dead code
  accel/kvm: Silent -Wmissing-field-initializers warning
  sysemu/kvm: Remove CONFIG_USER_ONLY guard
  replay: Extract core API to 'exec/replay-core.h'
  tests/unit: Restrict machine-smp.c test to system emulation
  softmmu: Silent -Wmissing-field-initializers warning
  softmmu: Extract watchpoint API from physmem.c
  qemu/typedefs: Sort in case-insensitive alphabetical order (again)
  hw/qdev: Constify DeviceState* argument of qdev_get_parent_bus()
  hw/cpu: Extend CPUState::cluster_index documentation
  hw/i386/x86: Reduce init_topo_info() scope
  hw/pci: Fix a typo
  hw/intc/i8259: Document i8259_init()
  hw/isa/i82378: Rename output IRQ as 'cpu_intr'
  hw/isa/i82378: Remove intermediate IRQ forwarder
  hw/isa/vt82c686: Remove intermediate IRQ forwarder
  hw/sparc64/sun4u: Keep reference to ISA input IRQs in EbusState
  hw/isa: Remove empty ISADeviceClass structure
  hw/isa: Reorder to separate ISABus* vs ISADevice* functions
  hw/isa: Un-inline isa_bus_from_device()
  hw/isa: Rename isa_bus_irqs() -> isa_bus_register_input_irqs()
  hw/isa: Use isa_address_space_io() to reduce access on global 'isabus'
  hw/isa: Rename isa_get_dma() -> isa_bus_get_dma()
  hw/isa: Factor isa_bus_get_irq() out of isa_get_irq()
  hw: Replace isa_get_irq() by isa_bus_get_irq() when ISABus is
    available
  hw/rtc/mc146818rtc: Rename RTCState -> MC146818RtcState
  hw/rtc/mc146818rtc: Pass MC146818RtcState instead of ISADevice
    argument
  hw/rtc: Rename rtc_[get|set]_memory -> mc146818rtc_[get|set]_cmos_data
  hw/timer/hpet: Include missing 'hw/qdev-properties.h' header
  hw/audio/hda-codec: Avoid forward-declaring HDAAudioState
  hw/audio/es1370: Avoid forward-declaring ES1370State
  hw/audio/es1370: Replace container_of() by ES1370() QOM cast macro
  hw/audio/ac97: Replace container_of() by AC97() QOM cast macro
  hw/usb/dev-smartcard-reader: Avoid forward-declaring CCIDBus
  hw/usb/u2f: Declare QOM macros using OBJECT_DECLARE_TYPE()
  hw/usb/ohci: Include missing 'sysbus.h' header
  hw/usb/ohci: Use OHCIState type definition
  hw/usb/ohci: Fix typo
  hw/usb/uhci: Declare QOM macros using OBJECT_DECLARE_TYPE()
  hw/usb/uhci: Replace container_of() by UHCI_GET_CLASS() QOM macro
  hw/usb/xhci-nec: Declare QOM macros for NEC_XHCI
  hw/usb/xhci-nec: Replace container_of() by NEC_XHCI() QOM cast macro
  hw/display/sm501: Embed OHCI QOM child in chipset
  hw/display/sm501: Alias 'dma-offset' QOM property in chipset object
  hw/display/sm501: Unify common QOM properties
  block/vvfat: Remove pointless check of NDEBUG
  scripts/checkpatch.pl: Do not allow assert(0)
  hw/i386/xen: Remove unused 'hw/ide.h' include from header
  hw/ide/mmio: Use CamelCase for MMIO_IDE state name
  hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to 'hw/ide/mmio.h'
  hw/ide/isa: Extract TYPE_ISA_IDE declarations to 'hw/ide/isa.h'
  hw/ide/isa: Remove intermediate ISAIDEState::irq variable
  hw/ide/atapi: Restrict 'scsi/constants.h' inclusion
  hw/ide: Remove unused 'qapi/qapi-types-run-state.h'
  hw/ide: Include 'exec/ioport.h' instead of 'hw/isa/isa.h'
  hw/ide: Un-inline ide_set_irq()
  hw/ide: Rename ide_set_irq() -> ide_bus_set_irq()
  hw/ide: Rename ide_create_drive() -> ide_bus_create_drive()
  hw/ide: Rename ide_register_restart_cb -> ide_bus_register_restart_cb
  hw/ide: Rename ide_exec_cmd() -> ide_bus_exec_cmd()
  hw/ide: Rename ide_init2() -> ide_bus_init_output_irq()
  hw/ide: Rename idebus_active_if() -> ide_bus_active_if()
  hw/ide: Declare ide_get_[geometry/bios_chs_trans] in
    'hw/ide/internal.h'
  hw/ide/ioport: Remove unnecessary includes
  hw/ide/piix: Remove unused includes
  hw/ide/piix: Pass Error* to pci_piix_init_ports() for better error msg
  hw/ide/piix: Refactor pci_piix_init_ports as pci_piix_init_bus per bus
  hw/ide/via: Replace magic 2 value by ARRAY_SIZE / MAX_IDE_DEVS
  dump: Replace tswapN() -> cpu_to_dumpN()
  dump: Replace TARGET_PAGE_SIZE -> qemu_target_page_size()
  dump: Clean included headers
  dump: Simplify compiling win_dump.o by introducing
    win_dump_available()
  dump: Add create_win_dump() stub for non-x86 targets

Pierrick Bouvier (1):
  target/ppc: Fix warning with clang-15

 MAINTAINERS                                   |   8 +-
 accel/kvm/kvm-all.c                           |   8 +-
 accel/kvm/kvm-cpus.h                          |   4 +-
 accel/tcg/cpu-exec.c                          |  91 +---
 accel/tcg/hmp.c                               |  14 -
 accel/tcg/internal.h                          |   3 +
 accel/tcg/meson.build                         |   2 +-
 accel/tcg/monitor.c                           | 105 ++++
 accel/tcg/tcg-accel-ops.c                     |  17 +-
 accel/tcg/tcg-all.c                           |   2 +-
 accel/tcg/translate-all.c                     |   1 -
 accel/tcg/translator.c                        |   2 +-
 accel/tcg/user-exec-stub.c                    |   2 +-
 accel/xen/xen-all.c                           |  10 -
 block/vvfat.c                                 |   3 -
 cpu.c                                         |  73 +--
 cpus-common.c                                 |  72 +++
 dump/dump-hmp-cmds.c                          |   2 +-
 dump/dump.c                                   |  35 +-
 dump/meson.build                              |   6 +-
 dump/win_dump.c                               |  38 +-
 dump/win_dump.h                               |   5 +-
 gdbstub/gdbstub.c                             |   3 +-
 gdbstub/internals.h                           |   6 +-
 gdbstub/softmmu.c                             |   5 +-
 gdbstub/user.c                                |   5 +-
 hw/acpi/ich9.c                                |  10 +-
 hw/acpi/ich9_tco.c                            |   2 +-
 hw/arm/sbsa-ref.c                             |   2 +-
 hw/audio/ac97.c                               |   2 +-
 hw/audio/cs4231a.c                            |   5 +-
 hw/audio/es1370.c                             |  10 +-
 hw/audio/gus.c                                |   5 +-
 hw/audio/hda-codec.c                          |   7 +-
 hw/audio/sb16.c                               |   7 +-
 hw/block/fdc-isa.c                            |   5 +-
 hw/core/ptimer.c                              |   2 +-
 hw/core/qdev.c                                |   2 +-
 hw/display/sm501.c                            |  33 +-
 hw/dma/i82374.c                               |   2 +-
 hw/hppa/machine.c                             |   2 +-
 hw/i2c/smbus_ich9.c                           |  39 +-
 hw/i386/acpi-build.c                          |   3 +-
 hw/i386/kvm/ioapic.c                          |   3 +-
 hw/i386/microvm.c                             |  30 +-
 hw/i386/pc.c                                  |  83 +--
 hw/i386/pc_piix.c                             |   3 +-
 hw/i386/pc_q35.c                              |  34 +-
 hw/i386/x86.c                                 |  10 +-
 hw/i386/xen/xen_platform.c                    |   1 -
 hw/ide/ahci.c                                 |  13 +-
 hw/ide/atapi.c                                |  13 +-
 hw/ide/cmd646.c                               |   4 +-
 hw/ide/core.c                                 |  80 +--
 hw/ide/ich.c                                  |   1 +
 hw/ide/ioport.c                               |  10 -
 hw/ide/isa.c                                  |  22 +-
 hw/ide/macio.c                                |  15 +-
 hw/ide/microdrive.c                           |   9 +-
 hw/ide/mmio.c                                 |  37 +-
 hw/ide/pci.c                                  |  11 +-
 hw/ide/piix.c                                 |  46 +-
 hw/ide/qdev.c                                 |   2 +-
 hw/ide/sii3112.c                              |   4 +-
 hw/ide/trace-events                           |   3 +-
 hw/ide/via.c                                  |  16 +-
 hw/intc/apic.c                                |   2 +-
 hw/intc/i8259.c                               |   4 +-
 hw/intc/ioapic.c                              |   4 +-
 hw/intc/ioapic_common.c                       |   4 +-
 .../hw/i386 => hw/intc}/ioapic_internal.h     |   8 +-
 hw/isa/i82378.c                               |  19 +-
 hw/isa/isa-bus.c                              |  32 +-
 hw/isa/lpc_ich9.c                             |  36 +-
 hw/isa/piix4.c                                |   4 +-
 hw/isa/vt82c686.c                             |  18 +-
 hw/mips/jazz.c                                |   2 +-
 hw/misc/macio/gpio.c                          |   1 +
 hw/nubus/nubus-device.c                       |   1 +
 hw/pci-bridge/i82801b11.c                     |   2 +-
 hw/pci/pci.c                                  |   2 +-
 hw/ppc/pnv_lpc.c                              |   2 +-
 hw/ppc/prep.c                                 |  11 +-
 hw/rtc/m48t59-isa.c                           |   2 +-
 hw/rtc/mc146818rtc.c                          | 125 +++--
 hw/sh4/r2d.c                                  |   4 +-
 hw/sparc64/sun4u.c                            |  13 +-
 hw/timer/hpet.c                               |   1 +
 hw/usb/dev-smartcard-reader.c                 |   7 +-
 hw/usb/hcd-ohci.c                             | 436 ++++++++-------
 hw/usb/hcd-ohci.h                             |  11 +-
 hw/usb/hcd-uhci.c                             |   7 +-
 hw/usb/hcd-uhci.h                             |   2 +-
 hw/usb/hcd-xhci-nec.c                         |   8 +-
 hw/usb/trace-events                           |   4 +
 hw/usb/u2f.h                                  |  16 +-
 include/exec/gen-icount.h                     |   1 -
 include/exec/replay-core.h                    |  76 +++
 include/hw/acpi/ich9.h                        |   6 +-
 include/hw/core/cpu.h                         |  10 +-
 include/hw/i386/x86.h                         |   6 +-
 include/hw/ide.h                              |  12 -
 include/hw/ide/internal.h                     |  29 +-
 include/hw/ide/isa.h                          |  20 +
 include/hw/ide/mmio.h                         |  26 +
 include/hw/ide/pci.h                          |   7 +-
 include/hw/intc/i8259.h                       |  10 +-
 include/hw/{i386 => intc}/ioapic.h            |   6 +-
 include/hw/isa/i8259_internal.h               |   2 +-
 include/hw/isa/isa.h                          |  35 +-
 include/hw/isa/superio.h                      |   2 +-
 include/hw/qdev-core.h                        |   2 +-
 include/hw/rtc/mc146818rtc.h                  |  14 +-
 include/hw/{i386 => southbridge}/ich9.h       |  35 +-
 include/hw/timer/i8254.h                      |   3 +-
 include/hw/timer/i8254_internal.h             |   2 +-
 include/qemu/typedefs.h                       |  10 +-
 include/sysemu/accel-ops.h                    |   6 +-
 include/sysemu/cpus.h                         |   1 -
 include/sysemu/kvm.h                          |   2 -
 include/sysemu/replay.h                       |  67 +--
 meson.build                                   |   3 +-
 qom/object_interfaces.c                       |   2 +-
 scripts/checkpatch.pl                         |   3 +
 softmmu/meson.build                           |   3 +-
 softmmu/physmem.c                             | 191 -------
 softmmu/vl.c                                  |   2 +-
 softmmu/watchpoint.c                          | 220 ++++++++
 stubs/replay.c                                |   2 +-
 target/alpha/STATUS                           |  28 -
 target/alpha/cpu.h                            |   2 +-
 target/arm/cpu.h                              |   2 +-
 target/arm/internals.h                        |   2 +
 target/cris/cpu.h                             |   3 +-
 target/hppa/cpu.h                             |   2 +-
 target/hppa/fpu_helper.c                      | 450 ++++++++++++++++
 target/hppa/meson.build                       |   2 +
 target/hppa/op_helper.c                       | 504 ------------------
 target/hppa/sys_helper.c                      |  99 ++++
 target/i386/cpu-dump.c                        |   5 +-
 target/i386/cpu.h                             |  12 +-
 target/i386/hax/hax-i386.h                    |   2 -
 target/i386/hvf/hvf-i386.h                    |   4 -
 target/i386/whpx/whpx-all.c                   |   2 +-
 target/loongarch/cpu.h                        |   3 +-
 target/m68k/cpu.h                             |   4 +-
 target/microblaze/cpu.h                       |   4 +-
 target/nios2/cpu.h                            |   2 +-
 target/openrisc/cpu.h                         |   3 +-
 target/ppc/cpu.h                              |   2 +-
 target/ppc/dfp_helper.c                       |   4 +-
 target/ppc/internal.h                         |   5 +
 target/ppc/kvm.c                              |   1 -
 target/riscv/cpu.h                            |  18 +-
 target/rx/cpu.h                               |   2 +-
 target/rx/helper.c                            |   4 +-
 target/sh4/cpu.h                              |   2 +-
 target/sparc/cpu.h                            |   3 +-
 target/sparc/mmu_helper.c                     |   2 -
 target/tricore/cpu.h                          |  11 -
 target/xtensa/cpu.c                           |   3 +
 target/xtensa/cpu.h                           |   2 +-
 tcg/tcg-common.c                              |   2 +-
 tcg/tcg-op-gvec.c                             |   1 -
 tcg/tcg.c                                     |   1 -
 tests/qtest/tco-test.c                        |   2 +-
 tests/unit/meson.build                        |   2 +-
 tests/unit/ptimer-test-stubs.c                |   2 +-
 trace/meson.build                             |   4 +-
 ui/cocoa.m                                    |   7 +-
 util/guest-random.c                           |   2 +-
 171 files changed, 2028 insertions(+), 1903 deletions(-)
 delete mode 100644 accel/tcg/hmp.c
 create mode 100644 accel/tcg/monitor.c
 rename {include/hw/i386 => hw/intc}/ioapic_internal.h (96%)
 create mode 100644 include/exec/replay-core.h
 create mode 100644 include/hw/ide/isa.h
 create mode 100644 include/hw/ide/mmio.h
 rename include/hw/{i386 => intc}/ioapic.h (93%)
 rename include/hw/{i386 => southbridge}/ich9.h (91%)
 create mode 100644 softmmu/watchpoint.c
 delete mode 100644 target/alpha/STATUS
 create mode 100644 target/hppa/fpu_helper.c
 create mode 100644 target/hppa/sys_helper.c

-- 
2.38.1


