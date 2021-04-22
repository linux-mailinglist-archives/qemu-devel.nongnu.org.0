Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEAF367C9F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:35:39 +0200 (CEST)
Received: from localhost ([::1]:46210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZUoD-0007SH-IJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZUmM-0006mO-N8
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:33:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:43846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZUmG-0001sV-O0
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:33:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZUmE-00053Y-CP
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:33:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 458712E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:33:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 08:14:13 -0000
From: Jan Heidbrink <1721788@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange eblake jheidbrink liangy th-huth
X-Launchpad-Bug-Reporter: Jan Heidbrink (jheidbrink)
X-Launchpad-Bug-Modifier: Jan Heidbrink (jheidbrink)
References: <150729895903.22243.5921581973131047310.malonedeb@gac.canonical.com>
Message-Id: <161907925391.23601.17736255037854575772.launchpad@gac.canonical.com>
Subject: [Bug 1721788] Re: Failed to get shared "write" lock with 'qemu-img
 info'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 908d48c880a1c09be222bf066d8fdd890b9a3beb
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
Reply-To: Bug 1721788 <1721788@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  When running 'qemu-img info test.qcow2' while test.qcow2 is currently
  used by a Qemu process, I get the error
  =

  qemu-img: Could not open 'test.qcow2': Failed to get shared "write"
  lock.
  =

- =

- Why does displaying information about a disk image need a write lock for =
the file?
+ Why does displaying information about a disk image need a write lock for
+ the file?
  =

  Steps to reproduce:
  =

  qemu-img create -f qcow2 test.qcow2 10M
  qemu-system-x86_64 -nographic -drive file=3Dtest.qcow2
  qemu-img info test.qcow2
  =

- The above was tested with Qemu version 2.10.0
+ The above was tested with Qemu version 2.10.0. Edit: Same behaviour with
+ version 5.2.0.

** Changed in: qemu
       Status: Incomplete =3D> New

** Description changed:

  When running 'qemu-img info test.qcow2' while test.qcow2 is currently
  used by a Qemu process, I get the error
  =

  qemu-img: Could not open 'test.qcow2': Failed to get shared "write"
  lock.
  =

  Why does displaying information about a disk image need a write lock for
  the file?
  =

  Steps to reproduce:
  =

  qemu-img create -f qcow2 test.qcow2 10M
  qemu-system-x86_64 -nographic -drive file=3Dtest.qcow2
  qemu-img info test.qcow2
  =

- The above was tested with Qemu version 2.10.0. Edit: Same behaviour with
- version 5.2.0.
+ The above was tested with Qemu version 2.10.0.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1721788

Title:
  Failed to get shared "write" lock with 'qemu-img info'

Status in QEMU:
  New

Bug description:
  When running 'qemu-img info test.qcow2' while test.qcow2 is currently
  used by a Qemu process, I get the error

  qemu-img: Could not open 'test.qcow2': Failed to get shared "write"
  lock.

  Why does displaying information about a disk image need a write lock
  for the file?

  Steps to reproduce:

  qemu-img create -f qcow2 test.qcow2 10M
  qemu-system-x86_64 -nographic -drive file=3Dtest.qcow2
  qemu-img info test.qcow2

  The above was tested with Qemu version 2.10.0.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1721788/+subscriptions

