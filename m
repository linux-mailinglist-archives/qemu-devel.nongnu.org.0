Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB75182680
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 02:11:56 +0100 (CET)
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCCOA-0005s3-V3
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 21:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jCCN7-0005TF-2D
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 21:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jCCN5-0005ft-SM
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 21:10:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:57678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jCCN5-0005cU-N5
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 21:10:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jCCN4-0006yZ-Cl
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 01:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B8A12E80AB
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 01:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2020 00:56:50 -0000
From: Peter Collingbourne <1867072@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pcc-goog
X-Launchpad-Bug-Reporter: Peter Collingbourne (pcc-goog)
X-Launchpad-Bug-Modifier: Peter Collingbourne (pcc-goog)
Message-Id: <158397461074.11691.9165479040998830806.malonedeb@soybean.canonical.com>
Subject: [Bug 1867072] [NEW] ARM: tag bits cleared in FAR_EL1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: bef4e9a2def116393da970a54ee58edee835ac43
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1867072 <1867072@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

The ARM Architecture Reference Manual provides the following for
FAR_EL1:

"For a Data Abort or Watchpoint exception, if address tagging is enabled
for the address accessed by the data access that caused the exception,
then this field includes the tag."

However, I have found that the tag bits in FAR_EL1 are always clear,
even if the tag bits were set in the original access.

I can reproduce the problem on both 4.1.1 and master
(6e8a73e911f066527e775e04b98f31ebd19db600).

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1867072

Title:
  ARM: tag bits cleared in FAR_EL1

Status in QEMU:
  New

Bug description:
  The ARM Architecture Reference Manual provides the following for
  FAR_EL1:

  "For a Data Abort or Watchpoint exception, if address tagging is
  enabled for the address accessed by the data access that caused the
  exception, then this field includes the tag."

  However, I have found that the tag bits in FAR_EL1 are always clear,
  even if the tag bits were set in the original access.

  I can reproduce the problem on both 4.1.1 and master
  (6e8a73e911f066527e775e04b98f31ebd19db600).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1867072/+subscriptions

