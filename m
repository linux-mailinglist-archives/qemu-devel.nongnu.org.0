Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9821C0957
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 23:33:00 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUGnj-0007N4-BN
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 17:32:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jUGku-0005iO-JE
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 17:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jUGgf-0003yO-D5
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 17:30:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:59224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jUGge-0003sS-M0
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 17:25:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jUGgb-0002zz-Hb
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 21:25:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7A5B92E802D
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 21:25:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 21:19:00 -0000
From: =?utf-8?q?Ren=C3=A9_Sandbote?= <1876187@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm netduinoplus2 systick timer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: r-sandbote
X-Launchpad-Bug-Reporter: =?utf-8?q?Ren=C3=A9_Sandbote_=28r-sandbote=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Ren=C3=A9_Sandbote_=28r-sandbote=29?=
Message-Id: <158828154118.4693.10463079186074004297.malonedeb@soybean.canonical.com>
Subject: [Bug 1876187] [NEW] qemu-system-arm freezes when using SystickTimer
 on netduinoplus2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a6a5084bc0efbdd70920ca63f22fba99fe28df7e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 17:25:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1876187 <1876187@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

git commit 27c94566379069fb8930bb1433dcffbf7df3203d

The global variable system_clock_scale used in hw/timer/armv7m_systick.c
is never set on the netduinoplus2 platform, it stays initialized as
zero. Using the timer with the clock source as cpu clock leads to an
infinit loop because systick_timer->tick always stays the same.

To reproduce use to CMSIS function SysTick_Config(uint32_t ticks) to
setup the timer.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: arm netduinoplus2 systick timer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1876187

Title:
  qemu-system-arm freezes when using SystickTimer on netduinoplus2

Status in QEMU:
  New

Bug description:
  git commit 27c94566379069fb8930bb1433dcffbf7df3203d

  The global variable system_clock_scale used in
  hw/timer/armv7m_systick.c is never set on the netduinoplus2 platform,
  it stays initialized as zero. Using the timer with the clock source as
  cpu clock leads to an infinit loop because systick_timer->tick always
  stays the same.

  To reproduce use to CMSIS function SysTick_Config(uint32_t ticks) to
  setup the timer.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1876187/+subscriptions

