Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E436F679
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:40:40 +0200 (CEST)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNlP-0003wk-K1
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcNbw-0003p1-Qa
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:30:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:59168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcNbu-0002fL-Il
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:30:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcNbs-00008U-VR
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:30:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EB11D2E815A
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:30:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 07:22:18 -0000
From: Thomas Huth <1917085@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161436919438.19312.17751990850754413614.malonedeb@soybean.canonical.com>
Message-Id: <161976733893.10486.15154024146658629715.malone@gac.canonical.com>
Subject: [Bug 1917085] Re: [OSS-Fuzz] Issue 30588 pcnet: Loopback-related
 stack-overflow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: d2495dee5166cf294fc7ba3c89c6a6175b40b95a
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
Reply-To: Bug 1917085 <1917085@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://gitlab.com/qemu-project/qemu/-/commit/99ccfaa1edafd79f7a3a0ff7

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917085

Title:
   [OSS-Fuzz] Issue 30588 pcnet: Loopback-related stack-overflow

Status in QEMU:
  Fix Released

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -m \
  512M -machine q35 -nodefaults -device pcnet,netdev=3Dnet0 -netdev \
  user,id=3Dnet0 -qtest /dev/null -qtest stdio
  outl 0xcf8 0x80000810
  outl 0xcfc 0xc001
  outl 0xcf8 0x80000804
  outw 0xcfc 0x7
  outl 0xc011 0xff14ff
  outl 0xcf8 0x80000815
  outl 0xcfc 0xffffffff
  outl 0xc015 0x35a
  inl 0xc012
  outw 0xc010 0x6165
  outw 0xc010 0x1127
  write 0x0 0x1 0x56
  write 0x2 0x1 0xff
  write 0x15 0x1 0xff
  write 0x16 0x1 0xff
  write 0x17 0x1 0xff
  write 0x18 0x1 0xfd
  write 0x19 0x1 0x59
  write 0x1a 0x1 0xfe
  write 0x1b 0x1 0xff
  outw 0xc010 0x1db
  EOF

  =3D=3D=3D Stack-trace =3D=3D=3D
  =3D=3D312573=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7f=
fd5bb4cec8 (pc 0x55a8f1c9cf36 bp 0x7ffd5bb4d710 sp 0x7ffd5bb4ced0 T0)
  #0 0x55a8f1c9cf36 in __asan_memcpy (/home/alxndr/Development/qemu/build/q=
emu-system-i386+0x2baff36)
  #1 0x55a8f2f54ddf in flatview_do_translate /home/alxndr/Development/qemu/=
build/../softmmu/physmem.c:518:12
  #2 0x55a8f2f6ec8e in flatview_translate /home/alxndr/Development/qemu/bui=
ld/../softmmu/physmem.c:568:15
  #3 0x55a8f2f6ec8e in flatview_read /home/alxndr/Development/qemu/build/..=
/softmmu/physmem.c:2878:10
  #4 0x55a8f2f6ec8e in address_space_read_full /home/alxndr/Development/qem=
u/build/../softmmu/physmem.c:2892:18
  #5 0x55a8f273036e in pcnet_rmd_load /home/alxndr/Development/qemu/build/.=
./hw/net/pcnet.c:381:9
  #6 0x55a8f272e386 in pcnet_rdte_poll /home/alxndr/Development/qemu/build/=
../hw/net/pcnet.c:896:9
  #7 0x55a8f27299d0 in pcnet_receive /home/alxndr/Development/qemu/build/..=
/hw/net/pcnet.c:1016:9
  #8 0x55a8f27406be in pcnet_transmit /home/alxndr/Development/qemu/build/.=
./hw/net/pcnet.c:1253:13
  #9 0x55a8f2735b4c in pcnet_poll_timer /home/alxndr/Development/qemu/build=
/../hw/net/pcnet.c:1322:9
  #10 0x55a8f273c353 in pcnet_ioport_readl /home/alxndr/Development/qemu/bu=
ild/../hw/net/pcnet.c:1660:5
  #11 0x55a8f2727361 in pcnet_ioport_read /home/alxndr/Development/qemu/bui=
ld/../hw/net/pcnet-pci.c:107:20
  #12 0x55a8f309e9f6 in memory_region_read_accessor /home/alxndr/Developmen=
t/qemu/build/../softmmu/memory.c:442:11
  #13 0x55a8f3070d63 in access_with_adjusted_size /home/alxndr/Development/=
qemu/build/../softmmu/memory.c:552:18
  #14 0x55a8f306f222 in memory_region_dispatch_read1 /home/alxndr/Developme=
nt/qemu/build/../softmmu/memory.c
  #15 0x55a8f306f222 in memory_region_dispatch_read /home/alxndr/Developmen=
t/qemu/build/../softmmu/memory.c:1449:9
  #16 0x55a8f2f6d88f in flatview_read_continue /home/alxndr/Development/qem=
u/build/../softmmu/physmem.c:2839:23
  #17 0x55a8f2f6ed1b in flatview_read /home/alxndr/Development/qemu/build/.=
./softmmu/physmem.c:2879:12
  #18 0x55a8f2f6ed1b in address_space_read_full /home/alxndr/Development/qe=
mu/build/../softmmu/physmem.c:2892:18
  #19 0x55a8f273036e in pcnet_rmd_load /home/alxndr/Development/qemu/build/=
../hw/net/pcnet.c:381:9
  #20 0x55a8f2729d97 in pcnet_receive /home/alxndr/Development/qemu/build/.=
./hw/net/pcnet.c:1028:17
  #21 0x55a8f27406be in pcnet_transmit /home/alxndr/Development/qemu/build/=
../hw/net/pcnet.c:1253:13
  #22 0x55a8f2735b4c in pcnet_poll_timer /home/alxndr/Development/qemu/buil=
d/../hw/net/pcnet.c:1322:9
  #23 0x55a8f273c353 in pcnet_ioport_readl /home/alxndr/Development/qemu/bu=
ild/../hw/net/pcnet.c:1660:5
  #24 0x55a8f2727361 in pcnet_ioport_read /home/alxndr/Development/qemu/bui=
ld/../hw/net/pcnet-pci.c:107:20
  #25 0x55a8f309e9f6 in memory_region_read_accessor /home/alxndr/Developmen=
t/qemu/build/../softmmu/memory.c:442:11
  #26 0x55a8f3070d63 in access_with_adjusted_size /home/alxndr/Development/=
qemu/build/../softmmu/memory.c:552:18
  #27 0x55a8f306f222 in memory_region_dispatch_read1 /home/alxndr/Developme=
nt/qemu/build/../softmmu/memory.c
  #28 0x55a8f306f222 in memory_region_dispatch_read /home/alxndr/Developmen=
t/qemu/build/../softmmu/memory.c:1449:9
  #29 0x55a8f2f6d88f in flatview_read_continue /home/alxndr/Development/qem=
u/build/../softmmu/physmem.c:2839:23
  #30 0x55a8f2f6ed1b in flatview_read /home/alxndr/Development/qemu/build/.=
./softmmu/physmem.c:2879:12

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917085/+subscriptions

