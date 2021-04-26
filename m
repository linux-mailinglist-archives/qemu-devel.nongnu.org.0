Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A036B67F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:08:37 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3ml-0005Bn-Lf
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lb3fP-0007YL-0l
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:00:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:54852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lb3fG-0006w7-R6
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:00:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lb3fE-0000X8-I8
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 16:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 840EB2E80F9
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 16:00:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Apr 2021 15:53:51 -0000
From: Michael Monreal <1926174@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mimox
X-Launchpad-Bug-Reporter: Michael Monreal (mimox)
X-Launchpad-Bug-Modifier: Michael Monreal (mimox)
Message-Id: <161945243172.12386.17706296948185643927.malonedeb@wampee.canonical.com>
Subject: [Bug 1926174] [NEW] Laggy and/or displaced mouse input on CloudReady
 (Chrome OS) VM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 7679b8e624685277fa062bf7bcd5b5decd3edc5c
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
Reply-To: Bug 1926174 <1926174@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This weekend I tried to get a CloudReady (Chrome OS) VM running on qemu
5.2. This seems to wok quite well, performance seems to be great in
fact. Only problem is mouse input.

Using SDL display, there is no visible mouse unless I set "show-
cursor=3Don". After that the mouse pointer flickers a bit and most of the
time is displaced so I need to press below a button in order to hit it.
After switching to fullscreen and back using ctrl-alt-f this effect
seems to be fixed for a while but the mouse pointer does not reach all
parts of the emulated screen anymore.

Using SPICE instead the mouse pointer is drawn, but it is *very* laggy.
In fact it is only drawn every few seconds so it is unusable but
placement seems to be correct. Text input is instant, so general
emulation speed is not an issue here.

To reproduce, download the free image from
https://www.neverware.com/freedownload#home-edition-install

Then run one of the following commands:

qemu-system-x86_64 -drive driver=3Draw,file=3Dcloudready-
free-89.3.3-64bit.bin -machine pc,accel=3Dkvm -m 2048 -device virtio-
vga,virgl=3Don -display sdl,gl=3Don,show-cursor=3Don -usb -device usb-mouse
-device intel-hda -device hda-duplex

qemu-system-x86_64 -drive driver=3Draw,file=3Dcloudready-
free-89.3.3-64bit.bin -machine pc,accel=3Dkvm -m 2048 -device virtio-
vga,virgl=3Don -display spice-app,gl=3Don -usb -device usb-mouse -device
intel-hda -device hda-duplex

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926174

Title:
  Laggy and/or displaced mouse input on CloudReady (Chrome OS) VM

Status in QEMU:
  New

Bug description:
  This weekend I tried to get a CloudReady (Chrome OS) VM running on
  qemu 5.2. This seems to wok quite well, performance seems to be great
  in fact. Only problem is mouse input.

  Using SDL display, there is no visible mouse unless I set "show-
  cursor=3Don". After that the mouse pointer flickers a bit and most of
  the time is displaced so I need to press below a button in order to
  hit it. After switching to fullscreen and back using ctrl-alt-f this
  effect seems to be fixed for a while but the mouse pointer does not
  reach all parts of the emulated screen anymore.

  Using SPICE instead the mouse pointer is drawn, but it is *very*
  laggy. In fact it is only drawn every few seconds so it is unusable
  but placement seems to be correct. Text input is instant, so general
  emulation speed is not an issue here.

  To reproduce, download the free image from
  https://www.neverware.com/freedownload#home-edition-install

  Then run one of the following commands:

  qemu-system-x86_64 -drive driver=3Draw,file=3Dcloudready-
  free-89.3.3-64bit.bin -machine pc,accel=3Dkvm -m 2048 -device virtio-
  vga,virgl=3Don -display sdl,gl=3Don,show-cursor=3Don -usb -device usb-mou=
se
  -device intel-hda -device hda-duplex

  qemu-system-x86_64 -drive driver=3Draw,file=3Dcloudready-
  free-89.3.3-64bit.bin -machine pc,accel=3Dkvm -m 2048 -device virtio-
  vga,virgl=3Don -display spice-app,gl=3Don -usb -device usb-mouse -device
  intel-hda -device hda-duplex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926174/+subscriptions

