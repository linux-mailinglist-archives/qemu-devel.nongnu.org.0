Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69673A2FD5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:51:38 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMy1-0002PP-IF
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrMxH-0001k0-3D
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:50:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:51344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrMxB-0007Tl-1Q
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:50:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrMx7-00010J-DA
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 15:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F3BE2E8169
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 15:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Jun 2021 15:44:30 -0000
From: Thomas Huth <1913919@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161206040524.32468.3095757576345215405.malonedeb@chaenomeles.canonical.com>
Message-Id: <162333987032.28452.15253226343201255184.malone@gac.canonical.com>
Subject: [Bug 1913919] Re: Heap-buffer-overflow in sdhci_write_dataport
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: e395eb6d84e72182c37b5e75e9ca76b0de0d2ce2
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
Reply-To: Bug 1913919 <1913919@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you still reproduce this issue with the latest git version of QEMU?
... for me, it does not crash anymore.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913919

Title:
  Heap-buffer-overflow in sdhci_write_dataport

Status in QEMU:
  Incomplete

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 -qtest stdio \
  -machine raspi3b,accel=3Dqtest -m 1G =

  write 0x3f30002c 0x1 0x25
  write 0x3f300004 0x1 0x01
  write 0x3f300006 0x1 0xc0
  write 0x3f30000c 0x1 0x22
  write 0x3f30000e 0x1 0x20
  write 0x3f30000f 0x1 0x0
  write 0x3f300000 0x1 0x48
  write 0x3f300003 0x1 0x0
  write 0x3f300005 0x1 0x14
  write 0x3f300007 0x1 0x10
  write 0x3f30000c 0x1 0x32
  write 0x3f30000f 0x1 0x0
  write 0x3f300001 0x1 0x00
  write 0x3f300002 0x1 0x30
  write 0x3f300003 0x1 0x3f
  EOF

  Stacktrace:
  =3D=3D654080=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s 0x619000017b80 at pc 0x562988348719 bp 0x7fffd26552d0 sp 0x7fffd26552c8
  WRITE of size 1 at 0x619000017b80 thread T0
      #0 0x562988348718 in sdhci_write_dataport /home/alxndr/Development/qe=
mu/build/../hw/sd/sdhci.c:560:39
      #1 0x562988348718 in sdhci_write /home/alxndr/Development/qemu/build/=
../hw/sd/sdhci.c:1172:13
      #2 0x5629890591fe in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/build/../softmmu/memory.c:491:5
      #3 0x562989058bfb in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/build/../softmmu/memory.c:552:18
      #4 0x562989058467 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/build/../softmmu/memory.c
      #5 0x5629893e8ffb in flatview_write_continue /home/alxndr/Development=
/qemu/build/../softmmu/physmem.c:2759:23
      #6 0x5629893de71b in flatview_write /home/alxndr/Development/qemu/bui=
ld/../softmmu/physmem.c:2799:14
      #7 0x5629893de71b in address_space_write /home/alxndr/Development/qem=
u/build/../softmmu/physmem.c:2891:18
      #8 0x562988334d9c in dma_memory_rw_relaxed /home/alxndr/Development/q=
emu/include/sysemu/dma.h:88:12
      #9 0x562988334d9c in dma_memory_rw /home/alxndr/Development/qemu/incl=
ude/sysemu/dma.h:127:12
      #10 0x562988334d9c in dma_memory_write /home/alxndr/Development/qemu/=
include/sysemu/dma.h:163:12
      #11 0x562988334d9c in sdhci_sdma_transfer_multi_blocks /home/alxndr/D=
evelopment/qemu/build/../hw/sd/sdhci.c:617:13
      #12 0x56298834427f in sdhci_write /home/alxndr/Development/qemu/build=
/../hw/sd/sdhci.c:1129:17
      #13 0x5629890591fe in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/build/../softmmu/memory.c:491:5
      #14 0x562989058bfb in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/build/../softmmu/memory.c:552:18
      #15 0x562989058467 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/build/../softmmu/memory.c
      #16 0x5629893e8ffb in flatview_write_continue /home/alxndr/Developmen=
t/qemu/build/../softmmu/physmem.c:2759:23
      #17 0x5629893de71b in flatview_write /home/alxndr/Development/qemu/bu=
ild/../softmmu/physmem.c:2799:14
      #18 0x5629893de71b in address_space_write /home/alxndr/Development/qe=
mu/build/../softmmu/physmem.c:2891:18
      #19 0x56298904ad35 in qtest_process_command /home/alxndr/Development/=
qemu/build/../softmmu/qtest.c:654:9
      #20 0x562989043b97 in qtest_process_inbuf /home/alxndr/Development/qe=
mu/build/../softmmu/qtest.c:797:9
      #21 0x562989894286 in fd_chr_read /home/alxndr/Development/qemu/build=
/../chardev/char-fd.c:68:9
      #22 0x7f535645baae in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x51aae)
      #23 0x562989eef363 in glib_pollfds_poll /home/alxndr/Development/qemu=
/build/../util/main-loop.c:232:9
      #24 0x562989eef363 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/build/../util/main-loop.c:255:5
      #25 0x562989eef363 in main_loop_wait /home/alxndr/Development/qemu/bu=
ild/../util/main-loop.c:531:11
      #26 0x562988faa599 in qemu_main_loop /home/alxndr/Development/qemu/bu=
ild/../softmmu/runstate.c:721:9
      #27 0x5629872371fd in main /home/alxndr/Development/qemu/build/../sof=
tmmu/main.c:50:5
      #28 0x7f5355f00cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
      #29 0x56298718abc9 in _start (/home/alxndr/Development/qemu/build/qem=
u-system-aarch64+0x3350bc9)

  0x619000017b80 is located 0 bytes to the right of 1024-byte region [0x619=
000017780,0x619000017b80)
  allocated by thread T0 here:
      #0 0x562987204db2 in calloc (/home/alxndr/Development/qemu/build/qemu=
-system-aarch64+0x33cadb2)
      #1 0x7f5356461ae0 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0=
.so.0+0x57ae0)
      #2 0x56298834a187 in sdhci_sysbus_realize /home/alxndr/Development/qe=
mu/build/../hw/sd/sdhci.c:1469:5
      #3 0x56298987fe77 in device_set_realized /home/alxndr/Development/qem=
u/build/../hw/core/qdev.c:761:13
      #4 0x5629898153b5 in property_set_bool /home/alxndr/Development/qemu/=
build/../qom/object.c:2255:5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913919/+subscriptions

