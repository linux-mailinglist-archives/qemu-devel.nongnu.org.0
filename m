Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6582ADAE6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:52:10 +0100 (CET)
Received: from localhost ([::1]:34448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVwH-0002Ej-A9
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVuv-0000wM-J2
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:50:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:51096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVus-0007yG-NK
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:50:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcVur-0003wv-GZ
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 731CA2E8079
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 15:45:25 -0000
From: Daniel Berrange <1690322@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: integratorcp qemu-system-arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange yujs
X-Launchpad-Bug-Reporter: js yu (yujs)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <149457649433.9287.5920128335975841083.malonedeb@gac.canonical.com>
Message-Id: <160502312599.13610.9732569599863064264.malone@gac.canonical.com>
Subject: [Bug 1690322] Re: errors which can't backing storage for guest RAM
 with -mem-path
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: fe845feb18252171ee7e8a9cd8a6dfb2d34aaf30
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
Reply-To: Bug 1690322 <1690322@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory region mapped by QEMU for -mem-path is configured such that
changes are private to the QEMU process.

If you need an external process to be able to view memory changes, you
need to use the modern "memory-backend-file" class with -object arg, and
specify  share=3Don to make the data visible to non-QEMU processes.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1690322

Title:
  errors which can't backing storage for guest RAM with -mem-path

Status in QEMU:
  New

Bug description:
  I found it can't backup the guest RAM when i run simple ram test code
  with

  errors which can't backing storage for guest RAM with integratorcp,
  the commander is:

  qemu-system-arm -M integratorcp -m 1 -semihosting -nographic -mem-path
  mem.txt -kernel build/emu_ram_test.elf

  i wrote the patter "0x55" to all of the rest of RAM in my test, after
  run my test code, it just generate the 1048576 Bytes file, i split
  these file into 2kB, most of split file is black, some of them just
  display \00 after open with gedit.

  i don't know whether my commander is incorrect, anyone can confirm it
  for me? i just want to write the guest RAM and read it from host
  during the guest code is running. but my guest just has simple os
  without file system and network. so i want to try with this backend
  RAM ways.

  thanks.
  js

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1690322/+subscriptions

