Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E9C2B0CF0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:48:02 +0100 (CET)
Received: from localhost ([::1]:41858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHdZ-0006OB-8E
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdHWi-0005TO-IH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:40:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:57058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdHWg-0007Nj-Fc
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:40:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdHWe-00027j-4f
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:40:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 158792E8133
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:40:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 18:26:11 -0000
From: Thomas Huth <1792523@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alex-l-williamson meoporter
X-Launchpad-Bug-Reporter: Marshall Porter (meoporter)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153690806645.16635.9456702675801152758.malonedeb@chaenomeles.canonical.com>
Message-Id: <160520557262.24462.17917005972316275729.launchpad@wampee.canonical.com>
Subject: [Bug 1792523] Re: usb passthrough not resetting on host after vm
 shutdown if started with -daemonize
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: b0fa9904177d7fbfcd3f9daaabc5c2713d20cd44
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
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
Reply-To: Bug 1792523 <1792523@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1792523

Title:
  usb passthrough not resetting on host after vm shutdown if started
  with -daemonize

Status in QEMU:
  Fix Released

Bug description:
  Below is the full Qemu command used to launch the VM. Have been using
  this same setup since Qemu 2.12, plus a couple of cherry picked patch
  commits fixing ide-hd and e1000e in Windows guests. Both sets of
  patches have now been merged to 3.0, so decided to update to 3.0.

  The VM launches and runs fine, but after shutting down, the usb
  devices that are passed through from the host (keyboard, mouse) do not
  work until unplugged and plugged in again. Have narrowed this down to
  the -daemonize -pidfile arguments.. if those lines are removed, usb
  devices work in the host again right away after VM shutdown.

  CPU: Intel(R) Core(TM) i5-6600K CPU @ 3.50GHz
  OS: Linux dev 4.18.6-arch1-1-ARCH #1 SMP PREEMPT Wed Sep 5 11:54:09 UTC 2=
018 x86_64 GNU/Linux

  Thank you for looking into this!

  =

  #!/usr/bin/env bash

  echo vfio-pci > /sys/bus/pci/devices/0000:04:00.0/driver_override
  echo 0000:04:00.0 > /sys/bus/pci/devices/0000:04:00.0/driver/unbind
  echo 0000:04:00.0 > /sys/bus/pci/drivers/vfio-pci/bind
  echo > /sys/bus/pci/devices/0000:04:00.0/driver_override

  /usr/bin/qemu-system-x86_64 \
  -name winnt \
  -daemonize \
  -pidfile /run/vms/qemu/winnt.pid \
  -boot menu=3Don \
  -drive if=3Dpflash,format=3Draw,readonly,file=3D/opt/vms/qemu/machines/ov=
mf_code_patched.fd \
  -drive if=3Dpflash,format=3Draw,file=3D/opt/vms/qemu/machines/winnt/ovmf_=
vars_patched.fd \
  -machine pc-q35-3.0,accel=3Dkvm \
  -nodefaults \
  -cpu host,kvm=3Doff,hv_vendor_id=3DRedHat,hv_time,hv_relaxed,hv_vapic,hv_=
spinlocks=3D0x1fff \
  -accel kvm \
  -smp 4,sockets=3D1,cores=3D4,threads=3D1 \
  -m 16G \
  -nic bridge,br=3Dbr0,mac=3D52:54:00:12:34:77,model=3De1000e \
  -device vfio-pci,host=3D01:00.0,multifunction=3Don \
  -device vfio-pci,host=3D01:00.1 \
  -vga none \
  -display none \
  -monitor none \
  -blockdev raw,node-name=3Dide-hd.0,cache.direct=3Don,discard=3Dunmap,file=
.driver=3Dhost_device,file.aio=3Dnative,file.filename=3D/dev/disk/by-id/ata=
-WDC_WDS500G2B0A-00SM50_181265803048 \
  -device ide-hd,drive=3Dide-hd.0,bus=3Dide.0,rotation_rate=3D1 \
  -blockdev raw,node-name=3Dide-hd.1,cache.direct=3Don,file.driver=3Dhost_d=
evice,file.aio=3Dnative,file.filename=3D/dev/disk/by-id/ata-TOSHIBA_HDWE160=
_X746K8ZTF56D-part1 \
  -device ide-hd,drive=3Dide-hd.1,bus=3Dide.1 \
  -device vfio-pci,host=3D04:00.0 \
  -device qemu-xhci \
  -device usb-host,vendorid=3D0x04d9,productid=3D0x0171 \
  -device usb-host,vendorid=3D0x1532,productid=3D0x005c \
  -device usb-host,vendorid=3D0x1b1c,productid=3D0x0c09

  echo 0000:04:00.0 > /sys/bus/pci/devices/0000:04:00.0/driver/unbind
  echo 0000:04:00.0 > /sys/bus/pci/drivers_probe

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1792523/+subscriptions

