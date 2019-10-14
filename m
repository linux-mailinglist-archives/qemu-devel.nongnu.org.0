Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220ED620E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 14:09:02 +0200 (CEST)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJz9p-0007KO-2d
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 08:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iJyzK-0005Q0-20
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:58:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iJyzI-0003UK-E3
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:58:09 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:35670)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iJyzI-0003Qc-5Z
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:58:08 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id A8D9D6DF62;
 Mon, 14 Oct 2019 20:58:04 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 3F0D824008E;
 Mon, 14 Oct 2019 20:58:03 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v26 00/21] Add RX archtecture support
Date: Mon, 14 Oct 2019 20:57:36 +0900
Message-Id: <20191014115757.51866-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
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
Cc: philmd@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello.
This patch series is added Renesas RX target emulation.

Changes for v25.
Update commit message.
Squashed qapi/machine.json changes.

Changes for v24.
Add note for qapi/machine.json.
Added Acked-by for 6/22.
git rebase master.

Changes for v23.
Follow master changes.

Changes for v22.
Added some include.

Changes for v21.
rebase latest master.
Remove unneeded hmp_info_tlb.

Chanegs for v20.
Reorderd patches.
Squashed v19 changes.

Changes for v19.
Follow tcg changes.
Cleanup cpu.c.
simplify rx_cpu_class_by_name and rx_load_image move to rx-virt.

My git repository is bellow.
git://git.pf.osdn.net/gitroot/y/ys/ysato/qemu.git tags/rx-20190912

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
 qapi/machine.json                      |    3 +-
 include/disas/dis-asm.h                |    5 +
 include/exec/poison.h                  |    1 +
 include/hw/char/renesas_sci.h          |   45 +
 include/hw/intc/rx_icu.h               |   56 +
 include/hw/registerfields.h            |   32 +-
 include/hw/rx/rx.h                     |    7 +
 include/hw/rx/rx62n.h                  |   91 +
 include/hw/timer/renesas_cmt.h         |   38 +
 include/hw/timer/renesas_tmr.h         |   53 +
 include/qemu/bitops.h                  |   38 +
 include/sysemu/arch_init.h             |    1 +
 target/rx/cpu-param.h                  |   31 +
 target/rx/cpu-qom.h                    |   42 +
 target/rx/cpu.h                        |  181 ++
 target/rx/helper.h                     |   31 +
 arch_init.c                            |    2 +
 hw/char/renesas_sci.c                  |  343 ++++
 hw/intc/rx_icu.c                       |  379 ++++
 hw/rx/rx-virt.c                        |  135 ++
 hw/rx/rx62n.c                          |  247 +++
 hw/timer/renesas_cmt.c                 |  278 +++
 hw/timer/renesas_tmr.c                 |  458 +++++
 target/rx/cpu.c                        |  217 +++
 target/rx/disas.c                      | 1446 ++++++++++++++
 target/rx/gdbstub.c                    |  112 ++
 target/rx/helper.c                     |  149 ++
 target/rx/op_helper.c                  |  470 +++++
 target/rx/translate.c                  | 2432 ++++++++++++++++++++++++
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
 target/rx/Makefile.objs                |   11 +
 target/rx/insns.decode                 |  621 ++++++
 tests/acceptance/boot_linux_console.py |   46 +
 45 files changed, 8064 insertions(+), 2 deletions(-)
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
 create mode 100644 target/rx/op_helper.c
 create mode 100644 target/rx/translate.c
 create mode 100644 hw/rx/Kconfig
 create mode 100644 hw/rx/Makefile.objs
 create mode 100644 target/rx/Makefile.objs
 create mode 100644 target/rx/insns.decode

--=20
2.20.1


