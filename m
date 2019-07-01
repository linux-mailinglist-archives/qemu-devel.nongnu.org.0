Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D74A540
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 17:24:38 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdFyP-0007eK-Iy
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 11:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdFGt-0002q6-HV
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdFGn-0000e1-NX
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:39:39 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:58566)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdFGn-0000b7-EN
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:39:33 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id B68E94A22F;
 Tue, 18 Jun 2019 23:39:29 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id C5E6F240085;
 Tue, 18 Jun 2019 23:39:28 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2019 23:39:02 +0900
Message-Id: <20190618143923.53838-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
Subject: [Qemu-devel] [PATCH RESEND v21 00/21]  Add RX archtecture support
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, richard.henderson@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello.
This patch series is added Renesas RX target emulation.

Chanegs for v20.
Reorderd patches.
Squashed v19 changes.

Changes for v19.
Follow tcg changes.
Cleanup cpu.c.
simplify rx_cpu_class_by_name and rx_load_image move to rx-virt.

My git repository is bellow.
git://git.pf.osdn.net/gitroot/y/ys/ysato/qemu.git tags/rx-20190618

Testing binaries bellow.
u-boot
Download - https://osdn.net/users/ysato/pf/qemu/dl/u-boot.bin.gz

starting
$ gzip -d u-boot.bin.gz
$ qemu-system-rx -bios u-boot.bin

linux and pico-root (only sash)
Download - https://osdn.net/users/ysato/pf/qemu/dl/zImage (kernel)
           https://osdn.net/users/ysato/pf/qemu/dl/rx-qemu.dtb (DeviceTre=
e)

starting
$ qemu-system-rx -kernel zImage -dtb rx-qemu.dtb -append "earlycon"

Philippe Mathieu-Daud=C3=A9 (3):
  hw/registerfields.h: Add 8bit and 16bit register macros
  hw/rx: Restrict the RX62N microcontroller to the RX62N CPU core
  BootLinuxConsoleTest: Test the RX-Virt machine

Richard Henderson (7):
  target/rx: Disassemble rx_index_addr into a string
  target/rx: Replace operand with prt_ldmi in disassembler
  target/rx: Use prt_ldmi for XCHG_mr disassembly
  target/rx: Emit all disassembly in one prt()
  target/rx: Collect all bytes during disassembly
  target/rx: Dump bytes for each insn during disassembly
  hw/rx: Honor -accel qtest

Yoshinori Sato (11):
  MAINTAINERS: Add RX
  qemu/bitops.h: Add extract8 and extract16
  target/rx: TCG translation
  target/rx: TCG helper
  target/rx: CPU definition
  target/rx: RX disassembler
  hw/intc: RX62N interrupt controller (ICUa)
  hw/timer: RX62N internal timer modules
  hw/char: RX62N serial communication interface (SCI)
  hw/rx: RX Target hardware definition
  Add rx-softmmu

 configure                              |    8 +
 default-configs/rx-softmmu.mak         |    3 +
 qapi/common.json                       |    3 +-
 include/disas/dis-asm.h                |    5 +
 include/exec/poison.h                  |    1 +
 include/hw/char/renesas_sci.h          |   45 +
 include/hw/intc/rx_icu.h               |   56 +
 include/hw/registerfields.h            |   32 +-
 include/hw/rx/rx.h                     |    7 +
 include/hw/rx/rx62n.h                  |   91 ++
 include/hw/timer/renesas_cmt.h         |   38 +
 include/hw/timer/renesas_tmr.h         |   53 +
 include/qemu/bitops.h                  |   38 +
 include/sysemu/arch_init.h             |    1 +
 target/rx/cpu-param.h                  |   31 +
 target/rx/cpu-qom.h                    |   42 +
 target/rx/cpu.h                        |  182 +++
 target/rx/helper.h                     |   31 +
 arch_init.c                            |    2 +
 hw/char/renesas_sci.c                  |  340 +++++
 hw/intc/rx_icu.c                       |  376 +++++
 hw/rx/rx-virt.c                        |  135 ++
 hw/rx/rx62n.c                          |  246 ++++
 hw/timer/renesas_cmt.c                 |  275 ++++
 hw/timer/renesas_tmr.c                 |  455 ++++++
 target/rx/cpu.c                        |  217 +++
 target/rx/disas.c                      | 1446 +++++++++++++++++++
 target/rx/gdbstub.c                    |  112 ++
 target/rx/helper.c                     |  148 ++
 target/rx/monitor.c                    |   38 +
 target/rx/op_helper.c                  |  470 ++++++
 target/rx/translate.c                  | 2432 ++++++++++++++++++++++++++=
++++++
 tests/machine-none-test.c              |    1 +
 MAINTAINERS                            |   19 +
 hw/Kconfig                             |    1 +
 hw/char/Kconfig                        |    3 +
 hw/char/Makefile.objs                  |    1 +
 hw/intc/Kconfig                        |    3 +
 hw/intc/Makefile.objs                  |    1 +
 hw/rx/Kconfig                          |   14 +
 hw/rx/Makefile.objs                    |    2 +
 hw/timer/Kconfig                       |    6 +
 hw/timer/Makefile.objs                 |    3 +
 target/rx/Makefile.objs                |   12 +
 target/rx/insns.decode                 |  621 ++++++++
 tests/acceptance/boot_linux_console.py |   46 +
 46 files changed, 8090 insertions(+), 2 deletions(-)
 create mode 100644 default-configs/rx-softmmu.mak
 create mode 100644 include/hw/char/renesas_sci.h
 create mode 100644 include/hw/intc/rx_icu.h
 create mode 100644 include/hw/rx/rx.h
 create mode 100644 include/hw/rx/rx62n.h
 create mode 100644 include/hw/timer/renesas_cmt.h
 create mode 100644 include/hw/timer/renesas_tmr.h
 create mode 100644 target/rx/cpu-param.h
 create mode 100644 target/rx/cpu-qom.h
 create mode 100644 target/rx/cpu.h
 create mode 100644 target/rx/helper.h
 create mode 100644 hw/char/renesas_sci.c
 create mode 100644 hw/intc/rx_icu.c
 create mode 100644 hw/rx/rx-virt.c
 create mode 100644 hw/rx/rx62n.c
 create mode 100644 hw/timer/renesas_cmt.c
 create mode 100644 hw/timer/renesas_tmr.c
 create mode 100644 target/rx/cpu.c
 create mode 100644 target/rx/disas.c
 create mode 100644 target/rx/gdbstub.c
 create mode 100644 target/rx/helper.c
 create mode 100644 target/rx/monitor.c
 create mode 100644 target/rx/op_helper.c
 create mode 100644 target/rx/translate.c
 create mode 100644 hw/rx/Kconfig
 create mode 100644 hw/rx/Makefile.objs
 create mode 100644 target/rx/Makefile.objs
 create mode 100644 target/rx/insns.decode

--=20
2.11.0


