Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B3F2C7B47
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 22:07:17 +0100 (CET)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTue-0006qg-8D
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 16:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjTt6-00061J-K2
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 16:05:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:45686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjTt4-0001aV-78
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 16:05:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kjTt2-0002Ns-8j
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 21:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3B2962E813A
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 21:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Nov 2020 21:00:06 -0000
From: johannes <1906184@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux sound stuttering
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: johannes (fghgfh832)
Message-Id: <160668360643.8467.1174467621705698044.malonedeb@soybean.canonical.com>
Subject: [Bug 1906184] [NEW] Lots of stuttering/crackling in guest sound
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: 03c041d41f3ed0de512ddcdf72e55eb90c130751
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1906184 <1906184@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When listening to music (e.g. with VLC) or watching Youtube on the
guest, there's lots of stuttering and crackling in the sound.


Tested with the following QEMU start commands:

qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga virtio -soundhw hda
-display sdl,gl=3Don

qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda
-display sdl

qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda
-display gtk


If I use the following command (QXL graphics, "remote" access via SPICE ove=
r unix socket), stuttering is not completely gone but MUCH less annoying:

qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
./linux/kubuntu-20.04-desktop-amd64.iso -boot d -soundhw hda -vga qxl
-device virtio-serial-pci -device
virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.spice.0 -chardev
spicevmc,id=3Dspicechannel0,name=3Dvdagent -spice
unix,addr=3D/tmp/vm_spice.socket,disable-ticketing

and this command for accessing the VM:
remote-viewer spice+unix:///tmp/vm_spice.socket =



Guest: Kubuntu 20.04 64-bit (live), but occurs with many other as well
Host: Arch Linux, with KDE desktop
CPU: Intel Xeon E3-1230v2 (4 cores + hyperthreading)
RAM: 16 GB
GPU: Nvidia GTX 980 Ti

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: linux sound stuttering

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906184

Title:
  Lots of stuttering/crackling in guest sound

Status in QEMU:
  New

Bug description:
  When listening to music (e.g. with VLC) or watching Youtube on the
  guest, there's lots of stuttering and crackling in the sound.

  =

  Tested with the following QEMU start commands:

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga virtio -soundhw
  hda -display sdl,gl=3Don

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda
  -display sdl

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda
  -display gtk

  =

  If I use the following command (QXL graphics, "remote" access via SPICE o=
ver unix socket), stuttering is not completely gone but MUCH less annoying:

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -soundhw hda -vga qxl
  -device virtio-serial-pci -device
  virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.spice.0 -chardev
  spicevmc,id=3Dspicechannel0,name=3Dvdagent -spice
  unix,addr=3D/tmp/vm_spice.socket,disable-ticketing

  and this command for accessing the VM:
  remote-viewer spice+unix:///tmp/vm_spice.socket =



  Guest: Kubuntu 20.04 64-bit (live), but occurs with many other as well
  Host: Arch Linux, with KDE desktop
  CPU: Intel Xeon E3-1230v2 (4 cores + hyperthreading)
  RAM: 16 GB
  GPU: Nvidia GTX 980 Ti

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906184/+subscriptions

