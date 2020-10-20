Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B929200E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 23:02:41 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUFpA-0003JE-CZ
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 17:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kUFnO-0002S4-Pm
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 17:00:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:60396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kUFnM-0004K9-By
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 17:00:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kUFnJ-0007Hy-L1
 for <qemu-devel@nongnu.org>; Sun, 18 Oct 2020 21:00:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 97DA92E811E
 for <qemu-devel@nongnu.org>; Sun, 18 Oct 2020 21:00:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2020 20:53:39 -0000
From: azrdev <1900352@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: azrdev
X-Launchpad-Bug-Reporter: azrdev (azrdev)
X-Launchpad-Bug-Modifier: azrdev (azrdev)
Message-Id: <160305441976.24841.13039199321181716252.malonedeb@soybean.canonical.com>
Subject: [Bug 1900352] [NEW] no sound in spice when VNC enabled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="58bb2f3096f16f0e0acc917602669aecb4ffaf54"; Instance="production"
X-Launchpad-Hash: 16f9454a067bff33c67dda4966b5e36b33115e50
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/18 16:35:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1900352 <1900352@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Running Fedora32 with virt-manager =E2=86=92 libvirt =E2=86=92 qemu  I noti=
ced that I
got no sound in my spice client. The VM is configured with a SPICE-
server and a QXL display, and in addition a VNC display.

Apparently when I remove the VNC display, then the sound is routed just
fine to the spice client: I can hear it, and `G_MESSAGES_DEBUG=3Dall
remote-viewer --spice-debug  spice://localhost:5900` mentions
SpicePlaybackChannel and SpiceRecordChannel. With the VNC server
configured, such messages are missing, and I cannot hear the sound
(which is sent by the guest OS to the virtual hardware).

qemu-4.2.1-1.fc32

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  Running Fedora32 with virt-manager =E2=86=92 libvirt =E2=86=92 qemu  I no=
ticed that I
  got no sound in my spice client. The VM is configured with a SPICE-
  server and a QXL display, and in addition a VNC display.
  =

  Apparently when I remove the VNC display, then the sound is routed just
  fine to the spice client: I can hear it, and `G_MESSAGES_DEBUG=3Dall
  remote-viewer --spice-debug  spice://localhost:5900` mentions
  SpicePlaybackChannel and SpiceRecordChannel. With the VNC server
  configured, such messages are missing, and I cannot hear the sound
  (which is sent by the guest OS to the virtual hardware).
+ =

+ qemu-4.2.1-1.fc32

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1900352

Title:
  no sound in spice when VNC enabled

Status in QEMU:
  New

Bug description:
  Running Fedora32 with virt-manager =E2=86=92 libvirt =E2=86=92 qemu  I no=
ticed that I
  got no sound in my spice client. The VM is configured with a SPICE-
  server and a QXL display, and in addition a VNC display.

  Apparently when I remove the VNC display, then the sound is routed
  just fine to the spice client: I can hear it, and
  `G_MESSAGES_DEBUG=3Dall remote-viewer --spice-debug
  spice://localhost:5900` mentions SpicePlaybackChannel and
  SpiceRecordChannel. With the VNC server configured, such messages are
  missing, and I cannot hear the sound (which is sent by the guest OS to
  the virtual hardware).

  qemu-4.2.1-1.fc32

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1900352/+subscriptions

