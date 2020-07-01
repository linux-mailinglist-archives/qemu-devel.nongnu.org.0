Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69024211486
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 22:42:00 +0200 (CEST)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqjYN-0005tx-0h
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 16:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqjXE-0005Qx-Op
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 16:40:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:59876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqjXB-0005fq-SV
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 16:40:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jqjX9-0002Aq-Nc
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 20:40:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ADCBA2E8105
 for <qemu-devel@nongnu.org>; Wed,  1 Jul 2020 20:40:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2020 20:35:04 -0000
From: Peter Maydell <1878645@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr ajbennee philmd pmaydell
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <158947246472.30762.752698283456022174.malonedeb@chaenomeles.canonical.com>
 <20200701182100.26930-1-philmd@redhat.com>
Message-Id: <CAFEAcA8ZKEVySwDAQ+x9xA9bosOs5q20CZLZjBvkXj_d6ZVBuA@mail.gmail.com>
Subject: [Bug 1878645] Re: [RFC PATCH] cpus: Initialize current_cpu with the
 first vCPU created
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: cb9a370613ccf1931c615b04620ff4e6207e1248
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 10:05:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1878645 <1878645@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Jul 2020 at 19:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> We can run I/O access with the 'i' or 'o' HMP commands in the
> monitor. These commands are expected to run on a vCPU. The
> monitor is not a vCPU thread. To avoid crashing, initialize
> the 'current_cpu' variable with the first vCPU created. The
> command executed on the monitor will end using it.

>
> RFC because I believe the correct fix is to NOT use current_cpu
> out of cpus.c, at least use qemu_get_cpu(0) to get the first vCPU.

Yes, I agree -- I don't think this is the correct fix.
current_cpu is documented as "only valid inside cpu_exec()",
ie if you're actually on a vcpu thread you can use it, but if
you're not on a CPU thread, like the monitor, you need to
say which vCPU you want to affect. For the monitor, that
would be the current "default cpu" as set by the "cpu"
command (cf monitor_set_cpu()). The bug here will be that
somewhere along the line we are probably missing plumbing
sufficient to pass down "which CPU do we want".

https://bugs.launchpad.net/qemu/+bug/1602247 is a bug of
a similar nature -- if the gdbstub does a memory access
we know which CPU we're trying to do that memory access as,
but it doesn't get plumbed through and so in the Arm GIC
register read/write function that looks at current_cpu
we get a segfault.

One way to fix this would be to do something akin to how
real hardware works -- encode into the MemTxAttrs an
indication of what the transaction master was (eg the
CPU number for CPUs); then the handful of devices that
care about which CPU was doing the transaction can use
that, rather than directly looking at current_cpu, and
when gdbstub or monitor perform an access that should
act like it's from a particular CPU they can indicate
that by supplying appropriate transaction attributes.
That would potentially be quite a bit of work though
(but I think it would be a neat design if we want to
try to fix this kind of "segfault if the user prods
a device via the monitor" bug).

+    if (!current_cpu) {
+        current_cpu =3D cpu;
+    }

Some more specific issues with this -- current_cpu is
a thread-local variable, so this will set that for
whatever thread happens to make this call, which
might or might not be the one that ends up handling
the monitor command. Also some code assumes that
current_cpu is non-NULL only if this is a vCPU thread,
eg sigbus_handler().

thanks
-- PMM

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878645

Title:
  null-ptr dereference in ich9_apm_ctrl_changed

Status in QEMU:
  New

Bug description:
  Hello,
  While fuzzing, I found an input which triggers a NULL pointer dereference=
 in
  tcg_handle_interrupt. It seems the culprint is a "cpu" pointer - maybe th=
is bug
  is specific to QTest?

  =3D=3D23862=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x00000=
00000b4 (pc 0x55b9dc7c9dce bp 0x7ffc346a0900 sp 0x7ffc346a0880 T0)
  =3D=3D23862=3D=3DThe signal is caused by a READ memory access.
  =3D=3D23862=3D=3DHint: address points to the zero page.
      #0 0x55b9dc7c9dce in tcg_handle_interrupt /home/alxndr/Development/qe=
mu/accel/tcg/tcg-all.c:57:21
      #1 0x55b9dc904799 in cpu_interrupt /home/alxndr/Development/qemu/incl=
ude/hw/core/cpu.h:872:5
      #2 0x55b9dc9085e8 in ich9_apm_ctrl_changed /home/alxndr/Development/q=
emu/hw/isa/lpc_ich9.c:442:13
      #3 0x55b9dd19cdc8 in apm_ioport_writeb /home/alxndr/Development/qemu/=
hw/isa/apm.c:50:13
      #4 0x55b9dc73f8b4 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/memory.c:483:5
      #5 0x55b9dc73f289 in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/memory.c:544:18
      #6 0x55b9dc73ddf5 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/memory.c:1476:16
      #7 0x55b9dc577bf3 in flatview_write_continue /home/alxndr/Development=
/qemu/exec.c:3137:23
      #8 0x55b9dc567ad8 in flatview_write /home/alxndr/Development/qemu/exe=
c.c:3177:14
      #9 0x55b9dc567608 in address_space_write /home/alxndr/Development/qem=
u/exec.c:3268:18
      #10 0x55b9dc723fe7 in cpu_outb /home/alxndr/Development/qemu/ioport.c=
:60:5
      #11 0x55b9dc72d3c0 in qtest_process_command /home/alxndr/Development/=
qemu/qtest.c:392:13
      #12 0x55b9dc72b186 in qtest_process_inbuf /home/alxndr/Development/qe=
mu/qtest.c:710:9
      #13 0x55b9dc72a8b3 in qtest_read /home/alxndr/Development/qemu/qtest.=
c:722:5
      #14 0x55b9ddc6e60b in qemu_chr_be_write_impl /home/alxndr/Development=
/qemu/chardev/char.c:183:9
      #15 0x55b9ddc6e75a in qemu_chr_be_write /home/alxndr/Development/qemu=
/chardev/char.c:195:9
      #16 0x55b9ddc77979 in fd_chr_read /home/alxndr/Development/qemu/chard=
ev/char-fd.c:68:9
      #17 0x55b9ddcff0e9 in qio_channel_fd_source_dispatch /home/alxndr/Dev=
elopment/qemu/io/channel-watch.c:84:12
      #18 0x7f7161eac897 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4e897)
      #19 0x55b9ddebcb84 in glib_pollfds_poll /home/alxndr/Development/qemu=
/util/main-loop.c:219:9
      #20 0x55b9ddebb57d in os_host_main_loop_wait /home/alxndr/Development=
/qemu/util/main-loop.c:242:5
      #21 0x55b9ddebb176 in main_loop_wait /home/alxndr/Development/qemu/ut=
il/main-loop.c:518:11
      #22 0x55b9dcb4bd1d in qemu_main_loop /home/alxndr/Development/qemu/so=
ftmmu/vl.c:1664:9
      #23 0x55b9ddd1629c in main /home/alxndr/Development/qemu/softmmu/main=
.c:49:5
      #24 0x7f7160a5ce0a in __libc_start_main /build/glibc-GwnBeO/glibc-2.3=
0/csu/../csu/libc-start.c:308:16
      #25 0x55b9dc49c819 in _start (/home/alxndr/Development/qemu/build/i38=
6-softmmu/qemu-system-i386+0xc9c819)

  =

  I can reproduce this in qemu 5.0 built with AddressSanitizer using these =
qtest commands:

  cat << EOF | ./qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0
  outl 0xcf8 0x8400f841
  outl 0xcfc 0xaa215d6d
  outl 0x6d30 0x2ef8ffbe
  outb 0xb2 0x20
  EOF

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878645/+subscriptions

