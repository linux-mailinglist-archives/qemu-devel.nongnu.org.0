Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266085BB4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 09:41:21 +0200 (CEST)
Received: from localhost ([::1]:47400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvd31-0006xt-QE
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 03:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57661)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hvd2Y-0006Y2-QY
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 03:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hvd2X-0007jp-GI
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 03:40:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:56098)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hvd2X-0007jL-Ab
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 03:40:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hvd2W-0005pK-3m
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 07:40:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DFCF42E80C9
 for <qemu-devel@nongnu.org>; Thu,  8 Aug 2019 07:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Aug 2019 07:26:10 -0000
From: Xujun Ma <1839428@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: maxujun
X-Launchpad-Bug-Reporter: Xujun Ma (maxujun)
X-Launchpad-Bug-Modifier: Xujun Ma (maxujun)
References: <156524772160.13996.4537778553837159229.malonedeb@wampee.canonical.com>
Message-Id: <156524917013.25618.5202785092149465578.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19015";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a6b18cdbff50bc013bf4109fd35074ab276af70b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1839428] Re: qemu core dumped when repeat
 "system_reset" multiple times during guest boot
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
Reply-To: Bug 1839428 <1839428@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upstream qemu-v3.1.0 pass
Upstream qemu-v3.1.1 pass
Upstream qemu-v4.0.0 fail
Upstream qemu-v4.0.0-rc0 fail

So the problem occurs due to patch between qemu-v3.1.1 to
qemu-v4.0.0-rc0.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1839428

Title:
   qemu core dumped when repeat "system_reset" multiple times during
  guest boot

Status in QEMU:
  New

Bug description:
  commit 864ab314f1d924129d06ac7b571f105a2b76a4b2 (HEAD, tag: v4.1.0-rc4, o=
rigin/master, origin/HEAD, master)
  Test arch:x86 and power

  Steps:
  1.Boot up guest with command
  power cmdline:
  /usr/libexec/backup/qemu-kvm \
   -smp 8 \
   -m 4096 \
   -nodefaults \
   -device virtio-blk-pci,id=3Dimage1,drive=3Ddrive_image1,bootindex=3D1,bu=
s=3Dpci.0,addr=3D0x7 \
   -drive file=3Drhel77-ppc64le-virtio.qcow2,if=3Dnone,id=3Ddrive_image1,fo=
rmat=3Dqcow2,cache=3Dnone \
   -chardev stdio,mux=3Don,id=3Dserial_id_serial0,server,nowait,signal=3Dof=
f \
   -device spapr-vty,id=3Dserial111,chardev=3Dserial_id_serial0 \
   -mon chardev=3Dserial_id_serial0,mode=3Dreadline \
  x86 cmdline:
  /usr/libexec/qemu-kvm \
   -m 4096 -smp 8 \
   -boot menu=3Don \
   -device virtio-blk-pci,id=3Dimage1,drive=3Ddrive_image1\
   -drive file=3Drhel77-64-virtio.qcow2,if=3Dnone,id=3Ddrive_image1,format=
=3Dqcow2,cache=3Dnone \
   -vga std \
   -vnc :9 \
   -nographic \
   -device virtio-net-pci,netdev=3Dnet0,id=3Dnic0,mac=3D52:54:00:c4:e7:84 \
   -netdev tap,id=3Dnet0,script=3D/etc/qemu-ifup,downscript=3D/etc/qemu-ifd=
own,vhost=3Don \

  2.when guest start to boot up kernel(when no output infomation),run
  hmp command "system_reset"

  =

  Result:

  Sometimes,qemu core dumped with error as following:
  system_reset
  (qemu) qemu-system-ppc64: /root/qemu/hw/virtio/virtio.c:225: vring_get_re=
gion_caches: Assertion `caches !=3D NULL' failed.
  b.sh: line 11: 73679 Aborted                 (core dumped) /usr/local/bin=
/qemu-system-ppc64 -enable-kvm -smp 8 -m 4096 -nodefaults -device virtio-bl=
k-pci,id=3Dimage1,drive=3Ddrive_image1,bootindex=3D1,bus=3Dpci.0,addr=3D0x7=
 -drive file=3Drhel77-ppc64le-virtio.qcow2,if=3Dnone,id=3Ddrive_image1,form=
at=3Dqcow2,cache=3Dnone -chardev stdio,mux=3Don,id=3Dserial_id_serial0,serv=
er,nowait,signal=3Doff -device spapr-vty,id=3Dserial111,chardev=3Dserial_id=
_serial0 -mon chardev=3Dserial_id_serial0,mode=3Dreadline

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1839428/+subscriptions

