Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02052326789
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 20:42:07 +0100 (CET)
Received: from localhost ([::1]:32940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFj02-0003lH-FT
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 14:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lFiyu-0003Jg-MY
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:40:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:39796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lFiyr-000742-Mm
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:40:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lFiyo-00029Z-V0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 19:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D7EA42E813D
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 19:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Feb 2021 19:32:19 -0000
From: Alexander Bulekov <1917082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <161436793911.24762.6802305911122378058.malonedeb@gac.canonical.com>
Subject: [Bug 1917082] [NEW] [OSS-Fuzz] Issue 27574 e1000: Loopback-related
 stack-overflow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: 70731a4aebeba497dd1d8348bcdc4a7845c12564
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
Reply-To: Bug 1917082 <1917082@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

=3D=3D=3D Reproducer =3D=3D=3D
cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -m \
512M -M q35 -nodefaults -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 \
-qtest /dev/null -qtest stdio
outl 0xcf8 0x80000813
outl 0xcfc 0xfe
outl 0xcf8 0x80000803
outw 0xcfc 0x0600
write 0xfe000102 0x1 0x0a
writel 0xfe000020 0x420ff00
write 0xfe00280a 0x2 0x0828
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
clock_step
write 0xfe00281b 0x1 0x08
write 0xf9b 0x1 0x01
write 0x2170 0x1 0x14
write 0x2171 0x1 0x38
write 0x2173 0x1 0xfe
write 0xfe000402 0x1 0x02
write 0xfe00380a 0x2 0x0210
write 0xfe003818 0x1 0xfa
EOF

=3D=3D=3D Stack-trace =3D=3D=3D
=3D=3D288216=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7fff=
51c96f48 (pc 0x56247061af36 bp 0x7fff51c97790 sp 0x7fff51c96f50 T0)
#0 0x56247061af36 in __asan_memcpy (/home/alxndr/Development/qemu/build/qem=
u-system-i386+0x2baff36)
#1 0x5624718eb70d in flatview_read_continue /home/alxndr/Development/qemu/b=
uild/../softmmu/physmem.c:2846:13
#2 0x5624718ecd1b in flatview_read /home/alxndr/Development/qemu/build/../s=
oftmmu/physmem.c:2879:12
#3 0x5624718ecd1b in address_space_read_full /home/alxndr/Development/qemu/=
build/../softmmu/physmem.c:2892:18
#4 0x562470bcb75b in dma_memory_rw_relaxed /home/alxndr/Development/qemu/in=
clude/sysemu/dma.h:88:12
#5 0x562470bcb75b in dma_memory_rw /home/alxndr/Development/qemu/include/sy=
semu/dma.h:127:12
#6 0x562470bcb75b in pci_dma_rw /home/alxndr/Development/qemu/include/hw/pc=
i/pci.h:803:12
#7 0x562470bcb75b in pci_dma_read /home/alxndr/Development/qemu/include/hw/=
pci/pci.h:821:12
#8 0x562470bcb75b in e1000_receive_iov /home/alxndr/Development/qemu/build/=
../hw/net/e1000.c:954:9
#9 0x562470bca465 in e1000_receive /home/alxndr/Development/qemu/build/../h=
w/net/e1000.c:1025:12
#10 0x562470bc9671 in e1000_send_packet /home/alxndr/Development/qemu/build=
/../hw/net/e1000.c:549:9
#11 0x562470bc7dd8 in xmit_seg /home/alxndr/Development/qemu/build/../hw/ne=
t/e1000.c
#12 0x562470bc4dfe in process_tx_desc /home/alxndr/Development/qemu/build/.=
./hw/net/e1000.c:701:9
#13 0x562470bc4dfe in start_xmit /home/alxndr/Development/qemu/build/../hw/=
net/e1000.c:756:9
#14 0x562470bc4dfe in set_tctl /home/alxndr/Development/qemu/build/../hw/ne=
t/e1000.c:1127:5
#15 0x5624719ef2f6 in memory_region_write_accessor /home/alxndr/Development=
/qemu/build/../softmmu/memory.c:491:5
#16 0x5624719eed63 in access_with_adjusted_size /home/alxndr/Development/qe=
mu/build/../softmmu/memory.c:552:18
#17 0x5624719ee5c0 in memory_region_dispatch_write /home/alxndr/Development=
/qemu/build/../softmmu/memory.c
#18 0x5624718f7776 in flatview_write_continue /home/alxndr/Development/qemu=
/build/../softmmu/physmem.c:2776:23
#19 0x5624718ed13b in flatview_write /home/alxndr/Development/qemu/build/..=
/softmmu/physmem.c:2816:14
#20 0x5624718ed13b in address_space_write /home/alxndr/Development/qemu/bui=
ld/../softmmu/physmem.c:2908:18
#21 0x562470bcba6b in dma_memory_rw_relaxed /home/alxndr/Development/qemu/i=
nclude/sysemu/dma.h:88:12
#22 0x562470bcba6b in dma_memory_rw /home/alxndr/Development/qemu/include/s=
ysemu/dma.h:127:12
#23 0x562470bcba6b in pci_dma_rw /home/alxndr/Development/qemu/include/hw/p=
ci/pci.h:803:12
#24 0x562470bcba6b in pci_dma_write /home/alxndr/Development/qemu/include/h=
w/pci/pci.h:839:12
#25 0x562470bcba6b in e1000_receive_iov /home/alxndr/Development/qemu/build=
/../hw/net/e1000.c:967:21
#26 0x562470bca465 in e1000_receive /home/alxndr/Development/qemu/build/../=
hw/net/e1000.c:1025:12
#27 0x562470bc9671 in e1000_send_packet /home/alxndr/Development/qemu/build=
/../hw/net/e1000.c:549:9
...

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917082

Title:
  [OSS-Fuzz] Issue 27574 e1000: Loopback-related stack-overflow

Status in QEMU:
  New

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -m \
  512M -M q35 -nodefaults -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet=
0 \
  -qtest /dev/null -qtest stdio
  outl 0xcf8 0x80000813
  outl 0xcfc 0xfe
  outl 0xcf8 0x80000803
  outw 0xcfc 0x0600
  write 0xfe000102 0x1 0x0a
  writel 0xfe000020 0x420ff00
  write 0xfe00280a 0x2 0x0828
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  clock_step
  write 0xfe00281b 0x1 0x08
  write 0xf9b 0x1 0x01
  write 0x2170 0x1 0x14
  write 0x2171 0x1 0x38
  write 0x2173 0x1 0xfe
  write 0xfe000402 0x1 0x02
  write 0xfe00380a 0x2 0x0210
  write 0xfe003818 0x1 0xfa
  EOF

  =3D=3D=3D Stack-trace =3D=3D=3D
  =3D=3D288216=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7f=
ff51c96f48 (pc 0x56247061af36 bp 0x7fff51c97790 sp 0x7fff51c96f50 T0)
  #0 0x56247061af36 in __asan_memcpy (/home/alxndr/Development/qemu/build/q=
emu-system-i386+0x2baff36)
  #1 0x5624718eb70d in flatview_read_continue /home/alxndr/Development/qemu=
/build/../softmmu/physmem.c:2846:13
  #2 0x5624718ecd1b in flatview_read /home/alxndr/Development/qemu/build/..=
/softmmu/physmem.c:2879:12
  #3 0x5624718ecd1b in address_space_read_full /home/alxndr/Development/qem=
u/build/../softmmu/physmem.c:2892:18
  #4 0x562470bcb75b in dma_memory_rw_relaxed /home/alxndr/Development/qemu/=
include/sysemu/dma.h:88:12
  #5 0x562470bcb75b in dma_memory_rw /home/alxndr/Development/qemu/include/=
sysemu/dma.h:127:12
  #6 0x562470bcb75b in pci_dma_rw /home/alxndr/Development/qemu/include/hw/=
pci/pci.h:803:12
  #7 0x562470bcb75b in pci_dma_read /home/alxndr/Development/qemu/include/h=
w/pci/pci.h:821:12
  #8 0x562470bcb75b in e1000_receive_iov /home/alxndr/Development/qemu/buil=
d/../hw/net/e1000.c:954:9
  #9 0x562470bca465 in e1000_receive /home/alxndr/Development/qemu/build/..=
/hw/net/e1000.c:1025:12
  #10 0x562470bc9671 in e1000_send_packet /home/alxndr/Development/qemu/bui=
ld/../hw/net/e1000.c:549:9
  #11 0x562470bc7dd8 in xmit_seg /home/alxndr/Development/qemu/build/../hw/=
net/e1000.c
  #12 0x562470bc4dfe in process_tx_desc /home/alxndr/Development/qemu/build=
/../hw/net/e1000.c:701:9
  #13 0x562470bc4dfe in start_xmit /home/alxndr/Development/qemu/build/../h=
w/net/e1000.c:756:9
  #14 0x562470bc4dfe in set_tctl /home/alxndr/Development/qemu/build/../hw/=
net/e1000.c:1127:5
  #15 0x5624719ef2f6 in memory_region_write_accessor /home/alxndr/Developme=
nt/qemu/build/../softmmu/memory.c:491:5
  #16 0x5624719eed63 in access_with_adjusted_size /home/alxndr/Development/=
qemu/build/../softmmu/memory.c:552:18
  #17 0x5624719ee5c0 in memory_region_dispatch_write /home/alxndr/Developme=
nt/qemu/build/../softmmu/memory.c
  #18 0x5624718f7776 in flatview_write_continue /home/alxndr/Development/qe=
mu/build/../softmmu/physmem.c:2776:23
  #19 0x5624718ed13b in flatview_write /home/alxndr/Development/qemu/build/=
../softmmu/physmem.c:2816:14
  #20 0x5624718ed13b in address_space_write /home/alxndr/Development/qemu/b=
uild/../softmmu/physmem.c:2908:18
  #21 0x562470bcba6b in dma_memory_rw_relaxed /home/alxndr/Development/qemu=
/include/sysemu/dma.h:88:12
  #22 0x562470bcba6b in dma_memory_rw /home/alxndr/Development/qemu/include=
/sysemu/dma.h:127:12
  #23 0x562470bcba6b in pci_dma_rw /home/alxndr/Development/qemu/include/hw=
/pci/pci.h:803:12
  #24 0x562470bcba6b in pci_dma_write /home/alxndr/Development/qemu/include=
/hw/pci/pci.h:839:12
  #25 0x562470bcba6b in e1000_receive_iov /home/alxndr/Development/qemu/bui=
ld/../hw/net/e1000.c:967:21
  #26 0x562470bca465 in e1000_receive /home/alxndr/Development/qemu/build/.=
./hw/net/e1000.c:1025:12
  #27 0x562470bc9671 in e1000_send_packet /home/alxndr/Development/qemu/bui=
ld/../hw/net/e1000.c:549:9
  ...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917082/+subscriptions

