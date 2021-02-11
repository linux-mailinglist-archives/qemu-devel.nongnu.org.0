Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3263A319108
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:29:12 +0100 (CET)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFmB-0004ft-4Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lAFim-0002Vi-Iu
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:25:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:58596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lAFij-0007Xl-6D
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:25:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lAFih-0005Ac-1z
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 17:25:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C6DED2E8138
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 17:25:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Feb 2021 17:20:16 -0000
From: Cleber Rosa <1915431@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: acceptance avocado test
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cleber-gnu
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Cleber Rosa (cleber-gnu)
Message-Id: <161306401637.17135.13575858265804852248.malonedeb@wampee.canonical.com>
Subject: [Bug 1915431] [NEW] QEMU processes started by Acceptance Tests are
 left running
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 6cb6b7cd04df659f3dbbfd31921ce5f06205e55f
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
Reply-To: Bug 1915431 <1915431@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Every now and then, QEMU processes started by the Acceptance Tests (thus
by Avocado) will be left running.

>From Avocado's perspective, when everything "goes well" and a test
reaches completion, there's no attempt to terminate any processes it
indirectly started.  Some frameworks and tests built on top of Avocado,
for instance Avocado-VT, will keep processes running between various
tests.

When a job (and consequently a test) is manually interrupted, then
Avocado tries to terminate the entire process tree.

It may be possible to improve the situation in which, at the very least, th=
e user is:
 * notified of left over processes
 * have a configuration option that will attempt to kill all processes at t=
he end of the test execution

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: acceptance avocado test

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915431

Title:
  QEMU processes started by Acceptance Tests are left running

Status in QEMU:
  New

Bug description:
  Every now and then, QEMU processes started by the Acceptance Tests
  (thus by Avocado) will be left running.

  From Avocado's perspective, when everything "goes well" and a test
  reaches completion, there's no attempt to terminate any processes it
  indirectly started.  Some frameworks and tests built on top of
  Avocado, for instance Avocado-VT, will keep processes running between
  various tests.

  When a job (and consequently a test) is manually interrupted, then
  Avocado tries to terminate the entire process tree.

  It may be possible to improve the situation in which, at the very least, =
the user is:
   * notified of left over processes
   * have a configuration option that will attempt to kill all processes at=
 the end of the test execution

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915431/+subscriptions

