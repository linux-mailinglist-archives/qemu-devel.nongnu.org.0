Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99E14E653
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 01:07:36 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixJqR-00045e-Fv
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 19:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJna-0007Qq-LL
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJnY-0002oj-HZ
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:38 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:46213 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ixJnY-0001r8-6c
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:36 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D56961A1DBD;
 Fri, 31 Jan 2020 01:03:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id BB0281A1DA4;
 Fri, 31 Jan 2020 01:03:30 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc4 00/29] target/avr merger
Date: Fri, 31 Jan 2020 01:02:44 +0100
Message-Id: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This is the AVR port from Michael, release (merge) candidate 4.

The series can be found also in this repository:

https://github.com/AMarkovic/qemu-avr-merger-rc4

History:

Since v3:

- Removed a patch on load_elf() modification, since it has been merged
- Removed references to CONFIG_USER_ONLY and provided a guard against
  building lunux user mode for AVR
- Removed all references to 'Atmel' (including file renames)
- Rebased the code (there was common interface change regarding 'props')
- Various corrections of commit messages
- A bit field for AVRFeatures is nor 64 bit long
- Other minor fixes

Since v2:

- First patch is split into six smaller logical units (net result
  remains the same)
- Patch "hw/core/loader: Let load_elf populate the processor-specific
  flags" was redone to reflect the original intent that was lost in
  transalation between multiple autors
- Patch "hw/avr: Add helper to load raw/ELF firmware binaries" was
  corrected only in one line to rectify type of "e_flags"
- Patch "target/avr: Add section about AVR into QEMU documentation"
- Spurious <message-Id:> elements were removed
- The series was rebased to the latest code

Since v1:

- Addressed Thomas comments
- Fixed a non-critical bug in ATmega (incorrect SRAM base address)
- Added ELF parsing requested by Aleksandar
- Dropped default machine (as with the ARM port)

Michael Rolnik (25):
  target/avr: Add basic parameters for new AVR platform
  target/avr: Introduce AVR CPU class object
  target/avr: Add migration support
  target/avr: Add GDB support
  target/avr: Introduce enumeration AVRFeature
  target/avr: Add defintions of AVR core types
  target/avr: Add instruction helpers
  target/avr: Add instruction translation - Register definitions
  target/avr: Add instruction translation - Arithmetic and Logic
    Instructions
  target/avr: Add instruction translation - Branch Instructions
  target/avr: Add instruction translation - Data Transfer Instructions
  target/avr: Add instruction translation - Bit and Bit-test
    Instructions
  target/avr: Add instruction translation - MCU Control Instructions
  target/avr: Add instruction translation - CPU main translation
    function
  target/avr: Add instruction disassembly function
  hw/char: Add limited support for AVR USART peripheral
  hw/timer: Add limited support for AVR 16-bit timer peripheral
  hw/misc: Add limited support for AVR power device
  target/avr: Add section about AVR into QEMU documentation
  target/avr: Register AVR support with the rest of QEMU
  target/avr: Add machine none test
  target/avr: Update MAINTAINERS file
  target/avr: Update build system
  tests/boot-serial-test: Test some Arduino boards (AVR based)
  tests/acceptance: Test the Arduino MEGA2560 board

Philippe Mathieu-Daud=C3=A9 (4):
  hw/avr: Add helper to load raw/ELF firmware binaries
  hw/avr: Add some ATmega microcontrollers
  hw/avr: Add some Arduino boards
  .travis.yml: Run the AVR acceptance tests

 .travis.yml                      |    2 +-
 MAINTAINERS                      |   31 +
 arch_init.c                      |    2 +
 configure                        |    7 +
 default-configs/avr-softmmu.mak  |    5 +
 gdb-xml/avr-cpu.xml              |   49 +
 hw/avr/Kconfig                   |    9 +
 hw/avr/Makefile.objs             |    3 +
 hw/avr/arduino.c                 |  151 ++
 hw/avr/atmega.c                  |  470 ++++++
 hw/avr/atmega.h                  |   48 +
 hw/avr/boot.c                    |   74 +
 hw/avr/boot.h                    |   33 +
 hw/char/Kconfig                  |    3 +
 hw/char/Makefile.objs            |    1 +
 hw/char/avr_usart.c              |  320 ++++
 hw/misc/Kconfig                  |    3 +
 hw/misc/Makefile.objs            |    2 +
 hw/misc/avr_power.c              |  112 ++
 hw/timer/Kconfig                 |    3 +
 hw/timer/Makefile.objs           |    2 +
 hw/timer/avr_timer16.c           |  604 ++++++++
 include/disas/dis-asm.h          |   19 +
 include/elf.h                    |    2 +
 include/hw/char/avr_usart.h      |   93 ++
 include/hw/misc/avr_power.h      |   46 +
 include/hw/timer/avr_timer16.h   |   94 ++
 include/sysemu/arch_init.h       |    1 +
 qapi/machine.json                |    3 +-
 qemu-doc.texi                    |   51 +
 target/avr/Makefile.objs         |   34 +
 target/avr/cpu-param.h           |   37 +
 target/avr/cpu-qom.h             |   54 +
 target/avr/cpu.c                 |  818 +++++++++++
 target/avr/cpu.h                 |  259 ++++
 target/avr/disas.c               |  246 ++++
 target/avr/gdbstub.c             |   84 ++
 target/avr/helper.c              |  342 +++++
 target/avr/helper.h              |   29 +
 target/avr/insn.decode           |  182 +++
 target/avr/machine.c             |  121 ++
 target/avr/translate.c           | 2997 ++++++++++++++++++++++++++++++++=
++++++
 tests/acceptance/machine_avr6.py |   50 +
 tests/qtest/Makefile.include     |    2 +
 tests/qtest/boot-serial-test.c   |   11 +
 tests/qtest/machine-none-test.c  |    1 +
 46 files changed, 7508 insertions(+), 2 deletions(-)
 create mode 100644 default-configs/avr-softmmu.mak
 create mode 100644 gdb-xml/avr-cpu.xml
 create mode 100644 hw/avr/Kconfig
 create mode 100644 hw/avr/Makefile.objs
 create mode 100644 hw/avr/arduino.c
 create mode 100644 hw/avr/atmega.c
 create mode 100644 hw/avr/atmega.h
 create mode 100644 hw/avr/boot.c
 create mode 100644 hw/avr/boot.h
 create mode 100644 hw/char/avr_usart.c
 create mode 100644 hw/misc/avr_power.c
 create mode 100644 hw/timer/avr_timer16.c
 create mode 100644 include/hw/char/avr_usart.h
 create mode 100644 include/hw/misc/avr_power.h
 create mode 100644 include/hw/timer/avr_timer16.h
 create mode 100644 target/avr/Makefile.objs
 create mode 100644 target/avr/cpu-param.h
 create mode 100644 target/avr/cpu-qom.h
 create mode 100644 target/avr/cpu.c
 create mode 100644 target/avr/cpu.h
 create mode 100644 target/avr/disas.c
 create mode 100644 target/avr/gdbstub.c
 create mode 100644 target/avr/helper.c
 create mode 100644 target/avr/helper.h
 create mode 100644 target/avr/insn.decode
 create mode 100644 target/avr/machine.c
 create mode 100644 target/avr/translate.c
 create mode 100644 tests/acceptance/machine_avr6.py

--=20
2.7.4


