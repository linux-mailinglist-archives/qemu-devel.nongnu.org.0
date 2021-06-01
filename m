Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E330938FCE2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:33:06 +0200 (CEST)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSUs-0001Ik-0Z
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llSSw-00078A-UY
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:31:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llSSt-0001n8-GS
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:31:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llSSr-0001N0-2a
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:31:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EA3F42E8187
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:31:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 May 2021 08:20:26 -0000
From: Thomas Huth <1878034@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158921238974.12092.6203453160058985938.malonedeb@wampee.canonical.com>
Message-Id: <162193082612.32743.13130558416947123524.malone@soybean.canonical.com>
Subject: [Bug 1878034] Re: memcpy param-overlap through
 e1000e_write_to_rx_buffers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ba75dbf44f1013379e594c259682f14c0528180a"; Instance="production"
X-Launchpad-Hash: de122bdbfb0c5a70caee8c10a7403ff8078d7e6b
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
Reply-To: Bug 1878034 <1878034@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you still reproduce the crash with the current version of QEMU? At
least I cannot reproduce the crash anymore, so it seems like this got
fixed at one point in time?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878034

Title:
  memcpy param-overlap through e1000e_write_to_rx_buffers

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  While fuzzing, I found an input that triggers an overlapping memcpy (caug=
ht by AddressSanitizer).
  Overlapping memcpys are undefined behavior according to the POSIX and C s=
tandards, and can lead to bugs.

  =3D=3D22287=3D=3DERROR: AddressSanitizer: memcpy-param-overlap: memory ra=
nges
  #0 0x563c9f4823d4 in __asan_memcpy (/home/alxndr/Development/qemu/build/i=
386-softmmu/qemu-system-i386+0x97a3d4)
  #1 0x563c9f4cb2b1 in flatview_write_continue /home/alxndr/Development/qem=
u/exec.c:3142:13
  #2 0x563c9f4c3b97 in flatview_write /home/alxndr/Development/qemu/exec.c:=
3177:14
  #3 0x563c9f4c3b97 in address_space_write /home/alxndr/Development/qemu/ex=
ec.c:3268:18
  #4 0x563c9fbc457b in dma_memory_rw_relaxed /home/alxndr/Development/qemu/=
include/sysemu/dma.h:87:18
  #5 0x563c9fbc457b in dma_memory_rw /home/alxndr/Development/qemu/include/=
sysemu/dma.h:110:12
  #6 0x563c9fbc457b in pci_dma_rw /home/alxndr/Development/qemu/include/hw/=
pci/pci.h:787:5
  #7 0x563c9fbc457b in pci_dma_write /home/alxndr/Development/qemu/include/=
hw/pci/pci.h:800:12
  #8 0x563c9fbc457b in e1000e_write_to_rx_buffers /home/alxndr/Development/=
qemu/hw/net/e1000e_core.c:1412:9
  #9 0x563c9fbb9c98 in e1000e_write_packet_to_guest /home/alxndr/Developmen=
t/qemu/hw/net/e1000e_core.c:1582:21
  #10 0x563c9fbb9c98 in e1000e_receive_iov /home/alxndr/Development/qemu/hw=
/net/e1000e_core.c:1709:9
  #11 0x563c9fba8080 in net_tx_pkt_sendv /home/alxndr/Development/qemu/hw/n=
et/net_tx_pkt.c:544:9
  #12 0x563c9fba8080 in net_tx_pkt_send /home/alxndr/Development/qemu/hw/ne=
t/net_tx_pkt.c:620:9
  #13 0x563c9fba8827 in net_tx_pkt_send_loopback /home/alxndr/Development/q=
emu/hw/net/net_tx_pkt.c:633:11
  #14 0x563c9fbd2052 in e1000e_tx_pkt_send /home/alxndr/Development/qemu/hw=
/net/e1000e_core.c:664:16
  #15 0x563c9fbd2052 in e1000e_process_tx_desc /home/alxndr/Development/qem=
u/hw/net/e1000e_core.c:743:17
  #16 0x563c9fbd2052 in e1000e_start_xmit /home/alxndr/Development/qemu/hw/=
net/e1000e_core.c:934:9
  #17 0x563c9fbcecf0 in e1000e_set_tdt /home/alxndr/Development/qemu/hw/net=
/e1000e_core.c:2451:9
  #18 0x563c9fbbf20c in e1000e_core_write /home/alxndr/Development/qemu/hw/=
net/e1000e_core.c:3261:9
  #19 0x563c9f5b68d6 in memory_region_write_accessor /home/alxndr/Developme=
nt/qemu/memory.c:483:5
  #20 0x563c9f5b627f in access_with_adjusted_size /home/alxndr/Development/=
qemu/memory.c:544:18
  #21 0x563c9f5b627f in memory_region_dispatch_write /home/alxndr/Developme=
nt/qemu/memory.c:1476:16

  I can reproduce it in qemu 5.0 built with --enable-sanitizers using:
  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc=
-q35-5.0 -accel qtest -qtest stdio -nographic -monitor none -serial none
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe1020000
  outl 0xcf8 0x80001014
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x800010a2
  write 0xe102003a 0x3ff 0xd1055e2d3b0002e10000000001ffd3055e2d3b0002e10000=
000001ffd5055e2d3b0002e10000000001ffd7055e2d3b0002e10000000001ffd9055e2d3b0=
002e10000000001ffdb055e2d3b0002e10000000001ffdd055e2d3b0002e10000000001ffdf=
055e2d3b0002e10000000001ffe1055e2d3b0002e10000000001ffe3055e2d3b0002e100000=
00001ffe5055e2d3b0002e10000000001ffe7055e2d3b0002e10000000001ffe9055e2d3b00=
02e10000000001ffeb055e2d3b0002e10000000001ffed055e2d3b0002e10000000001ffef0=
55e2d3b0002e10000000001fff1055e2d3b0002e10000000001fff3055e2d3b0002e1000000=
0001fff5055e2d3b0002e10000000001fff7055e2d3b0002e10000000001fff9055e2d3b000=
2e10000000001fffb055e2d3b0002e10000000001fffd055e2d3b0002e10000000001ffff05=
5e2d3b0002e10000000001ff01055e2d3b0002e10000000001ff03055e2d3b0002e10000000=
001ff05055e2d3b0002e10000000001ff07055e2d3b0002e10000000001ff09055e2d3b0002=
e10000000001ff0b055e2d3b0002e10000000001ff0d055e2d3b0002e10000000001ff0f055=
e2d3b0002e10000000001ff11055e2d3b0002e10000000001ff13055e2d3b0002e100000000=
01ff15055e2d3b0002e10000000001ff17055e2d3b0002e10000000001ff19055e2d3b0002e=
10000000001ff1b055e2d3b0002e10000000001ff1d055e2d3b0002e10000000001ff1f055e=
2d3b0002e10000000001ff21055e2d3b0002e10000000001ff23055e2d3b0002e1000000000=
1ff25055e2d3b0002e10000000001ff27055e2d3b0002e10000000001ff29055e2d3b0002e1=
0000000001ff2b055e2d3b0002e10000000001ff2d055e2d3b0002e10000000001ff2f055e2=
d3b0002e10000000001ff31055e2d3b0002e10000000001ff33055e2d3b0002e10000000001=
ff35055e2d3b0002e10000000001ff37055e2d3b0002e10000000001ff39055e2d3b0002e10=
000000001ff3b055e2d3b0002e10000000001ff3d055e2d3b0002e10000000001ff3f055e2d=
3b0002e10000000001ff41055e2d3b0002e10000000001ff43055e2d3b0002e10000000001f=
f45055e2d3b0002e10000000001ff47055e2d3b0002e10000000001ff49055e2d3b0002e100=
00000001ff4b055e2d3b0002e10000000001ff4d055e2d3b0002e10000000001ff4f055e2d3=
b0002e10000000001ff51055e2d3b0002e10000000001ff53055e2d3b0002e10000000001ff=
55055e2d3b0002e10000000001ff57055e2d3b0002e10000000001ff59055e2d3b0002e1000=
0000001ff5b055e2d3b0002e10000000001ff5d055e2d3b0002e10000000001ff5f055e2d3b=
0002e10000000001ff61055e2d3b0002e10000000001ff63
  EOF

  I also attached the trace to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -M pc-q35-5.0 -accel qtest -qtest stdio -nographic
  -monitor none -serial none < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878034/+subscriptions

