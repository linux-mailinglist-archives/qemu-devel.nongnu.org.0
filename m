Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE82ADD0F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:37:16 +0100 (CET)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXZz-0001mU-86
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcXYQ-0001GT-2f
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:35:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:57344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcXYI-0000nL-SW
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:35:37 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcXYH-0003Ur-6K
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 17:35:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2D15D2E812F
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 17:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 17:21:21 -0000
From: Frank Grimm <1903752@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: grimmfrank
X-Launchpad-Bug-Reporter: Frank Grimm (grimmfrank)
X-Launchpad-Bug-Modifier: Frank Grimm (grimmfrank)
Message-Id: <160502888185.27687.6551858213088684132.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1903752] [NEW] qemu-system-avr error: qemu-system-avr: execution
 left flash memory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 53ba99672e1f95f37453f12ee8cedce16277e2db
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
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
Reply-To: Bug 1903752 <1903752@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I compiled QEMU 5.1 from source with target avr-softmmu. Running
demo.elf from https://github.com/seharris/qemu-avr-tests/blob/master
/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf (linked from
https://www.qemu.org/docs/master/system/target-avr.html) yields the
following error:

$ ./qemu-5.1.0/avr-softmmu/qemu-system-avr -machine mega2560 -bios demo.elf
VNC server running on 127.0.0.1:5900
qemu-system-avr: execution left flash memory
Aborted (core dumped)

I compiled QEMU on Ubuntu Server 20.10 with gcc (Ubuntu
10.2.0-13ubuntu1) 10.2.0

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903752

Title:
  qemu-system-avr error: qemu-system-avr: execution left flash memory

Status in QEMU:
  New

Bug description:
  I compiled QEMU 5.1 from source with target avr-softmmu. Running
  demo.elf from https://github.com/seharris/qemu-avr-tests/blob/master
  /free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf (linked from
  https://www.qemu.org/docs/master/system/target-avr.html) yields the
  following error:

  $ ./qemu-5.1.0/avr-softmmu/qemu-system-avr -machine mega2560 -bios demo.e=
lf
  VNC server running on 127.0.0.1:5900
  qemu-system-avr: execution left flash memory
  Aborted (core dumped)

  I compiled QEMU on Ubuntu Server 20.10 with gcc (Ubuntu
  10.2.0-13ubuntu1) 10.2.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903752/+subscriptions

