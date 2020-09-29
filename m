Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF427C0F4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 11:21:50 +0200 (CEST)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNBpV-0004xs-EA
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 05:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNBoP-00042f-Fq
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:20:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:51870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNBoL-0003Yw-Ua
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:20:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kNBoJ-0006Xw-K2
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 09:20:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 909152E80E7
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 09:20:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2020 09:12:32 -0000
From: Peter Maydell <1897680@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell zpzigi
X-Launchpad-Bug-Reporter: Changho Choi (zpzigi)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160136265426.22784.9778102281742505477.malonedeb@gac.canonical.com>
Message-Id: <160137075212.3390.17971895147431682278.malone@chaenomeles.canonical.com>
Subject: [Bug 1897680] Re: memory address over 0x2000_7ffc is not accessible
 in mps2-an505
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d685c0a40836eb9844ed835c9700f20633c1d7af"; Instance="production"
X-Launchpad-Hash: 7453ebab86933408f81a72340d339b80d1d922e8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 03:05:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.199, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1897680 <1897680@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is expected behaviour. The memory at 0x2000_0000 in this board is
the "FPGA block RAM", and there is only 32K of it, so it finishes at
0x2000_7fff, and attempts to access beyond that will fail because there
is no device or memory at the address immediately after it in the memory
map.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1897680

Title:
  memory address over 0x2000_7ffc is not accessible in mps2-an505

Status in QEMU:
  New

Bug description:
  I currently run qemu with the following options
  `qemu-system-aarch64 -machine mps2-an505 -cpu cortex-m33 -m 16`

  For some reason, memory address over 0x2000_7ffc is not accessible.
  It can be tested in gdb as follow.

  (gdb) x/x 0x20007ffc
  0x20007ffc:	0x00000000
  (gdb) x/x 0x20007ffd
  0x20007ffd:	Cannot access memory at address 0x20007ffd
  (gdb) x/x 0x20008000
  0x20008000:	Cannot access memory at address 0x20008000

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1897680/+subscriptions

