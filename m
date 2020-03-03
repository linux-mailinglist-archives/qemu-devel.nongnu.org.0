Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA5E176922
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 01:06:20 +0100 (CET)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8v4l-0004JL-Lp
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 19:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j8v42-0003rL-Ca
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:05:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j8v41-0006N1-9C
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:05:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:40410)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j8v41-0006MX-3W
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:05:33 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j8v40-0003Oh-Cw
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 00:05:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C7492E80C0
 for <qemu-devel@nongnu.org>; Tue,  3 Mar 2020 00:05:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Mar 2020 23:59:03 -0000
From: liang yan <lyan@suse.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: liangy
X-Launchpad-Bug-Reporter: liang yan (liangy)
X-Launchpad-Bug-Modifier: liang yan (liangy)
References: <158319312084.12323.11221527653494995336.malonedeb@soybean.canonical.com>
Message-Id: <158319354383.26040.1418768967562584206.malone@gac.canonical.com>
Subject: [Bug 1865626] Re: qemu hang when ipl boot from a mdev dasd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8e1bfa2c89df26c31c25d515a8854474b98e9ff5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1865626 <1865626@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s390zp12:~ # cat test.sh
/root/qemu/s390x-softmmu/qemu-system-s390x \
-machine s390-ccw-virtio,accel=3Dkvm \
-nographic \
-bios /root/qemu/pc-bios/s390-ccw/s390-ccw.img \
-device vfio-ccw,id=3Dhostdev0,sysfsdev=3D/sys/bus/mdev/devices/08e8c006-14=
6d-48d3-b21a-c005f9d3a04b,devno=3Dfe.0.1234,bootindex=3D1 \
-global vfio-ccw.force-orb-pfch=3Dyes

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865626

Title:
  qemu hang when ipl boot from a mdev dasd

Status in QEMU:
  New

Bug description:
  qemu latest
  kernel 5.3.18

  I am using a passthrough dasd as boot device, the installment looks
  fine and gets into reboot process. However VM could not boot and just
  hang as below after that. I have been checking on "s390: vfio-ccw dasd
  ipl support" series right now but no clue yet. Could anyone take a
  look for it? Thanks.


  s390vsw188:~ # bash test.sh
  LOADPARM=3D[        ]
  executing ccw chain at : 0x0000000000000018
  executing ccw chain at : 0x000000000000e000

  2020-03-01T06:24:56.879314Z qemu-system-s390x: warning: vfio-ccw
  (devno fe.0.0000): PFCH flag forced


  s390zp12:~ # cat test.sh
  /root/qemu/s390x-softmmu/qemu-system-s390x \
  -machine s390-ccw-virtio,accel=3Dkvm \
  -nographic \
  -bios /root/qemu/pc-bios/s390-ccw/s390-ccw.img \
  -device vfio-ccw,id=3Dhostdev0,sysfsdev=3D/sys/bus/mdev/devices/08e8c006-=
146d-48d3-b21a-c005f9d3a04b,,devno=3Dfe.0.0000,bootindex=3D1 \
  -global vfio-ccw.force-orb-pfch=3Dyes \

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865626/+subscriptions

