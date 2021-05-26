Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90C391B14
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:03:40 +0200 (CEST)
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llv4N-0007CB-S7
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llv1s-0004se-Bs
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:01:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:49654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llv1n-0002Ig-O7
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:01:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llv1j-00031C-Ua
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:00:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E5DCE2E8186
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 14:52:24 -0000
From: Thomas Huth <1890157@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159646492473.2215.15136197151554355859.malonedeb@gac.canonical.com>
Message-Id: <162204074476.27121.3375289047629269692.malone@soybean.canonical.com>
Subject: [Bug 1890157] Re: Assertion failure in net_tx_pkt_reset through
 vmxnet3
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: 728cb9cf2a79a8a32f7bf5b9b3137b31b4a4b57c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1890157 <1890157@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can still be reproduced with the current version of QEMU. Marking
as "Confirmed"

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890157

Title:
  Assertion failure in net_tx_pkt_reset through vmxnet3

Status in QEMU:
  Confirmed

Bug description:
  Hello,
  Reproducer:

  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -device vmxnet3 -m 64 -nodefaults -qtest stdio -nographic
  outl 0xcf8 0x80001014
  outl 0xcfc 0xe0001000
  outl 0xcf8 0x80001018
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x80001083
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  writeq 0xe0001020 0xefefff5ecafe0000
  writeq 0xe0001020 0xffff5e5ccafe0002
  EOF

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  qemu-system-i386: /home/alxndr/Development/qemu/general-fuzz/hw/net/net_t=
x_pkt.c:450: void net_tx_pkt_reset(struct NetTxPkt *): Assertion `pkt->raw'=
 failed.

      #9 0x564838761930 in net_tx_pkt_reset /home/alxndr/Development/qemu/g=
eneral-fuzz/hw/net/net_tx_pkt.c:450:5
      #10 0x564838881749 in vmxnet3_deactivate_device /home/alxndr/Developm=
ent/qemu/general-fuzz/hw/net/vmxnet3.c:1159:9
      #11 0x56483888cf71 in vmxnet3_reset /home/alxndr/Development/qemu/gen=
eral-fuzz/hw/net/vmxnet3.c:1170:5
      #12 0x564838882124 in vmxnet3_handle_command /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1610:9
      #13 0x56483887f10f in vmxnet3_io_bar1_write /home/alxndr/Development/=
qemu/general-fuzz/hw/net/vmxnet3.c:1772:9
      #14 0x56483738f193 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/softmmu/memory.c:483:5
      #15 0x56483738e637 in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/softmmu/memory.c:544:18
      #16 0x56483738c256 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/softmmu/memory.c:1466:16
      #17 0x56483673d4a6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/exec.c:3176:23

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890157/+subscriptions

