Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46437212F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 22:17:49 +0200 (CEST)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldf0m-00086j-FV
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 16:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldeyd-0006xI-MQ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 16:15:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:36420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldeyb-0007JH-LP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 16:15:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldeya-0006QU-4X
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 20:15:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 213F92E805D
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 20:15:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 20:10:21 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1926996@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee paleozogt
X-Launchpad-Bug-Reporter: Aaron Simmons (paleozogt)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <162006855194.4732.10860890446320255541.malonedeb@chaenomeles.canonical.com>
Message-Id: <162007262189.11920.10897567485651229454.malone@soybean.canonical.com>
Subject: [Bug 1926996] Re: qemu-user clone syscall fails
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: ae2f99ee0e22aadcdf9f4563645c865154f52ea9
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
Reply-To: Bug 1926996 <1926996@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a full explanation see: https://qemu-
project.gitlab.io/qemu/src/S/2440.html#L141

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926996

Title:
  qemu-user clone syscall fails

Status in QEMU:
  New

Bug description:
  qemu-user fails to emulate clone()
  (https://linux.die.net/man/2/clone).  The architecture doesn't seem to
  matter, tho I've mostly been testing aarch64.

  Attached is clone_test.c that demonstrates the problem.  Running it nativ=
ely looks like this:
  $ bin/x86_64/clone_test
  The variable was 9
  clone returned 4177: 0 Success
  The variable is now 42

  However, running it via qemu looks like:
  $ qemu-aarch64-static --version
  qemu-aarch64 version 5.2.0 (v5.2.0)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  $ qemu-aarch64-static bin/aarch64/clone_test
  The variable was 9
  clone returned -1: 22 Invalid argument
  The variable is now 9

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926996/+subscriptions

