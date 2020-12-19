Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D22DECC2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 03:47:06 +0100 (CET)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqSGu-00056Y-RA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 21:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqSFZ-0004YF-6M
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 21:45:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:56992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqSFW-0004n6-9T
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 21:45:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kqSFU-000683-MD
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 02:45:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8E9DB2E8137
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 02:45:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Dec 2020 02:39:33 -0000
From: Luqman <1908489@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luqmana
X-Launchpad-Bug-Reporter: Luqman (luqmana)
X-Launchpad-Bug-Modifier: Luqman (luqmana)
References: <160818582988.15420.16250079431178848252.malonedeb@soybean.canonical.com>
Message-Id: <160834557340.29016.8237146613860494324.malone@gac.canonical.com>
Subject: [Bug 1908489] Re: qemu 4.2 bootloops with -cpu host and nested
 hypervisor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 7aee28d93ca9ffde2a2c5aeb329141427bc6361b
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
Reply-To: Bug 1908489 <1908489@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, after bisect between stable-4.1 and stable-4.2 I did confirm that
https://github.com/qemu/qemu/commit/20a78b02d31534ae478779c2f2816c273601e869
is the first bad commit.

The full qemu command line is:

qemu-system-x86_64 \
    -name guest=3Dtest,debug-threads=3Don \
    -serial none \
    -enable-kvm \
    -nodefaults \
    -no-user-config \
    -M q35,accel=3Dkvm,kernel_irqchip=3Don,mem-merge=3Doff \
    -m 8192 -mem-prealloc -no-hpet \
    -cpu host,kvm=3Doff,l3-cache=3Don,hv_relaxed,hv_spinlocks=3D0x1fff,hv_v=
apic,hv_time \
    -smp 8,sockets=3D1,cores=3D4,threads=3D2 \
    -global kvm-pit.lost_tick_policy=3Ddiscard \
    -rtc base=3Dlocaltime \
    -boot order=3Dc \
    -usb \
    -device pcie-root-port,bus=3Dpcie.0,id=3Droot_port1,chassis=3D0,slot=3D=
0 \
    -device vfio-pci,host=3D01:00.0,id=3Dhostdev1,bus=3Droot_port1,addr=3D0=
x00,multifunction=3Don \
    -device vfio-pci,host=3D01:00.1,id=3Dhostdev2,bus=3Droot_port1,addr=3D0=
x00.1 \
    -drive if=3Dpflash,format=3Draw,readonly,file=3DOVMF_CODE.fd \
    -drive if=3Dpflash,format=3Draw,file=3DOVMF_VARS.fd \
    -drive if=3Dnone,id=3Ddrivec,file=3Ddisk.img,format=3Dqcow2,cache=3Dnon=
e,aio=3Dthreads \
    -object iothread,id=3Diothread1 \
    -device virtio-blk-pci,drive=3Ddrivec,scsi=3Doff,iothread=3Diothread1 \
    -monitor unix:/tmp/monitor.sock,server,nowait \
    -device virtio-mouse-pci,id=3Dinput0 \
    -device virtio-keyboard-pci,id=3Dinput1 \
    -object input-linux,id=3Dkbd1,evdev=3D/dev/input/by-id/xxxxxxx,grab_all=
=3Dyes,repeat=3Don \
    -object input-linux,id=3Dmouse1,evdev=3D/dev/input/by-id/xxxxxx \
    -netdev tap,ifname=3Dvnet,id=3Dnet0,script=3Dno,downscript=3Dno \
    -device e1000,netdev=3Dnet0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908489

Title:
  qemu 4.2 bootloops with -cpu host and nested hypervisor

Status in QEMU:
  New

Bug description:
  I've noticed that after upgrading from Ubuntu 18.04 to 20.04 that
  nested virtualization isn't working anymore.

  I have a simple repro where I create a Windows 10 2004 guest and
  enable Hyper-V in it. This worked fine in 18.04 and specifically qemu
  <4.2 (I specifically tested Qemu 2.11-4.1 which work fine).

  The -cpu arg I'm passing is simply:
      -cpu host,l3-cache=3Don,hv_relaxed,hv_spinlocks=3D0x1fff,hv_vapic,hv_=
time

  Using that Windows won't boot because the nested hypervisor (Hyper-V)
  is unable to be initialize and so it just boot loops. Using the exact
  same qemu command works fine with 4.1 and lower.

  Switching to a named CPU model like Skylake-Client-noTSX-IBRS instead
  of host lets the VM boot but causes some weird behaviour later trying
  to use nested VMs.

  If I had to guess I think it would probably be related to this change
  https://github.com/qemu/qemu/commit/20a78b02d31534ae478779c2f2816c273601e=
869
  which would line up with 4.2 being the first bad version but unsure.

  For now I just have to keep an older build of QEMU to work around
  this. Let me know if there's anything else needed. I can also try out
  any patches. I already have at least a dozen copies of qemu lying
  around now.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908489/+subscriptions

