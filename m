Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813B3390EF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:14:46 +0100 (CET)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjUz-00078B-8p
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lKjRC-0003mQ-0g
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:10:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:47598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lKjR9-00076P-LV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:10:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lKjR7-0002jb-Ig
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 15:10:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 88DB92E8050
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 15:10:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Mar 2021 14:56:11 -0000
From: Peter Maydell <1918917@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arnd-arndb dvyukov pmaydell
X-Launchpad-Bug-Reporter: Dmitry Vyukov (dvyukov)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161554541665.16519.7546318758364401915.malonedeb@wampee.canonical.com>
Message-Id: <161556097145.2719.9546405736181891449.malone@chaenomeles.canonical.com>
Subject: [Bug 1918917] Re: synchronous about on accessing unused I/O ports on
 aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: 5d652a045ede4d99877d30932495d5d9f71034cc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1918917 <1918917@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is there a test case (all necessary images/files/QEMU command line) I
can repro this with ?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918917

Title:
  synchronous about on accessing unused I/O ports on aarch64

Status in QEMU:
  New

Bug description:
  version: QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-6)
  command line: qemu-system-aarch64 \
  	-machine virt,virtualization=3Don,graphics=3Don,usb=3Don -cpu cortex-a57=
 -smp 2 -m 2G \
  	-device virtio-blk-device,drive=3Dhd0 \
  	-drive if=3Dnone,format=3Draw,id=3Dhd0,file=3Dbuildroot \
  	-kernel arch/arm64/boot/Image \
  	-nographic \
  	-device virtio-rng-pci \
  	-net user,host=3D10.0.2.10,hostfwd=3Dtcp::10022-:22 -net nic,model=3Dvir=
tio-net-pci \
  	-append "root=3D/dev/vda earlyprintk=3Dserial console=3DttyAMA0 earlycon"

  I am observing "synchronous external abort" when kernel tries to
  access unused I/O ports (see below), while hardware/qemu should return
  0xffffffff in this case.

  This is factored out of this LKML thread where Arnd describes it in more =
details:
  https://lore.kernel.org/lkml/CAK8P3a0HVu+x0T6+K3d0v1bvU-Pes0F0CSjqm5x=3Db=
xFgv5Y3mA@mail.gmail.com/

  Internal error: synchronous external abort: 96000050 [#1] PREEMPT SMP
  Dumping ftrace buffer:
     (ftrace buffer empty)
  Modules linked in:
  CPU: 0 PID: 11231 Comm: syz-executor.1 Not tainted 5.12.0-rc2-syzkaller-0=
0302-g28806e4d9b97 #0
  Hardware name: linux,dummy-virt (DT)
  pstate: 80000085 (Nzcv daIf -PAN -UAO -TCO BTYPE=3D--)
  pc : __raw_writeb arch/arm64/include/asm/io.h:27 [inline]
  pc : _outb include/asm-generic/io.h:501 [inline]
  pc : logic_outb+0x3c/0x114 lib/logic_pio.c:302
  lr : io_serial_out+0x80/0xc0 drivers/tty/serial/8250/8250_port.c:453
  sp : ffff000015f0f980
  x29: ffff000015f0f980 x28: ffff80001de0005d =

  x27: ffff80001601df00 x26: ffff000015f0fc90 =

  x25: ffff80001de00000 x24: ffff80001de00000 =

  x23: ffff00000e27f600 x22: 0000000000000000 =

  x21: 0000000000000002 x20: 0000000000000002 =

  x19: fffffbfffe800001 x18: ffff00006a678b48 =

  x17: 0000000000000000 x16: 0000000000000000 =

  x15: ffff8000197be810 x14: 1fffe00002be1f0e =

  x13: 1fffe00002be1e90 x12: ffff600002be1f39 =

  x11: 1fffe00002be1f38 x10: ffff600002be1f38 =

  x9 : dfff800000000000 x8 : 0000000000000003 =

  x7 : 0000000000000001 x6 : 0000000000000004 =

  x5 : ffff000015f0f9c0 x4 : dfff800000000000 =

  x3 : 0000000000000001 x2 : 1ffff00003494e6b =

  x1 : fffffbfffe800000 x0 : 0000000000ffbffe =

  Call trace:
   _outb include/asm-generic/io.h:501 [inline]
   logic_outb+0x3c/0x114 lib/logic_pio.c:302
   io_serial_out+0x80/0xc0 drivers/tty/serial/8250/8250_port.c:453
   serial_out drivers/tty/serial/8250/8250.h:118 [inline]
   serial8250_set_THRI drivers/tty/serial/8250/8250.h:138 [inline]
   __start_tx drivers/tty/serial/8250/8250_port.c:1566 [inline]
   serial8250_start_tx+0x338/0x6c0 drivers/tty/serial/8250/8250_port.c:1666
   __uart_start.isra.0+0x10c/0x154 drivers/tty/serial/serial_core.c:127
   uart_start+0xe0/0x210 drivers/tty/serial/serial_core.c:137
   uart_flush_chars+0x10/0x20 drivers/tty/serial/serial_core.c:573
   __receive_buf drivers/tty/n_tty.c:1646 [inline]
   n_tty_receive_buf_common+0x588/0x22c0 drivers/tty/n_tty.c:1739
   n_tty_receive_buf+0x14/0x20 drivers/tty/n_tty.c:1768
   tiocsti drivers/tty/tty_io.c:2317 [inline]
   tty_ioctl+0xed0/0x1aec drivers/tty/tty_io.c:2718
   vfs_ioctl fs/ioctl.c:48 [inline]
   __do_sys_ioctl fs/ioctl.c:753 [inline]
   __se_sys_ioctl fs/ioctl.c:739 [inline]
   __arm64_sys_ioctl+0x120/0x18c fs/ioctl.c:739
   __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
   invoke_syscall arch/arm64/kernel/syscall.c:49 [inline]
   el0_svc_common.constprop.0+0xf0/0x2c0 arch/arm64/kernel/syscall.c:129
   do_el0_svc+0xa4/0xd0 arch/arm64/kernel/syscall.c:168
   el0_svc+0x24/0x34 arch/arm64/kernel/entry-common.c:416
   el0_sync_handler+0x1a4/0x1b0 arch/arm64/kernel/entry-common.c:432
   el0_sync+0x170/0x180 arch/arm64/kernel/entry.S:699
  Code: d2bfd001 f2df7fe1 f2ffffe1 8b010273 (39000274) =

  ---[ end trace 79cb47219936c254 ]---

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918917/+subscriptions

