Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E0391B5D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:12:43 +0200 (CEST)
Received: from localhost ([::1]:33610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvD7-0004CX-Q9
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvBR-0003QZ-TO
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:10:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:50402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvBP-000063-Iy
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:10:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llvBM-0003ha-VV
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:10:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EA8022E8139
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:10:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 15:01:51 -0000
From: Thomas Huth <1890159@bugs.launchpad.net>
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
References: <159646522011.3204.4947256792028563402.malonedeb@gac.canonical.com>
Message-Id: <162204131155.22300.9363726496687109981.malone@chaenomeles.canonical.com>
Subject: [Bug 1890159] Re: Assertion failure in net_tx_pkt_add_raw_fragment
 through vmxnet3
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: 48c97754c940ce3804daf8d4e325abf203a35135
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
Reply-To: Bug 1890159 <1890159@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This still triggers with the current version of QEMU. Marking as
"Confirmed"

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890159

Title:
  Assertion failure in net_tx_pkt_add_raw_fragment through vmxnet3

Status in QEMU:
  Confirmed

Bug description:
  Hello,
  Reproducer:

  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -device vmxnet3 -m 64 -nodefaults -qtest stdio -nographic
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80001014
  outl 0xcfc 0xe0001000
  outl 0xcf8 0x80001018
  outl 0xcf8 0x80001001
  outl 0xcfc 0x3fff3fff
  outl 0xcf8 0x80001016
  outl 0xcfc 0x5c84ff00
  outl 0xcf8 0x800010ff
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  writeq 0xff001020 0xef0bff5ecafe0000
  writel 0xe0000605 0xa7ff845e
  EOF

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  qemu-system-i386: hw/net/net_tx_pkt.c:382: _Bool net_tx_pkt_add_raw_fragm=
ent(struct NetTxPkt *, hwaddr, size_t): Assertion `pkt->max_raw_frags > pkt=
->raw_frags' failed.
  Aborted

  =

  #9 0x5607db7efdc0 in net_tx_pkt_add_raw_fragment /home/alxndr/Development=
/qemu/general-fuzz/hw/net/net_tx_pkt.c:382:5
  #10 0x5607db902ef0 in vmxnet3_process_tx_queue /home/alxndr/Development/q=
emu/general-fuzz/hw/net/vmxnet3.c:653:18
  #11 0x5607db9021db in vmxnet3_io_bar0_write /home/alxndr/Development/qemu=
/general-fuzz/hw/net/vmxnet3.c:1097:9
  #12 0x5607da41f193 in memory_region_write_accessor /home/alxndr/Developme=
nt/qemu/general-fuzz/softmmu/memory.c:483:5
  #13 0x5607da41e637 in access_with_adjusted_size /home/alxndr/Development/=
qemu/general-fuzz/softmmu/memory.c:544:18
  #14 0x5607da41c256 in memory_region_dispatch_write /home/alxndr/Developme=
nt/qemu/general-fuzz/softmmu/memory.c:1466:16
  #15 0x5607d97cd4a6 in flatview_write_continue /home/alxndr/Development/qe=
mu/general-fuzz/exec.c:3176:23

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890159/+subscriptions

