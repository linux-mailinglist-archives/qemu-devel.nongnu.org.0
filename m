Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D49391B15
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:03:43 +0200 (CEST)
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llv4Q-0007Md-4i
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llv1u-0004vX-3U
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:01:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:49694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llv1n-0002Ii-OL
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:01:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llv1k-00031u-JA
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:00:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 83F7A2E8187
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:00:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 14:51:04 -0000
From: Thomas Huth <1890155@bugs.launchpad.net>
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
References: <159646459931.15346.8925027856621311713.malonedeb@wampee.canonical.com>
Message-Id: <162204066489.31862.393879983345541689.malone@wampee.canonical.com>
Subject: [Bug 1890155] Re: Abort in vmxnet3_validate_interrupt_idx
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: 7784d7b628574af5aab357c0189409052089d1f3
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
Reply-To: Bug 1890155 <1890155@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This still reproduces with the current version of QEMU. Marking as
"Confirmed"

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890155

Title:
  Abort in vmxnet3_validate_interrupt_idx

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
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  write 0x52 0x1 0x61
  writeq 0xe0001020 0xef0bff5ecafe0000
  EOF

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   #7 0x55b271a89b67 in hw_error /home/alxndr/Development/qemu/general-fuzz=
/softmmu/cpus.c:927:5
   #8 0x55b272fc6433 in vmxnet3_validate_interrupt_idx /home/alxndr/Develop=
ment/qemu/general-fuzz/hw/net/vmxnet3.c:1355:9
   #9 0x55b272fc4e6d in vmxnet3_validate_interrupts /home/alxndr/Developmen=
t/qemu/general-fuzz/hw/net/vmxnet3.c:1364:5
   #10 0x55b272fbe723 in vmxnet3_activate_device /home/alxndr/Development/q=
emu/general-fuzz/hw/net/vmxnet3.c:1546:5
   #11 0x55b272fb6fba in vmxnet3_handle_command /home/alxndr/Development/qe=
mu/general-fuzz/hw/net/vmxnet3.c:1576:9
   #12 0x55b272fb410f in vmxnet3_io_bar1_write /home/alxndr/Development/qem=
u/general-fuzz/hw/net/vmxnet3.c:1772:9
   #13 0x55b271ac4193 in memory_region_write_accessor /home/alxndr/Developm=
ent/qemu/general-fuzz/softmmu/memory.c:483:5
   #14 0x55b271ac3637 in access_with_adjusted_size /home/alxndr/Development=
/qemu/general-fuzz/softmmu/memory.c:544:18
   #15 0x55b271ac1256 in memory_region_dispatch_write /home/alxndr/Developm=
ent/qemu/general-fuzz/softmmu/memory.c:1466:16
   #16 0x55b270e724a6 in flatview_write_continue /home/alxndr/Development/q=
emu/general-fuzz/exec.c:3176:23
   #17 0x55b270e5acc6 in flatview_write /home/alxndr/Development/qemu/gener=
al-fuzz/exec.c:3216:14

  =

  qemu: hardware error: Bad interrupt index: 97
  Aborted

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890155/+subscriptions

