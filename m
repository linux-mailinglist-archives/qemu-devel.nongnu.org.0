Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B450F182D99
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 11:28:52 +0100 (CET)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCL59-0000kx-RB
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 06:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jCL2B-0005m9-Ha
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 06:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jCL2A-00034k-5u
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 06:25:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:43246)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jCL29-00033i-Cb
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 06:25:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jCL27-0002MJ-Ub
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 10:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CDC562E80C3
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 10:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2020 10:19:57 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1866870@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Incomplete; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dbaxps0220 paelzer tstrike34
X-Launchpad-Bug-Reporter: tstrike (tstrike34)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <158386023038.12575.5865810528923078550.malonedeb@soybean.canonical.com>
Message-Id: <158400839787.7185.16125544147577741040.malone@chaenomeles.canonical.com>
Subject: [Bug 1866870] Re: KVM Guest pauses after upgrade to Ubuntu 20.04
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 884d4ac62bfe9326d069bd35fdf0245df9ee76b6
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
Reply-To: Bug 1866870 <1866870@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@Boris - in your log I've seen that you also got the Penryn cpu which I fin=
d odd.
"-cpu Penryn,vme=3Don,vmx=3Don,x2apic=3Don,tsc-deadline=3Don,xsave=3Don,hyp=
ervisor=3Don,arat=3Don,tsc-adjust=3Don,arch-capabilities=3Don,skip-l1dfl-vm=
entry=3Don \"
Assuming you also only used default I wonder how it got to that, maybe the =
reason for that is the same reason that eventually triggers the error.
But virt-manager/libvirt would usually just do a best-fit (for me Haswell-n=
oTSX-IBRS).


@Boris and @tstrike Could you both please report:
$ virsh capabilities
$ virsh domcapabilities
$ sudo qemu-system-x86_64 --enable-kvm --nographic --nodefaults -S -qmp-pre=
tty stdio
{"execute":"qmp_capabilities"}
{"execute":"query-cpu-definitions"}
Note: the command seems to hang as you are on QMP, then just enter the two =
commands below one by one. This will add "qemu's explanation why a given cp=
u is usable or not"

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1866870

Title:
  KVM Guest pauses after upgrade to Ubuntu 20.04

Status in QEMU:
  New
Status in qemu package in Ubuntu:
  Incomplete

Bug description:
  Symptom:
  Error unpausing domain: internal error: unable to execute QEMU command 'c=
ont': Resetting the Virtual Machine is required

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 75, in cb_=
wrapper
      callback(asyncjob, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 111, in tm=
pcb
      callback(*args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", lin=
e 66, in newfn
      ret =3D fn(self, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/domain.py", line 1311,=
 in resume
      self._backend.resume()
    File "/usr/lib/python3/dist-packages/libvirt.py", line 2174, in resume
      if ret =3D=3D -1: raise libvirtError ('virDomainResume() failed', dom=
=3Dself)
  libvirt.libvirtError: internal error: unable to execute QEMU command 'con=
t': Resetting the Virtual Machine is required

  =

  ---

  As outlined here:
  https://bugs.launchpad.net/qemu/+bug/1813165/comments/15

  After upgrade, all KVM guests are in a default pause state. Even after
  forcing them off via virsh, and restarting them the guests are paused.

  These Guests are not nested.

  A lot of diganostic information are outlined in the previous bug
  report link provided. The solution mentioned in previous report had
  been allegedly integrated into the downstream updates.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1866870/+subscriptions

