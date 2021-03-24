Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733CC34769B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:57:16 +0100 (CET)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1CM-0002T8-VZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP1BG-0001uI-7V
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:56:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:51316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP1BE-00079w-88
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:56:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lP1B8-0006BS-Dm
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 10:55:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C7D372E81EB
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 10:55:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 10:45:00 -0000
From: =?utf-8?q?Martin_Sch=C3=B6nstedt?= <1921092@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm debug
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: m-schoenstedt
X-Launchpad-Bug-Reporter: =?utf-8?q?Martin_Sch=C3=B6nstedt_=28m-schoenstedt?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Martin_Sch=C3=B6nstedt_=28m-schoenstedt?=
 =?utf-8?q?=29?=
References: <161658153575.32717.2347487454546278840.malonedeb@soybean.canonical.com>
Message-Id: <161658270131.23519.8329167376575007146.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1921092] Re: qemu-system-arm multi core debug not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: de4c5c2e3ad05b8cd6cfe462cc24eb6df4edec7b
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
Reply-To: Bug 1921092 <1921092@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  Working with Zephyr RTOS, running a multi core sample on mps2_an521 works=
 fine. Both cpus start.
  Trying to debug with options -s -S the second core fails to boot.
  Posted with explanation also at: https://github.com/zephyrproject-rtos/ze=
phyr/issues/33635
+ =

+ only after closing the gdb server the second core boots and execution con=
tinues normally.
+ Is there no way to debug such a multi core environment?

** Description changed:

  Working with Zephyr RTOS, running a multi core sample on mps2_an521 works=
 fine. Both cpus start.
  Trying to debug with options -s -S the second core fails to boot.
  Posted with explanation also at: https://github.com/zephyrproject-rtos/ze=
phyr/issues/33635
  =

- only after closing the gdb server the second core boots and execution con=
tinues normally.
+ only after quitting the debugging session the second core boots and execu=
tion continues normally.
  Is there no way to debug such a multi core environment?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921092

Title:
  qemu-system-arm multi core debug not working

Status in QEMU:
  New

Bug description:
  Working with Zephyr RTOS, running a multi core sample on mps2_an521 works=
 fine. Both cpus start.
  Trying to debug with options -s -S the second core fails to boot.
  Posted with explanation also at: https://github.com/zephyrproject-rtos/ze=
phyr/issues/33635

  only after quitting the debugging session the second core boots and execu=
tion continues normally.
  Is there no way to debug such a multi core environment?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921092/+subscriptions

