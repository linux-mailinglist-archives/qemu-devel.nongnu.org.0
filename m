Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97C3635A5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 15:47:50 +0200 (CEST)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY7m9-0005Fl-R2
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 09:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lY7k3-0004Bl-CJ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 09:45:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:38224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lY7k0-0006cg-CW
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 09:45:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lY7jy-0000b2-UL
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:45:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CBB182E8161
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:45:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Apr 2021 13:40:16 -0000
From: Diego Viola <1924914@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: diego-viola
X-Launchpad-Bug-Reporter: Diego Viola (diego-viola)
X-Launchpad-Bug-Modifier: Diego Viola (diego-viola)
References: <161875281831.22652.8172907256269796216.malonedeb@wampee.canonical.com>
Message-Id: <161875321633.2580.15375259751096263055.malone@gac.canonical.com>
Subject: [Bug 1924914] Re: Running sway in a QEMU VM results in a GPU hang of
 the guest (virtio-gpu driver)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: d93df525d511250102a0137ae0141e987806cf1d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1924914 <1924914@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can't get it to happen with -vga qxl.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924914

Title:
  Running sway in a QEMU VM results in a GPU hang of the guest (virtio-
  gpu driver)

Status in QEMU:
  New

Bug description:
  System is Arch Linux (guest and host OS).

  Problem:

  Basically, when using sway on a guest and running certain applications
  via Xwayland (on the guest), the GUI will freeze and won't be usable
  anymore, I can still ssh to the guest and run commands.

  This is the command I use to run my guest:

  qemu-system-x86_64 -enable-kvm -cdrom
  ~/Downloads/linux/archlinux/archlinux-2021.04.01-x86_64.iso -m 4G -vga
  virtio -nic user,hostfwd=3Dtcp::10022-:22

  This doesn't happen when I use X with i3-wm.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924914/+subscriptions

