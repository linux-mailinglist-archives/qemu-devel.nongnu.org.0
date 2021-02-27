Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DA326FB3
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 01:07:41 +0100 (CET)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG9cZ-0002bE-Ks
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 19:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lG9bM-00026Q-Vm
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 19:06:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:44346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lG9bK-0004zc-J7
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 19:06:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lG9bH-00079j-A9
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 00:06:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 46B962E802B
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 00:06:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Feb 2021 23:59:20 -0000
From: Jeffrey <1917184@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jmmorlan
X-Launchpad-Bug-Reporter: Jeffrey (jmmorlan)
X-Launchpad-Bug-Modifier: Jeffrey (jmmorlan)
Message-Id: <161447036069.25241.974175619613922395.malonedeb@wampee.canonical.com>
Subject: [Bug 1917184] [NEW] qemu-user vm86() segfaults handling interrupt
 with ss:sp in same page as cs:ip
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: 92ed5bd935890dbe1431b16bf81205f1edc94822
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1917184 <1917184@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When using qemu-i386 to run a program that uses vm86(), if the vm86 code
calls an interrupt while cs:ip and ss:sp both point within the same
page, do_int tries to write to the page while it is not writable,
causing a segfault.

qemu version 5.2.0, x86-64 host.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "Example program"
   https://bugs.launchpad.net/bugs/1917184/+attachment/5469910/+files/vm86b=
ug.c

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917184

Title:
  qemu-user vm86() segfaults handling interrupt with ss:sp in same page
  as cs:ip

Status in QEMU:
  New

Bug description:
  When using qemu-i386 to run a program that uses vm86(), if the vm86
  code calls an interrupt while cs:ip and ss:sp both point within the
  same page, do_int tries to write to the page while it is not writable,
  causing a segfault.

  qemu version 5.2.0, x86-64 host.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917184/+subscriptions

