Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718573A7298
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:42:23 +0200 (CEST)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lswDm-0000vd-AM
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lswCT-0007GM-4y
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:41:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lswCP-0004ec-Hi
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:41:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lswCM-0007M8-M4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 23:40:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A475F2E8075
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 23:40:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Jun 2021 23:34:10 -0000
From: Alexander Bulekov <1879227@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <158977225414.22954.4052129310698259599.malonedeb@gac.canonical.com>
Message-Id: <162371365016.11028.17585059960039963489.malone@soybean.canonical.com>
Subject: [Bug 1879227] Re: Assertion failure in e1000e_write_lgcy_rx_descr
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: f0f7ca0582fc1ec10e30d17cccaacf18c184ccd1
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
Reply-To: Bug 1879227 <1879227@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS-Fuzz never saw it. It was probably fixed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879227

Title:
  Assertion failure in e1000e_write_lgcy_rx_descr

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  While fuzzing, I found an input which triggers an assertion failure in
  e1000e_write_lgcy_rx_descr:

  qemu-system-i386: /home/alxndr/Development/qemu/hw/net/e1000e_core.c:1283=
: void e1000e_write_lgcy_rx_descr(E1000ECore *, uint8_t *, struct NetRxPkt =
*, const E1000E_RSSInfo *, uint16_t): Assertion `!rss_info->enabled' failed.
  Aborted
  #3  0x00007ffff684d092 in __GI___assert_fail (assertion=3D0x5555583704c0 =
<str> "!rss_info->enabled", file=3D0x555558361080 <str> "/home/alxndr/Devel=
opment/qemu/hw/net/e1000e_core.c", line=3D0x503, function=3D0x555558370500 =
<__PRETTY_FUNCTION__.e1000e_write_lgcy_rx_descr> "void e1000e_write_lgcy_rx=
_descr(E1000ECore *, uint8_t *, struct NetRxPkt *, const E1000E_RSSInfo *, =
uint16_t)") at assert.c:101
  #4  0x0000555557209937 in e1000e_write_lgcy_rx_descr (core=3D0x7fffee0dd4=
e0, desc=3D0x7fffffff8720 "}}}}}}\253?", pkt=3D0x61100004b900, rss_info=3D0=
x7fffffff8c50, length=3D0xcb) at /home/alxndr/Development/qemu/hw/net/e1000=
e_core.c:1283
  #5  0x0000555557206b0b in e1000e_write_rx_descr (core=3D0x7fffee0dd4e0, d=
esc=3D0x7fffffff8720 "}}}}}}\253?", pkt=3D0x61100004b900, rss_info=3D0x7fff=
ffff8c50, ps_hdr_len=3D0x0, written=3D0x7fffffff87c0) at /home/alxndr/Devel=
opment/qemu/hw/net/e1000e_core.c:1360
  #6  0x00005555571f8507 in e1000e_write_packet_to_guest (core=3D0x7fffee0d=
d4e0, pkt=3D0x61100004b900, rxr=3D0x7fffffff8c30, rss_info=3D0x7fffffff8c50=
) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:1607
  #7  0x00005555571f5670 in e1000e_receive_iov (core=3D0x7fffee0dd4e0, iov=
=3D0x61900004e780, iovcnt=3D0x4) at /home/alxndr/Development/qemu/hw/net/e1=
000e_core.c:1709
  #8  0x00005555571f1afc in e1000e_nc_receive_iov (nc=3D0x614000007460, iov=
=3D0x61900004e780, iovcnt=3D0x4) at /home/alxndr/Development/qemu/hw/net/e1=
000e.c:213
  #9  0x00005555571d5977 in net_tx_pkt_sendv (pkt=3D0x631000028800, nc=3D0x=
614000007460, iov=3D0x61900004e780, iov_cnt=3D0x4) at /home/alxndr/Developm=
ent/qemu/hw/net/net_tx_pkt.c:544
  #10 0x00005555571d50e4 in net_tx_pkt_send (pkt=3D0x631000028800, nc=3D0x6=
14000007460) at /home/alxndr/Development/qemu/hw/net/net_tx_pkt.c:620
  #11 0x00005555571d638f in net_tx_pkt_send_loopback (pkt=3D0x631000028800,=
 nc=3D0x614000007460) at /home/alxndr/Development/qemu/hw/net/net_tx_pkt.c:=
633
  #12 0x000055555722b600 in e1000e_tx_pkt_send (core=3D0x7fffee0dd4e0, tx=
=3D0x7fffee0fd748, queue_index=3D0x0) at /home/alxndr/Development/qemu/hw/n=
et/e1000e_core.c:664
  #13 0x0000555557229ca6 in e1000e_process_tx_desc (core=3D0x7fffee0dd4e0, =
tx=3D0x7fffee0fd748, dp=3D0x7fffffff9440, queue_index=3D0x0) at /home/alxnd=
r/Development/qemu/hw/net/e1000e_core.c:743
  #14 0x0000555557228ea5 in e1000e_start_xmit (core=3D0x7fffee0dd4e0, txr=
=3D0x7fffffff9640) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:934
  #15 0x000055555721c70f in e1000e_set_tdt (core=3D0x7fffee0dd4e0, index=3D=
0xe06, val=3D0xcb) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:24=
51
  #16 0x00005555571fa436 in e1000e_core_write (core=3D0x7fffee0dd4e0, addr=
=3D0x438, val=3D0xcb, size=3D0x4) at /home/alxndr/Development/qemu/hw/net/e=
1000e_core.c:3261
  #17 0x00005555571ed11c in e1000e_mmio_write (opaque=3D0x7fffee0da800, add=
r=3D0x438, val=3D0xcb, size=3D0x4) at /home/alxndr/Development/qemu/hw/net/=
e1000e.c:109
  #18 0x00005555565e78b2 in memory_region_write_accessor (mr=3D0x7fffee0dd1=
10, addr=3D0x438, value=3D0x7fffffff9cb0, size=3D0x4, shift=3D0x0, mask=3D0=
xffffffff, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:483
  #19 0x00005555565e7212 in access_with_adjusted_size (addr=3D0x438, value=
=3D0x7fffffff9cb0, size=3D0x1, access_size_min=3D0x4, access_size_max=3D0x4=
, access_fn=3D0x5555565e72e0 <memory_region_write_accessor>, mr=3D0x7fffee0=
dd110, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:544
  #20 0x00005555565e5c31 in memory_region_dispatch_write (mr=3D0x7fffee0dd1=
10, addr=3D0x438, data=3D0xcb, op=3DMO_8, attrs=3D...) at /home/alxndr/Deve=
lopment/qemu/memory.c:1476
  #21 0x00005555563f04b9 in flatview_write_continue (fv=3D0x606000037880, a=
ddr=3D0xe1020438, attrs=3D..., ptr=3D0x61900009ba80, len=3D0x1, addr1=3D0x4=
38, l=3D0x1, mr=3D0x7fffee0dd110) at /home/alxndr/Development/qemu/exec.c:3=
137
  #22 0x00005555563df2dd in flatview_write (fv=3D0x606000037880, addr=3D0xe=
10200a8, attrs=3D..., buf=3D0x61900009ba80, len=3D0x391) at /home/alxndr/De=
velopment/qemu/exec.c:3177

  =

  I can reproduce this in qemu 5.0  using these qtest commands:

  cat << EOF | ./qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe1020000
  outl 0xcf8 0x80001014
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x800010a2
  write 0xe1025008 0x4 0xfbffa3fa
  write 0xed040c 0x3 0x080047
  write 0xe1020077 0x3c2 0xce0004ed0000000000cb008405120002e100000000ff0008=
01ffff02ce0004ed0000000000cb008405120002e100000000ff000a01ffff02ce0004ed000=
0000000cb008405120002e100000000ff000c01ffff02ce0004ed0000000000cb0084051200=
02e100000000ff000e01ffff02ce0004ed0000000000cb008405120002e100000000ff00100=
1ffff02ce0004ed0000000000cb008405120002e100000000ff001201ffff02ce0004ed0000=
000000cb008405120002e100000000ff001401ffff02ce0004ed0000000000cb00840512000=
2e100000000ff001601ffff02ce0004ed0000000000cb008405120002e100000000ff001801=
ffff02ce0004ed0000000000cb008405120002e100000000ff001a01ffff02ce0004ed00000=
00000cb008405120002e100000000ff001c01ffff02ce0004ed0000000000cb008405120002=
e100000000ff001e01ffff02ce0004ed0000000000cb008405120002e100000000ff002001f=
fff02ce0004ed0000000000cb008405120002e100000000ff002201ffff02ce0004ed000000=
0000cb008405120002e100000000ff002401ffff02ce0004ed0000000000cb008405120002e=
100000000ff002601ffff02ce0004ed0000000000cb008405120002e100000000ff002801ff=
ff02ce0004ed0000000000cb008405120002e100000000ff002a01ffff02ce0004ed0000000=
000cb008405120002e100000000ff002c01ffff02ce0004ed0000000000cb008405120002e1=
00000000ff002e01ffff02ce0004ed0000000000cb008405120002e100000000ff003001fff=
f02ce0004ed0000000000cb008405120002e100000000ff003201ffff02ce0004ed00000000=
00cb008405120002e100000000ff003401ffff02ce0004ed0000000000cb008405120002e10=
0000000ff003601ffff02ce0004ed0000000000cb008405120002e100000000ff003801ffff=
02ce0004ed0000000000cb008405120002e100000000ff003a01ffff02ce0004ed000000000=
0cb008405120002e100000000ff003c01ffff02ce0004ed0000000000cb008405120002e100=
000000ff003e01ffff02ce0004ed0000000000cb008405120002e100000000ff004001ffff0=
2ce0004ed0000000000cb008405120002e100000000ff004201ffff02ce0004ed0000000000=
cb008405120002e100000000ff004401ffff02ce0004ed0000000000cb008405120002e1000=
00000ff004601ffff02ce0004ed0000000000cb008405120002e100000000ff004801ffff02=
ce0004ed0000000000cb008405120002e100000000ff004a01ffff02ce0004ed0000000000cb
  EOF

  Also attaching them to this report, in case they are formatted incorrectl=
y:
  ./qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0 < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879227/+subscriptions

