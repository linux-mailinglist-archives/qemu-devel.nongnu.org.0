Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9434F12E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:47:25 +0200 (CEST)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRJOe-0000fg-EH
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRJN3-0000B3-8H
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:45:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:37196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRJN0-00085K-Tu
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:45:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lRJMy-0004hS-PO
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 18:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BF2892E8157
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 18:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Mar 2021 18:38:18 -0000
From: Paul Donohue <1898490@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ethannij noneenon novhak s-launchpad-paulsd-com
X-Launchpad-Bug-Reporter: Ethan (ethannij)
X-Launchpad-Bug-Modifier: Paul Donohue (s-launchpad-paulsd-com)
References: <160185589302.24503.10461684970761806737.malonedeb@chaenomeles.canonical.com>
Message-Id: <161712949827.2361.5321807731966205285.malone@chaenomeles.canonical.com>
Subject: [Bug 1898490] Re: gtk with virtio and opengl black screen
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: 26cb14091391f41f13cff29f5fbf43665fef3287
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
Reply-To: Bug 1898490 <1898490@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The problem is that Xfwm's built-in compositor and virgl don't play nice
together.

Work-around: Boot the VM with virgl=3Doff (on the video device) or gl=3Doff
(on the display), run xfwm4-tweaks-settings in the VM, select the
"Compositor" tab, and uncheck "Enable display compositing".  Then shut
down the VM and re-enable virgl.

picom works with Xfwm and doesn't seem to have the same issues, so if
you want a compositor, install/use picom in the VM instead of using
Xfwm's built-in compositor: https://wiki.archlinux.org/index.php/Picom

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898490

Title:
  gtk with virtio and opengl black screen

Status in QEMU:
  New

Bug description:
  qemu-system-x86_64 -name manjaro -enable-kvm -cpu host -smp
  cores=3D4,threads=3D1 -M q35 -m 8G -cdrom /mnt/Storage/ISO/manjaro-
  gnome-20.0.3-minimal-200606-linux56.iso -machine type=3Dpc,accel=3Dkvm
  -vga virtio -display sdl,gl=3Don Boots properly and has working 3d
  acceleration with virgl.

  Running qemu-system-x86_64 -name manjaro -enable-kvm -cpu host -smp
  cores=3D4,threads=3D1 -M q35 -m 8G -cdrom /mnt/Storage/ISO/manjaro-
  gnome-20.0.3-minimal-200606-linux56.iso -machine type=3Dpc,accel=3Dkvm
  -vga virtio -display gtk,gl=3Don however, (difference being gtk instead
  of sdl), the screen is black, and the vm still starts.

  System Specs
  Gentoo Linux 64bit
  Gentoo-Sources 5.8.13 Kernel
  Qemu 5.10.0-r1 compiled with USE=3D"aio bzip2 caps curl fdt filecaps gtk =
jpeg ncurses nls opengl oss pin-upstream-blobs png pulseaudio sdl seccomp s=
lirp spice usb usbredir vhost-net virgl vnc xattr xkb" PYTHON_TARGETS=3D"py=
thon3_7" QEMU_SOFTMMU_TARGETS=3D"x86_64" QEMU_USER_TARGETS=3D"x86_64"

  Ryzen 7 2700x
  Nvidia 1070ti GPU

  I can confirm the same issue when using libvirt with opengl.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898490/+subscriptions

