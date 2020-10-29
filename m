Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286329E389
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 07:12:37 +0100 (CET)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY1Aq-0004uS-Fj
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 02:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kY19D-0004Qy-US
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 02:10:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:43334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kY19B-0000X8-S1
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 02:10:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kY196-0001Wx-3y
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 06:10:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 174B72E811E
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 06:10:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2020 06:02:15 -0000
From: Gaoning Pan <1901981@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hades0506
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: Gaoning Pan (hades0506)
Message-Id: <160395133608.8291.17236692663498581160.malonedeb@soybean.canonical.com>
Subject: [Bug 1901981] [NEW] assert issue locates in hw/usb/dev-storage.c:248:
 usb_msd_send_status
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="96ff31b88b65a0d0ea73b89333fe7c4a2669d8fb"; Instance="production"
X-Launchpad-Hash: 182b99567d278fe05fb4b898dd6c1ef7752cafa0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 02:10:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1901981 <1901981@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

I found an assertion failure through hw/usb/dev-storage.c.

This was found in latest version 5.1.0.

--------

qemu-system-x86_64: hw/usb/dev-storage.c:248: usb_msd_send_status: Assertio=
n `s->csw.sig =3D=3D cpu_to_le32(0x53425355)' failed.
[1]    29544 abort      sudo  -enable-kvm -boot c -m 2G -drive format=3Dqco=
w2,file=3D./ubuntu.img -nic

To reproduce the assertion failure, please run the QEMU with following
command line.


$ qemu-system-x86_64 -enable-kvm -boot c -m 2G -drive format=3Dqcow2,file=
=3D./ubuntu.img -nic user,model=3Drtl8139,hostfwd=3Dtcp:0.0.0.0:5555-:22 -d=
evice piix4-usb-uhci,id=3Duhci -device usb-storage,drive=3Dmydrive -drive i=
d=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone

The poc is attached.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "dev-storage-assert.zip"
   https://bugs.launchpad.net/bugs/1901981/+attachment/5428811/+files/dev-s=
torage-assert.zip

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1901981

Title:
  assert issue locates in hw/usb/dev-storage.c:248: usb_msd_send_status

Status in QEMU:
  New

Bug description:
  Hello,

  I found an assertion failure through hw/usb/dev-storage.c.

  This was found in latest version 5.1.0.

  --------

  qemu-system-x86_64: hw/usb/dev-storage.c:248: usb_msd_send_status: Assert=
ion `s->csw.sig =3D=3D cpu_to_le32(0x53425355)' failed.
  [1]    29544 abort      sudo  -enable-kvm -boot c -m 2G -drive format=3Dq=
cow2,file=3D./ubuntu.img -nic

  To reproduce the assertion failure, please run the QEMU with following
  command line.

  =

  $ qemu-system-x86_64 -enable-kvm -boot c -m 2G -drive format=3Dqcow2,file=
=3D./ubuntu.img -nic user,model=3Drtl8139,hostfwd=3Dtcp:0.0.0.0:5555-:22 -d=
evice piix4-usb-uhci,id=3Duhci -device usb-storage,drive=3Dmydrive -drive i=
d=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone

  The poc is attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1901981/+subscriptions

