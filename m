Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD713083F6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 03:54:32 +0100 (CET)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Jvb-0002Rs-D5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 21:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5Jrx-00008J-2x
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 21:50:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:45068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5Jrr-0006nD-2m
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 21:50:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5Jrp-0004vD-Sj
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 02:50:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D7E5D2E8138
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 02:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Jan 2021 02:32:58 -0000
From: Alexander Bulekov <1913667@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <161188757870.14645.13106473416766555293.malonedeb@wampee.canonical.com>
Subject: [Bug 1913667] [NEW] FPE in npcm7xx_clk_update_pll
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 748ebb44e3dd3614c7e0df842774efb9f5ebc5b2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1913667 <1913667@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I've been working on integrating the generic-fuzzer with ARM machines on
OSS-Fuzz so we can fuzz devices on architectures beyond i386 devices.
Since I saw that there is some active development for the Nuvoton
machines, I thought it might be useful to fuzz the NPCM750 machine

Reproducer:
cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
-accel qtest -qtest stdio
write 0xf080100c 0x4 0x00
write 0xf080100c 0x4 0x00
EOF

Trace:
../hw/misc/npcm7xx_clk.c:131:14: runtime error: division by zero
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/misc/npcm7xx_=
clk.c:131:14 in
AddressSanitizer:DEADLYSIGNAL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D717855=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x5619201=
fcd8c (pc 0x5619201fcd8c bp 0x7ffc94214e50 sp 0x7ffc94214e30 T0)
#0 0x5619201fcd8c in npcm7xx_clk_update_pll /hw/misc/npcm7xx_clk.c:131:14
#1 0x5619201ff5dc in npcm7xx_clk_write /hw/misc/npcm7xx_clk.c:799:13
#2 0x5619214781fe in memory_region_write_accessor /softmmu/memory.c:491:5
#3 0x561921477bfb in access_with_adjusted_size /softmmu/memory.c:552:18
#4 0x561921477467 in memory_region_dispatch_write /softmmu/memory.c
#5 0x561921807ffb in flatview_write_continue /softmmu/physmem.c:2759:23
#6 0x5619217fd71b in flatview_write /softmmu/physmem.c:2799:14
#7 0x5619217fd71b in address_space_write /softmmu/physmem.c:2891:18
#8 0x561921465eee in qtest_process_command /softmmu/qtest.c:539:13
#9 0x561921462b97 in qtest_process_inbuf /softmmu/qtest.c:797:9
#10 0x561921cb3286 in fd_chr_read /chardev/char-fd.c:68:9
#11 0x7f4ad283baae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/li=
bglib-2.0.so.0+0x51aae)
#12 0x56192230e363 in glib_pollfds_poll /util/main-loop.c:232:9
#13 0x56192230e363 in os_host_main_loop_wait /util/main-loop.c:255:5
#14 0x56192230e363 in main_loop_wait /util/main-loop.c:531:11
#15 0x5619213c9599 in qemu_main_loop /softmmu/runstate.c:721:9
#16 0x56191f6561fd in main /softmmu/main.c:50:5
#17 0x7f4ad22e0cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
#18 0x56191f5a9bc9 in _start (/home/alxndr/Development/qemu/build/qemu-syst=
em-aarch64+0x3350bc9)

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: fuzzer

** Tags added: fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913667

Title:
  FPE in npcm7xx_clk_update_pll

Status in QEMU:
  New

Bug description:
  I've been working on integrating the generic-fuzzer with ARM machines
  on OSS-Fuzz so we can fuzz devices on architectures beyond i386
  devices. Since I saw that there is some active development for the
  Nuvoton machines, I thought it might be useful to fuzz the NPCM750
  machine

  Reproducer:
  cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
  -accel qtest -qtest stdio
  write 0xf080100c 0x4 0x00
  write 0xf080100c 0x4 0x00
  EOF

  Trace:
  ../hw/misc/npcm7xx_clk.c:131:14: runtime error: division by zero
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/misc/npcm7x=
x_clk.c:131:14 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D717855=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x56192=
01fcd8c (pc 0x5619201fcd8c bp 0x7ffc94214e50 sp 0x7ffc94214e30 T0)
  #0 0x5619201fcd8c in npcm7xx_clk_update_pll /hw/misc/npcm7xx_clk.c:131:14
  #1 0x5619201ff5dc in npcm7xx_clk_write /hw/misc/npcm7xx_clk.c:799:13
  #2 0x5619214781fe in memory_region_write_accessor /softmmu/memory.c:491:5
  #3 0x561921477bfb in access_with_adjusted_size /softmmu/memory.c:552:18
  #4 0x561921477467 in memory_region_dispatch_write /softmmu/memory.c
  #5 0x561921807ffb in flatview_write_continue /softmmu/physmem.c:2759:23
  #6 0x5619217fd71b in flatview_write /softmmu/physmem.c:2799:14
  #7 0x5619217fd71b in address_space_write /softmmu/physmem.c:2891:18
  #8 0x561921465eee in qtest_process_command /softmmu/qtest.c:539:13
  #9 0x561921462b97 in qtest_process_inbuf /softmmu/qtest.c:797:9
  #10 0x561921cb3286 in fd_chr_read /chardev/char-fd.c:68:9
  #11 0x7f4ad283baae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/=
libglib-2.0.so.0+0x51aae)
  #12 0x56192230e363 in glib_pollfds_poll /util/main-loop.c:232:9
  #13 0x56192230e363 in os_host_main_loop_wait /util/main-loop.c:255:5
  #14 0x56192230e363 in main_loop_wait /util/main-loop.c:531:11
  #15 0x5619213c9599 in qemu_main_loop /softmmu/runstate.c:721:9
  #16 0x56191f6561fd in main /softmmu/main.c:50:5
  #17 0x7f4ad22e0cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
  #18 0x56191f5a9bc9 in _start (/home/alxndr/Development/qemu/build/qemu-sy=
stem-aarch64+0x3350bc9)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913667/+subscriptions

