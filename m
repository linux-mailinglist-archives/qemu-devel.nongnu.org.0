Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3699300F5B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:57:37 +0100 (CET)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34Qz-0004rT-2M
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l34PD-0003M9-5p
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:55:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:45310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l34P7-0008U8-Ck
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:55:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l34P2-0001XP-TR
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 21:55:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D3D642E8137
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 21:55:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Jan 2021 21:42:35 -0000
From: Ven Karri <1912857@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imperialguy
X-Launchpad-Bug-Reporter: Ven Karri (imperialguy)
X-Launchpad-Bug-Modifier: Ven Karri (imperialguy)
Message-Id: <161135175608.19792.5002633896122919993.malonedeb@wampee.canonical.com>
Subject: [Bug 1912857] [NEW] virtio-serial blocks hostfwd ssh on windows 10
 host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 2b9fd2b5ffb9946445b3fdce8e6880014cb3e603
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
Reply-To: Bug 1912857 <1912857@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

qemu-system-x86_64 -display none -hda archlinux.qcow2 -m 4G -netdev
user,id=3Dn1,hostfwd=3Dtcp::2222-:22 -device virtio-net-pci,netdev=3Dn1 -->
WORKS - meaning I can ssh into the vm via port 2222

qemu-system-x86_64 -display none -hda archlinux.qcow2 -m 4G -netdev
user,id=3Dn1,hostfwd=3Dtcp::2222-:22 -device virtio-net-pci,netdev=3Dn1
-device virtio-serial -serial tcp:localhost:55298,server,nowait --> DOES
NOT WORK - meaning I cannot ssh into the vm

Not only does the port 2222 not work, but I am not able to perform any
serial transfer on port 55298 as well.

Host: Windows 10
Guest: archlinux
QEMU version 5.2

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  qemu-system-x86_64 -display none -hda archlinux.qcow2 -m 4G -netdev
  user,id=3Dn1,hostfwd=3Dtcp::2222-:22 -device virtio-net-pci,netdev=3Dn1 -=
->
  WORKS - meaning I can ssh into the vm via port 2222
  =

  qemu-system-x86_64 -display none -hda archlinux.qcow2 -m 4G -netdev
  user,id=3Dn1,hostfwd=3Dtcp::2222-:22 -device virtio-net-pci,netdev=3Dn1
  -device virtio-serial -serial tcp:localhost:55298,server,nowait --> DOES
  NOT WORK - meaning I cannot ssh into the vm
  =

- Not only does the port 2222 work, but I am not able to perform any
+ Not only does the port 2222 not work, but I am not able to perform any
  serial transfer on port 55298 as well.
  =

  Host: Windows 10
  Guest: archlinux
  QEMU version 5.2

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912857

Title:
  virtio-serial blocks hostfwd ssh on windows 10 host

Status in QEMU:
  New

Bug description:
  qemu-system-x86_64 -display none -hda archlinux.qcow2 -m 4G -netdev
  user,id=3Dn1,hostfwd=3Dtcp::2222-:22 -device virtio-net-pci,netdev=3Dn1 -=
->
  WORKS - meaning I can ssh into the vm via port 2222

  qemu-system-x86_64 -display none -hda archlinux.qcow2 -m 4G -netdev
  user,id=3Dn1,hostfwd=3Dtcp::2222-:22 -device virtio-net-pci,netdev=3Dn1
  -device virtio-serial -serial tcp:localhost:55298,server,nowait -->
  DOES NOT WORK - meaning I cannot ssh into the vm

  Not only does the port 2222 not work, but I am not able to perform any
  serial transfer on port 55298 as well.

  Host: Windows 10
  Guest: archlinux
  QEMU version 5.2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912857/+subscriptions

