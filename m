Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FC391B89
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:18:40 +0200 (CEST)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvIt-0000MO-OH
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvGA-0007Gm-GD
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:15:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:50810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvG8-0002T5-6W
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:15:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llvG6-0003zz-At
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:15:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4CD5A2E8187
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:15:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 15:06:04 -0000
From: Thomas Huth <1890160@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159646547209.2548.10551566895698007373.malonedeb@gac.canonical.com>
Message-Id: <162204156425.3201.9877698420109195822.malone@gac.canonical.com>
Subject: [Bug 1890160] Re: Abort in vmxnet3_validate_queues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: ff9475becc82f3c27e86951470eff55362beea5b
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
Reply-To: Bug 1890160 <1890160@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still reproduces with the current version of QEMU. Marking as
"Confirmed"

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890160

Title:
  Abort in vmxnet3_validate_queues

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
  write 0x3e 0x1 0xe1
  writeq 0xe0001020 0xef0bff5ecafe0000
  EOF

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  qemu: hardware error: Bad TX queues number: 225

      #6 0x7f04b89d455a in abort /build/glibc-GwnBeO/glibc-2.30/stdlib/abor=
t.c:79:7
      #7 0x558f5be89b67 in hw_error /home/alxndr/Development/qemu/general-f=
uzz/softmmu/cpus.c:927:5
      #8 0x558f5d3c3968 in vmxnet3_validate_queues /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1388:9
      #9 0x558f5d3bb716 in vmxnet3_activate_device /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1449:5
      #10 0x558f5d3b6fba in vmxnet3_handle_command /home/alxndr/Development=
/qemu/general-fuzz/hw/net/vmxnet3.c:1576:9
      #11 0x558f5d3b410f in vmxnet3_io_bar1_write /home/alxndr/Development/=
qemu/general-fuzz/hw/net/vmxnet3.c:1772:9
      #12 0x558f5bec4193 in memory_region_write_accessor /home/alxndr/Devel=
opment/qemu/general-fuzz/softmmu/memory.c:483:5
      #13 0x558f5bec3637 in access_with_adjusted_size /home/alxndr/Developm=
ent/qemu/general-fuzz/softmmu/memory.c:544:18
      #14 0x558f5bec1256 in memory_region_dispatch_write /home/alxndr/Devel=
opment/qemu/general-fuzz/softmmu/memory.c:1466:16

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890160/+subscriptions

