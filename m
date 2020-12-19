Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A52DEEC8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 13:37:08 +0100 (CET)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqbTu-0005nT-Um
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 07:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqbSS-0005DL-VB
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:35:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:38280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqbSQ-0006Zk-ML
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:35:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kqbSO-0001B1-VH
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 12:35:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E4C962E8139
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 12:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Dec 2020 12:29:29 -0000
From: Bruce Merry <1908781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bmerry
X-Launchpad-Bug-Reporter: Bruce Merry (bmerry)
X-Launchpad-Bug-Modifier: Bruce Merry (bmerry)
Message-Id: <160838096979.13338.4117053689039136240.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1908781] [NEW] x86-64 not faulting when CS.L = 1 and CS.D = 1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: cf0bd32ffd9f6e9b01bf214e80eabc5ba97579f9
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
Reply-To: Bug 1908781 <1908781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

In a UEFI application I accidentally created a code segment descriptor
where both the L and D bits were 1. This is supposed to generate a GP
fault (e.g. see page 2942 of
https://software.intel.com/sites/default/files/managed/39/c5/325462-sdm-
vol-1-2abcd-3abcd.pdf). When running with KVM a fault did indeed occur,
but when not specifying any acceleration, no fault occurred.

Let me know if you need me to develop a minimum example to debug from.
At the moment it's all part of a slightly more complicated bit of code.

Version: 5.2.0 (compiled from source)
Command line options: -smp cores=3D4 -m 8192 (plus whatever uefi-run adds t=
o plug in OVMF and my UEFI application).
Environment: Ubuntu 20.04 on Ryzen 3700X

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908781

Title:
  x86-64 not faulting when CS.L =3D 1 and CS.D =3D 1

Status in QEMU:
  New

Bug description:
  In a UEFI application I accidentally created a code segment descriptor
  where both the L and D bits were 1. This is supposed to generate a GP
  fault (e.g. see page 2942 of
  https://software.intel.com/sites/default/files/managed/39/c5/325462
  -sdm-vol-1-2abcd-3abcd.pdf). When running with KVM a fault did indeed
  occur, but when not specifying any acceleration, no fault occurred.

  Let me know if you need me to develop a minimum example to debug from.
  At the moment it's all part of a slightly more complicated bit of
  code.

  Version: 5.2.0 (compiled from source)
  Command line options: -smp cores=3D4 -m 8192 (plus whatever uefi-run adds=
 to plug in OVMF and my UEFI application).
  Environment: Ubuntu 20.04 on Ryzen 3700X

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908781/+subscriptions

